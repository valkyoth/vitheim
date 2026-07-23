# Phase E — IT Service Management

Scope: `0.41.0–0.50.0`. Typed domains compose the work foundation. Every domain
owns sealed transition commands/events and rejects invalid transitions without
domain events, business receipts, outbox work, notifications, or state effects.
The separate `0.20.1` security-audit sink and idempotent rejection receipt may
record the attempt without changing the aggregate. No generic status setter or
cross-domain patch command is permitted.

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
expiry, problem provenance, and a deterministic search-discovery port/fake;
Phase J search is not yet an implementation dependency. Goal: publish reviewed
operational advice. Deliverables: known-error aggregate, approval workflow,
contextual suggestion contract, and fake search fixtures.
Verification: unauthorized/stale publication, unsafe markup, hidden linkage,
expiry bypass, fake-port visibility pass; real search differential repeats at
`0.100.0`. Exit criteria: unreviewed advice cannot surface as trusted. `v0.45.0 implementation stop reached. Run pentest for this exact commit.`

## `0.46.0` — Change Management
Status: planned. Setup: freeze risk, plans, window, affected-topology port/fake,
conflicts, approval, implementation, validation, backout, and emergency rules;
Phase I graph is not yet an implementation dependency. Goal: govern service change.
Deliverables: change aggregate, assessment, calendar/conflict integration, and
deterministic topology fixtures.
Verification: approval/window/backout bypass, self-approval, conflict races,
emergency abuse, fake topology differential, and replay pass; real graph
integration repeats at `0.88.0`. Exit criteria: execution needs a valid approved plan. `v0.46.0 implementation stop reached. Run pentest for this exact commit.`

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

## `0.48.1` — Stakeholder Communications And Status Publishing

Status: planned.

Setup: define internal stakeholder, customer, partner, regulatory, and public
audiences; communication classification; source incident/service-health facts;
draft/review/approve/publish/update/correct/retract lifecycle; channel/profile;
templates/locales; cadence; embargo; subscriptions; accessibility; delivery
receipts; public status component identity; history; and retention. Publication
never exposes the private incident record by default.

Goal: coordinate consistent major-incident communications and optional internal/
public status pages without bypassing review, field policy, or source provenance.

Deliverables: communication/status-update aggregate, audience-specific typed
DTOs, approval workflow, status-page projection/API, channel publication port
with fake adapter, correction/retraction model, subscription intents, and runbook.

Verification: unauthorized/premature publish, audience/tenant confusion, hidden
field/root-cause/evidence leak, stale service status, false recovery, template/
locale/XSS injection, spoofed status component, correction-history deletion,
notification flood, provider outage/retry, cache/CDN staleness, and DAST pass.

Exit criteria: every published statement identifies its approved audience,
source facts, reviewer, version, time, and correction history without revealing
unauthorized incident data. `v0.48.1 implementation stop reached. Run pentest for this exact commit.`

## `0.48.2` — Hosted Status Publication And Reconciliation

Status: planned. The built-in hosted status API is the default production
candidate; any external publication channel remains blocked until its exact
client/TLS/authentication/profile and failure semantics are admitted.

Setup: define separate internal, authenticated customer, and public status
origins; immutable publication version, component/audience mapping, approval
receipt, conditional write/idempotency, cache policy, subscription delivery,
correction/retraction, authenticated channel receipt, retry/reconciliation,
outage/degraded behavior, custom-domain/TLS, rate limits, and anti-enumeration.

Goal: turn the `0.48.1` publication port and fake into a supported hosted status
surface without exposing the private incident or service-health authority.

Deliverables: policy-filtered built-in status API and read projection, static/
cache representation with explicit freshness, authenticated administration
transport, publication reconciler, subscription integration through `0.39.4`,
optional admitted channel adapter, capability/health probes, DAST corpus,
deployment guide, and outage runbook.

Verification: unauthorized/premature publication, audience/component/tenant
confusion, hidden-field and count leakage, stale cache/CDN, false success
receipt, duplicate/out-of-order update, correction-history loss, provider
outage/retry, subscription flood, domain/TLS takeover, restore/rebuild,
accessibility, load, and fake-versus-hosted differential tests pass.

Exit criteria: at least the selected built-in hosted profile publishes and
corrects status with reproducible approval/source/receipt history; external
channels are supported only when independently evidenced. `v0.48.2
implementation stop reached. Run pentest for this exact commit.`

## `0.49.0` — Postmortems And Corrective Actions
Status: planned. Setup: define sensitive draft, contributors, evidence, review,
publication audience, lessons, and linked tasks. Goal: durable learning without blame leakage.
Deliverables: postmortem aggregate, timeline import, corrective-action tracking.
Verification: unauthorized publish/delete, identity redaction, evidence tamper,
action orphaning, and export tests pass. Exit criteria: published reports retain review and provenance. `v0.49.0 implementation stop reached. Run pentest for this exact commit.`

## `0.50.0` — Integrated ITSM Beta
Status: planned. Setup: pin all ITSM schemas/APIs, upgrade path, permissions, and
representative scenarios. Goal: prove coherent end-to-end ITSM behavior.
Deliverables: integrated workspace, migrations, deterministic workflow/search
port fakes, fixtures, and operator/admin docs; no Phase G/J implementation claim.
Verification: cross-module authorization, fake-port orchestration/search
contracts, upgrade/rollback, load, recovery, and full phase pentest pass. Real
workflow and search integration is repeated at `0.70.0` and `0.100.0`.
Exit criteria: beta claims and unavailable later-phase integrations are exact.
`v0.50.0 implementation stop reached. Run pentest for this exact commit.`
