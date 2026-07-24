#!/bin/sh
set -eu

tmp_dir=$(mktemp -d)
trap 'rm -rf "$tmp_dir"' EXIT HUP INT TERM

ownership="$tmp_dir/ownership.md"
generations="$tmp_dir/generations.md"
admissions="$tmp_dir/admissions.md"
realizations="$tmp_dir/realizations.md"
active_catalogs="$tmp_dir/active_catalogs.md"

reset_law() {
    cp docs/INVARIANT_OWNERSHIP.md "$ownership"
    cp docs/LAW_GENERATIONS.md "$generations"
    cp docs/LAW_MANIFEST_ADMISSIONS.md "$admissions"
}

expect_law_failure() {
    label=$1
    if scripts/check_law_generations.sh \
        "$ownership" "$generations" "$admissions" >/dev/null 2>&1; then
        echo "adversarial law policy: unexpectedly accepted $label" >&2
        exit 1
    fi
    reset_law
}

expect_law_failure_message() {
    label=$1
    expected=$2
    if output=$(scripts/check_law_generations.sh \
        "$ownership" "$generations" "$admissions" 2>&1); then
        echo "adversarial law policy: unexpectedly accepted $label" >&2
        exit 1
    fi
    case "$output" in
        *"$expected"*) ;;
        *)
            echo "adversarial law policy: $label failed for the wrong reason" >&2
            exit 1
            ;;
    esac
    reset_law
}

expect_realization_failure() {
    label=$1
    if scripts/check_law_semantic_realizations.sh \
        "$generations" "$realizations" >/dev/null 2>&1; then
        echo "adversarial law policy: unexpectedly accepted $label" >&2
        exit 1
    fi
    cp docs/LAW_SEMANTIC_REALIZATIONS.md "$realizations"
}

reset_active_catalogs() {
    cp docs/LAW_ACTIVE_CATALOGS.md "$active_catalogs"
}

expect_active_catalog_failure() {
    label=$1
    if scripts/check_law_active_catalogs.sh \
        "$generations" "$active_catalogs" docs/implementation >/dev/null 2>&1; then
        echo "adversarial law policy: unexpectedly accepted $label" >&2
        exit 1
    fi
    reset_active_catalogs
}

digest_sha256() {
    if command -v sha256sum >/dev/null 2>&1; then
        hash_line=$(sha256sum)
    elif command -v shasum >/dev/null 2>&1; then
        hash_line=$(shasum -a 256)
    elif command -v sha256 >/dev/null 2>&1; then
        sha256 -q
        return
    else
        echo "adversarial law policy: no SHA-256 tool found" >&2
        exit 1
    fi
    printf '%s\n' "${hash_line%% *}"
}

reset_law
cp docs/LAW_SEMANTIC_REALIZATIONS.md "$realizations"
reset_active_catalogs

sed -i 's/| VIT-LAW-001 | 1 |/| VIT-LAW-001 | 01 |/' "$generations"
expect_law_failure "a leading-zero generation"

sed -i 's/| VIT-LAW-001 | 1 |/| VIT-LAW-001 | 1x |/' "$generations"
expect_law_failure "a malformed generation"

sed -i 's/`0.16.0`/`00.16.0`/g' "$generations"
expect_law_failure "noncanonical SemVer"

sed -i 's/-g01-v1/-g01-v01/g' "$generations"
expect_law_failure "a leading-zero contract version"

sed -i 's/| none | linearize:/| VIT-INV-019 | linearize:/' "$generations"
expect_law_failure "generation-one removals"

sed -i \
    's/| VIT-INV-020 | none |/| VIT-INV-020 | VIT-INV-020 |/' \
    "$generations"
expect_law_failure "overlapping dependency deltas"

sed -i \
    's/| VIT-INV-019, VIT-INV-021, VIT-INV-023 |/| VIT-INV-019 |/' \
    "$generations"
expect_law_failure "fewer than two resolved roots"

tab=$(printf '\t')
sed -i "s/linearize: /linearize:${tab}/" "$generations"
expect_law_failure "a tab"

carriage_return=$(printf '\r')
sed -i "s/; failure:/;${carriage_return} failure:/" "$generations"
expect_law_failure "a carriage return"

non_ascii=$(printf '\303\251')
sed -i "s/linearize:/lineariz${non_ascii}e:/" "$generations"
expect_law_failure "non-ASCII normalization input"

