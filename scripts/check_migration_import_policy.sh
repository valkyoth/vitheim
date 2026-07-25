#!/bin/sh
set -eu

canonical='active-coordinator-generation→job→candidate/barrier→authorization→ordered-domain-owner→clearance-anchor-source-manifest-head→corruption-control-reserve→history-obligation/corruption-control-lineage/corruption-fence/clearance-anchor-registry/lineage-disposition→retention/legal-hold→audit/result/outbox'
history_order='active-coordinator-generation→corruption-control-reserve→history-obligation→corruption-control-lineage→corruption-fence→lineage-disposition→recovery-authorization→clearance-anchor-source-manifest-head→clearance-anchor-source-manifest-authorization→corruption-clearance-anchor-registry→corruption-clearance-scope→corruption-clearance-authorization→corruption-clearance-attempt→corruption-rebuild→corruption-rebuild-rejection-authorization→archive-head→history/idempotency→recovery-lineage-budget→attempt/successor-budget→retention/legal-hold→audit/result/outbox'

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

for file in \
    docs/implementation/PHASE_C.md \
    docs/implementation/OPTION_DECISIONS.md \
    docs/implementation/PHASE_O.md \
    docs/implementation/PRODUCTION_1_0.md
do
    grep -Fq "$history_order" "$file" ||
        fail "$file omits the universal history lock order"
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

if grep -R -Fq \
    'ordered-domain-owner→history-obligation/lineage-disposition→audit/result/outbox' \
    docs
then
    fail "obsolete activation order without retention/legal-hold locking remains"
fi

if grep -R -Fq \
    'ordered-domain-owner→history-obligation/lineage-disposition→retention/legal-hold' \
    docs
then
    fail "obsolete activation order without corruption-fence genesis remains"
fi

if grep -R -Fq \
    'ordered-domain-owner→history-obligation/corruption-fence/lineage-disposition→retention/legal-hold' \
    docs
then
    fail "obsolete activation order without anchor source-manifest/genesis remains"
fi

if grep -R -Fq \
    'ordered-domain-owner→clearance-anchor-source-manifest→history-obligation/corruption-fence/clearance-anchor-registry/lineage-disposition' \
    docs
then
    fail "obsolete activation order without manifest head or control reserve remains"
fi

if grep -R -Fq \
    'corruption-control-reserve→history-obligation/corruption-fence/clearance-anchor-registry/lineage-disposition' \
    docs
then
    fail "obsolete activation order without obligation-wide corruption-control lineage remains"
fi

for obsolete_order in \
    'history-obligation→corruption-fence→archive-head→history/idempotency→recovery-lineage-budget' \
    'history-obligation→lineage-disposition→recovery-lineage-budget→corruption-fence' \
    'history-obligation→corruption-fence→lineage-disposition→recovery-authorization→corruption-clearance-authorization→archive-head' \
    'history-obligation→corruption-fence→lineage-disposition→recovery-authorization→corruption-clearance-anchor-registry→corruption-clearance-authorization→corruption-clearance-attempt' \
    'active-coordinator-generation→history-obligation→corruption-fence→lineage-disposition→recovery-authorization→clearance-anchor-source-manifest→corruption-clearance-anchor-registry' \
    'active-coordinator-generation→corruption-control-reserve→history-obligation→corruption-fence→lineage-disposition'
do
    if grep -R -Fq "$obsolete_order" docs
    then
        fail "obsolete history lock order remains: $obsolete_order"
    fi
done

if grep -R -Fq \
    'externally retained head commitment and/or witness' \
    docs
then
    fail "open-ended clearance anchor and/or semantics remain"
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
    'An active hold rejects NotRequested whenever declining archival' \
    'Activation alone creates Healthy generation zero' \
    'Absence, rollback,' \
    'holds a budget while waiting for the fence' \
    'MigrationImportRegistryHistoryCorruptionClearanceAuthorizationV1' \
    'destination-ratcheted state' \
    'fence-wide coordination lineage' \
    'remaining fence-lifetime budget' \
    'No adapter may lazily initialize it' \
    'only absent/Uninitialized-to-generation-zero path' \
    'greatest authenticated Active activation record' \
    'externally retained checkpoint high-' \
    'No local manifest, activation-record or' \
    'Prepared→ExternallyPublishedVerified→Active' \
    'locks registry,' \
    'no stranded Open scope' \
    'destructive-authority protocols, not signed blobs' \
    'Remote issuance or revocation has no effect' \
    'MigrationImportRegistryHistoryCorruptionControlReserveV1' \
    'MigrationImportRegistryHistoryCorruptionControlLineageV1' \
    'maximum episode count' \
    'cannot replace it, replenish it or reset its counters' \
    'sets the lineage PermanentlyQuarantined' \
    'ReleaseMigrationImportRegistryHistoryCorruptionControlLineage' \
    'Ordinary work cannot borrow the' \
    'A detector or' \
    'all ordinary capacity is exhausted' \
    'full expected source set from the current manifest' \
    'profile selects a non-empty mandatory class set' \
    'normative same-row' \
    'precharges its bounded worst-case quantum' \
    'partial typed' \
    'remaining capacity is derived only by checked' \
    'one internally consistent authenticated snapshot' \
    'Property/model tests prove each' \
    'keyed by old obligation identity and exact Fenced generation' \
    'one parent row' \
    'PermanentlyRejected' \
    'Malformed, unauthenticated, stale,' \
    'Permanent rejection requires an independently issued/admitted' \
    'revocation issuer identity' \
    'target-covering expiry/not-after' \
    'authentic but older bundle' \
    'The only v1 fallback' \
    'Corruption is an observed durable state' \
    'exact history-disposition tag' \
    'the fence is obligation-scoped and cannot quarantine a' \
    'MigrationImportRegistryHistoryCorruptionClearanceUnprovable' \
    'different valid operations, not changed material' \
    'CAS loss, the loser rereads the row and reapplies this table' \
    'Remote emission has no effect'
