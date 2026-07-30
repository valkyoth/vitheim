#!/usr/bin/env sh
set -eu

failed=0

require_text() {
    file="$1"
    expected="$2"
    label="$3"
    if ! grep -Fq "$expected" "$file"; then
        echo "lowering requirement plan: missing semantic anchor '$label' in $file" >&2
        failed=1
    fi
}

reject_text() {
    file="$1"
    unexpected="$2"
    label="$3"
    if grep -Fq "$unexpected" "$file"; then
        echo "lowering requirement plan: forbidden semantic anchor '$label' in $file" >&2
        failed=1
    fi
}

plan=docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md

require_text "$plan" \
    '`EffectiveRestrictionAdmissionAuthorityV1`' \
    'closed effective-restriction admission authority'
require_text "$plan" \
    '`TopRestrictionAdmission' \
    'top-restriction admission branch'
require_text "$plan" \
    '`PreOperationalLoweredAdmission' \
    'pre-operational lowered admission branch'
require_text "$plan" \
    '`EffectiveRestrictionAdmissionRootV1`' \
    'branch-consistent effective-restriction admission root'
require_text "$plan" \
    '`EffectiveRestrictionPartitionAdmissionReceiptV1`' \
    'closed effective-restriction partition receipt'
require_text "$plan" \
    '`PreOperationalLoweringPartitionAdoptionRootV1`' \
    'domain-separated lowered partition-adoption root'
require_text "$plan" \
    'The Lowered adoption root is mandatory and structurally' \
    'lowered authority root is mandatory'
require_text "$plan" \
    '`EffectiveRestrictionFinalAuthorityV1`' \
    'closed final effective-restriction authority'
require_text "$plan" \
    'No authority-bearing member is optional' \
    'final restriction authority has no optional member'
require_text "$plan" \
    '0.184.0` — Pre-Operational Lowering Admission And Ownership Adoption' \
    'pre-operational lowered bridge adoption'
require_text "$plan" \
    '`AdoptPreOperationalLoweringPartitionV1`' \
    'typed lowered partition adoption command'
require_text "$plan" \
    '`PreOperationalLoweringPartitionAdoptionReceiptV1' \
    'authenticated lowered partition adoption receipt'
require_text "$plan" \
    'preserves the bridge identity, installed restriction,' \
    'lowered adoption preserves bridge identity'
require_text "$plan" \
    'These are non-authoritative process-manager states and must be derivable from' \
    'lowered adoption process states are non-authoritative'
require_text "$plan" \
    '`PartitionAdmissionPending → AdmissionBlocked`' \
    'lowered rejection shares lifecycle CAS'
require_text "$plan" \
    '`PartitionAdmissionPending → PartitionAdmissionComplete`' \
    'lowered completion shares lifecycle CAS'
require_text "$plan" \
    'current authorization revocation generation' \
    'lowered final activation commit-time freshness'
require_text "$plan" \
    'A mismatch produces no guard' \
    'stale lowered activation fails without mutation'
require_text "$plan" \
    '`FinalActivationFreshnessCauseV1`' \
    'typed final activation freshness cause'
require_text "$plan" \
    '`ActivationPrepared → AdmissionRevalidationRequired`' \
    'sole final freshness lifecycle edge'
require_text "$plan" \
    'Any Blocked diagnostic is a rebuildable' \
    'blocked final diagnostic is non-authoritative'
require_text "$plan" \
    'current permanent/reinstall guard-slot generation; the non-operational' \
    'pre-operational current guard-slot generation'
require_text "$plan" \
    'candidate guard digest/generation; and the expected successor operational' \
    'pre-operational candidate and expected-successor generations'
require_text "$plan" \
    'nonexistent current operational-successor guard' \
    'no nonexistent pre-operational guard comparison'
require_text "$plan" \
    'compares current evidence, coverage, safety and restriction generations' \
    'operational lowering commit-time freshness'
require_text "$plan" \
    '`UnknownRestrictionLoweringReleaseMemberOutcomeV1`' \
    'three-way predecessor member outcome'
require_text "$plan" \
    '`ReleaseReconciliationMemberV1 { generation, version, state }`' \
    'parent-local versioned predecessor release member'
