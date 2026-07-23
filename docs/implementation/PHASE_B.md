# Phase B — Journal And Projection Mechanics

Scope: `0.11.0–0.20.0`. Pure semantic contracts and project-owned in-memory
implementations establish ordering, replay, idempotency, and integrity.

## `0.11.0` — Semantic Event-Journal Interface

Status: planned.

Setup: define tenant-scoped stream kind/identity, expected version, atomic batch,
ordered range read, append receipt, one aggregate stream per transaction, and
explicit unsupported semantics. Cross-aggregate work uses versioned process-
manager decisions and transactional outbox messages, never multi-aggregate
mutation hidden behind the port.

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
integrity metadata, size limits, original event-byte hash authority, pure
versioned upcasters, unknown-event quarantine, and rebuild fallback.

Goal: accelerate replay without letting snapshots become authority.

Deliverables: snapshot port/model, pure validation, memory adapter, golden
mixed-version event corpus, upcaster chain, and safe discard/rebuild behavior.

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
command, and externally serializable consistency/read-your-write token plus
lag reporting.

Verification: duplicates, gaps, reorder, crash windows, corrupt checkpoints,
rebuild equivalence, tenant isolation, and bounded batch tests pass.

Exit criteria: projections can be erased and recreated exactly from authority.
`v0.15.0 implementation stop reached. Run pentest for this exact commit.`

## `0.15.1` — Security Audit Envelope And Durable Intent

Status: planned.

Setup: define canonical bounded security-audit facts and authoritative intents
before transactional mutation exists. Separate successful domain-event facts
from attempted/authorized/denied/rejected security actions; bind tenant, actor,
remote actor assertions, authentication assurance, purpose, policy/version,
resource/action/field class, command/request digest, result, correlation/
causation, time, classification, and idempotency. Define the mandatory-audit
action registry and safe metadata rules from `0.8.1`.

Goal: make required audit evidence part of the commit protocol rather than a
best-effort write to a later sink.

Deliverables: `SecurityAuditFact`, `SecurityAuditIntent`, audit/rejection receipt
models, canonical codec, redaction/classification rules, atomic commit contract,
memory authority, and fixtures for successful and denied operations.

Verification: missing/mismatched tenant/actor/policy/result, forged attribution,
duplicate rejection, command/audit digest mismatch, secret/payload injection,
classification downgrade, oversized facts, crash points, canonical round trips,
property tests, and fuzzing pass.

Exit criteria: every operation classified as mandatory-audit has a bounded
authoritative audit intent that can commit atomically with its outcome.
`v0.15.1 implementation stop reached. Run pentest for this exact commit.`

## `0.16.0` — Transactional Outbox Model

Status: planned.

Setup: bind exact-version CAS, consecutive events, stream head, request-digest
receipt, authoritative `0.15.1` audit intent, outbox entries, integrity links,
authority-owned uniqueness indexes, destination, payload version, attempt
policy, and one database transaction. Denied/rejected commands atomically commit
their idempotent outcome plus audit fact but no domain events, stream advance,
business outbox, or state effect.
Outbox routing contains protected references rather than pre-rendered sensitive
bodies and cannot copy fields forbidden by the `0.8.1` lifecycle.

Goal: prevent committed business facts from losing required asynchronous work
or mandatory audit evidence.

Deliverables: outbox semantic types/port, command-commit unit including audit
authority, atomic memory implementation, dispatcher claim/ack protocol, and
failure fixtures.

Verification: fail before/during/after every event/receipt/audit/outbox write,
successful mutation without audit, denied mutation with domain events, duplicate
dispatch/audit, crash before ack, poison payload, tenant routing, and rollback pass.

Exit criteria: no successful protected mutation exists without its authoritative
audit intent, and no rejected mutation produces business state or effects.
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

## `0.18.1` — Durable Quota Accounting

Status: planned.

Setup: define tenant/resource quota identity, atomic reservation/commit/refund,
concurrent-use leases, retry/idempotency binding, fairness, reconciliation,
overflow behavior, and administrator adjustment evidence.

Goal: make resource limits durable correctness controls rather than process-local
counters.

