# Phase G — Durable Workflows

Scope: `0.61.0–0.70.0`. Definitions compile to deterministic IR; hosted effects return as events.

## `0.61.0` — Workflow IR
Status: planned. Setup: version node/opcode schemas, graph validity, types, capabilities, and budgets. Goal: canonical hidden-free workflows. Deliverables: IR, validator, codec, disassembler. Verification: malformed graphs, unknown opcodes, cycles, depth/instruction bombs, canonical round trips pass. Exit criteria: invalid IR cannot activate. `v0.61.0 implementation stop reached. Run pentest for this exact commit.`

## `0.62.0` — Deterministic Interpreter
Status: planned. Setup: define state, step budget, yielded effects, replay inputs, and failure. Goal: pure durable execution. Deliverables: interpreter, traces, reference fixtures. Verification: infinite loops, nondeterministic ordering, exhaustion, replay divergence, malformed state, and model tests pass. Exit criteria: equal histories yield equal effects. `v0.62.0 implementation stop reached. Run pentest for this exact commit.`

## `0.63.0` — Human Tasks And Approvals
Status: planned. Setup: bind task actor eligibility, claim, completion schema,
approval separation, expiry, approval decision identity/version, quorum, and
assurance. A designated approval node may authorize an `ApprovedExecutionGrant`
through the `0.18.2` inline issuance or dedicated issuance-intent command only
when it binds the
exact effect/request/target and target version, tenant, purpose, not-before/
expiry, attempts, policy version, revocation conditions, and separation of
duties. Ordinary task completion emits no execution authority. Approver session
expiry after issuance does not require worker impersonation or invalidate the
grant by itself; approver eligibility loss and policy drift require the defined
fail-closed successor-grant revalidation.
The workflow definition declares whether the approval aggregate owns the grant
lineage or emits an immutable approval receipt/outbox intent for one dedicated
lineage stream. A workflow transition never advances both. Dedicated issuance
is idempotent by lineage/generation and approval-receipt digest; pre-issuance
revocation wins, and a successor atomically supersedes its predecessor in the
lineage owner stream. Issuance/revocation/supersession also create, fence, or
replace the co-located local redemption guard without advancing another
aggregate stream.
Goal: safe human workflow stops that can authorize bounded scheduled work
without preserving an interactive login session.
Deliverables: activity/approval models, grant issuance/revalidation/revocation
commands and receipts, ownership declaration, dedicated grant process-manager
contract, lineage/successor state, redemption-guard placement/maintenance
contract, and workflow integration.
Verification: theft, self-approval, stale claim, duplicate completion, grant
issuance from a non-approval task, missing quorum/separation, expired approver
session, approver departure, approval-version drift, grant replay/attempt
exhaustion, target substitution, approval-to-issuance crash/reorder/duplicate,
revocation before delayed issuance, duplicate generation, successor fork,
guard omission or stale projection, hidden fields, and tenant isolation pass.
Exit criteria: human decisions require current authority when made; later work
uses only an exact independently redeemable grant, never an offline human
identity. `v0.63.0 implementation stop reached. Run pentest for this exact commit.`

