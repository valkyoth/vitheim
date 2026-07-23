# `1.0.0` — Serious Production Release

Status: planned; never reached by date or version count alone.

Setup: select an exact unchanged `v1.0.0-rc.N` commit and artifact set that has
passed every preceding gate, independent external pentest, clean retest,
reproducible build comparison, compatibility freeze, and operational exercise.
The decisions in `0.140.1–0.140.10` are frozen, their selected profiles have
passed Phase O, and unsupported alternatives are excluded from release claims.

Goal: release the first production-supported Vitheim platform with claims no
broader than its evidence.

Deliverables:
- Stable API v1, event compatibility, plugin ABI v1, pack/export formats, and
  agent protocol with migration/support policy.
- Production ITSM, SecOps, assets/service graph, knowledge, risk/compliance,
  cases, vulnerability management, workflow/policy, composable interfaces,
  lexical and selected semantic search, on-call/paging/notification preferences,
  SLI/SLO/error budgets, service health/status communications, governed plugin
  catalog/connectors, optional federation/AI, and administration.
- Supported single-node/HA/regional profiles; backup, restore, rebuild, upgrade,
  rollback, health, live/grant/service-principal execution authority, multi-kind
  quota settlement/fair recovery capacity, guarded grant-attempt claims, local
  authority-fence epochs, guarded remote-mutation exceptions, canonical
  composite transaction retry, bounded transmission-start permits, quota
  partitions/hierarchical per-kind capacity encumbrances, immutable existing
  capacity classes, unique claimant/lease-bound one-time permit return, atomic
  one-parent capacity policy, governed protected-floor reduction, root-manifest
  complete-parent rollout, current delayed-transfer authority,
  authoritative-region failover,
  backpressure, incident, and DR runbooks. Active/active authoritative
  multi-region writes are explicitly unsupported.
- Signed source/artifacts/checksums, SBOM, provenance, licenses, compatibility
  evidence, pentest report, and complete release notes.
- A production support matrix that names the selected dependency/crypto/KMS,
  tenant/storage, identity/session, plugin, privacy/residency, deployment,
  API/SDK/publication, AI, interchange, and federation profiles—and explicitly
  names unsupported options.

Verification:
- Full tenant/authorization matrix across API/UI/search/workflow/plugins/AI/
  exports/attachments/notifications/admin, including every effect-intent and
  live-subject/grant/service-principal issuance/redemption/revocation and
  dispatch enforcement point, freshness profile, immutable binding, revocation
  race, offline-human impersonation, and worker confused-deputy case; every
  untrusted parser fuzzed.
- Independent crypto review, plugin escape and AI injection/tool-abuse suites,
  storage conformance, migration/restore/rebuild/workflow continuation tests.
