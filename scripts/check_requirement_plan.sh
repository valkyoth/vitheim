#!/usr/bin/env sh
set -eu

failed=0

require_text() {
    file="$1"
    expected="$2"
    label="$3"
    if ! grep -Fq "$expected" "$file"; then
        echo "requirement plan: missing semantic anchor '$label' in $file" >&2
        failed=1
    fi
}

require_text docs/EVIDENCE_AND_ROADMAP_GOVERNANCE.md \
    'stable `VIT-REQ-*` registry and' \
    'stable exhaustive requirement ownership registry'
require_text docs/implementation/REQUIREMENT_AND_INTEGRATION_COMPLETIONS.md \
    'one primary implementation stop' \
    'one primary requirement implementation owner'
require_text docs/IMPLEMENTATION_PLAN.md \
    'admission record is not a dependency-policy exception' \
    'implementation admission is not dependency authorization'
require_text docs/implementation/REQUIREMENT_AND_INTEGRATION_COMPLETIONS.md \
    'manual/generic-import-only for `1.0.0`' \
    'truthful cloud-native discovery limitation'
require_text docs/implementation/ROADMAP_COHERENCE_COMPLETIONS.md \
    'stable source anchor' \
    'stable requirement source anchors'
require_text docs/implementation/ROADMAP_COHERENCE_COMPLETIONS.md \
    'owner policy selects repository-wide dependency-free or' \
    'early dependency-law support decision'
require_text docs/implementation/ROADMAP_COHERENCE_COMPLETIONS.md \
    'certifier creates no service, DTO, route, or error mapping' \
    'application services precede external API freeze'
require_text docs/implementation/ROADMAP_COHERENCE_COMPLETIONS.md \
    '0.120.8` — Late-Domain Authorization Contribution Certification' \
    'chronological late-domain integration'
require_text docs/implementation/ROADMAP_COHERENCE_COMPLETIONS.md \
    '0.30.23` — Stable Domain Manifest Core' \
    'stable domain manifest core'
require_text docs/implementation/ROADMAP_COHERENCE_COMPLETIONS.md \
    '0.30.24` — Contribution Reference And Generation Safety' \
    'contribution composition and version safety'
require_text docs/implementation/ROADMAP_COHERENCE_COMPLETIONS.md \
    '0.30.25` — Contribution Deferral And Product-State Gates' \
    'bounded contribution deferral'
require_text docs/implementation/ROADMAP_COHERENCE_COMPLETIONS.md \
    '0.30.26` — Domain Event Ownership And Compatibility Gate' \
    'domain event ownership gate'
require_text docs/implementation/ROADMAP_COHERENCE_COMPLETIONS.md \
    '0.30.27` — Asynchronous Contract Ownership And Compatibility Gate' \
    'asynchronous contract ownership gate'