## `0.64.0` — Timers, Deadlines, And Retries
Status: planned. Setup: define logical deadlines, scheduled IDs, retry/backoff,
jitter input, cancellation, quotas, and specialize the `0.18.2` atomic timer
dispatch and later result variants without weakening their fence/receipt/local-
effect boundaries. A scheduled item binds its execution-authority reference,
not-before/expiry, attempt ceiling and redemption-guard reference, effect/
request/target digest, and target version.
A timer supplies time and wakeup only: it cannot create authority.
Dispatch redeems live-subject, approved-grant, or service-principal authority
under current rules; grant-backed work does not require an approver's expired
session. Approved-grant dispatch compare-and-claims the exact fenced local
redemption guard in the effect transaction; it never advances grant and effect
streams together. Every dispatch atomically locks the complete applicable
`DispatchAuthorityFenceSet` and its required `DispatchTargetFence` under the
canonical composite acquisition order. Same-aggregate targets use expected
version/digest; different local targets use their owner-maintained fence row.
Remote, cross-shard, and projection-only current-target timers fail closed.
Provider-owned mutations instead preserve the immutable
`RemoteTargetConcurrencyProfile`; a conditional timer sends the exact admitted
validator, never refreshes it, and treats precondition failure as typed non-
acceptance while post-transmission response loss remains unknown. An
unconditional timer must claim the exact co-located
`RemoteMutationExceptionGuard`; exception revocation/expiry/supersession,
provider-capability epoch, and final-attempt use serialize with dispatch.
The timer's admitted receipt carries immutable `redeemed_at` and
`transmit_before`; immediately before remote I/O it must recheck current fences
through `ClaimTransmissionStart` and obtain one bounded start permit. A timer
waking after the deadline cannot transmit with old authority. The claim binds
one unique claim ID, exact worker instance and lease generation/fence, receipt/
effect attempt, and permit digest; non-persisted permit material is returned
once. Duplicate workers or a replacement lease holder receive status only. A
lost claim response, ambiguous permit delivery, or crash after the start claim
becomes `OutcomeUnknown`, not a timer retry.
Remote work executes only after committed authorized dispatch and
returns through a separate activity-result/consumer bundle. Goal: crash-safe
time and authority behavior without a distributed exactly-once claim.
Deliverables: timer dispatch/result effects, execution-authority/grant reference
codec, redemption-guard/attempt-claim and cancellation evidence, scheduler
bridge, authority-fence-set and target-fence evidence, canonical lock-order/deadlock-retry
fixtures, remote-target conditional-mutation and exception-guard fixtures, and
transmission-window/unique-claimant fixtures plus atomic-variant integration
fixtures. Verification: clock jumps,
retry storms, duplicate wakeups/results,
cancellation/revocation races, not-before/expiry boundaries, grant replay and
attempt exhaustion, concurrent final attempt, crash after claim before provider
I/O, duplicate/substituted claim or receipt, consumed-attempt failover/restore,
session expiry, approver/policy/target-version drift, stale fence, grant/effect
two-stream rejection, tenant/subject/session/delegation/policy/service-principal
revocation racing dispatch, missing/substituted fence, stale external authority,
target deletion/merge/migration/supersession/restore racing dispatch, missing/
stale target fence, stale target projection, cross-shard target placement,
remote validator/account/resource substitution, ABA recreation, weak/strong
confusion, ignored/downgraded provider condition, silent refresh, precondition
failure retry, response-loss misclassification,
exception scope/request substitution, revocation/expiry/provider-capability/
final-attempt race, missing guard, restore resurrection,
long scheduler/worker pause, revocation or capability change after receipt,
expired/substituted deadline or audience, wall-clock rollback, pre/post-start-
claim crash, concurrent shared-credential workers, claim/worker/lease/permit
substitution, claim-response loss, stale-worker takeover, same-claim replay,
restored/reconstructed permit, uncertain retransmission,
lock-order inversion, retry identity drift/exhaustion, dispatch/completion
collapse, receipt/effect split,
remote-call-in-transaction rejection, overflow, and replay pass.
Exit criteria: timers cannot create uncontrolled or unreceipted work, and remote
execution remains independently authorized, bounded between redemption and
transmission start, and explicitly at least once only where its outcome contract
permits it.
`v0.64.0 implementation stop reached. Run pentest for this exact commit.`

## `0.65.0` — Parallel Branches And Joins
Status: planned. Setup: define branch identity, join policy, failure/cancel propagation, ordering, and bounds. Goal: deterministic concurrency semantics. Deliverables: fork/join IR and interpreter support. Verification: premature/duplicate join, late events, branch leaks, cancellation, permutations, and state-model pass. Exit criteria: scheduling order cannot change result. `v0.65.0 implementation stop reached. Run pentest for this exact commit.`

