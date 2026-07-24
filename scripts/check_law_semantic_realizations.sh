#!/bin/sh
set -eu

generations=${1:-docs/LAW_GENERATIONS.md}
realizations=${2:-docs/LAW_SEMANTIC_REALIZATIONS.md}
implementation_dir=${3:-docs/implementation}

fail() {
    echo "law semantic realizations: $*" >&2
    exit 1
}

[ -f "$generations" ] || fail "missing generation registry: $generations"
[ -f "$realizations" ] || fail "missing realization registry: $realizations"
[ -d "$implementation_dir" ] ||
    fail "missing implementation directory: $implementation_dir"

tmp_dir=$(mktemp -d)
trap 'rm -rf "$tmp_dir"' EXIT HUP INT TERM

awk '
/^##? `/ {
    if (match($0, /`[0-9]+\.[0-9]+\.[0-9]+`/)) {
        version = substr($0, RSTART + 1, RLENGTH - 2)
    } else {
        version = ""
    }
    next
}
version != "" && /^Status:/ {
    print version "|" $0
    version = ""
}
' "$implementation_dir"/*.md | sort >"$tmp_dir/statuses"

awk -F'|' '
function trim(value) {
    sub(/^[[:space:]]+/, "", value)
    sub(/[[:space:]]+$/, "", value)
    return value
}
/^\| VIT-LAW-[0-9][0-9][0-9] \|/ {
    law = trim($2)
    generation = trim($3)
    effective = trim($4)
    semantic = trim($15)
    gsub(/`/, "", effective)
    printf "%s|%s@g%02d|%s\n", semantic, law, generation, effective
}
' "$generations" | sort >"$tmp_dir/generations"

awk -F'|' '
function trim(value) {
    sub(/^[[:space:]]+/, "", value)
    sub(/[[:space:]]+$/, "", value)
    return value
}
/^\| VIT-LSEM-[0-9][0-9][0-9]-g[0-9][0-9]-v[0-9]+ \|/ {
    if (NF != 10 || $0 ~ /[^ -~]/) {
        print "noncanonical row: " $0 >"/dev/stderr"
        exit 2
    }
    for (i = 2; i <= 9; i++) {
        if ($i !~ /^ [^ ].*[^ ] $/) {
            print "noncanonical cell whitespace: " $0 >"/dev/stderr"
            exit 2
        }
    }
    semantic = trim($2)
    reference = trim($3)
    effective = trim($4)
    rust_path = trim($5)
    transitions = trim($6)
    tests = trim($7)
    recovery = trim($8)
    gate = trim($9)
    gsub(/`/, "", effective)
    print semantic "|" reference "|" effective "|" rust_path "|" transitions "|" tests "|" recovery "|" gate
}
' "$realizations" >"$tmp_dir/realizations" ||
    fail "registry rows are not canonical printable-ASCII Markdown"

[ -s "$tmp_dir/generations" ] || fail "no law generations found"
[ -s "$tmp_dir/realizations" ] || fail "no realization rows found"

cut -d'|' -f1-3 "$tmp_dir/realizations" | sort >"$tmp_dir/realization_keys"
cmp -s "$tmp_dir/generations" "$tmp_dir/realization_keys" ||
    fail "every generation must have exactly one matching semantic ID, reference, and effective version"

duplicates=$(cut -d'|' -f1 "$tmp_dir/realizations" | sort | uniq -d)
[ -z "$duplicates" ] || fail "duplicate semantic contracts: $duplicates"

