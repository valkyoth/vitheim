#!/usr/bin/env sh
set -eu

plan="docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md"
failed=0

require_text() {
    expected="$1"
    label="$2"
    if ! grep -Fq "$expected" "$plan"; then
        echo "effect delivery completion plan: missing semantic anchor '$label'" >&2
        failed=1
    fi
}

require_text \
    'realization of the existing `VIT-INV-006`/`VIT-LAW-006` transmission-start' \
    'release effect reuses canonical transmission law'
require_text \
    '`TransmissionStartClaimId`' \
    'canonical transmission start claim identity'
require_text \
    'no `OutcomeUnknown` or `StartClaimedReconciling` start' \
    'delivery closure blocks ambiguous transmission claims'
require_text \
    '0.207.0` — Physical-Status Remote Fence And Successor Admission' \
    'remote physical status handoff stop'
require_text \
    '`PhysicalStatusPredecessorFenceReceiptV1`' \
    'predecessor local fence receipt'
require_text \
    '`PhysicalStatusSuccessorAdmissionReceiptV1`' \
    'successor dormant admission receipt'
require_text \
    '`PhysicalStatusSuccessorActivationReceiptV1`' \
    'successor activation receipt'
require_text \
    'the stable command/receipt status and never reissues a fence, admission or' \
    'remote handoff response loss reconciliation'
require_text \
    '0.208.0` — Post-Fence Status-Successor Recovery' \
    'post fence successor recovery stop'
require_text \
    '`HandoffFenced → HandoffRecoveryRequired →' \
    'post fence recovery lifecycle'
require_text \
    'status is `Refused` and the coarse' \
    'post fence recovery stays refused'
require_text \
    '0.209.0` — Transmission-Claim Closure Interlock And Conformance' \
    'transmission claim closure interlock stop'
require_text \
    '`EffectDeliveryTransmissionClaimCutV1`' \
    'complete transmission claim cut'
require_text \
    'authorization expiry after claim' \
    'claim expiry is not no effect proof'
require_text \
    '0.210.0` — Delivery-Seal Preparation Lineage And Codec Pinning' \
    'seal preparation lineage stop'
require_text \
    '`EffectDeliverySealPreparationLineageV1`' \
    'intent scoped seal preparation lineage'
require_text \
    'cumulative restart/work/row/byte/time maxima' \
    'finite cumulative seal preparation budget'
require_text \
    'Bind codec ID/version, schema generation, canonical size-algorithm identity' \
    'seal admission encoding contract pinning'
require_text \
    'authenticated archive root before physical deletion; cleanup is' \
    'seal staging archive safe cleanup'

if [ "$failed" -ne 0 ]; then
    exit 1
fi