## `0.66.0` — Compensation Mechanics
Status: planned. Setup: define compensable effects, stack/order, idempotency,
retry horizon, manual intervention, and evidence against the separate `0.18.2`
execution, remote-outcome, resolution-evidence, and operational-workflow types.
Reconcile an `EffectExecutionState::OutcomeUnknown` original before deciding
whether compensation is applicable. Compensation has its own
`CompensationEffectId`, `CompensationState`, external-effect lifecycle, remote
outcome, resolution evidence, `CommitAndDispatch` authorization decisions, and
bounded quota claim set linked to—but never mutating or borrowing claims from—
the original.
Goal: bounded auditable recovery from partial workflows without inventing
certainty about provider state.
Deliverables: compensation IR and state machine, canonical codecs,
original-to-compensation linkage, distinct compensation effect/outcome/evidence
and quota records, current dispatch-authorization and separation-of-duties rules,
reconciliation policy with deadlines/escalation, operator/manual-resolution
view, and deterministic race fixtures.
Verification: double/failed/out-of-order compensation, response-loss ambiguity,
compensation after an unknown original, unknown compensation result, crash
windows, non-compensable effects, operator assessment forged as provider
outcome, late provider evidence racing manual/compensation decisions,
unauthorized, revoked, or self-approved privileged compensation, reuse of the
original quota claims, duplicate compensation refund, target substitution,
cross-kind settlement confusion, and replay pass.
Exit criteria: incomplete rollback or uncertain provider state is explicit,
never hidden, overwritten, or converted into assumed provider success; every
compensation remains linked, independently authorized, independently quota-
accounted, reconcilable, and visible to operators.
`v0.66.0 implementation stop reached. Run pentest for this exact commit.`

## `0.67.0` — Signals And Subworkflows
Status: planned. Setup: bind signal tenant/instance/type/version, subscriptions, recursion depth, correlation, and authorization. Goal: safe composition and external wakeups. Deliverables: signal/subworkflow IR and routing. Verification: spoofing, cross-tenant routing, replay, recursion exhaustion, orphan signals, version mismatch pass. Exit criteria: signals cannot escape scoped authority. `v0.67.0 implementation stop reached. Run pentest for this exact commit.`

## `0.68.0` — Workflow Versioning And Migration
Status: planned. Setup: pin running versions; define history size/work limits,
checkpoints, continue-as-new, archive/replay, activity heartbeats, orphan/late
completion handling, node mapping, preconditions, dry run, approval, and rollback.
Goal: evolve and bound long-running definitions without corrupting instances.
Deliverables: compatibility analyzer, migration engine, history compactor/
archiver, checkpoint format, and continuation protocol. Verification: removed/
renamed nodes, unsafe state mapping, unbounded history, checkpoint corruption,
orphan/late activity, interruption, downgrade, mixed versions, replay pass.
Exit criteria: instances never migrate implicitly or accumulate unbounded active
history. `v0.68.0 implementation stop reached. Run pentest for this exact commit.`

## `0.69.0` — Visual And Config-As-Code Compiler
Status: planned. Setup: one canonical source model, round-trip policy, provenance, signing, and no hidden flags. Goal: equivalent visual/text authoring. Deliverables: compiler, decompiler, simulator integration, review diff. Verification: hidden behavior, injection, privilege generation, round-trip drift, huge graphs, signature substitution pass. Exit criteria: generated IR is fully reviewable. `v0.69.0 implementation stop reached. Run pentest for this exact commit.`