require_text "$plan" \
    '`Pending(v) → Terminal { state: Released | RetainedAccepted,' \
    'absorbing predecessor member transition'
require_text "$plan" \
    'expected-version CAS; it is not a third terminal edge.' \
    'per-member expected-version CAS'
require_text "$plan" \
    '`ReleaseMemberVersionBudgetV1 { initial_version, pending_update_ceiling,' \
    'bounded member version budget'
require_text "$plan" \
    'PendingUnknown reason/evidence/observed-generation digest coalesces without' \
    'identical pending observations coalesce'
require_text "$plan" \
    '`PendingObservationSaturated`' \
    'pending saturation retains enforcement'
require_text "$plan" \
    'so hostile response loss cannot exhaust' \
    'terminal transition capacity is reserved'
require_text "$plan" \
    '`UnknownRestrictionLoweringMemberVersionVectorRootV1`' \
    'canonical member version vector root'
require_text "$plan" \
    'Different members may and normally will carry heterogeneous versions.' \
    'heterogeneous member versions are valid'
require_text "$plan" \
    'member_id → { generation, maximum_authenticated_version, state_digest,' \
    'canonical per-member version map'
require_text "$plan" \
    '`PendingUnknown { reason, observed_generation }`' \
    'pending uncertainty is nonterminal'
require_text "$plan" \
    '`LoweringReconciliationComplete`' \
    'mixed predecessor aggregate completion'
require_text "$plan" \
    'only when pending is exactly zero' \
    'predecessor cleanup requires zero pending'
require_text "$plan" \
    '0.189.0` — Release-Member Prepared-Construction Certification' \
    'release-member construction certification stop'
require_text "$plan" \
    '`UnknownRestrictionLoweringReleaseMemberBudgetDigestV1`' \
    'identity-bound member budget digest'
require_text "$plan" \
    'initial_version < pending_update_ceiling < reserved_terminal_version' \
    'checked member budget ordering'
require_text "$plan" \
    '0.190.0` — Saturated Release-Member Retry Authority' \
    'saturated retry authority stop'
require_text "$plan" \
    '`ResumeSaturatedReleaseMemberReconciliationV1`' \
    'typed saturated retry-only command'
require_text "$plan" \
    'It cannot manufacture or select Released/RetainedAccepted' \
    'retry command cannot create terminal authority'
require_text "$plan" \
    '0.191.0` — Release-Member Transition-Continuity Proof' \
    'transition continuity stop'
require_text "$plan" \
    '`UnknownRestrictionLoweringMemberTransitionReceiptV1`' \
    'expected-predecessor transition receipt'
require_text "$plan" \
    '`ReleaseMemberTransitionHighWatermarkV1 { generation, version, state_digest,' \
    'per-member transition high-watermark'
require_text "$plan" \
    '`ParentAuthoritativeReleaseMemberStatusProofV1`' \
    'parent-authoritative continuity proof'
require_text "$plan" \
    '`ReleaseMemberTransitionGenesisV1` plus' \
    'activation-time transition genesis'
require_text "$plan" \
    '`ReleaseMemberConstructionPreparedRootV1`' \
    'sealed bounded construction root'
require_text "$plan" \
    'there is no later manifest extension.' \
    'immutable manifest is never retrofitted'
require_text "$plan" \
    'checked(v + 1) < pending_update_ceiling' \
    'below-ceiling pending arithmetic'
require_text "$plan" \
    'checked(v + 1) == pending_update_ceiling' \
    'exact saturation arithmetic'
require_text "$plan" \
    '`Pending(version = pending_update_ceiling)`' \
    'normal pending at ceiling is impossible'
require_text "$plan" \
    'From the first nonterminal or terminal parent-member transition' \
    'continuity receipt begins at first transition'
require_text "$plan" \
    '`ReleaseMemberConstructionBundleReceiptV1`' \
    'construction bundle certification receipt'
require_text "$plan" \
    'an unbound encoding is invalid, not a legacy' \
    'unbound V1 is rejected'
require_text "$plan" \
    '`claim_count < saturated_retry_limit`' \
    'retry ledger count charged below immutable limit'
