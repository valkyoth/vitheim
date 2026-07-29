# Requirement Ownership And Product Integration Completions

Document status: planned companion stops introduced by the second capability-gap
review.

These handoffs make buried requirements mechanically owned, decompose the
remaining broad product stops, and carry the full-suite domains through policy,
workflow, search, API, UI, lifecycle, and production evidence. Each exact stop
has one dominant owner and its own pentest boundary.

## `0.18.14` — Stable Requirement Registry And Checker

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
`v0.18.14 implementation stop reached. Run pentest for this exact commit.`

## `0.20.5` — Phase A And B Requirement Backfill

Status: planned.
Setup: inventory every normative foundation, journal, projection, audit,
outbox/inbox, scheduler, quota, provenance, integrity, telemetry, verification,
failure, recovery, and evidence requirement through `0.20.4`.
Goal: prove the requirement registry against the implemented-to-date foundation.
Deliverables: Phase A/B `VIT-REQ-*` entries, exact stop/crate/schema/test owners,
predecessor graph, integration/retest links, and generated coverage report.
Verification: prose-to-registry and registry-to-prose differential, duplicate
semantic owner, uncovered paragraph/table row, dead crate/test reference, and
superseded requirement tests pass.
Exit criteria: every normative Phase A/B requirement has exactly one primary
stop and no requirement is owned merely by a cumulative ledger heading.
`v0.20.5 implementation stop reached. Run pentest for this exact commit.`

## `0.30.18` — Phase C Requirement Backfill

Status: planned.
Setup: inventory each storage capability, adapter, migration/import, corruption,
cost, witness, queue, cache, transaction, recovery, budget, and refusal
requirement across the Phase C ledger and focused scope splits.
Goal: assign every large-ledger requirement to one exact implementation slice.
Deliverables: Phase C `VIT-REQ-*` entries, ownership/cutover/migration/test
metadata, companion-stop coverage matrix, and generated unassigned/overlap report.
Verification: sample every ledger section and table row; inject missing,
duplicated, contradictory, wrong-adapter, wrong-migration, and wrong-retest
assignments and require deterministic failure.
Exit criteria: every Phase C requirement resolves to exactly one primary stop,
with explicit later adapter/restore/production retests where applicable.
`v0.30.18 implementation stop reached. Run pentest for this exact commit.`

## `0.30.19` — Phase D Through G Requirement Backfill

Status: planned.
Setup: inventory universal work, ITSM/full-suite companions, identity/policy,
subscriptions, workflows, notification, paging, and early-reference requirements.
Goal: freeze ownership before the first product-domain implementation begins.
Deliverables: Phase D–G `VIT-REQ-*` entries with aggregate/application/API/fake/
policy/workflow/test owners and later real-integration stops.
Verification: generic-record escape, missing policy registration, fake without
real retest, domain requirement assigned to UI, duplicated transition owner,
and unowned side-effect/lifecycle requirement pass.
Exit criteria: every Phase D–G requirement has one implementation owner and
every deterministic fake names its later differential-integration owner.
`v0.30.19 implementation stop reached. Run pentest for this exact commit.`

## `0.30.20` — Phase H Through K Requirement Backfill

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
`v0.30.20 implementation stop reached. Run pentest for this exact commit.`

## `0.30.21` — Phase L Through Production Requirement Backfill

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
`v0.30.21 implementation stop reached. Run pentest for this exact commit.`

## `0.30.22` — Early Cross-Domain References And Read Ports

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
`v0.30.22 implementation stop reached. Run pentest for this exact commit.`

## `0.50.7` — Customer Contacts And Organization Relationships

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
`v0.50.7 implementation stop reached. Run pentest for this exact commit.`

## `0.50.8` — Customer Service Agreements And Coverage

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
`v0.50.8 implementation stop reached. Run pentest for this exact commit.`

## `0.50.9` — Service Entitlement Decisions

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
`v0.50.9 implementation stop reached. Run pentest for this exact commit.`

## `0.50.10` — Supplier Contract Lifecycle

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
`v0.50.10 implementation stop reached. Run pentest for this exact commit.`

## `0.50.11` — Supplier Obligations, Performance, And Assessment Evidence

Status: planned.
Setup: define contractual obligation, measure, evidence source, period, target,
performance result, assessment method/owner, finding, inert `RiskProposal`,
correction, review schedule, and typed evidence reference.
Goal: assess supplier delivery without duplicating Phase K risk authority.
Deliverables: obligation and assessment aggregates, measurement/evidence ports,
score explanations, evidence-backed findings, inert risk proposals, and reports.
Verification: obligation deletion, metric/period/source substitution, score
manipulation, self-assessment, hidden negative result, proposal-as-accepted-risk,
parallel treatment/exception, and stale evidence pass.
Exit criteria: every supplier assessment cites exact obligation, evidence,
method, owner, time, and correction history; only Phase K can accept risk,
create treatment, or authorize an exception or waiver.
`v0.50.11 implementation stop reached. Run pentest for this exact commit.`

## `0.50.12` — Supplier Data Access And Termination

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
`v0.50.12 implementation stop reached. Run pentest for this exact commit.`

