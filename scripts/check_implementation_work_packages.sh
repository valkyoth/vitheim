#!/usr/bin/env sh
set -eu

failed=0
packages="docs/implementation/work_packages"
critical="docs/implementation/critical_model_stops_v1.txt"
bindings="docs/implementation/executable_model_bindings_v1.txt"
test_inventory="docs/implementation/executable_test_inventory_v1.txt"
symbol_inventory="docs/implementation/executable_symbol_inventory_v1.txt"
status_stops="$(mktemp /tmp/vitheim-work-package-status.XXXXXX)"
critical_stops="$(mktemp /tmp/vitheim-critical-model-stops.XXXXXX)"
known_controls="$(mktemp /tmp/vitheim-model-known-controls.XXXXXX)"
registered_tests="$(mktemp /tmp/vitheim-registered-tests.XXXXXX)"
registered_symbols="$(mktemp /tmp/vitheim-registered-symbols.XXXXXX)"
trap 'rm -f "$status_stops" "$critical_stops" "$known_controls" "$registered_tests" "$registered_symbols"' EXIT

fail() {
    echo "implementation work packages: $1" >&2
    failed=1
}

scripts/check_work_package_closure.sh
scripts/check_executable_test_inventory.sh
awk -F '|' 'NR > 3 { print $1 "|" $4 }' \
    "$test_inventory" > "$registered_tests"

