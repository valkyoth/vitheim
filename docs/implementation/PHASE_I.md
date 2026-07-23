# Phase I — Assets, Configuration, And Services

Scope: `0.81.0–0.90.0`. Facts retain provenance; graphs are tenant/policy aware.

## `0.81.0` — Asset Lifecycle
Status: planned. Setup: typed assets, ownership/location/cost/warranty, lifecycle, sanitization/disposal evidence. Goal: complete governed asset state. Deliverables: aggregate and inventory projections. Verification: ownership/disposal escalation, illegal states, evidence removal, duplicate identity, tenant pass. Exit criteria: irreversible actions require evidence. `v0.81.0 implementation stop reached. Run pentest for this exact commit.`

## `0.82.0` — Business And Technical Services
Status: planned. Setup: service identity/type, owner, criticality, offerings, lifecycle, tenant scope. Goal: model accountable services. Deliverables: service aggregate/catalog. Verification: owner escalation, cross-tenant linkage, false criticality, retirement with dependents, replay pass. Exit criteria: service authority is explicit. `v0.82.0 implementation stop reached. Run pentest for this exact commit.`

## `0.82.1` — Service Health, Availability, And SLO Binding

Status: planned.

Setup: define service/component health state vocabulary over `0.20.3`
provenance/four-clock/correction/confidence primitives and the authenticated
`0.38.2` customer-measurement plane; define availability intervals,
maintenance/dependency context, manual override authority/expiry,
incident/change links, `0.38.1` SLI/SLO/error-budget bindings, aggregation
rules, `0.38.3` raw-versus-authoritative-rollup admissibility, audience
classification, and unknown state.

Goal: represent service health as provenance-aware temporal facts rather than a
mutable green/yellow/red field or direct copy of monitoring output.

Deliverables: typed health-observation payload and service-health projection/
aggregate rules, availability calculator, SLO binding, explanation timeline,
`0.38.2` measurement-source adapter plus fake, Phase H fake-versus-real health
integration, and internal/public DTO contracts.

Verification: source spoofing, false healthy/recovered state, stale observations,
clock/interval overlap, dependency cycles, confidence/override inflation,
maintenance masking, unknown-to-healthy fail-open, hidden component leakage,
rebuild permutations, alert/incident/status-publication feedback loops, and
SLO/health/Phase H differential tests pass. The hosted `0.38.2` observation API
is retested with real `0.52.1` workload identities and the `0.60.0` policy
matrix; revoked or wrong-audience sources fail closed.

Exit criteria: every health/availability claim cites source facts, corrections,
aggregation/SLO policy, freshness, uncertainty, and audience, and the selected
hosted measurement profile has complete identity/authorization evidence.
Historical claims cite retained raw inputs or an admissible integrity-bound
rollup rather than a disposable downsampling projection.
`v0.82.1
implementation stop reached. Run pentest for this exact commit.`

## `0.83.0` — Typed Relationship Graph
Status: planned. Setup: edge vocabulary, direction, cardinality, temporal validity, provenance, policy, traversal bounds. Goal: first-class safe relationships. Deliverables: relationship aggregate and graph port. Verification: unauthorized edges, cycles, hidden endpoints, duplicate/contradictory edges, exhaustion pass. Exit criteria: every edge is tenant-bound and evidenced. `v0.83.0 implementation stop reached. Run pentest for this exact commit.`

## `0.84.0` — Provenance And Confidence
Status: planned. Setup: specialize the shared `0.20.3` source, observation,
provenance, correction/supersession, four-clock, and policy-bound confidence
primitives for asset, configuration, software, and service facts; add evidence,
expiry, and domain-specific source trust without redefining the shared law.
Goal: distinguish asset/service facts from assertions. Deliverables: typed
asset/service fact envelopes, provenance explanations, and cross-domain
conformance fixtures.
Verification: impersonation, direct confidence inflation, detached evidence,
destructive correction, stale facts, conflicting sources pass. Exit criteria: no reconciled value loses origin. `v0.84.0 implementation stop reached. Run pentest for this exact commit.`

## `0.85.0` — Bitemporal Facts
Status: planned. Setup: apply the `0.20.3` four-clock and correction semantics
to asset/service overlap, ordering, and explicit as-known/as-valid queries;
define only domain-specific interval rules and clock-quality requirements.
Goal: preserve what was asserted, true, recorded, and projected. Deliverables:
asset/service temporal operators and four-clock query fixtures shared with
SLI, health, alert, vulnerability, and evidence facts.
Verification: clock collapse, historical rewrite, invalid/overlap intervals,
uncertain boundaries, late facts, checkpoint lag and deterministic queries pass.
Exit criteria: corrections append rather than erase history. `v0.85.0 implementation stop reached. Run pentest for this exact commit.`