require_text "$plan" \
    'Retry-budget replenishment or count reset is unsupported through `1.0.0`.' \
    'no retry lifetime budget reset'
require_text "$plan" \
    'operational `0.188.0` dispatch or member transition' \
    'continuity admission precedes first dispatch'
require_text "$plan" \
    'There is no one-time event-journal, signed-checkpoint or inferred-history' \
    'no post-hoc transition history bootstrap'
require_text "$plan" \
    '0.192.0` — Release-Member Budget Policy And Worst-Case Funding' \
    'release-member policy and funding stop'
require_text "$plan" \
    '`ReleaseMemberBudgetPolicyV1`' \
    'governed deterministic budget policy'
require_text "$plan" \
    'facts but no numeric limits.' \
    'caller cannot select member limits'
require_text "$plan" \
    '0.193.0` — Bounded Release-Member Construction Lifecycle' \
    'bounded release-member construction stop'
require_text "$plan" \
    '`Preparing → ConstructionSealed → Activated | Disposed`' \
    'closed bounded construction lifecycle'
require_text "$plan" \
    'The final `0.185.0`/`0.187.0` guard-slot CAS performs bounded work only' \
    'bounded final guard-slot activation'
require_text "$plan" \
    '0.194.0` — Partition-Local Release Effects And Parent Folding' \
    'partition-local effect and parent fold stop'
require_text "$plan" \
    '`PredecessorReleaseEffectReceiptV1`' \
    'source-local release effect receipt'
require_text "$plan" \
    '`PredecessorRetentionAcceptanceReceiptV1`' \
    'destination-local retention acceptance receipt'
require_text "$plan" \
    'No transaction spans stores.' \
    'cross-store transactions forbidden'
require_text "$plan" \
    '0.195.0` — Saturated-Retry Ledger Continuity' \
    'saturated retry ledger continuity stop'
require_text "$plan" \
    '`SaturatedRetryBudgetLedgerV1 { member_id, member_generation, budget_digest,' \
    'separate versioned saturated retry ledger'
require_text "$plan" \
    'The release member remains' \
    'retry charge does not mutate saturated member'
require_text "$plan" \
    '0.196.0` — Distributed Predecessor Enforcement Inventory Cut' \
    'distributed predecessor inventory cut stop'
require_text "$plan" \
    '`PredecessorEnforcementInventoryCutV1`' \
    'sealed distributed predecessor inventory'
require_text "$plan" \
    '`PredecessorInventoryCutFenceV1`' \
    'source-local inventory cut fence'
require_text "$plan" \
    'invalidation projection is never sufficient authority to activate.' \
    'delayed invalidation cannot prove activation freshness'
require_text "$plan" \
    '0.197.0` — Parent-Local Release Effect Intent' \
    'parent-local effect intent stop'
require_text "$plan" \
    '`ReleaseMemberEffectIntentV1`' \
    'one-winner parent effect intent'
require_text "$plan" \
    '`Pending → ReleaseIntentCommitted { source_owner, effect_id } |' \
    'closed release or retention intent adjacency'
require_text "$plan" \
    'exact `IntentBudgetReservationV1` route-leg root' \
    'initial effect intent atomically reserves lifetime route'
require_text "$plan" \
    'does not mutate or consume the release-member version' \
    'effect intent does not spend member version'
require_text "$plan" \
    '0.198.0` — Activation-Bound Remote Effect Authorization' \
    'activation-bound remote effect authority stop'
require_text "$plan" \
    '`ReleaseMemberEffectAuthorizationV1 = Release { source_owner, effect_id, ... }' \
    'closed release or retention effect authority'
require_text "$plan" \
    '`ReleaseMemberEffectAuthorizationIssuanceLedgerV1`' \
    'authoritative effect authorization issuance ledger'
require_text "$plan" \
    '`ReleaseMemberEffectAuthorizationIssuanceScopeV1`' \
    'intent-scoped authorization issuance aggregate'
require_text "$plan" \
    '`ReleaseMemberEffectAuthorizationIssuanceEntryV1`' \
    'immutable uniquely keyed authorization issuance entries'
require_text "$plan" \
    '`IssuanceOpen | IssuanceSealed`' \
    'closed authorization issuance lifecycle'
