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
Setup: bind staged blobs, content claims, scanning result, scanner engine/
signature/version, scan time, verdict expiry/reevaluation policy, quarantine,
release, and download policy.
Goal: prevent untrusted files becoming trusted attachments implicitly.
Deliverables: attachment aggregate, scanner port, safe disposition, and audit evidence.
Verification: archive bombs, type mismatch, malicious names, replayed verdicts,
unauthorized download, deletion, and quota tests pass.
Exit criteria: only policy-approved verified blobs become downloadable. `v0.36.0 implementation stop reached. Run pentest for this exact commit.`

## `0.36.1` — Malware-Scanner Adapter And Isolation

Status: planned; blocked until the exact scanner/service, update source,
protocol/client, maintenance, license, and sandbox admission record is approved.

Setup: define scanner worker identity, content handoff without path authority,
engine/signature/version attestation, timeouts, archive/decompression budgets,
network policy, result authentication, update/rollback, reevaluation, quarantine
retention, and outage behavior.

Goal: turn the `0.36.0` scanner port into an isolated production-capable verdict
source without treating a scanner result as permanent truth.

Deliverables: scanner adapter/worker, authenticated verdict envelope, update and
health probes, reevaluation scheduler, fake scanner, and operator runbook.

Verification: scanner compromise/impersonation, signature downgrade, stale/
replayed verdict, archive bomb, parser crash, timeout, worker escape, network
egress, result tamper, outage, and re-scan tests pass.

Exit criteria: no attachment becomes downloadable from an unauthenticated,
stale, or unbounded scan. `v0.36.1 implementation stop reached. Run pentest for this exact commit.`

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

## `0.38.1` — SLI, SLO, And Error-Budget Models

Status: planned.

Setup: distinguish internal service-level indicators/objectives and error
budgets from customer-facing SLA commitments. Define indicator identity/unit/
direction, good/valid event criteria, source/provenance, correction, rolling/
calendar windows, objective versions, missing-data policy, burn-rate windows,
budget consumption/reset, maintenance exclusions, and calculation budgets.

Goal: model service reliability deterministically without treating monitoring
data, SLOs, SLAs, or contractual penalties as interchangeable.

Deliverables: typed SLI observation and correction facts, SLO/policy aggregate,
pure window/error-budget engine, burn-rate explanation, fake measurement source,
and golden calculation corpus.

Verification: forged/stale sources, unit/window confusion, missing-data fail-open,
historical rewrite, duplicate/out-of-order samples, exclusion abuse, overflow,
clock/DST boundaries, policy downgrade, long-range exhaustion, and properties pass.

Exit criteria: every SLO/error-budget result cites its exact observations,
corrections, window, exclusions, and objective version. `v0.38.1 implementation
stop reached. Run pentest for this exact commit.`

## `0.39.0` — Approval And Notification Foundations
Status: planned.
Setup: define approver eligibility, separation of duties, quorum, expiry, immutable decisions, and delivery intents.
Goal: prevent self-approval and duplicated notification effects.
Deliverables: approval aggregate, notification model storing protected record/
field references and render-time policy context rather than pre-rendered
sensitive bodies, templates, and idempotent routing port.
Verification: self/stale/duplicate approval, quorum races, expiry, template injection,
delivery replay, and hidden-field tests pass.
Exit criteria: approvals and deliveries remain attributable. `v0.39.0 implementation stop reached. Run pentest for this exact commit.`

## `0.39.1` — On-Call Rotations, Overrides, And Handoffs

Status: planned.

Setup: define team/rotation identity, members and eligibility versions, timezone,
layers, schedules, overrides, swaps, gaps/overlaps, effective responder,
handoff acknowledgement, delegation, expiry, privacy, and audit. Being on call
does not itself grant record or containment authority.

Goal: calculate who should be contacted at a time without turning schedules
into hidden authorization or mutable calendar scripts.

Deliverables: rotation aggregate, pure schedule evaluator, override/swap/handoff
commands and events, coverage projection, simulator, and calendar integration.

Verification: stale membership, unauthorized swap/override, coverage gap,
overlap ambiguity, DST/timezone/leap boundaries, expired delegation, identity
recreation, privacy leakage, huge schedules, replay, and property tests pass.

Exit criteria: effective on-call responsibility is reproducible and distinct
from permission to perform the response action. `v0.39.1 implementation stop
reached. Run pentest for this exact commit.`

