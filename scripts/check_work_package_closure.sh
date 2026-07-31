#!/usr/bin/env sh
set -eu
set -f

closures="${VITHEIM_WORK_PACKAGE_CLOSURES:-docs/implementation/work_package_closure_v1.txt}"
packages="${VITHEIM_WORK_PACKAGES_DIR:-docs/implementation/work_packages}"
rows="$(mktemp /tmp/vitheim-work-package-closures.XXXXXX)"
package_files="$(mktemp /tmp/vitheim-work-package-files.XXXXXX)"
trap 'rm -f "$rows" "$package_files"' EXIT

fail() {
    echo "work package closure: $1" >&2
    exit 1
}

awk -F '|' '
NR == 1 {
    if ($0 != "schema|WorkPackageClosureV1") fail("wrong schema")
    next
}
NR == 2 {
    if ($0 != "generation|2") fail("wrong generation")
    next
}
NR == 3 {
    if ($0 != "stop_id|required_package_generation|required_crates_and_files|required_changed_paths|required_test_ids|required_verification_tokens|required_authority_owner") {
        fail("wrong header")
    }
    next
}
{
    if (NF != 7) {
        fail("row has wrong field count")
        next
    }
    if ($1 !~ /^(0\.[1-9][0-9]*\.0|1\.0\.0)$/ ||
        $2 !~ /^[1-9][0-9]*$/ ||
        $3 !~ /^crates\/[A-Za-z0-9_.\/-]+(,crates\/[A-Za-z0-9_.\/-]+)*$/ ||
        $4 !~ /^[A-Za-z0-9_.*\/-]+(,[A-Za-z0-9_.*\/-]+)*$/ ||
        $5 !~ /^VIT-TST-[A-Z0-9-]+(,VIT-TST-[A-Z0-9-]+)*$/ ||
        $6 !~ /^[a-z0-9-]+(,[a-z0-9-]+)*$/ ||
        $7 !~ /^[a-z0-9_-]+$/) {
        fail("malformed closure row for " $1)
    }
    if (seen[$1]++) fail("duplicate closure row " $1)
    print
}
END { exit failed }
function fail(message) {
    print "work package closure: " message > "/dev/stderr"
    failed = 1
}
' "$closures" > "$rows"

same_set() {
    expected="$1"
    actual="$2"
    awk -v expected="$expected" -v actual="$actual" '
    BEGIN {
        expected_count = split(expected, expected_values, /[ ,]+/)
        actual_count = split(actual, actual_values, /[ ,]+/)
        if (expected_count != actual_count) exit 1
        for (i = 1; i <= expected_count; i++) {
            if (expected_values[i] == "" || expected_seen[expected_values[i]]++) {
                exit 1
            }
        }
        for (i = 1; i <= actual_count; i++) {
            if (actual_values[i] == "" || actual_seen[actual_values[i]]++ ||
                !(actual_values[i] in expected_seen)) {
                exit 1
            }
        }
    }
    '
}

admits_path() {
    rules="$1"
    target="$2"
    prior_ifs="$IFS"
    IFS=,
    for rule in $rules; do
        case "$rule" in
            */'**')
                prefix="${rule%/**}"
                case "$target" in
                    "$prefix"|"$prefix"/*)
                        IFS="$prior_ifs"
                        return 0
                        ;;
                esac
                ;;
            "$target")
                IFS="$prior_ifs"
                return 0
                ;;
        esac
    done
    IFS="$prior_ifs"
    return 1
}

while IFS='|' read -r stop minimum_generation required_crates required_paths \
    required_tests required_verification required_owner; do
    package="$packages/$stop.work-package"
    [ -f "$package" ] || fail "$stop lacks its required work package"

    generation="$(sed -n 's/^package_generation=//p' "$package")"
    crates="$(sed -n 's/^crates_and_files=//p' "$package")"
    paths="$(sed -n 's/^changed_path_allowlist=//p' "$package")"
    tests="$(sed -n 's/^test_ids=//p' "$package" | sed 's/planned://g')"
    verification="$(sed -n 's/^verification_owners=//p' "$package")"
    owner="$(sed -n 's/^authority_owner=//p' "$package")"

    [ "$generation" = "$minimum_generation" ] ||
        fail "$stop package generation differs from its closure contract"
    [ "$owner" = "$required_owner" ] ||
        fail "$stop has the wrong bounded authority owner"
    for protected in docs/implementation/work_package_closure_v1.txt \
        scripts/check_work_package_closure.sh; do
        if admits_path "$paths" "$protected"; then
            fail "$stop implementation may alter closure authority $protected"
        fi
    done

    same_set "$required_crates" "$crates" ||
        fail "$stop crate/file closure differs from its exact contract"
    same_set "$required_paths" "$paths" ||
        fail "$stop changed-path closure differs from its exact contract"
    same_set "$required_tests" "$tests" ||
        fail "$stop test-ID closure differs from its exact contract"
    same_set "$required_verification" "$verification" ||
        fail "$stop verification closure differs from its exact contract"
done < "$rows"

find "$packages" -type f -name '*.work-package' -print |
    LC_ALL=C sort > "$package_files"
[ -s "$package_files" ] || fail "work-package directory is empty"
while IFS= read -r package; do
    stop="$(basename "$package" .work-package)"
    count="$(awk -F '|' -v wanted="$stop" '
        $1 == wanted { count++ }
        END { print count + 0 }
    ' "$rows")"
    [ "$count" -eq 1 ] ||
        fail "$stop package lacks exactly one closure row"
done < "$package_files"

echo "work package closure: ok"
