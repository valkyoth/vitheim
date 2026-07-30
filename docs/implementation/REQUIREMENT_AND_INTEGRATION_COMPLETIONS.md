# Requirement Ownership And Product Integration Completions

Document status: planned focused minor releases introduced by the second capability-gap
review.

These handoffs make buried requirements mechanically owned, decompose the
remaining broad product stops, and carry the full-suite domains through policy,
workflow, search, API, UI, lifecycle, and production evidence. Each exact stop
has one dominant owner and its own pentest boundary.

## `0.36.0` — Stable Requirement Registry And Checker

Status: planned.
Setup: define stable `VIT-REQ-*` IDs, immutable descriptions, kind, source
location, primary implementation stop, predecessors, producing/consuming crates,
schema/migration owner, test owner, integration/retest stops, lifecycle, and status.
Goal: make every normative functional and operational requirement have exactly
one primary implementation stop.
Deliverables: canonical registry schema, parser/checker, duplicate/missing-owner
diagnostics, supersession/defer rules, and generated stop/crate/test views.
Verification: missing/duplicate owner, cycle, unknown stop/crate, invalid status,
unowned migration, orphan test, stale source, and supersession ambiguity pass.
Exit criteria: the registry format and bidirectional checker are executable;
prose location or phase membership alone never establishes ownership.
`v0.36.0 implementation stop reached. Run pentest for this exact commit.`

## `0.45.0` — Phase A And B Requirement Backfill

Status: planned.
Setup: inventory every normative foundation, journal, projection, audit,
outbox/inbox, scheduler, quota, provenance, integrity, telemetry, verification,
failure, recovery, and evidence requirement through `0.44.0`.
Goal: prove the requirement registry against the implemented-to-date foundation.
Deliverables: Phase A/B `VIT-REQ-*` entries, exact stop/crate/schema/test owners,
predecessor graph, integration/retest links, and generated coverage report.
Verification: prose-to-registry and registry-to-prose differential, duplicate
semantic owner, uncovered paragraph/table row, dead crate/test reference, and
superseded requirement tests pass.
Exit criteria: every normative Phase A/B requirement has exactly one primary
stop and no requirement is owned merely by a cumulative ledger heading.
`v0.45.0 implementation stop reached. Run pentest for this exact commit.`

## `0.90.0` — Phase C Requirement Backfill

Status: planned.
Setup: inventory each storage capability, adapter, migration/import, corruption,
cost, witness, queue, cache, transaction, recovery, budget, and refusal
requirement across the Phase C ledger and focused scope splits.
Goal: assign every large-ledger requirement to one exact implementation slice.
Deliverables: Phase C `VIT-REQ-*` entries, ownership/cutover/migration/test
metadata, focused-release coverage matrix, and generated unassigned/overlap report.
Verification: sample every ledger section and table row; inject missing,
duplicated, contradictory, wrong-adapter, wrong-migration, and wrong-retest
assignments and require deterministic failure.
Exit criteria: every Phase C requirement resolves to exactly one primary stop,
with explicit later adapter/restore/production retests where applicable.
`v0.90.0 implementation stop reached. Run pentest for this exact commit.`

## `0.91.0` — Phase D Through G Requirement Backfill

Status: planned.
Setup: inventory universal work, ITSM/full-suite focused releases, identity/policy,
subscriptions, workflows, notification, paging, and early-reference requirements.
Goal: freeze ownership before the first product-domain implementation begins.
Deliverables: Phase D–G `VIT-REQ-*` entries with aggregate/application/API/fake/
policy/workflow/test owners and later real-integration stops.
Verification: generic-record escape, missing policy registration, fake without
real retest, domain requirement assigned to UI, duplicated transition owner,
and unowned side-effect/lifecycle requirement pass.
Exit criteria: every Phase D–G requirement has one implementation owner and
every deterministic fake names its later differential-integration owner.
`v0.91.0 implementation stop reached. Run pentest for this exact commit.`

## `0.92.0` — Phase H Through K Requirement Backfill

