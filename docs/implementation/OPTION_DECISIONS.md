# Pre-Production Profile Freeze Decisions

Scope: `0.140.1–0.140.10`. These evidence-producing releases revalidate and
freeze production profiles from version-bound implementation-admission records
created at each first consuming milestone. They are never the first dependency,
protocol, backend, or runtime selection and cannot retroactively legitimize
unreviewed code. Phase O may certify only selected profiles; unselected profiles
remain unsupported at `1.0.0`.

## `0.140.1` — Dependency, Cryptography, And KMS Decision

Status: planned.
Setup: inventory TLS, identity, database, WASM, crypto, timestamp, secret, and
KMS needs; compare audited implementations, maintenance, licenses, features,
unsafe/native code, replacement boundaries, and first-party risk.
Goal: freeze the production subset of previously admitted implementations and
resolve any remaining zero-dependency/production-security conflict explicitly.
Deliverables: revalidated admission-record inventory, approved production
dependency allowlist or blocked features, crypto/KMS/key-rotation/timestamp
profiles and adapter boundaries.
Verification: independent supply-chain and cryptographic design review proves
N0/N1 remain isolated and no protocol is improvised to avoid dependencies.
Exit criteria: Phase O has one approved, replaceable crypto/key profile.
`v0.140.1 implementation stop reached. Run pentest for this exact commit.`

## `0.140.2` — Tenant And Storage Topology Decision

Status: planned.
Setup: compare dedicated/shared tenancy for SQLite, PostgreSQL forced RLS,
MySQL database-per-tenant/composite enforcement, MongoDB partitioning, and
SurrealDB namespace/permission profiles against the same conformance suite.
Goal: freeze exact production storage and tenant-isolation profiles from tested
adapters; default candidates are SQLite single-node and PostgreSQL HA.
Deliverables: supported/rejected profile matrix, capability probes, application
and administrator threat boundaries, migration and portability consequences.
Verification: twin-tenant collision, superuser/non-owner, pooling-state,
constraint, backup/export, and fail-closed capability evidence is reviewed.
Exit criteria: weaker isolation is rejected, not relabeled supported.
`v0.140.2 implementation stop reached. Run pentest for this exact commit.`

## `0.140.3` — Identity And Session Profile Decision

Status: planned.
Setup: compare exact OIDC conformance profiles/providers, WebAuthn level and
attestation/counter policy, session stores, recovery, logout, and the `0.52.1`
machine-to-machine profiles. Review `private_key_jwt`/mTLS choice, workload
token lifetime/audience/proof, credential rotation/revocation, and whether
personal access tokens or static API keys remain disabled.
Goal: revalidate and freeze production authentication profiles independently of authorization.
Deliverables: selected issuer/discovery/PKCE/token/session/logout rules,
WebAuthn RP/origin/challenge/credential rules, selected workload-auth profile,
explicit PAT/API-key/token-exchange disposition, and unsupported combinations.
Verification: protocol conformance, mix-up/replay/fixation/recovery, key rotation,
enumeration, and degraded-provider behavior are independently reviewed.
Exit criteria: production auth never falls back to the `0.40.0` test profile.
`v0.140.3 implementation stop reached. Run pentest for this exact commit.`

## `0.140.4` — Plugin Runtime And Isolation Decision

Status: planned.
Setup: compare Component Model runtimes, supported WIT/WASI level, process or
container isolation, host metering, egress proxy, update, sandbox operations,
catalog/storefront trust, publisher admission, offline mirrors, and rollout.
Goal: revalidate and freeze a bounded plugin profile with defense in depth.
Deliverables: runtime/version pin, disabled default imports, worker identity,
OS limits, egress/DNS/TLS policy, capability-handle, catalog/storefront trust,
publisher/mirror, permission-diff, connector-support, and upgrade decisions.
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
purpose, tenant, classification, residency, retention, evaluation, contracts,
and passing `0.98.1` hosted semantic-index plus `0.98.2` embedding-generator
evidence where similarity is enabled.
Goal: decide whether AI is disabled or supported in a bounded `1.0.0` profile.
Deliverables: approved purposes/providers/models, no-fallback rules, broker
identity/network isolation, evaluation thresholds, monitoring, and kill switch.
Verification: prompt injection, retrieval/citation leakage, provider drift,
cache/index partition, semantic adapter deletion/rebuild/outage, proposal non-
execution, disable, and incident exercises pass.
Exit criteria: absence of sufficient evidence selects disabled-by-default.
`v0.140.8 implementation stop reached. Run pentest for this exact commit.`

## `0.140.9` — Interchange Profile Freeze Decision

Status: planned.
Setup: inventory implemented and requested identity, vulnerability, SBOM,
threat-intelligence, logging, webhook, discovery, and document interchange
profiles plus their exact specification versions, extensions, codecs, vendor
connector profiles (including selected Microsoft Defender/Sentinel, Tenable,
and any `0.86.1` CMDB API), licenses, trust and update models. Explicitly decide
inbound versus outbound SCIM, threat-intelligence ingestion versus STIX/TAXII
publication, and whether raw log management or detection-rule authoring/testing
remains outside the product boundary.
Goal: freeze an explicit support/defer matrix rather than implying generic
standards compatibility. This milestone cannot implement a missing profile.
Deliverables: supported/deferred/rejected matrix for directional SCIM/SAML,
CVSS/VEX, SPDX/CycloneDX, STIX/TAXII ingestion/publication, authenticated
alert-bearing syslog/security webhooks, raw-log/SIEM detection features, CMDB
discovery, and any shipped profile; conformance corpora, version policy,
admission records, implementing-milestone references, and truthful
compatibility wording. Every profile without complete earlier implementation
and pentest evidence is explicitly deferred. The default `1.0.0` boundary
defers general raw-log storage/query, detection-rule authoring/execution,
outbound STIX/TAXII publication, the unselected SCIM direction, and an
unimplemented CMDB connector.
Verification: namespace/version/extension confusion, parser differentials,
downgrade, signature/source spoofing, round trips, lossiness, bombs, tenant/
policy/marking mapping, directional-role confusion, high-volume capacity
assumptions, and source-drift review pass for every selected profile.
Exit criteria: `1.0.0` names only exact independently evidenced interchange
profiles; generic family claims are forbidden. `v0.140.9 implementation stop
reached. Run pentest for this exact commit.`

## `0.140.10` — Federation Production Enablement Decision

Status: planned.
Setup: review `0.120.1–0.120.5` evidence for disabled, bilateral shared-space,
federated work exchange, and managed-service profiles; exact protocol/API/
schema versions; trust/transport; legal/controller-processor responsibilities;
residency/retention; scale; support; incident; revocation; and interoperability.
Goal: decide which, if any, federation capabilities are safe production claims.
Deliverables: enabled/disabled profile matrix, peer eligibility and trust
requirements, protocol/version pins, permitted resource/action/data classes,
deployment/network profile, joint-operations responsibilities, kill switch,
and explicit unsupported combinations.
Verification: independent cross-organization architecture review and pentest
cover malicious/compromised peers, transitive trust, tenant/RBAC/field leakage,
partitions/replay, protocol downgrade, provider delegation abuse, revocation,
offboarding, restore, erasure/hold/residency conflict, and incident exercises.
Exit criteria: federation remains disabled by default; only exact profiles with
complete bilateral evidence may enter Phase O and `1.0.0` support claims.
`v0.140.10 implementation stop reached. Run pentest for this exact commit.`
