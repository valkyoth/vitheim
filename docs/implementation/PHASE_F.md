# Phase F — Identity, Tenancy, And Policy

Scope: `0.51.0–0.60.0`. Authentication supplies facts; policy grants authority.

## `0.51.0` — Formal Cross-Surface Tenant Assurance
Status: planned. Setup: audit the structural tenant model already required since
`0.2.0` across storage/cache/index/queue/blob/log/metric/export/backup and admin
boundaries. Goal: formally demonstrate, not introduce, tenant isolation.
Deliverables: proof inventory, partition contracts, adversarial twin-tenant harness.
Verification: confused IDs, omitted filters, cache keys, jobs, exports, backups,
and timing/count inference pass. Exit criteria: every interface proves isolation. `v0.51.0 implementation stop reached. Run pentest for this exact commit.`

## `0.51.1` — Tenant Lifecycle And Topology Migration

Status: planned.

Setup: define provision, activate, suspend, resume, export, legal hold, close,
delete, key destroy, identifier non-reuse, backup/index/cache cleanup, residency/
storage topology migration, approval, retry, and recovery states.

Goal: make the complete tenant lifecycle a governed aggregate rather than
administrator scripts or scattered storage flags.

Deliverables: tenant-lifecycle commands/events, process manager, cleanup proof
ledger, migration plan/checkpoints, hold/erasure conflict policy, initial
data-surface inventory hook for the `0.51.2` registry, and runbook.

Verification: ID reuse, suspend bypass, partial provisioning/deletion, held
tenant deletion, stale cache/index/backup/blob, key destruction order, topology
rollback, concurrent admin, cross-tenant migration, and restore tests pass.

Exit criteria: tenant closure either has complete verified disposition evidence
or remains visibly incomplete and recoverable. `v0.51.1 implementation stop
reached. Run pentest for this exact commit.`

## `0.51.2` — Tenant Data-Surface Lifecycle Registry

Status: planned.

Setup: generate a separate registry for every tenant-bearing durable, cached,
indexed, backed-up, or externally copied surface. Each entry declares structural
tenant key, data classes and accountable owner, authoritative/derived/external
status, export behavior, retention and legal-hold behavior, erasure/deletion
semantics, backup/restore handling, residency/replication, key ownership and
destruction, rebuild capability, tenant-topology migration, and cleanup proof.
Inventory all earlier surfaces including event/audit journals and projections,
blobs, queues, customer measurements and rollups, paging/delivery receipts,
hosted status, and caches.

Goal: make tenant lifecycle coverage mechanically complete as the platform adds
new storage and external-copy paths.

Deliverables: generated `TenantDataSurface` descriptor registry, compile/
registration gate, lifecycle-operation planner, per-surface disposition
receipts, completeness report, closure blocker, and adapter conformance API.
The authorization-interface registry and this lifecycle registry remain
distinct and cross-reference surfaces where applicable.

Verification: missing/duplicate surface registration, omitted tenant key or
data class, false derived/rebuild claim, export/hold/erasure conflict, stale
backup/index/cache/external copy, residency mismatch, wrong key destruction,
topology migration omission, cleanup-receipt forgery, restore resurrection, and
late registration tests pass.

Exit criteria: every existing tenant data surface has a complete lifecycle
entry and tested disposition path. Every later milestone that adds or changes a
surface is mechanically unable to exit until it updates this registry, and
tenant closure remains visibly incomplete while any registered surface lacks
verified disposition evidence.
`v0.51.2 implementation stop reached. Run pentest for this exact commit.`

## `0.52.0` — Subjects And Service Principals
Status: planned. Setup: define human/service/device identities, issuer binding,
lifecycle, credential facts, and impersonation prohibition. Define an
external-identity-link aggregate keyed only by compound issuer plus immutable
external subject ID; never auto-link email, display name, or mutable username.
Specify controlled JIT provisioning, OIDC/SAML/SCIM correlation, reviewable
merge/split/unlink and IdP-migration operations, deprovision-versus-login race
policy, identity recreation protection, and complete provenance/audit history.
Goal: stable actor identity without unsafe account correlation. Deliverables:
subject model, external-identity-link aggregate, mapping/review workflows,
disable/revoke events, migration tooling, and explanation view. Verification:
issuer collision, email/name collision, account recreation, JIT/group
escalation, merge/split/unlink abuse, IdP migration takeover, concurrent
deprovision/login, stale/disabled identity, spoofing, and audit pass.
Exit criteria: actor origin and lifecycle are explicit, and every external link
is immutable-keyed, reviewable, reversible where permitted, and provenance
complete.
`v0.52.0 implementation stop reached. Run pentest for this exact commit.`

