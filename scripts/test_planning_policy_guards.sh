#!/usr/bin/env sh
set -eu

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
