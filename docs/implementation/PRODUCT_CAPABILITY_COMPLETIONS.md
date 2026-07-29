# Focused Product Capability Completions

Document status: planned companion stops introduced by the capability-gap review.

These stops close independently implementable product and verification gaps
without expanding their neighboring base milestones. Each stop has one primary
owner and one coherent pentest boundary. The existing phase documents remain
the cumulative context; this file is the exact implementation handoff.

## `0.20.4` — Executable State-Machine Reference Models

Status: planned.
Setup: select each critical state machine by stable invariant ID and define its
finite abstraction, operation alphabet, preconditions, observable outcomes,
invariant oracle, correspondence boundary, and bounded state limits.
Goal: give “model checked” one executable, tool-independent meaning before
adapters are implemented.
Deliverables: project-owned reference-model harness, generated operation traces,
exhaustive small-state interleaving runner, deterministic fault schedule format,
shrinking/replay format, and evidence manifest. Loom, Kani, TLA+, or another
tool may later supplement this contract but cannot replace the mapping.
Verification: deliberately faulty transition, stale-version, duplicate,
reorder, crash-cut, and liveness fixtures must be found and minimized
deterministically; identical seeds and model versions reproduce identical traces.
Exit criteria: every critical state machine can name its executable model,
bounded completeness claim, and replayable counterexample format.
`v0.20.4 implementation stop reached. Run pentest for this exact commit.`

## `0.22.4` — Adapter-To-Model Correspondence Testkit

Status: planned.
Setup: bind the `0.20.4` abstract operations and observations to the semantic
storage ports, transaction cuts, fault points, capability profile, and backend
normalization rules without exposing backend types to the model.
Goal: prove each adapter realizes the same state machine under generated
interleavings and deterministic failures.
Deliverables: correspondence adapter, trace executor, fault scheduler hooks,
observation normalizer, per-profile exclusion record, and differential report.
Verification: memory plus every admitted database profile execute the same
generated corpus; response loss, crash, retry, failover, and unsupported
capability paths either correspond or produce an explicit refusal.
Exit criteria: no adapter support claim exists without passing model
correspondence evidence for every critical state machine it implements.
`v0.22.4 implementation stop reached. Run pentest for this exact commit.`

## `0.30.17` — Minimal Policy And Redaction Contract

Status: planned.
Setup: define tenant, subject, action, typed resource, requested field set,
purpose, environment, policy version, interface descriptor, and bounded
explanation inputs before any product DTO or command surface is frozen.
Goal: prevent Phases D and E from acquiring policy-blind APIs that must later
be retrofitted.
Deliverables: N1 `AuthorizationRequest`, deny-by-default decision,
visible-field set, obligations, typed unavailable/indeterminate outcomes,
interface-registration descriptor, deterministic fake evaluator, and
compile-time boundary checks. This is not RBAC, ABAC, ReBAC, authentication, or
a hosted policy engine; those remain Phase F.
Verification: omitted tenant/subject/action/resource/field/purpose/version,
unknown interface, unsupported obligation, field reappearance, fake
allow-by-default, and DTO/command registration differential tests pass.
Exit criteria: every Phase D/E command and read contract can carry and test the
same fail-closed policy/redaction shape before full policy implementation.
`v0.30.17 implementation stop reached. Run pentest for this exact commit.`

## `0.50.1` — Service Portfolio Lifecycle

Status: planned.
Setup: define proposed, planned, active, deprecated, retired, and rejected
service/offer lifecycle; sponsorship, ownership, consumers, outcomes, costs,
risks, dependencies, decision evidence, and retirement obligations.
Goal: govern why services and offerings exist, not only operate their records.
Deliverables: portfolio aggregate, lifecycle commands/events, decision
projections, service-catalog links, and retirement impact port.
Verification: unauthorized activation/retirement, orphan consumers, hidden
cost/risk, stale approval, lifecycle bypass, and cross-tenant linkage pass.
Exit criteria: every portfolio transition is explicit, authorized, evidenced,
and preserves dependent-service consequences.
`v0.50.1 implementation stop reached. Run pentest for this exact commit.`

