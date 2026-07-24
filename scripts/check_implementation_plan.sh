#!/usr/bin/env sh
set -eu

failed=0

for minor in $(seq 1 150); do
    version="0.$minor.0"
    count="$(grep -R -l "^## \`$version\`" docs/implementation | wc -l)"
    if [ "$count" -ne 1 ]; then
        echo "implementation plan: expected one heading for $version, found $count" >&2
        failed=1
    fi
done

production_count="$(grep -R -l '^# `1\.0\.0`' docs/implementation | wc -l)"
if [ "$production_count" -ne 1 ]; then
    echo "implementation plan: expected one 1.0.0 production document" >&2
    failed=1
fi

extra_versions="
0.8.1 0.15.1 0.16.1 0.17.1 0.18.1 0.18.2 0.18.3 0.18.4 0.18.5 0.20.1 0.20.2 0.20.3
0.28.1 0.28.2 0.28.3 0.30.1 0.30.2 0.36.1
0.38.1 0.38.2 0.38.3 0.39.1 0.39.2 0.39.3 0.39.4 0.40.1 0.48.1 0.48.2
0.51.1 0.51.2 0.52.1 0.53.1 0.53.2 0.53.3 0.54.1 0.56.1
0.71.1 0.71.2 0.71.3 0.78.1 0.78.2 0.78.3 0.78.4 0.78.5
0.82.1 0.86.1 0.88.1 0.88.2 0.88.3 0.89.1
0.93.1 0.98.1 0.98.2
0.116.1 0.118.1 0.118.2
0.120.1 0.120.2 0.120.3 0.120.4 0.120.5
0.132.1 0.132.2
0.138.1 0.138.2 0.138.3
0.140.1 0.140.2 0.140.3 0.140.4 0.140.5 0.140.6 0.140.7 0.140.8 0.140.9 0.140.10
0.142.1
"

for version in $extra_versions; do
    count="$(grep -R -l "^## \`$version\`" docs/implementation | wc -l)"
    if [ "$count" -ne 1 ]; then
        echo "implementation plan: expected one heading for $version, found $count" >&2
        failed=1
    fi
done

for field in Status Setup Goal Deliverables Verification 'Exit criteria'; do
    count="$(grep -R -o "$field:" docs/implementation | wc -l)"
    if [ "$count" -lt 225 ]; then
        echo "implementation plan: field '$field' appears only $count times" >&2
        failed=1
    fi
done

pentest_count="$(
    grep -R -E -o 'Run (final )?pentest for this exact commit' \
        docs/implementation |
        wc -l
)"
if [ "$pentest_count" -ne 228 ]; then
    echo "implementation plan: expected 228 exact-commit pentest stops, found $pentest_count" >&2
    failed=1
fi

require_text() {
    file="$1"
    text="$2"
    label="$3"
    if ! grep -Fq "$text" "$file"; then
        echo "implementation plan: missing semantic anchor '$label' in $file" >&2
        failed=1
    fi
}

require_text docs/implementation/PHASE_B.md \
    '`EffectExecutionState`:' 'effect execution state'
require_text docs/implementation/PHASE_B.md \
    '`RemoteOutcome`:' 'remote outcome'
require_text docs/implementation/PHASE_B.md \
    '`ResolutionSource`:' 'resolution source'
require_text docs/implementation/PHASE_B.md \
    'The default is `CommitAndDispatch`.' \
    'current dispatch authorization default'
require_text docs/implementation/PHASE_B.md \
    '`EffectExecutionAuthority`:' \
    'typed delayed execution authority'
require_text docs/implementation/PHASE_B.md \
    'Every grant lineage declares exactly one authoritative stream owner.' \
    'single authoritative grant-lineage owner'
require_text docs/implementation/PHASE_B.md \
    'Grant redemption and attempt consumption use a `GrantRedemptionGuard`' \
    'local grant-redemption linearization'
require_text docs/implementation/PHASE_B.md \
    'Every `CommitAndDispatch` operation also carries a bounded, canonically ordered' \
    'complete dispatch-authority fence set'
require_text docs/implementation/PHASE_B.md \
    'bounded `QuotaClaimSet`' \
    'bounded multi-kind quota claims'
