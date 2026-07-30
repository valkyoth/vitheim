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
    if (NF != 15 || $1 != "stop_id" || $2 != "selection") {
        fail("wrong column schema")
    }
    next
}
{
    if (NF != 15) {
        fail("row " NR " has " NF " fields")
        next
    }
    stop = $1
    state = $2
    predecessor = $3
    increment = $4
    delivery = $5
    owner = $7
    retests = $8
    successor = $12
    boundary = $13
    dependency = $14

    if (seen[stop]++) fail("duplicate stop " stop)
    if (state !~ /^(Mandatory|OptionalSelected|Deferred|Unsupported)$/) {
        fail(stop " has invalid selection")
    }
    selected[stop] = state == "Mandatory" || state == "OptionalSelected"
    predecessor_of[stop] = predecessor
    state_of[stop] = state
    retests_of[stop] = $8
    storage_of[stop] = $9
    identity_of[stop] = $10
    runtime_of[stop] = $11
    if (owner !~ /^specified:docs\/implementation\/.*#[0-9]+\.[0-9]+\.[0-9]+$/ &&
        owner !~ /^(planned|implementing|implemented|awaiting-pentest|ready-to-tag):[^|]+$/) {
        fail(stop " has invalid executable-owner reference")
    }
    if (selected[stop]) {
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
        if (predecessor != "none") {
            fail(stop " unselected stop enters selected predecessor closure")
        }
        if (successor != "future-minor-required-after-skip") {
            fail(stop " lacks required future successor rule")
        }
        if (dependency != "optional-outward-only") {
            fail(stop " could become an inward core dependency")
        }
        if (increment != "I7-independent-product-profiles" ||
            delivery != "independent-optional-profile" ||
            retests != "future-successor-required") {
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
    for (stop in predecessor_of) {
        predecessor = predecessor_of[stop]
        if (predecessor == "none") continue
        if (!seen[predecessor]) {
            fail(stop " has missing predecessor " predecessor)
        } else if (!selected[predecessor]) {
            fail(stop " depends on unselected predecessor " predecessor)
        } else if (state_of[stop] == "Mandatory" &&
                   state_of[predecessor] != "Mandatory") {
            fail(stop " mandatory closure depends on optional-selected " predecessor)
        } else if (version_value(predecessor) >= version_value(stop)) {
            fail(stop " predecessor is not numerically earlier")
        }
    }
    if (state_of["0.57.0"] != "Mandatory") {
        fail("PostgreSQL reference stop must be mandatory")
    }
    if (state_of["0.58.0"] != "OptionalSelected") {
        fail("SQLite bounded stop must be optional-selected")
    }
    if (predecessor_of["1.0.0"] != "0.424.0" ||
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
    if (state_of["1.0.0"] != "Mandatory") fail("1.0.0 is not mandatory")
    exit failed
}
function version_value(version, parts) {
    split(version, parts, ".")
    return parts[1] * 1000000 + parts[2] * 1000 + parts[3]
}
function fail(message) {
    print "selected profile: " message > "/dev/stderr"
    failed = 1
}
' "$manifest"

echo "selected profile manifest: ok"
