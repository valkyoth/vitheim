#!/usr/bin/env sh
set -eu

manifest="docs/selected_profile_manifest_v1.txt"
generated="$(mktemp /tmp/vitheim-selected-profile-manifest.XXXXXX)"
trap 'rm -f "$generated"' EXIT

scripts/generate_selected_profile_manifest.sh > "$generated"
if ! cmp -s "$manifest" "$generated"; then
    echo "selected profile: committed manifest differs from canonical generation" >&2
    diff -u "$manifest" "$generated" >&2 || true
    exit 1
fi

awk -F '|' '
BEGIN {
    failed = 0
}
NR == 1 {
    if ($0 != "schema|SelectedProfileManifestV1") fail("wrong schema")
    next
}
NR == 2 {
    if ($0 != "profile_id|VITHEIM-PRODUCTION-V1") fail("wrong profile ID")
    next
}
NR == 3 {
    if ($0 != "generation|1") fail("wrong generation")
    next
}
NR == 4 {
    if ($0 != "default_evidence_state|Specified") {
        fail("wrong default evidence state")
    }
    next
}
NR == 5 {
    if (NF != 17 || $1 != "stop_id" || $2 != "selection" ||
        $3 != "capability_dependencies" ||
        $7 != "required_for_claims") {
        fail("wrong column schema")
    }
    next
}
{
    if (NF != 17) {
        fail("row " NR " has " NF " fields")
        next
    }
    stop = $1
    state = $2
    dependencies = $3
    dependency_state = $4
    increment = $5
    delivery = $6
    claims = $7
    owner = $9
    retests = $10
    successor = $14
    boundary = $15
    dependency = $16

    if (seen[stop]++) fail("duplicate stop " stop)
    if (state !~ /^(Mandatory|OptionalSelected|Deferred|Unsupported)$/) {
        fail(stop " has invalid selection")
    }
    selected[stop] = state == "Mandatory" || state == "OptionalSelected"
    dependencies_of[stop] = dependencies
    dependency_state_of[stop] = dependency_state
    state_of[stop] = state
    claims_of[stop] = claims
    delivery_of[stop] = delivery
    increment_of[stop] = increment
    retests_of[stop] = $10
    storage_of[stop] = $11
    identity_of[stop] = $12
    runtime_of[stop] = $13
    if (dependency_state !~ /^(DeclaredMinimum|PackageExact)$/) {
        fail(stop " has invalid dependency state")
    }
    if (claims != "none") {
        claim_count = split(claims, row_claims, ",")
        delete local_claim
        for (claim_index = 1; claim_index <= claim_count; claim_index++) {
            claim = row_claims[claim_index]
            if (local_claim[claim]++) {
                fail(stop " repeats required claim " claim)
            }
            if (claim !~ /^(VITHEIM-PRODUCTION-V1|core-service-operations|security-asset-operations|sqlite-bounded)$/) {
                fail(stop " has unknown required claim " claim)
            }
        }
    }
    if (owner !~ /^specified:docs\/implementation\/.*#[0-9]+\.[0-9]+\.[0-9]+$/ &&
        owner !~ /^(planned|implementing|implemented|awaiting-pentest|ready-to-tag):[^|]+$/) {
        fail(stop " has invalid executable-owner reference")
    }
    if (selected[stop]) {
        if (!has_claim(claims, "VITHEIM-PRODUCTION-V1")) {
            fail(stop " selected row is not bound to the production claim")
        }
        if (state == "OptionalSelected" &&
            claims == "VITHEIM-PRODUCTION-V1") {
            fail(stop " optional-selected row lacks a bounded profile claim")
        }
        if (successor != "not-applicable") {
            fail(stop " selected stop has a successor-after-skip")
        }
        if (dependency != "selected-closure") {
            fail(stop " selected stop has optional dependency direction")
        }
        if (boundary !~ /^(SpecifiedUntilExactStopAndPentest|SelectedBoundedProfileOnly)$/) {
            fail(stop " selected stop has invalid support boundary")
        }
        if (stop != "0.424.0" && stop != "1.0.0" &&
            retests != stop ",0.424.0") {
            fail(stop " selected stop lacks its final retest owner")
        }
    } else {
        if (successor != "future-minor-required-after-skip") {
            fail(stop " lacks required future successor rule")
        }
        if (dependency != "optional-outward-only") {
            fail(stop " could become an inward core dependency")
        }
        if (increment != "I8-independent-product-profiles" ||
            delivery != "independent-optional-profile" ||
            retests != "future-successor-required" || claims != "none") {
            fail(stop " unselected stop enters a selected delivery/retest lane")
        }
    }
    row_count++
}
END {
    for (n = 1; n <= 424; n++) {
        stop = "0." n ".0"
        if (!seen[stop]) fail("missing " stop)
    }
    if (!seen["1.0.0"]) fail("missing 1.0.0")
    if (row_count != 425) fail("expected 425 rows, found " row_count)
    for (stop in dependencies_of) {
        dependencies = dependencies_of[stop]
        if (dependencies == "none") continue
        count = split(dependencies, parts, ",")
        delete local_dependency
        for (i = 1; i <= count; i++) {
            prerequisite = parts[i]
            if (local_dependency[prerequisite]++) {
                fail(stop " repeats dependency " prerequisite)
            } else if (!seen[prerequisite]) {
                fail(stop " has missing dependency " prerequisite)
            } else if (prerequisite == stop) {
                fail(stop " depends on itself")
            } else {
                edge[prerequisite SUBSEP stop] = 1
                indegree[stop]++
            }
            if (selected[stop] && !selected[prerequisite]) {
                fail(stop " selected row depends on unselected " prerequisite)
            }
            if (state_of[stop] == "Mandatory" &&
                state_of[prerequisite] == "OptionalSelected" &&
                !has_claim(claims_of[prerequisite],
                           "VITHEIM-PRODUCTION-V1")) {
                fail(stop " depends on an unpromoted optional profile")
            }
            if (has_claim(claims_of[stop], "core-service-operations") &&
                !has_claim(claims_of[prerequisite],
                           "core-service-operations")) {
                fail(stop " core-service claim has an unclaimed dependency " prerequisite)
            }
            if (has_claim(claims_of[stop], "security-asset-operations") &&
                !has_claim(claims_of[prerequisite],
                           "security-asset-operations") &&
                !has_claim(claims_of[prerequisite],
                           "core-service-operations")) {
                fail(stop " security-asset claim has an unclaimed dependency " prerequisite)
            }
        }
    }
    removed_count = 0
    do {
        progress = 0
        for (stop in seen) {
            if (!removed[stop] && indegree[stop] == 0) {
                removed[stop] = 1
                removed_count++
                progress = 1
                for (edge_key in edge) {
                    split(edge_key, ends, SUBSEP)
                    if (ends[1] == stop) indegree[ends[2]]--
                }
            }
        }
    } while (progress)
    if (removed_count != row_count) {
        fail("capability dependency graph contains a cycle")
    }
    if (state_of["0.57.0"] != "Mandatory") {
        fail("PostgreSQL reference stop must be mandatory")
    }
    if (state_of["0.58.0"] != "OptionalSelected") {
        fail("SQLite bounded stop must be optional-selected")
    }
    production_dependencies = "0.58.0,0.267.0,0.277.0,0.284.0,0.424.0"
    if (dependencies_of["1.0.0"] != production_dependencies ||
        retests_of["1.0.0"] != "self" ||
        storage_of["1.0.0"] != "postgresql-reference" ||
        identity_of["1.0.0"] != "oidc-rbac-abac-selected" ||
        runtime_of["1.0.0"] != "Hosted") {
        fail("1.0.0 does not bind the selected production profile")
    }
    for (n = 156; n <= 210; n++) {
        if (state_of["0." n ".0"] != "Unsupported") {
            fail("advanced retirement stop 0." n ".0 is not unsupported")
        }
    }
    if (dependencies_of["0.277.0"] !~ /(^|,)0\.267\.0(,|$)/ ||
        !has_claim(claims_of["0.277.0"],
                   "security-asset-operations")) {
        fail("cloud discovery lacks its kind-pack dependency/claim")
    }
    if (dependencies_of["0.414.0"] != "0.413.0") {
        fail("default 0.414.0 depends on unsupported retirement owners")
    }
    production_candidate_dependencies = "0.58.0,0.267.0,0.277.0,0.284.0,0.412.0,0.413.0,0.414.0,0.417.0,0.419.0,0.423.0"
    if (dependencies_of["0.424.0"] != production_candidate_dependencies) {
        fail("0.424.0 does not close every promoted optional profile")
    }
    for (n = 286; n <= 300; n++) {
        stop = "0." n ".0"
        if (selected[stop] &&
            (!has_claim(claims_of[stop], "core-service-operations") ||
             !has_claim(claims_of[stop],
                        "security-asset-operations"))) {
            fail(stop " search/knowledge row is not shared by both slices")
        }
    }
    for (n = 102; n <= 118; n++) {
        stop = "0." n ".0"
        if (increment_of[stop] != "I2-service-foundation") {
            fail(stop " is not assigned to the service-foundation increment")
        }
    }
    if (state_of["1.0.0"] != "Mandatory") fail("1.0.0 is not mandatory")
    exit failed
}
function has_claim(claims, claim, parts, count, i) {
    count = split(claims, parts, ",")
    for (i = 1; i <= count; i++) {
        if (parts[i] == claim) return 1
    }
    return 0
}
function fail(message) {
    print "selected profile: " message > "/dev/stderr"
    failed = 1
}
' "$manifest"

echo "selected profile manifest: ok"
