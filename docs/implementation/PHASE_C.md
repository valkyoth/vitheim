# Phase C — Storage Portability

Scope: `0.21.0–0.30.0`. Domain code sees semantic ports only. Each hosted
adapter requires an independently approved implementation-admission record
before code begins. The default `1.0.0` target is in-memory for semantics,
SQLite for single-node, and PostgreSQL for HA; MySQL, MongoDB, and SurrealDB are
experimental unless `0.140.2` promotes an evidenced profile.
Every database profile must implement every applicable negotiated `0.18.2`
`AtomicWorkCommitBundle` variant and every other mandatory semantic port claimed
for that profile, or fail startup capability negotiation. No adapter may
emulate a missing atomic component with a later best-effort write.

## `0.21.0` — Storage Capability Negotiation

Status: planned.

Setup: classify mandatory/optional capabilities, evidence version, startup
probe, downgrade policy, and fail-closed behavior.

Goal: prevent adapters from silently weakening correctness.

Deliverables: capability vocabulary, signed/probed report model, compatibility
decision engine, and operator diagnostics.

Verification: false/missing/conflicting claims, version skew, downgrade, probe
failure, and optional-performance fallback tests pass.

Exit criteria: correctness never depends on an unverified optional capability.
`v0.21.0 implementation stop reached. Run pentest for this exact commit.`

## `0.22.0` — Storage Conformance Testkit

Status: planned.

Setup: derive tests from every semantic port, define fault injection, concurrency
schedule, adversarial twin tenants with colliding local IDs, connection-session
state reuse, cleanup, administrator threat boundary, and evidence format.

Goal: make production-support claims depend on identical observable behavior.

Deliverables: reusable adapter harness, mandatory capability matrix, randomized
state machine, machine-readable conformance report, and destructive reference
adapters that each omit or split one `0.18.2` command/consumer/timer/activity/
poison bundle component: inbound or work receipt, events/head, fence validation,
audit intent, outbox, commitment, uniqueness claim, bounded quota claim-set/
per-kind transition, timer dispatch/result receipt, activity completion, or
dead-letter transition.
Include invalid reference adapters that accept two authoritative aggregate
streams, split an inline grant from its approval stream, mutate both approval
and dedicated grant streams, omit immutable approval receipt/outbox continuation,
treat quota state as another aggregate, partially reserve/reconstruct a claim
set, reacquire set members, or execute a network/provider call inside the
transaction.

Verification: prove every deliberately incomplete bundle adapter and adapters
that lose snapshots, scheduler state, quota state, rejection receipts, audit
authority, or integrity commitments fail the relevant capability/conformance
test; prove grant-owner ambiguity, approval/grant two-stream commits, delayed
issuance after pre-issuance revocation, successor fork, noncanonical overlapping-
set acquisition, partial claim-set reservation/restore, token/digest mismatch,
multi-stream, and remote-in-transaction adapters fail; run the memory adapter
through all atomicity/isolation/recovery cases.

Exit criteria: an adapter cannot claim support by skipping or weakening tests.
`v0.22.0 implementation stop reached. Run pentest for this exact commit.`

## `0.23.0` — SQLite Adapter

Status: planned; blocked until this milestone approves the exact SQLite driver,
bundling/native-code policy, maintenance, license, and file-encryption strategy.

Setup: document single-node limits, dedicated database-file-per-tenant strong
profile, shared-file evaluation-only profile, ownership, secure paths, journal
mode, transactions, busy handling, migrations, backup, cancellation, keys, and
the version-bound implementation-admission record.

Goal: support development, evaluation, tests, and documented single-node use.

Deliverables: semantic adapter, migration set, secure file setup, backup/restore
tooling, and capability profile.

Verification: injection, locking, crash rollback, symlink/permission attacks,
tenant isolation, interrupted migration, restore, and conformance pass.

Exit criteria: no HA claim and all single-node semantics are evidenced.
`v0.23.0 implementation stop reached. Run pentest for this exact commit.`

## `0.24.0` — PostgreSQL Reference Adapter

Status: planned; blocked until this milestone approves the exact PostgreSQL
driver, TLS stack/profile, pool, maintenance, license, and native-code policy.

Setup: define TLS/authentication, non-owner least-privilege role, composite keys/
foreign keys, `ENABLE` plus `FORCE ROW LEVEL SECURITY`, transaction-local tenant
binding with pool cleanup/startup probes, prepared queries, migrations, and cancellation.
Record the version-bound implementation admission before adapter code begins.

Goal: establish the deepest-tested reference production backend.

