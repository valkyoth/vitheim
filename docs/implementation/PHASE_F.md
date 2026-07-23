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
storage topology migration, approval, retry, recovery states, and a monotonic
tenant-authority epoch. Suspend/resume/close/delete and every authority-changing
transition update that local epoch atomically with the tenant event.

Goal: make the complete tenant lifecycle a governed aggregate rather than
administrator scripts or scattered storage flags.

Deliverables: tenant-lifecycle commands/events and enforcement epoch, process
manager, cleanup proof ledger, migration plan/checkpoints, hold/erasure conflict
policy, initial neutral `0.8.1` data-surface inventory consumed later by
`0.51.2`, and runbook.

Verification: ID reuse, suspend bypass, partial provisioning/deletion, held
tenant deletion, stale cache/index/backup/blob, key destruction order, topology
rollback, suspension/resume racing dispatch, epoch rollback/reuse, concurrent
admin, cross-tenant migration, and restore tests pass.

Exit criteria: tenant closure either has policy-acceptable accurately typed
disposition evidence for every then-known surface or remains visibly incomplete
and recoverable; external uncertainty is not labeled verified deletion.
`v0.51.1 implementation stop
reached. Run pentest for this exact commit.`

## `0.51.2` — Tenant Data-Surface Lifecycle Registry

Status: planned.

Setup: generate a separate registry for every tenant-bearing durable, cached,
indexed, backed-up, or externally copied surface. Each entry declares structural
tenant key, data classes and accountable owner, authoritative/derived/external
status, export behavior, retention and legal-hold behavior, erasure/deletion
semantics, backup/restore handling, residency/replication, key ownership and
destruction, rebuild capability, tenant-topology migration, and cleanup proof.
Consume the neutral `0.8.1` N1 descriptor schema and backfill every surface
created in `0.1.0–0.51.1`; earlier crates never import Phase F solely to
register themselves. This milestone validates the complete backfill, then
activates the generated compile/registration gate prospectively for itself and
all later milestones.
For external copies, define typed disposition evidence strengths:
`LocallyVerifiedDeletion`, `ControlledKeyCryptographicErasure`,
`ProviderAttestedDeletion`, `DeletionRequestedUnconfirmed`, and
`PreviouslyDisclosedPlaintextUnverifiable`. Attestations are attributed claims,
not cryptographic proof. Previously disclosed plaintext is never described as
provably erased merely because access, synchronization, or a contract ended.
Tenant closure policy defines acceptable/pending/blocking states by data class,
legal hold, agreement, jurisdiction, and evidence strength while retaining the
honest residual state. Retention precedence distinguishes rollup-substitution
expiry from mandatory erasure, maximum-retention, and closure deletion.
Mandatory deletion proceeds despite missing rollup/checkpoint/restore proof,
marks affected historical results unknown, and emits an immutable authority-
loss disposition record. Evaluate each related surface independently: raw
observations, rollup payload, source manifest, derived result, projection/cache,
export, and linkable checkpoint metadata. A non-authoritative rollup may remain
only under its own permitted retention decision; otherwise delete or crypto-
erase it and every other covered surface, retaining only an allowed non-
sensitive tombstone and authority-loss fact.
Inventory all earlier surfaces including event/audit journals and projections,
blobs, queues, customer measurements and rollups, paging/delivery receipts,
hosted status, and caches.

Goal: make tenant lifecycle coverage mechanically complete as the platform adds
new storage and external-copy paths.

Deliverables: generated `TenantDataSurface` descriptor registry, compile/
registration gate, pre-`0.51.2` descriptor backfill importer/report,
dependency-direction check, lifecycle-operation and retention-precedence
planner, related-surface disposition graph, per-surface disposition receipts,
non-sensitive tombstone validator, completeness report, closure blocker, and
adapter conformance API.
The authorization-interface registry and this lifecycle registry remain
distinct and cross-reference surfaces where applicable. Disposition receipts
carry evidence kind, issuer/controller, scope, time, related request/
attestation/key-destruction proof, verification status, residual-risk statement,
and closure-policy result.

Verification: missing/duplicate surface registration, omitted tenant key or
data class, false derived/rebuild claim, export/hold/erasure conflict, stale
backup/index/cache/external copy, residency mismatch, wrong key destruction,
topology migration omission, cleanup-receipt forgery, restore resurrection, and
late registration tests pass. Missing earlier-surface backfill, an earlier crate
depending outward on Phase F, post-`0.51.2` registration bypass, rollup proof
blocking mandatory deletion, historical authority surviving deletion without
proof, rollup retention inherited from deleted raw data, omitted manifest/
result/cache/export/linkable-checkpoint decision, sensitive tombstone, partial
derived-surface cleanup, and missing authority-loss disposition fail. Provider
attestation presented as local proof, unconfirmed request presented as deletion,
unverifiable plaintext presented as erased, evidence-strength downgrade, and
closure-policy bypass all fail.

