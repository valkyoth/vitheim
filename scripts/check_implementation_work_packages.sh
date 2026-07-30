#!/usr/bin/env sh
set -eu

failed=0
packages="docs/implementation/work_packages"
critical="docs/implementation/critical_model_stops_v1.txt"
bindings="docs/implementation/executable_model_bindings_v1.txt"
status_stops="$(mktemp /tmp/vitheim-work-package-status.XXXXXX)"
critical_stops="$(mktemp /tmp/vitheim-critical-model-stops.XXXXXX)"
trap 'rm -f "$status_stops" "$critical_stops"' EXIT

fail() {
    echo "implementation work packages: $1" >&2
    failed=1
}

validate_package() {
    package="$1"
    if ! awk -F '=' '
    BEGIN {
        split("schema stop_id package_generation status authority_owner primary_transition_or_boundary crates_and_files schema_migration external_boundary prerequisites excluded_neighbor_scope verification_owners rollback_or_refusal pentest_question independently_shippable_units", keys, " ")
        for (i in keys) allowed[keys[i]] = 1
    }
    {
        key = $1
        value = substr($0, index($0, "=") + 1)
        if (!(key in allowed) || index($0, "=") == 0 || value == "" ||
            index(value, "|") != 0) {
            bad = 1
        }
    }
    END { exit bad }
    ' "$package"; then
        fail "$package has unknown, empty, malformed, or delimiter-bearing fields"
    fi
    for key in schema stop_id package_generation status authority_owner \
        primary_transition_or_boundary crates_and_files schema_migration \
        external_boundary prerequisites excluded_neighbor_scope \
        verification_owners rollback_or_refusal pentest_question \
        independently_shippable_units; do
        count="$(grep -c "^${key}=" "$package" || true)"
        [ "$count" -eq 1 ] || fail "$package must contain exactly one $key"
    done
    schema="$(sed -n 's/^schema=//p' "$package")"
    stop="$(sed -n 's/^stop_id=//p' "$package")"
    generation="$(sed -n 's/^package_generation=//p' "$package")"
    status="$(sed -n 's/^status=//p' "$package")"
    units="$(sed -n 's/^independently_shippable_units=//p' "$package")"
    owner="$(sed -n 's/^authority_owner=//p' "$package")"
    [ "$schema" = "ImplementationWorkPackageV1" ] ||
        fail "$package has wrong schema"
    printf '%s\n' "$stop" | grep -Eq '^(0\.[1-9][0-9]*\.0|1\.0\.0)$' ||
        fail "$package has malformed stop ID"
    printf '%s\n' "$generation" | grep -Eq '^[1-9][0-9]*$' ||
        fail "$package has malformed generation"
    printf '%s\n' "$status" |
        grep -Eq '^(planned|implementing|implemented|awaiting pentest|ready to tag)$' ||
        fail "$package has invalid status"
    [ "$units" = "1" ] || fail "$package must contain one shippable unit"
    printf '%s\n' "$owner" | grep -Eq '^(none|VIT-INV-[0-9]{3}|VIT-LAW-[0-9]{3}|[a-z0-9_-]+)$' ||
        fail "$package has a non-scalar authority owner"
    grep -R -Fq "## \`$stop\`" docs/implementation ||
        fail "$package references missing stop $stop"
    basename "$package" | grep -q "^${stop}\\.work-package$" ||
        fail "$package filename and stop differ"
}

for package in "$packages"/*.work-package; do
    validate_package "$package"
done

test -f "$packages/0.2.0.work-package" ||
    fail "next implementation stop 0.2.0 lacks a package"

for file in docs/implementation/*.md; do
    awk '
    /^## `([0-9]+\.[0-9]+\.[0-9]+)`/ {
        heading = $0
        sub(/^## `/, "", heading)
        split(heading, parts, "`")
        version = parts[1]
        next
    }
    /^Status: (implementing|implemented|awaiting pentest|ready to tag)/ {
        print version
    }
    ' "$file"
done > "$status_stops"
while IFS= read -r stop; do
    [ -f "$packages/$stop.work-package" ] ||
        fail "$stop has implementation status but no work package"
done < "$status_stops"

awk -F '|' '
NR == 1 {
    if ($0 != "schema|CriticalModelStopSetV1") fail("wrong critical schema")
    next
}
NR == 2 {
    if ($0 != "generation|1") fail("wrong critical generation")
    next
}
NR == 3 { next }
{
    if (NF != 2) fail("critical row has wrong field count")
    if (seen[$1]++) fail("duplicate critical stop " $1)
    critical[$1] = 1
}
END {
    for (stop in critical) print stop
    exit failed
}
function fail(message) {
    print "implementation work packages: " message > "/dev/stderr"
    failed = 1
}
' "$critical" > "$critical_stops"

awk -F '|' -v critical_file="$critical_stops" '
BEGIN {
    while ((getline stop < critical_file) > 0) critical[stop] = 1
    close(critical_file)
}
NR == 1 {
    if ($0 != "schema|ExecutableModelBindingV1") fail("wrong binding schema")
    next
}
NR == 2 {
    if ($0 != "generation|1") fail("wrong binding generation")
    next
}
NR == 3 { next }
{
    if (NF != 12) {
        fail("binding row has wrong field count")
        next
    }
    model = $1
    stop = $2
    if (model !~ /^VIT-MODEL-[0-9][0-9][0-9]$/) {
        fail("malformed model ID " model)
    }
    if (seen_model[model]++) fail("duplicate model " model)
    if (seen_stop[stop]++) fail("duplicate model stop " stop)
    if (!critical[stop]) fail("binding for unregistered critical stop " stop)
    for (field = 3; field <= 11; field++) {
        if ($field == "") fail(stop " has empty binding field " field)
    }
    if ($12 != "planned" && $12 != "implemented") {
        fail(stop " has invalid binding status")
    }
    if ($12 == "implemented" && $5 ~ /^planned:/) {
        fail(stop " implemented binding still has planned Rust owner")
    }
}
END {
    for (stop in critical) {
        if (!seen_stop[stop]) fail("critical stop lacks binding " stop)
    }
    exit failed
}
function fail(message) {
    print "implementation work packages: " message > "/dev/stderr"
    failed = 1
}
' "$bindings" || failed=1

[ "$failed" -eq 0 ] || exit 1
echo "implementation work packages and model bindings: ok"
