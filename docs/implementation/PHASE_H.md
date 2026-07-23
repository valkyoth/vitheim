# Phase H — Alerts And Security Operations

Scope: `0.71.0–0.80.0`. Sources authenticate; parsing and correlation remain bounded and explainable.

## `0.71.0` — Authenticated Alert Ingestion
Status: planned. Setup: source identities, signatures/tokens, replay windows, schemas, quotas, tenant routing. Goal: trustworthy bounded intake. Deliverables: ingest protocol/port and receipts. Verification: spoof/replay/flood, wrong tenant, key rotation, malformed framing, backpressure pass. Exit criteria: unauthenticated alerts never enter authority. `v0.71.0 implementation stop reached. Run pentest for this exact commit.`

## `0.72.0` — Alert Normalization
Status: planned. Setup: immutable raw evidence, canonical derived alert fields,
versioned mappings, limits, and unknown-field policy. Goal: normalize without
mutating source bytes or losing provenance. Deliverables: mapper/compiler,
normalized model, and raw-to-derived digest links. Verification: parser confusion,
smuggling, coercion, raw mutation, oversized/deep input, mapping version, fuzz
pass. Exit criteria: normalized facts remain traceable. `v0.72.0 implementation stop reached. Run pentest for this exact commit.`

## `0.73.0` — Deduplication Engine
Status: planned. Setup: identity keys, windows, collision handling, immutable
membership assertions, versioning, and budgets. Goal: reduce repeats without
merging or deleting raw evidence. Deliverables: deterministic grouping engine
and explanation. Verification: collision abuse, boundary windows, order
permutations, evidence mutation/loss, cross-tenant keys, properties pass. Exit criteria: every grouping is explainable/reversible. `v0.73.0 implementation stop reached. Run pentest for this exact commit.`

## `0.74.0` — Suppression And Maintenance Windows
Status: planned. Setup: authority, scope, reason, schedule, expiry, caps,
visibility, override, and immutable underlying alert evidence. Goal: controlled
display/routing reduction without source mutation. Deliverables: suppression
aggregate/evaluator and audit. Verification: overbroad/immortal suppression,
evidence deletion, timezone abuse, self-approval, hidden active rules, bypass
pass. Exit criteria: suppressed alerts remain evidenced. `v0.74.0 implementation stop reached. Run pentest for this exact commit.`

## `0.75.0` — Topology And Temporal Correlation
Status: planned. Setup: define a minimal topology-fact port with deterministic
fake, admitted edges, time windows, confidence, scoring, traversal/work limits,
and explanation; do not claim the Phase I service graph. Goal: group related
alerts safely against a replaceable topology contract. Deliverables: pure
correlation planner/engine and fake topology corpus. Verification: poisoning,
graph cycles, hidden-node inference, order dependence, exhaustion, differential
fixtures pass; real graph integration is repeated at `0.88.0`. Exit criteria:
correlations cite bounded evidence and no later graph capability is assumed.
`v0.75.0 implementation stop reached. Run pentest for this exact commit.`

## `0.76.0` — Alert-To-Incident Orchestration
Status: planned. Setup: creation/link thresholds, policy, rate limits, idempotency, feedback-loop guards. Goal: automate cases without flooding or unauthorized links. Deliverables: orchestration workflow and audit trace. Verification: storms, duplicate creation, malicious linking, suppressed alerts, races, rollback pass. Exit criteria: every incident/link has policy evidence. `v0.76.0 implementation stop reached. Run pentest for this exact commit.`

## `0.77.0` — Security-Incident Domain
Status: planned. Setup: classification, containment authority, evidence visibility, roles, lifecycle, regulatory flags. Goal: typed response cases. Deliverables: aggregate, activities, workspace projections. Verification: containment escalation, evidence leaks, role takeover, closure bypass, tenant/replay pass. Exit criteria: sensitive actions require explicit capability. `v0.77.0 implementation stop reached. Run pentest for this exact commit.`

## `0.78.0` — Vulnerability Findings And Remediation
Status: planned. Setup: scanner/source identity, asset evidence, scoring versions, dedup, acceptance, remediation. Goal: trustworthy vulnerability cases. Deliverables: finding/remediation aggregates and importer. Verification: spoofing, score tamper, stale findings, cross-asset/tenant links, false closure, parser fuzz pass. Exit criteria: risk changes retain source and authority. `v0.78.0 implementation stop reached. Run pentest for this exact commit.`

## `0.78.1` — Vulnerability Identity And Affected-Asset Assertions

Status: planned.

Setup: distinguish advisory/vulnerability identity, vendor/scanner finding
identity, affected asset or software instance, product/version/configuration,
observed/business-valid/recorded times, source confidence, evidence, fix
availability, and affected/not-affected/fixed assertions. Exact CVE/CVSS/VEX
profiles remain versioned inputs selected by `0.140.9`, not hard-coded truth.

Goal: model vulnerability knowledge and each asset exposure without conflating a
global advisory, scanner result, or mutable asset record.