## `0.50.2` — Customer Organizations, Contacts, And Agreements

Status: planned.
Setup: separate customer organization, contact, relationship, agreement,
service entitlement, support tier, coverage window, data visibility, delegation,
effective dates, correction, and termination from Vitheim tenant authority.
Goal: support internal, external, and managed-service customers without treating
a contact or commercial agreement as an authorization grant.
Deliverables: typed customer/agreement aggregates, entitlement facts, request/
incident links, policy attributes, and agreement-history projections.
Verification: contact takeover, agreement-as-authority, expired entitlement,
cross-customer disclosure, overlapping corrections, and termination races pass.
Exit criteria: customer context can shape policy and service commitments but
never bypass current identity and authorization.
`v0.50.2 implementation stop reached. Run pentest for this exact commit.`

## `0.50.3` — Supplier, Vendor, And Contract Management

Status: planned.
Setup: define supplier/vendor identities, contacts, contracts, obligations,
renewals, performance, risk, data access, subprocessors, evidence, approvals,
expiry, termination, and links to services/assets without embedding procurement.
Goal: make third-party operational responsibility and risk visible.
Deliverables: supplier and contract aggregates, obligation calendar, service/
asset relationships, assessment hooks, and renewal/termination workflows.
Verification: vendor impersonation, contract leakage, silent renewal, expired
access, obligation deletion, self-approval, and cross-tenant association pass.
Exit criteria: vendor obligations and access remain time-bound, reviewable, and
separate from technical credential authority.
`v0.50.3 implementation stop reached. Run pentest for this exact commit.`

## `0.50.4` — Procurement And Non-Software Entitlements

Status: planned.
Setup: define requisition, approval, order reference, receipt, allocation,
return, warranty/maintenance entitlement, quantity, unit, supplier/contract,
asset link, financial classification, and external-system reference boundaries.
Goal: cover governed acquisition and entitlement workflows without claiming to
be an ERP, payment system, or general ledger.
Deliverables: requisition and entitlement aggregates, fulfillment workflow,
asset handoff, external ERP/accounting ports, and reconciliation evidence.
Verification: quantity/currency/unit confusion, approval bypass, duplicate
receipt, false entitlement, external-reference substitution, and refund races pass.
Exit criteria: Vitheim governs the work and evidence while authoritative
financial posting remains behind an explicitly selected external port.
`v0.50.4 implementation stop reached. Run pentest for this exact commit.`

## `0.50.5` — Capacity And Demand Management

Status: planned.
Setup: distinguish measured capacity, forecast demand, scenario assumptions,
service thresholds, reservations, constraints, confidence, horizon, correction,
owner, and decision version from quota/security accounting.
Goal: plan service capacity without allowing forecasts to become operational
or admission-control authority.
Deliverables: capacity/demand fact models, forecast/scenario engine, threshold
workflows, service links, and explanation reports.
Verification: unit/window confusion, forecast-as-fact, confidence inflation,
hidden assumptions, stale measurement, overflow, and cross-service leakage pass.
Exit criteria: every recommendation separates observations, assumptions,
forecast, and approved operational decision.
`v0.50.5 implementation stop reached. Run pentest for this exact commit.`

## `0.50.6` — Service Continuity Plans And Exercises

Status: planned.
Setup: define continuity scope, critical service/dependency, recovery objective,
plan version, owner, contacts, protected procedure, exercise scenario,
observations, gaps, corrective actions, approvals, and activation authority.
Goal: make continuity preparation and exercises governed, testable work.
Deliverables: continuity-plan and exercise aggregates, evidence package,
corrective-action links, schedule, and read-only disaster-recovery evidence port.
Verification: stale-plan activation, false exercise completion, sensitive plan
leak, recovery-objective manipulation, self-attestation, and missing action pass.
Exit criteria: a plan is never marked ready solely because a document exists;
readiness cites current approvals, exercises, evidence, and open gaps.
`v0.50.6 implementation stop reached. Run pentest for this exact commit.`