awk -F '|' '
NR == 1 {
    if ($0 != "schema|ExecutableSymbolInventoryV1") fail("wrong symbol inventory schema")
    next
}
NR == 2 {
    if ($0 != "generation|1") fail("wrong symbol inventory generation")
    next
}
NR == 3 {
    if ($0 != "owner_ref|source_file|symbol|status") fail("wrong symbol inventory header")
    next
}
{
    if (NF != 4) {
        fail("symbol inventory row has wrong field count")
        next
    }
    if ($1 !~ /^crates\/[^#]+#[A-Za-z0-9_:]+$/) {
        fail("malformed executable owner " $1)
    }
    if (seen[$1]++) fail("duplicate executable owner " $1)
    if ($2 !~ /^crates\/[^|]+\.rs$/ || $2 ~ /\.\./) {
        fail($1 " has an unsafe or non-Rust source file")
    }
    if ($3 !~ /^[A-Za-z_][A-Za-z0-9_]*$/) {
        fail($1 " has a malformed source symbol")
    }
    if ($4 != "implemented") fail($1 " is not implemented")
    print $1 "|" $2 "|" $3
}
END { exit failed }
function fail(message) {
    print "implementation work packages: " message > "/dev/stderr"
    failed = 1
}
' "$symbol_inventory" > "$registered_symbols" || failed=1

while IFS='|' read -r owner_ref source_file symbol; do
    owner_path="${owner_ref%%#*}"
    case "$source_file" in
        "$owner_path"/*) ;;
        *) fail "$owner_ref source file is outside its registered crate path" ;;
    esac
    [ -f "$source_file" ] ||
        fail "$owner_ref references missing source file $source_file"
    grep -Fq "$symbol" "$source_file" ||
        fail "$owner_ref symbol is absent from $source_file"
done < "$registered_symbols"

validate_package() {
    package="$1"
    if ! awk -F '=' '
    BEGIN {
        split("schema stop_id package_generation status authority_owner primary_transition_or_boundary crates_and_files schema_migration external_boundary prerequisites excluded_neighbor_scope verification_owners rollback_or_refusal pentest_question independently_shippable_units critical_model critical_model_rationale changed_path_allowlist admission_base_commit test_ids", keys, " ")
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
        independently_shippable_units critical_model \
        critical_model_rationale changed_path_allowlist \
        admission_base_commit test_ids; do
        count="$(grep -c "^${key}=" "$package" || true)"
        [ "$count" -eq 1 ] || fail "$package must contain exactly one $key"
    done
    schema="$(sed -n 's/^schema=//p' "$package")"
    stop="$(sed -n 's/^stop_id=//p' "$package")"
    generation="$(sed -n 's/^package_generation=//p' "$package")"
    status="$(sed -n 's/^status=//p' "$package")"
    units="$(sed -n 's/^independently_shippable_units=//p' "$package")"
    owner="$(sed -n 's/^authority_owner=//p' "$package")"
    crate_paths="$(sed -n 's/^crates_and_files=//p' "$package")"
    prerequisites="$(sed -n 's/^prerequisites=//p' "$package")"
    critical_model="$(sed -n 's/^critical_model=//p' "$package")"
    critical_reason="$(sed -n 's/^critical_model_rationale=//p' "$package")"
    allowlist="$(sed -n 's/^changed_path_allowlist=//p' "$package")"
    base_commit="$(sed -n 's/^admission_base_commit=//p' "$package")"
    test_ids="$(sed -n 's/^test_ids=//p' "$package")"
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
    printf '%s\n' "$prerequisites" |
        grep -Eq '^(none|(0\.[1-9][0-9]*\.0|1\.0\.0)(,(0\.[1-9][0-9]*\.0|1\.0\.0))*)$' ||
        fail "$package has malformed capability prerequisites"
    manifest_dependencies="$(awk -F '|' -v stop="$stop" '
        $1 == stop { print $4 }
    ' docs/selected_profile_manifest_v1.txt)"
    [ "$manifest_dependencies" = "$prerequisites" ] ||
        fail "$package prerequisites differ from selected-profile graph"
    [ "$critical_model" = "true" ] || [ "$critical_model" = "false" ] ||
        fail "$package has invalid critical_model decision"
    [ "$critical_reason" != "none" ] ||
        fail "$package lacks a critical-model rationale"
    if [ "$critical_model" = "true" ]; then
        grep -Fq "$stop|" "$critical" ||
            fail "$package marks critical model but lacks registry entry"
    fi
    old_ifs="$IFS"
    IFS=,
    for path in $crate_paths; do
        case "$path" in
            ""|/*|*..*|*'*'*|*'?'*)
                fail "$package has unsafe or non-exact crate/file path"
                ;;
            *)
                [ -e "$path" ] ||
                    fail "$package references missing path root $path"
                ;;
        esac
    done
    for rule in $allowlist; do
        case "$rule" in
            ""|/*|*..*|*'?'*)
                fail "$package has unsafe changed-path rule $rule"
                ;;
            */'**') ;;
            *'*'*)
                fail "$package has unsupported changed-path glob $rule"
                ;;
        esac
    done
    IFS="$old_ifs"
    printf '%s\n' "$test_ids" |
        grep -Eq '^(planned:)?VIT-TST-[A-Z0-9-]+(,(planned:)?VIT-TST-[A-Z0-9-]+)*$' ||
        fail "$package has malformed test IDs"
    if [ "$status" != "planned" ]; then
        printf '%s\n' "$base_commit" | grep -Eq '^[0-9a-f]{40}$' ||
            fail "$package lacks an exact admission base commit"
        git cat-file -e "$base_commit^{commit}" 2>/dev/null ||
            fail "$package admission base commit does not exist"
        printf '%s\n' "$test_ids" | grep -q 'planned:' &&
            fail "$package active implementation retains planned test IDs"
        old_ifs="$IFS"
        IFS=,
        for test_id in $test_ids; do
            test_status="$(awk -F '|' -v wanted="$test_id" '
                $1 == wanted { print $2 }
            ' "$registered_tests")"
            [ -n "$test_status" ] ||
                fail "$package references unregistered executable test $test_id"
            if [ "$status" != "implementing" ] &&
                [ "$test_status" != "implemented" ]; then
                fail "$package release status requires implemented test evidence for $test_id"
            fi
        done
        IFS="$old_ifs"
        if ! git diff --name-only "$base_commit"..HEAD |
            awk -v rules="$allowlist" '
            function admitted(path, entries, count, i, rule, prefix) {
                count = split(rules, entries, ",")
                for (i = 1; i <= count; i++) {
                    rule = entries[i]
                    if (rule ~ /\/\*\*$/) {
                        prefix = substr(rule, 1, length(rule) - 3)
                        if (path == prefix ||
                            index(path, prefix "/") == 1) return 1
                    } else if (path == rule) return 1
                }
                return 0
            }
            !admitted($0) { bad = 1 }
            END { exit bad }
            '; then
            fail "$package implementation diff exceeds its changed-path allowlist"
        fi
    elif [ "$base_commit" != "not-set-until-implementing" ]; then
        fail "$package planned base commit must use the explicit sentinel"
    fi
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

