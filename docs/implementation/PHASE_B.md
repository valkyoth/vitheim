# Phase B — Journal And Projection Mechanics

Scope: `0.11.0–0.20.0`. Pure semantic contracts and project-owned in-memory
implementations establish ordering, replay, idempotency, and integrity.
Every atomic bundle advances at most one authoritative aggregate stream.
“Effects” in this phase means local durable events, receipts, audit facts,
outbox intents, quota consumption, integrity commitments, uniqueness claims,
and scheduler/inbox state only. Network/provider calls and other external side
effects never join the database transaction; they execute at least once from a
committed outbox/work intent and return results through a later consumer or
activity-result bundle. No bundle claims distributed exactly-once execution.
Each external-effect capability declares a stable `EffectId` and request
digest, provider idempotency-key scope and retention, status-query/
reconciliation support, retry safety and maximum replay horizon, compensation
support, privilege/non-compensability class, authorization-freshness profile,
and quota-consumption boundary. It never collapses these typed dimensions:

- `EffectExecutionState`: `Pending`, `Leased`, `Dispatched`, `AwaitingResult`,
  `OutcomeUnknown`, `Resolved`, or `Abandoned`;
- `RemoteOutcome`: `Succeeded`, `Rejected`, `DefinitelyNotAccepted`,
  `TerminalFailure`, or `Cancelled`, present only with admissible provider
  evidence;
- `ResolutionSource`: `DirectResponse`, `SignedCallback`, `ProviderQuery`,
  `IdempotentReplay`, or `OperatorAssessment`, bound to immutable resolution
  evidence and its verification strength;
- `EffectResolutionWorkflowState`: `NotRequired`, `Reconciling`, `Escalated`,
  `ManualReview`, or `Closed`; and
- `CompensationState`: `NotRequired`, `Eligible`, `Requested`, `InProgress`,
  `OutcomeUnknown`, `Completed`, or `Abandoned`, with a separate compensation
  effect identity and full external-effect record linked to, but never
  overwriting, the original effect.

Authorization is required when the command commits an effect intent. The intent
immutably binds tenant, initiating subject, delegation chain and version,
capability/action, exact target identity and version/digest, purpose, request
digest, policy decision/version, and authentication assurance/expiry. Its typed
freshness profile is either `CommitBound` or `CommitAndDispatch`; there is no
dispatch-only profile. `CommitAndDispatch` is the default. `CommitBound` is
permitted only for a reviewed immutable-target, non-privileged, non-destructive,
non-secret-bearing action
whose semantics do not depend on continuing authority. Privileged, destructive,
secret-bearing, containment, and compensation effects always use
`CommitAndDispatch`.

A `CommitAndDispatch` worker independently reevaluates current policy, tenant
status, subject/employment status, delegation validity, authentication
assurance, capability, and target identity immediately before external I/O. It
commits a fenced, single-use dispatch-authorization receipt for that exact
attempt and binding. A change before that receipt denies/cancels dispatch,
records the reason and audit evidence, and makes no provider call; a concurrent
change after the receipt is retained as a race with an already admitted
attempt, never rewritten as unauthorized worker discretion. Lease ownership or
worker identity grants no business capability. A worker cannot substitute
tenant, subject, delegation, capability, target, purpose, or request bytes; any
binding mismatch requires a new authorized effect intent.

Quota accounting is another independent state machine. A capability declares
whether its reservation becomes consumed at admission or at the fenced dispatch
transition. `QuotaReservationState` distinguishes `Reserved`, `Consumed`,
`HeldPendingOutcome`, `RefundEligible`, `Refunded`, and `Released`;
`HeldPendingOutcome` continues to count against the governed limit. A
pre-dispatch cancellation or admissible `DefinitelyNotAccepted` evidence may
produce one evidence-bound refund/release transition. `OutcomeUnknown` remains
consumed/held until reconciliation supplies admissible evidence; operator
assessment cannot create refund eligibility. Compensation uses a separate
reservation and ledger identity. Reconciliation and security-cleanup work use
strictly scoped, audited control-plane reserve capacity that tenant exhaustion
cannot consume and that cannot admit new tenant business work.