Status: planned.
Setup: inventory SecOps, vulnerability, evidence, asset/service graph,
discovery, search/knowledge, compliance/risk, and privacy requirements.
Goal: prevent graph, evidence, search, pack, or privacy semantics being omitted
between their domain, projection, policy, and integration milestones.
Deliverables: Phase H–K `VIT-REQ-*` entries, source/derived-evidence ownership,
graph/search/pack/privacy integration links, and generated coverage report.
Verification: raw/derived collapse, hidden graph/search owner, asset-kind/
discovery confusion, pack-as-policy, privacy surface omission, and missing
rebuild/retention owner tests pass.
Exit criteria: every Phase H–K requirement has exactly one primary stop and
explicit downstream policy/search/API/UI/lifecycle evidence owners.
`v0.92.0 implementation stop reached. Run pentest for this exact commit.`

## `0.93.0` — Phase L Through Production Requirement Backfill

Status: planned.
Setup: inventory plugins/connectors, federation, optional AI, UI/product
experience, option decisions, production hardening, and `1.0.0` acceptance.
Goal: complete the exhaustive current-roadmap requirement map before Phase D.
Deliverables: Phase L–O/production `VIT-REQ-*` entries, external-boundary and
support-profile owners, operational/retest links, and whole-roadmap report.
Verification: optional feature implied by core, first technology selection at
freeze, unsupported profile without refusal, acceptance without evidence owner,
and unowned restore/pentest/documentation claim tests pass.
Exit criteria: every normative current-roadmap requirement is registered once;
future requirements must register before their introducing stop can exit.
`v0.93.0 implementation stop reached. Run pentest for this exact commit.`

## `0.94.0` — Early Cross-Domain References And Read Ports

Status: planned.
Setup: define tenant-bound opaque `ServiceRef`, `AssetRef`, `AgreementRef`,
`CustomerOrgRef`, `ContactRef`, `SupplierRef`, and typed dependency-query
requests/results with version, provenance, visibility, unavailable, and bounds.
Goal: let pre-Phase-I domains link safely without inventing service/asset identity.
Deliverables: N1 reference types, read-only service/asset/dependency ports,
deterministic fakes, unresolved-reference outcomes, interface registration, and
Phase I implementation/extension rules.
Verification: cross-type/tenant substitution, ref-as-authority, hidden endpoint,
stale version, fake semantic drift, unbounded dependency read, and premature
existence assumption pass.
Exit criteria: early domains store only stable references and facts; Phase I
owns the authoritative aggregates and must pass fake-versus-real differentials.
`v0.94.0 implementation stop reached. Run pentest for this exact commit.`

## `0.139.0` — Customer Contacts And Organization Relationships

Status: planned.
Setup: separate person/contact identity from user principal; define organization
membership/relationship, role labels, verified channels, effective time,
correction, consent, visibility, source, and termination.
Goal: model customer contacts without turning CRM facts into authentication.
Deliverables: contact and organization-relationship aggregates, channel-
verification evidence, policy attributes, and sender-resolution read port.
Verification: contact/principal confusion, channel takeover, stale relationship,
cross-customer disclosure, duplicate identity, and termination race pass.
Exit criteria: contact facts influence routing and policy inputs but never grant
session, command, or agreement authority.
`v0.139.0 implementation stop reached. Run pentest for this exact commit.`

## `0.140.0` — Customer Service Agreements And Coverage

Status: planned.
Setup: define agreement identity, parties, service/offering references, scope,
support tier, coverage calendar, targets, effective dates, amendments,
termination, commercial sensitivity, and approval.
Goal: govern service commitments independently of contacts and entitlement decisions.
Deliverables: agreement aggregate, amendment history, SLA/coverage bindings,
request/incident references, and policy-filtered projections.
Verification: agreement-as-authorization, retroactive amendment, overlapping
coverage, hidden terms leak, stale approval, and termination boundary pass.
Exit criteria: every applied commitment cites an effective approved agreement
version and cannot authenticate or authorize a requester by itself.
`v0.140.0 implementation stop reached. Run pentest for this exact commit.`