sed -i 's/; failure:/; | failure:/' "$generations"
expect_law_failure "an embedded Markdown field separator"

old_digest=$(awk -F'|' '
/^\| VIT-LAW-001 \| 1 \|/ {
    value = $17
    gsub(/^ | $/, "", value)
    print value
    exit
}
' "$generations")
sed -i 's/each authority owner advances/each admitted authority owner advances/' \
    "$generations"
new_preimage=$(LC_ALL=C awk -F'|' '
function trim(value) {
    sub(/^ +/, "", value)
    sub(/ +$/, "", value)
    return value
}
function bare(value) {
    value = trim(value)
    gsub(/`/, "", value)
    return value
}
function net(value) {
    return length(value) ":" value
}
/^\| VIT-LAW-001 \| 1 \|/ {
    print net("vitheim-law-generation-manifest-v1") \
        net(trim($2)) net(trim($3)) net(bare($4)) net(trim($5)) \
        net(trim($6)) net(trim($7)) net(trim($15)) net(trim($9)) \
        net(trim($10)) net(trim($11)) net(trim($12)) net(bare($13)) \
        net(trim($14)) net(trim($16))
    exit
}
' "$generations")
new_digest="sha256:$(printf '%s' "$new_preimage" | digest_sha256)"
sed -i "s/$old_digest/$new_digest/" "$generations"
expect_law_failure_message \
    "a self-consistent manifest absent from the trusted catalog" \
    "admission digest differs from manifest"

sed -i '/| VIT-LAW-001@g01 |/d' "$admissions"
expect_law_failure "a missing ancestry admission"

sed -i '/| VIT-LSEM-006-g01-v1 |/d' "$realizations"
expect_realization_failure "a missing semantic realization"

sed -i 's/, `OutcomeUnknown`//g' "$realizations"
expect_realization_failure "a missing typed transmission outcome"

sed -i 's/, `Superseded`//' "$realizations"
expect_realization_failure "a missing catalog-rollout loser state"

sed -i 's/, `ActivationAuthorized`//' "$realizations"
expect_realization_failure "a missing irreversible activation-authorization state"

sed -i 's/, `CatalogGlobalActivationResultReceipt`//' "$realizations"
expect_realization_failure "a missing authenticated global activation result"

sed -i 's/, `ConsumedWorkloadLeaseActionClaim`//' "$realizations"
expect_realization_failure "a missing workload action-claim consumption tombstone"

sed -i 's/`CurrentPlacementTopologyReceiptV1`, //' "$realizations"
expect_realization_failure "a missing topology-authority receipt"

sed -i 's/`Uninitialized`, //' "$realizations"
expect_realization_failure "a missing pre-initialization topology state"

sed -i 's/`CommitTopologyAuthorityHandoff`, //' "$realizations"
expect_realization_failure "a missing topology-authority handoff transition"

sed -i 's/`TopologyMutationAuthorizationReceiptV1`, //' "$realizations"
expect_realization_failure "a missing topology-mutation authorization receipt"

sed -i 's/`RecheckTopologyAtTransmissionStart`, //' "$realizations"
expect_realization_failure "a missing dynamic topology start recheck"

sed -i 's/`LastObservedTopologyReceiptSequence`, //' "$realizations"
expect_realization_failure "a missing topology-receipt anti-replay ratchet"

sed -i 's/`IssueTopologyMutationAuthorization`, //' "$realizations"
expect_realization_failure "a missing independent topology authorization issuer"

sed -i 's/`TrustedTopologyAuthorizationTime`, //' "$realizations"
expect_realization_failure "a missing trusted topology-authorization time capability"

sed -i 's/`AdvanceTopologyAuthorizationTimeRatchet`, //' "$realizations"
expect_realization_failure "a missing topology-authorization time ratchet"

sed -i 's/`TopologyMutationAuthorizationExpired`, //' "$realizations"
expect_realization_failure "a missing topology-authorization expiry outcome"

sed -i 's/`DeadlineConditionalTopologyCasV1`, //' "$realizations"
expect_realization_failure "a missing deadline-conditional topology CAS"

sed -i 's/`TopologyMutationDefinitelyNotCommitted`, //' "$realizations"
expect_realization_failure "a missing definitely-not-committed topology outcome"

sed -i 's/`TopologyMutationCommitReconciling`, //' "$realizations"
expect_realization_failure "a missing topology commit reconciliation outcome"

sed -i 's/`TopologyAuthorizationAdmissionBudgetV1`, //' "$realizations"
expect_realization_failure "a missing topology authorization admission budget"

sed -i 's/`TopologyAuthorizationIngressWorkBudgetV1`, //' "$realizations"
expect_realization_failure "a missing topology authorization ingress-work budget"

sed -i 's/`TopologyAuthorizationIngressLaneV1`, //' "$realizations"
expect_realization_failure "a missing topology authorization ingress lane"

sed -i 's/`TopologyAuthorizationPresentationLaneV1`, //' "$realizations"
expect_realization_failure "a missing authenticated presentation lane"

sed -i 's/`TopologyAuthorizationPresentationLaneMismatch`, //' "$realizations"
expect_realization_failure "a missing presentation lane mismatch denial"

sed -i 's/`TopologyAuthorizationPresentationLaneChanged`, //' "$realizations"
expect_realization_failure "a missing presentation lane change denial"

sed -i 's/`TopologyAuthorizationPresentationChargeV1`, //' "$realizations"
expect_realization_failure "a missing presentation charge evidence"

sed -i 's/`ChargeTopologyAuthorizationPresentation`, //' "$realizations"
expect_realization_failure "a missing presentation charge stage"

sed -i 's/`ConsumeTopologyAuthorizationPresentationCharge`, //' "$realizations"
expect_realization_failure "a missing presentation charge consumption stage"

sed -i 's/`TopologyAuthorizationPresentationChargeCheckpointV1`, //' "$realizations"
expect_realization_failure "a missing presentation charge checkpoint"

sed -i 's/`TopologyAuthorizationPresentationRateBudgetV1`, //' "$realizations"
expect_realization_failure "a missing topology authorization presentation-rate budget"

sed -i 's/`TopologyAuthorizationRequestRateBudgetV1`, //' "$realizations"
expect_realization_failure "a missing topology authorization request-rate budget"

sed -i 's/`TopologyAuthorizationPresentationRateLimited`, //' "$realizations"
expect_realization_failure "a missing topology authorization presentation-rate denial"

sed -i 's/`TopologyAuthorizationRequestSequence`, //' "$realizations"
expect_realization_failure "a missing topology authorization request sequence"

sed -i 's/`TopologyAuthorizationRequestReplayCheckpointV1`, //' "$realizations"
expect_realization_failure "a missing denied-request replay checkpoint"

sed -i 's/`RejectLateCompactedTopologyAuthorizationRequest`, //' "$realizations"
expect_realization_failure "a missing late compacted request rejection"

sed -i 's/`TopologyAuthorizationOriginalQuotaClaimSetV1`, //' "$realizations"
expect_realization_failure "a missing topology authorization original quota claim set"

sed -i 's/`TopologyAuthorizationReceiptRevocationIntentV1`, //' "$realizations"
expect_realization_failure "a missing receipt-specific revocation intent"

sed -i 's/`TopologyAuthorizationConsumerTerminalReceiptV1`, //' "$realizations"
expect_realization_failure "a missing consumer terminal receipt"

sed -i 's/`TopologyAuthorizationConsumerTerminalOutcomeV1`, //' "$realizations"
expect_realization_failure "a missing closed consumer terminal outcome"

sed -i 's/`TopologyAuthorizationConsumerDispositionV1`, //' "$realizations"
expect_realization_failure "a missing consumer disposition type"

sed -i 's/`TopologyAuthorizationConsumerReconciliationEvidenceV1`, //' "$realizations"
expect_realization_failure "a missing consumer reconciliation evidence type"

sed -i 's/`TopologyAuthorizationConsumerReconciliationReceiptV1`, //' "$realizations"
expect_realization_failure "a missing consumer reconciliation receipt"

sed -i 's/`AuthorizationIssuanceSequence`, //' "$realizations"
expect_realization_failure "a missing topology authorization issuance sequence"

sed -i 's/`TopologyAuthorizationReplayCheckpointV1`, //' "$realizations"
expect_realization_failure "a missing topology authorization replay checkpoint"

sed -i 's/`TopologyAuthorizationHistoricalStateUnavailable`, //' "$realizations"
expect_realization_failure "a missing unavailable historical-state denial"

sed -i 's/`TopologyAuthorizationIssuedRangeManifestV1`, //' "$realizations"
expect_realization_failure "a missing topology authorization issuer range manifest"

sed -i 's/`ConsumerCompactionEligibleThrough`, //' "$realizations"
expect_realization_failure "a missing consumer compaction eligibility proof"

sed -i 's/`TopologyAuthorizationBreakGlassReserve`, //' "$realizations"
expect_realization_failure "a missing topology authorization break-glass reserve"

sed -i 's/`TopologyAuthorizationOutstandingReservation`, //' "$realizations"
expect_realization_failure "a missing topology authorization outstanding reservation"

sed -i 's/`TopologyAuthorizationPrincipalBudgetKey`, //' "$realizations"
expect_realization_failure "a missing topology authorization principal budget key"

sed -i 's/`SettleTopologyAuthorizationOutstandingReservation`, //' "$realizations"
expect_realization_failure "a missing exact-once reservation settlement"

sed -i 's/`TopologyAuthorizationIssuedRangeChunkV1`, //' "$realizations"
expect_realization_failure "a missing bounded topology authorization range chunk"

sed -i 's/`TopologyAuthorizationRangeProofBudgetV1`, //' "$realizations"
expect_realization_failure "a missing topology authorization range proof budget"

sed -i 's/`TopologyAuthorizationRangeVerificationCursor`, //' "$realizations"
expect_realization_failure "a missing topology authorization range verification cursor"

sed -i 's/`RejectLateCompactedTopologyAuthorization`, //' "$realizations"
expect_realization_failure "a missing late compacted authorization rejection"

sed -i 's/, VIT-LST-001-g01-N//' "$realizations"
expect_realization_failure "a missing negative semantic contract"

sed -i '/^| 1 |/s/VIT-LAW-001@g02/VIT-LAW-001@g03/' "$active_catalogs"
expect_active_catalog_failure "a future tuple in an active catalog"

sed -i '/^| 1 |/s/CompiledCatalog/compiled-or-signed/' "$active_catalogs"
expect_active_catalog_failure "a combined runtime trust profile"

sed -i '/^| 1 |/s/, VIT-LAW-007@g01//' "$active_catalogs"
expect_active_catalog_failure "an incomplete effective law frontier"

sed -i '/^| 1 |/s/, VIT-LAW-008@g01//' "$active_catalogs"
expect_active_catalog_failure "a missing catalog-rollout law frontier"

sed -i '/^| 12 |/s/VIT-LAW-008@g02/VIT-LAW-008@g01/' "$active_catalogs"
expect_active_catalog_failure "a stale pre-topology rollout generation"

sed -i '/^| 2 | VIT-LAWCAT-ACTIVE-/d' "$active_catalogs"
expect_active_catalog_failure "a skipped catalog successor"

sed -i \
    '/^| 2 | VIT-LAWCAT-ACTIVE-/s/`0.18.4`/`0.18.3`/' \
    "$active_catalogs"
expect_active_catalog_failure "an overlapping catalog activation floor"

implementation_copy="$tmp_dir/implementation"
mkdir "$implementation_copy"
cp docs/implementation/*.md "$implementation_copy/"
sed -i \
    '/^## `0.18.3`/,/^## `0.18.4`/s/^Status: planned/Status: implemented/' \
    "$implementation_copy/PHASE_B.md"
if scripts/check_law_semantic_realizations.sh \
    "$generations" "$realizations" "$implementation_copy" >/dev/null 2>&1; then
    echo "adversarial law policy: stage gate ignored missing realization files" >&2
    exit 1
fi
if scripts/check_law_active_catalogs.sh \
    "$generations" "$active_catalogs" "$implementation_copy" >/dev/null 2>&1; then
    echo "adversarial law policy: stage gate ignored missing catalog artifact" >&2
    exit 1
fi

fake_workspace="$tmp_dir/fake-workspace"
mkdir -p "$fake_workspace/release/law-catalogs"
printf '%s\n' \
    'catalog_id=VIT-LAWCAT-ACTIVE-e001-v1' \
    'payload_digest=sha256:aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' \
    'envelope_digest=sha256:bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb' \
    >"$fake_workspace/release/law-catalogs/VIT-LAWCAT-ACTIVE-e001-v1.catalog"
if scripts/check_law_active_catalogs.sh \
    "$generations" "$active_catalogs" "$implementation_copy" \
    "$fake_workspace" >/dev/null 2>&1; then
    echo "adversarial law policy: stage gate accepted field-shaped text" >&2
    exit 1
fi

echo "adversarial law policy checks passed"