require_text docs/implementation/PHASE_B.md \
    'Quota ledgers and claim sets are local transactional authorities' \
    'quota claim sets are not aggregate streams'
require_text docs/implementation/PHASE_B.md \
    'Every claim in an atomic set resides in the same local transactional quota' \
    'single-partition quota topology'
require_text docs/implementation/PHASE_B.md \
    'Each `QuotaCapacityLease` binds exactly one `QuotaKind`, unit, accounting' \
    'per-kind quota-capacity encumbrance'
require_text docs/implementation/PHASE_B.md \
    'Every current-target dispatch also carries a typed `DispatchTargetFence`' \
    'co-transactional current-target fence'
require_text docs/implementation/PHASE_B.md \
    'Remote provider state never masquerades as a `DispatchTargetFence`' \
    'remote target concurrency remains separate from local fencing'
require_text docs/implementation/PHASE_B.md \
    '`RemoteTargetConcurrencyProfile`: `NotApplicable`, `ConditionalMutation`' \
    'typed remote target concurrency profile'
require_text docs/implementation/PHASE_B.md \
    '`RemoteMutationExceptionGuard`. Dispatch advances only the effect stream' \
    'revocable guarded unconditional mutation authority'
require_text docs/implementation/PHASE_B.md \
    'Every `CommitAndDispatch` authorization receipt carries a bounded' \
    'bounded redemption-to-transmission authority window'
require_text docs/implementation/PHASE_B.md \
    'Immediately before adapter I/O, the worker executes a local' \
    'current-fence transmission-start claim'
require_text docs/implementation/PHASE_B.md \
    '`TransmissionStartClaimId`, exact authenticated `WorkerInstanceId`, permitted' \
    'unique worker-instance transmission claimant'
require_text docs/implementation/PHASE_B.md \
    'The claiming worker is the trusted `TransmissionExecutor` instance' \
    'trusted executor owns transmission claim and socket'
require_text docs/implementation/PHASE_B.md \
    'Transferable cryptographic start capabilities are unsupported for `1.0.0`' \
    'no unsupported permit transport profile'
require_text docs/implementation/PHASE_B.md \
    'manager drives `QuotaCapacityTransferState` through `ReservedAtParent`' \
    'explicit capacity-transfer process manager'
require_text docs/implementation/PHASE_B.md \
    'once by stable receipt; message delivery is at least once' \
    'local receipt idempotency and at-least-once transfer delivery'
require_text docs/implementation/PHASE_B.md \
    'It also binds the tenant or global accounting owner, hierarchy root and parent-' \
    'immutable capacity-transfer accounting hierarchy'
require_text docs/implementation/PHASE_B.md \
    'There is no cross-class adjustment command for existing capacity' \
    'existing capacity has no cross-class adjustment escape hatch'
require_text docs/implementation/PHASE_B.md \
    'Each policy lineage has exactly one authoritative owner stream and is scoped to' \
    'one-parent atomic capacity-policy authority'
require_text docs/implementation/PHASE_B.md \
    'distinct `ManageQuotaProtectedFloors` capability' \
    'independently governed protected-floor capability'
require_text docs/implementation/PHASE_B.md \
    'A `QuotaCapacityRolloutRoot` has one' \
    'root-owned complete parent rollout manifest'
require_text docs/implementation/PHASE_B.md \
    'Each parent activation is a new local transaction that locks its `Prepared`' \
    'fresh post-finalization parent activation'
require_text docs/implementation/PHASE_B.md \
    '`PlatformSafetyFloorKey`: accounting owner and hierarchy root' \
    'fully typed platform safety floor ratchet'
require_text docs/implementation/PHASE_B.md \
    'Every executor runs under an immutable, versioned `ProviderExecutionProfile`' \
    'scoped provider execution authority'
require_text docs/implementation/PHASE_B.md \
    'Every admitted profile scope has exactly one authoritative' \
    'revocable provider execution profile lineage'
require_text docs/implementation/PHASE_B.md \
    'Profile authority is created and changed only through typed' \
    'governed provider execution profile lifecycle'
require_text docs/implementation/PHASE_B.md \
    'Provider-side credential rotation is not described as one atomic transaction.' \
    'asynchronous provider credential rotation'
