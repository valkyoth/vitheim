# Phase E — IT Service Management

Scope: `0.41.0–0.50.0`. Typed domains compose the work foundation. Every domain
owns sealed transition commands/events and rejects invalid transitions without
events, receipts, outbox work, notifications, or other side effects; no generic
status setter or cross-domain patch command is permitted.

## `0.41.0` — Incident Management
Status: planned. Setup: freeze incident lifecycle, impact/urgency, service impact,
major flag, assignment, resolution, and reopen rules as typed transition commands
with explicit preconditions and rejection results. Goal: production-shaped
incident decisions. Deliverables: aggregate, sealed commands/events, projections,
audit, and no-side-effect rejection fixtures.
Verification: unauthorized assignment/closure, invalid resolution, severity abuse,
reopen races, tenant and replay tests pass. Exit criteria: incident invariants hold. `v0.41.0 implementation stop reached. Run pentest for this exact commit.`

## `0.42.0` — Service-Request Management
Status: planned. Setup: define requester/beneficiary, entitlement, requested items,
fulfillment tasks, cancellation, and sensitive answers. Goal: safe request fulfillment.
Deliverables: request aggregate, fulfillment orchestration, views. Verification:
entitlement bypass, answer leakage, duplicate fulfillment, cancellation races,
and tenant tests pass. Exit criteria: fulfillment requires authorized immutable input. `v0.42.0 implementation stop reached. Run pentest for this exact commit.`

## `0.43.0` — Service Catalog And Forms
Status: planned. Setup: define catalog/version, offering, audience, schema, price
facts, publication, and retirement. Goal: declarative safe request intake.
Deliverables: catalog aggregates, form compiler, entitlement/price snapshots.
Verification: schema/UI injection, price tamper, hidden field, stale version,
oversized forms, and publication tests pass. Exit criteria: submitted requests bind the approved catalog version. `v0.43.0 implementation stop reached. Run pentest for this exact commit.`

## `0.44.0` — Problem Management
Status: planned. Setup: define problem lifecycle, incident evidence, cause,
workaround links, and resolution. Goal: investigate recurring causes without leaking incidents.
Deliverables: problem aggregate, relationship rules, trend projection. Verification:
unauthorized linkage/read, false cause, relationship cycles, replay and isolation pass.
Exit criteria: conclusions retain evidence and access policy. `v0.44.0 implementation stop reached. Run pentest for this exact commit.`

## `0.45.0` — Known Errors And Workarounds
Status: planned. Setup: define draft/review/publish/retire, audience, risk warnings,
expiry, and problem provenance. Goal: publish reviewed operational advice.
Deliverables: known-error aggregate, approval workflow, contextual suggestions.
Verification: unauthorized/stale publication, unsafe markup, hidden linkage,
expiry bypass, and search visibility pass. Exit criteria: unreviewed advice cannot surface as trusted. `v0.45.0 implementation stop reached. Run pentest for this exact commit.`

## `0.46.0` — Change Management
Status: planned. Setup: freeze risk, plans, window, affected graph, conflicts,
approval, implementation, validation, backout, and emergency rules. Goal: govern service change.
Deliverables: change aggregate, assessment, calendar/conflict integration.
Verification: approval/window/backout bypass, self-approval, conflict races,
emergency abuse, and replay pass. Exit criteria: execution needs a valid approved plan. `v0.46.0 implementation stop reached. Run pentest for this exact commit.`

## `0.47.0` — Release And Deployment Records
Status: planned. Setup: define release contents, environment, artifact identity,
deployment evidence, status sources, and rollback link. Goal: trustworthy deployment history.
Deliverables: release/deployment aggregates and evidence projections. Verification:
forged artifact/status, unauthorized environment linkage, duplicate deployment,
and custody tests pass. Exit criteria: deployment claims require verifiable evidence. `v0.47.0 implementation stop reached. Run pentest for this exact commit.`

## `0.48.0` — Major-Incident Command Process
Status: planned. Setup: define declaration authority, roles, timeline, communications,
decisions, handoffs, and closure. Goal: coordinate crises without role takeover.
Deliverables: command process aggregate, role workspace, bounded notification plan.
Verification: unauthorized declaration/role claim, flood, stale handoff, hidden
timeline, and failure recovery pass. Exit criteria: every crisis action is attributable. `v0.48.0 implementation stop reached. Run pentest for this exact commit.`

## `0.49.0` — Postmortems And Corrective Actions
Status: planned. Setup: define sensitive draft, contributors, evidence, review,
publication audience, lessons, and linked tasks. Goal: durable learning without blame leakage.
Deliverables: postmortem aggregate, timeline import, corrective-action tracking.
Verification: unauthorized publish/delete, identity redaction, evidence tamper,
action orphaning, and export tests pass. Exit criteria: published reports retain review and provenance. `v0.49.0 implementation stop reached. Run pentest for this exact commit.`

## `0.50.0` — Integrated ITSM Beta
Status: planned. Setup: pin all ITSM schemas/APIs, upgrade path, permissions, and
representative scenarios. Goal: prove coherent end-to-end ITSM behavior.
Deliverables: integrated workspace, migrations, fixtures, operator/admin docs.
Verification: cross-module authorization, chained workflows, search parity,
upgrade/rollback, load, recovery, and full phase pentest pass. Exit criteria: beta claims and limitations are exact. `v0.50.0 implementation stop reached. Run pentest for this exact commit.`
