#!/usr/bin/env sh
set -eu

registry="${1:-docs/INVARIANT_OWNERSHIP.md}"
generations="${2:-docs/LAW_GENERATIONS.md}"
digest_records="$(mktemp /tmp/vitheim-law-digests.XXXXXX)"
trap 'rm -f "$digest_records"' EXIT

if ! LC_ALL=C awk -F '|' -v registry="$registry" -v generations="$generations" \
    -v digest_records="$digest_records" '
BEGIN {
    failed = 0
    mode = ""
}
FILENAME == registry && /^## Ownership Matrix$/ {
    mode = "ownership"
    next
}
FILENAME == registry && /^## Lifecycle And Supersession Registry$/ {
    mode = "lifecycle"
    next
}
FILENAME == registry && /^## Composite Security Law Registry$/ {
    mode = "law"
    next
}
FILENAME == registry && /^## Composite Security Law Lifecycle Registry$/ {
    mode = "law_lifecycle"
    next
}
FILENAME == registry && mode == "ownership" &&
/^\| VIT-INV-[0-9][0-9][0-9] / {
    invariant[trim($2)] = 1
    next
}
FILENAME == registry && mode == "lifecycle" &&
/^\| VIT-INV-[0-9][0-9][0-9] / {
    invariant_effective[trim($2)] = trim($6)
    next
}
FILENAME == registry && mode == "law" &&
/^\| VIT-LAW-[0-9][0-9][0-9] / {
    id = trim($2)
    current_law[id] = 1
    current_coordinator[id] = trim($3)
    current_dependencies[id] = trim($4)
    current_linearization[id] = trim($5)
    current_failure[id] = trim($6)
    current_recovery[id] = trim($7)
    next
}
FILENAME == registry && mode == "law_lifecycle" &&
/^\| VIT-LAW-[0-9][0-9][0-9] / {
    id = trim($2)
    current_dependency_contract[id] = trim($7)
    current_rollback_floor[id] = trim($11)
    current_recovery_contract[id] = trim($12)
    current_semantic_contract[id] = trim($13)
    current_manifest_digest[id] = trim($14)
    next
}
FILENAME == generations &&
/^\| VIT-LAW-[0-9][0-9][0-9] / {
    id = trim($2)
    generation = trim($3) + 0
    effective = trim($4)
    predecessor = trim($5)
    coordinator = trim($6)
    additions = trim($7)
    removals = trim($8)
    semantics = trim($9)
    mixed = trim($10)
    fence = trim($11)
    migration = trim($12)
    rollback = trim($13)
    dependency_contract = trim($14)
    semantic_contract = trim($15)
    recovery_contract = trim($16)
    manifest_digest = trim($17)
    suffix = substr(id, 9)
    generation_padded = sprintf("%02d", generation)

    if (generation_seen[id, generation]++) {
        fail(id " repeats generation " generation)
    }
    if (generation != latest_generation[id] + 1) {
        fail(id " generations are not contiguous")
    }
    semantic_change = semantics != "unchanged"
    coordinator_change = generation > 1 && coordinator != latest_coordinator[id]
    dependency_change = additions != "none" || removals != "none"
    if (generation == 1) {
        if (predecessor != "none") {
            fail(id " generation one must have no predecessor")
        }
        if (semantics !~ /^linearize: / ||
            semantics !~ /; failure: / ||
             semantics !~ /; recovery: /) {
            fail(id " generation one lacks canonical semantics")
        }
        if (additions == "none") {
            fail(id " generation one must declare its dependency set")
        }
    } else {
        if ((predecessor + 0) != generation - 1) {
            fail(id " generation predecessor is not contiguous")
        }
        if (version_compare(effective, latest_effective[id]) <= 0) {
            fail(id " generation effective version does not increase")
        }
        if (semantics != "unchanged" &&
            (semantics !~ /^linearize: / ||
             semantics !~ /; failure: / ||
             semantics !~ /; recovery: /)) {
            fail(id " generation semantic change is not canonical")
        }
        if (!dependency_change && !coordinator_change && !semantic_change) {
            fail(id " generation has no meaningful delta")
        }
        if (semantic_change && semantics == latest_semantics[id] &&
            !dependency_change && !coordinator_change) {
            fail(id " semantics-only generation does not change semantics")
        }
    }
    if (!invariant[coordinator]) {
        fail(id " generation coordinator is unknown")
    } else if (version_compare(invariant_effective[coordinator],
                               effective) > 0) {
        fail(id " generation predates its coordinator")
    }
    if (additions != "none") {
        addition_count = split(additions, addition_parts, ",")
        for (part = 1; part <= addition_count; part++) {
            dependency = trim(addition_parts[part])
            if (!invariant[dependency]) {
                fail(id " generation adds unknown " dependency)
            } else if (version_compare(invariant_effective[dependency],
                                       effective) > 0) {
                fail(id " generation predates dependency " dependency)
            }
            if (resolved[id, dependency]) {
                fail(id " generation re-adds dependency " dependency)
            }
            resolved[id, dependency] = 1
            resolved_count[id]++
        }
    }
    if (removals != "none") {
        removal_count = split(removals, removal_parts, ",")
        for (part = 1; part <= removal_count; part++) {
            dependency = trim(removal_parts[part])
            if (!resolved[id, dependency]) {
                fail(id " generation removes absent " dependency)
            }
            delete resolved[id, dependency]
            resolved_count[id]--
        }
    }
    if (mixed == "" || mixed == "—") {
        fail(id " generation lacks mixed-version intersection")
    }
    if (fence != "VIT-LGFEN-" suffix "-g" generation_padded) {
        fail(id " generation activation fence is mismatched")
    }
    expected_migration = "^VIT-LGMIG-" suffix "-g" generation_padded \
        "-v[0-9]+$"
    if (migration !~ expected_migration) {
        fail(id " generation migration contract is mismatched")
    }
    expected_dependency = "^VIT-LDEP-" suffix "-g" generation_padded \
        "-v[0-9]+$"
    if (dependency_contract !~ expected_dependency) {
        fail(id " generation dependency contract is mismatched")
    }
    expected_semantic = "^VIT-LSEM-" suffix "-g" generation_padded \
        "-v[0-9]+$"
    if (semantic_contract !~ expected_semantic) {
        fail(id " generation semantic contract is mismatched")
    }
    expected_recovery = "^VIT-LRCV-" suffix "-g" generation_padded \
        "-v[0-9]+$"
    if (recovery_contract !~ expected_recovery) {
        fail(id " generation recovery contract is mismatched")
    }
    if (rollback !~ /^`[0-9]+\.[0-9]+\.[0-9]+`$/ ||
        version_compare(rollback, effective) < 0) {
        fail(id " generation rollback floor predates activation")
    }
    if (semantics == "unchanged") {
        resolved_semantics = latest_semantics[id]
    } else {
        resolved_semantics = semantics
    }
    dependencies = ""
    for (number = 1; number <= 999; number++) {
        dependency = sprintf("VIT-INV-%03d", number)
        if (resolved[id, dependency]) {
            if (dependencies != "") dependencies = dependencies ", "
            dependencies = dependencies dependency
        }
    }
    effective_value = effective
    rollback_value = rollback
    gsub(/`/, "", effective_value)
    gsub(/`/, "", rollback_value)
    preimage = netstring("vitheim-law-generation-manifest-v1") \
        netstring(id) netstring(generation "") netstring(effective_value) \
        netstring(predecessor) netstring(coordinator) netstring(dependencies) \
        netstring(semantic_contract) netstring(resolved_semantics) \
        netstring(mixed) netstring(fence) netstring(migration) \
        netstring(rollback_value) netstring(dependency_contract) \
        netstring(recovery_contract)
    print manifest_digest "\t" id "@g" generation_padded "\t" preimage \
        > digest_records
    latest_generation[id] = generation
    latest_effective[id] = effective
    latest_coordinator[id] = coordinator
    latest_semantics[id] = resolved_semantics
    latest_rollback_floor[id] = rollback
    latest_dependency_contract[id] = dependency_contract
    latest_semantic_contract[id] = semantic_contract
    latest_recovery_contract[id] = recovery_contract
    latest_manifest_digest[id] = manifest_digest
    generation_count++
    next
}
function trim(value) {
    sub(/^[[:space:]]+/, "", value)
    sub(/[[:space:]]+$/, "", value)
    return value
}
function netstring(value) {
    return length(value) ":" value
}
function version_compare(left, right, left_parts, right_parts, position) {
    gsub(/`/, "", left)
    gsub(/`/, "", right)
    split(left, left_parts, ".")
    split(right, right_parts, ".")
    for (position = 1; position <= 3; position++) {
        if ((left_parts[position] + 0) < (right_parts[position] + 0)) return -1
        if ((left_parts[position] + 0) > (right_parts[position] + 0)) return 1
    }
    return 0
}
function fail(message) {
    print "law generations: " message > "/dev/stderr"
    failed = 1
}
END {
    for (id in current_law) {
        if (!latest_generation[id]) {
            fail(id " has no canonical generation")
            continue
        }
        if (current_coordinator[id] != latest_coordinator[id]) {
            fail(id " latest coordinator differs from current law")
        }
        current_semantics = "linearize: " current_linearization[id] \
            "; failure: " current_failure[id] \
            "; recovery: " current_recovery[id]
        if (current_semantics != latest_semantics[id]) {
            fail(id " latest semantics differ from current law")
        }
        current_count = split(current_dependencies[id], current_parts, ",")
        if (current_count != resolved_count[id]) {
            fail(id " latest dependency count differs from current view")
        }
        for (part = 1; part <= current_count; part++) {
            dependency = trim(current_parts[part])
            if (!resolved[id, dependency]) {
                fail(id " latest generation omits current " dependency)
            }
        }
        if (current_dependency_contract[id] != \
            latest_dependency_contract[id]) {
            fail(id " lifecycle dependency contract is not latest")
        }
        if (current_recovery_contract[id] != latest_recovery_contract[id]) {
            fail(id " lifecycle recovery contract is not latest")
        }
        if (current_semantic_contract[id] != latest_semantic_contract[id]) {
            fail(id " lifecycle semantic contract is not latest")
        }
        if (current_manifest_digest[id] != latest_manifest_digest[id]) {
            fail(id " lifecycle manifest digest is not latest")
        }
        if (current_rollback_floor[id] != latest_rollback_floor[id]) {
            fail(id " lifecycle rollback floor is not latest")
        }
    }
    for (id in latest_generation) {
        if (!current_law[id]) fail(id " generation has no current law view")
    }
    if (generation_count == 0) fail("no law generations found")
    exit failed
}
' "$registry" "$generations"; then
    exit 1
fi

digest_sha256() {
    value="$1"
    if command -v sha256sum >/dev/null 2>&1; then
        hash_line="$(printf '%s' "$value" | sha256sum)"
        printf '%s\n' "${hash_line%% *}"
    elif command -v shasum >/dev/null 2>&1; then
        hash_line="$(printf '%s' "$value" | shasum -a 256)"
        printf '%s\n' "${hash_line%% *}"
    elif command -v sha256 >/dev/null 2>&1; then
        printf '%s' "$value" | sha256 -q
    else
        echo "law generations: no SHA-256 verification tool found" >&2
        return 1
    fi
}

digest_failed=0
while IFS='	' read -r expected label preimage; do
    actual="sha256:$(digest_sha256 "$preimage")"
    if [ "$expected" != "$actual" ]; then
        echo "law generations: $label manifest digest mismatch; canonical is $actual" >&2
        digest_failed=1
    fi
done < "$digest_records"

rm -f "$digest_records"
trap - EXIT
exit "$digest_failed"
