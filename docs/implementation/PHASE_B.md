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
digest, policy decision/version, authentication assurance/expiry, and one typed
`EffectExecutionAuthority`:

- `LiveSubjectAuthority` requires the initiating human's current authenticated
  session, employment/subject status, delegation, and policy at dispatch;
- `ApprovedExecutionGrant` is an immutable integrity-bound grant created only by
  an authorized approval command. It binds tenant, grant and effect identity,
  exact request/target digest and target version, purpose, approver decision IDs
  and quorum, separation of duties, assurance at approval, not-before/expiry,
  permitted attempts, policy version, and revocation conditions; and
- `ServicePrincipalAuthority` binds a tenant service principal, exact capability
  scope, audience/proof identity, credential/assurance profile, policy version,
  and expiry for narrowly scoped automation.

The intent's typed freshness profile is either `CommitBound` or
`CommitAndDispatch`; there is no dispatch-only profile. The default is `CommitAndDispatch`.
`CommitBound` is permitted only for a reviewed immutable-target,
non-privileged, non-destructive, non-secret-bearing action whose semantics do
not depend on continuing authority. Privileged, destructive, secret-bearing,
containment, and compensation effects always use `CommitAndDispatch`.

A `CommitAndDispatch` worker authenticates as its own service identity and
independently redeems the selected execution authority immediately before
external I/O; it never impersonates an initiating or approving human.
`LiveSubjectAuthority` rechecks the live subject/session facts.
`ServicePrincipalAuthority` rechecks the current principal, credential/proof,
scope, and policy. `ApprovedExecutionGrant` validates its integrity receipt,
exact bindings, window, guard-backed remaining-attempt state, current tenant
state, and current policy compatibility without requiring an approver's login
session to remain alive. Session expiry alone does not revoke a grant. Explicit
revocation, tenant
suspension, grant expiry/attempt exhaustion, or effect/request/target-version
mismatch always denies redemption. Approver employment/eligibility loss or an
authorization-relevant policy-version change revokes an unredeemed grant unless
a new authorized revalidation command creates a successor grant.

Every grant lineage declares exactly one authoritative stream owner. When the
approval and grant are state of the same aggregate, approval completion and
grant issuance are consecutive events in that one stream. Otherwise the approval
transaction commits an immutable approval receipt and outbox issuance intent;
an idempotent process manager later creates or updates one dedicated
`ExecutionGrantLineage` stream. No lifecycle transition is split between the
approval and grant streams. The lineage binds a stable `GrantLineageId`, unique
generation `GrantId`, immutable approval-receipt identity/digest, predecessor,
and successor. A revocation command addressed to the stable lineage/generation
may initialize it as `RevokedBeforeIssuance`, so a delayed or reordered issuance
intent can never make it redeemable. Successor creation and predecessor
supersession occur in the same owner stream; the predecessor remains permanently
non-redeemable, and replay cannot fork or reuse a generation identity.

Grant redemption and attempt consumption use a `GrantRedemptionGuard`, a local
transactional authority like a uniqueness or quota claim, never a second
aggregate stream. The lineage-owner transaction creates and fences the guard at
issuance, revokes it with explicit revocation, and replaces it during atomic
successor supersession. The guard binds grant lineage/generation, immutable
approval receipt, effect/request/target/version, permitted-attempt ceiling,
revocation epoch, and guard version. The dispatch transaction advances only the
effect-owning aggregate while atomically compare-and-claiming one
`GrantAttemptClaimId`/ordinal from the co-located guard and recording the exact
single-use dispatch-authorization receipt/outbox intent. An idempotent retry
with the same claim identity and digest observes that receipt; a different or
substituted claim cannot reuse the attempt. Revocation and redemption serialize
on the guard: a revocation that wins denies the claim, while a committed claim
is retained as an already admitted attempt and is not rewritten as worker
discretion. Crash after claim/receipt commit but before provider I/O resumes the
committed outbox work without consuming another attempt.

