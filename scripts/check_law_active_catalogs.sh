#!/bin/sh
set -eu

generations=${1:-docs/LAW_GENERATIONS.md}
catalogs=${2:-docs/LAW_ACTIVE_CATALOGS.md}
implementation_dir=${3:-docs/implementation}
workspace_root=${4:-.}

fail() {
    echo "active law catalogs: $*" >&2
    exit 1
}

[ -f "$generations" ] || fail "missing generation registry: $generations"
[ -f "$catalogs" ] || fail "missing active catalog plan: $catalogs"
[ -d "$implementation_dir" ] ||
    fail "missing implementation directory: $implementation_dir"

tmp_dir=$(mktemp -d)
trap 'rm -rf "$tmp_dir"' EXIT HUP INT TERM
schedule="$tmp_dir/schedule"

LC_ALL=C awk -F'|' -v generations="$generations" \
    -v catalogs="$catalogs" -v schedule="$schedule" '
FILENAME == generations &&
/^\| VIT-LAW-[0-9][0-9][0-9] \|/ {
    law = trim($2)
    generation = trim($3) + 0
    effective = bare($4)
    generation_effective[law, generation] = effective
    if (generation > latest_generation[law]) latest_generation[law] = generation
    if (version_compare(effective, "0.18.3") >= 0) {
        required_schedule[effective] = 1
    }
    next
}
FILENAME == catalogs &&
/^\| [1-9][0-9]* \| VIT-LAWCAT-ACTIVE-e[0-9][0-9][0-9]-v[1-9][0-9]* \|/ {
    if (NF != 9 || $0 ~ /[^ -~]/) fail("noncanonical schedule row")
    for (field = 2; field <= 8; field++) {
        value = trim($field)
        if ($field != " " value " ") {
            fail("noncanonical schedule cell whitespace")
        }
    }
    epoch_source = trim($2)
    epoch = epoch_source + 0
    catalog_id = trim($3)
    floor = bare($4)
    profile = trim($5)
    predecessor = trim($6)
    frontiers = trim($7)
    artifact = trim($8)

    if (epoch != schedule_count + 1) fail("catalog epochs are not contiguous")
    expected_id = sprintf("VIT-LAWCAT-ACTIVE-e%03d-v1", epoch)
    if (catalog_id != expected_id) fail("catalog ID does not match epoch")
    if (profile != "CompiledCatalog" && profile != "SignedCatalog") {
        fail(catalog_id " has a non-exact profile enum")
    }
    if (epoch == 1) {
        if (predecessor != "none") fail("first catalog has a predecessor")
        if (floor != "0.18.3") fail("first catalog must activate at 0.18.3")
    } else {
        expected_predecessor = sprintf("VIT-LAWCAT-ACTIVE-e%03d-envelope-v1",
                                       epoch - 1)
        if (predecessor != expected_predecessor) {
            fail(catalog_id " predecessor envelope is not contiguous")
        }
    }
    if (!strict_semver(floor)) {
        fail(catalog_id " has a malformed activation floor")
    }
    if (schedule_seen[floor]++) fail("duplicate catalog activation floor " floor)
    if (!required_schedule[floor]) {
        fail(catalog_id " has no law-generation change at its activation floor")
    }
    if (schedule_count > 0 && version_compare(floor, prior_floor) <= 0) {
        fail(catalog_id " activation floor is not increasing")
    }
    expected_artifact = "`release/law-catalogs/" catalog_id ".catalog`"
    if (artifact != expected_artifact) {
        fail(catalog_id " artifact path is noncanonical")
    }

    frontier_count = split(frontiers, frontier_parts, ",")
    previous_frontier = ""
    for (part = 1; part <= frontier_count; part++) {
        reference = trim(frontier_parts[part])
        if (reference !~ /^VIT-LAW-[0-9][0-9][0-9]@g[0-9][0-9]$/ ||
            (previous_frontier != "" && reference <= previous_frontier)) {
            fail(catalog_id " frontiers are malformed or unsorted")
        }
        split(reference, reference_parts, "@g")
        law = reference_parts[1]
        claimed = reference_parts[2] + 0
        expected = latest_effective_generation(law, floor)
        if (!expected || claimed != expected) {
            fail(catalog_id " frontier is not latest-effective: " reference)
        }
        frontier_seen[law] = epoch
        previous_frontier = reference
    }
    for (law in latest_generation) {
        expected = latest_effective_generation(law, floor)
        if (expected && frontier_seen[law] != epoch) {
            fail(catalog_id " omits effective frontier for " law)
        }
    }
    artifact = substr(artifact, 2, length(artifact) - 2)
    print epoch "|" catalog_id "|" floor "|" profile "|" predecessor "|" artifact \
        >schedule
    prior_floor = floor
    schedule_count++
    next
}
function trim(value) {
    sub(/^[[:space:]]+/, "", value)
    sub(/[[:space:]]+$/, "", value)
    return value
}
function bare(value) {
    value = trim(value)
    gsub(/`/, "", value)
    return value
}
function strict_semver(value, parts, position) {
    if (value !~ /^(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)$/) {
        return 0
    }
    split(value, parts, ".")
    for (position = 1; position <= 3; position++) {
        if (length(parts[position]) > 1 &&
            substr(parts[position], 1, 1) == "0") return 0
    }
    return 1
}
function version_compare(left, right, left_parts, right_parts, position) {
    split(left, left_parts, ".")
    split(right, right_parts, ".")
    for (position = 1; position <= 3; position++) {
        if ((left_parts[position] + 0) < (right_parts[position] + 0)) return -1
        if ((left_parts[position] + 0) > (right_parts[position] + 0)) return 1
    }
    return 0
}
function latest_effective_generation(law, floor, generation, result) {
    result = 0
    for (generation = 1; generation <= latest_generation[law]; generation++) {
        if (version_compare(generation_effective[law, generation],
                            floor) <= 0) result = generation
    }
    return result
}
function fail(message) {
    print "active law catalogs: " message >"/dev/stderr"
    failed = 1
}
END {
    for (version in required_schedule) {
        if (!schedule_seen[version]) fail("missing catalog for " version)
    }
    if (!schedule_count) fail("no active catalogs found")
    exit failed
}
' "$generations" "$catalogs" || exit 1

# Enumerate the actual implementation ladder. Under the one-active-global-lineage
# rule, a catalog applies from its floor until the next catalog is activated.
# This proves every milestone has exactly one planned catalog, including versions
# such as 0.19.0 and 0.30.2 that do not themselves change a law generation.
LC_ALL=C awk -F'|' '
FNR == NR {
    floor[++catalog_count] = $3
    next
}
/^#{1,2} `[0-9]+\.[0-9]+\.[0-9]+`/ {
    version = $0
    sub(/^[^`]*`/, "", version)
    sub(/`.*/, "", version)
    if (version_compare(version, "0.18.3") < 0) next
    if (milestone_seen[version]++) {
        fail("duplicate implementation milestone " version)
        next
    }
    applicable = 0
    for (position = 1; position <= catalog_count; position++) {
        after_floor = version_compare(version, floor[position]) >= 0
        before_successor = position == catalog_count ||
            version_compare(version, floor[position + 1]) < 0
        if (after_floor && before_successor) applicable++
    }
    if (applicable != 1) {
        fail("milestone " version " has " applicable " applicable catalogs")
    }
    milestone_count++
}
function version_compare(left, right, left_parts, right_parts, position) {
    split(left, left_parts, ".")
    split(right, right_parts, ".")
    for (position = 1; position <= 3; position++) {
        if ((left_parts[position] + 0) < (right_parts[position] + 0)) return -1
        if ((left_parts[position] + 0) > (right_parts[position] + 0)) return 1
    }
    return 0
}
function fail(message) {
    print "active law catalogs: " message >"/dev/stderr"
    failed = 1
}
END {
    if (!milestone_count) fail("no implementation milestones at or after 0.18.3")
    if (!milestone_seen["1.0.0"]) fail("production milestone is not covered")
    exit failed
}
' "$schedule" "$implementation_dir"/*.md || exit 1

