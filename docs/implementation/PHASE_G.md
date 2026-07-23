# Phase G — Durable Workflows

Scope: `0.61.0–0.70.0`. Definitions compile to deterministic IR; hosted effects return as events.

## `0.61.0` — Workflow IR
Status: planned. Setup: version node/opcode schemas, graph validity, types, capabilities, and budgets. Goal: canonical hidden-free workflows. Deliverables: IR, validator, codec, disassembler. Verification: malformed graphs, unknown opcodes, cycles, depth/instruction bombs, canonical round trips pass. Exit criteria: invalid IR cannot activate. `v0.61.0 implementation stop reached. Run pentest for this exact commit.`

## `0.62.0` — Deterministic Interpreter
Status: planned. Setup: define state, step budget, yielded effects, replay inputs, and failure. Goal: pure durable execution. Deliverables: interpreter, traces, reference fixtures. Verification: infinite loops, nondeterministic ordering, exhaustion, replay divergence, malformed state, and model tests pass. Exit criteria: equal histories yield equal effects. `v0.62.0 implementation stop reached. Run pentest for this exact commit.`

## `0.63.0` — Human Tasks And Approvals
Status: planned. Setup: bind task actor eligibility, claim, completion schema, approval separation, expiry. Goal: safe human workflow stops. Deliverables: activity models and command integration. Verification: theft, self-approval, stale claim, duplicate completion, hidden fields, tenant isolation pass. Exit criteria: human effects require current authority. `v0.63.0 implementation stop reached. Run pentest for this exact commit.`

## `0.64.0` — Timers, Deadlines, And Retries
Status: planned. Setup: define logical deadlines, scheduled IDs, retry/backoff,
jitter input, cancellation, quotas, and specialize the `0.18.2` atomic timer
dispatch and later result variants without weakening their fence/receipt/local-
effect boundaries. Remote work executes only after committed dispatch and
returns through a separate activity-result/consumer bundle. Goal: crash-safe
time behavior without a distributed exactly-once claim. Deliverables: timer
dispatch/result effects, scheduler bridge, and atomic-variant integration
fixtures. Verification: clock jumps, retry storms, duplicate wakeups/results,
cancellation races, stale fence, dispatch/completion collapse, receipt/effect
split, remote-call-in-transaction rejection, overflow, and replay pass.
Exit criteria: timers cannot create uncontrolled or unreceipted work, and remote
execution remains explicitly at least once. `v0.64.0 implementation stop reached. Run pentest for this exact commit.`

## `0.65.0` — Parallel Branches And Joins
Status: planned. Setup: define branch identity, join policy, failure/cancel propagation, ordering, and bounds. Goal: deterministic concurrency semantics. Deliverables: fork/join IR and interpreter support. Verification: premature/duplicate join, late events, branch leaks, cancellation, permutations, and state-model pass. Exit criteria: scheduling order cannot change result. `v0.65.0 implementation stop reached. Run pentest for this exact commit.`

## `0.66.0` — Compensation Mechanics
Status: planned. Setup: define compensable effects, stack/order, idempotency,
retry horizon, manual intervention, and evidence against the `0.18.2` external-
outcome states. Reconcile an `OutcomeUnknown` original effect before deciding
whether compensation is applicable; compensation is itself a separately
identified external effect whose unknown outcome is not blindly retried.
Goal: bounded auditable recovery from partial workflows without inventing
certainty about provider state. Deliverables: compensation IR/state, original-
and-compensation outcome linkage, reconciliation policy, and operator view.
Verification: double/failed/out-of-order compensation, response-loss ambiguity,
compensation after an unknown original, unknown compensation result, crash
windows, non-compensable effects, unauthorized manual resolution, and replay
pass. Exit criteria: incomplete rollback or uncertain provider state is
explicit, never hidden or converted into assumed success.
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
drain, failover, authorization and `0.51.2` tenant-data-surface registry
entries, Phase E workflow contract fixtures, and `0.39.1–0.39.3` on-call/
paging/notification process-manager scenarios. Goal: durable multi-worker
execution. Deliverables: hosted worker orchestration, authorization cases,
external-outcome reconciler/manual queue, ITSM and response-delivery integration
retests, and operational evidence.
Verification: lease loss,
partitions, duplicate activity/result, activity receipt/effect split, network-
stale fencing commits, poison/dead-letter split, quota/effect split, poison loops, cross-tenant/
unauthorized effects, paging escalation/acknowledgement and quiet-hour races,
provider acceptance followed by response loss, idempotency-window expiry,
conflicting/unsupported status query, forbidden blind retry of an unknown
privileged/non-compensable effect, Phase E fake-versus-real differential,
rolling upgrades, and soak pass.
Exit criteria: HA preserves documented at-least-once delivery while the atomic
work variants prevent duplicate local protected commits and detect/reconcile
possible remote duplication; every workflow interface/data surface is
registered. `v0.70.0 implementation stop reached. Run pentest for this exact commit.`