Deliverables: complete `0.18.2` atomic work-bundle variants plus journal, projection,
audit authority, rejection receipt, outbox, inbox, lease/scheduler, durable
quota with all-or-none canonical claim-set reservation/exact-token consumption,
grant-lineage ownership/process-manager state, snapshot, integrity commitment,
and configuration adapters; migrations, operator guide, backup/restore, and
observability. Startup fails capability negotiation if any mandatory semantic
component is absent.

Verification: injection, auth downgrade, transaction crashes, concurrent append,
grant issuance/revocation reorder, overlapping claim-set serialization,
deadlock/livelock, partial set crash/restore, tenant bypass, pool exhaustion,
migration rollback, restore, and conformance pass.

Exit criteria: production claims match tested deployment profiles only.
`v0.24.0 implementation stop reached. Run pentest for this exact commit.`

## `0.25.0` — MySQL Adapter

Status: planned experimental; blocked until a concrete requirement and
implementation-admission record approve the exact driver/TLS profile.

Setup: prefer database-per-tenant strong isolation; otherwise require composite
tenant constraints, generated statements, least-privilege views/routines, and
explicitly weaker non-production classification; map isolation, locking,
encodings/collations, TLS/auth, migrations, and cancellation.

Goal: evaluate portable business correctness without making a `1.0.0`
production-support claim by default.

Deliverables: semantic adapter, migration/operation guide, capability profile,
and portability discrepancy register.

Verification: encoding/collation confusion, isolation anomalies, injection,
deadlock retry, rollback, tenant partition, restore, and conformance pass.

Exit criteria: no backend-specific behavior leaks into domain correctness.
`v0.25.0 implementation stop reached. Run pentest for this exact commit.`

## `0.26.0` — MongoDB Adapter

Status: planned experimental; blocked until a concrete requirement and
implementation-admission record approve the exact driver/TLS profile.

Setup: bind tenant into every document ID, unique index, shard key, session and
transaction; co-locate stream head/events/receipts/outbox for atomicity; define
write concern, migrations, retry semantics, and topology limits.

Goal: evaluate canonical event-journal behavior on a document backend without a
`1.0.0` production-support claim by default.

Deliverables: semantic adapter, collection/index definitions, capability profile,
backup/restore procedure, and divergence notes.

Verification: operator/query injection, partial transactions, retry duplication,
cross-tenant filters, failover, migration interruption, and conformance pass.

Exit criteria: document flexibility never weakens mandatory journal semantics.
`v0.26.0 implementation stop reached. Run pentest for this exact commit.`

## `0.27.0` — SurrealDB Adapter

Status: planned experimental; blocked until a concrete requirement and
implementation-admission record approve the exact client/TLS profile.

Setup: use strict tenant namespaces/databases, schema and record permissions,
least-privilege non-system application identity, transactions, graph features,
query parameters, migrations, capability probes, and version support.

Goal: evaluate graph capabilities as optimization without changing correctness
or claiming default `1.0.0` support.

Deliverables: semantic adapter, schema/migrations, capability profile, graph
optimization boundary, and operational guide.

Verification: namespace escape, query injection, unauthorized edges, transaction
failure, capability lies, backup/restore, and full conformance pass.

Exit criteria: optional graph behavior is replaceable and policy equivalent.
`v0.27.0 implementation stop reached. Run pentest for this exact commit.`

## `0.28.0` — Blob-Store API And Filesystem Adapter

Status: planned; encryption work is blocked until this milestone approves its
hash/encryption implementation admission.

Setup: define immutable blob ID/digest, tenant/case scope, envelope encryption
and tenant/data-class keys, staged upload, limits, quarantine, atomic publish,
retention/legal hold/disposition hooks, deletion verification, and filesystem root.

Goal: store large content outside event streams without path-based authority.

Deliverables: blob semantic port, secure filesystem adapter, manifest/integrity
model, quarantine lifecycle, and conformance tests.

Verification: traversal, absolute paths, symlink/hardlink races, digest mismatch,
partial writes, quota exhaustion, tenant confusion, and restore pass.

Exit criteria: callers never control storage paths and content is verified.
`v0.28.0 implementation stop reached. Run pentest for this exact commit.`

## `0.28.1` — S3-Compatible Object-Storage Adapter

Status: planned; blocked until the exact client, TLS stack/profile, signing
scheme, maintenance, license, and native-code admission record is approved.

Setup: bind tenant/object namespace, immutable digest identity, multipart upload,
conditional publish, encryption metadata, retention/legal hold, versioning,
deletion verification, credentials, endpoints, redirects, cancellation, quotas,
backup/restore, and eventual-consistency limits to the `0.28.0` port.

Goal: provide HA-capable object storage without leaking S3 wire/client types
into inner crates.

Deliverables: S3-compatible adapter, capability probes, credential broker
integration, lifecycle configuration, conformance fixtures, and operator guide.

