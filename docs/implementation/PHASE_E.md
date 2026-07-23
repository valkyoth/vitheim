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
Phase I graph is not yet an implementation dependency. An approval command for
scheduled implementation may authorize an `ApprovedExecutionGrant` only after
freezing the change/plan version, exact effect/request/target digests, affected
target version, purpose, window/not-before/expiry, permitted attempts,
approvers/quorum, approval assurance, separation of duties, policy version, and
revocation conditions. A worker later authenticates as itself and redeems that
grant; it never adopts an offline approver's identity. Human session expiry
alone does not revoke the grant, while target drift, explicit revocation,
tenant suspension, attempt/expiry exhaustion, approver eligibility loss, or
authorization-policy drift follows the fail-closed `0.18.2` rules and requires
a successor approval/revalidation grant. Each change type declares grant
ownership. If the change aggregate owns the lineage, approval and grant issuance
are events in that one stream. Otherwise approval commits an immutable receipt
and outbox intent carrying stable lineage/generation identity; the dedicated
grant process manager issues later without advancing the change stream again.
Revocation may establish a non-redeemable lineage before delayed issuance, and
successors preserve lineage while atomically and permanently superseding the
prior generation in the one owner stream. The lineage-owner transaction also
creates, revokes, or replaces the fenced local redemption guard co-located with
the exact change-effect work bundle; it never leaves attempt authority to an
eventually consistent projection.
Goal: govern service change and scheduled execution without turning an old
interactive session into ambient worker authority.
Deliverables: change aggregate, assessment, calendar/conflict integration,
approval-to-execution-grant command/receipt, revocation/revalidation transitions,
inline-versus-dedicated ownership profile, dedicated issuance process-manager
contract, lineage/successor projection, redemption-guard placement/maintenance
contract, and deterministic topology/authority fixtures.
Verification: approval/window/backout bypass, self-approval, conflict races,
expired human session during valid scheduled execution, worker impersonation,
grant replay/attempt exhaustion, approval or policy-version drift, approver
departure, target-version/request substitution, revocation immediately before
dispatch, crash/reorder/duplicate approval-to-grant issuance, revocation before
delayed issuance, duplicate grant identity, successor/predecessor fork,
missing/stale/non-co-located redemption guard, emergency abuse, fake topology
differential, and replay pass; real graph
integration repeats at `0.88.0`.
Exit criteria: execution needs an exact valid approved plan and redeemable
authority; no worker relies on an approving human remaining logged in.
Inline ownership advances only the change stream; dedicated ownership uses an
immutable receipt and outbox continuation, never a hidden two-stream commit.
`v0.46.0 implementation stop reached. Run pentest for this exact commit.`

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
Any external channel mutation uses the `0.18.2`
`RemoteTargetConcurrencyProfile`: exact provider/account/resource and strong
validator are immutable, precondition failure is typed non-acceptance, workers
never refresh automatically, and response loss remains unknown. A reviewed
unconditional channel names one exact `RemoteMutationException`; publication
claims its co-located guard attempt at dispatch, and revocation, expiry,
provider-capability change, or attempt exhaustion denies. It cannot imply local
target fencing. Every external publication receipt also carries the `0.18.2`
bounded transmission window and exact audience/provider/account/request
binding; publication rechecks current fences at its single-use start claim,
binds the exact executor instance and lease generation, and transmits only
inside the trusted `TransmissionExecutor` that owns both claim and channel
socket. Publication workers submit immutable authenticated instructions and
receive status, never permit material. The sealed process-local permit is
consumed by value, cannot be cloned/serialized, and its digest is evidence only.
It cannot transmit after the immutable deadline and routes duplicate instruction,
executor failover, ambiguous claim/permit delivery, or uncertain start to
reconciliation rather than redelivery. Its channel-specific
`ProviderExecutionProfile` denies master-key/general database access, redeems
only an exact-claim-bound tenant/provider/account/publication-action/request/
destination secret handle, uses least-privilege credentials, enforces destination
allowlist/TLS/DNS/redirect rules without a general proxy, and isolates any
unscopable account credential to a documented trust domain.
Its authoritative lineage supplies current profile/account/credential/broker
epochs to start claim and handle redemption; emergency suspension, revocation,
local rotation activation, broker-policy change, and restore cannot leave an old
instruction or handle redeemable. Channel profiles use the typed control-plane
proposal/approval/activation/revocation lifecycle, signed exact-digest admission,
semantic expansion review, current fences, and revocation tombstones. Remote
credential rotation uses the single-lineage-owner
`ProviderCredentialRotationGuard`: one stable rotation ID, intended successor,
and provisioning idempotency digest may be non-terminal at a time.
Provisioning/revocation uncertainty blocks ordinary successor rotation;
authorized takeover first inventories the provider and drives discovered
orphans through bounded quarantine and revocation. Pending and orphaned channel
credentials remain charged to the provider credential-count quota until
revocation is confirmed. Publication requires a fresh credential-capability
snapshot/epoch whose reviewed, versioned semantic evaluator returns `Equal` or
an explicitly admitted `StrictSubset`; `StrictSuperset`, `Incomparable`, or
`Unknown` advances the epoch and quarantines the whole credential, including
apparently non-privileged channel work. Non-exportable channel signing/mTLS
exposes operations only.
For bearer/API-key channels, the hardened channel broker joins the executor TCB
and owns authorization serialization, redirects, TLS, claim, and socket; bearer
bytes may exist briefly only there and never in the publication worker, queue,
log, diagnostic, crash record, or durable state.