do
    grep -Fq "$requirement" docs/implementation/PHASE_C.md ||
        fail "Phase C omits recovery requirement: $requirement"
done

tmp_dir=$(mktemp -d)
trap 'rm -rf "$tmp_dir"' EXIT HUP INT TERM

for symbol in \
    MigrationImportCoordinatorGenerationV1 \
    MigrationImportActivationHistoryDispositionConflict \
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
    MigrationImportRegistryHistoryNotRequestedRecordV1 \
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
    MigrationImportRegistryHistoryRecoveryAuthorizationOperationConflictV1 \
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
    MigrationImportRegistryHistoryCorruptionFenceV1 \
    MigrationImportRegistryHistoryCorruptionFenceStateV1 \
    MigrationImportRegistryHistoryCorruptionFenceHealthy \
    MigrationImportRegistryHistoryCorruptionFenceFenced \
    MigrationImportRegistryHistoryCorruptionFenceClearedAfterRestore \
    FenceMigrationImportRegistryHistoryCorruption \
    MigrationImportRegistryHistoryCorruptionResultV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAuthorizationV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAuthorizationAuthorityPortV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAuthorizationStateV1 \
    AdmitMigrationImportRegistryHistoryCorruptionClearanceAuthorization \
    MigrationImportRegistryHistoryCorruptionClearanceAuthorizationAdmissionResultV1 \
    ExpireMigrationImportRegistryHistoryCorruptionClearanceAuthorization \
    MigrationImportRegistryHistoryCorruptionClearanceAuthorizationExpiryResultV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAuthorizationRevocationIntentV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAuthorizationRevocationSequenceKeyV1 \
    ApplyMigrationImportRegistryHistoryCorruptionClearanceAuthorizationRevocation \
    MigrationImportRegistryHistoryCorruptionClearanceAuthorizationRevocationResultV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAuthorizationOutcomeV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAuthorizationConflict \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSetV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestAuthorityPortV1 \
    AdvanceMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifest \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestAdvanceResultV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestConflict \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionAuthorizationV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestLineageV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestLineageStateV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCurrentHeadV1 \
    InitializeMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifest \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestActivationRecordV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestTransitionV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestTransitionStateV1 \
    PrepareMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestTransition \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestTransitionResultV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointAuthorityPortV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublicationProfileV1 \
    PublishAndVerifyMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpoint \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublicationReceiptV1 \
    ActivateMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestTransition \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestTransitionConflict \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestHistoryUnavailableOrRolledBack \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestInitializationResultV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestInitializationConflict \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionActionV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionAuthorizationStateV1 \
    AdmitMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionAuthorization \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionAuthorizationAdmissionResultV1 \
    ExpireMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionAuthorization \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionAuthorizationExpiryResultV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionAuthorizationRevocationIntentV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionAuthorizationRevocationSequenceKeyV1 \
    ApplyMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionAuthorizationRevocation \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionAuthorizationRevocationResultV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionAuthorizationOutcomeV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionAuthorizationConflict \
    MigrationImportRegistryHistoryCorruptionClearanceScopeV1 \
    MigrationImportRegistryHistoryCorruptionClearanceScopeDispositionV1 \
    MigrationImportRegistryHistoryCorruptionClearanceScopeHardMaximumV1 \
    MigrationImportRegistryHistoryCorruptionClearanceScopeAnchorRebindingResultV1 \
    MigrationImportRegistryHistoryCorruptionControlReserveV1 \
    MigrationImportRegistryHistoryCorruptionControlCapacityProfileV1 \
    MigrationImportRegistryHistoryCorruptionControlPlatformHardMaximumV1 \
    MigrationImportRegistryHistoryCorruptionControlLineageV1 \
    MigrationImportRegistryHistoryCorruptionControlLineageDispositionV1 \
    MigrationImportRegistryHistoryCorruptionControlLineageHardMaximumV1 \
    MigrationImportRegistryHistoryCorruptionControlMinimumFutureCapacityV1 \
    MigrationImportRegistryHistoryCorruptionControlEpisodeV1 \
    MigrationImportRegistryHistoryCorruptionControlLineageCheckpointV1 \
    MigrationImportRegistryHistoryCorruptionControlReserveSettlementV1 \
    ReleaseMigrationImportRegistryHistoryCorruptionControlLineage \
    MigrationImportRegistryHistoryCorruptionControlLineageReleaseResultV1 \
    MigrationImportRegistryHistoryCorruptionControlLineageConflict \
    MigrationImportRegistryHistoryCorruptionClearanceScopeConflict \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorRegistryV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorRegistryAuthorityPortV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorRegistryAdvanceResultV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorRegistryAdvanceConflict \
    AdvanceMigrationImportRegistryHistoryCorruptionClearanceAnchorRegistry \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorCollectionReceiptV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAnchorSetStale \
    MigrationImportRegistryHistoryCorruptionClearanceVerificationBudgetV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAttemptV1 \
    MigrationImportRegistryHistoryCorruptionClearanceAttemptStateV1 \
    BeginOrResumeMigrationImportRegistryHistoryCorruptionClearanceAttempt \
    MigrationImportRegistryHistoryCorruptionClearanceAttemptResultV1 \
    MigrationImportRegistryHistoryCorruptionClearanceEvidenceTemporarilyUnavailable \
    MigrationImportRegistryHistoryCorruptionClearanceBudgetExceeded \
    MigrationImportRegistryHistoryCorruptionClearanceAuthorizationLost \
    MigrationImportRegistryHistoryCorruptionClearanceCounterJoinV1 \
    MigrationImportRegistryHistoryCorruptionClearanceStateJoinV1 \
    RestoreMigrationImportRegistryHistoryAtomicBundle \
    MigrationImportRegistryHistoryCorruptionClearanceResultV1 \
    MigrationImportRegistryHistoryCorruptionClearanceUnprovable \
    RebuildMigrationImportRegistryHistoryUnderSuccessorCoordinator \
    MigrationImportRegistryHistoryCorruptionRebuildRecordV1 \
    MigrationImportRegistryHistoryCorruptionRebuildProposalAttemptV1 \
    MigrationImportRegistryHistoryCorruptionRebuildProposalNotAdmitted \
    MigrationImportRegistryHistoryCorruptionRebuildRejectionAuthorizationV1 \
    MigrationImportRegistryHistoryCorruptionRebuildRejectionAuthorizationStateV1 \
    AdmitMigrationImportRegistryHistoryCorruptionRebuildRejectionAuthorization \
    MigrationImportRegistryHistoryCorruptionRebuildRejectionAuthorizationAdmissionResultV1 \
    ExpireMigrationImportRegistryHistoryCorruptionRebuildRejectionAuthorization \
    MigrationImportRegistryHistoryCorruptionRebuildRejectionAuthorizationExpiryResultV1 \
    MigrationImportRegistryHistoryCorruptionRebuildRejectionAuthorizationRevocationIntentV1 \
    MigrationImportRegistryHistoryCorruptionRebuildRejectionAuthorizationRevocationSequenceKeyV1 \
    ApplyMigrationImportRegistryHistoryCorruptionRebuildRejectionAuthorizationRevocation \
    MigrationImportRegistryHistoryCorruptionRebuildRejectionAuthorizationRevocationResultV1 \
    MigrationImportRegistryHistoryCorruptionRebuildRejectionAuthorizationOutcomeV1 \
    MigrationImportRegistryHistoryCorruptionRebuildRejectionAuthorizationConflict \
    PermanentlyRejectMigrationImportRegistryHistoryCorruptionRebuild \
    MigrationImportRegistryHistoryCorruptionRebuildRejectionResultV1 \
    MigrationImportRegistryHistoryCorruptionRebuildRejectionConflict \
    MigrationImportRegistryHistoryCorruptionRebuildStateV1 \
    MigrationImportRegistryHistoryCorruptionRebuildResultV1 \
    MigrationImportRegistryHistoryCorruptionRebuildConflict \
    MigrationImportRegistryHistoryCorruptionConflict \
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

if grep -Fq \
    'LineageCorrupt(MigrationImportRegistryHistoryCorruptionResultV1)' \
    docs/implementation/PHASE_C.md
then
    fail "corruption remains misclassified as a changed-material conflict"
fi

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
