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
    '`Pending { generation, version } → Released | RetainedAccepted`' \
    'absorbing predecessor member transition'
require_text "$plan" \
    'same Pending generation through an expected-version' \
    'per-member expected-version CAS'
require_text "$plan" \
    '`ReleaseMemberVersionBudgetV1 { pending_update_ceiling,' \
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
    'member_id → { generation, maximum_authenticated_version, state_digest }' \
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

if [ "$failed" -ne 0 ]; then
    exit 1
fi