## `0.86.0` — Discovery And Import Interface
Status: planned. Setup: connector identity, batches, schemas, quotas, checkpoints, deletion claims, quarantine. Goal: ingest discovery as untrusted facts. Deliverables: discovery port/import pipeline. Verification: poisoned source, oversized/deep import, replay, partial batch, forged deletion, parser fuzz pass. Exit criteria: discovery never directly overwrites authority. `v0.86.0 implementation stop reached. Run pentest for this exact commit.`

## `0.86.1` — Concrete CMDB Discovery Connector

Status: conditional planned milestone. Before code, select one concrete CMDB
product/API/version demanded by an intended production profile and admit its
exact HTTP/TLS/client/authentication dependencies; if none is justified, record
the profile deferred at `0.140.9` and do not create a generic compatibility
claim.

Setup: define `0.52.1` workload identity, endpoint/tenant/domain binding,
supported object/relationship classes, immutable external identities, schema
and pagination/delta versions, checkpoints, provenance, deletion/tombstone
claims, reconciliation precedence, field classification, quotas, rate limits,
retry/backoff, raw evidence retention, and outage/resync behavior.

Goal: prove the `0.86.0` discovery contract against one real CMDB boundary
without allowing the external CMDB to overwrite Vitheim authority.

Deliverables: selected connector adapter and mapping pack, capability probe,
credential broker integration, staged import/quarantine, checkpoint/reconcile
state, fake server and recorded conformance corpus, drift monitor, deployment
guide, and explicit unsupported object/API matrix.

Verification: endpoint/tenant/account confusion, external-ID reuse/collision,
schema/type coercion, poisoned relationships, pagination/delta gaps, forged
deletion, stale resurrection, field/credential leakage, SSRF/redirect,
rate/retry storms, partial batch, full resync, source drift, parser fuzzing,
load, and fake-versus-live-contract tests pass.

Exit criteria: only the exact evidenced CMDB profile is named supported; absent
a selected connector, `1.0.0` truthfully exposes the generic discovery API and
Tenable integration without claiming CMDB compatibility. `v0.86.1
implementation stop reached. Run pentest for this exact commit.`

## `0.87.0` — Reconciliation Engine
Status: planned. Setup: source precedence, freshness/confidence, versioned/scoped
manual locks, conflict outcomes, non-destructive alias/equivalence assertions,
rule version, input identities, chosen/rejected values, and explanation. Asset
merge, split, migration, deletion, and supersession commands update the
authoritative `DispatchTargetFence` beside their owner events so a delayed
current-target effect cannot act on the pre-change identity or lifecycle. Goal:
deterministic fact reconciliation without destroying asset identities.
Deliverables: pure engine and decision trace. Verification: priority abuse,
destructive merge, input permutations, stale/manual conflict, lock expiry and
exhaustion, stale target fence/projection, target-change-versus-dispatch, and
restored deletion/supersession epoch properties pass. Exit criteria: every
chosen value explains rejected alternatives and identity reconciliation cannot
resurrect dispatch authority. `v0.87.0 implementation stop reached. Run pentest for this exact commit.`

## `0.88.0` — Dependency Impact Analysis
Status: planned. Setup: tenant-partitioned adjacency; authorize edge, endpoints,
and every intermediate node before traversal; purpose-specific edge allowlists;
depth/node/path/time/work bounds, cycles, staleness and uncertainty. Goal: bounded
pre-change impact without post-hoc redaction. Deliverables: impact planner and
policy-safe proof paths plus Phase E change and Phase H correlation topology-
port adapters and differential fixtures. Verification: hidden-node count/path/timing inference,
cycles, path explosion, stale graph, cross-tenant edge, ranking pass. Exit criteria: reports never reveal unauthorized topology. `v0.88.0 implementation stop reached. Run pentest for this exact commit.`

## `0.88.1` — Unified Cross-Domain Operational Graph

Status: planned.

Setup: define typed, directional, temporal, provenance-aware edge vocabularies
between organizations, teams, people/service principals, services, assets,
software instances, vulnerabilities/exposures, alerts, incidents, changes,
tasks, controls, and evidence. Preserve each source aggregate ID and prohibit
generic untyped links or graph-owned mutation of domain truth.

Goal: project one explainable relationship graph where, for example, server A
is operated by team X, hosts vulnerable software Y, produced alert Z, affected
service Q, and is referenced by incident and remediation work.

Deliverables: cross-domain graph schema/registry, per-domain projection adapters,
edge provenance and lifecycle rules, deterministic rebuild, consistency/lag
tokens, and policy-filtered neighborhood API.

Verification: wrong-type/tenant edges, source deletion/correction, duplicate or
contradictory links, cycles, stale projections, hidden endpoint/intermediate
inference, rebuild permutations, unknown edge versions, and graph bombs pass.