The lineage owner, redemption guard, and effect work bundle must share one local
transaction domain even though only one aggregate stream advances in each
transaction. Capability negotiation rejects a grant/effect topology that cannot
provide that co-location; adapters may not atomically advance lineage and effect
streams or substitute a later best-effort projection. Lease ownership or worker
identity grants no business capability. A worker cannot substitute tenant,
subject, delegation, execution authority, capability, target, purpose, or
request bytes; any binding mismatch requires a new authorized effect intent.

Every `CommitAndDispatch` operation also carries a bounded, canonically ordered
`DispatchAuthorityFenceSet`. Its typed entries bind the applicable tenant,
human subject or service principal, session or credential/mapping, delegation,
role/group/relationship source, and active-policy monotonic enforcement epochs.
An authority-changing command increments its never-reused epoch atomically with
the event in its one owner stream. The dispatch transaction locks and validates
the required co-located epoch rows while committing the effect event,
authorization receipt/outbox, any grant attempt claim, and quota transitions;
the transaction still advances only the effect stream. If revocation/suspension/
disablement/logout/policy change wins the epoch race, dispatch denies before
provider I/O. If dispatch commits first, the later authority change is retained
as a race with an already admitted attempt.

An external identity/session/credential source is never read remotely inside
the work transaction. A production profile must maintain an authoritative local
revocation epoch and fail closed when it cannot establish current local state.
A profile that offers only bounded-stale external facts must publish that bound
and remains unsupported for privileged `CommitAndDispatch` effects. Adapters may
not substitute an eventually consistent cache or projection for a required
fence row.

Every current-target dispatch also carries a typed `DispatchTargetFence`.
When the target is the effect-owning aggregate, the bundle's exact expected
stream version and target digest are the fence. When it is a different local
aggregate, that aggregate's owner maintains an authoritative co-located target-
fence row in the same transaction as every target event; dispatch locks and
validates that row without advancing the target stream. The fence binds tenant,
target kind and ID, expected version and digest, lifecycle state, and monotonic
deletion/supersession epoch. The target stream, target-fence row, and effect
bundle must be placeable in one local transaction domain. A capability whose
meaning requires current target state is unsupported when the target is remote,
cross-shard, or available only through a projection. Deletion, merge, migration,
supersession, and restore may never recreate or reuse an earlier target epoch.

Quota accounting is an independent collection of state machines. Each effect
owns a bounded `QuotaClaimSet`; each `QuotaClaim` has an opaque reservation ID,
typed amount/unit, `QuotaKind`, settlement policy, and admission/lease/dispatch/
transmission/storage boundary. `QuotaReservationState` distinguishes
`Reserved`, `Consumed`, `HeldPendingOutcome`, `RefundEligible`, `Refunded`, and
`Released`. Required kinds and semantics are:

- `ConcurrencyLease`: release when the fenced local lease ends, independent of
  remote outcome;
- `ConsumableOperation`: consume at its declared admission/dispatch boundary and
  refund only under its declared evidence-backed policy;
- `ProviderRateToken`: release before transmission but become non-refundable
  once transmission begins;
- `EstimatedLiability`: remain charged/held for an unknown provider outcome and
  reconcile to evidence-backed actual cost, including explicit overage rather
  than capping it to the estimate, or a distinct administrative write-off; and
- `RetainedBytes`: follow verified local allocation and deletion, not remote
  outcome.

Quota ledgers and claim sets are local transactional authorities, like inbox/
outbox receipts and uniqueness claims, not additional aggregate streams. A
`QuotaClaimSetId` and canonical digest bind the complete canonically ordered set
of normalized unique resource keys and claim descriptors. Reservation acquires
overlapping resource keys in that canonical order (or an adapter-proven
equivalent serialization rule), commits all claims or none, and returns an
opaque `QuotaClaimSetToken`. A work bundle validates and transitions that exact
reserved set; it never reacquires members independently or adds, removes, or
reorders claims. Refund, release, settlement, and write-off transitions are
idempotent against set identity/digest, claim identity, and transition identity.
Restore and reconciliation verify the whole set and quarantine corruption or
absence; they never reconstruct, expose, or settle a partial set.