Every capability sets a reconciliation deadline and escalation path. An
operator assessment may choose a safe local resolution or abandonment but
never creates a verified provider outcome. Unknown privileged or non-
compensable work is not blindly retried. Privileged resolution policy binds the
permitted principal kind, current authentication assurance, tenant/effect
scope, explicit resolution capability, reason, expiry, and required separation
of duties/quorum. Concurrent direct/callback/query evidence and manual
resolution use expected-version/fencing rules, retain both facts, and
deterministically reopen or supersede only the operational workflow; provider
evidence is never overwritten by an assessment.

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
policy, stable external `EffectId`/request digest, and one database transaction.
Each effect intent records its capability declaration, initial
`EffectExecutionState::Pending`, empty remote outcome, resolution deadline, and
immutable authorization binding and freshness profile before dispatch. The
binding covers tenant, initiating subject, delegation chain/version, capability,
exact target identity/version/digest, purpose, request digest, policy decision/
version, and authentication assurance/expiry. Denied/rejected commands atomically
commit their idempotent outcome plus audit fact but no domain events, stream
advance, business outbox, or state effect.
Outbox routing contains protected references rather than pre-rendered sensitive
bodies and cannot copy fields forbidden by the `0.8.1` lifecycle.

Goal: prevent committed business facts from losing required asynchronous work
or mandatory audit evidence.

Deliverables: outbox semantic types/port, separate external-effect execution,
remote-outcome, resolution-source/evidence, operational-resolution, and
compensation types, command-commit unit including audit authority, atomic
memory implementation, dispatcher claim/ack protocol, outcome query/
reconciliation port, authorization-binding/freshness types, dispatch-
authorization receipt contract, and failure fixtures.

Verification: fail before/during/after every event/receipt/audit/outbox write,
successful mutation without audit, denied mutation with domain events, duplicate
dispatch/audit, crash before ack, provider acceptance followed by lost response,
idempotency-key expiry/scope mismatch, execution state presented as remote
outcome, forged remote outcome, operator assessment presented as verified
provider evidence, forged resolution source, stale policy/delegation/
authentication binding, target or request substitution, lease-holder confused
deputy, poison payload, tenant routing, and rollback pass.

Exit criteria: no successful protected mutation exists without its authoritative
audit intent, no rejected mutation produces business state or effects, and
transport acknowledgement is never represented as a known provider outcome.
No effect can exist without a complete immutable commit-time authorization
binding and an explicit freshness profile.
`v0.16.0 implementation stop reached. Run pentest for this exact commit.`

## `0.16.1` — Atomic Command Commit Bundle

Status: planned.

Setup: freeze one project-owned `AtomicCommandCommitBundle` containing tenant
and aggregate stream, exact expected stream version, consecutive domain events,
command or rejection receipt, mandatory audit intent, business outbox entries,
integrity/commit digest, and authority-owned uniqueness claims. Define
successful, denied, rejected, and no-op variants without optional omission of
mandatory fields. Bind the canonical audit-intent and receipt digests into the
commitment. Quota reservation semantics are deliberately not frozen before
`0.18.1`; `0.18.2` adds the typed consumed reservation to the final work-commit
family.

Goal: give command handling one indivisible correctness contract rather than a
collection of individually transactional ports.

Deliverables: bounded bundle types and canonical codec, semantic validation,
atomic memory implementation, capability identifier/version, commit receipt,
failure-injection matrix, and denial-only integrity sequence. A denied or
rejected operation advances no domain stream, but its receipt and audit fact
enter a tenant-scoped hash-linked sequence with externally anchorable
checkpoints.

Verification: omit, duplicate, reorder, substitute, or cross-bind every bundle
component; fail before and after each persistence step; reuse uniqueness
claims; mismatch request/audit/receipt/commit digests; delete or splice denial
evidence; race exact-version writers; and verify rollback, recovery,
canonicalization, model, and property cases pass.

Exit criteria: an adapter can either commit the complete negotiated bundle
atomically or report the capability unsupported; it cannot claim success with
a weakened subset. Consumer, timer, activity, and poison transitions are not
claimed by this command variant. `v0.16.1 implementation stop reached. Run pentest for this exact commit.`

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

Exit criteria: retries cannot repeat the local protected commit or hide
duplicates; possible remote duplication remains governed by the external-effect
outcome contract.
`v0.17.0 implementation stop reached. Run pentest for this exact commit.`

## `0.17.1` — Atomic Consumer Commit Bundle

Status: planned.

Setup: define `AtomicConsumerCommitBundle` with tenant/source/destination,
inbound message identity and payload digest, inbox receipt and stored duplicate
outcome, at most one authoritative aggregate stream and its exact expected
version, consecutive emitted domain events,
mandatory audit intent, business outbox entries, integrity/commit digest, and
authority-owned uniqueness claims. The inbox receipt, all emitted effects, and
their evidence share one database transaction; unsupported cross-aggregate
effects remain outbox-driven process-manager messages rather than hidden multi-
stream writes. Emitted effects are local durable effects only; external calls
consume the committed outbox later and their results arrive in a new bundle.

Goal: close the crash window between applying a consumer effect and recording
that its inbound message was consumed.

Deliverables: bounded consumer bundle and codec, semantic validation, atomic
memory implementation, duplicate-response behavior, capability version,
crash-point model, and inbox-plus-effect conformance fixtures.

