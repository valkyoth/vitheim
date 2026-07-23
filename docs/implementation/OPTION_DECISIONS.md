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
Map local transaction domains for aggregate streams, redemption guards, effect
work bundles, dispatch-authority fence rows, quota partitions, and hierarchical
capacity leases. Map target owners and authoritative `DispatchTargetFence` rows
with the effect bundle, including same-aggregate expected-version handling.
Reject any profile that needs remote, cross-shard, or projection-only current-
target semantics or a cross-shard/region distributed work transaction. Compare
capacity-transfer outbox/inbox placement and receipt semantics without accepting
a distributed exactly-once delivery claim.
Goal: freeze exact production storage, tenant-isolation, and local transaction-
domain profiles from tested adapters; default candidates are SQLite single-node
and PostgreSQL HA.
Deliverables: supported/rejected profile matrix, capability probes, application
and administrator threat boundaries, transaction-domain/co-location map,
active/active rejection evidence, migration and portability consequences.
Verification: twin-tenant collision, superuser/non-owner, pooling-state,
constraint, non-co-located grant guard/effect bundle, cross-partition claim set,
missing/non-co-located authority fence, stale/duplicated capacity lease,
missing/non-co-located target fence, target owner/fence/effect split, remote or
projection-only current target, distributed-exactly-once transfer claim,
advertised active/active authoritative writes, backup/export, and fail-closed
capability evidence is reviewed.
Exit criteria: weaker isolation, unavailable co-location, and any topology that
requires a distributed work transaction are rejected, not relabeled supported.
`v0.140.2 implementation stop reached. Run pentest for this exact commit.`

## `0.140.3` — Identity And Session Profile Decision

Status: planned.
Setup: compare exact OIDC conformance profiles/providers, WebAuthn level and
attestation/counter policy, session stores, recovery, logout, and the `0.52.1`
machine-to-machine profiles. Review `private_key_jwt`/mTLS choice, workload
token lifetime/audience/proof, exact sender-constraint profile, privileged
workload requirements, any restricted-bearer action matrix, external issuer/
key rotation and revocation, replay-cache limitations, authentication-assurance
expiry/freshness at interactive dispatch, assurance captured when an approval
creates `ApprovedExecutionGrant`, current service-principal proof at automation
dispatch, and the separate local-agent enrollment profile. Freeze the rule that
a worker authenticates as itself and never impersonates an offline approver;
normal approver-session expiry does not invalidate a valid grant, while the
grant's exact current revocation/revalidation rules remain mandatory. Confirm
that privileged dispatch uses co-located authoritative local subject/principal,
session/credential/mapping revocation epochs; any external-only bounded-
staleness profile is classified and unsupported for privileged
`CommitAndDispatch` effects. Also confirm that Vitheim remains an OAuth resource
server, stores no client private credentials, exposes no token
endpoint, and keeps personal access tokens/static API keys disabled.
Goal: revalidate and freeze production authentication profiles independently of authorization.
Deliverables: selected issuer/discovery/PKCE/token/session/logout rules,
WebAuthn RP/origin/challenge/credential rules, selected workload-auth profile,
external-issuer trust and mapping rules, separate agent-enrollment rules,
sender-constrained privileged profile, any lower-assurance restricted-bearer
profile, explicit no-authorization-server/PAT/API-key/token-exchange
disposition, live-subject/service-principal/grant assurance mapping, local
revocation-epoch/staleness profile, and unsupported combinations. Any
future Vitheim OAuth authorization server
requires a new implementation milestone and cannot be selected here.
Verification: protocol conformance, mix-up/replay/fixation/recovery, false
sender constraint, proof/token substitution, bearer privilege escalation,
first-use stolen bearer behavior, effect dispatch after credential/session/
assurance expiry or revocation, valid scheduled grant after approver-session
expiry, authority-epoch change racing dispatch, stale/substituted epoch,
bounded-stale external authority used for privileged work, offline-human
impersonation, grant assurance substitution, key rotation, enumeration, and
degraded-provider behavior are independently reviewed.
Exit criteria: production auth never falls back to the `0.40.0` test profile.
`v0.140.3 implementation stop reached. Run pentest for this exact commit.`

## `0.140.4` — Plugin Runtime And Isolation Decision

