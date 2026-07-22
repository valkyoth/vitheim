# Phase C — Storage Portability

Scope: `0.21.0–0.30.0`. Domain code sees semantic ports only. Each hosted
adapter requires an independently approved safe implementation strategy.

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
schedule, tenant corpus, cleanup, and evidence format.

Goal: make production-support claims depend on identical observable behavior.

Deliverables: reusable adapter harness, mandatory capability matrix, randomized
state machine, and machine-readable conformance report.

Verification: prove deliberately broken reference adapters fail each relevant
test; run memory adapter through all atomicity/isolation/recovery cases.

Exit criteria: an adapter cannot claim support by skipping or weakening tests.
`v0.22.0 implementation stop reached. Run pentest for this exact commit.`

## `0.23.0` — SQLite Adapter

Status: planned; blocked until a safe hosted implementation is approved.

Setup: document single-node limits, file ownership, journal mode, transactions,
busy handling, migrations, backup, cancellation, and tenant keys.

Goal: support development, evaluation, tests, and documented single-node use.

Deliverables: semantic adapter, migration set, secure file setup, backup/restore
tooling, and capability profile.

Verification: injection, locking, crash rollback, symlink/permission attacks,
tenant isolation, interrupted migration, restore, and conformance pass.

Exit criteria: no HA claim and all single-node semantics are evidenced.
`v0.23.0 implementation stop reached. Run pentest for this exact commit.`

## `0.24.0` — PostgreSQL Reference Adapter

Status: planned; blocked until a safe hosted implementation is approved.

Setup: define TLS/authentication, least-privilege roles, transaction/isolation
levels, prepared queries, tenant partitioning, migrations, and cancellation.

Goal: establish the deepest-tested reference production backend.

Deliverables: journal/projection/outbox/inbox/lease/config adapters, migrations,
operator guide, backup/restore, and observability.

Verification: injection, auth downgrade, transaction crashes, concurrent append,
tenant bypass, pool exhaustion, migration rollback, restore, and conformance pass.

Exit criteria: production claims match tested deployment profiles only.
`v0.24.0 implementation stop reached. Run pentest for this exact commit.`

## `0.25.0` — MySQL Adapter

Status: planned; blocked until a safe hosted implementation is approved.

Setup: map isolation, locking, encodings/collations, identifier limits, TLS/auth,
transactions, migrations, and cancellation against canonical semantics.

Goal: provide equal business correctness despite backend differences.

Deliverables: semantic adapter, migration/operation guide, capability profile,
and portability discrepancy register.

Verification: encoding/collation confusion, isolation anomalies, injection,
deadlock retry, rollback, tenant partition, restore, and conformance pass.

Exit criteria: no backend-specific behavior leaks into domain correctness.
`v0.25.0 implementation stop reached. Run pentest for this exact commit.`

## `0.26.0` — MongoDB Adapter

Status: planned; blocked until a safe hosted implementation is approved.

Setup: map sessions/transactions, collections, indexes, write concerns, tenant
keys, migrations, retry semantics, and topology limits.

Goal: preserve canonical event-journal behavior on a document backend.

Deliverables: semantic adapter, collection/index definitions, capability profile,
backup/restore procedure, and divergence notes.

Verification: operator/query injection, partial transactions, retry duplication,
cross-tenant filters, failover, migration interruption, and conformance pass.

Exit criteria: document flexibility never weakens mandatory journal semantics.
`v0.26.0 implementation stop reached. Run pentest for this exact commit.`

## `0.27.0` — SurrealDB Adapter

Status: planned; blocked until a safe hosted implementation is approved.

Setup: map namespace/database selection, transactions, graph features, auth,
query parameters, migrations, capability probes, and version support.

Goal: use graph capabilities as optimization without changing correctness.

Deliverables: semantic adapter, schema/migrations, capability profile, graph
optimization boundary, and operational guide.

Verification: namespace escape, query injection, unauthorized edges, transaction
failure, capability lies, backup/restore, and full conformance pass.

Exit criteria: optional graph behavior is replaceable and policy equivalent.
`v0.27.0 implementation stop reached. Run pentest for this exact commit.`

## `0.28.0` — Blob-Store API And Filesystem Adapter

Status: planned.

Setup: define immutable blob ID/digest, tenant namespace, staged upload, size and
ratio limits, quarantine, atomic publish, deletion policy, and filesystem root.

Goal: store large content outside event streams without path-based authority.

Deliverables: blob semantic port, secure filesystem adapter, manifest/integrity
model, quarantine lifecycle, and conformance tests.

Verification: traversal, absolute paths, symlink/hardlink races, digest mismatch,
partial writes, quota exhaustion, tenant confusion, and restore pass.

Exit criteria: callers never control storage paths and content is verified.
`v0.28.0 implementation stop reached. Run pentest for this exact commit.`

## `0.29.0` — Migration Registry And Resumable Migrations

Status: planned.

Setup: define immutable migration identity/hash, ordering, preconditions,
forward/rollback steps, leases, checkpoints, signatures, and operator approval.

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