## `0.52.1` — OAuth Resource-Server Workload Authentication

Status: planned as an OAuth resource-server profile; blocked until the exact
token-validation/mTLS/TLS implementations and external-issuer conformance
profile are admitted. Vitheim does not operate an OAuth authorization server or
token endpoint for `1.0.0`. Personal access tokens and static API keys are
disabled.

Setup: select an admitted external authorization server where clients use its
supported client-credentials authentication, such as `private_key_jwt` and/or
mutual TLS. Vitheim validates short-lived access-token issuer, audience, tenant,
immutable external subject-to-`ServicePrincipalId` link, token type, time,
scope, key/signature, and certificate/proof binding where selected. Define
external issuer/key rotation and compromise response, mapping disable/revoke,
policy re-evaluation, replay restrictions, and connector workload identities.
Vitheim stores public validation material and external identity mappings, never
client private credentials. Token issuance, client registration secrets, token
exchange, delegation, impersonation, refresh tokens, and local OAuth grants are
out of scope. Local agent enrollment remains the separate `0.119.0` device/
workload credential protocol. Email, display name, certificate subject, DNS
name, client name, or external account name is never stable principal identity.

Goal: authenticate API automation, hosted workers, and connectors as governed
service principals without reusing browser sessions, implementing token
issuance, or turning authentication into authorization. Local agents adopt
their service-principal mapping only through the later enrollment protocol.

Deliverables: resource-server workload-auth contract and validation adapter,
external issuer/trust registry, service-principal link lifecycle, mTLS/proof
binding, validation and replay controls, compromise/revocation workflow,
conformance corpus, fake external issuer/client, operator tooling, and explicit
no-token-endpoint/disabled-feature matrix.

Verification: issuer/client/principal/tenant confusion, forged assertion, key/
algorithm/token-type confusion, bearer replay, audience/scope inflation,
certificate remapping, display-name collision, accidental token endpoint or
private-client-key storage, token exchange/refresh misuse, stale policy/mapping,
issuer key rotation/rollback, revocation lag, connector impersonation, clock
abuse, issuer outage, and resource-server conformance tests pass.

Exit criteria: each workload request resolves to one immutable tenant-bound
service principal, current issuer/token/mapping and assurance profile;
authorization is independently reevaluated and no local token issuer or static
secret is silently enabled. `v0.52.1
implementation stop reached. Run pentest for this exact commit.`

## `0.53.0` — OIDC Integration
Status: planned; blocked until this milestone admits an audited OIDC/client/TLS
implementation and exact conformance profile. Setup: pin an exact
OIDC conformance profile covering discovery, issuer/JWKS rotation, exact redirect
matching, authorization code plus PKCE, state/nonce, mix-up defenses, token type,
algorithm, `iss`/`aud`/`azp`/time checks, session rotation, logout, and revocation.
Goal: strong hosted authentication without granting authorization. Deliverables:
OIDC identity adapter and session lifecycle. Verification: token/key/algorithm
confusion, replay, fixation, mix-up, redirect, rotation, logout and revocation pass.
Exit criteria: invalid or stale authentication fails closed. `v0.53.0 implementation stop reached. Run pentest for this exact commit.`

## `0.53.1` — WebAuthn Profile And Credential Lifecycle
Status: planned; blocked until this milestone admits an audited WebAuthn
implementation. Setup: pin the exact WebAuthn specification/profile, RP ID,
origins, single-use challenges, user presence/verification, attestation,
counter, backup eligibility/state, recovery, revocation, and enumeration policy.
Goal: review WebAuthn independently from OIDC rather than over-bundle protocols.
Deliverables: credential ceremonies/lifecycle, conformance fixtures, and recovery
runbook. Verification: origin/RP confusion, challenge replay, cloned counters,
backup-state transitions, account enumeration, recovery and downgrade pass.
Exit criteria: unsupported authenticators or states fail closed. `v0.53.1
implementation stop reached. Run pentest for this exact commit.`

## `0.53.2` — Distributed Session Store

Status: planned; blocked until its exact hosted client/TLS/server profile and
implementation-admission record are approved.

Setup: define opaque session ID/digest, tenant/subject binding, creation and
absolute/idle expiry, rotation, revocation, logout, credential/policy version,
device context, concurrent limits, encryption, cache behavior, HA consistency,
cleanup, and outage policy.

Goal: provide multi-node sessions without bearer-state confusion or local-memory
affinity.

Deliverables: session-store semantic port, memory fake, PostgreSQL reference
adapter, optional admitted hosted-cache adapter, cleanup/revocation protocol,
capability probes, and operator evidence.