Status: planned.
Setup: compare Component Model runtimes, supported WIT/WASI level, process or
container isolation, host metering, egress proxy, update, sandbox operations,
catalog/storefront trust, publisher admission, offline mirrors, rollout, and
the invariant that plaintext credentials never enter Wasm guest memory. Freeze
the broker profile that enforces immutable effect bindings, mandatory current
dispatch authorization for high-risk capabilities, service-principal or exact
approved-grant redemption, bounded typed quota claim sets and settlement, and
denial of plugin access to control-plane emergency reserve. Freeze provider-
mutation profiles: admitted strong conditional mechanisms and validator
semantics, explicit unsupported cases, and narrowly reviewed unconditional
exceptions. A plugin cannot refresh a validator, weaken a profile, or represent
provider concurrency as a local target fence.
Goal: revalidate and freeze a bounded plugin profile with defense in depth.
Deliverables: runtime/version pin, disabled default imports, worker identity,
OS limits, egress/DNS/TLS policy, capability-handle, catalog/storefront trust,
host-brokered authenticated HTTP/signing/token/certificate operations,
publisher/mirror, permission-diff, connector-support, effect-dispatch gate,
grant/service-principal redemption, quota-claim/recovery-reserve isolation, and
remote-target conditional-write/precondition-outcome gate, and upgrade
decisions.
Verification: sandbox escape, metering bypass, host-call amplification, DNS
rebinding, redirect, cross-plugin/tenant, guest-memory secret canaries, broker
confused-deputy/target substitution, stale dispatch authority, quota/refund/
cross-kind settlement/reserve abuse, grant replay/impersonation, and cancellation
evidence is reviewed; include provider/account/resource/validator substitution,
weak/strong and ABA confusion, ignored/downgraded conditional writes, silent
refresh, response-loss ambiguity, and unconditional-exception misuse.
Exit criteria: cryptography is not claimed to enforce resource isolation.
`v0.140.4 implementation stop reached. Run pentest for this exact commit.`

## `0.140.5` — Privacy, Retention, Evidence, And Residency Decision

Status: planned.
Setup: classify records, metadata, evidence blobs, audit, backups, indexes,
legal holds, erasure duties, residency, and conflicting jurisdictional rules;
review the complete `0.51.2` tenant data-surface registry including customer
measurements/rollups, paging/status receipts, vectors/embeddings, plugin state,
AI artifacts, federation projections, and connector checkpoints. Freeze an
explicit precedence matrix distinguishing legal hold, mandatory erasure,
maximum retention, tenant closure, contractual preservation, and discretionary
rollup-substitution expiry; preservation of historical SLO authority cannot
override mandatory deletion. Independently decide disposition for raw
observations, rollup payloads, source manifests, derived SLO/error-budget
results, projections/caches, exports, and linkable checkpoint metadata; no
related surface inherits another surface's permission to survive.
Goal: freeze production data-lifecycle profiles before packaging.
Deliverables: normative retention-precedence matrix, preservation/disposition,
mandatory-deletion-with-authority-loss procedure, crypto-erasure, key ownership,
deletion verification, backup expiry, residency matrices, and a zero-missing-
surface registry report with typed external-copy evidence strengths and
closure-policy results; include a related-surface disposition matrix, per-
surface evidence, and allowed non-sensitive tombstone/authority-loss schema.
Verification: hold-versus-erasure conflicts, derived copies, restored backups,
indexes/caches/exports/external copies, authoritative measurement rollups,
evidence custody, false equivalence between local proof/provider attestation/
unconfirmed request/unverifiable plaintext, missing rollup proof during
mandatory deletion, unlawful retention for availability reporting, tenant
closure, rollup retention inherited from raw disposition, omitted manifest/
result/cache/export/checkpoint-metadata decision, sensitive tombstone, partial
derived cleanup, and cross-region scenarios pass review.
Exit criteria: no production data class or tenant-bearing surface lacks an
owner, lifecycle, typed disposition state, and policy result; accepted residual
uncertainty remains explicit and is never described as verified erasure.
Mandatory deletion proceeds even when doing so makes historical results
unknown, with independently evaluated disposition evidence for every related
surface and immutable non-sensitive evidence of the precedence decision and
authority loss.
`v0.140.5 implementation stop reached. Run pentest for this exact commit.`

## `0.140.6` — Deployment, HA, And Recovery Profile Decision