## `0.141.0` — Service Entitlement Decisions

Status: planned.
Setup: define entitlement subject, agreement/offering/request references,
eligibility facts, quantity/limits, period, purpose, evaluator version,
decision explanation, obligations, override authority, expiry, and correction.
Goal: decide fulfilment eligibility without embedding agreement or identity mutation.
Deliverables: pure entitlement evaluator, decision record, request/catalog/SLA
integration, override workflow, and deterministic fixtures.
Verification: stale/forged agreement, subject/contact substitution, quantity/
period bypass, hidden rule, override escalation, and request replay pass.
Exit criteria: each request entitlement is reproducible from current typed facts,
policy, agreement version, and evaluator version.
`v0.141.0 implementation stop reached. Run pentest for this exact commit.`

## `0.142.0` — Supplier Contract Lifecycle

Status: planned.
Setup: define contract identity, parties, approved source, effective/renewal/
notice/expiry dates, amendments, supersession, termination, owners, access-
termination dependencies, and confidential fields.
Goal: govern contract lifecycle separately from supplier identity and assessments.
Deliverables: contract aggregate, amendment/supersession chain, deadline
projection, approval workflow, and service/asset reference bindings.
Verification: party/reference substitution, silent renewal, retroactive rewrite,
expired contract use, hidden term leakage, self-approval, and race pass.
Exit criteria: one immutable lifecycle explains the current contract and every
renewal, amendment, termination, and dependent action.
`v0.142.0 implementation stop reached. Run pentest for this exact commit.`

## `0.143.0` — Supplier Contractual Obligation Lifecycle

Status: planned.
Setup: define contractual obligation identity, source contract/amendment,
service/scope, measure and unit, target, evidence requirement, period,
responsible parties, effective/expiry dates, supersession, correction, and review schedule.
Goal: govern what the supplier owes without owning performance assessments or risk.
Deliverables: obligation aggregate, contract/amendment derivation, current-
obligation projection, deadline schedule, evidence expectation port, and fixtures.
Verification: contract/obligation substitution, silent deletion, retroactive
rewrite, unit/target/period confusion, expired obligation use, hidden term,
supersession fork, and correction deletion pass.
Exit criteria: every current obligation derives reproducibly from one exact
contract lineage; assessment belongs to `0.150.0` and accepted risk remains
exclusively Phase K authority.
`v0.143.0 implementation stop reached. Run pentest for this exact commit.`

## `0.144.0` — Supplier Data Access And Termination

Status: planned.
Setup: define approved data/system/service scope, purpose, credential/profile
reference, controller/processor role, subprocessor, start/expiry, revocation,
termination checklist, evidence, unresolved external copies, and escalation.
Goal: make supplier access bounded and reliably removed at contract or risk events.
Deliverables: access-governance aggregate, termination process manager,
identity/policy/provider effect intents, evidence package, and residual-risk outcome.
Verification: contract-as-access, scope expansion, expiry/revocation race,
credential reuse, missed system, false external deletion, and self-attestation pass.
Exit criteria: supplier records never grant access; current policy and identity
systems authorize it, and termination remains incomplete while evidence is missing.
`v0.144.0 implementation stop reached. Run pentest for this exact commit.`

## `0.145.0` — External Purchase-Order Evidence And Receipt

Status: planned.
Setup: consume approved requisitions and immutable externally issued order
evidence; define issuer/system, external order/version/digest, supplier/
contract, line/item, quantity/unit, expected delivery, receipt/rejection,
partial delivery, evidence, idempotency, and correction.
Goal: own receiving facts without claiming purchase-order, payment, or ledger authority.
Deliverables: immutable order-evidence record/reference, receipt aggregate,
receiving workflow, document evidence, duplicate protection, and procurement port.
Verification: requisition/order substitution, over-receipt, unit confusion,
issuer/version/digest forgery, duplicate provider event, false delivery,
partial-order races, local order mutation, and document leak pass.
Exit criteria: receipts reconcile exactly to immutable external order lines;
Vitheim never creates, amends, approves, or cancels the purchase order and
never claims payment, accounting, or purchasing-system-of-record authority.
`v0.145.0 implementation stop reached. Run pentest for this exact commit.`