- Crash-point proof that protected commands cannot commit without authoritative
  audit intent; every applicable `0.18.2` command/consumer/timer/activity/
  poison bundle component is atomic and integrity linked; fence and quota
  consumption share the effect transaction. Each bundle advances at most one
  authoritative aggregate stream and contains local durable effects only;
  provider/network dispatch and results are separate at-least-once transitions
  with no distributed exactly-once claim. Stable effect identity/request digest,
  declared provider idempotency/replay horizon, distinct execution/provider-
  outcome/resolution-evidence/operational-workflow/compensation models,
  reconciliation deadlines/escalation, and authorized manual-resolution races
  prove an ambiguous privileged or non-compensable effect is never blindly
  retried and an assessment never becomes verified provider truth. Commit-time
  authorization is mandatory; current fenced single-use dispatch authorization
  is proven for every privileged, destructive, secret-bearing, containment, and
  compensation effect. Dispatch redeems current `LiveSubjectAuthority`, exact
  `ApprovedExecutionGrant`, or current `ServicePrincipalAuthority`. Grant
  evidence covers approvers/quorum/separation, assurance at approval, exact
  effect/request/target version, purpose, window, attempts, policy, and
  revocation. A worker authenticates as itself; a valid scheduled grant survives
  ordinary approver-session expiry without impersonation, while target drift,
  explicit revocation, tenant suspension, grant exhaustion, and required
  approver/policy revalidation prevent provider I/O. Every grant lineage proves
  one authoritative owner: inline approval/grant transitions share one stream,
  or immutable approval receipt plus outbox/process manager creates a dedicated
  lineage stream. Crash/reorder/duplicate and pre-issuance-revocation evidence
  proves delayed issuance cannot bypass revocation; successor creation
  atomically and permanently supersedes its predecessor in the owner stream.
  Redemption evidence proves a co-located `GrantRedemptionGuard` is created,
  revoked, and replaced beside the lineage owner, while dispatch advances only
  the effect stream and atomically compare-and-claims one stable attempt plus
  receipt/outbox. Revocation/final-attempt concurrency, crash after claim before
  provider I/O, duplicate/substituted claim/receipt, target/version drift,
  failover/restore, and invalid grant-plus-effect two-stream adapters prove
  attempts cannot be duplicated or resurrected.
  Dispatch evidence also proves the complete bounded
  `DispatchAuthorityFenceSet` is locked in the effect transaction. Tenant
  suspension; human/principal disablement; session/logout, credential/mapping,
  delegation, group/role/relationship, and policy changes race on monotonic
  local epochs rather than read-before-commit checks. Missing/substituted/
  reordered/non-local fences, epoch rollback/reuse, and bounded-stale external
  authority for privileged work fail closed.
  Every current-target dispatch also proves a typed `DispatchTargetFence`.
  Same-aggregate work uses exact expected stream version/digest; different-
  aggregate work locks the target-owner-maintained co-located row binding tenant,
  kind/ID, version/digest, lifecycle, and deletion/supersession epoch. Deletion,
  merge, migration, supersession, stale projection, cross-shard placement, and
  restore races cannot authorize provider I/O or advance a second stream.
  Provider-owned targets prove a separate `RemoteTargetConcurrencyProfile`,
  never a local fence. Conditional dispatch binds the exact provider/account/
  resource, strong validator and provenance, admitted provider capability/
  version, request digest, and idempotency key. Provider precondition failure is
  typed non-acceptance and cannot trigger validator refresh; response loss
  remains unknown. Every privileged/destructive/containment unconditional path
  cites one exact `RemoteMutationException` with one owner, exact scope,
  approvers/quorum/separation, policy/provider epochs, assurance, time, attempts,
  and compensating controls. Dispatch claims its co-located guard without
  advancing the exception stream; revocation, expiry, supersession, provider-
  capability change, final-attempt concurrency, retry, and restore cannot make
  stale exception authority redeemable.
  Every admitted dispatch receipt binds immutable `redeemed_at` and
  `transmit_before`, effect attempt, permitted service audience,
  provider/account/request digest, and admitted epochs. Immediately before I/O,
  it rechecks current fences and CAS-binds one globally unique claim to the exact
  authenticated worker instance, lease generation/fence, receipt/effect attempt,
  and permit digest. The trusted `TransmissionExecutor` owns the claim and
  provider socket; upstream/split-service workers submit immutable authenticated
  instructions and receive status, never permit material. Its sealed non-
  `Clone`, non-serializable permit is consumed by value and best-effort zeroized,
  while its stored digest is evidence only. Duplicate instruction, executor
  failover, replacement worker, ambiguous claim delivery, and uncertain post-
  claim start are `OutcomeUnknown` and cannot be ordinarily retransmitted.
  Pause, failover, restore, or clock rollback cannot extend, reconstruct, or
  replay the permit. Transferable permit profiles are unsupported for `1.0.0`.
  Quota evidence proves bounded atomic claim sets and correct settlement for
  concurrency leases, consumable operations, provider-rate tokens, estimated
  liabilities, and retained bytes across their exact boundaries. Only provider-
  dependent claims hold for unknown outcomes; refunds are evidence-bound and
  exactly once; actual-cost settlement and administrative write-off remain
  distinct from provider refund truth; compensation has separate claims. Quota
  state is co-transactional local authority rather than an aggregate stream.
  Every set reserves all-or-none under canonical deadlock-free ordering, binds
  immutable ordered membership to an opaque token/digest, and transitions as
  that exact set without member reacquisition. Concurrent overlap, partial-
  reservation crash/failover, token/member substitution, and restore tests prove
  partial or corrupt sets are quarantined rather than reconstructed. Every set
  shares one local quota partition with its work bundle; fenced hierarchical
  capacity leases supply global/regional limits while conserving parent/child
  allocation and binding kind/unit/period/settlement. Expiry stops new
  reservation but preserves retained bytes, unknown liabilities, charged
  operations, spent rate tokens, and every other encumbrance until original
  settlement or fenced transfer. Transfer uses a stable
  `QuotaCapacityTransferState` outbox/inbox lineage with source/destination
  epochs, digest, sequence, receipts, authenticated acknowledgement, and old-
  child fence proof. Local transitions are exactly once by receipt while
  delivery remains at least once; uncertainty stays conservatively charged and
  double-entry recovery never makes capacity free at both ends. Child loss,
  late evidence, duplicate/reordered delivery, lost acknowledgement, conflicting
  transfer, and parent reclamation racing failover cannot lose or recreate
  capacity. Transfer binds accounting owner, hierarchy root/parent lease,
  period, work/recovery lane, capacity class, residency/region, and source/
  destination authorization; ordinary transfer cannot change them or convert
  emergency/security-cleanup/reconciliation capacity into business capacity.
  Existing capacity never changes class. Only future unallocated parent capacity
  can be resized through a fenced, simulated, separation-of-duties
  `QuotaCapacityPolicy` change that cannot be tenant invoked. Each policy
  lineage owns one parent; activation atomically appends its event and CAS-
  updates the co-located parent ledger using the base policy epoch, parent
  epoch/high-watermark, exact deltas, simulation digest, and independently
  governed floor-set version. Floor reductions require a separate capability/
  approval lineage, current tenant/hierarchy/incident/emergency/policy fences,
  protected-obligation simulation, append-only epochs, a stable profile ID/
  version/digest and durable per-class platform-floor admission ratchet, and
  cross-command separation from spending released capacity. Nodes below the
  admitted floor reject startup; mixed versions use the stricter profile, a
  higher floor uses a governed capacity migration, and downgrade/rollback/
  restore or lower software defaults cannot release capacity. Multi-parent
  finalization CAS-validates a root-owned canonical manifest, unchanged
  membership epoch, every exact parent preparation, and total per-class
  conservation, but only permits activation. Each parent then locks its prepared
  state and freshly CAS-revalidates ledger epoch/high-watermark/unallocated
  capacity, floor ratchet/set, protected obligations, finalized root generation/
  manifest, and current tenant/hierarchy/incident/emergency/principal/policy
  fences. Drift remains at the conservative intersection as
  `ActivationBlocked` or `ReconciliationRequired`. Each delayed transfer
  transition rechecks current local tenant/principal/policy epochs rather than
  trusting historical decisions.
  Cross-partition set, distributed work transaction, and
  active/active authoritative-write requests fail closed. Composite transactions
  use the canonical stream/authority-fence/target-fence/remote-exception-guard/
  grant-guard/quota/uniqueness/receipt order; bounded
  retries preserve identity/digest/version/fence state and never repeat I/O.
  Provider-outage and hostile-tenant tests prove per-tenant/work-class ceilings,
  global fair share, starvation bounds, and scoped non-borrowable emergency
  capacity preserve bounded reconciliation and security cleanup.
  Denial-only audit chains anchor;
  protected reads/downloads cannot release bytes before audit receipt;
  streaming completion/abort reconciles.