require_text docs/implementation/ROADMAP_COHERENCE_COMPLETIONS.md \
    '0.30.28` — Domain Retirement Contract And Prospective Gate' \
    'domain retirement contract'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.30.29` — Domain Retirement Authority And Crash Recovery' \
    'domain retirement authority and crash recovery'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.5` — Deployment Tenant-Membership Retirement Cut' \
    'deployment retirement membership cut'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.6` — Deployment Retirement Plan Approval And Campaign Admission' \
    'deployment retirement plan approval and campaign admission'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    'one-shot plan-consumption guard' \
    'one-shot exact-cut plan consumption'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.7` — Deployment Retirement Plan Succession And Resume Authority' \
    'deployment retirement plan succession and resume authority'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    'platform-capped cumulative campaign-lineage budget that never resets' \
    'successor cumulative budget cannot reset'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.8` — Post-Cut Domain Guard And Topology Handoff' \
    'post-cut guard and topology handoff'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`PostCutDomainAbsenceReceiptV1`' \
    'authoritative post-cut domain absence receipt'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    'broad-fence release is idempotent cleanup and cannot' \
    'narrow guard precedes broad fence release'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.9` — Campaign Protection Root And Successor Integration' \
    'campaign protection root and successor integration'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`CampaignProtectionStateRootV1`' \
    'canonical campaign protection state root'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    'ancestor of the current plan and the immutable' \
    'ancestor-issued coverage receipt validity'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.10` — Deployment-Wide Domain Retirement Reconciliation' \
    'deployment-wide retirement reconciliation'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`NeverPresentVerified(PostCutDomainAbsenceReceiptV1)`' \
    'never-present verified coverage is not retirement'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`CampaignRetirementTerminalManifestV1`' \
    'clean non-clean and nonterminal aggregation'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.11` — Non-Clean Residual Retirement Obligation Handoff' \
    'non-clean residual obligation handoff'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`HandoffPreparing → HandoffDispatching → HandoffReconciling →' \
    'partition-safe residual handoff process manager'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`ResidualRetirementObligationManifestV1`' \
    'immutable residual handoff membership'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.12` — Residual Retirement Obligation Lineage Evolution' \
    'residual obligation lineage evolution'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`ResidualRetirementMembershipRootV1`' \
    'immutable residual retirement membership root'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`ResidualRetirementStateHeadV1`' \
    'authenticated residual retirement state head'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.13` — Residual Transition Delivery Cut' \
    'residual transition delivery cut'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`ResidualTransitionDeliveryCutV1`' \
    'sealed residual transition cut'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`ResidualTransitionDeliveryBlocked`' \
    'visible residual delivery blocking'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    'source-sequence-to-parent acknowledgement' \
    'partition source acknowledgement proof'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`CanonicalEmptyResidualStateV1`' \
    'canonical clean residual tuple'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`ConsumedByTakeover`' \
    'absorbing takeover cut consumption'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`ConsumedByReinstall`' \
    'absorbing reinstall cut consumption'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.14` — Residual Mutation Safety Classification And Emergency Invalidation' \
    'residual mutation safety classification'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`ResidualMutationClassV1`' \
    'closed residual mutation classes'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`ResidualSafetyEpochV1`' \
    'source-local safety epoch'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`PartitionCandidateStatusReceiptV1`' \
    'current partition candidate status'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.15` — Permanent Guard Takeover Authorization' \
    'permanent guard takeover authorization'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`PermanentDomainGuardTakeoverAuthorizationV1`' \
    'exact permanent guard takeover authorization'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`DeploymentDomainGuardSlotVersionV1`' \
    'target-local permanent guard slot'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.16` — Permanent Guard Takeover And Campaign Completion' \
    'permanent guard takeover and classified completion'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`PermanentDomainGuardTransferReceiptV1`' \
    'permanent domain guard transfer receipt'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    'non-borrowable terminalization reserve' \
    'protected completion capacity'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.17` — Candidate-Control Retention Capacity Transfer' \
    'candidate-control retention capacity transfer'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`CandidateControlRetentionReceiptV1`' \
    'funded candidate-control retention receipt'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    'original release reservation = released controls + successor-retained controls' \
    'retained-control capacity conservation'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.18` — Takeover Delivery-Barrier Release Reconciliation' \
    'takeover barrier release reconciliation'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`TakeoverBarrierReleaseManifestV1`' \
    'takeover barrier release manifest'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.19` — Campaign Retirement Archive And Cleanup Reconciliation' \
    'archive-safe campaign cleanup'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`CampaignRetirementArchiveCheckpointV1`' \
    'authenticated retirement archive checkpoint'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`CleanupEvidenceUnavailable`' \
    'truthful cleanup uncertainty'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    'authoritative archive replay head' \
    'archive replay head before hot deletion'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.20` — Retained Campaign Namespace Safety Authorization' \
    'retained namespace safety authority'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`RetainedCampaignNamespaceSafetyReceiptV1`' \
    'typed retained namespace safety receipt'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`ReinstallEligibilityV1`' \
    'reinstall eligibility created at final completion'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.21` — Partition-Fenced Reinstall Evaluation' \
    'partition-fenced reinstall evaluation'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`ReinstallPartitionEvaluationReceiptV1`' \
    'authenticated partition evaluation receipt'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`ReinstallEvaluationRootV1`' \
    'complete reinstall evaluation root'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`RevalidationRequired`' \
    'mutation invalidates reinstall evaluation'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    'zero-member `ReinstallEvaluationRootV1`' \
    'canonical clean reinstall evaluation'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.22` — Reinstall Admission Candidate Lifecycle Linearization' \
    'shared reinstall admission candidate lifecycle'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`ReinstallAdmissionCandidateLifecycleV1`' \
    'typed shared admission candidate lifecycle'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`AdmissionAbortFenced`' \
    'linearized admission abort fence'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`AdmissionQuarantineFenced`' \
    'intermediate quarantine lifecycle fence'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    'closed authoritative adjacency relation' \
    'explicit lifecycle adjacency table'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    'generation. Final acceptance versus abort' \
    'activation and abort share one generation CAS'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.23` — Reinstall Partition Activation Admission' \
    'source-partition activation admission'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`AdmitReinstallCandidateActivationV1`' \
    'source-local activation-admission command'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`PartitionActivationAdmissionReceiptV1 { Accepted | Rejected | Unknown }`' \
    'typed partition activation-admission outcome'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`ReinstallPartitionAdmissionRootV1`' \
    'complete partition activation-admission root'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    'ActivationProposedNonOperational' \
    'non-operational activation proposal'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.24` — Successor-Restriction Bridge Ownership And Capacity Transfer' \
    'successor-restriction bridge ownership transfer'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`SuccessorRestrictionBridgeOwnershipReceiptV1`' \
    'typed successor-restriction bridge ownership receipt'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    'admission bridge reservation = operational successor bridges' \
    'admission bridge capacity conservation'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    'zero-partition candidate emits a domain-separated' \
    'canonical zero-member bridge ownership root'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`PrepareReinstallCandidateActivationV1`' \
    'typed activation preparation command'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    'CASes `PartitionAdmissionComplete → ActivationPrepared`' \
    'root-bound activation preparation CAS'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.25` — Reinstall Admission Abort And Supersession' \
    'partial reinstall admission abort and supersession'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`DisposeReinstallAdmissionCandidateV1`' \
    'deterministic admission-candidate disposition command'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`ReinstallAdmissionDispositionReceiptV1`' \
    'typed partition admission disposition receipt'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`ReinstallAdmissionDispositionRootV1`' \
    'complete admission disposition root'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`AdmissionSupersessionReceiptV1`' \
    'typed admission supersession receipt'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    'timeout is neither rejection nor absence' \
    'unknown admission remains fail closed'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    'zero-member `ReinstallAdmissionDispositionRootV1`' \
    'canonical zero-member admission disposition root'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.26` — Permanent-Unknown Admission Recovery Policy Decision' \
    'permanent unknown admission recovery decision'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`UnknownAdmissionRecoveryPolicyV1`' \
    'typed permanent unknown recovery policy'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`TerminalUnavailable` or `QuarantineRecoveryEnabled`' \
    'closed permanent unknown recovery options'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.27` — Quarantined Unknown-Admission Catastrophe Recovery' \
    'conditional unknown admission catastrophe quarantine'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`QuarantinedUnknownAdmissionResidualV1`' \
    'conservative unknown admission residual owner'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`UnknownAdmissionQuarantineRootV1`' \
    'complete unknown admission quarantine root'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    'Unknown remains unknown.' \
    'quarantine never reclassifies unknown'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`AdmissionQuarantineFenced → AdmissionQuarantined`' \
    'quarantine completion CAS after durable root'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.28` — Unknown-Restriction Enforcement Scope Coverage' \
    'unknown-restriction enforcement scope coverage'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`UnknownRestrictionCoverageRootV1`' \
    'complete unknown-restriction coverage root'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`WholeTenantDomainRestrictionV1`' \
    'whole-tenant-domain restriction fallback'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.29` — Conservative Unknown-Restriction Enforcement' \
    'conservative unknown-restriction enforcement'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`UnknownRestrictionTopV1`' \
    'maximal unknown restriction'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`QuarantinedUnknownRestrictionRootV1`' \
    'authoritative quarantined unknown-restriction root'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`QuarantinedUnknownRestrictionAdmissionPermitV1`' \
    'unknown-restriction admission permit'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.30` — Quarantine Replacement Evaluation Lineage' \
    'quarantine replacement evaluation lineage'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`BeginQuarantineReplacementEvaluationV1`' \
    'typed quarantine replacement evaluation command'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`QuarantineReplacementGenesisReservationV1`' \
    'one-shot quarantine replacement genesis reservation'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`QuarantineReplacementEvaluationLineageV1`' \
    'typed replacement evaluation lineage'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`QuarantineReplacementEvaluationCurrentReceiptV1`' \
    'current replacement evaluation receipt'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    'budgets are cumulative, canonical and' \
    'cumulative replacement evaluation budgets'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    'permanently terminal for the current product' \
    'permanent replacement evaluation exhaustion'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.31` — Quarantine Replacement Successor Lifecycle Genesis' \
    'quarantine replacement successor lifecycle genesis'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`CreateQuarantineReplacementSuccessorLifecycleV1`' \
    'typed replacement successor lifecycle command'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`QuarantineReplacementGenesisReceiptV1`' \
    'typed quarantine replacement genesis receipt'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.32` — Reinstall Guard Supersession Consumption' \
    'final guard supersession consumption'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`ReinstallGenesisAuthorityV1`' \
    'tagged reinstall genesis authority'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`InitialGenesis' \
    'initial reinstall genesis branch'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`QuarantineReplacementGenesis' \
    'quarantine replacement genesis branch'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`ReinstallBarrierReleaseManifestV1`' \
    'dual reinstall control release manifest'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.33` — Reinstall Barrier And Evaluation-Fence Release Reconciliation' \
    'reinstall control release reconciliation'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.51.34` — Governed Unknown-Restriction Lowering' \
    'governed unknown-restriction lowering'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`UnknownRestrictionLoweringAuthorizationV1`' \
    'destination-admitted restriction-lowering authority'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`UnknownRestrictionLoweringBridgePreparedRootV1`' \
    'complete restriction-lowering bridge root'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`ActivateUnknownRestrictionLoweringV1`' \
    'atomic restriction-lowering activation command'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`PreOperationalUnknownRestrictionLoweringReceiptV1`' \
    'pre-operational restriction-lowering receipt'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`OperationalUnknownRestrictionLoweringReceiptV1`' \
    'operational restriction-lowering receipt'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    'True cancellation exists only before the first child fence' \
    'campaign cancellation versus pause boundary'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    'expired/released cut can never become valid after restore' \
    'released cut restore non-revival'
