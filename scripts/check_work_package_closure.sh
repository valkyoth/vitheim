#!/usr/bin/env sh
set -eu
set -f

closures="${VITHEIM_WORK_PACKAGE_CLOSURES:-docs/implementation/work_package_closure_v1.txt}"
packages="${VITHEIM_WORK_PACKAGES_DIR:-docs/implementation/work_packages}"
rows="$(mktemp /tmp/vitheim-work-package-closures.XXXXXX)"
trap 'rm -f "$rows"' EXIT

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
    if ($0 != "generation|1") fail("wrong generation")
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

contains_csv() {
    case ",$1," in
        *,"$2",*) return 0 ;;
        *) return 1 ;;
    esac
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

    [ "$generation" -ge "$minimum_generation" ] ||
        fail "$stop package generation predates its closure contract"
    [ "$owner" = "$required_owner" ] ||
        fail "$stop has the wrong bounded authority owner"
    for protected in docs/implementation/work_package_closure_v1.txt \
        scripts/check_work_package_closure.sh; do
        if admits_path "$paths" "$protected"; then
            fail "$stop implementation may alter closure authority $protected"
        fi
    done

    old_ifs="$IFS"
    IFS=,
    for required in $required_crates; do
        contains_csv "$crates" "$required" ||
            fail "$stop lacks required crate/file path $required"
    done
    for required in $required_paths; do
        contains_csv "$paths" "$required" ||
            fail "$stop lacks required changed path $required"
    done
    for required in $required_tests; do
        contains_csv "$tests" "$required" ||
            fail "$stop lacks required test ID $required"
    done
    for required in $required_verification; do
        case " $verification " in
            *" $required "*) ;;
            *) fail "$stop lacks verification owner/token $required" ;;
        esac
    done
    IFS="$old_ifs"
done < "$rows"

echo "work package closure: ok"
