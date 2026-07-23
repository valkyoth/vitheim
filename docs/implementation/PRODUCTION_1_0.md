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
  quota partitions/hierarchical capacity leases, authoritative-region failover,
  backpressure, incident, and DR runbooks. Active/active authoritative multi-
  region writes are explicitly unsupported.
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
  allocation. Cross-partition set, lease over-allocation/reclamation/failover,
  distributed work transaction, and active/active authoritative-write requests
  fail closed.
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