## `0.146.0` — Allocation, Return, And Asset Handoff

Status: planned.
Setup: define received-item identity, custody, allocation subject/location,
asset-kind proposal/reference, checkout/return, condition, loss, transfer,
sanitization, evidence, and Phase I fake/real handoff.
Goal: govern physical/non-software allocation without duplicating asset lifecycle.
Deliverables: allocation aggregate, custody history, return workflow, asset-
creation proposal port, deterministic fake, and reconciliation outcomes.
Verification: double allocation, subject/location substitution, false return,
lost-item erasure, premature asset creation, stale handoff, and tenant leak pass.
Exit criteria: allocation owns custody work; Phase I owns assets and accepts
only ordinary validated creation proposals with preserved provenance.
`v0.146.0 implementation stop reached. Run pentest for this exact commit.`

## `0.147.0` — Non-Software Entitlement Lifecycle

Status: planned.
Setup: define entitlement kind, source contract/order, holder/scope, quantity/
unit, validity, allocation, consumption, return, renewal, revocation, evidence,
and explicit separation from software-license inventory.
Goal: govern warranties, maintenance, support, access, and other non-software rights.
Deliverables: entitlement aggregate, allocation/consumption model, renewal/
revocation workflow, asset/service bindings, and availability projection.
Verification: source substitution, over-allocation, double consumption, expired
use, software-kind confusion, renewal race, and hidden contract leakage pass.
Exit criteria: every entitlement use is bounded by current source, quantity,
scope, time, and evidence without becoming identity or payment authority.
`v0.147.0 implementation stop reached. Run pentest for this exact commit.`

## `0.148.0` — ERP Port And Procurement Reconciliation Semantics

Status: planned.
Setup: define directional ownership, external IDs/versions, approved fields,
currency/unit semantics, cursor, idempotency, conditional mutation profile,
response ambiguity, reconciliation, conflict, and no-payment/no-ledger boundary.
Goal: freeze the provider-neutral boundary without prematurely implementing an ERP adapter.
Deliverables: project-owned port, mapping contract, cursor/reconcile state,
deterministic fake server, ownership model, and conformance fixtures.
Verification: endpoint/account/tenant substitution, stale overwrite, field
smuggling, duplicate/reordered event, response loss, currency/unit drift, and
outbound authority escalation pass against the fake.
Exit criteria: field ownership and reconciliation semantics are executable
without external credentials or network access; real support belongs only to
the later `0.326.0` exact adapter/defer decision.
`v0.148.0 implementation stop reached. Run pentest for this exact commit.`

## `0.149.0` — Continuity Exercises And Corrective Evidence

Status: planned.
Setup: consume an approved continuity-plan version; define scenario, objectives,
participants, protected observations, timestamps, result criteria, gaps,
corrective actions, reviewer independence, and immutable evidence.
Goal: test continuity plans without allowing exercises to rewrite plan authority.
Deliverables: exercise aggregate, evidence package, result evaluator,
corrective-action links, schedule, and Phase O DR-evidence reference.
Verification: wrong/stale plan, false completion, result/evidence substitution,
self-attestation, sensitive disclosure, missing gap/action, and rerun rewrite pass.
Exit criteria: readiness cites current plan plus independently reviewed exercise
evidence and open gaps; an exercise never activates a plan or asserts DR success.
`v0.149.0 implementation stop reached. Run pentest for this exact commit.`

## `0.228.0` — Authorization Contribution Extension And Backfill

Status: planned.
Setup: after Phase F vocabulary exists, define the authorization/redaction
contribution kind as exact `AuthorizationInterfaceId` references plus domain
generation; backfill Phase D–F domains and subscriptions.
Goal: link domains to the authoritative policy registry without copying its fields.
Deliverables: typed extension/resolver, historical backfill, prospective gate,
dangling/disagreement report, and fixtures.
Verification: omitted route/item/action/field, hidden count, purpose confusion,
policy-version drift, copied policy semantics, duplicate ownership, generation
mismatch, false defer, and allow-by-default pass.
Exit criteria: current domains reference authoritative interface entries;
`0.229.0` certifies the backfill and later domains certify at `0.336.0`.
`v0.228.0 implementation stop reached. Run pentest for this exact commit.`