Every claim in an atomic set resides in the same local transactional quota
partition as its work bundle. A wider global or regional limit is represented
by a fenced hierarchical `QuotaCapacityLease` allocated to that partition in a
separate transaction; local claim sets consume only the leased slice and never
contact a parent partition during the work transaction. Lease identity, scope,
epoch, amount, expiry/reclamation, and parent accounting are integrity bound,
and aggregate child allocations cannot exceed parent capacity. A claim set
cannot consume an expired or superseded epoch, and a parent cannot reallocate
returned/expired capacity until fencing proves the prior child epoch unusable.
It never opens a cross-shard or cross-region distributed transaction. The `1.0.0`
topology supports one authoritative write region per transaction domain with
fenced failover, not active/active authoritative writes across regions;
incompatible claim-set placement fails capability negotiation.

Each `QuotaCapacityLease` binds exactly one `QuotaKind`, unit, accounting
period, settlement policy, parent/child partition, and fencing epoch. Expiry
prevents new reservations but never releases spent or encumbered capacity.
Parent reclamation is limited to the proven unreserved and unencumbered
remainder. Existing retained-byte, unknown-liability, charged-operation, spent-
rate-token, and other outstanding claims remain charged under their original
kind/boundary until admissible settlement, verified deletion, authorized write-
off, or a fenced encumbrance transfer to a successor partition. The transfer is
not a distributed exactly-once transaction. A durable outbox/inbox process
manager drives `QuotaCapacityTransferState` through `ReservedAtParent`,
`InTransit`, `ActivatedAtChild`, `Returning`, and `Reclaimed`, with
`ReconciliationRequired` as a fail-closed operational state. Every allocation
or encumbrance move binds a stable `QuotaCapacityTransferId`, source and
destination partition/lease epochs, kind/unit/period/settlement policy, amount,
canonical digest, monotonic sequence, and original claim/encumbrance lineage.
The parent reserves capacity before committing the outbox intent; the child
activates it idempotently with an inbox receipt. In-transit capacity is
unavailable at the parent. Return or reclamation requires an authenticated
acknowledgement plus proof that the old child epoch is fenced. Uncertain or
conflicting movement remains conservatively charged and enters reconciliation.
Double-entry conservation may temporarily charge both sides during recovery but
never permits the capacity to be free in both. Each local transition is exactly
once by stable receipt; message delivery is at least once. Failover cannot
recreate parent capacity while an old child encumbrance remains, and late
provider evidence settles the original claim and transfer lineage after lease
expiry or regional movement.

All composite local transactions use one acquisition order: authoritative
stream head; authority-fence rows ordered by typed key; target-fence row; grant
redemption guard; quota-capacity lease and quota resource keys in canonical
order; uniqueness claims; then command/inbox/timer/activity/attempt receipt
rows. A transaction omits inapplicable classes but never reorders them. Adapters
retry only classified serialization/deadlock failures, with a bounded policy
and the same command/claim/transition identities, input digests, expected
versions, and fence epochs. Exhaustion is visible and retryable by the caller/
reconciler; retry never repeats provider I/O or consumes a new grant attempt/
quota claim.

Only claims whose settlement policy depends on provider acceptance enter
`HeldPendingOutcome`; such a claim continues to count against its governed
limit. Pre-dispatch cancellation may release unconsumed claims, and admissible
`DefinitelyNotAccepted` evidence may make eligible claim kinds refundable
exactly once. Operator assessment cannot create refund eligibility.
Administrative write-off is a separately typed, authorized, audited adjustment
that never becomes provider evidence or rewrites `RemoteOutcome`. Compensation
uses a separate bounded claim set. Reconciliation and security-cleanup capacity
is partitioned by tenant and work class with per-tenant ceilings, global
fair-share scheduling, starvation bounds, and a strictly scoped audited
emergency reserve; tenant exhaustion cannot consume it, one tenant's unknown
outcomes cannot monopolize it, and it cannot admit new tenant business work.

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
version, authentication assurance/expiry, and selected
`EffectExecutionAuthority`. Denied/rejected commands atomically
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
authorization and durable execution-grant receipt contracts, and failure
fixtures.