require_text docs/implementation/PHASE_B.md \
    'Every credential lineage has exactly one authoritative owner.' \
    'serialized credential rotation lineage'
require_text docs/implementation/PHASE_B.md \
    'Permission comparison uses a canonical `ProviderPermissionComparison` result:' \
    'semantic provider permission comparison'
require_text docs/implementation/PHASE_B.md \
    'capability epoch and places the entire credential in' \
    'whole-credential capability quarantine'
require_text docs/implementation/PHASE_B.md \
    'Evaluator code is authority-bearing. Each provider owns one authoritative' \
    'governed provider permission evaluator lineage'
require_text docs/implementation/PHASE_B.md \
    'Quarantine has an evidence-backed owner state machine:' \
    'evidence-backed credential quarantine resolution'
require_text docs/implementation/PHASE_B.md \
    'Credential recovery uses a separate' \
    'independent provider credential remediation authority'
require_text docs/implementation/PHASE_B.md \
    'Every credential generation also owns a versioned' \
    'provider credential capability snapshot'
require_text docs/implementation/PHASE_B.md \
    'Credential operations use one explicit `ProviderCredentialOperationProfile`.' \
    'explicit bearer versus non-exportable credential profile'
require_text docs/implementation/PHASE_B.md \
    '## `0.18.3` — Machine-Checkable Invariant Ownership Registry' \
    'invariant ownership corrective milestone'
require_text docs/implementation/PHASE_B.md \
    'formally backfill all authority declared from' \
    'complete foundational invariant backfill'
require_text docs/INVARIANT_OWNERSHIP.md \
    '## Lifecycle And Supersession Registry' \
    'machine-readable invariant lifecycle'
require_text docs/LAW_GENERATIONS.md \
    '# Composite Security Law Generations' \
    'canonical historical composite-law generations'
require_text docs/LAW_GENERATION_MANIFEST.md \
    '# Law Generation Manifest' \
    'content-bound machine-readable law-generation schema'
require_text docs/LAW_MANIFEST_ADMISSIONS.md \
    '# Law Manifest Admission Set' \
    'independently trusted law-manifest admission catalog'
require_text docs/LAW_ACTIVE_CATALOGS.md \
    '# Active Law Catalogs' \
    'milestone-scoped active law catalogs'
require_text docs/LAW_ACTIVE_CATALOGS.md \
    '`LawManifestAdmissionEnvelopeV1` content-binds these fields' \
    'content-bound active catalog envelope'
require_text docs/LAW_ACTIVE_CATALOGS.md \
    'exact profile enum: `CompiledCatalog` or `SignedCatalog`' \
    'unambiguous active catalog profile'
require_text docs/LAW_ACTIVE_CATALOGS.md \
    '## Project-Owned Artifact Verification' \
    'shared runtime and release catalog verifier'
require_text docs/LAW_ACTIVE_CATALOGS.md \
    '## Trustworthy Bounded-Window Time' \
    'bounded-window authoritative time contract'
require_text docs/LAW_ACTIVE_CATALOGS.md \
    '## Canonical Local Admission Owner' \
    'canonical non-clonable local catalog owner'
require_text docs/LAW_ACTIVE_CATALOGS.md \
    '## Durable Distributed Rollout' \
    'durable distributed catalog rollout protocol'
require_text docs/LAW_ACTIVE_CATALOGS.md \
    '### Workload Identity And Receipt Assurance' \
    'executable workload identity and receipt assurance'
require_text docs/LAW_ACTIVE_CATALOGS.md \
    '## Placement Topology Authority' \
    'independent placement topology authority'
require_text docs/LAW_ACTIVE_CATALOGS.md \
    'monotonic `ActiveRolloutGeneration`' \
    'serialized catalog rollout generation'
require_text docs/LAW_ACTIVE_CATALOGS.md \
    '`ActivationAuthorized` is an irreversible authorization-commit state' \
    'irreversible catalog activation authorization'
require_text docs/LAW_ACTIVE_CATALOGS.md \
    '`Superseded` is the permanent losing-candidate state' \
    'permanent competing-rollout loser state'