## `0.243.0` — Workflow/Notification Contribution Extension And Backfill

Status: planned.
Setup: after Phase G IR and notification vocabulary exists, define exact
`WorkflowTriggerId`, ordinary-command/event, and notification-rule references;
backfill Phase D–G domains.
Goal: link domain automation to authoritative registries without a second lifecycle.
Deliverables: typed extension/resolver, historical backfill, prospective gate,
dangling/collision/disagreement report, and fixtures.
Verification: trigger spoof/replay/storm, generic status mutation, stale
authority, hidden-field notification, recursive loop, copied IR, generation
mismatch, false defer, and workflow/domain drift pass.
Exit criteria: Phase D–G manifests reference authoritative automation entries;
`0.244.0` certifies the backfill and later domains certify at `0.337.0`.
`v0.243.0 implementation stop reached. Run pentest for this exact commit.`

## `0.266.0` — Physical And Compute Asset-Kind Pack

Status: planned.
Setup: use the `0.264.0` registry for physical device, server, workstation,
mobile, network appliance, virtual machine, and compute-instance descriptors,
identity fields, lifecycle requirements, and permitted relationships.
Goal: deliver reviewed common physical/compute kinds as data, not hard-coded branches.
Deliverables: signed kind pack, migrations, fixtures, discovery mappings,
ownership/warranty/disposal rules, and compatibility corpus.
Verification: serial/provider-ID collision, VM/host confusion, unsafe kind
migration, missing disposal evidence, relationship violation, and downgrade pass.
Exit criteria: only the reviewed pack kinds activate and each preserves the
registry's identity, lifecycle, provenance, and compatibility law.
`v0.266.0 implementation stop reached. Run pentest for this exact commit.`

## `0.267.0` — Cloud, Kubernetes, And Container Asset-Kind Pack

Status: planned.
Setup: define cloud account/subscription/project, region/zone, resource, cluster,
namespace, workload, pod/task, container, image, registry, provider identity,
incarnation, ownership, and relationship rules.
Goal: model cloud-native infrastructure without collapsing logical and ephemeral identity.
Deliverables: signed kind pack, identity/incarnation profiles, relationship
constraints, generic-import mappings, migrations, and conformance fixtures.
Verification: account/region/cluster confusion, reused provider ID, image/
instance collapse, namespace escape, stale incarnation, and kind downgrade pass.
Exit criteria: cloud-native facts remain tenant/source/provider/incarnation
bound; this pack alone makes no discovery-connector support claim.
`v0.267.0 implementation stop reached. Run pentest for this exact commit.`

## `0.268.0` — Identity, Certificate, Domain, And Network Asset-Kind Pack

Status: planned.
Setup: define identity/service-principal reference assets, certificate/key
metadata without secrets, domains, DNS records/zones, IP/MAC/network identities,
issuer/owner, validity, rotation/revocation, provenance, and relationships.
Goal: inventory security-relevant identities and network identifiers safely.
Deliverables: signed kind pack, sensitive-field policy, lifecycle rules,
rotation/expiry projections, generic-import mappings, and fixtures.
Verification: secret material ingestion, identity/principal authority confusion,
certificate/domain takeover, IP/MAC reuse, stale DNS, and hidden ownership pass.
Exit criteria: these assets are evidence and inventory only; authentication,
DNS, PKI, and network systems remain authoritative behind explicit ports.
`v0.268.0 implementation stop reached. Run pentest for this exact commit.`

## `0.269.0` — SaaS And Data Asset-Kind Pack

