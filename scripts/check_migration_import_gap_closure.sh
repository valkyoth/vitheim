#!/bin/sh
set -eu

phase_c='docs/implementation/PHASE_C.md'
semantic='docs/LAW_SEMANTIC_REALIZATIONS.md'
ownership='docs/INVARIANT_OWNERSHIP.md'

fail() {
    echo "migration/import gap closure: $*" >&2
    exit 1
}

for phrase in \
    'Pending, Retired or EvidenceUnavailable' \
    'does not depend on the lost root' \
    'permits a later old-custody import only' \
    'does not block independently provisioned empty bootstrap' \
    'RetireDeploymentIdentity operation kind' \
    'closed ActivateManifest/AbortManifest/' \
    'CAS also installs the unique immutable Activated, Aborted or' \
    'no accepted history contains two terminal meanings' \
    'journal is a read projection of the governance-fence sequence' \
    'cost profile is governed state, not a freely replaceable signed document' \
    'analytically over the complete declared artifact-kind and canonical-' \
    'sampled or golden-vector comparison alone is insufficient' \
    'WeakenBackendStorageCostProfile' \
    'complete re-cost checkpoint cover every affected child' \
    'never recomputes that sum in an unbounded startup transaction' \
    'VerificationPending, Ready or Fenced' \
    'unavailable for allocation, release, cost-profile activation' \
    'cannot recreate the verification, reset work or rescan' \
    'startup never scans'
do
    grep -Fq "$phrase" "$phase_c" ||
        fail "Phase C omits required closure: $phrase"
done

if grep -Fq \
    'closed ActivateManifest/RotateProfile/EmergencyDistrust' \
    "$phase_c"
then
    fail "obsolete three-operation governance fence remains"
fi

for symbol in \
    MigrationImportRegistryHistoryDeploymentIdentityRetirementV1 \
    MigrationImportRegistryHistoryDeploymentIdentityRetirementAuthorityPortV1 \
    MigrationImportRegistryHistoryDeploymentIdentityRetirementStateV1 \
    RetireMigrationImportRegistryHistoryDeploymentIdentity \
    MigrationImportRegistryHistoryManifestExternalTransitionKeyV1 \
    MigrationImportRegistryHistoryManifestExternalTransitionTerminalReceiptV1 \
    MigrationImportRegistryHistoryManifestExternalTransitionTerminalStatusV1 \
    AbortMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestExternalTransition \
    SealMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPermanentlyUnresolved \
    MigrationImportRegistryHistoryBackendStorageCostProfileLineageV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileCurrentHeadV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileTrustAnchorV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileTransitionV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileTransitionStateV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileActivationRecordV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileCheckpointV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileHighWatermarkV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileSuccessorClassificationV1 \
    BootstrapMigrationImportRegistryHistoryBackendStorageCostProfile \
    PrepareMigrationImportRegistryHistoryBackendStorageCostProfileTransition \
    ActivateMigrationImportRegistryHistoryBackendStorageCostProfileTransition \
    RejectMigrationImportRegistryHistoryBackendStorageCostProfileTransition \
    CheckpointMigrationImportRegistryHistoryBackendStorageCostProfileLineage \
    RestoreMigrationImportRegistryHistoryBackendStorageCostProfileLineage \
    MigrationImportRegistryHistoryRecoveryCapacityParentAggregateV1 \
    MigrationImportRegistryHistoryRecoveryCapacityParentMembershipCommitmentV1 \
    MigrationImportRegistryHistoryRecoveryCapacityParentCheckpointV1 \
    MigrationImportRegistryHistoryRecoveryCapacityParentVerificationV1 \
    MigrationImportRegistryHistoryRecoveryCapacityParentVerificationStateV1 \
    MigrationImportRegistryHistoryRecoveryCapacityParentVerificationCursorV1 \
    MigrationImportRegistryHistoryRecoveryCapacityParentVerificationWorkBudgetV1 \
    VerifyMigrationImportRegistryHistoryRecoveryCapacityParent
do
    grep -Fq "$symbol" "$phase_c" ||
        fail "Phase C omits symbol: $symbol"
    grep -Fq "$symbol" "$semantic" ||
        fail "semantic realization omits symbol: $symbol"
done

for row in \
    MigrationImportRegistryHistoryDeploymentIdentityRetirementRow \
    MigrationImportRegistryHistoryManifestExternalTransitionTerminalReceiptRow \
    MigrationImportRegistryHistoryManifestExternalTransitionTerminalStatusRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileLineageRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileCurrentHeadRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileTransitionRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileActivationRecordRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileCheckpointRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileHighWatermarkRow \
    MigrationImportRegistryHistoryRecoveryCapacityParentAggregateRow \
    MigrationImportRegistryHistoryRecoveryCapacityParentMembershipCommitmentRow \
    MigrationImportRegistryHistoryRecoveryCapacityParentCheckpointRow \
    MigrationImportRegistryHistoryRecoveryCapacityParentVerificationRow \
    MigrationImportRegistryHistoryRecoveryCapacityParentVerificationCursorRow \
    MigrationImportRegistryHistoryRecoveryCapacityParentVerificationWorkBudgetRow
do
    grep -Fq "$row" "$ownership" ||
        fail "invariant ownership omits storage row: $row"
done

for document in \
    docs/RELEASE_PLAN.md \
    docs/AUTHORITY_REVIEWS.md \
    docs/ROADMAP_GAP_DISPOSITIONS.md \
    docs/implementation/OPTION_DECISIONS.md \
    docs/implementation/PHASE_O.md \
    docs/implementation/PRODUCTION_1_0.md
do
    grep -Fq 'EvidenceUnavailable' "$document" ||
        fail "$document omits retirement decision"
    grep -Fq 'terminal' "$document" ||
        fail "$document omits terminal mutual exclusion"
    grep -Fq 'cost' "$document" ||
        fail "$document omits governed cost succession"
    grep -Fq 'VerificationPending' "$document" ||
        fail "$document omits bounded parent verification"
done

echo "migration/import gap closure policy passed"