Verification: fixation, guessing, replay, rotation race, stale credential/policy,
logout propagation, cross-tenant collision, node failover, partition, eviction,
clock shift, store outage, cleanup, and restore tests pass.

Exit criteria: every supported HA node observes revocation within the documented
fail-closed bound. `v0.53.2 implementation stop reached. Run pentest for this exact commit.`

## `0.53.3` — SAML Identity Profile And Adapter

Status: planned only for an intended production SAML profile; otherwise it is
explicitly deferred at `0.140.9`. Implementation is blocked until exact SAML/
XML signature/encryption/client dependencies, conformance profile, maintenance,
licenses, unsafe/native code, and cryptographic review are admitted.

Setup: pin IdP/SP entity IDs and metadata, trust/signing/encryption keys,
metadata refresh/rotation, binding, ACS/destination, audience/recipient,
request/response correlation, assertion IDs/replay cache, issue/condition/
session times, authentication context, NameID/attribute mapping, RelayState,
logout/revocation, tenant routing, and error privacy.

Goal: support a narrowly specified enterprise SAML authentication profile
without generic XML/SAML acceptance or authorization claims.

Deliverables: SAML identity adapter, hardened bounded XML boundary, metadata/
key lifecycle, assertion validation and replay store, mapping rules,
conformance corpus, negative fixtures, and operator runbook.

Verification: XML signature wrapping, entity expansion/bombs, algorithm/key
confusion, unsigned/partially signed content, destination/audience/recipient
mix-up, assertion/request replay, RelayState injection, clock abuse, metadata
rollback, tenant/IdP confusion, account linking, logout, and fuzzing pass.

Exit criteria: only the exact admitted SAML profile authenticates, supplies
versioned identity facts, and never grants authorization. `v0.53.3
implementation stop reached. Run pentest for this exact commit.`

## `0.54.0` — Directory And Group Synchronization
Status: planned. Setup: define source authority, external IDs, delta/full sync,
deletion, conflict, quarantine, and privilege review. Goal: safe directory facts.
Deliverables: sync port, reconciliation, staged activation, audit report.
Verification: group takeover, stale privilege, deletion/recreation, replayed delta,
oversized sync, and tenant tests pass. Exit criteria: source changes cannot silently escalate rights. `v0.54.0 implementation stop reached. Run pentest for this exact commit.`

## `0.54.1` — SCIM Provisioning Profile And Adapter

Status: planned only for an intended production SCIM profile; otherwise it is
explicitly deferred at `0.140.9`. Hosted HTTP/TLS/client implementation requires
its own admission record.

Setup: choose exactly one direction before implementation. The default
candidate is an inbound Vitheim SCIM service that receives provisioning facts;
an outbound SCIM client is a distinct alternative, not additional implicit
scope. Pin exact SCIM specification/profile, base URL and tenant, `0.52.1`
workload identity, user/group resource schemas and extensions, external IDs,
ETags, filters, sorting/pagination, PATCH/bulk support policy, active/deleted
states, delta/full reconciliation, rate limits, retry/idempotency, and error
privacy.

Goal: implement standards-based directory provisioning through the guarded
`0.54.0` synchronization lifecycle rather than direct role mutation.

Deliverables: one SCIM server or client profile as selected, bounded codec/
filter parser, mapping and quarantine rules, cursor/reconciliation state,
conformance corpus, fake peer, capability report, deployment runbook, and an
explicit non-claim for the opposite direction.

Verification: tenant/base-URL confusion, SSRF, token leakage, external-ID
collision, filter/operator injection, PATCH path confusion, group-cycle/takeover,
delete/recreate, stale ETag, pagination/bulk bombs, replay, partial batch,
schema-extension drift, and parser fuzzing pass.

Exit criteria: SCIM changes remain staged external identity/group facts and
cannot silently create Vitheim roles or capabilities. `v0.54.1 implementation
stop reached. Run pentest for this exact commit.`

## `0.55.0` — RBAC Engine
Status: planned. Setup: define platform, tenant, workspace, shared-space, and
resource role/capability scopes; custom role templates, inheritance,
separation-of-duties, explicit deny precedence, assignment provenance, expiry,
versions, and explanation. Layouts, dashboards, navigation, saved views, and
plugin installation never grant capabilities. Goal: deterministic deny-by-
default roles across API and UI composition.
Deliverables: pure evaluator, validated role graph, built-in least-authority
role templates, custom-role compiler, effective-access explanation, and decision
trace. Verification: cycles, hidden grants, scope confusion, dashboard/action
discovery leaks, shared-space escalation, stale/expired roles, unsafe custom
roles, assignment races, and property tests pass.
Exit criteria: every permit cites the exact role path. `v0.55.0 implementation stop reached. Run pentest for this exact commit.`

