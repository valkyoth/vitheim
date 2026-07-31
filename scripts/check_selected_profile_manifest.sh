#!/usr/bin/env sh
set -eu

manifest="${VITHEIM_SELECTED_MANIFEST:-docs/selected_profile_manifest_v1.txt}"
supersessions="${VITHEIM_DEPENDENCY_SUPERSESSIONS:-docs/implementation/dependency_supersessions_v1.txt}"
generated="$(mktemp /tmp/vitheim-selected-profile-manifest.XXXXXX)"
approved_supersessions="$(mktemp /tmp/vitheim-dependency-supersessions.XXXXXX)"
trap 'rm -f "$generated" "$approved_supersessions"' EXIT

scripts/generate_selected_profile_manifest.sh > "$generated"
if ! cmp -s "$manifest" "$generated"; then
    echo "selected profile: committed manifest differs from canonical generation" >&2
    diff -u "$manifest" "$generated" >&2 || true
    exit 1
fi

scripts/check_dependency_supersessions.sh

awk -F '|' '
NR == 1 {
    if ($0 != "schema|DependencySupersessionV1") fail("wrong supersession schema")
    next
}
NR == 2 {
    if ($0 != "generation|1") fail("wrong supersession generation")
    next
}
NR == 3 {
    if ($0 != "dependent_stop|removed_dependency|reason|affected_control_ids|replacement_owner|security_reviewer|record_generation|record_digest|negative_test_ids|integration_test_ids|status") {
        fail("wrong supersession header")
    }
    next
}
{
    if (NF != 11) {
        fail("supersession row has wrong field count")
        next
    }
    if ($1 !~ /^(0\.[1-9][0-9]*\.0|1\.0\.0)$/ ||
        $2 !~ /^(0\.[1-9][0-9]*\.0|1\.0\.0)$/ || $1 == $2) {
        fail("supersession has malformed stop IDs")
    }
    if ($3 == "" || $3 == "none") fail("supersession lacks a reason")
    count = split($4, controls, ",")
    for (i = 1; i <= count; i++) {
        if (controls[i] !~ /^VIT-(REQ|INV|LAW)-[0-9][0-9][0-9]$/ &&
            controls[i] !~ /^VIT-MODEL-[0-9][0-9][0-9]$/) {
            fail("supersession has malformed affected control " controls[i])
        }
    }
    if ($5 !~ /^(none|0\.[1-9][0-9]*\.0|1\.0\.0)$/) {
        fail("supersession has malformed replacement owner")
    }
    if ($6 !~ /^VIT-SECURITY-REVIEWER:[A-Za-z0-9_.@-]+$/) {
        fail("supersession lacks an exact security reviewer")
    }
    if ($7 !~ /^[1-9][0-9]*$/ ||
        $8 !~ /^sha256:[0-9a-f]+$/ || length($8) != 71) {
        fail("supersession has malformed generation or digest")
    }
    if ($9 !~ /^VIT-TST-[A-Z0-9-]+(,VIT-TST-[A-Z0-9-]+)*$/ ||
        $10 !~ /^VIT-TST-[A-Z0-9-]+(,VIT-TST-[A-Z0-9-]+)*$/) {
        fail("supersession lacks exact negative/integration tests")
    }
    if ($11 != "approved") fail("supersession is not approved")
    key = $1 SUBSEP $2
    if (seen[key]++) fail("duplicate supersession " $1 " -> " $2)
    print $1 "|" $2 "|" $5
}
END { exit failed }
function fail(message) {
    print "selected profile: " message > "/dev/stderr"
    failed = 1
}
' "$supersessions" > "$approved_supersessions"