while IFS= read -r stop; do
    grep -R -Fq "## \`$stop\`" docs/implementation ||
        fail "critical-model registry references missing stop $stop"
done < "$critical_stops"

grep -hEo 'VIT-(INV|LAW)-[0-9]{3}' \
    docs/INVARIANT_OWNERSHIP.md docs/LAW_GENERATIONS.md |
    sort -u > "$known_controls"

awk -F '|' -v critical_file="$critical_stops" \
    -v control_file="$known_controls" -v test_file="$registered_tests" \
    -v symbol_file="$registered_symbols" '
BEGIN {
    while ((getline stop < critical_file) > 0) critical[stop] = 1
    close(critical_file)
    while ((getline control < control_file) > 0) known_control[control] = 1
    close(control_file)
    while ((getline test_row < test_file) > 0) {
        split(test_row, test_parts, "|")
        registered_test[test_parts[1]] = test_parts[2]
    }
    close(test_file)
    while ((getline owner_row < symbol_file) > 0) {
        split(owner_row, owner_parts, "|")
        registered_owner[owner_parts[1]] = 1
    }
    close(symbol_file)
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
    transition_count = split($3, transitions, ",")
    for (i = 1; i <= transition_count; i++) {
        transition = transitions[i]
        if (transition !~ /^VIT-TR-[A-Z0-9-]+$/) {
            fail(stop " has malformed transition " transition)
        }
        if (seen_transition[transition]++) {
            fail("duplicate transition registration " transition)
        }
    }
    control_count = split($4, controls, ",")
    for (i = 1; i <= control_count; i++) {
        if (!known_control[controls[i]]) {
            fail(stop " references unknown control " controls[i])
        }
    }
    for (field = 7; field <= 11; field++) {
        test_count = split($field, tests, ",")
        for (i = 1; i <= test_count; i++) {
            test = tests[i]
            if (test !~ /^VIT-MT-[0-9][0-9][0-9]-[PNMFR]$/) {
                fail(stop " has malformed model test " test)
            }
            if (seen_test[test]++) {
                fail("duplicate model-test registration " test)
            }
        }
    }
    if ($12 != "planned" && $12 != "implemented") {
        fail(stop " has invalid binding status")
    }
    if ($12 == "implemented" && $5 ~ /^planned:/) {
        fail(stop " implemented binding still has planned Rust owner")
    }
    if ($12 == "implemented" &&
        ($6 ~ /^planned:/ || $5 !~ /^crates\/[^#]+#[A-Za-z0-9_:]+$/ ||
         ($6 != "none" &&
          $6 !~ /^crates\/[^#]+#[A-Za-z0-9_:]+$/))) {
        fail(stop " implemented binding lacks resolvable workspace owners")
    }
    if ($12 == "implemented") {
        if (!registered_owner[$5]) {
            fail(stop " references unregistered Rust owner " $5)
        }
        if ($6 != "none" && !registered_owner[$6]) {
            fail(stop " references unregistered persistence owner " $6)
        }
        for (field = 7; field <= 11; field++) {
            test_count = split($field, tests, ",")
            for (i = 1; i <= test_count; i++) {
                if (registered_test[tests[i]] != "implemented") {
                    fail(stop " lacks implemented executable-test evidence " tests[i])
                }
            }
        }
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