Exit criteria: every existing tenant data surface has a complete lifecycle
entry and tested disposition path. Every later milestone that adds or changes a
surface is mechanically unable to exit until it updates this registry, and
tenant closure remains visibly incomplete while any registered surface lacks
the evidence strength required by current closure policy. Closure may record an
explicitly accepted unverifiable residual obligation where law and agreement
permit, but cannot relabel it verified deletion or cryptographic erasure.
Neither rollup authority nor availability history may override a mandatory
deletion obligation, and no derived surface may inherit another surface's
retention decision.
`v0.51.2 implementation stop reached. Run pentest for this exact commit.`

## `0.52.0` — Subjects And Service Principals
Status: planned. Setup: define human/service/device identities, issuer binding,
lifecycle, credential facts, and impersonation prohibition. Define an
external-identity-link aggregate keyed only by compound issuer plus immutable
external subject ID; never auto-link email, display name, or mutable username.
Specify controlled JIT provisioning, OIDC/SAML/SCIM correlation, reviewable
merge/split/unlink and IdP-migration operations, deprovision-versus-login race
policy, identity recreation protection, complete provenance/audit history, and
monotonic subject/service-principal/credential/mapping authority epochs updated
atomically with their owning lifecycle events.
Goal: stable actor identity without unsafe account correlation. Deliverables:
subject model, external-identity-link aggregate, mapping/review workflows,
disable/revoke events plus local enforcement epochs, migration tooling, and
explanation view. Verification:
issuer collision, email/name collision, account recreation, JIT/group
escalation, merge/split/unlink abuse, IdP migration takeover, concurrent
deprovision/login and disable/revoke-versus-dispatch races, epoch reuse,
stale/disabled identity, spoofing, and audit pass.
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
scope, key/signature, and the exact admitted token confirmation/sender-
constraint profile. Client authentication at the external issuer, including
`private_key_jwt` or mTLS, is not by itself evidence that the access token
presented to Vitheim is sender constrained.
Define two explicit assurance classes. `SenderConstrained` tokens bind a
reviewed proof key or client certificate to the token and request; privileged
workers, connectors, and agent-facing privileged APIs require this class.
`BearerRestricted`, if supported at all, has a substantially shorter lifetime,
one narrow audience, lower authentication assurance, and an explicit
non-privileged action allowlist. It cannot perform administration, secret/
credential operations, plugin lifecycle, containment, broad export, federation
trust, or other privileged commands. Policy receives the assurance class and
proof identity as typed facts and cannot upgrade bearer assurance.
Define external issuer/key rotation and compromise response, mapping disable/
revoke, monotonic local workload credential/mapping revocation epochs, policy
re-evaluation, replay restrictions, and connector workload identities.
A replay cache may detect a repeated token/proof tuple but is not claimed to
prevent the first use of a stolen bearer token.
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
binding and assurance-class types, restricted-bearer action matrix, validation
and replay controls with documented limits, compromise/revocation workflow,
local revocation-epoch adapter, external-fact staleness classification,
conformance corpus, fake external issuer/client, operator tooling, and explicit
no-token-endpoint/disabled-feature matrix.

Verification: issuer/client/principal/tenant confusion, forged assertion, key/
algorithm/token-type confusion, bearer replay, audience/scope inflation,
false sender-constrained classification, proof/certificate/token substitution,
proof replay, bearer-to-privileged escalation, first use of a stolen bearer
remaining confined to the restricted action envelope despite a cold replay cache,
certificate remapping, display-name collision, accidental token endpoint or
private-client-key storage, token exchange/refresh misuse, stale policy/
mapping, issuer key rotation/rollback, revocation lag, connector impersonation,
credential/mapping revocation racing privileged dispatch, missing/stale local
epoch, bounded-stale external fact offered to privileged dispatch, clock abuse,
issuer outage, and resource-server conformance tests pass.

