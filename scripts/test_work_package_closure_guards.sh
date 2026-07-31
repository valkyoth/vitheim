#!/usr/bin/env sh
set -eu
set -f

scratch="$(mktemp -d /tmp/vitheim-work-package-closure-tests.XXXXXX)"
trap 'rm -rf "$scratch"' EXIT

fail() {
    echo "work package closure tests: $1" >&2
    exit 1
}

case_number=0
prepare_case() {
    case_number=$((case_number + 1))
    case_dir="$scratch/packages-$case_number"
    case_package="$case_dir/0.2.0.work-package"
    case_closures="docs/implementation/work_package_closure_v1.txt"
    cp -R docs/implementation/work_packages "$case_dir"
}

expect_rejection() {
    expected="$1"
    label="$2"
    if VITHEIM_WORK_PACKAGES_DIR="$case_dir" \
        VITHEIM_WORK_PACKAGE_CLOSURES="$case_closures" \
        scripts/check_work_package_closure.sh \
        > "$scratch/case-$case_number.out" \
        2> "$scratch/case-$case_number.err"; then
        fail "$label was accepted"
    fi
    if ! grep -Fq "$expected" "$scratch/case-$case_number.err"; then
        sed -n '1,20p' "$scratch/case-$case_number.err" >&2
        fail "$label failed for the wrong reason"
    fi
}

expect_acceptance() {
    label="$1"
    if ! VITHEIM_WORK_PACKAGES_DIR="$case_dir" \
        VITHEIM_WORK_PACKAGE_CLOSURES="$case_closures" \
        scripts/check_work_package_closure.sh \
        > "$scratch/case-$case_number.out" \
        2> "$scratch/case-$case_number.err"; then
        sed -n '1,20p' "$scratch/case-$case_number.err" >&2
        fail "$label was rejected"
    fi
}

replace_field() {
    field="$1"
    replacement="$2"
    awk -F '=' -v field="$field" -v replacement="$replacement" '
    $1 == field { print field "=" replacement; next }
    { print }
    ' "$case_package" > "$case_package.new"
    mv "$case_package.new" "$case_package"
}

append_csv_field() {
    field="$1"
    addition="$2"
    current="$(sed -n "s/^${field}=//p" "$case_package")"
    replace_field "$field" "$current,$addition"
}

remove_csv_field_value() {
    field="$1"
    removed="$2"
    awk -F '=' -v field="$field" -v removed="$removed" '
    $1 != field { print; next }
    {
        count = split(substr($0, index($0, "=") + 1), values, ",")
        output = ""
        for (i = 1; i <= count; i++) {
            if (values[i] == removed) continue
            output = output (output == "" ? "" : ",") values[i]
        }
        print field "=" output
    }
    ' "$case_package" > "$case_package.new"
    mv "$case_package.new" "$case_package"
}

for required_path in \
    docs/implementation/PHASE_A.md \
    docs/implementation/executable_symbol_inventory_v1.txt \
    docs/implementation/executable_test_inventory_v1.txt \
    docs/implementation/executable_test_evidence_v1.txt \
    scripts/run_0_2_0_tests.sh \
    security/test-evidence/0.2.0/**; do
    prepare_case
    remove_csv_field_value changed_path_allowlist "$required_path"
    expect_rejection \
        'changed-path closure differs from its exact contract' \
        "missing transition path $required_path"
done

prepare_case
remove_csv_field_value crates_and_files crates/vitheim-time
expect_rejection \
    'crate/file closure differs from its exact contract' \
    'missing time crate'

prepare_case
append_csv_field crates_and_files crates/vitheim-budget
expect_rejection \
    'crate/file closure differs from its exact contract' \
    'extra crate'

prepare_case
append_csv_field crates_and_files crates/vitheim-time
expect_rejection \
    'crate/file closure differs from its exact contract' \
    'duplicate crate'

prepare_case
replace_field crates_and_files \
    'crates/vitheim-error,crates/vitheim-time,crates/vitheim-id,crates/vitheim'
expect_acceptance 'normalized crate reordering'

for extra_path in docs/ARCHITECTURE.md crates/vitheim-budget/**; do
    prepare_case
    append_csv_field changed_path_allowlist "$extra_path"
    expect_rejection \
        'changed-path closure differs from its exact contract' \
        "extra changed path $extra_path"
done

prepare_case
append_csv_field test_ids planned:VIT-TST-EXTRA-P-001
expect_rejection \
    'test-ID closure differs from its exact contract' \
    'extra test ID'

prepare_case
tests="$(sed -n 's/^test_ids=//p' "$case_package" |
    sed 's/VIT-TST-ID-F-001/VIT-TST-ID-X-001/')"
replace_field test_ids "$tests"
expect_rejection \
    'test-ID closure differs from its exact contract' \
    'substituted test ID'

prepare_case
verification="$(sed -n 's/^verification_owners=//p' "$case_package")"
replace_field verification_owners "$verification unrelated-owner"
expect_rejection \
    'verification closure differs from its exact contract' \
    'extra verification owner'

prepare_case
replace_field package_generation 3
expect_rejection \
    'package generation differs from its closure contract' \
    'package generation ahead of closure'

prepare_case
cp "$case_package" "$case_dir/0.3.0.work-package"
sed 's/^stop_id=0\.2\.0$/stop_id=0.3.0/' \
    "$case_dir/0.3.0.work-package" \
    > "$case_dir/0.3.0.work-package.new"
mv "$case_dir/0.3.0.work-package.new" \
    "$case_dir/0.3.0.work-package"
expect_rejection \
    '0.3.0 package lacks exactly one closure row' \
    'package without closure row'

prepare_case
case_closures="$scratch/closures-without-package.txt"
cp docs/implementation/work_package_closure_v1.txt "$case_closures"
awk -F '|' 'BEGIN { OFS = "|" }
$1 == "0.2.0" { $1 = "0.3.0"; print }
' docs/implementation/work_package_closure_v1.txt >> "$case_closures"
expect_rejection \
    '0.3.0 lacks its required work package' \
    'closure row without package'

echo "work package closure guard tests: ok"