Deliverables: vulnerability/advisory aggregate, affected-asset assertion model,
typed source references, alias/equivalence rules, provenance projections, and
bounded ingestion/reconciliation testkit.

Verification: identifier collision, forged advisory/source, wrong asset/software
link, stale product match, destructive deduplication, conflicting affected/VEX
claims, reopened exposure, tenant confusion, parser fuzz, and replay pass.

Exit criteria: every exposure states which asset/software is affected, according
to which source/version/evidence and time. `v0.78.1 implementation stop reached. Run pentest for this exact commit.`

## `0.78.2` — Exposure Prioritization And Risk Decisions

Status: planned.

Setup: define versioned inputs for severity, exploit maturity/known exploitation,
reachability/exposure, asset and service criticality, data class, business
impact, compensating controls, confidence, age, remediation availability, and
policy deadlines. Base scanner severity is evidence, never the final decision.

Goal: prioritize remediation explainably across technical and business context.

Deliverables: pure exposure-priority engine, policy versions, explanation trace,
override/acceptance commands, queue projections, and recalculation protocol when
facts or policies change.

Verification: score inflation, missing/stale facts, forged criticality/control,
non-monotonic rules, overflow, priority starvation, unauthorized override,
policy downgrade, order permutations, bulk recalculation, and tenant tests pass.

Exit criteria: every priority and due date is reproducible from named evidence
and a pinned policy version. `v0.78.2 implementation stop reached. Run pentest for this exact commit.`

## `0.78.3` — Remediation Campaigns, Exceptions, And Verification

Status: planned.

Setup: define remediation owner/team, affected scope snapshot, tasks, patch/
configuration/change links, maintenance windows, deadlines, compensating
controls, risk acceptance with expiry, deferral, false-positive challenge,
verification source, recurrence, and closure/reopen rules.

Goal: manage vulnerabilities with the same typed lifecycle rigor as assets,
incidents, changes, approvals, and evidence.

Deliverables: remediation-campaign and exception aggregates, task/change
orchestration, SLA projections, bulk-safe commands, verification/reopen
workflow, notifications, and audit explanations.

Verification: unauthorized mass close/accept, self-approval, scope drift,
duplicate tasks, stale scan closure, false verification, immortal exception,
change-window bypass, notification flood, race/replay, rollback, and recovery pass.

Exit criteria: an exposure closes only from authorized evidence-backed
verification or remains in an explicit expiring exception state. `v0.78.3
implementation stop reached. Run pentest for this exact commit.`

## `0.78.4` — Vulnerability Program Conformance And Reporting

Status: planned.

Setup: define source coverage/freshness, inventory denominator, exposure/remedy/
exception states, SLA policy, recurrence, aging, trends, service/team views,
executive aggregates, export policy, and accuracy/unknown-state rules.

Goal: provide an operational vulnerability-management system whose dashboards
and reports remain traceable to assets, sources, decisions, and remediation.

Deliverables: vulnerability workspace/API projections, coverage and aging
reports, campaign dashboards, scanner differential corpus, authorization
registry entries, and program runbook.

Verification: missing-source false assurance, denominator manipulation, hidden
asset/count inference, stale dashboard, cross-team/tenant leakage, report/formula
injection, export bypass, source outage, rebuild, and large-inventory load pass.

Exit criteria: program status distinguishes verified coverage from unknown or
stale data and never treats absence of findings as proof of safety. `v0.78.4
implementation stop reached. Run pentest for this exact commit.`

## `0.79.0` — Forensic Timeline, Preservation, And Evidence Custody
Status: planned. Setup: immutable content-addressed original bytes, tenant/case
scope, envelope encryption, acquisition actor/tool/source/method/location, time
claim plus clock quality/uncertainty, transfers, access/copy/transform/export,
legal hold, preservation notice, disposition, and parent digests. Goal: preserve
complete custody without normalizing conflicting clocks or mutating raw evidence.
Deliverables: evidence aggregate, timeline, custody report, and signed export
manifest covering every derived artifact. Verification: timestamp tamper,
substitution, custody/hold/disposition gaps, unauthorized access/export,
derived-parent mismatch, conflicting clocks, crypto-erasure and restore pass.
Exit criteria: evidence lineage is complete or explicitly incomplete. `v0.79.0 implementation stop reached. Run pentest for this exact commit.`

## `0.80.0` — Integrated SecOps Workspace
Status: planned. Setup: pin current schemas/policies, source integrations,
migrations, deterministic search-port fake, and representative attacks. Goal:
prove integrated alert-to-response behavior without claiming Phase J search.
Deliverables: workspace, fake search contract fixtures, runbooks, operational
evidence. Verification: cross-source/tenant leaks, current authorization/export
parity, fake-search contract, load, recovery, upgrade, full phase pentest pass;
real search parity is repeated at `0.100.0`. Exit criteria: SecOps scope and
unavailable later-phase search are truthful and not called a full SIEM.
`v0.80.0 implementation stop reached. Run pentest for this exact commit.`