## `0.50.13` — Purchase Orders And Receipt

Status: planned.
Setup: consume approved requisitions; define external order reference, supplier/
contract, line/item, quantity/unit, expected delivery, receipt/rejection,
partial delivery, evidence, idempotency, and correction.
Goal: track ordered and received items without implementing payment or ledger posting.
Deliverables: order-reference and receipt aggregates, receiving workflow,
document evidence, duplicate protection, and external procurement port.
Verification: requisition/order substitution, over-receipt, unit confusion,
duplicate provider event, false delivery, partial-order races, and document leak pass.
Exit criteria: receipts reconcile exactly to approved order lines and remain
operational evidence, never financial posting authority.
`v0.50.13 implementation stop reached. Run pentest for this exact commit.`

## `0.50.14` — Allocation, Return, And Asset Handoff

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
`v0.50.14 implementation stop reached. Run pentest for this exact commit.`

## `0.50.15` — Non-Software Entitlement Lifecycle

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
`v0.50.15 implementation stop reached. Run pentest for this exact commit.`

## `0.50.16` — ERP Port And Procurement Reconciliation Semantics

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
the later `0.118.5` exact adapter/defer decision.
`v0.50.16 implementation stop reached. Run pentest for this exact commit.`

## `0.50.17` — Continuity Exercises And Corrective Evidence

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
`v0.50.17 implementation stop reached. Run pentest for this exact commit.`

## `0.60.3` — Implemented-Surface Authorization Registration And Gate

Status: planned.
Setup: enumerate interfaces implemented through `0.60.2`, including broader
service management and subscriptions, plus action/resource/field/purpose and
obligation semantics.
Goal: cover current surfaces and install a prospective policy/redaction gate.
Deliverables: generated current registrations, mandatory negative cases, field
DTOs, subscription item/reconnect cases, and later-surface registration gate.
Verification: omitted route/item/action/field, hidden count, purpose confusion,
policy-version drift, notification/export leak, and allow-by-default pass.
Exit criteria: every implemented interface is registered; each later domain
must add its own case before exit, with late-domain certification at `0.120.8`.
`v0.60.3 implementation stop reached. Run pentest for this exact commit.`

## `0.70.4` — Phase D–G Workflow And Notification Integration

Status: planned.
Setup: map domain events and ordinary commands for portfolio, agreements,
suppliers, procurement, capacity, continuity, and other implemented Phase D–G
domains to versioned workflow triggers and notification intents.
Goal: provide automation without embedding a second domain lifecycle.
Deliverables: trigger/action descriptors, workflow templates, notification
audience/field rules, loop guards, fakes, and end-to-end fixtures.
Verification: trigger spoof/replay/storm, generic status mutation, stale
authority, hidden-field notification, recursive loop, and workflow/domain drift pass.
Exit criteria: workflows orchestrate only registered commands and notifications
reauthorize current recipients and visible fields at dispatch; later domains
add mappings at introduction and are certified at `0.120.9`.
`v0.70.4 implementation stop reached. Run pentest for this exact commit.`

## `0.81.3` — Physical And Compute Asset-Kind Pack

Status: planned.
Setup: use the `0.81.1` registry for physical device, server, workstation,
mobile, network appliance, virtual machine, and compute-instance descriptors,
identity fields, lifecycle requirements, and permitted relationships.
Goal: deliver reviewed common physical/compute kinds as data, not hard-coded branches.
Deliverables: signed kind pack, migrations, fixtures, discovery mappings,
ownership/warranty/disposal rules, and compatibility corpus.
Verification: serial/provider-ID collision, VM/host confusion, unsafe kind
migration, missing disposal evidence, relationship violation, and downgrade pass.
Exit criteria: only the reviewed pack kinds activate and each preserves the
registry's identity, lifecycle, provenance, and compatibility law.
`v0.81.3 implementation stop reached. Run pentest for this exact commit.`

## `0.81.4` — Cloud, Kubernetes, And Container Asset-Kind Pack

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
`v0.81.4 implementation stop reached. Run pentest for this exact commit.`

## `0.81.5` — Identity, Certificate, Domain, And Network Asset-Kind Pack

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
`v0.81.5 implementation stop reached. Run pentest for this exact commit.`

## `0.81.6` — SaaS And Data Asset-Kind Pack

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
`v0.81.6 implementation stop reached. Run pentest for this exact commit.`

## `0.86.2` — Representative Cloud-Native Discovery Profile

Status: conditional planned milestone; select one exact cloud or Kubernetes
API/version/profile demanded by an intended deployment, otherwise record it
deferred and keep `0.81.4` kinds manual/generic-import-only for `1.0.0`.
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
`v0.86.2 implementation stop reached. Run pentest for this exact commit.`

## `0.100.1` — Phase D–J Search And History Integration

