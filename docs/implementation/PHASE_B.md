# Phase B — Journal And Projection Mechanics

Scope: `0.11.0–0.20.0`. Pure semantic contracts and project-owned in-memory
implementations establish ordering, replay, idempotency, and integrity.

## `0.11.0` — Semantic Event-Journal Interface

Status: planned.

Setup: define tenant-scoped stream kind/identity, expected version, atomic batch,
ordered range read, append receipt, and explicit unsupported semantics.

Goal: make persistence requirements precise without generic CRUD.

Deliverables: project-owned `EventJournal` port, request/result types, contract
docs, and adapter conformance cases.

Verification: omitted tenant, empty/oversized batch, wrong expected version,
partial success, ordering ambiguity, and capability-negotiation tests pass.

Exit criteria: no compliant adapter can reinterpret atomicity or isolation.
`v0.11.0 implementation stop reached. Run pentest for this exact commit.`

## `0.12.0` — Deterministic In-Memory Journal

Status: planned.

Setup: choose bounded memory ownership, stream/partition indexing, failure
injection points, and deterministic allocation/exhaustion behavior.

Goal: provide the reference journal for tests and semantics.

Deliverables: in-memory adapter, state inspection fixture, injected failure
controls, and conformance-suite integration.

Verification: cross-stream/tenant isolation, stable ordering, bounded reads,
atomic rollback, restart snapshots, and randomized operation sequences pass.

Exit criteria: the adapter is a deterministic oracle, not a production claim.
`v0.12.0 implementation stop reached. Run pentest for this exact commit.`

## `0.13.0` — Expected-Version Concurrency

Status: planned.

Setup: define absent/exact/any version policy, conflict evidence, retry limits,
and command/idempotency interaction.

Goal: prevent lost updates and duplicated facts under concurrent writers.

Deliverables: compare-and-append semantics, conflict results, request-digest-bound
command receipts, race test harness, and stale-writer documentation. Normal
writes require `ExpectedVersion::Exact`; `Any` is restricted to authorized
recovery/import under an exclusive fenced lease.

Verification: two-writer interleavings, replayed commands, stale snapshots,
failed-retry nonmutation, and model-checked linearization cases pass.

Exit criteria: exactly one conflicting append wins with complete evidence.
`v0.13.0 implementation stop reached. Run pentest for this exact commit.`

## `0.14.0` — Snapshots And Validation

Status: planned.

Setup: define snapshot identity, stream/version binding, codec/schema version,
integrity metadata, size limits, and rebuild fallback.

Goal: accelerate replay without letting snapshots become authority.

Deliverables: snapshot port/model, pure validation, memory adapter, and safe
discard/rebuild behavior.

Verification: stale, future, forged, truncated, cross-stream/tenant, corrupted,
oversized, and schema-incompatible snapshots all fail safely.

Exit criteria: rejecting a snapshot always falls back to bounded event replay.
`v0.14.0 implementation stop reached. Run pentest for this exact commit.`

## `0.15.0` — Projection Engine And Checkpoints

Status: planned.

Setup: define projector identity/version, ordered input, atomic output/checkpoint,
rebuild namespace, consistency token, and poison policy.

Goal: create disposable read models without losing or duplicating facts.

Deliverables: projection runner, checkpoint port, memory read model, rebuild
command, and lag/consistency reporting.

Verification: duplicates, gaps, reorder, crash windows, corrupt checkpoints,
rebuild equivalence, tenant isolation, and bounded batch tests pass.

Exit criteria: projections can be erased and recreated exactly from authority.
`v0.15.0 implementation stop reached. Run pentest for this exact commit.`

## `0.16.0` — Transactional Outbox Model

Status: planned.

Setup: bind exact-version CAS, consecutive events, stream head, request-digest
receipt, outbox entries, integrity links, authority-owned uniqueness indexes,
destination, payload version, attempt policy, and one database transaction.

Goal: prevent committed business facts from losing required asynchronous work.

Deliverables: outbox semantic types/port, atomic memory implementation, dispatcher
claim/ack protocol, and failure fixtures.

Verification: fail before/during/after commit, duplicate dispatch, crash before
ack, poison payload, tenant routing, and rollback tests pass.

Exit criteria: no observable state contains only one side of the transaction.
`v0.16.0 implementation stop reached. Run pentest for this exact commit.`

## `0.17.0` — Inbox And Idempotent Consumers

Status: planned.

Setup: define message identity, source/destination scope, receipt lifetime,
effect transaction boundary, duplicate response, and replay audit.

Goal: make at-least-once delivery safe without claiming global exactly-once.

Deliverables: inbox port, consumer wrapper, memory implementation, duplicate
receipt query, and recovery fixtures.

Verification: concurrent duplicates, crash windows, forged IDs, cross-tenant
receipts, expired/replayed messages, and atomic effect tests pass.
Expiry cannot re-enable non-idempotent work unless the upstream replay horizon
is independently bounded. The same command ID and digest returns the stored
outcome; the same ID with a different digest is a conflict without side effects.

Exit criteria: retries cannot repeat protected effects or hide duplicates.
`v0.17.0 implementation stop reached. Run pentest for this exact commit.`

## `0.18.0` — Leases, Timers, And Scheduler Primitives

Status: planned.

Setup: specify logical/host time boundary, lease token/fencing, renewal/expiry,
timer identity, retry/backoff limits, jitter injection, and quotas.

Goal: coordinate bounded background work without double ownership.

Deliverables: lease/scheduler ports, memory implementation, fencing tokens,
deterministic clock testkit, and poison escalation.

Verification: clock jumps, lease loss, stale holder, concurrent acquisition,
retry storms, overflow, cancellation, and model interleavings pass.

Exit criteria: expired or unfenced workers cannot commit protected work.
`v0.18.0 implementation stop reached. Run pentest for this exact commit.`

## `0.19.0` — Integrity Chains And Signed-Checkpoint Interface

Status: planned.

Setup: bind tenant, partition, stream, sequence, event/schema IDs, payload digest,
predecessor, and key ID; define partition Merkle commitments, external signed
anchors, checkpoint cadence, rotation, independent timestamp option, and limits.

Goal: make event deletion, replacement, and reordering detectable.

Deliverables: integrity-link model, crypto-provider interface only, partition
commitment, externally retained checkpoint format, cross-signed rotation,
verification report, and corruption locator.

Verification: deletion of an entire stream, reorder/substitution/splice, wrong
stream/tenant/key, anchor loss, rotation, timestamp semantics, truncated chain,
recovery verification, digest collision fixture, and bounded verify pass.

Exit criteria: tamper evidence is deterministic without inventing cryptography.
`v0.19.0 implementation stop reached. Run pentest for this exact commit.`

## `0.20.0` — Replay, Verification, And Rebuild CLI

Status: planned.

Setup: define read-only defaults, explicit repair authorization, scope selectors,
resource budgets, resumable progress, report format, and secret redaction.

Goal: safely diagnose journals and rebuild projections operationally.

Deliverables: hosted CLI, stream/integrity verification, projection rebuild,
dry-run repair plan, and signed evidence output.

Verification: corrupt/huge streams, interruption/resume, wrong tenant, unsafe
repair attempts, report injection, rebuild equivalence, and operator UX pass.

Exit criteria: verification cannot mutate state and repair never runs implicitly.
`v0.20.0 implementation stop reached. Run pentest for this exact commit.`