## `0.39.2` — Paging Escalation, Acknowledgement, And Receipts

Status: planned.

Setup: define paging policy/version, severity/trigger, ordered targets, delays,
attempt caps, channels, delivery/acknowledgement identity, acknowledgement
authority, stop/escalate conditions, deduplication, quiet-hour interaction,
provider receipts, retry/backoff, cancellation, and incident linkage.

Goal: deliver time-critical pages with bounded escalation and complete evidence.

Deliverables: paging-policy aggregate, deterministic escalation process manager,
provider-neutral page port, fake provider, acknowledgement commands, delivery/
escalation receipts, and operator simulator.

Verification: forged/replayed acknowledgement, wrong responder, delivery lies,
duplicate/flood loops, stale rotation, escalation skip, quiet-hour bypass,
provider outage, retry storms, cancellation races, tenant confusion, and clock
boundaries pass.

Exit criteria: every escalation step and stop decision is attributable,
idempotent, bounded, and linked to current on-call and policy facts. `v0.39.2
implementation stop reached. Run pentest for this exact commit.`

## `0.39.3` — Notification Preferences, Quiet Hours, And Emergency Overrides

Status: planned.

Setup: define per-subject/team channel eligibility, verified endpoints,
category/severity preferences, locale/timezone, quiet hours, digests, frequency
caps, mandatory legal/security notices, emergency override authority, reason,
expiry, escalation, unsubscribe limits, and policy precedence.

Goal: respect delivery preferences without allowing users or attackers to
suppress mandatory or emergency communications.

Deliverables: notification-preference aggregate, pure delivery-policy evaluator,
verified-endpoint lifecycle, quiet-hour/digest scheduler inputs, emergency
override command, explanation trace, and preference API projections.

Verification: endpoint takeover, preference/tenant confusion, timezone abuse,
mandatory-notice suppression, perpetual emergency override, notification flood,
hidden recipient/field leakage, stale revocation, digest duplication, and
policy/renderer differential tests pass.

Exit criteria: each delivery or suppression explains the current preference,
mandatory policy, quiet-hours decision, and any bounded emergency override.
`v0.39.3 implementation stop reached. Run pentest for this exact commit.`

## `0.40.0` — Authenticated API And Service-Desk UI
Status: planned; internal test slice only until Phase F identity passes.
Setup: define static/fake test authentication facts, CSRF/origin policy, command
endpoints with exact expected-version/ETag behavior, externally returned
projection consistency tokens, typed policy-limited read DTOs, field
classification, and limits.
Goal: expose the first internal API/UI vertical slice without a production authentication claim.
Deliverables: HTTP/API boundary, minimal UI, secure headers/cookies, and end-to-end audit; no fetch-everything-then-redact path.
Verification: IDOR, CSRF, XSS, fixation, enumeration, body/rate exhaustion,
field leakage, stale ETag, read-your-write token misuse, logout/revocation, and
DAST pass.
Exit criteria: the UI has no direct mutation bypass and cannot be deployed with
the test identity profile as production. `v0.40.0 implementation stop reached. Run pentest for this exact commit.`

## `0.40.1` — API-First Application And UI Crate Boundary

Status: planned.

Setup: define separate `vitheim-api-contract`, `vitheim-api-application`,
hosted transport, and `vitheim-ui` crate responsibilities; the UI receives only
versioned API DTOs, actions, errors, consistency tokens, and capability
descriptors. Forbid UI dependencies on aggregates, journal/storage adapters,
internal dispatchers, secrets, or administrator-only repositories.

Goal: make every product capability headless and ensure the first-party UI is
an ordinary policy-constrained API client.

Deliverables: checked crate/layer rules, transport-neutral API application port,
in-process and hosted test transports, UI API client, headless conformance
harness, and an interface registry proving every UI action maps to a documented
command/read endpoint.

Verification: compile-fail forbidden dependencies, UI-versus-headless
differential scenarios, undocumented endpoint/action, direct mutation attempts,
mass assignment, field/tenant leakage, stale ETag/consistency tokens, transport
error equivalence, CSRF/origin behavior, and API-disabled UI failure pass.

Exit criteria: removing the UI leaves a complete supported application API, and
the UI cannot perform any action unavailable to an equivalently authorized API
client. `v0.40.1 implementation stop reached. Run pentest for this exact commit.`