Status: planned.
Setup: define SaaS tenant/application, data store/database, dataset/data product,
classification, controller/owner/steward, residency, retention, lineage reference,
external identity, lifecycle, and relationship rules.
Goal: represent SaaS and data responsibility without becoming a data catalog or control plane.
Deliverables: signed kind pack, classification/residency/retention bindings,
generic-import mappings, migrations, and policy/search fixtures.
Verification: SaaS tenant confusion, dataset identity collision, classification
downgrade, false lineage, residency/retention mismatch, and owner disclosure pass.
Exit criteria: supported kinds retain source and governance facts while external
SaaS/data platforms remain authoritative and discovery support stays explicit.
`v0.269.0 implementation stop reached. Run pentest for this exact commit.`

## `0.277.0` — Representative Cloud-Native Discovery Profile

Status: conditional planned milestone; select one exact cloud or Kubernetes
API/version/profile demanded by an intended deployment, otherwise record it
deferred and keep `0.267.0` kinds manual/generic-import-only for `1.0.0`.
Setup: bind workload identity, endpoint/account/cluster, permissions, resource
kinds, pagination/watch/delta semantics, checkpoints, incarnation, deletion
claims, quotas, raw evidence, reconciliation, and version-bound implementation.
Goal: prove cloud-native discovery without implying coverage for every provider.
Deliverables: one admitted connector or explicit defer record, mapping pack,
capability probe, staged import, cursor/reconcile state, fake server/corpus,
drift monitor, runbook, and unsupported matrix.
Verification: account/cluster/tenant confusion, watch gap, cursor rollback,
resource-version/UID reuse, forged deletion, stale resurrection, permission/
credential leak, parser bomb, throttling, full resync, and drift pass.
Exit criteria: only the exact passing profile is supported; otherwise UI/API/
documentation clearly state manual/generic-import-only cloud-native inventory.
`v0.277.0 implementation stop reached. Run pentest for this exact commit.`

## `0.299.0` — Search/History Contribution Extension And Backfill

Status: planned.
Setup: after Phase J document/projection vocabulary exists, define exact
`SearchDocumentSchemaId`, facet/history, deletion/redaction, and rebuild-owner
references; backfill Phase D–J domains.
Goal: link discoverability to authoritative search entries without copying mappings.
Deliverables: typed extension/resolver, historical backfill, prospective gate,
dangling/collision/disagreement report, and fixtures.
Verification: missing/duplicate document, hidden field/count/facet, stale
revocation, copied deletion/retention semantics, rebuild-owner mismatch,
generation downgrade, false defer, and query-complexity pass.
Exit criteria: Phase D–J manifests reference authoritative search/history
entries; `0.300.0` certifies the backfill and `0.338.0` certifies later domains.
`v0.299.0 implementation stop reached. Run pentest for this exact commit.`

## `0.353.0` — Workspace Contribution Extension And Backfill

Status: planned.
Setup: after `0.351.0–0.352.0`, define exact `WorkspaceContributionId`, block/
profile, command/read, empty/error, and support-state references; backfill all
earlier selected domains.
Goal: link declarative workspaces to authoritative blocks and application services.
Deliverables: typed extension/resolver, full historical backfill, prospective
gate, dangling/collision/disagreement report, and fixtures.
Verification: hidden route/block/action, field/count leak, profile-based
privilege, copied command/policy semantics, query storm, unsupported feature,
generation mismatch, false defer, XSS, and UI/API differential pass.
Exit criteria: selected domain manifests reference authoritative workspace
entries; `0.354.0` alone composes and certifies them.
`v0.353.0 implementation stop reached. Run pentest for this exact commit.`

## `0.364.0` — External API Contribution Extension And Backfill

Status: planned.
Setup: after `0.360.0`, define exact `ExternalApiResourceId`, route, command/
query/error, pagination/consistency, event/subscription, and compatibility-
fixture references; backfill selected domains.
Goal: link domains to authoritative API entries without copying external schemas.
Deliverables: typed extension/resolver, historical backfill, prospective gate,
dangling/route-collision/disagreement report, and fixtures.
Verification: mass assignment, resource/type confusion, cursor/gap forgery,
reconnect downgrade, hidden field, copied schema, generation mismatch, false
defer, SDK/API differential, and undocumented UI action pass.
Exit criteria: selected manifests reference authoritative API entries;
`0.366.0` alone assembles/freezes the API and SDK.
`v0.364.0 implementation stop reached. Run pentest for this exact commit.`