Exit criteria: every graph node/edge maps to authoritative source facts and
cannot outlive or exceed their visibility without an explicit historical rule.
`v0.88.1 implementation stop reached. Run pentest for this exact commit.`

## `0.88.2` — Evidence-Bound Cross-Domain Correlation

Status: planned.

Setup: define versioned correlation rules over admitted edge/path types, temporal
windows, source trust, identity equivalence, confidence, negative evidence,
suppression, minimum evidence, explanation, deduplication, and depth/node/path/
time/work budgets. Rules propose derived relationships or cases, never rewrite
source facts.

Goal: correlate vulnerabilities, alerts, incidents, changes, services, owners,
and evidence into explainable operational/security context.

Deliverables: pure correlation planner/evaluator, derived-assertion aggregate,
bounded proof path, rule simulator, counterfactual explanation, and Phase H
fake-versus-real graph differential suite.

Verification: poisoned edges/sources, circular self-support, hidden-node or
count leakage, temporal inversion, confidence inflation, path explosion,
order-dependent results, duplicate case storms, stale/revoked facts, and
adversarial rule fuzzing pass.

Exit criteria: every correlation cites a bounded policy-safe evidence path,
rule version, input versions, uncertainty, and rejected alternatives. `v0.88.2
implementation stop reached. Run pentest for this exact commit.`

## `0.88.3` — Correlation Workspace And Conformance Suite

Status: planned.

Setup: define analyst queues, graph/pivot API, timeline, proposed/confirmed/
rejected correlation lifecycle, feedback authority, bulk limits, saved views,
notifications, exports, and authorization registry coverage across every domain.

Goal: turn correlation into an operable review system without making automated
links silently authoritative.

Deliverables: policy-filtered correlation workspace/API projections, graph and
timeline explanations, review commands, regression corpus, coverage matrix,
load harness, and operational runbook.

Verification: unauthorized pivot/path, field/count leakage, confirmation
escalation, feedback poisoning, stale review, cross-domain/tenant cache leak,
bulk-action abuse, XSS/export injection, rebuild, source outage, and soak pass.

Exit criteria: users can traverse authorized evidence from owner/team through
asset, vulnerability, alert, incident, and remediation while every inferred
link remains reviewable and attributable. `v0.88.3 implementation stop reached.
Run pentest for this exact commit.`

## `0.89.0` — Software And License Inventory
Status: planned. Setup: software identity/version, installations, entitlements, allocations, renewals, support status, evidence. Goal: software asset management separate from hardware. Deliverables: software/entitlement aggregates and compliance projection. Verification: forged installs, entitlement leakage, duplicate allocation, version confusion, renewal boundaries pass. Exit criteria: compliance claims cite inventory and entitlement evidence. `v0.89.0 implementation stop reached. Run pentest for this exact commit.`

## `0.89.1` — SPDX And CycloneDX SBOM Ingestion Profiles

Status: planned only for exact intended SPDX/CycloneDX versions and
serializations; unsupported profiles are deferred at `0.140.9`. Parser,
signature, and source clients require implementation admission.

Setup: pin document/BOM identity and versions, creator/source/signature,
components/packages/files/services, versions and identifiers, hashes, licenses,
copyright, external references, dependency/containment relationships,
compositions/completeness, vulnerabilities where present, timestamps,
namespaces/serials, updates, tenant/asset/build links, quotas, and raw retention.

Goal: ingest software bills of materials as versioned evidence for inventory,
license, vulnerability, and graph workflows without treating an SBOM as
automatically complete or authoritative installed state.

Deliverables: bounded SPDX/CycloneDX codecs, canonical evidence envelope,
component/relationship mapping, identity reconciliation, completeness model,
signature/provenance verification, quarantine, conformance corpora, and runbook.

Verification: namespace/serial/component collision, dependency cycles/bombs,
hash/license/version confusion, signature/source spoofing, external-reference
SSRF, completeness inflation, stale/substituted BOM, cross-asset/tenant link,
XML/JSON/decompression bombs, parser differentials, fuzzing, and rebuild pass.

Exit criteria: every SBOM-derived fact retains document/source/version/
completeness evidence, and conflicts never silently overwrite inventory or
license authority. `v0.89.1 implementation stop reached. Run pentest for this exact commit.`

## `0.90.0` — Interactive Service Map
Status: planned. Setup: policy-filtered graph DTO, bounded expansion, layout data, stale markers, browser rendering. Goal: usable impact visualization. Deliverables: map API/UI and explanations. Verification: graph authorization, count/path inference, XSS, huge graph exhaustion, cache revocation, accessibility pass. Exit criteria: UI visibility equals graph policy. `v0.90.0 implementation stop reached. Run pentest for this exact commit.`