## `0.60.1` — Policy-Bound Read Subscription Contract

Status: planned.
Setup: define tenant/principal/session/policy-bound subscription identity,
registered read shape, visible fields, topic/filter budget, opaque resumable
cursor, replay horizon, explicit gap, cancellation, and revocation outcomes.
Goal: provide real-time reads without creating a command or authority channel.
Deliverables: `ReadSubscriptionPort`, subscription/request/item/result codecs,
cursor-integrity contract, deterministic fake, and API transport-neutral DTOs.
Verification: cursor forgery, tenant/topic substitution, hidden field/count,
replay beyond horizon, subscription-to-command confusion, and cancellation pass.
Exit criteria: every subscription is exactly a sequence of ordinary
policy-filtered reads and exposes no mutation capability.
`v0.60.1 implementation stop reached. Run pentest for this exact commit.`

## `0.60.2` — Subscription Delivery, Revocation, And Backpressure

Status: planned.
Setup: bind reconnect, every emitted item, and policy/identity change to current
authorization; define bounded buffers, quotas, slow-consumer eviction,
heartbeats, shutdown, transport loss, and SSE/WebSocket profile admission.
Goal: operate resumable subscriptions without stale-policy leakage or resource
exhaustion.
Deliverables: hosted subscription coordinator, SSE profile and optional
separately admitted WebSocket profile, revocation fan-out, gap/reconnect
protocol, metrics, and conformance client.
Verification: policy/role/session revocation between items, field shrink,
buffer and connection floods, slow reader, reconnect races, cursor replay,
node failover, and transport downgrade pass.
Exit criteria: reconnect and every item reauthorize; overload evicts or returns
an explicit gap without leaking data or blocking command processing.
`v0.60.2 implementation stop reached. Run pentest for this exact commit.`

## `0.70.3` — Minimal Typed Topology Contract

Status: planned.
Setup: define the stable subset of team, service, asset, software, location,
identity, and work/evidence node references; typed edge vocabulary, direction,
provenance, valid/observed/recorded/projected time, confidence, visibility,
correction, and bounded policy-before-traversal semantics.
Goal: let SecOps correlate against a real shared contract before the full CMDB
and service graph are implemented.
Deliverables: N1 topology fact/edge/query types, `TopologyReadPort`, bounded
path result, deterministic fake, interface registration, and Phase I extension
rules. It owns no asset, service, or relationship aggregate.
Verification: wrong-type edge, hidden intermediate/count, tenant substitution,
cycle/path explosion, stale/corrected fact, fake/port differential, and
unsupported future edge tests pass.
Exit criteria: `0.75.0` consumes this exact contract, while `0.83.0–0.88.3`
later implement and extend it without a parallel topology vocabulary.
`v0.70.3 implementation stop reached. Run pentest for this exact commit.`

## `0.81.1` — Extensible Asset-Kind Registry

Status: planned.
Setup: define signed/versioned kind descriptors, stable kind IDs, required
identity/fact/lifecycle fields, relationship constraints, discovery mappings,
custom namespace ownership, migration, compatibility, and activation review.
Goal: extend asset taxonomy without a universal untyped asset or executable
schema escape hatch.
Deliverables: registry and validator plus first-party kinds for physical
devices, VMs, cloud resources, Kubernetes clusters/workloads, containers/images,
SaaS tenants, identities/service principals, certificates, domains/DNS,
network identities, data stores, and data assets.
Verification: kind substitution/downgrade, namespace collision, missing identity,
unsafe migration, cross-kind setter, malicious schema, and unknown-kind pass.
Exit criteria: every asset instance names one admitted kind/version and retains
typed identity, provenance, lifecycle, and relationship rules.
`v0.81.1 implementation stop reached. Run pentest for this exact commit.`

## `0.81.2` — Ephemeral Identity And Reincarnation Semantics

