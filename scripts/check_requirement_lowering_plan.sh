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
    '`UnknownRestrictionLoweringReleaseMemberV1 { generation, version, state }`' \
    'versioned predecessor release member'
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
    '0.51.38` — Release-Member Budget Construction Certification' \
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
    '`SourceAuthoritativeReleaseMemberStatusProofV1`' \
    'source-authoritative continuity proof'
require_text "$plan" \
    '`ReleaseMemberTransitionGenesisV1` plus' \
    'activation-time transition genesis'
require_text "$plan" \
    'capacity and audit/outbox are one all-or-nothing bundle.' \
    'all-or-nothing activation construction bundle'
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
    'From the first nonterminal or terminal member transition' \
    'continuity receipt begins at first transition'
require_text "$plan" \
    '`ReleaseMemberConstructionBundleReceiptV1`' \
    'construction bundle certification receipt'
require_text "$plan" \
    'an unbound encoding is invalid, not a legacy' \
    'unbound V1 is rejected'
require_text "$plan" \
    '`saturated_retry_claim_count < saturated_retry_limit`' \
    'lifetime retry count charged below immutable limit'
require_text "$plan" \
    'Retry-budget replenishment or count reset is unsupported through `1.0.0`.' \
    'no retry lifetime budget reset'
require_text "$plan" \
    'operational `0.51.37` dispatch or member transition' \
    'continuity admission precedes first dispatch'
require_text "$plan" \
    'There is no one-time event-journal, signed-checkpoint or inferred-history' \
    'no post-hoc transition history bootstrap'

if [ "$failed" -ne 0 ]; then
    exit 1
fi