previous_artifact=none
while IFS='|' read -r epoch catalog_id floor profile predecessor artifact; do
    status=$(awk -v target="$floor" '
        /^##? `/ { current = index($0, "`" target "`") > 0 }
        current && /^Status:/ { print; exit }
    ' "$implementation_dir"/*.md)
    [ -n "$status" ] || fail "cannot resolve milestone status for $floor"
    case "$status" in
        *planned*) ;;
        *)
            artifact_path=$workspace_root/$artifact
            [ -f "$artifact_path" ] ||
                fail "$artifact is required after $floor leaves planned"
            [ -f "$workspace_root/crates/vitheim-law-catalog-cli/Cargo.toml" ] ||
                fail "project-owned catalog verifier crate is missing"
            if [ "$epoch" -eq 1 ]; then
                cargo run --quiet --locked --manifest-path \
                    "$workspace_root/Cargo.toml" -p vitheim-law-catalog-cli \
                    --bin vitheim-law-catalog-verify -- verify-active \
                    --artifact "$artifact_path" \
                    --expected-catalog-id "$catalog_id" \
                    --expected-epoch "$epoch" \
                    --expected-activation-floor "$floor" \
                    --expected-profile "$profile" \
                    --expected-product-scope vitheim \
                    --expected-edition-scope vitheim-core \
                    --expected-compatibility-scope vitheim-platform-law-v1 \
                    --expected-predecessor none ||
                    fail "$artifact failed project-owned verification"
            else
                [ -f "$previous_artifact" ] ||
                    fail "$artifact has no actual predecessor artifact"
                cargo run --quiet --locked --manifest-path \
                    "$workspace_root/Cargo.toml" -p vitheim-law-catalog-cli \
                    --bin vitheim-law-catalog-verify -- verify-active \
                    --artifact "$artifact_path" \
                    --expected-catalog-id "$catalog_id" \
                    --expected-epoch "$epoch" \
                    --expected-activation-floor "$floor" \
                    --expected-profile "$profile" \
                    --expected-product-scope vitheim \
                    --expected-edition-scope vitheim-core \
                    --expected-compatibility-scope vitheim-platform-law-v1 \
                    --predecessor-artifact "$previous_artifact" ||
                    fail "$artifact failed project-owned verification"
            fi
            ;;
    esac
    previous_artifact=$workspace_root/$artifact
done <"$schedule"

echo "active law catalog policy passed"