Status: planned.
Setup: compare modular all-in-one, split services, single-node, HA, regional,
orchestrator, package/image, authoritative-region, and recovery choices. Every
profile must preserve the single-use dispatch-authorization gate, current
policy/identity/delegation/tenant/target reads, typed execution-authority
redemption, exactly one authoritative stream per grant lineage, bounded multi-
kind quota transition atomicity with quota state as co-transactional local
authority rather than another aggregate, and tenant/work-class partitioned fair
reconciliation/security-cleanup capacity with a scoped emergency reserve;
redemption uses a co-located fenced `GrantRedemptionGuard` so dispatch advances
only the effect stream. Dispatch also locks a bounded complete
`DispatchAuthorityFenceSet` of applicable monotonic local epochs. Every quota
set is local to its work transaction;
global/regional limits allocate fenced hierarchical capacity leases into local
partitions while retaining per-kind encumbrances after lease expiry. Every
composite transaction uses the canonical acquisition order and bounded
identity-preserving deadlock retry. Topology may tune capacity and consistency
implementation but may
not omit these controls or introduce a distributed work transaction. The
`1.0.0` profile supports one authoritative write region per transaction domain
with fenced failover; active/active authoritative multi-region writes are
explicitly unsupported.
Goal: select the exact profiles Phase O must certify.
Deliverables: support matrix, trust/network boundaries, fencing/quorum model,
dispatch-authorization consistency/failure model, quota consumption/refund
and per-kind settlement mapping, canonical all-or-none claim-set reservation/
exact-token consumption profile, grant ownership plus inline/dedicated issuance/
revocation/successor behavior, redemption-guard placement/claim/receipt model,
authority-fence source/update/co-location/staleness profile, canonical composite
lock order/deadlock-retry policy, target-fence owner/update/co-location/
lifecycle/deletion/supersession profile,
remote-target concurrency profile with exact provider/version, validator
strength/ABA properties, conditional request mapping, precondition outcome,
idempotency/query/reconciliation behavior, and reviewed unconditional exceptions,
quota partition map and hierarchical capacity-lease allocation/reclamation/
per-kind encumbrance/transfer/late-settlement conservation profile, including
stable transfer ID, source/destination epochs, outbox/inbox receipts,
authenticated acknowledgement, old-epoch fence proof, conservative double-
entry recovery, original lineage, immutable accounting owner/hierarchy root/
parent lease/period/work or recovery lane/capacity class/residency/region, and
source/destination authorization decisions,
active/active rejection/capability behavior, per-tenant/
global fair-share and starvation policy, emergency-reserve sizing/isolation,
RPO/RTO, upgrade/rollback, observability, and operator responsibility decisions.
Verification: failure-mode analysis covers partitions, split brain, key/service
loss, policy/delegation revocation during dispatch, stale/forged dispatch
receipts, grant replay/offline-human impersonation, duplicate refunds, cross-
kind settlement, approval/grant crash-reorder-revocation/successor races,
revocation/final-attempt claim race, crash-after-claim recovery, claim/receipt
substitution, consumed-attempt restore, grant/effect two-stream mutation,
tenant/subject/session/delegation/policy/principal revocation races, incomplete
or stale fence sets, epoch reuse, external-staleness misuse, composite lock-
order inversion and retry identity drift/exhaustion,
overlapping-set deadlock/livelock, partial reservation/restore, token/digest/
membership substitution, cross-partition claim sets, hierarchical lease
over-allocation, expiry with persistent per-kind encumbrance, child loss, late
settlement, every transfer crash/duplicate/reorder/lost-ack/source-destination-
failover/stale-epoch/conflict point, forbidden free-at-both-ends state, target
deletion/merge/migration/supersession/restore race, stale projection, cross-
shard target placement, missing/non-co-located target fence, reclamation/
failover race, remote validator/account/resource substitution, weak/strong/ABA
confusion, ignored or downgraded conditional writes, unsafe refresh,
precondition/response-loss misclassification, transfer owner/root/parent/period/
lane/class/region/authorization substitution, emergency/security-cleanup-to-
business reclassification, incompatible
active/active topology,
provider-outage tenant exhaustion, one-tenant unknown-outcome floods, per-
tenant/global starvation, emergency-reserve borrowing, degraded dependencies,
restore, capacity, and incident operations.
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