Verification: fail before/during/after every event/receipt/audit/outbox write,
successful mutation without audit, denied mutation with domain events, duplicate
dispatch/audit, crash before ack, provider acceptance followed by lost response,
idempotency-key expiry/scope mismatch, execution state presented as remote
outcome, forged remote outcome, operator assessment presented as verified
provider evidence, forged resolution source, stale policy/delegation/
authentication binding, expired/replayed/substituted execution grant, offline-
human impersonation, target or request substitution, lease-holder confused
deputy, poison payload, tenant routing, and rollback pass.

Exit criteria: no successful protected mutation exists without its authoritative
audit intent, no rejected mutation produces business state or effects, and
transport acknowledgement is never represented as a known provider outcome.
No effect can exist without a complete immutable commit-time authorization
binding, typed execution authority, and explicit freshness profile.
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
reservation digest, `QuotaClaimSetId`, opaque `QuotaClaimSetToken`, canonical
set digest/order, bounded `QuotaClaimSet`, `QuotaKind`, settlement policy, typed
amount/unit, `QuotaReservationState`, and per-claim admission/lease/dispatch/
transmission/storage boundary. Quota state is local transactional authority, not
an aggregate stream. Define all-or-none reservation, canonical deadlock-free
overlap acquisition, exact-set token consumption, immutable membership, atomic
consume/hold/refund/release/settle, concurrent-use leases, retry/idempotency
binding at set and claim level, fairness, reconciliation, overflow behavior, and
separately typed administrator adjustment/write-off evidence. Concurrency claims
release with the local lease;
provider rate tokens are non-refundable after transmission; consumable
operations follow declared evidence rules; estimated liabilities hold and
settle to actual cost/overage or audited write-off; retained-byte claims follow
verified local allocation/deletion. Only provider-dependent claim kinds use
`HeldPendingOutcome`. Compensation has a distinct bounded claim set.
Require every set and consuming work bundle to share one transactional quota
partition. Define hierarchical global/regional capacity leases, fencing,
allocation/reclamation, and parent-versus-child conservation so wider limits
are leased into local partitions before reservation rather than consulted
through a distributed transaction. Bind each lease to one quota kind/unit/
accounting period/settlement policy. Model unreserved remainder separately from
reserved, spent, and encumbered capacity; expiry stops admission but preserves
outstanding claims. Define the receipt-driven `QuotaCapacityTransferState`
process manager (`ReservedAtParent` → `InTransit` → `ActivatedAtChild` →
`Returning` → `Reclaimed`, or fail closed to `ReconciliationRequired`) for
allocation and encumbrance movement across partition loss, failover, and
regional movement. Bind stable transfer identity, source/destination epochs,
digest, sequence, and original claim/encumbrance lineage; require parent reserve
before outbox, idempotent child inbox activation, conservative in-transit
charging, authenticated acknowledgement plus old-epoch fencing before reclaim,
and double-entry conservation that may temporarily overcharge but never frees
capacity in both partitions. Local receipt transitions are exactly once;
delivery is at least once and late settlement retains original transfer lineage.
Partition reconciliation/security-cleanup capacity by tenant/work class with
ceilings, global fair-share/starvation bounds, and a strictly scoped emergency
reserve. The bounded claim-set representation is finalized into work bundles
only at `0.18.2`, after these semantics exist.

Goal: make resource limits durable correctness controls rather than process-local
counters.

Deliverables: project-owned quota ledger/reservation port and per-kind state
machines, canonical claim-set codec/digest/token and ordering law, all-or-none
reservation protocol, bounded claim-set/amount/unit types, capability settlement
policies, exact-set evidence-bound refund/release/actual-cost settlement
commands, distinct administrative adjustment/write-off command, whole-set
restore/quarantine rules, transaction-domain placement contract, hierarchical
capacity-lease state machine/conservation model, per-kind encumbrance ledger,
capacity-transfer ID/codec/state machine, allocation/encumbrance outbox and inbox
commands/receipts, authenticated acknowledgement and old-epoch-fence proof,
double-entry conservation oracle, late-settlement lineage mapping, partitioned
fair control-plane capacity, deterministic memory adapter, recovery reconciler,
leak/escalation monitor, and contention model.