Deliverables: project-owned quota ledger/reservation port, deterministic memory
adapter, recovery reconciler, and contention model.

Verification: concurrent oversubscription, crash after reserve/use/refund,
duplicate retry, lease loss, starvation, integer overflow, forged adjustment,
cross-tenant accounting, and reconciliation tests pass.

Exit criteria: admitted work cannot exceed a durable quota through concurrency
or retry. `v0.18.1 implementation stop reached. Run pentest for this exact commit.`

## `0.19.0` — Integrity Chains And Signed-Checkpoint Interface

Status: planned; blocked until this milestone approves an implementation-
admission record for every hash, signing, KMS, and timestamp implementation.

Setup: bind tenant, partition, stream, sequence, event/schema IDs, payload digest,
predecessor, and key ID; define partition Merkle commitments, external signed
anchors, checkpoint cadence, rotation, independent timestamp option, and limits.

Goal: make event deletion, replacement, and reordering detectable.

Deliverables: integrity-link model, crypto-provider interface only, partition
commitment, externally retained checkpoint format, cross-signed rotation,
verification report, corruption locator, and the signed admission record binding
the reviewed implementation/profile versions.

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

## `0.20.1` — Security Audit Projection, Access Receipts, And Journal

Status: planned.

Setup: project authoritative `0.15.1` intents into a separately queryable,
integrity-anchored audit journal; cover command rejection, authorization denial,
sensitive reads/searches/exports/downloads, administration, plugin calls, AI
context, and federation. For protected reads/downloads, durably record the
authorization receipt before releasing bytes. Streaming operations record
start, bounded progress/byte counts, completion or abortion. Define redaction,
retention, access/export, rebuild, lag, and explicit outage classes.

Goal: provide complete security investigation evidence without making the
separate audit projection the sole authority or pretending denials are domain events.

Deliverables: audit projector/journal port, access-release guard, streaming audit
lifecycle, memory journal, query/export policy, integrity/retention hooks,
rebuild/lag verifier, and operation-class outage matrix.

Verification: domain rejection produces no domain event/outbox effect while one
deduplicated authoritative fact remains; crash after command commit rebuilds the
audit journal; crash before read receipt releases no protected bytes; stream
abort/completion and byte counts reconcile. Audit outage fails closed for
mandatory-audit operations, while explicitly non-mandatory health/static
operations follow their documented policy. Spoofing, log injection, secret
leakage, cross-tenant reads, replay, truncation, retention, and anchors pass.

Exit criteria: every mandatory security action is durably auditable or fails
closed. Audit evidence never changes the aggregate decision, but required audit
authority is a prerequisite for committing or releasing the protected outcome. `v0.20.1
implementation stop reached. Run pentest for this exact commit.`

## `0.20.2` — Hosted Telemetry Semantics And Instrumentation Contract

Status: planned.

Setup: define correlation/causation and validated trace-context propagation,
tenant/data classification, redaction, bounded metric label vocabulary and
cardinality, monotonic counters/histograms, lag/saturation/retry/quota/queue/
projection measurements, health/liveness/readiness, clock semantics, sampling,
buffer/drop/backpressure, and failure isolation. Secrets, sensitive payloads,
raw user IDs, attacker-controlled strings, and unbounded resource identifiers
are prohibited from labels/log fields.

Goal: establish instrumentation conventions before hosted adapters, workers,
connectors, plugins, federation, and product services proliferate.

Deliverables: project-owned telemetry event/metric/trace/health ports, schema
registry, redaction/cardinality gates, no-op and bounded-memory collectors,
fake clock/context, instrumentation conformance suite, and adapter checklist.

Verification: tenant/secret/payload leaks, label cardinality explosion, trace
spoofing/cycles, correlation confusion, clock jumps, recursive telemetry,
buffer exhaustion, exporter backpressure simulation, dropped-signal accounting,
readiness lies, and telemetry-disabled semantic equivalence pass.

Exit criteria: every later hosted milestone instruments the same bounded
tenant-safe contract, and telemetry failure cannot grant authority or corrupt
domain correctness. `v0.20.2 implementation stop reached. Run pentest for this exact commit.`