require_text docs/LAW_ACTIVE_CATALOGS.md \
    '`Uninitialized`, `DormantInitialized`, or `Committed`' \
    'closed topology authority handoff state'
require_text docs/LAW_ACTIVE_CATALOGS.md \
    '`WorkloadLeaseActionClaim`' \
    'online single-use orchestrator action claim'
require_text docs/LAW_ACTIVE_CATALOGS.md \
    '`WorkloadLeaseActionAuthorityPortV1` is the explicit external trust boundary' \
    'workload action claim ownership and crash semantics'
require_text docs/LAW_ACTIVE_CATALOGS.md \
    '`CatalogActivationAuthorizationReceipt` binds authorization ID' \
    'authenticated activation authorization receipt'
require_text docs/LAW_ACTIVE_CATALOGS.md \
    '`CatalogGlobalActivationResultReceipt` binds that authorization' \
    'authenticated global activation result receipt'
require_text docs/LAW_ACTIVE_CATALOGS.md \
    'gives receivers `VerifyMac` only' \
    'receiver cannot forge authority MAC receipts'
require_text docs/LAW_ACTIVE_CATALOGS.md \
    '`WorkloadSignedReceipt`' \
    'closed catalog receipt authentication variants'
require_text docs/implementation/PHASE_B.md \
    '<!-- vitheim-invariant VIT-INV-057 0.18.3 -->' \
    'owned global active law catalog lineage'
require_text docs/implementation/PHASE_B.md \
    '<!-- vitheim-invariant VIT-INV-058 0.18.3 -->' \
    'independently owned local catalog admission ratchet'
require_text docs/implementation/PHASE_B.md \
    '<!-- vitheim-invariant VIT-INV-059 0.18.3 -->' \
    'durable catalog rollout process-manager owner'
require_text docs/implementation/PHASE_B.md \
    '<!-- vitheim-law VIT-LAW-007 0.18.3 -->' \
    'catalog admission composite law'
require_text docs/implementation/PHASE_B.md \
    '<!-- vitheim-law VIT-LAW-008 0.18.3 -->' \
    'catalog rollout composite law'
require_text docs/implementation/PHASE_O.md \
    '<!-- vitheim-invariant VIT-INV-060 0.141.0 -->' \
    'independent dynamic placement topology owner'
require_text docs/implementation/PHASE_O.md \
    '<!-- vitheim-invariant VIT-INV-061 0.141.0 -->' \
    'independent topology-authorization issuer'
require_text docs/implementation/OPTION_DECISIONS.md \
    '`TrustedTopologyAuthorizationTime` capability' \
    'trusted topology-authorization time profile'
require_text docs/implementation/OPTION_DECISIONS.md \
    '`InitializeTopologyAuthorityHandoff` is five minutes' \
    'concrete topology-authorization class lifetime'
require_text docs/implementation/PHASE_O.md \
    'authorization-time profile/epoch/continuity substitution; expiry-versus-CAS' \
    'topology-authorization expiry race verification'
require_text docs/LAW_SEMANTIC_REALIZATIONS.md \
    '# Law Semantic Realization Registry' \
    'executable law semantic realization registry'
require_text docs/AUTHORITY_REVIEWS.md \
    '# Milestone Authority Reviews' \
    'post-bootstrap milestone authority dispositions'
require_text docs/implementation/PHASE_B.md \
    '## `0.18.4` — Bounded Evaluator Re-evaluation Scheduler' \
    'bounded evaluator reevaluation milestone'
require_text docs/implementation/PHASE_B.md \
    'soon as status no longer contains `planned`' \
    'authority proposal status transition gate'
require_text docs/implementation/PHASE_C.md \
    '`VIT-LAW-001@g02`' \
    'generation-pinned storage conformance'
require_text docs/implementation/PHASE_C.md \
    '`TopologyMutationAuthorizationReceiptV1` canonical bytes/digest' \
    'canonical topology authorization receipt storage'
require_text docs/implementation/PHASE_C.md \
    '`DeadlineConditionalTopologyCasV1`' \
    'deadline-conditional topology commit port'
require_text docs/implementation/PHASE_C.md \
    '`latest + maximum_commit_slack < commit_before` at the backend' \
    'backend-authoritative topology commit deadline'