Verification: concurrent oversubscription, crash after reserve/use/refund,
duplicate retry and refund, cancel/dispatch/refund races, indefinite held-
reservation leak and escalation, concurrency release while provider outcome is
unknown, rate-token refund after transmission, estimated-to-actual settlement,
underestimated-cost overage, retained-byte deletion accounting, mixed multi-
claim atomicity, concurrent overlapping sets, reversed-order deadlock/livelock,
partial-reservation crash, immutable-membership add/remove/reorder substitution,
token/digest mismatch, claim-set bound overflow, duplicate set/claim settlement,
partial/corrupt set restore and reconciliation, cross-partition set rejection,
parent/child capacity over-allocation, stale/expired lease epoch, lease
reclamation race, expiry with retained bytes, unknown liabilities, charged
operations, and spent provider-rate tokens, child-partition loss, late provider
settlement against an expired/transferred lease, duplicate encumbrance transfer,
every crash point and message duplicate/reorder, lost acknowledgement, source
or destination failover, stale source/destination epoch, conflicting transfer,
in-transit uncertainty, double-entry recovery overcharge and forbidden free-at-
both-sides state, parent reclamation racing failover, failover allocation
duplication, late evidence against original claim/transfer lineage, accidental
cross-shard/cross-region transaction, incompatible active/active write topology,
provider-outage exhaustion, one-tenant reconciliation monopolization, tenant
attempts to consume emergency reserve, global/per-tenant starvation, lease loss,
integer overflow, forged refund/provider evidence, write-off misrepresented as
provider refund, cross-tenant accounting, separate compensation accounting, and
reconciliation tests pass.

Exit criteria: admitted work cannot exceed a durable quota through concurrency
or retry; every claim kind settles at its documented boundary without treating
all unknown outcomes alike; administrative adjustment remains visibly distinct
from provider evidence; all-or-none exact-set linearization is deterministic,
deadlock-free, recoverable only as a whole, and local to one transactional quota
partition; wider limits conserve capacity through fenced hierarchical leases
without distributed work transactions or reclaiming live encumbrances; late
evidence and receipt-idempotent, at-least-once-delivered transfer processing
preserve the original per-kind charge and never make capacity free at both
ends; and
exhausted or abusive tenants cannot block fair bounded reconciliation or
security cleanup.
`v0.18.1 implementation stop reached. Run pentest for this exact commit.`

## `0.18.2` — Atomic Timer, Activity, And Work Commit Family

Status: planned.

Setup: finalize a discriminated `AtomicWorkCommitBundle` family for command
(`0.16.1`), consumer (`0.17.1`), scheduled timer, workflow activity completion,
and poison/dead-letter transitions. Every applicable variant binds tenant,
work/message/timer/activity identity and input digest, current fencing token,
at most one authoritative aggregate stream and its exact expected version,
events, command/inbox/timer/activity receipt,
mandatory audit intent, outbox, integrity commitment, uniqueness claims, and
the exact pre-reserved `0.18.1` quota claim-set token/digest and applicable per-
claim transitions. Quota records remain co-transactional local authority, not
additional aggregate streams; a bundle never reacquires set members. Every
dispatch variant binds and atomically validates its bounded
`DispatchAuthorityFenceSet` and, where current target state matters, its typed
`DispatchTargetFence`. A same-aggregate target uses the bundle expected version
and digest; a different local target uses the authoritative target-fence row
updated beside target events. Remote, cross-shard, or projection-only current-
target semantics fail capability negotiation. Every variant uses the platform-
wide stream-head, authority-fence, target-fence, grant-guard, quota-key,
uniqueness-claim, then receipt acquisition order and bounded identity-preserving
deadlock retry policy. Cross-aggregate continuation is an outbox-driven process-
manager decision. Timer
dispatch atomically records
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
Finalize authorization freshness, execution-authority redemption, and quota
disposition in the same state family. Intent creation always requires commit-
time authorization. For a `CommitAndDispatch` capability, dispatch atomically
validates the immutable authorization/request/target bindings and redeems
`LiveSubjectAuthority`, `ApprovedExecutionGrant`, or
`ServicePrincipalAuthority` under its exact current rules before recording a
single-use fenced dispatch-authorization receipt. A failed redemption records
denial/cancellation and performs no remote call. Each claim transition occurs
atomically at its own declared boundary; remote unknown outcomes hold only the
provider-dependent claim kinds. Refund/release/actual-cost settlement requires
the exact eligible evidence and an idempotent ledger transition. Compensation
binds its own authorization decision, effect identity, and bounded claim set.
Grant issuance, revalidation/supersession, explicit revocation, redemption, and
attempt consumption are distinct audited commands/transitions; only an
authorized approval command can issue or supersede a grant, and a timer/queue/
worker can only redeem it. Freeze the authoritative ownership rule: an inline
grant shares the approval aggregate stream, while a dedicated grant uses one
`ExecutionGrantLineage` stream created from the immutable approval receipt by an
idempotent outbox/process manager. Pre-issuance revocation creates a terminal
non-redeemable lineage/generation, and successor creation atomically supersedes
its predecessor in that same owner stream. Freeze redemption separately:
`GrantRedemptionGuard` is co-transactional local authority created/fenced by the
lineage-owner transaction and compare-and-claimed by the dispatch bundle. The
dispatch transaction advances only the effect stream, atomically consumes one
bound `GrantAttemptClaimId`, and records its fenced receipt/outbox intent;
revocation versus claim linearizes on the guard. Grant lineage, guard, and
effect work bundle must share a local transaction domain.

