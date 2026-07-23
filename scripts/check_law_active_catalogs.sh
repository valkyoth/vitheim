#!/bin/sh
set -eu

generations=${1:-docs/LAW_GENERATIONS.md}
catalogs=${2:-docs/LAW_ACTIVE_CATALOGS.md}
implementation_dir=${3:-docs/implementation}

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
    scope = trim($4)
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
    } else {
        expected_predecessor = sprintf("VIT-LAWCAT-ACTIVE-e%03d-envelope-v1",
                                       epoch - 1)
        if (predecessor != expected_predecessor) {
            fail(catalog_id " predecessor envelope is not contiguous")
        }
    }
    if (scope !~ /^`[0-9]+\.[0-9]+\.[0-9]+` \/ `[0-9]+\.[0-9]+\.[0-9]+`$/) {
        fail(catalog_id " has malformed activation/max versions")
    }
    split(scope, scopes, " / ")
    floor = bare(scopes[1])
    maximum = bare(scopes[2])
    if (!strict_semver(floor) || !strict_semver(maximum) ||
        floor != maximum) {
        fail(catalog_id " activation floor/max is not canonical and exact")
    }
    if (schedule_seen[maximum]++) fail("duplicate catalog maximum " maximum)
    if (!required_schedule[maximum]) {
        fail(catalog_id " has no law-generation change at its maximum")
    }
    if (schedule_count > 0 && version_compare(maximum, prior_maximum) <= 0) {
        fail(catalog_id " maximum platform version is not increasing")
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
        expected = latest_effective_generation(law, maximum)
        if (!expected || claimed != expected) {
            fail(catalog_id " frontier is not latest-effective: " reference)
        }
        frontier_seen[law] = epoch
        previous_frontier = reference
    }
    for (law in latest_generation) {
        expected = latest_effective_generation(law, maximum)
        if (expected && frontier_seen[law] != epoch) {
            fail(catalog_id " omits effective frontier for " law)
        }
    }
    print maximum "|" substr(artifact, 2, length(artifact) - 2) >schedule
    prior_maximum = maximum
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
function latest_effective_generation(law, maximum, generation, result) {
    result = 0
    for (generation = 1; generation <= latest_generation[law]; generation++) {
        if (version_compare(generation_effective[law, generation],
                            maximum) <= 0) result = generation
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

while IFS='|' read -r version artifact; do
    status=$(awk -v target="$version" '
        /^##? `/ { current = index($0, "`" target "`") > 0 }
        current && /^Status:/ { print; exit }
    ' "$implementation_dir"/*.md)
    [ -n "$status" ] || fail "cannot resolve milestone status for $version"
    case "$status" in
        *planned*) ;;
        *)
            [ -f "$artifact" ] ||
                fail "$artifact is required after $version leaves planned"
            for field in catalog_id epoch predecessor_envelope_digest \
                activation_floor maximum_platform product_scope edition_scope \
                compatibility_scope validity_policy not_before not_after \
                signer_key_id signature_profile trust_root_epoch \
                revocation_policy successor_policy; do
                grep -Eq "^${field}=[^[:space:]].*$" "$artifact" ||
                    fail "$artifact lacks canonical field $field"
            done
            grep -Eq '^profile=(CompiledCatalog|SignedCatalog)$' "$artifact" ||
                fail "$artifact lacks one exact profile enum"
            grep -Eq '^payload_digest=sha256:[0-9a-f]{64}$' "$artifact" ||
                fail "$artifact lacks a canonical payload digest"
            grep -Eq '^envelope_digest=sha256:[0-9a-f]{64}$' "$artifact" ||
                fail "$artifact lacks a canonical envelope digest"
            ;;
    esac
done <"$schedule"

echo "active law catalog policy passed"