require_text "$plan" \
    'scope → authorization entry → intent-lifetime budget reservation → outbox.' \
    'authorization issuance lock order'
require_text "$plan" \
    '`IntentBudgetReservationId` and the exact before/after lifetime-budget heads.' \
    'authorization issuance consumes exact lifetime reservation'
require_text "$plan" \
    'A per-entry document plus eventual aggregate projection' \
    'eventual-only issuance adapter refusal'
require_text "$plan" \
    'reconstructs issuance authority from an outbox, projection or remote receipt.' \
    'restore cannot reconstruct authorization issuance'
require_text "$plan" \
    'atomically consumes the one-shot authority, commits the physical effect,' \
    'remote effect consumes authority locally'
require_text "$plan" \
    '0.199.0` — Physical Effect Conflict Reconciliation' \
    'physical effect conflict reconciliation stop'
require_text "$plan" \
    '`EffectConflictDetected → EffectConflictReconciling → SingleEffectSettled`' \
    'closed physical effect conflict lifecycle'
require_text "$plan" \
    '`ReleaseMemberEffectConflictConservationRootV1`' \
    'physical effect conflict conservation root'
require_text "$plan" \
    'a member becomes terminal only after every physical effect is' \
    'no terminal member with unsettled physical effects'
require_text "$plan" \
    '0.200.0` — Restrictive-Safety Inventory Mutation Lane' \
    'restrictive safety inventory mutation lane'
require_text "$plan" \
    '`RestrictiveSafety` commits in one source-local transaction even' \
    'restrictive safety bypasses the inventory fence'
require_text "$plan" \
    'the restriction itself never waits.' \
    'restrictive safety is enforced without delay'
require_text "$plan" \
    '`DecisionNeutral` requires a typed proof' \
    'neutral inventory mutation requires proof'
require_text "$plan" \
    '0.201.0` — Effect Authorization And Delivery Closure' \
    'effect authorization and delivery closure stop'
require_text "$plan" \
    '`EffectDeliveryOpen → EffectAuthorizationCutSealed →' \
    'closed effect delivery lifecycle'
require_text "$plan" \
    '`EffectDeliveryClosureRootV1`' \
    'complete effect delivery closure root'
reject_text "$plan" \
    '`NeverIssued`' \
    'undefined never-issued authorization branch'
require_text "$plan" \
    'The sealed issuance-entry root is the only authorization universe.' \
    'sealed issued entries are sole authorization universe'
require_text "$plan" \
    '`ClosedUnusedConsumed` without refund' \
    'unused intent reservation receives terminal no-refund disposition'
require_text "$plan" \
    '`EffectDeliveryClosureRootV1` counts exactly every' \
    'delivery closure exact issued-entry membership'
require_text "$plan" \
    'CAS consumes that current closure root' \
    'terminal CAS consumes delivery closure'
require_text "$plan" \
    '0.202.0` — Post-Closure Unauthorized Effect Incident Ownership' \
    'post-closure unauthorized effect incident stop'
require_text "$plan" \
    '`PostClosureUnauthorizedEffectIncidentV1`' \
    'post-closure unauthorized effect incident type'
require_text "$plan" \
    '`PhysicalEffectObservationIdV1`' \
    'stable post-closure physical effect observation identity'
require_text "$plan" \
    '`PostClosurePhysicalEffectObservationLedgerV1`' \
    'post-closure observation create-or-join ledger'
require_text "$plan" \
    '`PhysicalEffectStatusAuthorityPortV1 = Supported { profile_id,' \
    'closed physical effect status capability'
require_text "$plan" \
    '| Refused { reason }` capability' \
    'physical effect status refusal profile'
require_text "$plan" \
    'is not an authoritative effect sequence.' \
    'snapshot and polling metadata cannot prove effect identity'
require_text "$plan" \
    'classifies identity as unresolved' \
    'unsupported status authority remains unresolved'
require_text "$plan" \
    'charges independent emergency incident capacity exactly once.' \
    'post-closure incident charges capacity once'
require_text "$plan" \
    '`PhysicalEffectObservationConflict`' \
    'conflicting post-closure observation behavior'