Goal: prevent retries, lease loss, or crashes from separating asynchronous work
completion evidence from the effects it emits.

Deliverables: versioned discriminated bundle model and canonical codec, shared
validation laws, atomic memory implementation, capability negotiation profile,
timer/activity/poison receipt types, dead-letter evidence, and deterministic
failure/interleaving harness; distinct execution/outcome/evidence/workflow
codecs and state machines; reconciliation scheduler/escalation contract; and
privileged-resolution policy facts; authorization-binding/freshness descriptors,
execution-authority/grant codecs, issuance/revalidation/revocation commands,
ownership/lineage/approval-receipt and pre-issuance-revocation contracts,
redemption-guard/attempt-claim codec and state machine, redemption receipts,
dispatch-authority-fence-set codec/epoch rules, canonical composite acquisition
order and deadlock-retry contract, `DispatchTargetFence` codec/owner-update/
placement contract, transaction-domain placement/capability contract, and
exact-token bounded per-kind quota-disposition/refund/settlement/
capacity-transfer codecs and state machines. Phase G workflow workers later
specialize
the activity payload without weakening this commit boundary. The contract
states at-least-once external execution explicitly and makes no distributed
exactly-once claim. It distinguishes local commit/delivery success, provider
outcome, how that outcome became known, and operational disposition.

