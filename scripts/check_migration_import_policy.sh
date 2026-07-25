#!/bin/sh
set -eu

canonical='active-coordinator-generation→job→candidate/barrier→authorization→ordered-domain-owner→history-obligation/lineage-disposition→audit/result/outbox'

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

if grep -R -Fq \
    'ordered-domain-owner→history-obligation→audit/result/outbox' \
    docs
then
    fail "obsolete activation order without the atomic lineage disposition remains"
fi

for obsolete in \
    'scope, action discriminator' \
    'descriptor and action, exact authorization identity/digest' \
    'recovery action and exact authorization identity/digest'
do
    if grep -Fq "$obsolete" docs/implementation/PHASE_C.md
    then
        fail "Phase C retains duplicate action authority: $obsolete"
    fi
done

for requirement in \
    'RetryAppend authority can never create either waiver or abandonment terminal' \
    'requires a fresh Abandon authorization' \
    'use only remaining lineage capacity' \
    'No lineage-budget amendment or increase operation is supported through `1.0.0`' \
    'Pending` atomically creates both the' \
    'No per-attempt precharge may commit without its cumulative charge' \
    'sole authoritative action discriminator' \
    'Returns typed `NotAdmitted` without a write' \
    'Returns `Expired` without converting expiry to revocation' \
    'unknown action discriminants' \
    'An active legal hold categorically rejects Waive or Abandon' \
    'Remote emission has no effect'
do
    grep -Fq "$requirement" docs/implementation/PHASE_C.md ||
        fail "Phase C omits recovery requirement: $requirement"
done

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
    MigrationImportRegistryHistoryLineageDispositionV1 \
    MigrationImportRegistryHistoryNoExecutableLineageV1 \
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
    MigrationImportRegistryHistoryRecoveryActionV1 \
    MigrationImportRegistryHistoryRecoveryAuthorizationStateV1 \
    AdmitMigrationImportRegistryHistoryRecoveryAuthorization \
    MigrationImportRegistryHistoryRecoveryAuthorizationAdmissionResultV1 \
    ExpireMigrationImportRegistryHistoryRecoveryAuthorization \
    MigrationImportRegistryHistoryRecoveryAuthorizationExpiryResultV1 \
    MigrationImportRegistryHistoryRecoveryAuthorizationOutcomeV1 \
    MigrationImportRegistryHistoryRecoveryAuthorizationNotAdmitted \
    MigrationImportRegistryHistoryRecoveryAuthorizationConflict \
    MigrationImportRegistryHistoryRecoveryAuthorizationRevocationIntentV1 \
    MigrationImportRegistryHistoryRecoveryAuthorizationRevocationSequenceKeyV1 \
    ApplyMigrationImportRegistryHistoryRecoveryAuthorizationRevocation \
    MigrationImportRegistryHistoryRecoveryAuthorizationRevocationResultV1 \
    MigrationImportRegistryHistoryRecoveryAuthorizationRevocationConflict \
    MigrationImportRegistryHistoryRecoveryLineageBudgetV1 \
    MigrationImportRegistryHistoryRecoveryPlatformHardMaximumV1 \
    MigrationImportRegistryHistoryLineageStateMissing \
    MigrationImportRegistryHistorySuccessorBudgetExhausted \
    MigrationImportRegistryHistoryWaiverRecordV1 \
    MigrationImportRegistryHistoryAbandonmentRecordV1 \
    ResolveMigrationImportRegistryHistoryRecovery \
    MigrationImportRegistryHistoryRecoveryResultV1 \
    MigrationImportRegistryHistoryRecoveryResultPayloadV1 \
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