## `0.70.0` — HA Workflow Workers
Status: planned. Setup: define leases/fencing, activity idempotency, specialize
the `0.18.2` activity/poison variants, `0.30.1` queue semantics, poison policy,
drain, failover, commit-and-dispatch authorization freshness, all three typed
execution authorities, immutable effect bindings, bounded multi-kind quota
claim-set token linearization, grant-lineage ownership/process management, fair
partitioned control-plane capacity, grant-redemption-guard and hierarchical
quota-capacity-lease topology/per-kind encumbrance transfer, complete dispatch-
authority fence sets, typed target fences, receipt-idempotent
`QuotaCapacityTransferState` processing with at-least-once delivery,
remote-target concurrency profiles, immutable capacity-transfer owner/
hierarchy/parent/period/lane/class/region/authorization bindings,
remote-mutation-exception guards, class-immutable existing capacity, versioned
one-parent unallocated-capacity policy with atomic parent-ledger/floor
activation, protected-floor governance/cross-command separation, root-manifest
complete-parent rollout, delayed-transition current-authority rechecks,
dispatch-transmission windows/unique claimant start claims, canonical composite
acquisition/retry behavior, and `0.51.2`
tenant-data-surface registry entries, Phase E workflow contract fixtures, and
`0.39.1–0.39.3` on-call/
paging/notification process-manager scenarios. Goal: durable multi-worker
execution. Deliverables: hosted worker orchestration, authorization cases,
external-effect reconciler/manual queue, ITSM and response-delivery integration
retests, worker-self-authenticated execution-authority redemption, single-use
fenced dispatch receipts, grant issuance/revocation/lineage process manager,
co-located redemption-guard/attempt-claim handling, exact-token local per-kind
quota settlement with hierarchical capacity leases/encumbrance transfer,
authority-fence and target-fence validators, capacity-transfer outbox/inbox
process manager and reconciler, remote-target conditional-mutation validator/
outcome handler, remote-mutation-exception guard/attempt handler, capacity-
policy-lineage/parent-ledger atomic activation and conservative-rollout process
manager with root manifest validation, protected-floor governance/cross-command
separation, delayed-transition authority rechecker, transmission-window/unique-
claimant/one-time-permit handler, bounded identity-
preserving deadlock retry, fair
partitioned recovery lanes, and operational evidence.
Verification: lease loss, partitions, duplicate activity/result, activity
receipt/effect split, network-call-in-transaction rejection, crash points,
stale fencing commits, poison/dead-letter split, quota/effect split, poison
loops, cross-tenant/unauthorized effects, paging escalation/acknowledgement and
quiet-hour races, provider acceptance followed by response loss, idempotency-
window expiry, conflicting/unsupported status query, reconciliation deadline/
escalation, direct/callback/query evidence racing manual assessment, forbidden
blind retry of an unknown privileged/non-compensable effect, unauthorized
privileged resolution, policy/delegation/employment/tenant/target changes from
commit through lease and dispatch, forged/replayed dispatch authorization,
worker impersonation of an offline approver, valid scheduled grant after session
expiry, grant replay/attempt exhaustion, approval/policy/approver/target-version
drift, approval-to-grant crash/reorder/duplicate, pre-issuance revocation,
successor/predecessor fork, revocation/final-attempt claim race, crash after
claim before provider I/O, duplicate/substituted claim/receipt, effect/target
drift, consumed-attempt failover/restore, grant/effect two-stream mutation,
service-principal scope confusion, worker confused deputy or target/request
substitution, long pause after redemption, revocation/expiry/target/provider-
capability change before start claim, deadline/worker/audience/provider/request
substitution, clock rollback, concurrent shared-credential workers, claim/
worker/lease-generation/fence/permit substitution, claim-response loss, stale-
worker takeover, same-claim replay, expired/restored/reconstructed start permit,
pre/post-claim crash, uncertain retransmission, mixed quota-claim atomicity,
overlapping-set deadlock/livelock,
partial reservation/recovery, token/digest/membership substitution, cross-
partition claim set, hierarchical capacity-lease over-allocation/reclamation/
failover, incompatible active/active region, failover between reservation and
exact-set consumption,
concurrency release under unknown remote outcome, transmitted rate-token refund,
estimated-to-actual cost
settlement, retained-byte accounting, write-off/provider-evidence confusion,
duplicate/forged refund, unknown-liability leak, compensation claim reuse,
capacity-lease expiry/reclamation with retained bytes, unknown liabilities,
charged operations, or spent tokens, child-partition loss, late evidence after
expiry/failover, duplicate encumbrance transfer, parent reclaim/failover race,
transfer crash/duplicate/reorder/lost acknowledgement, source/destination
failover, stale epoch, conflicting transfer, forbidden free-at-both-ends state,
accounting-owner/hierarchy-root/parent/period/lane/class/region/authorization
substitution, emergency/security-cleanup-to-business reclassification,
protected-to-business conversion through adjustment, existing-
class rewrite, tenant-invoked capacity policy, reserve-floor/policy replay,
ambiguous policy owner/parent, non-co-located or partial activation, concurrent
parent allocation, stale high-watermark, substituted delta/simulation/floor
version, self-lowered floor, floor reduction/spend actor or approval-lineage
reuse, operational-fence/obligation/platform-minimum bypass, omitted/aliased
parent, add/remove/reparent/generation race, stale root manifest/membership
epoch, conservation-total mismatch, coordinator failover, wrong-manifest
activation, partial rollout/rollback/restore,
tenant suspension or principal/policy revocation during delayed activation/
acknowledgement/reclaim,
tenant/subject/session/delegation/policy/service-principal authority changes
racing dispatch, missing/substituted/reordered fence entries, epoch reuse, stale
external authority for privileged work, target deletion/merge/migration/
supersession/restore racing dispatch, missing/stale target fence, stale target
projection, cross-shard target placement, remote validator/account/resource
substitution, ABA recreation, weak/strong
confusion, provider downgrade/ignored conditional, silent refresh, typed
precondition failure retried, response-loss misclassification,
exception scope/request substitution, revocation/expiry/provider-capability/
final-attempt race, guard omission, restore resurrection,
lock-order inversion, retry exhaustion/identity drift,
provider outage under tenant exhaustion, per-tenant/global recovery starvation
or reserve abuse, Phase E fake-versus-real differential, rolling upgrades, and
soak pass.
Exit criteria: HA preserves documented at-least-once delivery while the atomic
work variants prevent duplicate local protected commits and detect/reconcile
possible remote duplication. Execution state, provider outcome, resolution
evidence, manual workflow, and compensation remain distinguishable through
failover. Every dispatch proves its declared authorization freshness and exact
binding by redeeming typed authority without human impersonation. Every grant
lineage retains one authoritative owner through issuance, revocation, and
successor creation; every attempt is claimed through a co-located fenced guard
while only the effect stream advances. Every authority change linearizes through
the complete local monotonic fence set, and composite retries preserve identity.
Every admitted receipt has an immutable deadline; a worker rechecks current
fences at one bounded transmission-start claim. Exactly one worker instance/
lease generation receives non-persisted permit material once; duplicate or
replacement workers receive status, and ambiguous delivery or a possibly
started request enters reconciliation instead of ordinary retry.
Every current-target dispatch linearizes on the target stream version/digest or
co-located authoritative target-fence row without advancing a second stream.
Remote provider mutation preserves its separate concurrency profile and exact
validator without claiming local target freshness; unconditional work also
claims its exact live exception guard while advancing only the effect stream.
Every exact immutable quota set remains local transactional authority in one
partition, reserves all-or-none, and settles by kind; hierarchical leases
conserve wider capacity and per-kind encumbrances through expiry/failover/
transfer without a distributed work transaction; local transfer transitions are
receipt-idempotent, message delivery is at least once, and conservative double-
entry accounting never exposes capacity at both ends or changes owner,
hierarchy, parent, period, lane, capacity class, region, or authorization
lineage. Existing capacity class never changes; only fenced, simulated,
separation-of-duties changes to future unallocated parent capacity are allowed.
Each one-parent policy activation atomically changes its co-located parent
ledger under independently governed floors. A floor reduction cannot share
actors or approval lineage with spending released capacity and cannot bypass
operational fences, obligations, or platform minima. Multi-parent finalization
authenticates the complete unchanged root manifest before activation; delayed
transitions recheck current local authority. Eligible refunds occur exactly once,
administrative write-off remains distinct, compensation is separately
accounted, fair recovery remains available under hostile tenant exhaustion, and
every workflow interface/data surface is registered.
`v0.70.0 implementation stop reached. Run pentest for this exact commit.`