awk -F '|' -v supersession_file="$approved_supersessions" '
BEGIN {
    failed = 0
    while ((getline supersession_row < supersession_file) > 0) {
        split(supersession_row, supersession_parts, "|")
        approved_supersession[supersession_parts[1] SUBSEP supersession_parts[2]] = 1
        supersession_replacement[supersession_parts[1] SUBSEP supersession_parts[2]] = supersession_parts[3]
    }
    close(supersession_file)
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
    if ($0 != "generation|2") fail("wrong generation")
    next
}
NR == 4 {
    if ($0 != "default_evidence_state|Specified") {
        fail("wrong default evidence state")
    }
    next
}
NR == 5 {
    if (NF != 18 || $1 != "stop_id" || $2 != "selection" ||
        $3 != "declared_minimum_dependencies" ||
        $4 != "capability_dependencies" ||
        $8 != "required_for_claims") {
        fail("wrong column schema")
    }
    next
}
{
    if (NF != 18) {
        fail("row " NR " has " NF " fields")
        next
    }
    stop = $1
    state = $2
    declared_dependencies = $3
    dependencies = $4
    dependency_state = $5
    increment = $6
    delivery = $7
    claims = $8
    owner = $10
    retests = $11
    successor = $15
    boundary = $16
    dependency = $17

    if (seen[stop]++) fail("duplicate stop " stop)
    if (state !~ /^(Mandatory|OptionalSelected|Deferred|Unsupported)$/) {
        fail(stop " has invalid selection")
    }
    selected[stop] = state == "Mandatory" || state == "OptionalSelected"
    declared_dependencies_of[stop] = declared_dependencies
    dependencies_of[stop] = dependencies
    dependency_state_of[stop] = dependency_state
    state_of[stop] = state
    claims_of[stop] = claims
    delivery_of[stop] = delivery
    increment_of[stop] = increment
    retests_of[stop] = $11
    storage_of[stop] = $12
    identity_of[stop] = $13
    runtime_of[stop] = $14
    if (dependency_state !~ /^(DeclaredMinimum|PackageExact)$/) {
        fail(stop " has invalid dependency state")
    }
    if (dependency_state == "DeclaredMinimum" &&
        declared_dependencies != dependencies) {
        fail(stop " changes a declared minimum without PackageExact")
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
        declared_dependencies = declared_dependencies_of[stop]
        dependencies = dependencies_of[stop]
        if (declared_dependencies != "none") {
            declared_count = split(declared_dependencies, declared_parts, ",")
            delete local_declared
            for (declared_index = 1;
                 declared_index <= declared_count;
                 declared_index++) {
                declared_dependency = declared_parts[declared_index]
                if (local_declared[declared_dependency]++) {
                    fail(stop " repeats declared minimum " declared_dependency)
                }
                if (!seen[declared_dependency]) {
                    fail(stop " has missing declared minimum " declared_dependency)
                } else if (declared_dependency == stop) {
                    fail(stop " declares itself as a minimum")
                } else if (version_value(declared_dependency) >= version_value(stop)) {
                    fail(stop " declares same or future minimum " declared_dependency)
                }
                if (!list_has(dependencies, declared_dependency) &&
                    !approved_supersession[stop SUBSEP declared_dependency]) {
                    fail(stop " PackageExact removes declared minimum without approved supersession " declared_dependency)
                }
            }
        }
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
            } else if (version_value(prerequisite) >= version_value(stop)) {
                fail(stop " depends on same or future stop " prerequisite)
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
    for (supersession_key in approved_supersession) {
        split(supersession_key, supersession_ends, SUBSEP)
        dependent = supersession_ends[1]
        removed_dependency = supersession_ends[2]
        if (!seen[dependent] || !seen[removed_dependency]) {
            fail("supersession references missing manifest stop")
        } else if (dependency_state_of[dependent] != "PackageExact") {
            fail("supersession applies without PackageExact dependency state")
        } else if (!list_has(declared_dependencies_of[dependent],
                             removed_dependency)) {
            fail("supersession does not remove a declared minimum")
        } else if (list_has(dependencies_of[dependent],
                            removed_dependency)) {
            fail("supersession is stale because dependency remains exact")
        } else if (supersession_replacement[supersession_key] != "none" &&
                   !list_has(dependencies_of[dependent],
                             supersession_replacement[supersession_key])) {
            fail("supersession replacement owner is absent from exact dependencies")
        }
    }
    exit failed
}
function version_value(version, parts) {
    split(version, parts, ".")
    return parts[1] * 1000000 + parts[2] * 1000 + parts[3]
}
function list_has(values, wanted, parts, count, i) {
    if (values == "none") return 0
    count = split(values, parts, ",")
    for (i = 1; i <= count; i++) {
        if (parts[i] == wanted) return 1
    }
    return 0
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
