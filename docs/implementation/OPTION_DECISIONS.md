# Pre-Production Option Decisions

Scope: `0.140.1–0.140.8`. These are evidence-producing decision releases, not
implementation shortcuts. Phase O may certify only the profiles selected here;
unselected profiles remain unsupported at `1.0.0`.

## `0.140.1` — Dependency, Cryptography, And KMS Decision

Status: planned.
Setup: inventory TLS, identity, database, WASM, crypto, timestamp, secret, and
KMS needs; compare audited implementations, maintenance, licenses, features,
unsafe/native code, replacement boundaries, and first-party risk.
Goal: resolve the global zero-dependency/production-security tension explicitly.
Deliverables: approved hosted dependency allowlist or documented blocked
features; crypto/KMS/key-rotation/timestamp profiles and adapter boundaries.
Verification: independent supply-chain and cryptographic design review proves
N0/N1 remain isolated and no protocol is improvised to avoid dependencies.
Exit criteria: Phase O has one approved, replaceable crypto/key profile.
`v0.140.1 implementation stop reached. Run pentest for this exact commit.`

## `0.140.2` — Tenant And Storage Topology Decision

Status: planned.
Setup: compare dedicated/shared tenancy for SQLite, PostgreSQL forced RLS,
MySQL database-per-tenant/composite enforcement, MongoDB partitioning, and
SurrealDB namespace/permission profiles against the same conformance suite.
Goal: select exact production storage and tenant-isolation profiles.
Deliverables: supported/rejected profile matrix, capability probes, application
and administrator threat boundaries, migration and portability consequences.
Verification: twin-tenant collision, superuser/non-owner, pooling-state,
constraint, backup/export, and fail-closed capability evidence is reviewed.
Exit criteria: weaker isolation is rejected, not relabeled supported.
`v0.140.2 implementation stop reached. Run pentest for this exact commit.`

## `0.140.3` — Identity And Session Profile Decision

Status: planned.
Setup: compare exact OIDC conformance profiles/providers, WebAuthn level and
attestation/counter policy, session stores, recovery, logout, and service identity.
Goal: freeze production authentication profiles independently of authorization.
Deliverables: selected issuer/discovery/PKCE/token/session/logout rules,
WebAuthn RP/origin/challenge/credential rules, and unsupported combinations.
Verification: protocol conformance, mix-up/replay/fixation/recovery, key rotation,
enumeration, and degraded-provider behavior are independently reviewed.
Exit criteria: production auth never falls back to the `0.40.0` test profile.
`v0.140.3 implementation stop reached. Run pentest for this exact commit.`

## `0.140.4` — Plugin Runtime And Isolation Decision

Status: planned.
Setup: compare Component Model runtimes, supported WIT/WASI level, process or
container isolation, host metering, egress proxy, update, and sandbox operations.
Goal: select a bounded plugin profile with defense in depth.
Deliverables: runtime/version pin, disabled default imports, worker identity,
OS limits, egress/DNS/TLS policy, capability-handle and upgrade decisions.
Verification: sandbox escape, metering bypass, host-call amplification, DNS
rebinding, redirect, cross-plugin/tenant, and cancellation evidence is reviewed.
Exit criteria: cryptography is not claimed to enforce resource isolation.
`v0.140.4 implementation stop reached. Run pentest for this exact commit.`

## `0.140.5` — Privacy, Retention, Evidence, And Residency Decision

Status: planned.
Setup: classify records, metadata, evidence blobs, audit, backups, indexes,
legal holds, erasure duties, residency, and conflicting jurisdictional rules.
Goal: freeze production data-lifecycle profiles before packaging.
Deliverables: retention precedence, preservation/disposition, crypto-erasure,
key ownership, deletion verification, backup expiry, and residency matrices.
Verification: hold-versus-erasure conflicts, derived copies, restored backups,
indexes/caches/exports, evidence custody, and cross-region scenarios pass review.
Exit criteria: no production data class lacks an owner and lifecycle.
`v0.140.5 implementation stop reached. Run pentest for this exact commit.`

## `0.140.6` — Deployment, HA, And Recovery Profile Decision

Status: planned.
Setup: compare modular all-in-one, split services, single-node, HA, regional,
orchestrator, package/image, authoritative-region, and recovery choices.
Goal: select the exact profiles Phase O must certify.
Deliverables: support matrix, trust/network boundaries, fencing/quorum model,
RPO/RTO, upgrade/rollback, observability, and operator responsibility decisions.
Verification: failure-mode analysis covers partitions, split brain, key/service
loss, degraded dependencies, restore, capacity, and incident operations.
Exit criteria: every `1.0.0` deployment claim maps to a Phase O test profile.
`v0.140.6 implementation stop reached. Run pentest for this exact commit.`

## `0.140.7` — API, SDK, And Publication Decision

Status: planned.
Setup: inventory external API/ABI consumers, compatibility duration, SDK scope,
registry ownership, signing/provenance, licensing, and recovery obligations.
Goal: decide whether any SDK is stable and publishable at `1.0.0`.
Deliverables: API support policy and one of: no public SDK, private SDK, or a
separately scoped MIT OR Apache-2.0 SDK allowlist with release controls.
Verification: mass-assignment/auth/version tests and registry takeover/token/
provenance/license review cover every selected publication path.
Exit criteria: all platform crates remain `publish = false`; only an explicitly
named SDK exception may change. `v0.140.7 implementation stop reached. Run pentest for this exact commit.`

## `0.140.8` — AI Production Enablement Decision

Status: planned.
Setup: compare disabled, advisory-only, and provider/model-specific profiles by
purpose, tenant, classification, residency, retention, evaluation, and contracts.
Goal: decide whether AI is disabled or supported in a bounded `1.0.0` profile.
Deliverables: approved purposes/providers/models, no-fallback rules, broker
identity/network isolation, evaluation thresholds, monitoring, and kill switch.
Verification: prompt injection, retrieval/citation leakage, provider drift,
cache partition, proposal non-execution, disable, and incident exercises pass.
Exit criteria: absence of sufficient evidence selects disabled-by-default.
`v0.140.8 implementation stop reached. Run pentest for this exact commit.`

