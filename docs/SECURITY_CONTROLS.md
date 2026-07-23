# Security Controls

## Repository Baseline

- Rust `1.97.1`, edition 2024, resolver 3, warnings denied.
- Unsafe Rust forbidden workspace-wide.
- Panics, unwraps, expects, unreachable paths, TODOs, and debug macros denied
  by Clippy in production code.
- No third-party Cargo sources and no crate publication.
- Every Rust library currently `no_std`; every Rust source file at most 500
  lines.
- Locked builds, full action SHA pins, read-only CI permissions, and no
  persisted checkout credentials.
- Format, check, unit, documentation, Clippy, source-policy, link, license,
  advisory, and SBOM gates.

## Development Controls

Every change needs:

- a release-plan assignment and bounded scope;
- threat-model and attack-surface delta;
- positive, negative, boundary, and regression tests;
- property tests for state or algebraic invariants;
- fuzzing for untrusted syntax and decoders;
- authorization and tenant-isolation cases for affected reads/actions;
- failure-injection for persistence and distributed behavior;
- documentation, changelog, and release-note updates;
- exact-commit pentest and clean retest before tagging.

Tests must prove both acceptance and rejection. A rejected operation must not
partially mutate state, consume authority, expose hidden fields, or omit an
audit decision.

## Runtime Controls Planned Before Production

- Secure configuration defaults and startup validation.
- Strong tenant partitions in storage, search, queues, caches, blobs, logs,
  exports, metrics labels, and backups.
- Authentication independent from authorization; sender-constrained privileged
  workloads; explicitly lower-assurance, non-privileged bearer policy;
  deny-by-default authorization.
- Field-level redaction preserved through API, search, reports, notifications,
  AI context, audit, and exports.
- Single-aggregate transactional local effects for command, consumer, timer,
  activity, and poison transitions; distinct dispatch/results; inbox/outbox,
  fencing, quotas, bounded retries, backpressure, and explicitly at-least-once
  remote calls. Stable external-effect identities and request digests bind
  provider idempotency/replay horizons, separate execution/provider-outcome/
  resolution-evidence/operational-workflow/compensation types, reconciliation
  deadlines, escalation, and authorized manual resolution. Assessment is not
  provider truth; unknown privileged or non-compensable work is never retried
  blindly. Effect intent always requires commit-time authorization and binds
  tenant, initiator, delegation, capability, target, purpose, request, policy,
  authentication assurance, and typed live-subject, approved-grant, or service-
  principal execution authority. Approved grants bind exact effect/request/
  target/version, purpose, approvers/quorum/separation, assurance at approval,
  window, attempts, policy, and revocation. Workers authenticate as themselves
  and never impersonate offline humans. Reviewed low-risk immutable effects may
  be `CommitBound`; privileged, destructive, secret-bearing, containment, and
  compensation effects are `CommitAndDispatch` and require fenced single-use
  authority redemption. Session expiry alone does not invalidate a grant;
  revocation, target drift, tenant suspension, grant exhaustion, and required
  approver/policy revalidation fail closed. Workers and leases confer no
  business authority, and binding substitution is forbidden. Every grant
  lineage has one authoritative stream: inline ownership stays in the approval
  aggregate; dedicated ownership uses immutable approval receipt plus outbox/
  process-manager continuation. Pre-issuance revocation wins, generation
  identities are unique, and a successor atomically leaves the superseded grant
  permanently non-redeemable in that owner stream. Redemption is linearized by
  a co-located fenced local `GrantRedemptionGuard`: lineage-owner transitions
  create/revoke/replace it, while dispatch advances only the effect stream and
  atomically compare-and-claims one bound attempt plus receipt/outbox. The guard
  serializes revocation/final-attempt races; retries and restore cannot create
  or resurrect consumption, and non-co-located or two-stream adapters fail.
- Durable quota accounting uses a bounded atomic claim set with typed
  concurrency, consumable-operation, provider-rate, estimated-liability, and
  retained-byte settlement. Only provider-dependent claims hold for unknown
  outcomes; concurrency releases with its lease, rate tokens become
  non-refundable at transmission, liabilities reconcile to actual cost or a
  distinct audited write-off, and byte claims follow local allocation/deletion.
  Refunds are evidence-bound and exactly once; manual assessment cannot mint
  provider evidence; compensation has separate claims. Claim sets are local
  transactional authority, not aggregate streams: canonical deadlock-free
  ordering reserves all members or none, an opaque token/digest freezes ordered
  membership, bundles never reacquire individual members, transitions are
  idempotent by set/claim identity, and partial restore/reconciliation is
  quarantined. Each set shares one local quota partition with its work bundle;
  wider limits allocate fenced hierarchical capacity leases into local
  partitions and conserve parent/child capacity without distributed work
  transactions. Active/active authoritative multi-region writes are unsupported
  at `1.0.0`; incompatible placement fails closed. Per-tenant/work-class
  ceilings, fair share, starvation bounds, and a scoped emergency reserve keep
  recovery available without tenant borrowing or monopolization.
- Capability-limited plugins and integrations; opaque secret handles and
  host-brokered authenticated operations; plaintext credentials never enter
  Wasm guest memory.
- Tamper-evident event and evidence history with independently stored signed
  checkpoints.
- Tested backup/restore, projection/search rebuild, workflow continuation,
  migration rollback, and disaster recovery.
- Typed tenant-surface disposition evidence that distinguishes local deletion/
  controlled-key erasure from provider attestations, unconfirmed requests, and
  unverifiable previously disclosed plaintext. A controlling mandatory erasure,
  maximum-retention, or closure deletion obligation outranks rollup
  preservation. Every raw/rollup/manifest/result/cache/export/checkpoint-
  metadata surface is disposed independently; lost historical authority is
  recorded without retaining prohibited sensitive/linkable content and exposed
  as unknown.
- Complete audit provenance without recording plaintext secrets.

## Release Decision

Critical and high findings block release. Medium and lower findings require
remediation or an explicit, scoped, time-bounded acceptance with owner,
compensating controls, review date, and expiry. No acceptance may waive tenant
isolation, audit immutability, or legal obligations.