Verification: bucket/key confusion, cross-tenant access, SSRF/endpoint spoofing,
TLS downgrade, multipart races, stale versions, retention bypass, credential
leakage, partial delete, restore, and object-store conformance pass.

Exit criteria: multi-node blob claims use a tested immutable object profile, not
the local filesystem adapter. `v0.28.1 implementation stop reached. Run pentest for this exact commit.`

## `0.28.2` — KMS And Secret-Provider Adapters

Status: planned; blocked until exact KMS/secret clients, authentication, TLS,
cryptographic profiles, maintenance, licenses, and failure semantics are admitted.

Setup: bind tenant/data-class key hierarchy, key IDs/versions, wrap/unwrap/sign/
verify operations, rotation, revocation, recovery, destruction, caching limits,
service identity, audit, rate limits, outages, and provider substitution.

Goal: keep master keys and long-lived secrets outside Vitheim processes while
preserving provider-neutral inner ports.

Deliverables: KMS and secret-provider ports/adapters, fake provider, envelope-key
broker, capability probes, migration/rotation tooling, and operator runbook.

Verification: tenant/key confusion, stale/revoked keys, substitution, rollback,
cache leakage, confused deputy, outage/timeout/retry storms, rotation, destruction,
recovery, audit failure, and fail-closed behavior pass.

Exit criteria: no production encryption/signing path depends on filesystem keys
or plaintext configuration secrets. `v0.28.2 implementation stop reached. Run pentest for this exact commit.`

## `0.28.3` — In-Process Secret Handling

Status: planned; any zeroization or locked-memory implementation is blocked
until its exact implementation, platform behavior, maintenance, license,
unsafe/native-code use, and measurable assurance are admitted.

Setup: define non-`Debug`, non-`Display` secret wrappers; prohibit ordinary
clone, equality diagnostics, serialization, formatting, and telemetry; minimize
plaintext scope/lifetime; bound cache size and expiry; define best-effort
zeroization, panic/error redaction, crash/core-dump policy, swap and locked-
memory profiles where supported, and plugin/worker isolation. Document where
compiler, allocator, copies, platform dumps, or runtime behavior prevent a
perfect erasure guarantee.

Goal: reduce exposure after secrets enter process memory without making false
claims about guaranteed physical erasure.

Deliverables: project-owned secret-handle/value interfaces, scoped reveal API,
redacted error/diagnostic types, bounded expiring cache, admitted best-effort
zeroization adapter, platform hardening matrix and operator guide, crash-policy
checks, and secret-sink test harness.

Verification: compile-fail formatting/clone/serialization cases; panic, error,
audit, log, metric, trace, crash-report, heap-dump fixture, swap-profile,
cache-expiry, cancellation, worker/plugin memory, and fault-path tests; canary
scans prove plaintext does not enter prohibited sinks.

Exit criteria: each supported platform states its exact memory assurance and
limitations, and no secret can enter audit, telemetry, crash reports, plugin
linear memory, or durable configuration through a supported API. Integrations
requiring plaintext run only as separately isolated hosted profiles and are not
ordinary Wasm plugins. `v0.28.3
implementation stop reached. Run pentest for this exact commit.`

## `0.29.0` — Migration Registry And Resumable Migrations

Status: planned.

Setup: define immutable migration identity/hash, ordering, preconditions,
forward/rollback steps, leases, checkpoints, signatures, operator approval, and
an explicit ban on rewriting original event bytes; event evolution uses the
`0.8.0` registry and pure `0.14.0` upcasters.

Goal: make schema evolution auditable, interruptible, and recoverable.

Deliverables: registry, planner, dry run, resumable executor, rollback evidence,
and adapter migration contract.

Verification: reorder/substitution, partial failure, concurrent runner, lease loss,
downgrade, malicious input, retry, backup restore, and property tests pass.

Exit criteria: interrupted migrations cannot leave unclassified partial state.
`v0.29.0 implementation stop reached. Run pentest for this exact commit.`

## `0.30.0` — Cross-Backend Export And Import

Status: planned.

Setup: freeze canonical export version, tenant scope, event/blob manifests,
integrity checkpoints, encryption/signing ports, position mapping, and budgets.

Goal: migrate between backends without claiming direct database interchange.

Deliverables: streaming exporter/importer, preflight verifier, reconciliation
report, resumable checkpoints, and source/destination mapping.

Verification: truncation/substitution/reorder, wrong tenant/key/version, duplicate
resume, blob mismatch, exhaustion, round-trip, and cross-adapter conformance pass.

Exit criteria: successful import proves complete semantic and integrity parity.
`v0.30.0 implementation stop reached. Run pentest for this exact commit.`