Verification: crash or fail before/after each receipt/event/audit/outbox/
integrity/uniqueness component, redeliver concurrently, reuse message ID with a
different digest, mix tenant/source/destination, emit effects without a receipt,
store a receipt without effects, split multi-aggregate work, and verify exact
rollback, replay, model, and property cases pass. A harness that attempts a
network/provider call inside the transaction is rejected.

Exit criteria: a consumer either commits its receipt and complete emitted
effect bundle once or commits neither; redelivery returns the bound prior
outcome and cannot repeat the local protected commit. Remote execution may
still be duplicated and must use the stable effect identity and reconciliation
contract. `v0.17.1 implementation stop reached. Run pentest for this exact commit.`

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

Setup: define tenant/resource quota identity, opaque `QuotaReservationId`,
reservation digest, `QuotaReservationState`, per-capability admission-versus-
dispatch consumption boundary, atomic reserve/consume/hold/refund/release,
concurrent-use leases, retry/idempotency binding, fairness, reconciliation,
overflow behavior, administrator adjustment evidence, and separate strictly
scoped control-plane reserve capacity for reconciliation and security cleanup.
`HeldPendingOutcome` counts against the governed limit. Refund eligibility
requires pre-dispatch cancellation or admissible `DefinitelyNotAccepted`
evidence and is applied exactly once; manual assessment cannot create it.
Compensation has a distinct quota reservation and accounting identity. The
consumed reservation representation is finalized into work bundles only at
`0.18.2`, after these semantics exist.

Goal: make resource limits durable correctness controls rather than process-local
counters.

Deliverables: project-owned quota ledger/reservation port and state machine,
capability accounting policy, evidence-bound refund/release command, isolated
control-plane reserve, deterministic memory adapter, recovery reconciler,
leak/escalation monitor, and contention model.

Verification: concurrent oversubscription, crash after reserve/use/refund,
duplicate retry and refund, cancel/dispatch/refund races, indefinite held-
reservation leak and escalation, provider-outage exhaustion, tenant attempts to
consume control-plane reserve, lease loss, starvation, integer overflow, forged
refund/adjustment evidence, cross-tenant accounting, separate compensation
accounting, and reconciliation tests pass.

Exit criteria: admitted work cannot exceed a durable quota through concurrency
or retry; unknown outcomes cannot free capacity without admissible evidence,
and exhausted tenant capacity cannot block bounded reconciliation or security
cleanup. `v0.18.1 implementation stop reached. Run pentest for this exact commit.`

## `0.18.2` — Atomic Timer, Activity, And Work Commit Family

Status: planned.

Setup: finalize a discriminated `AtomicWorkCommitBundle` family for command
(`0.16.1`), consumer (`0.17.1`), scheduled timer, workflow activity completion,
and poison/dead-letter transitions. Every applicable variant binds tenant,
work/message/timer/activity identity and input digest, current fencing token,
at most one authoritative aggregate stream and its exact expected version,
events, command/inbox/timer/activity receipt,
mandatory audit intent, outbox, integrity commitment, uniqueness claims, and
the typed consumed `0.18.1` quota reservation. Cross-aggregate continuation is
an outbox-driven process-manager decision. Timer dispatch atomically records
the due/fenced dispatch transition and its outbox work intent; timer or remote
work completion is a separate later activity-result/consumer transition that
atomically records its own result receipt and local effects. Fence validation
and poison/dead-letter movement occur with their respective local effects.
Finalize the generic external-effect state transitions, attempt evidence, status
queries, typed remote outcomes, resolution evidence/source, reconciliation
workflow, deadlines/escalation, late-evidence conflict handling, privileged-
resolver authorization, and authorized/manual resolution commands. A resolution
command changes operational state; without admissible provider evidence it
cannot manufacture or replace `RemoteOutcome`.
Finalize authorization freshness and quota disposition in the same state
family. Intent creation always requires commit-time authorization. For a
`CommitAndDispatch` capability, dispatch atomically validates the immutable
authorization/request/target bindings against current authority and records a
single-use fenced dispatch-authorization receipt before provider I/O. A failed
current-authority check records denial/cancellation and performs no remote call.
The declared quota boundary atomically consumes the reservation with admission
or dispatch. Unknown outcomes enter `HeldPendingOutcome`; refund/release requires
the exact eligible evidence and idempotent ledger transition. Compensation
binds its own authorization decision, effect identity, and quota reservation.

Goal: prevent retries, lease loss, or crashes from separating asynchronous work
completion evidence from the effects it emits.

