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
    'sum(workspace_encumbrances)' \
    'aggregate_campaign_recost_pending' \
    'aggregate_workspace_encumbrance' \
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
    'every old writer is fenced' \
    'workspace_original_total = workspace_reserved_unoccupied' \
    'workspace_parent_encumbrance =' \
    'workspace_original_total - workspace_released' \
    'original total equals the exact initial parent transfer and is immutable' \
    'WorkspaceReleased starts at zero, can only increase' \
    'leg can never be fractionally settled' \
    'reservation atomically decreases ParentAvailable' \
    'MigrationWorkspaceParentInverseTransferV1' \
    'Workspace rows are campaign-owned' \
    'may proceed when the slot is None or names a newer campaign' \
    'old Closed fence remains addressable' \
    'one exact shared logical/physical cut' \
    'workspace remains Catchup' \
    'Complete pairs with mutation-fence Finalizing' \
    'physical high-watermark equals that' \
    'exact campaign/workspace checkpoint' \
    'MigrationWorkspaceSettlementCheckpointV1' \
    'CleanupAdmissionLaneV1' \
    'CleanupContentionBudgetV1' \
    'foreground-acquisition' \
    'finite protected release burst' \
    'CleanupBackpressure' \
    'CleanupBacklogV1' \
    'CleanupHardMaximumV1' \
    'No successful activation can' \
    'precharged positive' \
    'empty yield or stale claimant cannot count' \
    'DeletionOutcomeUnknown' \
    'CleanupReconciling' \
    'CleanupOriginV1' \
    'CleanupTerminalReferenceV1' \
    'origin-matched' \
    'PermanentRetentionAuthorizationV1' \
    'PermanentRetentionAuthorizationStateV1' \
    'PermanentRetentionAuthorizationRevocationIntentV1' \
    'PermanentRetentionAuthorizationOutcomeV1' \
    'PermanentRetentionAuthorizationOperationConflictV1' \
    'PermanentRetentionPoolV1' \
    'PermanentlyRetained' \
    'CustodyReleaseAuthorizationReferenceV1' \
    'CustodyReleaseSettlementV1' \
    'ControlLineageReleaseAuthorizationV1' \
    'ControlLineageReleaseAuthorizationStateV1' \
    'BeginRelease authorization' \
    'CommitCustodyRelease authorization' \
    'CustodyReleaseBundleHardMaximumV1' \
    'ascending canonical campaign-ID byte order' \
    'Per-workspace bounds alone' \
    'BeginMigrationImportRegistryHistoryCorruptionControlLineageRelease' \
    'CommitMigrationImportRegistryHistoryCorruptionControlLineageCustodyRelease' \
    'ArchivePublicationReceiptV1' \
    'non-dispatchable command-family identifier' \
    'Publishers/storage adapters' \
    'advance the authoritative archive' \
    'head-without-deletion and deletion-without-head' \
    'Staged, Verified, ConsumedByCommit' \
    'TransferredToCustodyLedger or Unknown' \
    'Unknown retains PermanentlyRetained' \
    'Only a verified, idempotent terminal' \
    'exactly one closed physical-disposition receipt' \
    'converts that reservation into the matching custody member' \
    'TransferPending, ConsumedByCustodyMember' 'cannot create destination bytes from an unreserved request' 'need not be numerically identical' \
    'StageMigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublication' 'Verified→ConsumedByCommit' 'ConsumedByCommit and Collected are' \
    'definitely-never-transferred' 'compression and encryption behavior' 'OrphanGcEligible or Collected' \
    'RevokeMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorization' \
    'RevokeMigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorization' \
    '| Current state | Admission | Expiry | Applied issuer revocation | Consumption |' \
    'No-write NotAdmitted' \
    'issuer-side Revoke command is not' \
    'advances WorkspaceReleased exactly to' \
    'broader lineage release does not separately credit' \
    'cannot return the workspace to cleanup' \
    'exactly once only after authenticated' \
    'Permanent quarantine is a destructive availability' \
    'Absent, RevokedBeforeAdmission, Issued, Consumed, ExpiredUnused or' \
    'may consume the still-Issued authorization' \
    'is issuer-side only and creates signed' \
    'target-scoped, non-wrapping' \
    'may commit the destination effect through' \
    'Absent→RevokedBeforeAdmission' \
    'PermanentQuarantineAuthorizationOutcomeV1' \
    'first terminal result rather than' \
    '| Consumed | Returns the stored Consumed' \
    '| ExpiredUnused | Returns the stored Expired' \
    'reread/reapply; transport' \
    'broader custody-safe parent-release' \
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
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceOriginalTotalV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceReleasedV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceParentTransferV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceParentInverseTransferV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCleanupAdmissionLaneV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCleanupContentionBudgetV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCleanupBacklogV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCleanupHardMaximumV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCleanupBackpressure \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCleanupOriginV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCleanupTerminalReferenceV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceDeletionOutcomeV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCleanupReconciliationV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationStateV1 \
    AdmitMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorization \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationAdmissionResultV1 \
    ExpireMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorization \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationExpiryResultV1 \
    RevokeMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorization \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationRevocationIntentResultV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationRevocationIntentConflict \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationRevocationIntentV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationRevocationSequenceKeyV1 \
    ApplyMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationRevocation \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationRevocationInboxV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationRevocationTombstoneV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationRevocationResultV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationOutcomeV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationOperationConflictV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationNotAdmitted \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionPoolV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionHardMaximumV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyReleaseAuthorizationReferenceV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyReleasePhysicalDispositionV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyReleasePhysicalDispositionReceiptV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyReleasePhysicalDispositionTombstoneV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityCostProfileV1 MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityCostProfileBindingV1 MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityCostProfileReservationDependencyV1 MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityCostProfileDrainFenceV1 MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityTransferStreamingLimitV1 MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityReservationV1 MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityReservationStateV1 \
    ReconcileMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityReservation MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityReservationReconciliationResultV1 MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityReservationReconciliationConflict ExtendMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityReservation MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityReservationExtensionResultV1 MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityReservationExtensionConflict \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityLedgerV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityMemberV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityTransferV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyReleaseSettlementV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyReleaseCheckpointV1 \
    MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseBundleHardMaximumV1 \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseActionV1 \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationV1 \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationStateV1 \
    AdmitMigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorization \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationAdmissionResultV1 \
    ExpireMigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorization \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationExpiryResultV1 \
    RevokeMigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorization \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationRevocationIntentResultV1 \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationRevocationIntentConflict \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationRevocationIntentV1 \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationRevocationSequenceKeyV1 \
    ApplyMigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationRevocation \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationRevocationInboxV1 \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationRevocationTombstoneV1 \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationRevocationResultV1 \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationOutcomeV1 \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationOperationConflictV1 \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationNotAdmitted \
    BeginMigrationImportRegistryHistoryCorruptionControlLineageRelease \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseBeginPayloadV1 \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseBeginResultV1 \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseBeginConflict MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleasePlanV1 MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleasePlanHeadV1 MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitAttemptV1 MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitEligibilityDispositionV1 MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitAuthorizationFenceV1 MarkMigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitEligible MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitEligibilityResultV1 MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitEligibilityConflict ReplanMigrationImportRegistryHistoryCorruptionControlLineageCustodyRelease MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseReplanPayloadV1 MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseReplanResultV1 MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseReplanConflict AbandonMigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitAttempt MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitAttemptAbandonPayloadV1 MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitAttemptAbandonResultV1 MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitAttemptAbandonConflict \
    MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationStateV1 \
    MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationReceiptV1 \
    MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationBudgetV1 StageMigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublication MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationStageResultV1 MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationStageConflict VerifyMigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublication MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationVerifyResultV1 MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationVerifyConflict \
    MarkMigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationOrphan MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationMarkOrphanResultV1 MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationMarkOrphanConflict FinalizeMigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationGc MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationGcResultV1 MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationGcConflict \
    CommitMigrationImportRegistryHistoryCorruptionControlLineageCustodyRelease \
    MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitPayloadV1 \
    MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitResultV1 \
    MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitConflict \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCheckpointV1 \
    BuildMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspace \
    SynchronizeMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspace \
    VerifyMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspace \
    CleanupMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspace \
    ReconcileMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCleanup \
    QuarantineMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspace \
    PermanentlyRetainMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspace \
    ReleaseMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustody \
    SettleMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspace \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceSettlementV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceSettlementCheckpointV1 \
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
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationRevocationIntentV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationRevocationSequenceV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationRevocationInboxV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationRevocationTombstoneV1 \
    ApplyMigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationRevocation \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationRevocationResultV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationRevocationConflict \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationOutcomeV1 \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationOperationConflictV1 \
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
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationRevocationSequenceRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationRevocationInboxRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationRevocationTombstoneRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationRevocationResultRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationResultRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineResultRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceReservationRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceStateRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCursorRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePhysicalMutationHighWatermarkRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCapacityLedgerRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceAggregateRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceOriginalTotalRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceReleasedRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceParentTransferRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceParentInverseTransferRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCleanupAdmissionLaneRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCleanupContentionBudgetRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCleanupBacklogRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCleanupHardMaximumRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCleanupReconciliationRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationRevocationIssuerSequenceRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationRevocationIntentResultRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationRevocationInboxRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationRevocationTombstoneRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationOperationResultRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionPoolRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionHardMaximumRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyReleasePhysicalDispositionReceiptRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyReleasePhysicalDispositionTombstoneRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityCostProfileHeadRow MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityCostProfileReservationDependencyRow MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityCostProfileDrainFenceRow MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityReservationRow MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityReservationReconciliationResultRow MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityReservationExtensionResultRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityLedgerRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityMemberRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityTransferRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyReleaseSettlementRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyReleaseCheckpointRow \
    MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseBundleHardMaximumRow \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationRow \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationRevocationIssuerSequenceRow \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationRevocationIntentResultRow \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationRevocationInboxRow \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationRevocationTombstoneRow \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationOperationResultRow \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseBeginOperationResultRow MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleasePlanRow MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleasePlanHeadRow MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitAttemptRow MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitAuthorizationFenceRow MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitEligibilityResultRow MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseReplanOperationResultRow MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitAttemptAbandonResultRow \
    MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationStateRow \
    MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationReceiptRow \
    MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationBudgetRow MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationStageResultRow MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationVerifyResultRow \
    MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationMarkOrphanResultRow MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationGcResultRow \
    MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitOperationResultRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceOperationResultRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceSettlementRow \
    MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceSettlementCheckpointRow \
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