## `0.30.1` — Durable Journal-Backed Work Queue

Status: planned.

Setup: define queue/topic identity, tenant scope, ordered/unordered semantics,
enqueue transaction, visibility lease/fencing, retry/backoff, dead-letter,
priority/fairness, payload references, cancellation, drain, quotas, and exact
mapping to the `0.18.2` consumer/timer/activity/poison atomic variants.
Queue delivery/acknowledgement is distinct from external-effect acceptance and
outcome. Preserve stable `EffectId`, request digest, attempt evidence,
idempotency/replay horizon, and each typed execution, remote-outcome,
resolution-evidence, operational-workflow, and compensation state across lease
expiry, redelivery, failover, and dead-letter movement. Preserve the immutable
authorization binding and freshness profile across queues; a worker must record
the required current dispatch decision, authenticate as itself, and redeem the
bound `LiveSubjectAuthority`, `ApprovedExecutionGrant`, or
`ServicePrincipalAuthority`; it cannot inherit business authority from queue or
lease possession or impersonate an offline approver. Preserve every bounded
quota claim's `QuotaKind`, settlement policy, amount/unit, reservation state,
declared boundary, evidence-backed transition, and separate compensation claim
set. Partition reconciliation/security lanes by tenant and work class with
ceilings, global fair-share scheduling, starvation bounds, and emergency reserve.
Preserve the one-owner grant-lineage rule and immutable approval-receipt/outbox
causation across queue delivery. Preserve `QuotaClaimSetId`, canonical digest,
opaque pre-reserved token, immutable ordered membership, and set/claim transition
idempotency; workers never reacquire individual quota members.

Goal: own an HA-capable durable queue profile without requiring a separate
message broker for correctness.

Deliverables: project-owned queue port, journal/outbox-backed PostgreSQL adapter,
memory fake, worker protocol, external-effect reconciliation scheduling and
manual-resolution queue, dispatch-authorization gate, quota-disposition
reconciler, execution-grant redemption/revocation handling, fair partitioned
control-plane lanes, grant-lineage issuance/successor process manager,
exact-token quota-set transition handler, capability report, and operational
metrics.

Verification: enqueue/commit crashes, duplicate delivery, receipt/effect split,
stale ack/fence, lease loss, dead-letter/effect split, quota/effect split,
poison loops, starvation, cross-tenant routing, sensitive payload leakage,
provider acceptance with lost worker response, blind retry after idempotency-key
expiry, unknown-outcome dead-letter or quota-hold loss, stale authority after
enqueue/lease, expired initiating session with a valid scheduled grant, grant
replay/attempt exhaustion/revocation, approval/policy/approver/target-version
drift, approval/grant crash-reorder-duplicate, pre-issuance revocation,
successor fork, target substitution, offline-human impersonation, worker
confused deputy, mixed quota-claim split, overlapping-set deadlock/livelock,
partial reservation/recovery, token/digest/membership substitution, failover
before exact-set consumption, concurrency lease held by remote uncertainty,
transmitted rate-token refund, cost settlement/write-off confusion, retained-
byte drift, duplicate refund, provider outage with exhausted tenant quota,
single-tenant reserve monopolization, global/per-tenant starvation, emergency-
reserve misuse, partition/failover, drain/restart, and model/conformance tests
pass.

Exit criteria: HA work dispatch has documented at-least-once delivery and
idempotent local-commit semantics, preserves the `0.18.2` external-effect
authorization, resolution, and quota contracts without collapsing their typed
dimensions, redeems durable grants without impersonation, preserves per-kind
settlement and single-stream grant ownership, consumes exact immutable quota
sets without reacquisition, keeps fair recovery available under hostile tenant
exhaustion, and has no process-local queue dependency.
`v0.30.1 implementation stop reached. Run pentest for this exact commit.`

## `0.30.2` — Cache Semantics And Hosted Adapter

Status: planned; hosted implementation is blocked until its exact client/TLS/
server profile and admission record are approved.

Setup: classify cacheable values, tenant/policy/version key material, TTL and
invalidation, revocation propagation, stampede control, size/entry quotas,
serialization, outage behavior, and authoritative fallback.

Goal: make caches disposable performance layers that cannot grant authority,
preserve erased data, or weaken read consistency.

Deliverables: cache semantic port, bounded memory adapter, optional hosted
adapter, invalidation protocol, capability probes, and conformance suite.

Verification: cross-tenant/policy-key collision, stale authorization, erasure/
retention leak, poisoning, stampede, eviction, outage, serialization ambiguity,
oversized values, and fallback-equivalence tests pass.

Exit criteria: disabling or losing a cache changes performance only and never
security or correctness. `v0.30.2 implementation stop reached. Run pentest for this exact commit.`
