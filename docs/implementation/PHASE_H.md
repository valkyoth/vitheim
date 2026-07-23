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
Status: planned. Setup: admitted edges, time windows, confidence, scoring, traversal/work limits, explanation. Goal: group related alerts safely. Deliverables: pure correlation planner/engine. Verification: poisoning, graph cycles, hidden-node inference, order dependence, exhaustion, differential fixtures pass. Exit criteria: correlations cite bounded evidence. `v0.75.0 implementation stop reached. Run pentest for this exact commit.`

## `0.76.0` — Alert-To-Incident Orchestration
Status: planned. Setup: creation/link thresholds, policy, rate limits, idempotency, feedback-loop guards. Goal: automate cases without flooding or unauthorized links. Deliverables: orchestration workflow and audit trace. Verification: storms, duplicate creation, malicious linking, suppressed alerts, races, rollback pass. Exit criteria: every incident/link has policy evidence. `v0.76.0 implementation stop reached. Run pentest for this exact commit.`

## `0.77.0` — Security-Incident Domain
Status: planned. Setup: classification, containment authority, evidence visibility, roles, lifecycle, regulatory flags. Goal: typed response cases. Deliverables: aggregate, activities, workspace projections. Verification: containment escalation, evidence leaks, role takeover, closure bypass, tenant/replay pass. Exit criteria: sensitive actions require explicit capability. `v0.77.0 implementation stop reached. Run pentest for this exact commit.`

## `0.78.0` — Vulnerability Findings And Remediation
Status: planned. Setup: scanner/source identity, asset evidence, scoring versions, dedup, acceptance, remediation. Goal: trustworthy vulnerability cases. Deliverables: finding/remediation aggregates and importer. Verification: spoofing, score tamper, stale findings, cross-asset/tenant links, false closure, parser fuzz pass. Exit criteria: risk changes retain source and authority. `v0.78.0 implementation stop reached. Run pentest for this exact commit.`

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
Status: planned. Setup: pin current schemas/policies, source integrations, migrations, and representative attacks. Goal: prove integrated alert-to-response behavior. Deliverables: workspace, runbooks, operational evidence. Verification: cross-source/tenant leaks, authorization/search/export parity, load, recovery, upgrade, full phase pentest pass. Exit criteria: SecOps scope is truthful and not called a full SIEM. `v0.80.0 implementation stop reached. Run pentest for this exact commit.`