Exit criteria: each workload request resolves to one immutable tenant-bound
service principal, current issuer/token/mapping and assurance profile;
authorization is independently reevaluated and no local token issuer or static
secret is silently enabled. Every privileged workload token is cryptographically
sender constrained under the selected profile; any admitted bearer token is
visibly lower assurance and restricted by policy. Privileged dispatch requires
an authoritative local revocation epoch; a bounded-stale-only issuer profile is
unsupported for that action class. `v0.52.1
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
cleanup, outage policy, and a monotonic local session-authority epoch updated
atomically with rotate/revoke/logout/expiry transitions.

Goal: provide multi-node sessions without bearer-state confusion or local-memory
affinity.

Deliverables: session-store semantic port, memory fake, PostgreSQL reference
adapter, optional admitted hosted-cache adapter, cleanup/revocation protocol,
authority-epoch port, capability probes, and operator evidence.

Verification: fixation, guessing, replay, rotation race, stale credential/policy,
logout propagation, cross-tenant collision, node failover, partition, eviction,
clock shift, logout/revocation racing dispatch, epoch rollback/reuse, store
outage, cleanup, and restore tests pass.

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
deletion, conflict, quarantine, and privilege review. Activated group changes
increment the affected local authorization-fact epoch in the same transaction.
Goal: safe directory facts.
Deliverables: sync port, reconciliation, staged activation/epoch transition,
and audit report.
Verification: group takeover, stale privilege, deletion/recreation, replayed delta,
oversized sync, group-change-versus-dispatch race, epoch reuse, and tenant tests
pass. Exit criteria: source changes cannot silently escalate rights. `v0.54.0 implementation stop reached. Run pentest for this exact commit.`

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
versions, explanation, and monotonic role/assignment enforcement epochs updated
with authority-changing events. Layouts, dashboards, navigation, saved views,
and plugin installation never grant capabilities. Goal: deterministic deny-by-
default roles across API and UI composition.
Deliverables: pure evaluator, validated role graph, built-in least-authority
role templates, custom-role compiler, effective-access explanation, enforcement-
epoch transitions, and decision trace. Verification: cycles, hidden grants,
scope confusion, dashboard/action
discovery leaks, shared-space escalation, stale/expired roles, unsafe custom
roles, assignment-versus-dispatch races, epoch reuse, and property tests pass.
Exit criteria: every permit cites the exact role path. `v0.55.0 implementation stop reached. Run pentest for this exact commit.`

## `0.56.0` — ABAC Engine
Status: planned. Setup: define one policy decision request containing tenant,
subject, authentication assurance/sender-constraint/proof identity, action,
resource, field set, purpose, environment and policy version;
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
bootstrap/root recovery, lockout detection, emergency rollback, evidence, and a
monotonic active-policy enforcement epoch that increments on activation,
rollback, expiry, and recovery; rollback never restores an old epoch.

Goal: govern policy changes with the same rigor as domain changes and prevent
irrecoverable authorization lockout.

Deliverables: policy-set aggregate, simulation/impact report, approval-bound
activation command with atomic epoch transition, rollback plan, bootstrap
ceremony, and recovery runbook.

Verification: self-approval, stale simulation, signature/version substitution,
unsafe default allow, owner lockout, recovery abuse, rollback downgrade,
concurrent activation, activation/rollback-versus-dispatch, epoch reuse, and
policy-cache invalidation pass.

Exit criteria: active policy always identifies a reviewed version and a tested
least-authority recovery path. `v0.56.1 implementation stop reached. Run pentest for this exact commit.`

## `0.57.0` — Relationship-Based Authorization
Status: planned. Setup: define admitted edge types, direction, depth/work bounds,
security labels, freshness, explanation paths, and monotonic relationship-fact
epochs updated with authoritative edge changes. Goal: authorize ownership/
delegation graphs safely.
Deliverables: graph policy operator, enforcement epoch, and bounded path proof.
Verification: forged
edges, malicious cycles, hidden-node inference, path explosion, stale ownership,
edge-change-versus-dispatch races, epoch reuse, and tenant tests pass. Exit criteria: permits include a visible bounded proof. `v0.57.0 implementation stop reached. Run pentest for this exact commit.`

## `0.58.0` — Field Redaction, Obligations, And Enforcement Registry
Status: planned. Setup: classify fields, derived values, snippets, counts, caches,
exports, and obligation enforcement points; generate an authority-interface
registry from routes, commands, reads, exporters, notifications, workflows,
plugin hosts, attachments, AI retrieval schemas, external-effect intent
creation, and provider dispatch. For each external-effect capability, register
the immutable tenant/initiator/delegation/capability/target/purpose/request/
policy/assurance binding, its `CommitBound` or `CommitAndDispatch` profile, and
whether dispatch authority is mandatory. Also register each permitted
`EffectExecutionAuthority` (`LiveSubjectAuthority`,
`ApprovedExecutionGrant`, or `ServicePrincipalAuthority`), its issuer/
redemption/revocation enforcement points, offline-human behavior, current-policy
facts, required approval/quorum/separation rules, authoritative grant-lineage
owner, immutable approval-receipt/outbox causation, generation uniqueness,
pre-issuance revocation, successor supersession, redemption-guard transaction
domain, attempt-claim identity/digest, claim/receipt enforcement point, and the
bounded canonical `DispatchAuthorityFenceSet`. Backfill typed monotonic fence
entries and atomic update points for tenant lifecycle, human/service identity,
session/credential/mapping, group/role/relationship, delegation, and policy.
For every capability requiring current target state, register its typed
`DispatchTargetFence`, same-aggregate expected-version path or different-
aggregate authoritative fence-row owner/update point, lifecycle and deletion/
supersession epoch, transaction-domain placement, and unsupported remote/cross-
shard/projection-only cases.
For every provider-owned mutable target, separately register
`RemoteTargetConcurrencyProfile`, provider/account/resource identity, validator
kind/strength/provenance, admitted conditional-write capability/version,
idempotency binding, precondition-failure outcome, refresh prohibition, and any
narrow `UnconditionalReviewed` exception. Register each first-class
`RemoteMutationException` owner stream, approval/quorum/separation/scope/time/
attempt contract, provider-capability epoch, co-located guard, revocation/
supersession update, and attempt receipt. This remote provider contract is never
registered as a local target fence.
Register the control-plane-only `QuotaCapacityPolicy` command, protected reserve
floors, separation-of-duties approval, simulation digest, monotonic epoch, and
the current tenant/source/destination-principal/policy fences required by every
delayed capacity-transfer transition. No existing-capacity class transition is
registrable.
Classify any external-only fact by staleness bound and forbid it from privileged
dispatch unless an authoritative local revocation epoch exists. Only
interfaces
implemented through Phase F are instantiated now; later surfaces must register
themselves before their own milestone can exit. Goal: preserve policy end to end.
Deliverables: redaction engine, typed visible DTOs, obligation executor, and
compile/registration gate requiring an authorization case for every interface
and effect intent, grant issuance/revalidation/revocation, authority redemption,
grant ownership/process-manager continuation, redemption-guard/attempt-claim
linearization, authority-fence registry/codec/update contract, and provider-
dispatch enforcement points; include target-fence registry/codec/owner-update
and co-location enforcement plus remote-target concurrency profile/provider-
capability/precondition-outcome enforcement, remote-mutation-exception owner/
guard/attempt enforcement, and capacity-policy/delayed-transfer authority cases.
Verification: API/search/report/export/notification/cache/AI leakage, derived inference,
missing effect freshness/binding registration, unsafe `CommitBound`
classification, missing/ambiguous execution-authority mode, approval grant
issued without quorum or separation, offline-human impersonation, dispatch
revocation, ambiguous/two-stream grant ownership, approval-receipt substitution,
pre-issuance revocation loss, successor fork, missing/non-co-located guard,
revocation/final-attempt race, claim/receipt substitution, grant/effect two-
stream redemption, missing/duplicate/substituted/reordered fence entries, epoch
reuse/rollback, stale external authority used for privileged dispatch, target
substitution, missing/stale target fence, deletion/merge/migration/supersession/
restore racing dispatch, stale target projection, cross-shard target placement,
remote account/resource/validator substitution, ABA recreation, weak/strong
confusion, provider downgrade/ignored conditional, unsafe refresh, response-
loss misclassification, exception scope/reuse, revocation/expiry/provider-
capability/final-attempt race, guard omission/restore resurrection, existing-
capacity reclassification, tenant-invoked capacity policy, reserve-floor/
simulation replay, stale delayed-transfer authority, and revocation pass.
Exit criteria: hidden data cannot reappear downstream, and no external effect
can bypass its declared commit/grant/redemption/dispatch authorization gates.
`v0.58.0 implementation stop reached. Run pentest for this exact commit.`

## `0.59.0` — Delegation And Break-Glass Access
Status: planned. Setup: require delegation to be a non-amplifying subset with
tenant/resource scope, expiry, revocation and redelegation policy; break glass
requires strong reauthentication, independent approval where feasible, dedicated
short session, reason, notifications, live monitoring, and immutable usage.
Effect intents bind the complete delegation chain/version/expiry. Revocation or
expiry invalidates any required dispatch-time authorization; a queued worker
cannot retain or amplify the delegator's capability merely by holding a lease.
Delegation creation/revocation/expiry increments a monotonic local enforcement
epoch atomically with its owner event.
An `ApprovedExecutionGrant` is not redelegation: only the registered approval
command and current policy may create or revalidate its exact authority. It
cannot expand the approvers' intersection of capabilities, survive a revocation
condition, or be converted into a general service-principal credential.
Goal: exceptional access without permanent privilege or waiver of tenant,
audit, key, or evidence-custody invariants.
Deliverables: exception aggregate, delegation enforcement epoch, challenge/
approval workflow, delayed-effect delegation and execution-grant validation,
and heightened audit.
Verification: self-approval, broad scope, non-expiry, replay, hidden use, stale session,
commit/dispatch revocation race, grant-as-redelegation or capability
amplification, delegation epoch rollback/reuse, worker confused deputy, and
revocation tests pass. Exit criteria:
every exception is bounded and visible, and no delayed effect outlives its
selected execution authority or declared revocation conditions.
`v0.59.0 implementation stop reached. Run pentest for this exact commit.`

## `0.60.0` — Authorization Conformance Suite
Status: planned. Setup: enumerate every human and `0.52.1` workload command/
read/field/search/export/blob/notification/admin/ingest interface currently
implemented and every declared future interface schema from the generated
registry; include token audiences, credential/policy versions, external-effect
commit/dispatch enforcement points, immutable effect bindings, and freshness
profiles; enumerate live-subject, approved-grant, and service-principal
execution-authority issuance/redemption/revocation cases plus inline/dedicated
grant ownership/lineage and local redemption-guard/attempt-claim cases; enumerate
the bounded authority-fence entry/update/co-location cases for tenant,
subject/principal, session/credential/mapping, delegation, group/role/
relationship, policy, and exception-bound provider capability; enumerate each current-target fence's identity,
version/digest, lifecycle, deletion/supersession epoch, owner update, placement,
and canonical acquisition case; enumerate remote-target conditional/unconditional
profiles, immutable validators, provider capability evidence, and typed
precondition outcomes independently of local fences; enumerate exception owner/
guard/attempt/revocation cases and capacity-policy/floor/simulation/current-
authority cases. Goal: prove
equivalent deny-by-default policy independent of authentication mechanism and
make later registration mechanically mandatory. Deliverables: generated
matrix, negative corpus, human-versus-service-principal differential tests,
connector/agent/measurement-source cases, delayed-effect authorization state
machine, scheduled-offline grant fixtures, authority-fence race fixtures,
target-fence race fixtures, external-staleness classifications, and coverage/
evidence report; include remote-validator/provider-downgrade/ABA, exception-
guard, and delayed-transfer policy/authority fixtures.
Verification: mutation and read parity, tenant pairs, stale policy/credential,
wrong audience/scope, false sender constraint, bearer-to-privileged escalation,
replay-cache limitations, cache/index lag, commit-to-lease-to-dispatch policy/
delegation/employment/tenant/target changes, forged dispatch receipt, target or
request substitution, expired human session, grant forgery/replay/attempt
exhaustion, approval/quorum/separation drift, approver departure, policy-version
revalidation, approval-to-grant crash/reorder/duplicate, immutable-receipt/
generation substitution, pre-issuance revocation, successor/predecessor fork,
revocation racing attempt claim, concurrent final attempt, crash after claim
before provider I/O, claim/receipt substitution, target/version drift, consumed-
attempt restore, grant/effect two-stream adapter, service-principal scope/
audience confusion, each authority source changing between read/lease/dispatch,
missing/substituted/reordered fence set, epoch rollback/reuse, non-co-located
fence, bounded-stale external state used for privileged work, composite lock-
order inversion and bounded-retry identity drift, missing/non-co-located target
fence, target deletion/merge/migration/supersession/restore race, stale
projection, cross-shard current target, remote validator/account/resource
substitution, weak/strong confusion, ABA recreation, provider downgrade or
ignored condition, silent refresh, exception scope/request substitution,
revocation/expiry/provider-capability/final-attempt race, missing guard,
restored exception, protected-class adjustment, policy floor/simulation replay,
tenant suspension or principal/policy revocation during transfer, worker confused
deputy, unsafe low-risk profile, break-glass, and differential adapters pass.
Exit criteria: no principal kind or
authority-bearing interface lacks a negative case, and every delayed effect is
proven against its commit-time decision, selected execution-authority model, and
declared dispatch-freshness policy. Every privileged dispatch proves a complete
co-located monotonic authority-fence set; bounded-stale-only external facts
cannot satisfy it. Every current-target dispatch proves its authoritative target
fence or fails closed before provider I/O. Every remote mutation proves its
separate admitted concurrency profile without implying local freshness.
Unconditional mutation also proves the exact live guarded exception attempt.
Capacity policy cannot rewrite existing classes, and delayed transfer steps
prove current local authority.
`v0.60.0 implementation stop reached. Run pentest for this exact commit.`
