# Phase H — Alerts And Security Operations

Scope: `0.71.0–0.80.0`. Sources authenticate; parsing and correlation remain bounded and explainable.

## `0.71.0` — Authenticated Alert Ingestion
Status: planned. Setup: source identities, signatures/tokens, replay windows, schemas, quotas, tenant routing. Goal: trustworthy bounded intake. Deliverables: ingest protocol/port and receipts. Verification: spoof/replay/flood, wrong tenant, key rotation, malformed framing, backpressure pass. Exit criteria: unauthenticated alerts never enter authority. `v0.71.0 implementation stop reached. Run pentest for this exact commit.`

## `0.72.0` — Alert Normalization
Status: planned. Setup: canonical alert fields, source/raw evidence, mappings, limits, unknown-field policy. Goal: normalize without losing provenance. Deliverables: mapper/compiler and normalized model. Verification: parser confusion, smuggling, coercion, oversized/deep input, mapping version, fuzz pass. Exit criteria: normalized facts remain traceable. `v0.72.0 implementation stop reached. Run pentest for this exact commit.`

## `0.73.0` — Deduplication Engine
Status: planned. Setup: identity keys, windows, collision handling, evidence merge, versioning, budgets. Goal: reduce repeats without losing distinct incidents. Deliverables: deterministic engine and explanation. Verification: collision abuse, boundary windows, order permutations, evidence loss, cross-tenant keys, properties pass. Exit criteria: every merge is explainable/reversible. `v0.73.0 implementation stop reached. Run pentest for this exact commit.`

## `0.74.0` — Suppression And Maintenance Windows
Status: planned. Setup: authority, scope, reason, schedule, expiry, caps, visibility, override. Goal: controlled noise reduction. Deliverables: suppression aggregate/evaluator and audit. Verification: overbroad/immortal suppression, timezone abuse, self-approval, hidden active rules, bypass pass. Exit criteria: suppressed alerts remain evidenced. `v0.74.0 implementation stop reached. Run pentest for this exact commit.`

## `0.75.0` — Topology And Temporal Correlation
Status: planned. Setup: admitted edges, time windows, confidence, scoring, traversal/work limits, explanation. Goal: group related alerts safely. Deliverables: pure correlation planner/engine. Verification: poisoning, graph cycles, hidden-node inference, order dependence, exhaustion, differential fixtures pass. Exit criteria: correlations cite bounded evidence. `v0.75.0 implementation stop reached. Run pentest for this exact commit.`

## `0.76.0` — Alert-To-Incident Orchestration
Status: planned. Setup: creation/link thresholds, policy, rate limits, idempotency, feedback-loop guards. Goal: automate cases without flooding or unauthorized links. Deliverables: orchestration workflow and audit trace. Verification: storms, duplicate creation, malicious linking, suppressed alerts, races, rollback pass. Exit criteria: every incident/link has policy evidence. `v0.76.0 implementation stop reached. Run pentest for this exact commit.`

## `0.77.0` — Security-Incident Domain
Status: planned. Setup: classification, containment authority, evidence visibility, roles, lifecycle, regulatory flags. Goal: typed response cases. Deliverables: aggregate, activities, workspace projections. Verification: containment escalation, evidence leaks, role takeover, closure bypass, tenant/replay pass. Exit criteria: sensitive actions require explicit capability. `v0.77.0 implementation stop reached. Run pentest for this exact commit.`

## `0.78.0` — Vulnerability Findings And Remediation
Status: planned. Setup: scanner/source identity, asset evidence, scoring versions, dedup, acceptance, remediation. Goal: trustworthy vulnerability cases. Deliverables: finding/remediation aggregates and importer. Verification: spoofing, score tamper, stale findings, cross-asset/tenant links, false closure, parser fuzz pass. Exit criteria: risk changes retain source and authority. `v0.78.0 implementation stop reached. Run pentest for this exact commit.`

## `0.79.0` — Forensic Timeline And Evidence Custody
Status: planned. Setup: immutable evidence ID/digest, acquisition actor/time/tool, transfer, access, export. Goal: preserve chain of custody. Deliverables: evidence aggregate, timeline, custody report. Verification: timestamp tamper, substitution, custody gaps, unauthorized view/export, clock conflict, restore pass. Exit criteria: evidence lineage is complete or explicitly incomplete. `v0.79.0 implementation stop reached. Run pentest for this exact commit.`

## `0.80.0` — Integrated SecOps Workspace
Status: planned. Setup: pin current schemas/policies, source integrations, migrations, and representative attacks. Goal: prove integrated alert-to-response behavior. Deliverables: workspace, runbooks, operational evidence. Verification: cross-source/tenant leaks, authorization/search/export parity, load, recovery, upgrade, full phase pentest pass. Exit criteria: SecOps scope is truthful and not called a full SIEM. `v0.80.0 implementation stop reached. Run pentest for this exact commit.`

