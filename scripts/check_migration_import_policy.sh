#!/bin/sh
set -eu

canonical='active-coordinator-generation→job→candidate/barrier→authorization→ordered-domain-owner→audit/result/outbox'

fail() {
    echo "migration/import policy: $*" >&2
    exit 1
}

for file in \
    docs/implementation/PHASE_C.md \
    docs/implementation/OPTION_DECISIONS.md \
    docs/implementation/PHASE_O.md \
    docs/implementation/PRODUCTION_1_0.md \
    docs/IMPLEMENTATION_PLAN.md \
    docs/ARCHITECTURE.md \
    docs/SECURITY_CONTROLS.md \
    docs/INVARIANT_OWNERSHIP.md \
    docs/RELEASE_PLAN.md
do
    grep -Fq "$canonical" "$file" ||
        fail "$file omits the canonical activation lock order"
done

if grep -R -Fq \
    'job→candidate/barrier→ordered-owner→audit/result/outbox' \
    docs
then
    fail "obsolete activation order without coordinator generation or authorization remains"
fi

tmp_dir=$(mktemp -d)
trap 'rm -rf "$tmp_dir"' EXIT HUP INT TERM

for symbol in \
    MigrationImportCoordinatorGenerationV1 \
    MigrationImportCoordinatorBootstrapAuthorizationV1 \
    MigrationImportCoordinatorBootstrapWorkBudgetV1 \
    MigrationImportCoordinatorBootstrapResultV1 \
    MigrationImportRegistryHistoryV1 \
    MigrationImportRegistryHistoryWorkBudgetV1 \
    MigrationImportRegistryHistoryAppendDispositionV1 \
    AppendMigrationImportRegistryHistory \
    MigrationImportRegistryHistoryAppendResultV1
do
    cp docs/LAW_SEMANTIC_REALIZATIONS.md "$tmp_dir/realizations"
    sed -i "s/\`$symbol\`, //g" "$tmp_dir/realizations"
    if scripts/check_law_semantic_realizations.sh \
        docs/LAW_GENERATIONS.md \
        "$tmp_dir/realizations" \
        docs/implementation >/dev/null 2>&1
    then
        fail "semantic gate accepts VIT-LAW-009 without $symbol"
    fi
done

echo "migration/import policy passed"