require_text docs/implementation/PHASE_C.md \
    'pauses immediately after lock acquisition, after trusted-time observation' \
    'deadline commit pause-point oracle'
require_text docs/implementation/PHASE_C.md \
    'unsupported and refuse dynamic-topology-owner startup' \
    'backend refusal without deadline proof'
require_text docs/implementation/PHASE_C.md \
    'mechanism/profile and result ledger' \
    'deadline mechanism migration preservation'
require_text docs/implementation/PHASE_C.md \
    'Freeze `TopologyAuthorizationReplayLifecycleV1`' \
    'bounded topology authorization replay lifecycle'
require_text docs/implementation/PHASE_C.md \
    '`TopologyAuthorizationReplayCheckpointV1`' \
    'authenticated topology replay checkpoint'
require_text docs/implementation/PHASE_C.md \
    '`TopologyAuthorizationHistoricalStateUnavailable`' \
    'fail-closed unavailable historical state'
require_text docs/implementation/PHASE_C.md \
    '`TopologyAuthorizationIssuedRangeManifestV1`' \
    'authenticated issuer range evidence'
require_text docs/implementation/PHASE_C.md \
    '`ConsumerCompactionEligibleThrough`' \
    'proven consumer dense-compaction eligibility'
require_text docs/implementation/PHASE_C.md \
    'independent rate/outstanding counters; a small per-deployment break-glass' \
    'isolated topology emergency capacity'
require_text docs/implementation/OPTION_DECISIONS.md \
    'attempt-rate and outstanding-authorization limits' \
    'production topology replay horizon decision'
require_text docs/implementation/PHASE_O.md \
    'topology-authorization sustained-abuse/quota/horizon/' \
    'topology replay bounded-storage soak'
require_text docs/implementation/PHASE_B.md \
    '`EvaluatorInvalidationCampaignRoot`' \
    'durable evaluator invalidation campaign root'
require_text docs/implementation/PHASE_B.md \
    '## `0.18.5` — Remediation Authority Bootstrap And Recovery' \
    'remediation root-of-trust milestone'
require_text docs/implementation/PHASE_B.md \
    'The root also owns a monotonic `ActiveRolloutGeneration`' \
    'single active successor rollout generation'
require_text docs/implementation/PHASE_B.md \
    'Cancellation with no prepared parent may terminate the generation directly.' \
    'prepared rollout cancellation recovery'
require_text docs/implementation/PHASE_B.md \
    'Each parent-side reserve/send/reclaim transition' \
    'delayed capacity transfer rechecks current authority'
require_text docs/implementation/PHASE_B.md \
    'All composite local transactions use one acquisition order: authoritative' \
    'canonical composite transaction acquisition'
require_text docs/implementation/OPTION_DECISIONS.md \
    'active/active authoritative multi-region writes are' \
    'active-active authoritative writes unsupported'
require_text docs/implementation/PHASE_B.md \
    '`ProviderRateToken`:' \
    'provider-rate quota settlement'
require_text docs/implementation/PHASE_D.md \
    'Every related derived surface receives an independent' \
    'independent derived-surface disposition'
require_text docs/implementation/PHASE_E.md \
    'approval-to-execution-grant command/receipt' \
    'scheduled change execution grant'
require_text docs/implementation/PHASE_G.md \
    'network-call-in-transaction rejection, crash points' \
    'Phase G network/crash verification'
require_text docs/implementation/PHASE_G.md \
    'original-to-compensation linkage' \
    'complete compensation deliverables'
require_text docs/implementation/PHASE_G.md \
    'A timer supplies time and wakeup only: it cannot create authority.' \
    'timer cannot create authority'
require_text docs/implementation/PHASE_O.md \
    'whole quota claim-set digest/member restoration' \
    'whole quota-set disaster recovery'

if [ "$failed" -ne 0 ]; then
    exit 1
fi

scripts/check_invariant_ownership.sh
scripts/check_law_generations.sh
scripts/check_authority_reviews.sh
scripts/check_law_semantic_realizations.sh
scripts/check_law_active_catalogs.sh
scripts/check_law_policy_adversarial.sh
