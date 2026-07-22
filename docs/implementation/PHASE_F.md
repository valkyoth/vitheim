# Phase F — Identity, Tenancy, And Policy

Scope: `0.51.0–0.60.0`. Authentication supplies facts; policy grants authority.

## `0.51.0` — Formal Tenant Isolation Model
Status: planned. Setup: inventory every storage/cache/index/queue/blob/log/metric
boundary and make tenant context non-optional. Goal: prevent cross-tenant effects.
Deliverables: tenant types, partition contracts, isolation test harness.
Verification: confused IDs, omitted filters, cache keys, jobs, exports, backups,
and timing/count inference pass. Exit criteria: every interface proves isolation. `v0.51.0 implementation stop reached. Run pentest for this exact commit.`

## `0.52.0` — Subjects And Service Principals
Status: planned. Setup: define human/service/device identities, issuer binding,
lifecycle, credentials facts, and impersonation prohibition. Goal: stable actor identity.
Deliverables: subject model, identity mapping, disable/revoke events. Verification:
issuer collision, account recreation, stale/disabled identity, spoofing, and audit pass.
Exit criteria: actor origin and lifecycle are explicit. `v0.52.0 implementation stop reached. Run pentest for this exact commit.`

## `0.53.0` — OIDC And WebAuthn Integration
Status: planned; audited protocol implementation required. Setup: pin issuer,
audience, algorithms, keys, nonce/state, redirect, session, and credential policy.
Goal: strong hosted authentication without granting authorization. Deliverables:
identity adapter, WebAuthn flows, session lifecycle. Verification: token/key/alg
confusion, replay, fixation, downgrade, phishing origins, and revocation pass.
Exit criteria: invalid or stale authentication fails closed. `v0.53.0 implementation stop reached. Run pentest for this exact commit.`

## `0.54.0` — Directory And Group Synchronization
Status: planned. Setup: define source authority, external IDs, delta/full sync,
deletion, conflict, quarantine, and privilege review. Goal: safe directory facts.
Deliverables: sync port, reconciliation, staged activation, audit report.
Verification: group takeover, stale privilege, deletion/recreation, replayed delta,
oversized sync, and tenant tests pass. Exit criteria: source changes cannot silently escalate rights. `v0.54.0 implementation stop reached. Run pentest for this exact commit.`

## `0.55.0` — RBAC Engine
Status: planned. Setup: define role/capability/scope, inheritance, separation,
deny precedence, versions, and explanation. Goal: deterministic deny-by-default roles.
Deliverables: pure evaluator, validated role graph, decision trace. Verification:
cycles, hidden grants, scope confusion, stale role, escalation, and property tests pass.
Exit criteria: every permit cites the exact role path. `v0.55.0 implementation stop reached. Run pentest for this exact commit.`

## `0.56.0` — ABAC Engine
Status: planned. Setup: define typed attributes, provenance/freshness, operators,
missing/unknown behavior, obligations, and budgets. Goal: contextual policy without fail-open ambiguity.
Deliverables: policy model/evaluator/compiler and explanation. Verification:
missing/type-confused/stale facts, expression bombs, precedence, nondeterminism,
and differential tests pass. Exit criteria: unknown facts never imply permit. `v0.56.0 implementation stop reached. Run pentest for this exact commit.`

## `0.57.0` — Relationship-Based Authorization
Status: planned. Setup: define admitted edge types, direction, depth/work bounds,
security labels, freshness, and explanation paths. Goal: authorize ownership/delegation graphs safely.
Deliverables: graph policy operator and bounded path proof. Verification: forged
edges, malicious cycles, hidden-node inference, path explosion, stale ownership,
and tenant tests pass. Exit criteria: permits include a visible bounded proof. `v0.57.0 implementation stop reached. Run pentest for this exact commit.`

## `0.58.0` — Field Redaction And Obligations
Status: planned. Setup: classify fields, derived values, snippets, counts, caches,
exports, and obligation enforcement points. Goal: preserve field policy end to end.
Deliverables: redaction engine, typed visible DTOs, obligation executor.
Verification: API/search/report/export/notification/cache/AI leakage, derived inference,
and revocation pass. Exit criteria: hidden data cannot reappear downstream. `v0.58.0 implementation stop reached. Run pentest for this exact commit.`

## `0.59.0` — Delegation And Break-Glass Access
Status: planned. Setup: require scope, reason, approver, owner, start/expiry,
notification, monitoring, and revocation. Goal: exceptional access without permanent privilege.
Deliverables: exception aggregate, challenge/approval workflow, heightened audit.
Verification: self-approval, broad scope, non-expiry, replay, hidden use, stale session,
and revocation tests pass. Exit criteria: every exception is bounded and visible. `v0.59.0 implementation stop reached. Run pentest for this exact commit.`

## `0.60.0` — Authorization Conformance Suite
Status: planned. Setup: enumerate every command/read/field/search/export/blob/
workflow interface and role/attribute/relationship combination. Goal: prove equivalent policy everywhere.
Deliverables: generated matrix, negative corpus, coverage/evidence report.
Verification: mutation and read parity, tenant pairs, stale policy, cache/index lag,
break-glass, and differential adapters pass. Exit criteria: no uncovered authority-bearing interface remains. `v0.60.0 implementation stop reached. Run pentest for this exact commit.`

