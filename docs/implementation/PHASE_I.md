# Phase I — Assets, Configuration, And Services

Scope: `0.81.0–0.90.0`. Facts retain provenance; graphs are tenant/policy aware.

## `0.81.0` — Asset Lifecycle
Status: planned. Setup: typed assets, ownership/location/cost/warranty, lifecycle, sanitization/disposal evidence. Goal: complete governed asset state. Deliverables: aggregate and inventory projections. Verification: ownership/disposal escalation, illegal states, evidence removal, duplicate identity, tenant pass. Exit criteria: irreversible actions require evidence. `v0.81.0 implementation stop reached. Run pentest for this exact commit.`

## `0.82.0` — Business And Technical Services
Status: planned. Setup: service identity/type, owner, criticality, offerings, lifecycle, tenant scope. Goal: model accountable services. Deliverables: service aggregate/catalog. Verification: owner escalation, cross-tenant linkage, false criticality, retirement with dependents, replay pass. Exit criteria: service authority is explicit. `v0.82.0 implementation stop reached. Run pentest for this exact commit.`

## `0.83.0` — Typed Relationship Graph
Status: planned. Setup: edge vocabulary, direction, cardinality, temporal validity, provenance, policy, traversal bounds. Goal: first-class safe relationships. Deliverables: relationship aggregate and graph port. Verification: unauthorized edges, cycles, hidden endpoints, duplicate/contradictory edges, exhaustion pass. Exit criteria: every edge is tenant-bound and evidenced. `v0.83.0 implementation stop reached. Run pentest for this exact commit.`

## `0.84.0` — Provenance And Confidence
Status: planned. Setup: source identity, observed/recorded times, evidence,
confidence derived only from versioned trust policy, expiry, immutable source
facts, and explicit correction/supersedes identities. Goal: distinguish facts
from assertions. Deliverables: fact envelope and provenance explanations.
Verification: impersonation, direct confidence inflation, detached evidence,
destructive correction, stale facts, conflicting sources pass. Exit criteria: no reconciled value loses origin. `v0.84.0 implementation stop reached. Run pentest for this exact commit.`

## `0.85.0` — Bitemporal Facts
Status: planned. Setup: preserve source-observed time, business-valid intervals,
journal-recorded time, and projection-checkpoint time; define corrections,
overlap policy, ordering, clock quality, and explicit as-known/as-valid query
semantics. Goal: preserve what was asserted, true, recorded, and projected.
Deliverables: temporal model/operators and four-clock query fixtures.
Verification: clock collapse, historical rewrite, invalid/overlap intervals,
uncertain boundaries, late facts, checkpoint lag and deterministic queries pass.
Exit criteria: corrections append rather than erase history. `v0.85.0 implementation stop reached. Run pentest for this exact commit.`

## `0.86.0` — Discovery And Import Interface
Status: planned. Setup: connector identity, batches, schemas, quotas, checkpoints, deletion claims, quarantine. Goal: ingest discovery as untrusted facts. Deliverables: discovery port/import pipeline. Verification: poisoned source, oversized/deep import, replay, partial batch, forged deletion, parser fuzz pass. Exit criteria: discovery never directly overwrites authority. `v0.86.0 implementation stop reached. Run pentest for this exact commit.`

## `0.87.0` — Reconciliation Engine
Status: planned. Setup: source precedence, freshness/confidence, versioned/scoped
manual locks, conflict outcomes, non-destructive alias/equivalence assertions,
rule version, input identities, chosen/rejected values, and explanation. Goal:
deterministic fact reconciliation without destroying asset identities.
Deliverables: pure engine and decision trace. Verification: priority abuse,
destructive merge, input permutations, stale/manual conflict, lock expiry and
exhaustion properties pass. Exit criteria: every chosen value explains rejected alternatives. `v0.87.0 implementation stop reached. Run pentest for this exact commit.`

## `0.88.0` — Dependency Impact Analysis
Status: planned. Setup: tenant-partitioned adjacency; authorize edge, endpoints,
and every intermediate node before traversal; purpose-specific edge allowlists;
depth/node/path/time/work bounds, cycles, staleness and uncertainty. Goal: bounded
pre-change impact without post-hoc redaction. Deliverables: impact planner and
policy-safe proof paths plus a Phase H topology-port adapter and differential
fixtures. Verification: hidden-node count/path/timing inference,
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

## `0.90.0` — Interactive Service Map
Status: planned. Setup: policy-filtered graph DTO, bounded expansion, layout data, stale markers, browser rendering. Goal: usable impact visualization. Deliverables: map API/UI and explanations. Verification: graph authorization, count/path inference, XSS, huge graph exhaustion, cache revocation, accessibility pass. Exit criteria: UI visibility equals graph policy. `v0.90.0 implementation stop reached. Run pentest for this exact commit.`
