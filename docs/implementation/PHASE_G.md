# Phase G — Durable Workflows

Scope: `0.61.0–0.70.0`. Definitions compile to deterministic IR; hosted effects return as events.

## `0.61.0` — Workflow IR
Status: planned. Setup: version node/opcode schemas, graph validity, types, capabilities, and budgets. Goal: canonical hidden-free workflows. Deliverables: IR, validator, codec, disassembler. Verification: malformed graphs, unknown opcodes, cycles, depth/instruction bombs, canonical round trips pass. Exit criteria: invalid IR cannot activate. `v0.61.0 implementation stop reached. Run pentest for this exact commit.`

## `0.62.0` — Deterministic Interpreter
Status: planned. Setup: define state, step budget, yielded effects, replay inputs, and failure. Goal: pure durable execution. Deliverables: interpreter, traces, reference fixtures. Verification: infinite loops, nondeterministic ordering, exhaustion, replay divergence, malformed state, and model tests pass. Exit criteria: equal histories yield equal effects. `v0.62.0 implementation stop reached. Run pentest for this exact commit.`

## `0.63.0` — Human Tasks And Approvals
Status: planned. Setup: bind task actor eligibility, claim, completion schema, approval separation, expiry. Goal: safe human workflow stops. Deliverables: activity models and command integration. Verification: theft, self-approval, stale claim, duplicate completion, hidden fields, tenant isolation pass. Exit criteria: human effects require current authority. `v0.63.0 implementation stop reached. Run pentest for this exact commit.`

## `0.64.0` — Timers, Deadlines, And Retries
Status: planned. Setup: define logical deadlines, scheduled IDs, retry/backoff, jitter input, cancellation, quotas. Goal: crash-safe time behavior. Deliverables: timer effects and scheduler bridge. Verification: clock jumps, retry storms, duplicate wakeups, cancellation races, overflow, replay pass. Exit criteria: timers cannot create uncontrolled work. `v0.64.0 implementation stop reached. Run pentest for this exact commit.`

## `0.65.0` — Parallel Branches And Joins
Status: planned. Setup: define branch identity, join policy, failure/cancel propagation, ordering, and bounds. Goal: deterministic concurrency semantics. Deliverables: fork/join IR and interpreter support. Verification: premature/duplicate join, late events, branch leaks, cancellation, permutations, and state-model pass. Exit criteria: scheduling order cannot change result. `v0.65.0 implementation stop reached. Run pentest for this exact commit.`

## `0.66.0` — Compensation Mechanics
Status: planned. Setup: define compensable effects, stack/order, idempotency, retry, manual intervention, and evidence. Goal: bounded auditable recovery from partial workflows. Deliverables: compensation IR/state and operator view. Verification: double/failed/out-of-order compensation, crash windows, non-compensable effects, replay pass. Exit criteria: incomplete rollback is explicit, never hidden. `v0.66.0 implementation stop reached. Run pentest for this exact commit.`

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
Status: planned. Setup: define leases/fencing, activity idempotency, `0.30.1`
queue semantics, poison policy, drain, failover, authorization/tenant registry
entries, and Phase E workflow contract fixtures. Goal: durable multi-worker
execution. Deliverables: hosted worker orchestration, authorization cases,
ITSM integration retest, and operational evidence. Verification: lease loss,
partitions, duplicate activity, crash points, poison loops, cross-tenant/
unauthorized effects, Phase E fake-versus-real differential, rolling upgrades,
and soak pass. Exit criteria: HA preserves documented at-least-once semantics
and every workflow interface is registered. `v0.70.0 implementation stop reached. Run pentest for this exact commit.`