require_text docs/implementation/ROADMAP_COHERENCE_COMPLETIONS.md \
    '`RetiredWithIrrecoverableLoss`' \
    'irrecoverable loss is distinct from verified retirement'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    'never an optional/wildcard tenant' \
    'closed tenant versus deployment retirement scope'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    'Final `DeploymentDomainRetirementManifestV1` preserves `Clean` or `NonClean`' \
    'final deployment retirement preserves clean classification'
require_text docs/implementation/ROADMAP_COHERENCE_COMPLETIONS.md \
    'authoritative async family through `0.18.10`' \
    'complete async realization prerequisite'
require_text docs/implementation/ROADMAP_COHERENCE_COMPLETIONS.md \
    'typed, reviewed `NotApplicable` record' \
    'typed contribution-kind not-applicable disposition'
require_text docs/implementation/ROADMAP_COHERENCE_COMPLETIONS.md \
    '0.51.3` — Tenant-Surface Reference Extension And Backfill' \
    'authoritative tenant-surface references'
require_text docs/implementation/ROADMAP_COHERENCE_COMPLETIONS.md \
    '0.51.4` — Tenant-Surface Contribution Certification' \
    'immediate tenant-surface certification'
require_text docs/implementation/ROADMAP_COHERENCE_COMPLETIONS.md \
    '0.140.28` — Minimum Hosted Production Profile Go/No-Go' \
    'hosted production feasibility gate'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '0.145.4` — Domain Retirement And Historical Compatibility Certification' \
    'domain retirement certification'
require_text docs/implementation/REQUIREMENT_AND_INTEGRATION_COMPLETIONS.md \
    'contribution-kind/dimension/owner coverage report' \
    'contribution-kind-driven differential suite'
require_text docs/implementation/REQUIREMENT_AND_INTEGRATION_COMPLETIONS.md \
    'reference, registration, lifecycle handler, or recovery behavior is first added' \
    'lifecycle stop is certification only'
require_text docs/implementation/REQUIREMENT_AND_INTEGRATION_COMPLETIONS.md \
    'Vitheim never creates, amends, approves, or cancels the purchase order' \
    'external purchase-order evidence boundary'

if [ "$failed" -ne 0 ]; then
    exit 1
fi
