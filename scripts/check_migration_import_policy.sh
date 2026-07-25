#!/bin/sh
set -eu

canonical='active-coordinator-generation→job→candidate/barrier→authorization→ordered-domain-owner→history-obligation→audit/result/outbox'

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

if grep -R -Fq \
    'ordered-domain-owner→audit/result/outbox' \
    docs
then
    fail "obsolete activation order without the atomic history obligation remains"
fi

tmp_dir=$(mktemp -d)
trap 'rm -rf "$tmp_dir"' EXIT HUP INT TERM

for symbol in \
    MigrationImportCoordinatorGenerationV1 \
    MigrationImportCoordinatorBootstrapAuthorizationV1 \
    MigrationImportCoordinatorBootstrapBeginAuthorizationV1 \
    AdmitMigrationImportCoordinatorBootstrapBeginAuthorization \
    MigrationImportCoordinatorBootstrapBeginAuthorizationRevokedBeforeAdmission \
    BeginMigrationImportCoordinatorBootstrapDrain \
    MigrationImportCoordinatorBootstrapBeginResultV1 \
    MigrationImportCoordinatorBootstrapBeginConflict \
    MigrationImportCoordinatorHandoffAuthorizationV1 \
    AdmitMigrationImportCoordinatorHandoffAuthorization \
    MigrationImportCoordinatorHandoffAuthorizationRevokedBeforeAdmission \
    MigrationImportCoordinatorBootstrapCancellationAuthorizationV1 \
    AdmitMigrationImportCoordinatorBootstrapCancellationAuthorization \
    MigrationImportCoordinatorBootstrapCancellationAuthorizationRevokedBeforeAdmission \
    CancelMigrationImportCoordinatorBootstrap \
    MigrationImportCoordinatorBootstrapCancellationResultV1 \
    MigrationImportCoordinatorBootstrapCancellationConflict \
    MigrationImportCoordinatorBootstrapAuthorizationRevocationIntentV1 \
    MigrationImportCoordinatorBootstrapAuthorizationRevocationSequenceKeyV1 \
    ApplyMigrationImportCoordinatorBootstrapAuthorizationRevocation \
    MigrationImportCoordinatorBootstrapAuthorizationRevocationResultV1 \
    MigrationImportCoordinatorBootstrapAuthorizationRevocationConflict \
    MigrationImportCoordinatorBootstrapCheckpointV1 \
    MigrationImportCoordinatorSuccessorVerificationReceiptV1 \
    MigrationImportCoordinatorBootstrapWorkBudgetV1 \
    MigrationImportCoordinatorBootstrapResultV1 \
    MigrationImportRegistryHistoryV1 \
    MigrationImportRegistryHistoryAppendObligationV1 \
    MigrationImportRegistryHistoryArchiveHeadV1 \
    MigrationImportRegistryHistoryAppendCheckpointV1 \
    MigrationImportRegistryHistoryNoHistory \
    MigrationImportRegistryHistoryNotRequested \
    MigrationImportRegistryHistoryWorkBudgetV1 \
    MigrationImportRegistryHistoryAppendDispositionV1 \
    MigrationImportRegistryHistoryManualRecoveryPending \
    MigrationImportRegistryHistoryWaivedFenced \
    MigrationImportRegistryHistoryAbandonedWithEvidence \
    AppendMigrationImportRegistryHistory \
    MigrationImportRegistryHistoryAppendResultV1 \
    MigrationImportRegistryHistoryRecoveryAuthorizationV1 \
    AdmitMigrationImportRegistryHistoryRecoveryAuthorization \
    ResolveMigrationImportRegistryHistoryRecovery \
    MigrationImportRegistryHistoryRecoveryResultV1 \
    MigrationImportRegistryHistoryRecoveryConflict
do
    cp docs/LAW_SEMANTIC_REALIZATIONS.md "$tmp_dir/realizations"
    sed -i "s/$symbol/MUTATED_SYMBOL/g" "$tmp_dir/realizations"
    if scripts/check_law_semantic_realizations.sh \
        docs/LAW_GENERATIONS.md \
        "$tmp_dir/realizations" \
        docs/implementation >/dev/null 2>&1
    then
        fail "semantic gate accepts VIT-LAW-009 without $symbol"
    fi
done

if grep -Fq 'ManualRecoveryRequired' \
    docs/LAW_SEMANTIC_REALIZATIONS.md \
    docs/implementation/PHASE_C.md \
    docs/implementation/OPTION_DECISIONS.md \
    docs/implementation/PHASE_O.md \
    docs/implementation/PRODUCTION_1_0.md
then
    fail "terminal ManualRecoveryRequired remains in an authoritative protocol"
fi

echo "migration/import policy passed"