while IFS='|' read -r semantic reference effective rust_path transitions tests recovery gate; do
    echo "$semantic" | awk '
        !/^VIT-LSEM-[0-9][0-9][0-9]-g[0-9][0-9]-v[1-9][0-9]*$/ { exit 1 }
    ' || fail "$semantic has a noncanonical ID"
    echo "$reference" | awk '
        !/^VIT-LAW-[0-9][0-9][0-9]@g[0-9][0-9]$/ { exit 1 }
    ' || fail "$semantic has a noncanonical law reference"
    echo "$effective" | awk '
        !/^(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)$/ { exit 1 }
    ' || fail "$semantic has noncanonical SemVer"

    case "$rust_path" in
        \`crates/vitheim-law/src/*.rs\`) ;;
        *) fail "$semantic has an invalid Rust realization path" ;;
    esac
    case "$recovery" in
        \`crates/vitheim-law/src/recovery/*.rs\`) ;;
        *) fail "$semantic has an invalid recovery realization path" ;;
    esac
    [ "$rust_path" != "$recovery" ] ||
        fail "$semantic must separate transition and recovery realization paths"
    echo "$transitions" | awk '
        !/^`[A-Za-z][A-Za-z0-9]*`(, `[A-Za-z][A-Za-z0-9]*`)+$/ { exit 1 }
    ' || fail "$semantic must enumerate typed transitions/outcomes"

    suffix=$(printf '%s\n' "$semantic" |
        sed -n 's/^VIT-LSEM-\([0-9][0-9][0-9]-g[0-9][0-9]\)-v[1-9][0-9]*$/\1/p')
    expected="VIT-LST-${suffix}-P, VIT-LST-${suffix}-N, VIT-LST-${suffix}-M, VIT-LST-${suffix}-F"
    [ "$tests" = "$expected" ] ||
        fail "$semantic must bind its exact P/N/M/F contracts"
    [ "$gate" = "realization gate is later of effective and \`0.18.3\`; then implementation and P/N/M/F tests required" ] ||
        fail "$semantic has a noncanonical resolution gate"

    case "$reference" in
        VIT-LAW-006@*)
            for outcome in DefinitelyNotStarted OutcomeUnknown StartClaimedReconciling; do
                case "$transitions" in
                    *"\`$outcome\`"*) ;;
                    *) fail "$semantic omits typed transmission outcome $outcome" ;;
                esac
            done
            ;;
        VIT-LAW-008@g01)
            for symbol in ActiveRolloutGeneration CatalogReceiptAuthenticationV1 CatalogActivationAuthorizationReceipt CatalogGlobalActivationResultReceipt WorkloadLeaseActionAuthorityPortV1 ConsumedWorkloadLeaseActionClaim WorkloadLeaseActionClaimIssuanceUnknown WorkloadLeaseActionClaimOutcomeUnknown ActivationAuthorized Superseded; do
                case "$transitions" in
                    *"\`$symbol\`"*) ;;
                    *) fail "$semantic omits catalog rollout symbol $symbol" ;;
                esac
            done
            ;;
        VIT-LAW-008@g02)
            for symbol in Uninitialized TopologyMutationAuthorizationState TrustedTopologyAuthorizationTime TopologyAuthorizationTimeUnavailable TopologyAuthorizationAdmissionBudgetV1 TopologyAuthorizationPresentationRateBudgetV1 TopologyAuthorizationRequestRateBudgetV1 TopologyAuthorizationPresentationRateLimited TopologyAuthorizationRequestSequence TopologyAuthorizationPrincipalBudgetKey TopologyAuthorizationBudgetClass TopologyAuthorizationBreakGlassReserve TopologyAuthorizationOriginalQuotaClaimSetV1 TopologyAuthorizationOutstandingReservation TopologyAuthorizationReceiptRevocationIntentV1 TopologyAuthorizationConsumerTerminalOutcomeV1 TopologyAuthorizationConsumerDispositionV1 TopologyAuthorizationConsumerReconciliationEvidenceV1 TopologyAuthorizationConsumerTerminalReceiptV1 TopologyAuthorizationConsumerReconciliationReceiptV1 ReservationSettlementId SettleTopologyAuthorizationOutstandingReservation AuthorizationIssuanceSequence IssueTopologyMutationAuthorization TopologyMutationAuthorizationIssuanceUnknown TopologyMutationAuthorizationReceiptV1 TopologyAuthorizationReplayLifecycleV1 TopologyAuthorizationRequestReplayCheckpointV1 CheckpointTopologyAuthorizationRequestReplayState CompactTopologyAuthorizationRequestReplayState RejectLateCompactedTopologyAuthorizationRequest TopologyAuthorizationReplayCheckpointV1 TopologyAuthorizationIssuedRangeManifestV1 TopologyAuthorizationIssuedRangeChunkV1 TopologyAuthorizationRangeProofBudgetV1 TopologyAuthorizationRangeVerificationCursor TopologyAuthorizationConsumerSparseCommitment ConsumerCompactionEligibleThrough TopologyAuthorizationPermanentlyUnresolved CheckpointTopologyAuthorizationReplayState CompactTopologyAuthorizationReplayState RejectLateCompactedTopologyAuthorization TopologyAuthorizationHistoricalStateUnavailable AdvanceTopologyAuthorizationTimeRatchet AuthorizeTopologyMutation DeadlineConditionalTopologyCasV1 ConsumeTopologyMutationAuthorization TopologyMutationCommittedBeforeDeadline TopologyMutationDefinitelyNotCommitted TopologyMutationCommitReconciling TopologyMutationAuthorizationExpired InitializeTopologyAuthorityHandoff DormantInitialized CommitTopologyAuthorityHandoff Committed CurrentPlacementTopologyReceiptV1 FencePlacementGeneration CatalogTopologyChanged TopologyMutationAuthorizationBlocked; do
                case "$transitions" in
                    *"\`$symbol\`"*) ;;
                    *) fail "$semantic omits topology rollout symbol $symbol" ;;
                esac
            done
            ;;
        VIT-LAW-007@g02)
            for symbol in ChallengeCurrentPlacementTopology AdvanceTopologyReceiptSequence LastObservedTopologyGeneration LastObservedTopologyReceiptSequence ReadCurrentPlacementTopologyForAdmission RecheckTopologyAtReadiness RecheckTopologyAtDispatch RecheckTopologyAtTransmissionStart RejectStaleTopologyReceipt TopologyGenerationUnavailable TopologyPlacementMismatch; do
                case "$transitions" in
                    *"\`$symbol\`"*) ;;
                    *) fail "$semantic omits dynamic admission symbol $symbol" ;;
                esac
            done
            ;;
    esac

    gate_version=$(awk -v effective="$effective" '
        function value(version, parts) {
            split(version, parts, ".")
            return parts[1] * 1000000 + parts[2] * 1000 + parts[3]
        }
        BEGIN {
            if (value(effective) < value("0.18.3")) print "0.18.3"
            else print effective
        }
    ')
    status=$(awk -F'|' -v target="$gate_version" '
        $1 == target { print substr($0, index($0, "|") + 1); exit }
    ' "$tmp_dir/statuses")
    [ -n "$status" ] ||
        fail "$semantic cannot resolve realization-gate status $gate_version"
    case "$status" in
        *planned*) ;;
        *)
            source_path=$(printf '%s\n' "$rust_path" | tr -d '`')
            recovery_path=$(printf '%s\n' "$recovery" | tr -d '`')
            semantic_path=crates/vitheim-law/src/semantic.rs
            test_path=crates/vitheim-law/tests/semantic_contracts.rs
            for required_path in "$source_path" "$recovery_path" \
                "$semantic_path" "$test_path"; do
                [ -f "$required_path" ] ||
                    fail "$semantic requires missing $required_path"
            done
            grep -Fq "$semantic" "$source_path" ||
                fail "$semantic is absent from $source_path"
            grep -Fq "$semantic" "$recovery_path" ||
                fail "$semantic is absent from $recovery_path"
            grep -Fq "$semantic" "$semantic_path" ||
                fail "$semantic is absent from the closed semantic registry"
            grep -Fq 'enum LawSemanticId' "$semantic_path" ||
                fail "closed LawSemanticId enum is absent"
            grep -Fq 'LawSemanticRealization' "$semantic_path" ||
                fail "LawSemanticRealization dispatch table is absent"
            symbols=$(printf '%s\n' "$transitions" |
                sed 's/`, `/ /g; s/`//g')
            for symbol in $symbols; do
                if ! grep -Fq "$symbol" "$source_path" &&
                    ! grep -Fq "$symbol" "$semantic_path"; then
                    fail "$semantic typed symbol $symbol is not realized"
                fi
            done
            test_ids=$(printf '%s\n' "$tests" | tr -d ',')
            for test_id in $test_ids; do
                grep -Fq "$test_id" "$test_path" ||
                    fail "$semantic test contract $test_id is not realized"
            done
            ;;
    esac
done <"$tmp_dir/realizations"

echo "law semantic realization policy passed"