## `0.365.0` — Transfer/Configuration Contribution Extension And Backfill

Status: planned.
Setup: after `0.362.0–0.363.0`, define exact `TransferCodecId` and configuration
schema, relationship/reference, workflow/policy binding, secret-reference,
environment-overlay, migration, activation/rollback, and round-trip references;
backfill selected domains.
Goal: link transfers to authoritative codecs without copying their semantics.
Deliverables: typed extension/resolver, historical backfill, prospective gate,
dangling/collision/disagreement report, and fixtures.
Verification: hidden field/secret export, mass assignment, stale reference,
kind/schema downgrade, copied codec semantics, generation mismatch, false
defer, partial activation, erased-data resurrection, and differential pass.
Exit criteria: selected manifests reference authoritative transfer/config
entries; `0.367.0` alone composes and certifies them.
`v0.365.0 implementation stop reached. Run pentest for this exact commit.`

## `0.369.0` — Full-Suite Cross-Surface Differential Suite

Status: planned.
Setup: derive cases jointly from the requirement registry, current
`DomainManifest` generations and exact typed contribution references, and the
authorization/redaction interface registry; iterate every active
`ContributionKindId` and its mandatory verification dimensions/certification
owner, including typed reviewed `NotApplicable` dispositions, rather than a
fixed surface list, and consume deferrals and product state.
Goal: prove semantic, authorization, redaction, and support-state equivalence.
Deliverables: generated cross-surface matrix, golden domain journeys, tenant/
role/field pairs, contribution-kind/dimension/owner coverage report, generated
future-kind test obligations, correction/revocation fixtures, and evidence report.
Verification: mutation/read mismatch, hidden field/count, stale lifecycle,
contribution without a differential, stale contribution generation, required
surface marked not applicable, deferred surface shown as supported, requirement
without an active manifest, manifest surface absent from API/UI/search/export,
active/new contribution kind missing authoritative registry, lifecycle binding,
certification owner, canonical/schema/fuzz/budget/concurrency/replay/audit/
migration/failure/recovery/timing/count/metadata-leakage dimension, or reviewed
`NotApplicable`; attachment/audit/report/count/telemetry/federation/webhook/
external-replica
omission, fake/real divergence, retry/cursor mismatch, and differential pass.
Exit criteria: no registered full-suite requirement, active manifest
contribution/kind dimension, or authorization interface lacks its generated
required comparison; adding a contribution kind expands the suite without
editing a hard-coded surface list.
`v0.369.0 implementation stop reached. Run pentest for this exact commit.`

## `0.413.0` — Full-Suite Lifecycle And Recovery Certification

Status: planned.
Setup: consume `0.154.0–0.155.0` exact authoritative tenant-surface references
and immediate certification, current `DomainManifest`/contribution generations,
deferrals, product state, backup/restore codecs, rebuild/recovery order,
retention/hold/erasure handlers, export class, external-copy disposition,
privacy linkage, and continuity/DR evidence.
Goal: certify that the complete registered suite recovers and closes data truthfully.
Deliverables: generated completeness/differential report, composed recovery
manifest/order, reference-registry/generation checks, product-state blockers,
privacy and continuity evidence joins, and destructive exercise corpus.
Verification: omitted surface, stale cursor/spool resurrection, missing
external copy, broken reference, erasure rollback, kind/config downgrade,
generation mismatch, unresolved required defer, deferred surface shown as
supported, privacy false completion, continuity false evidence, and restore
divergence pass.
Exit criteria: selected profiles restore or erase with complete evidence; no
reference, registration, lifecycle handler, or recovery behavior is first added
here, and missing state leaves the owning capability unready rather than guessed.
`v0.413.0 implementation stop reached. Run pentest for this exact commit.`
