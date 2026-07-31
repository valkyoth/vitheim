#!/usr/bin/env sh
set -eu
set -f

scratch="$(mktemp -d /tmp/vitheim-planning-policy-tests.XXXXXX)"
trap 'rm -rf "$scratch"' EXIT

fail() {
    echo "planning policy tests: $1" >&2
    exit 1
}

cp -R docs/implementation/work_packages "$scratch/work-packages"
cp docs/implementation/dependency_supersessions_v1.txt "$scratch/supersessions"

sed 's/^prerequisites=0\.1\.0$/prerequisites=none/' \
    "$scratch/work-packages/0.2.0.work-package" \
    > "$scratch/work-packages/0.2.0.work-package.new"
mv "$scratch/work-packages/0.2.0.work-package.new" \
    "$scratch/work-packages/0.2.0.work-package"
VITHEIM_WORK_PACKAGES_DIR="$scratch/work-packages" \
    scripts/generate_selected_profile_manifest.sh \
    > "$scratch/weakened-manifest"
if VITHEIM_WORK_PACKAGES_DIR="$scratch/work-packages" \
    VITHEIM_SELECTED_MANIFEST="$scratch/weakened-manifest" \
    VITHEIM_DEPENDENCY_SUPERSESSIONS="$scratch/supersessions" \
    scripts/check_selected_profile_manifest.sh \
    > "$scratch/weakened.out" 2> "$scratch/weakened.err"; then
    fail "PackageExact dependency weakening was accepted"
fi
if ! grep -Fq 'removes declared minimum without approved supersession' \
    "$scratch/weakened.err"; then
    sed -n '1,20p' "$scratch/weakened.err" >&2
    fail "dependency weakening failed for the wrong reason"
fi

sed 's/^prerequisites=none$/prerequisites=0.1.0,0.3.0/' \
    "$scratch/work-packages/0.2.0.work-package" \
    > "$scratch/work-packages/0.2.0.work-package.new"
mv "$scratch/work-packages/0.2.0.work-package.new" \
    "$scratch/work-packages/0.2.0.work-package"
VITHEIM_WORK_PACKAGES_DIR="$scratch/work-packages" \
    scripts/generate_selected_profile_manifest.sh \
    > "$scratch/future-manifest"
if VITHEIM_WORK_PACKAGES_DIR="$scratch/work-packages" \
    VITHEIM_SELECTED_MANIFEST="$scratch/future-manifest" \
    VITHEIM_DEPENDENCY_SUPERSESSIONS="$scratch/supersessions" \
    scripts/check_selected_profile_manifest.sh \
    > "$scratch/future.out" 2> "$scratch/future.err"; then
    fail "same-or-future dependency was accepted"
fi
if ! grep -Fq 'depends on same or future stop' "$scratch/future.err"; then
    sed -n '1,20p' "$scratch/future.err" >&2
    fail "future dependency failed for the wrong reason"
fi

transition_case=0
for required_path in \
    docs/implementation/PHASE_A.md \
    docs/implementation/executable_symbol_inventory_v1.txt \
    docs/implementation/executable_test_inventory_v1.txt \
    docs/implementation/executable_test_evidence_v1.txt \
    scripts/run_0_2_0_tests.sh \
    security/test-evidence/0.2.0/**; do
    transition_case=$((transition_case + 1))
    package_dir="$scratch/work-packages-missing-transition-$transition_case"
    cp -R docs/implementation/work_packages "$package_dir"
    awk -F '=' -v removed="$required_path" '
    $1 != "changed_path_allowlist" { print; next }
    {
        count = split(substr($0, index($0, "=") + 1), paths, ",")
        output = ""
        for (i = 1; i <= count; i++) {
            if (paths[i] == removed) continue
            output = output (output == "" ? "" : ",") paths[i]
        }
        print "changed_path_allowlist=" output
    }
    ' "$package_dir/0.2.0.work-package" \
        > "$package_dir/0.2.0.work-package.new"
    mv "$package_dir/0.2.0.work-package.new" \
        "$package_dir/0.2.0.work-package"
    if VITHEIM_WORK_PACKAGES_DIR="$package_dir" \
        scripts/check_work_package_closure.sh \
        > "$scratch/missing-transition-$transition_case.out" \
        2> "$scratch/missing-transition-$transition_case.err"; then
        fail "work package without required transition path $required_path was accepted"
    fi
    if ! grep -Fq "lacks required changed path $required_path" \
        "$scratch/missing-transition-$transition_case.err"; then
        sed -n '1,20p' \
            "$scratch/missing-transition-$transition_case.err" >&2
        fail "missing transition path $required_path failed for the wrong reason"
    fi
done

cp -R docs/implementation/work_packages \
    "$scratch/work-packages-missing-crate"
sed 's#^crates_and_files=crates/vitheim,crates/vitheim-id,crates/vitheim-time,crates/vitheim-error$#crates_and_files=crates/vitheim,crates/vitheim-id,crates/vitheim-error#' \
    "$scratch/work-packages-missing-crate/0.2.0.work-package" \
    > "$scratch/work-packages-missing-crate/0.2.0.work-package.new"
mv "$scratch/work-packages-missing-crate/0.2.0.work-package.new" \
    "$scratch/work-packages-missing-crate/0.2.0.work-package"
if VITHEIM_WORK_PACKAGES_DIR="$scratch/work-packages-missing-crate" \
    scripts/check_work_package_closure.sh \
    > "$scratch/missing-crate.out" 2> "$scratch/missing-crate.err"; then
    fail "work package without its required time crate was accepted"
fi
if ! grep -Fq 'lacks required crate/file path crates/vitheim-time' \
    "$scratch/missing-crate.err"; then
    sed -n '1,20p' "$scratch/missing-crate.err" >&2
    fail "missing time crate failed for the wrong reason"
fi

cp docs/implementation/executable_symbol_inventory_v1.txt \
    "$scratch/symbols"
printf '%s\n' \
    'crates/vitheim-id#tests::bytes_round_trip|crates/vitheim-id/src/lib.rs|bytes_round_trip|implemented' \
    >> "$scratch/symbols"
cp docs/implementation/executable_test_inventory_v1.txt \
    "$scratch/tests"
printf '%s\n' \
    'VIT-TST-GUARD-N-001|crates/vitheim-id#tests::bytes_round_trip|script:scripts/missing-test-runner.sh|registered' \
    >> "$scratch/tests"
cp docs/implementation/executable_test_evidence_v1.txt \
    "$scratch/evidence"
if VITHEIM_TEST_INVENTORY="$scratch/tests" \
    VITHEIM_SYMBOL_INVENTORY="$scratch/symbols" \
    VITHEIM_TEST_EVIDENCE="$scratch/evidence" \
    scripts/check_executable_test_inventory.sh \
    > "$scratch/test.out" 2> "$scratch/test.err"; then
    fail "missing executable test runner was accepted"
fi
if ! grep -Fq 'runner is missing' "$scratch/test.err"; then
    sed -n '1,20p' "$scratch/test.err" >&2
    fail "missing test runner failed for the wrong reason"
fi

echo "planning policy guard tests: ok"
