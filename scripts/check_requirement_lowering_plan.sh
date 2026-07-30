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
    '0.51.33` — Pre-Operational Lowering Admission And Ownership Adoption' \
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
    '0.51.38` — Release-Member Prepared-Construction Certification' \
    'release-member construction certification stop'
require_text "$plan" \
    '`UnknownRestrictionLoweringReleaseMemberBudgetDigestV1`' \
    'identity-bound member budget digest'
require_text "$plan" \
    'initial_version < pending_update_ceiling < reserved_terminal_version' \
    'checked member budget ordering'
require_text "$plan" \
    '0.51.39` — Saturated Release-Member Retry Authority' \
    'saturated retry authority stop'
require_text "$plan" \
    '`ResumeSaturatedReleaseMemberReconciliationV1`' \
    'typed saturated retry-only command'
require_text "$plan" \
    'It cannot manufacture or select Released/RetainedAccepted' \
    'retry command cannot create terminal authority'
require_text "$plan" \
    '0.51.40` — Release-Member Transition-Continuity Proof' \
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
    'operational `0.51.37` dispatch or member transition' \
    'continuity admission precedes first dispatch'
require_text "$plan" \
    'There is no one-time event-journal, signed-checkpoint or inferred-history' \
    'no post-hoc transition history bootstrap'
require_text "$plan" \
    '0.51.41` — Release-Member Budget Policy And Worst-Case Funding' \
    'release-member policy and funding stop'
require_text "$plan" \
    '`ReleaseMemberBudgetPolicyV1`' \
    'governed deterministic budget policy'
require_text "$plan" \
    'facts but no numeric limits.' \
    'caller cannot select member limits'
require_text "$plan" \
    '0.51.42` — Bounded Release-Member Construction Lifecycle' \
    'bounded release-member construction stop'
require_text "$plan" \
    '`Preparing → ConstructionSealed → Activated | Disposed`' \
    'closed bounded construction lifecycle'
require_text "$plan" \
    'The final `0.51.34`/`0.51.36` guard-slot CAS performs bounded work only' \
    'bounded final guard-slot activation'
require_text "$plan" \
    '0.51.43` — Partition-Local Release Effects And Parent Folding' \
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
    '0.51.44` — Saturated-Retry Ledger Continuity' \
    'saturated retry ledger continuity stop'
require_text "$plan" \
    '`SaturatedRetryBudgetLedgerV1 { member_id, member_generation, budget_digest,' \
    'separate versioned saturated retry ledger'
require_text "$plan" \
    'The release member remains' \
    'retry charge does not mutate saturated member'

if [ "$failed" -ne 0 ]; then
    exit 1
fi