Deliverables: versioned discriminated bundle model and canonical codec, shared
validation laws, atomic memory implementation, capability negotiation profile,
timer/activity/poison receipt types, dead-letter evidence, and deterministic
failure/interleaving harness; distinct execution/outcome/evidence/workflow
codecs and state machines; reconciliation scheduler/escalation contract; and
privileged-resolution policy facts; authorization-binding/freshness descriptors,
dispatch receipts, and quota-disposition/refund codecs and state machines.
Phase G workflow workers later specialize
the activity payload without weakening this commit boundary. The contract
states at-least-once external execution explicitly and makes no distributed
exactly-once claim. It distinguishes local commit/delivery success, provider
outcome, how that outcome became known, and operational disposition.

Verification: independently omit or split every variant component; crash
between timer fire/completion, activity effect/receipt, inbox/dead-letter
transition, fence check/commit, and quota consume/effect; replay stale fencing
tokens; attempt a second aggregate stream or remote call in one bundle;
lose a response after provider acceptance; expire a provider idempotency key;
return conflicting status queries; attempt blind retry of unknown privileged or
non-compensable work; race direct response/signed callback/provider query
against manual assessment and deadline escalation; attempt unauthorized or
self-approved privileged resolution; receive late provider evidence after
abandonment; revoke policy/delegation/employment/tenant authority between
commit, lease, authorization receipt, and dispatch; substitute target or request
bytes; use worker identity as business authority; duplicate or forge a refund;
leak an unknown-outcome hold; exhaust tenant quota during reconciliation;
redeliver poison work; race cancellation/lease loss; and run rollback, recovery,
model, state-machine, and property tests.

Exit criteria: every supported asynchronous effect uses one negotiated atomic
variant, stale/unfenced work cannot commit, and adapters unable to preserve a
variant report it unsupported. Every external outcome is terminally known,
durably unknown and reconciling, or operationally abandoned/assigned for
authorized manual resolution rather than inferred from delivery state. A
manual conclusion remains visibly assessed and cannot become verified provider
truth. Every dispatch obeys its declared freshness profile and exact immutable
binding. Quota release is evidence-bound and exactly once, uncertain work stays
accounted, compensation is accounted separately, and reserved recovery capacity
cannot be borrowed for tenant business work.
`v0.18.2 implementation stop reached. Run pentest for this exact commit.`

## `0.19.0` — Integrity Chains And Signed-Checkpoint Interface

Status: planned; blocked until this milestone approves an implementation-
admission record for every hash, signing, KMS, and timestamp implementation.

Setup: bind tenant, partition, stream, sequence, event/schema IDs, payload digest,
the `0.18.2` work-variant/audit-intent/receipt/commit digests, predecessor, and
key ID; define domain-stream and denial-only audit sequences, partition Merkle
commitments, external signed anchors, checkpoint cadence, rotation, independent
timestamp option, and limits.

Goal: make event deletion, replacement, and reordering detectable.

Deliverables: integrity-link model, crypto-provider interface only, partition
commitment, externally retained checkpoint format, cross-signed rotation,
verification report, corruption locator, and the signed admission record binding
the reviewed implementation/profile versions.

Verification: deletion of an entire stream or denial sequence, removal of an
audit intent or receipt while leaving domain events intact, reorder/substitution/
splice, wrong stream/tenant/key, anchor loss, rotation, timestamp semantics,
truncated chain, recovery verification, digest collision fixture, and bounded
verify pass.

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

## `0.20.3` — Shared Provenance And Temporal-Fact Primitives

Status: planned.

Setup: define reusable N1 `SourceRef`, `ObservationId`, `ProvenanceRef`,
source-observed time with clock quality/uncertainty, business-valid interval,
journal-recorded time, projection-checkpoint time, `CorrectionOf`,
`Supersedes`, and confidence assertions bound to an exact trust-policy version.
Define unknown, conflicting, late, and corrected facts without collapsing the
four clocks or overwriting original assertions.

Goal: establish one provenance and temporal vocabulary before service
measurements, alerts, evidence, vulnerabilities, assets, and service health
develop incompatible local models.

Deliverables: focused `no_std`/N1 fact-model crate, bounded canonical types,
interval and ordering operators, correction/supersession laws, confidence
explanation model, golden cross-domain fixtures, and compile-time dependency
rules requiring later fact-bearing domains to reuse these primitives.

Verification: identity/source confusion, clock collapse, invalid or uncertain
intervals, destructive correction, supersession cycles, late/out-of-order
facts, confidence inflation, policy-version mismatch, projection lag, canonical
round trips, property tests, and cross-domain differential fixtures pass.

Exit criteria: later domains may add typed fact payloads and domain rules, but
cannot redefine provenance identities, correction semantics, confidence
authority, or the four-clock model.
`v0.20.3 implementation stop reached. Run pentest for this exact commit.`