- Workload authentication, customer-observation storage, paging delivery,
  hosted status publication, in-process secret handling, and any selected CMDB
  connector pass their exact production-profile failure and recovery suites.
- The tenant data-surface registry is complete for every store, cache, index,
  backup, and external copy; closure exercises fail visibly on missing
  disposition state. External-copy evidence distinguishes locally verified
  deletion, controlled-key erasure, provider attestation, unconfirmed request,
  and unverifiable disclosed plaintext without overstating proof. Historical
  SLOs reproduce from retained raw observations or admissible integrity-bound
  rollups; rollup-substitution expiry evidence proves the rollup manifest was
  committed, integrity verified, externally checkpointed, and restored
  successfully.
  Controlling mandatory-erasure, maximum-retention, and closure exercises still
  delete raw data when that proof is missing and independently dispose rollup
  payloads, source manifests, derived results, projections/caches, exports, and
  linkable checkpoint metadata. A non-authoritative rollup remains only when
  independently permitted; otherwise only allowed non-sensitive tombstone/
  authority-loss evidence remains. Affected history is unknown either way.
  Registry evidence also proves `0.51.2` backfilled every earlier surface and
  mechanically gated every surface introduced thereafter without an outward
  dependency from foundation/domain crates.
- Workload authentication uses the selected external-issuer OAuth resource-
  server profile; privileged access is sender constrained, any bearer profile
  is lower-assurance and non-privileged, and replay caching is not credited as
  preventing first use of theft. Vitheim exposes no OAuth token endpoint or
  client-private-key custody. Wasm guest-memory canaries confirm no plaintext
  credential enters any supported plugin path.
- Reproducible builds, clean install/upgrade/rollback/failover, load/soak/chaos,
  secure defaults, accessibility, localization, and disaster-recovery exercises.
- Decision-record conformance proves each shipped artifact and deployment
  matches the reviewed `0.140.1–0.140.10` choices without silent fallback.
- Every selected interchange, semantic-index, and embedding-generation profile
  cites its earlier implementation admission, conformance corpus, pentest, and
  operational owner; missing profiles and unselected SCIM/STIX/SIEM/CMDB
  directions are explicitly unsupported.

Exit criteria: no acceptance criterion is waived for schedule. Any candidate
code or artifact change creates a new RC and repeats affected review. After the
final exact commit and artifacts pass the final independent pentest, stop for
explicit maintainer authorization before creating `v1.0.0`; publishing crates
remains forbidden except for a separately approved SDK. `v1.0.0 implementation
stop reached. Run final pentest for this exact commit and artifact set.`
