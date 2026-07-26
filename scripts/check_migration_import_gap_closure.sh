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
    'Absent, RevokedBeforeAdmission, Issued, Consumed,' \
    'absence is corruption and never means Operational' \
    'external-send start and local' \
    'Insufficient complete' \
    'permits a later old-custody import only' \
    'does not block independently provisioned empty bootstrap' \
    'RetireDeploymentIdentity operation kind' \
    'closed ActivateManifest/AbortManifest/' \
    'CAS also installs the unique immutable Activated, Aborted or' \
    'no accepted history contains two terminal meanings' \
    'journal is a read projection of the governance-fence sequence' \
    'cost profile is governed state, not a freely replaceable signed document' \
    'analytically over the complete declared' \
    'artifact-kind and canonical-size domain' \
    'never enumerates every possible ceiling/allocation breakpoint' \
    'ValidNonWeakening, ValidWeakening or InvalidOrUnverifiable' \
    'InvalidOrUnverifiable and terminal no-write rejection' \
    'No policy-transition' \
    'authority may override semantic invalidity' \
    'sampled or golden-vector comparison alone is' \
    'WeakenBackendStorageCostProfile' \
    'campaign-owned RecostPending bucket' \
    'sum(campaign_recost_pending)' \
    'aggregate_campaign_recost_pending' \
    'decreases AggregateCampaignRecostPending and increases' \
    'receives no successor credit because RecostPending does not' \
    'binds one specific authenticated folded-log high-' \
    'campaign epoch cuts the parent ledger' \
    'at most one nonterminal campaign' \
    'slot remains occupied while Fenced' \
    'complete legal state table is' \
    'Fenced+Open denies allocations' \
    'Closed never reopens' \
    'only transition out of Fenced' \
    'prior Preflighting returns to' \
    'never completes the remaining snapshot in the recovery transaction' \
    'cannot authorize a refund or activation' \
    'allocation and release transaction locks and rechecks the active-campaign slot' \
    'hard entry, byte and work maxima' \
    'scans the child set or replays the complete post-cut log' \
    'separate pending' \
    'stable campaign-derived inverse' \
    'Retry exhaustion' \
    'closed post-cut high-watermark and fold checkpoint' \
    'unapplied RecostPending and zero unaccounted tail' \
    'zero pending successor charges' \
    'still-Issued, unexpired and' \
    'None of those effects commits' \
    'shadow data/index bytes' \
    'predecessor writers are fenced' \
    'workspace_total = workspace_available + workspace_reserved' \
    'Workspace rows are campaign-owned' \
    'exactly once only after authenticated' \
    'Permanent quarantine is a destructive availability' \
    'Absent, RevokedBeforeAdmission, Issued, Consumed, ExpiredUnused or' \
    'may consume the still-Issued authorization' \
    'deployment-retirement fence is the first rank' \
    'campaign slot follows its parent ledger' \
    'or none of them' \
    'never recomputes that sum in an unbounded startup transaction' \
    'VerificationPending, Ready or Fenced' \
    'unavailable for allocation, release, cost-profile activation' \
    'cannot recreate the verification, reset work or rescan' \
    'The reservation covers' \
    'the complete fixed snapshot, not merely one worker quantum' \
    'before that checkpoint may become a restorable head' \
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
    MigrationImportRegistryHistoryDeploymentIdentityRetirementAuthorizationV1 \
    MigrationImportRegistryHistoryDeploymentIdentityRetirementStateV1 \
    MigrationImportRegistryHistoryDeploymentRetirementFenceV1 \
    MigrationImportRegistryHistoryDeploymentIdentityRetirementCompletionReserveV1 \
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
    MigrationImportRegistryHistoryBackendStorageCostProfileClassifierWorkBudgetV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignStateV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileActiveRecostCampaignSlotV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignEpochV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignFenceV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignFenceCheckpointV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignTerminalCheckpointV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignRecoveryIntentV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignCursorV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignWorkBudgetV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignFixedSnapshotCheckpointV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPostCutLogV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPostCutHighWatermarkV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPostCutFoldCursorV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPostCutFoldCheckpointV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfilePendingSuccessorChargeV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignChildDeltaTransferV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignCompletionReserveV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceReservationV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceStateV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCursorV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePhysicalMutationHighWatermarkV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCapacityLedgerV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceAggregateV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCheckpointV1 \
    BuildMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspace \
    SynchronizeMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspace \
    VerifyMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspace \
    CleanupMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspace \
    QuarantineMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspace \
    SettleMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspace \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceSettlementV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceOperationResultV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceOperationConflict \
    StartMigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaign \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignStartResultV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignStartConflict \
    ApplyMigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaign \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignApplyResultV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignApplyConflict \
    FinalizeMigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaign \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignFinalizeResultV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignFinalizeConflict \
    ActivateMigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaign \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignActivationResultV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignActivationConflict \
    AbortMigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaign \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignAbortResultV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignConflict \
    RecoverMigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaign \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignRecoveryResultV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignRecoveryConflict \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationStateV1 \
    AdmitMigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorization \
    RevokeMigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorization \
    ExpireMigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorization \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationResultV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationConflict \
    PermanentlyQuarantineMigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaign \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineResultV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineConflict \
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
    MigrationImportRegistryHistoryRecoveryCapacityParentVerificationReservationV1 \
    VerifyMigrationImportRegistryHistoryRecoveryCapacityParent