require_text "$plan" \
    'Residual assignment is itself expected-version create-or-join' \
    'post-closure residual assignment idempotency'
require_text "$plan" \
    '`Detected → CurrentGenerationFenced → ResidualOwned | SafelyRemoved →' \
    'closed post-closure incident lifecycle'
require_text "$plan" \
    'reopens, changes or derives authority from the absorbing release member' \
    'post-closure incident cannot reopen terminal history'
require_text "$plan" \
    '0.203.0` — No-Effect Intent Disposition And Replanning' \
    'no-effect intent disposition stop'
require_text "$plan" \
    '`IntentCommitted → IntentDispositionRequested → IntentDispatchFenced →' \
    'closed intent disposition lifecycle'
require_text "$plan" \
    '`NoEffectIntentClosureRootV1`' \
    'no-effect intent closure root'
require_text "$plan" \
    '`ReleaseMemberIntentLifetimeBudgetV1`' \
    'finite intent lifetime budget'
require_text "$plan" \
    '`IntentBudgetReservationV1` legs with stable reservation IDs' \
    'stable per-intent route budget reservations'
require_text "$plan" \
    'immutable non-wrapping maxima and admitted/consumed/reserved/remaining state' \
    'intent lifetime budget dimensions and conservation'
require_text "$plan" \
    'IntentAbandoned | IntentReplanned | IntentReplanExhausted`.' \
    'explicit intent replan exhaustion state'
require_text "$plan" \
    'Ordinary retry joins exhaustion and' \
    'ordinary retry cannot widen intent budget'
require_text "$plan" \
    'predecessor-linked ledger generation, preserves all consumed/reserved history' \
    'separately authorized cumulative intent budget amendment'
require_text "$plan" \
    'Any uncertainty or discovered effect enters `EffectConflictDetected`' \
    'uncertain no-effect disposition enters conflict'
require_text "$plan" \
    'Neither branch resets observation/retry/intent lifetime budgets or reuses an' \
    'intent replanning forbids budget and identity reuse'
require_text "$plan" \
    'manual evidence can append annotations, provenance and' \
    'manual evidence is limited to annotation and custody provenance'
require_text "$plan" \
    'cannot manufacture an effect identity/sequence, prove historical absence,' \
    'manual evidence cannot manufacture authority or absence'
require_text "$plan" \
    '0.204.0` — Physical-Status Authority Continuity Succession' \
    'physical status authority continuity succession stop'
require_text "$plan" \
    '`PhysicalEffectStatusAuthorityContinuityV1`' \
    'physical status authority continuity type'
require_text "$plan" \
    '`Active → SuccessorPrepared → HandoffFenced →' \
    'physical status authority handoff lifecycle'
require_text "$plan" \
    'handoff fence prevents predecessor and successor from both issuing current' \
    'status authority predecessor successor exclusion'
require_text "$plan" \
    '0.205.0` — Authorization Dispatch-Attempt Ledger' \
    'authorization dispatch attempt accounting stop'
require_text "$plan" \
    '`AuthorizationDispatchAttemptLedgerV1`' \
    'authorization dispatch attempt ledger type'
require_text "$plan" \
    'Before every external transmission, one local expected-version CAS increments' \
    'dispatch attempt is charged before external transmission'
require_text "$plan" \
    'sealed non-`Clone`, non-serializable process-local permit.' \
    'dispatch charge uses canonical non-transferable permit custody'
require_text "$plan" \
    '0.206.0` — Bounded Delivery-Seal Construction And Backend Admission' \
    'bounded delivery seal construction stop'
require_text "$plan" \
    '`EffectDeliverySealAtomicityProfileV1`' \
    'backend delivery seal atomicity profile'
require_text "$plan" \
    '`EffectDeliverySealBundleV1` maxima' \
    'bounded delivery seal bundle maxima'
require_text "$plan" \
    '`SealBundlePreparing → SealBundlePrepared → SealBundlePublished |' \
    'authority inert seal bundle staging lifecycle'
require_text "$plan" \
    'One final bounded local CAS verifies the complete exact prepared root' \
    'single bounded final seal publication CAS'

if [ "$failed" -ne 0 ]; then
    exit 1
fi
