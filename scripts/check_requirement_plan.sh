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
    '0.51.11` — Permanent Domain Guard Takeover And Campaign Completion' \
    'permanent guard takeover and campaign completion'
require_text docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md \
    '`PermanentDomainGuardTransferReceiptV1`' \
    'permanent domain guard transfer receipt'
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
    'final clean status requires the' \
    'clean deployment retirement requires coverage and permanent guard'
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