do
    grep -Fq "$symbol" "$phase_c" ||
        fail "Phase C omits symbol: $symbol"
    grep -Fq "$symbol" "$semantic" ||
        fail "semantic realization omits symbol: $symbol"
done

for row in \
    MigrationImportRegistryHistoryDeploymentIdentityRetirementRow \
    MigrationImportRegistryHistoryDeploymentIdentityRetirementAuthorizationRow \
    MigrationImportRegistryHistoryDeploymentRetirementFenceRow \
    MigrationImportRegistryHistoryDeploymentIdentityRetirementCompletionReserveRow \
    MigrationImportRegistryHistoryManifestExternalTransitionTerminalReceiptRow \
    MigrationImportRegistryHistoryManifestExternalTransitionTerminalStatusRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileLineageRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileCurrentHeadRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileTransitionRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileActivationRecordRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileCheckpointRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileHighWatermarkRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileClassifierWorkBudgetRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileActiveRecostCampaignSlotRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignEpochRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignFenceRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignFenceCheckpointRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignTerminalCheckpointRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignRecoveryIntentRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignCursorRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignWorkBudgetRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignFixedSnapshotCheckpointRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPostCutLogRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPostCutHighWatermarkRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPostCutFoldCursorRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPostCutFoldCheckpointRow \
    MigrationImportRegistryHistoryBackendStorageCostProfilePendingSuccessorChargeRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignTransferRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignInverseTransferRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignStartResultRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignApplyResultRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignFinalizeResultRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignActivationResultRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignAbortResultRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignRecoveryResultRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationResultRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineResultRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceReservationRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceStateRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCursorRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePhysicalMutationHighWatermarkRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCapacityLedgerRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceAggregateRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceOperationResultRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceSettlementRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCheckpointRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignCompletionReserveRow \
    MigrationImportRegistryHistoryRecoveryCapacityParentAggregateRow \
    MigrationImportRegistryHistoryRecoveryCapacityParentMembershipCommitmentRow \
    MigrationImportRegistryHistoryRecoveryCapacityParentCheckpointRow \
    MigrationImportRegistryHistoryRecoveryCapacityParentVerificationRow \
    MigrationImportRegistryHistoryRecoveryCapacityParentVerificationCursorRow \
    MigrationImportRegistryHistoryRecoveryCapacityParentVerificationWorkBudgetRow \
    MigrationImportRegistryHistoryRecoveryCapacityParentVerificationReservationRow
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