Status: planned.
Setup: distinguish logical identity, provider identity, observed instance,
generation/incarnation, image/template, start/stop, disappearance, deletion
claim, replacement, ownership, and retention for cloud and orchestrated assets.
Goal: prevent short-lived infrastructure and identifier reuse from creating
ABA merges or false deletions.
Deliverables: incarnation model, discovery identity rules, tombstone/correction
events, lifecycle policies, reconciliation fixtures, and bounded history view.
Verification: delete/recreate with reused ID/IP/name, late observation, missed
delete, scale churn, image/instance confusion, owner change, and replay pass.
Exit criteria: disappearance is evidence rather than deletion authority, and
reincarnated resources never inherit stale vulnerabilities, ownership, or edges.
`v0.81.2 implementation stop reached. Run pentest for this exact commit.`

## `0.110.1` — Privacy Request Case Domain

Status: planned.
Setup: define access, correction, erasure, restriction, objection, and
portability request types; requester/subject distinction, identity verification,
jurisdiction, controller/processor role, scope, deadlines, holds, approvals,
exceptions, conflicts, and communication visibility.
Goal: turn privacy obligations into a typed governed case rather than ad hoc
retention or deletion commands.
Deliverables: `PrivacyCase` aggregate, lifecycle, verification and approval
ports, deadline/escalation workflow, policy attributes, and redacted workspace.
Verification: requester impersonation, cross-subject disclosure, verification
reuse, jurisdiction/deadline manipulation, hold bypass, self-approval, and
tenant confusion pass.
Exit criteria: no privacy action begins without a current scoped case,
identity evidence, applicable policy, authority, and conflict/hold evaluation.
`v0.110.1 implementation stop reached. Run pentest for this exact commit.`

## `0.110.2` — Privacy Fulfilment And Evidence

Status: planned.
Setup: inventory data surfaces and third-party copies; define staged search,
review, correction/export/erasure/restriction work, partial/uncertain results,
external requests, reconciliation, legal hold precedence, completion evidence,
appeal, retention, and safe requester delivery.
Goal: execute privacy cases truthfully across Vitheim and external processors.
Deliverables: fulfilment process manager, data-surface manifest, signed export
manifest, third-party request receipts, uncertainty/escalation outcomes, and
completion evidence package.
Verification: omitted surface, stale snapshot, export leakage, early completion,
external response loss, erasure resurrection, hold conflict, duplicate work,
and false third-party certainty pass.
Exit criteria: completion states exactly what was verified, refused, retained,
erased, exported, or remains uncertain; uncertainty can never be reported as done.
`v0.110.2 implementation stop reached. Run pentest for this exact commit.`

## `0.118.3` — Inbound Service-Desk Mail Intake

Status: planned; blocked until an exact mail provider/protocol, TLS/client,
authentication, mailbox isolation, MIME parser, and maintenance profile is admitted.
Setup: bind mailbox/delivery cursor, provider event and message identity,
recipient/tenant route, raw message custody, MIME/depth/part/header/decoded-size
limits, nested-message and decompression budgets, attachment quarantine,
charset handling, and DKIM/SPF/DMARC observations as attributed evidence.
Goal: receive hostile Internet mail into quarantine without creating work or
granting sender authority.
Deliverables: inbound-mail adapter/port, bounded MIME decoder, staged message
aggregate, raw evidence link, attachment handoff, delivery receipt/idempotency,
quarantine/rejection outcomes, and parser corpus.
Verification: forged sender/recipient, MIME smuggling, nested/archive bombs,
Unicode/header injection, duplicate delivery, cursor rollback, wrong tenant,
authentication-result spoofing, and fuzz pass.
Exit criteria: intake produces only a bounded quarantined staged message;
sender-authentication evidence never authenticates a Vitheim principal.
`v0.118.3 implementation stop reached. Run pentest for this exact commit.`

## `0.118.4` — Mail Correlation And Work Proposals

