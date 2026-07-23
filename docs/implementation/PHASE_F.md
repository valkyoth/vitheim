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
ledger, migration plan/checkpoints, hold/erasure conflict policy, and runbook.

Verification: ID reuse, suspend bypass, partial provisioning/deletion, held
tenant deletion, stale cache/index/backup/blob, key destruction order, topology
rollback, concurrent admin, cross-tenant migration, and restore tests pass.

Exit criteria: tenant closure either has complete verified disposition evidence
or remains visibly incomplete and recoverable. `v0.51.1 implementation stop
reached. Run pentest for this exact commit.`

## `0.52.0` — Subjects And Service Principals
Status: planned. Setup: define human/service/device identities, issuer binding,
lifecycle, credentials facts, and impersonation prohibition. Goal: stable actor identity.
Deliverables: subject model, identity mapping, disable/revoke events. Verification:
issuer collision, account recreation, stale/disabled identity, spoofing, and audit pass.
Exit criteria: actor origin and lifecycle are explicit. `v0.52.0 implementation stop reached. Run pentest for this exact commit.`

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
Status: planned. Setup: enumerate every command/read/field/search/export/blob/
notification/admin interface currently implemented and every declared future
interface schema from the generated registry. Goal: prove equivalent policy for
current surfaces and make later registration mechanically mandatory.
Deliverables: generated matrix, negative corpus, coverage/evidence report.
Verification: mutation and read parity, tenant pairs, stale policy, cache/index lag,
break-glass, and differential adapters pass. Exit criteria: no uncovered authority-bearing interface remains. `v0.60.0 implementation stop reached. Run pentest for this exact commit.`
