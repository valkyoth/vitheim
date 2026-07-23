# Phase D — Universal Work Platform

Scope: `0.31.0–0.40.0`. Every mutation is a command; reads are policy-filtered.

## `0.31.0` — Shared Work-Item Components
Status: planned.
Setup: freeze domain-specific identity, lifecycle, ownership, timing, labels,
relationships, collaboration, compliance, and namespaced/versioned custom-field
composition; `WorkItem` remains value components, never an aggregate or table.
Goal: share behavior without a universal mutable ticket table.
Deliverables: bounded component models, invariants, codecs, and builders; no
public `WorkItemId`, generic patch/setter/status command, or polymorphic write port.
Verification: compile-fail domain ID/command/event/stream mixing, cross-type
confusion, invalid composition, protected custom-field namespaces, field budget,
tenant, round-trip, and property tests pass.
Exit criteria: domain types retain independent invariants. `v0.31.0 implementation stop reached. Run pentest for this exact commit.`

## `0.32.0` — Generic Task Aggregate
Status: planned.
Setup: define task states, assignee, checklist, dependencies, due time, and completion authority.
Goal: provide reusable auditable work execution.
Deliverables: task commands/events/aggregate and projections.
Verification: unauthorized completion, dependency bypass/cycles, stale version,
replay, time edge, and state-machine tests pass.
Exit criteria: task transitions are deterministic and authorized. `v0.32.0 implementation stop reached. Run pentest for this exact commit.`

## `0.33.0` — Configurable Lifecycle State Machines
Status: planned.
Setup: bound states, transitions, guards, terminal states, versions, and migration.
Goal: permit configuration without executable scripts.
Deliverables: validated state-machine model, interpreter, simulator, and diagnostics.
Verification: illegal/unreachable states, cycles, guard ambiguity, instruction
exhaustion, version migration, and differential simulation pass.
Exit criteria: invalid definitions cannot activate. `v0.33.0 implementation stop reached. Run pentest for this exact commit.`

## `0.34.0` — Assignment Groups And Ownership
Status: planned.
Setup: define group/member facts and version, eligibility proof, assignment
authority, queues, delegation scope, policy decision/version, and history;
assignment itself grants no authority.
Goal: route work without privilege escalation.
Deliverables: ownership commands/events, candidate policy facts, and audit explanations.
Verification: forged/stale membership, cross-tenant groups, unauthorized transfer,
empty group, races, and replay pass.
Exit criteria: every assignment explains actor and policy. `v0.34.0 implementation stop reached. Run pentest for this exact commit.`

## `0.35.0` — Comments, Mentions, Watchers, And Activity
Status: planned.
Setup: define bounded content, visibility labels, immutable edits, mention
resolution, and notification intent; dispatch reauthorizes current recipient and
field visibility instead of trusting command-time authority.
Goal: enable collaboration without content or permission leaks.
Deliverables: collaboration events, safe rendering contract, watchers, and activity projection.
Verification: stored injection, hidden-field mention, notification amplification,
Unicode/size limits, edit history, and tenant tests pass.
Exit criteria: collaboration preserves visibility everywhere. `v0.35.0 implementation stop reached. Run pentest for this exact commit.`

## `0.36.0` — Attachment Quarantine Lifecycle
Status: planned.
Setup: bind staged blobs, content claims, scanning result, quarantine, release, and download policy.
Goal: prevent untrusted files becoming trusted attachments implicitly.
Deliverables: attachment aggregate, scanner port, safe disposition, and audit evidence.
Verification: archive bombs, type mismatch, malicious names, replayed verdicts,
unauthorized download, deletion, and quota tests pass.
Exit criteria: only policy-approved verified blobs become downloadable. `v0.36.0 implementation stop reached. Run pentest for this exact commit.`

## `0.37.0` — Priority, Severity, And Impact Models
Status: planned.
Setup: define bounded scales, derivation inputs, override authority, versions, and explanation.
Goal: make prioritization deterministic and resistant to manipulation.
Deliverables: typed scales, calculation policy, override events, and rationale model.
Verification: min/max/overflow, missing facts, forged override, version drift,
monotonicity properties, and replay pass.
Exit criteria: priority changes are explainable and auditable. `v0.37.0 implementation stop reached. Run pentest for this exact commit.`

## `0.38.0` — Calendars, Targets, And SLA Calculations
Status: planned.
Setup: define timezone/version sources, schedules, holidays, pauses, target rules, and calculation budgets.
Goal: calculate service targets reproducibly.
Deliverables: calendar model, pure elapsed-time engine, SLA events, and explanation trace.
Verification: DST, leap/boundary times, overlapping holidays, pause abuse,
overflow, long-span exhaustion, and known vectors pass.
Exit criteria: identical pinned calendars yield identical results. `v0.38.0 implementation stop reached. Run pentest for this exact commit.`

## `0.39.0` — Approval And Notification Foundations
Status: planned.
Setup: define approver eligibility, separation of duties, quorum, expiry, immutable decisions, and delivery intents.
Goal: prevent self-approval and duplicated notification effects.
Deliverables: approval aggregate, notification model, templates, and idempotent routing port.
Verification: self/stale/duplicate approval, quorum races, expiry, template injection,
delivery replay, and hidden-field tests pass.
Exit criteria: approvals and deliveries remain attributable. `v0.39.0 implementation stop reached. Run pentest for this exact commit.`

## `0.40.0` — Authenticated API And Service-Desk UI
Status: planned; internal test slice only until Phase F identity passes.
Setup: define static/fake test authentication facts, CSRF/origin policy, command
endpoints, typed policy-limited read DTOs, field classification, and limits.
Goal: expose the first internal API/UI vertical slice without a production authentication claim.
Deliverables: HTTP/API boundary, minimal UI, secure headers/cookies, and end-to-end audit; no fetch-everything-then-redact path.
Verification: IDOR, CSRF, XSS, fixation, enumeration, body/rate exhaustion,
field leakage, logout/revocation, and DAST pass.
Exit criteria: the UI has no direct mutation bypass and cannot be deployed with
the test identity profile as production. `v0.40.0 implementation stop reached. Run pentest for this exact commit.`