Status: planned.
Setup: define opaque signed reply tokens, mailbox/conversation membership,
message ancestry, permitted sender/contact mapping, duplicate/retry behavior,
bounce/DSN/auto-reply/forward handling, loop headers/counters, expiry,
moderation, policy, and normal command authorization.
Goal: correlate replies safely and turn accepted mail into reviewable proposals
or ordinary authenticated commands without trusting subject lines.
Deliverables: correlation engine, proposal aggregate, moderation workflow,
loop/bounce suppression, reply-token rotation, command mapper, and audit trail.
Verification: subject spoof, token theft/replay/substitution, cross-case reply,
forwarded-token leak, auto-reply/DSN storm, mail loop, duplicate command, closed
case, policy change, and response-loss races pass.
Exit criteria: mail never mutates work directly; every accepted change cites a
valid conversation binding and the same current command policy as other clients.
`v0.118.4 implementation stop reached. Run pentest for this exact commit.`

## `0.120.6` — Signed Security Audit Export Contract

Status: planned.
Setup: define destination identity/authorization, tenant/purpose, event and
field policy, redaction, canonical batch, sequence, opaque cursor, integrity
chain, signature/key lineage, replay horizon, gap, retention, and cancellation.
Goal: export audit evidence to SIEM/compliance consumers without confusing it
with alert-ingestion syslog or granting the destination query authority.
Deliverables: `SecurityAuditExportPort`, manifest/batch/receipt codecs,
policy-filtered projection, signed cursor/checkpoint format, deterministic sink,
and verification CLI support.
Verification: destination/tenant substitution, field leak, cursor forgery,
batch removal/reorder/duplication, key rollback, replay gap, and audit-as-command pass.
Exit criteria: every exported batch is redacted, resumable, tamper-evident, and
bound to an authorized destination and exact policy snapshot.
`v0.120.6 implementation stop reached. Run pentest for this exact commit.`

## `0.120.7` — Audit Export Delivery And Reconciliation

Status: planned; each transport/sink requires a version-bound admission record.
Setup: define push/pull profile, TLS and destination authentication, bounded
spool/backpressure, delivery attempt, acknowledgement, ambiguous outcome,
reconcile/status, retry, gap alert, revocation, failover, and offboarding.
Goal: operate audit export without silent loss, unbounded local storage, or
duplicate effects disguised as exactly-once delivery.
Deliverables: hosted exporter, selected SIEM/compliance sink adapter,
delivery/reconciliation state machine, quotas, operator status, and runbook.
Verification: outage, slow sink, response loss, duplicate/reordered ack,
credential rotation/revocation, endpoint confusion, spool exhaustion, restart,
failover, retention conflict, and offboarding pass.
Exit criteria: delivery is at least once with explicit reconciliation and gap
evidence; saturation cannot block the authoritative audit journal.
`v0.120.7 implementation stop reached. Run pentest for this exact commit.`

## `0.140.27` — Full-Suite Product Profile Freeze Decision

Status: planned.
Setup: inventory executable evidence for core ITSM plus service portfolio,
customer agreements, supplier/contracts, procurement/non-software entitlement,
capacity/demand, continuity, subscriptions, extended asset kinds, privacy,
inbound mail, and audit export; classify every capability and external profile
as Supported, Conditional, Unsupported, or deferred.
Goal: decide the exact full-suite `1.0.0` product claim without allowing roadmap
aspiration, partial implementation, or a connected provider to imply support.
Deliverables: capability/support matrix, default-enabled set, dependency and
profile prerequisites, scale/SLO boundaries, license/support ownership,
operator feature gates, deferred/post-1.0 list, and truthful product wording.
Verification: executable-owner/evidence differential, disabled-feature
discovery, upgrade/rollback, partial-provider, policy, tenant, API/UI, export,
backup/restore, and documentation-claim tests pass.
Exit criteria: `1.0.0` advertises only exact passing profiles; any incomplete
full-suite domain remains visibly unavailable without weakening the core
security or service-management claims.
`v0.140.27 implementation stop reached. Run pentest for this exact commit.`