## `0.56.0` — ABAC Engine
Status: planned. Setup: define one policy decision request containing tenant,
subject, action, resource, field set, purpose, environment and policy version;
define typed fact provenance/freshness, operators, missing/unknown behavior,
obligations, and budgets. Goal: contextual policy without fail-open ambiguity.
Deliverables: policy model/evaluator/compiler and `Deny`, `Permit`, or
`PermitWithObligations` explanation—never a context-free boolean. Verification:
missing/type-confused/stale facts, expression bombs, precedence, nondeterminism,
and differential tests pass. Exit criteria: unknown facts never imply permit. `v0.56.0 implementation stop reached. Run pentest for this exact commit.`

## `0.56.1` — Policy Lifecycle, Bootstrap, And Recovery

Status: planned.

Setup: define draft, static validation, simulation, independent review,
activation, rollback, expiry, separation of duties, immutable versions, safe
bootstrap/root recovery, lockout detection, emergency rollback, and evidence.

Goal: govern policy changes with the same rigor as domain changes and prevent
irrecoverable authorization lockout.

Deliverables: policy-set aggregate, simulation/impact report, approval-bound
activation command, rollback plan, bootstrap ceremony, and recovery runbook.

Verification: self-approval, stale simulation, signature/version substitution,
unsafe default allow, owner lockout, recovery abuse, rollback downgrade,
concurrent activation, and policy-cache invalidation pass.

Exit criteria: active policy always identifies a reviewed version and a tested
least-authority recovery path. `v0.56.1 implementation stop reached. Run pentest for this exact commit.`

## `0.57.0` — Relationship-Based Authorization
Status: planned. Setup: define admitted edge types, direction, depth/work bounds,
security labels, freshness, and explanation paths. Goal: authorize ownership/delegation graphs safely.
Deliverables: graph policy operator and bounded path proof. Verification: forged
edges, malicious cycles, hidden-node inference, path explosion, stale ownership,
and tenant tests pass. Exit criteria: permits include a visible bounded proof. `v0.57.0 implementation stop reached. Run pentest for this exact commit.`

## `0.58.0` — Field Redaction, Obligations, And Enforcement Registry
Status: planned. Setup: classify fields, derived values, snippets, counts, caches,
exports, and obligation enforcement points; generate an authority-interface
registry from routes, commands, reads, exporters, notifications, workflows,
plugin hosts, attachments, and AI retrieval schemas. Only interfaces implemented
through Phase F are instantiated now; later surfaces must register themselves
before their own milestone can exit. Goal: preserve policy end to end.
Deliverables: redaction engine, typed visible DTOs, obligation executor, and
compile/registration gate requiring an authorization case for every interface.
Verification: API/search/report/export/notification/cache/AI leakage, derived inference,
and revocation pass. Exit criteria: hidden data cannot reappear downstream. `v0.58.0 implementation stop reached. Run pentest for this exact commit.`

## `0.59.0` — Delegation And Break-Glass Access
Status: planned. Setup: require delegation to be a non-amplifying subset with
tenant/resource scope, expiry, revocation and redelegation policy; break glass
requires strong reauthentication, independent approval where feasible, dedicated
short session, reason, notifications, live monitoring, and immutable usage.
Goal: exceptional access without permanent privilege or waiver of tenant,
audit, key, or evidence-custody invariants.
Deliverables: exception aggregate, challenge/approval workflow, heightened audit.
Verification: self-approval, broad scope, non-expiry, replay, hidden use, stale session,
and revocation tests pass. Exit criteria: every exception is bounded and visible. `v0.59.0 implementation stop reached. Run pentest for this exact commit.`

## `0.60.0` — Authorization Conformance Suite
Status: planned. Setup: enumerate every human and `0.52.1` workload command/
read/field/search/export/blob/notification/admin/ingest interface currently
implemented and every declared future interface schema from the generated
registry; include token audiences and credential/policy versions. Goal: prove
equivalent deny-by-default policy independent of authentication mechanism and
make later registration mechanically mandatory. Deliverables: generated
matrix, negative corpus, human-versus-service-principal differential tests,
connector/agent/measurement-source cases, and coverage/evidence report.
Verification: mutation and read parity, tenant pairs, stale policy/credential,
wrong audience/scope, cache/index lag, break-glass, and differential adapters
pass. Exit criteria: no principal kind or authority-bearing interface lacks a
negative case. `v0.60.0 implementation stop reached. Run pentest for this exact commit.`
