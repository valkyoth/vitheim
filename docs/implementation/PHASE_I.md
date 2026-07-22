# Phase I — Assets, Configuration, And Services

Scope: `0.81.0–0.90.0`. Facts retain provenance; graphs are tenant/policy aware.

## `0.81.0` — Asset Lifecycle
Status: planned. Setup: typed assets, ownership/location/cost/warranty, lifecycle, sanitization/disposal evidence. Goal: complete governed asset state. Deliverables: aggregate and inventory projections. Verification: ownership/disposal escalation, illegal states, evidence removal, duplicate identity, tenant pass. Exit criteria: irreversible actions require evidence. `v0.81.0 implementation stop reached. Run pentest for this exact commit.`

## `0.82.0` — Business And Technical Services
Status: planned. Setup: service identity/type, owner, criticality, offerings, lifecycle, tenant scope. Goal: model accountable services. Deliverables: service aggregate/catalog. Verification: owner escalation, cross-tenant linkage, false criticality, retirement with dependents, replay pass. Exit criteria: service authority is explicit. `v0.82.0 implementation stop reached. Run pentest for this exact commit.`

## `0.83.0` — Typed Relationship Graph
Status: planned. Setup: edge vocabulary, direction, cardinality, temporal validity, provenance, policy, traversal bounds. Goal: first-class safe relationships. Deliverables: relationship aggregate and graph port. Verification: unauthorized edges, cycles, hidden endpoints, duplicate/contradictory edges, exhaustion pass. Exit criteria: every edge is tenant-bound and evidenced. `v0.83.0 implementation stop reached. Run pentest for this exact commit.`

## `0.84.0` — Provenance And Confidence
Status: planned. Setup: source identity, observed/recorded times, evidence, confidence scale, expiry, trust policy. Goal: distinguish facts from assertions. Deliverables: fact envelope and provenance explanations. Verification: impersonation, confidence inflation, detached evidence, stale facts, conflicting sources pass. Exit criteria: no reconciled value loses origin. `v0.84.0 implementation stop reached. Run pentest for this exact commit.`

## `0.85.0` — Bitemporal Facts
Status: planned. Setup: valid/recorded intervals, corrections, overlap policy, ordering, query semantics. Goal: preserve what was true and known. Deliverables: bitemporal model/operators. Verification: historical rewrite, invalid/overlap intervals, clock boundaries, late facts, deterministic queries pass. Exit criteria: corrections append rather than erase history. `v0.85.0 implementation stop reached. Run pentest for this exact commit.`

## `0.86.0` — Discovery And Import Interface
Status: planned. Setup: connector identity, batches, schemas, quotas, checkpoints, deletion claims, quarantine. Goal: ingest discovery as untrusted facts. Deliverables: discovery port/import pipeline. Verification: poisoned source, oversized/deep import, replay, partial batch, forged deletion, parser fuzz pass. Exit criteria: discovery never directly overwrites authority. `v0.86.0 implementation stop reached. Run pentest for this exact commit.`

## `0.87.0` — Reconciliation Engine
Status: planned. Setup: source precedence, freshness/confidence, manual locks, conflict outcomes, explanation, versioning. Goal: deterministic fact merging. Deliverables: pure engine and decision trace. Verification: priority abuse, destructive merge, input permutations, stale/manual conflict, exhaustion properties pass. Exit criteria: every chosen value explains rejected alternatives. `v0.87.0 implementation stop reached. Run pentest for this exact commit.`

## `0.88.0` — Dependency Impact Analysis
Status: planned. Setup: admitted paths, direction, security filters, max depth/nodes/work, uncertainty. Goal: bounded pre-change impact. Deliverables: impact planner/report. Verification: cycles, hidden-node inference, path explosion, stale graph, cross-tenant edge, deterministic ranking pass. Exit criteria: reports never reveal unauthorized topology. `v0.88.0 implementation stop reached. Run pentest for this exact commit.`

## `0.89.0` — Software And License Inventory
Status: planned. Setup: software identity/version, installations, entitlements, allocations, renewals, support status, evidence. Goal: software asset management separate from hardware. Deliverables: software/entitlement aggregates and compliance projection. Verification: forged installs, entitlement leakage, duplicate allocation, version confusion, renewal boundaries pass. Exit criteria: compliance claims cite inventory and entitlement evidence. `v0.89.0 implementation stop reached. Run pentest for this exact commit.`

## `0.90.0` — Interactive Service Map
Status: planned. Setup: policy-filtered graph DTO, bounded expansion, layout data, stale markers, browser rendering. Goal: usable impact visualization. Deliverables: map API/UI and explanations. Verification: graph authorization, count/path inference, XSS, huge graph exhaustion, cache revocation, accessibility pass. Exit criteria: UI visibility equals graph policy. `v0.90.0 implementation stop reached. Run pentest for this exact commit.`