Status: planned.
Setup: define documents, fields, facets, queues, saved-view predicates,
temporal/history events, graph references, snippets, counts, retention, and
policy behavior for implemented domains through Phase J and subscription status.
Goal: make current domains discoverable without search becoming an authorization oracle.
Deliverables: versioned projection mappings, rebuild/migration hooks, default
facets/queues, redaction registrations, and domain-versus-search differentials.
Verification: missing/duplicate document, hidden field/count/facet, stale
revocation, cross-customer/supplier/privacy leak, rebuild divergence, and query
complexity pass.
Exit criteria: every Phase D–J domain names its search/history owner and current
application reads and search return policy-equivalent visibility; later domains
add mappings at introduction and are certified at `0.120.10`.
`v0.100.1 implementation stop reached. Run pentest for this exact commit.`

## `0.132.3` — Full-Suite Workspaces And Administration

Status: planned.
Setup: define role/purpose-specific workspaces, composable blocks, queues,
details, actions, administration, feature/support discovery, empty/error states,
and small-versus-large organization layouts over existing headless application
commands, reads, and internal DTOs for every new domain.
Goal: expose the full suite without a privileged UI path or one overloaded page.
Deliverables: workspaces/blocks for portfolio, customers, suppliers, procurement,
capacity, continuity, assets, privacy, mail, subscriptions, and audit export;
admin surfaces and accessibility fixtures.
Verification: hidden route/block/action, field/count leak, profile-based
privilege, query storm, unsupported feature shown active, XSS, and UI/API differential pass.
Exit criteria: UI consumes existing registered commands and policy-filtered
reads without introducing domain application services, and unsupported or
conditional capabilities are truthful.
`v0.132.3 implementation stop reached. Run pentest for this exact commit.`

## `0.138.4` — Full-Suite External API And SDK Contract Freeze

Status: planned.
Setup: consume existing headless application services/internal DTOs and freeze
external resource/command/read schemas,
pagination/concurrency/idempotency/errors, events, compatibility, and private
SDK bindings for all new domains and subscription operations.
Goal: expose every supported full-suite capability through an API-first boundary.
Deliverables: external adapters, OpenAPI/schema descriptions, private SDK
generation, compatibility fixtures, and subscribe/cancel/reconnect/
cursor/gap/item contracts for SSE and any selected WebSocket profile.
Verification: mass assignment, resource/type confusion, cursor/gap forgery,
reconnect downgrade, hidden field, retry/idempotency mismatch, SDK/API
differential, and undocumented UI action pass.
Exit criteria: no domain receives its first application service here; every
shipped UI/integration uses the same versioned services and external API
contracts, with subscription semantics defined independently of transport.
`v0.138.4 implementation stop reached. Run pentest for this exact commit.`

## `0.138.5` — Full-Suite Import, Export, And Configuration Integration

Status: planned.
Setup: classify which schemas, domain state, references, layouts, workflow/
notification bindings, kind packs, and settings are importable, exportable, or
configuration-as-code; define staging, validation, policy snapshots, secrets,
unsupported fields, activation, rollback, and migration.
Goal: integrate the new domains without a generic record import/export escape hatch.
Deliverables: typed import/export manifests, staged validators, signed
configuration schemas, dry-run/impact report, migration hooks, and round-trip corpus.
Verification: hidden field/secret export, mass assignment, stale reference,
kind/schema downgrade, partial activation, erased-data resurrection, and
configuration/runtime differential pass.
Exit criteria: every supported transfer is typed, staged, policy-filtered,
versioned, and separately activated; unsupported state fails explicitly.
`v0.138.5 implementation stop reached. Run pentest for this exact commit.`

## `0.139.1` — Full-Suite Cross-Surface Differential Suite

Status: planned.
Setup: derive cases from the requirement and authorization registries for each
new domain across application/API/SDK/UI/search/history/workflow/notification/
import/export/configuration/subscription surfaces.
Goal: prove semantic, authorization, redaction, and support-state equivalence.
Deliverables: generated cross-surface matrix, golden domain journeys, tenant/
role/field pairs, correction/revocation fixtures, and evidence report.
Verification: mutation/read mismatch, hidden field/count, stale lifecycle,
unsupported capability discovery, fake/real divergence, retry/cursor mismatch,
and API/UI/search/export differential pass.
Exit criteria: no registered full-suite requirement or interface lacks its
required positive, negative, boundary, correction, and revocation comparison.
`v0.139.1 implementation stop reached. Run pentest for this exact commit.`

## `0.145.3` — Full-Suite Lifecycle, Backup, Restore, And Erasure

Status: planned.
Setup: extend the tenant data-surface registry and backup/restore manifests for
every new aggregate, projection, cursor, mail/audit spool, kind pack, search
document, configuration, external copy, retention, hold, and erasure state.
Goal: prove the full suite survives recovery and closes data truthfully.
Deliverables: surface registrations, backup/restore codecs, migration/rebuild
order, retention/hold/erasure handlers, privacy-fulfilment linkage, continuity/
DR evidence linkage, and destructive exercise corpus.
Verification: omitted surface, stale cursor/spool resurrection, missing
external copy, broken reference, erasure rollback, kind/config downgrade,
privacy false completion, continuity false evidence, and restore divergence pass.
Exit criteria: selected full-suite profiles restore or erase with complete
evidence; missing state leaves the affected capability unready, never guessed.
`v0.145.3 implementation stop reached. Run pentest for this exact commit.`