Goal: turn the `0.48.1` publication port and fake into a supported hosted status
surface without exposing the private incident or service-health authority.

Deliverables: policy-filtered built-in status API and read projection, static/
cache representation with explicit freshness, authenticated administration
transport, publication reconciler, subscription integration through `0.39.4`,
optional admitted channel adapter, capability/health probes, DAST corpus,
deployment guide, and outage runbook; include rotation-guard/orphan-inventory/
credential-count evidence and semantic evaluator/corpus/quarantine evidence for
every admitted external channel.

Verification: unauthorized/premature publication, audience/component/tenant
confusion, hidden-field and count leakage, stale cache/CDN, false success
receipt, duplicate/out-of-order update, correction-history loss, provider
outage/retry, subscription flood, domain/TLS takeover, restore/rebuild,
validator/resource/account substitution, ABA delete/recreate, weak/strong
confusion, ignored/downgraded conditional writes, silent refresh, response-loss
misclassification, exception scope/request substitution, revocation/expiry/
provider-capability/final-attempt race, missing guard, restored exception,
long worker pause, revocation or provider-capability change after admission,
expired/substituted/replayed transmission permit, clock rollback, uncertain
start retransmission, concurrent shared-credential publishers, claim/worker/
lease/permit substitution, claim-response loss, stale-worker takeover, permit
transport/logging/digest authorization, duplicate instruction, executor
failover/compromise, arbitrary unclaimed publication request, credential-handle
or provider-account substitution, cross-tenant credential reuse, egress/TLS/DNS/
redirect bypass, unrestricted shared credential, understated residual blast
radius, profile/account/credential/broker epoch substitution or rollback,
credential ABA, unauthorized/self-approved profile activation, hidden channel/
destination/trust-radius expansion, stale activation fence or tombstone bypass,
every rotation crash/unknown/evidence/deadline state, restored dual redemption,
out-of-band permission/role/group/trust change, callback reorder, stale poll,
policy-revision mismatch, stale/restored capability snapshot, stale queued
instruction/restored handle, simultaneous rotations, idempotency-digest
substitution, late callback after takeover, orphan omission, provider-count
limit exhaustion, string-set or wildcard/deny/resource/condition comparison,
evaluator downgrade/budget exhaustion, claimed/queued/non-privileged work after
whole-credential quarantine, unsafe automatic profile widening, signing/mTLS export,
bearer material outside the broker TCB, caller-owned claim/socket, HTTP/TLS/
redirect/diagnostic/crash memory-canary failure, accessibility, load, and fake-
versus-hosted differential tests pass.

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