Verification: independently omit or split every variant component; crash
between timer fire/completion, activity effect/receipt, inbox/dead-letter
transition, fence check/commit, and quota-claim transition/effect; replay stale
fencing tokens; attempt a second aggregate stream or remote call in one bundle;
lose a response after provider acceptance; expire a provider idempotency key;
return conflicting status queries; attempt blind retry of unknown privileged or
non-compensable work; race direct response/signed callback/provider query
against manual assessment and deadline escalation; attempt unauthorized or
self-approved privileged resolution; receive late provider evidence after
abandonment; revoke policy/delegation/employment/tenant authority between
commit, lease, authority redemption, authorization receipt, and dispatch; expire
a session/logout epoch; disable a human, service principal, credential, or
external mapping; suspend a tenant; revoke a delegation; activate or roll back
policy; change a role/group/relationship fact while dispatch locks the complete
fence set; omit/substitute/reorder a fence entry; reuse an epoch after rollback;
use a bounded-stale external source for privileged dispatch; deadlock composite
transactions at every adjacent acquisition class; race target deletion, merge,
migration, lifecycle change, or supersession against dispatch; substitute a
stale target projection; place a different-aggregate target cross-shard; restore
an old target version/deletion epoch; verify target-change-versus-dispatch
linearization for both same-aggregate and target-fence-row cases; retry beyond the bound or
with changed command/claim/digest/fence identity; expire an interactive human
session while valid scheduled grant work proceeds; depart an approver; drift policy
or approval version; replay/exhaust/revoke a grant immediately before dispatch;
crash/reorder/duplicate approval-to-grant issuance; race revocation before
delayed issuance; duplicate/fork a grant identity; create a successor without
atomically superseding its predecessor; substitute approval receipt, target, or
request bytes; race revocation against an attempt claim; concurrently redeem the
final attempt; crash after attempt claim/receipt but before provider I/O;
duplicate or substitute attempt claim/receipt; drift the effect or target
version during claim; restore/fail over a consumed attempt; try to advance grant
and effect streams atomically; place lineage/guard/effect outside one transaction
domain; use worker identity as business authority; split or partially restore a
mixed quota claim set; reserve overlapping sets concurrently in opposite input
order; deadlock/livelock; crash after partial reservation; add/remove/reorder a
claim after digest; consume by reacquiring members; place one set across quota
partitions; exceed or duplicate a hierarchical capacity lease; attempt a cross-
shard/region work transaction; replay a set/claim transition; crash at every
capacity-transfer transition; duplicate/reorder allocation, activation, return,
and acknowledgement delivery; lose an acknowledgement; fail over source or
destination; present a stale epoch or conflicting transfer; attempt reclaim
without authenticated acknowledgement and old-epoch fence proof; make capacity
free at both ends; settle late evidence without original transfer lineage; release
concurrency based on remote uncertainty;
refund a transmitted rate token; duplicate or forge a refund/provider
settlement; disguise administrative write-off as provider evidence; leak an
unknown-outcome liability; expire/reclaim a capacity lease while retained bytes,
unknown liability, spent rate tokens, or charged operations remain; lose a child
partition; settle late evidence against the original encumbrance; duplicate or
race an encumbrance transfer with parent reclamation/failover; monopolize
reconciliation capacity with one tenant; redeliver poison work; race
cancellation/lease loss; and run rollback, recovery, model, state-machine, and
property tests.

Exit criteria: every supported asynchronous effect uses one negotiated atomic
variant, stale/unfenced work cannot commit, and adapters unable to preserve a
variant report it unsupported. Every external outcome is terminally known,
durably unknown and reconciling, or operationally abandoned/assigned for
authorized manual resolution rather than inferred from delivery state. A
manual conclusion remains visibly assessed and cannot become verified provider
truth. Every dispatch obeys its declared freshness profile, typed execution
authority, and exact immutable binding without impersonating an offline human.
Every grant lineage has one authoritative owner stream; cross-aggregate issuance
uses immutable approval receipt plus outbox/process-manager continuation,
pre-issuance revocation wins, and superseded generations never become redeemable.
Every redemption attempt linearizes through the co-located fenced guard while
the bundle advances only the effect stream; claim/receipt retry is idempotent,
revocation cannot lose to stale guard state, and restore cannot resurrect a
consumed attempt.
Every applicable authority change linearizes against dispatch through the
complete co-located monotonic fence set; unsupported external staleness cannot
authorize privileged effects. Every current-target dispatch also linearizes
against the authoritative target version, digest, lifecycle, and deletion/
supersession epoch without advancing a second stream; unsupported placement or
projection-only freshness fails closed. Composite acquisition and bounded retry
preserve one-stream atomicity without deadlock-driven duplication or identity
drift.
Every bounded quota claim settles by kind at its declared boundary; refunds are
evidence-bound and exactly once, write-offs remain distinct, compensation is
accounted separately, and each exact immutable set reserves all-or-none,
linearizes without an extra aggregate stream inside one quota partition, and
restores/reconciles only as a whole. Hierarchical leases conserve wider capacity
and preserve per-kind encumbrances through expiry, failover, transfer, and late
settlement without a cross-partition work transaction. Transfer delivery is
explicitly at least once, local state transitions are receipt-idempotent, and
conservative double-entry accounting never exposes capacity at both ends. Fair
partitioned recovery capacity cannot be monopolized or borrowed for tenant
business work.
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
