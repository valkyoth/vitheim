# Phase L — WASM And Integrations

Scope: `0.111.0–0.120.0`. Components receive capabilities, never direct storage.

## `0.111.0` — Versioned WIT Interfaces
Status: planned. Setup: pin Component Model/WIT sources, ABI versions, owned
types, compatibility and limits; default worlds import no WASI filesystem,
environment, clock, randomness, sockets, or processes. Goal: stable least-
authority extension contracts. Deliverables: WIT worlds/packages/bindings and
test fixtures. Verification: malformed components, forbidden imports, ABI/
version/type confusion, oversized values pass. Exit criteria: unknown ABI or
ambient import fails closed. `v0.111.0 implementation stop reached. Run pentest for this exact commit.`

## `0.112.0` — Deterministic Component Execution
Status: planned; blocked until this milestone admits the exact audited Component
Model runtime/version, maintenance, license, unsafe/native code, and isolation
profile. Setup: fuel, memory, imports, deterministic clock/random inputs, output,
cancellation, and version-bound admission record. Goal: sandboxed pure
extensions. Deliverables: runtime port/adapter, admission evidence, and
determinism harness. Verification: fuel/memory bypass, nondeterminism, traps,
covert imports, escape tests pass. Exit criteria: pure components have no
ambient authority. `v0.112.0 implementation stop reached. Run pentest for this exact commit.`

## `0.113.0` — Effectful Component Execution
Status: planned. Setup: capability calls, stable `EffectId`/request digest,
commit-time authorization, immutable tenant/initiator/delegation/capability/
target/purpose/request/policy/assurance bindings, declared authorization
freshness, exact live-subject/approved-grant/service-principal execution
authority, current redemption where required, provider idempotency-
key scope/retention, status-query and reconciliation support, retry/replay
horizon, typed `RemoteTargetConcurrencyProfile` for provider mutations,
immutable validator/provider/account/resource binding, compensation, privilege/non-compensability, bounded typed quota-claim
settlement, and audit. Each capability maps exactly onto the `0.18.2`
execution state, remote outcome, resolution source/evidence, operational
resolution workflow, and separate compensation state; plugins cannot select a
stronger capability, synthesize provider evidence, close a privileged manual
workflow, reinterpret `OutcomeUnknown`, downgrade `CommitAndDispatch`, reuse
another effect's quota claims, confuse settlement kinds, impersonate an offline
approver, refresh a remote validator, downgrade strong conditional mutation,
claim a remote validator is a local target fence, select unconditional mode
without the exact live `RemoteMutationExceptionGuard`, invoke
`QuotaCapacityPolicy`, reclassify existing capacity, or spend control-plane
emergency reserve. The host broker, never guest code, owns the immutable
`DispatchTransmissionWindow`, current-fence `ClaimTransmissionStart`, and
single-use bounded start permit. The broker binds the claim to one host worker
instance and lease generation, returns non-persisted permit material once, and
never exposes it to guest memory; a plugin cannot delay, extend, replay, select
the claimant, or reinterpret uncertain transmission. Goal:
controlled hosted extension
effects with truthful remote outcomes. Deliverables: host-call broker, typed
effect-capability descriptors, distinct lifecycle/outcome/resolution/
compensation receipts, reconciliation deadline/escalation boundary, and
authorized manual-resolution boundary; single-use dispatch-authorization
receipts, grant/service-principal redemption, and per-kind quota settlement/
compensation accounting integration; include conditional-write broker,
precondition outcome mapping, provider capability validation, and reviewed-
unconditional-exception owner/guard/attempt enforcement plus transmission-
window/unique-claimant/one-time-permit enforcement.
Verification: unauthorized calls, replay, commit-to-dispatch revocation,
forged/stale dispatch receipt, worker/plugin confused deputy, cross-tenant
handles, target/request-digest substitution, unsafe freshness downgrade,
grant replay/attempt exhaustion/target drift, offline-human impersonation,
provider/account/resource/validator substitution, weak/strong confusion, ABA
delete/recreate, ignored/downgraded conditional mechanism, unsafe automatic
refresh, precondition failure retried, response loss treated as non-acceptance,
unreviewed unconditional mutation, exception scope/request substitution,
revocation/expiry/provider-capability/final-attempt race, missing guard, restored
exception, capacity-policy invocation or protected-class conversion,
expired/substituted transmission deadline, revocation after receipt, long guest
pause, concurrent shared-credential hosts, claim/worker/lease/permit
substitution, claim-response loss, stale-host takeover, permit replay/
reconstruction, clock rollback, uncertain-start retransmission, provider
acceptance plus lost response, idempotency expiry, forged success/
resolution source, operator assessment presented as provider truth, late
callback versus manual resolution, forbidden blind retry, privileged resolver
impersonation, mixed claim-set split, cross-kind hold/refund/write-off confusion,
duplicate refund, compensation claim reuse, control-plane-reserve access, and
partial failure pass. Exit criteria:
every effect passes independent commit-time and declared dispatch-time policy;
its transmission begins only through the host-owned bounded current-fence
permit returned once to one worker instance/lease generation, and its exact
binding/authority, execution, provider truth, knowledge source, operational
disposition, per-kind quota state, and compensation remain independently
attributable.
`v0.113.0 implementation stop reached. Run pentest for this exact commit.`

## `0.114.0` — Capability And Secret Handles
Status: planned. Setup: manifests bind plugin digest, tenant, instance, action,
target, expiry, nonce, and policy version; opaque authenticated handles recheck
all bindings/current policy at redemption. External KMS/secret service retains
master keys. Plaintext credentials never enter Wasm guest linear memory.
Connectors use host-brokered authenticated HTTP, request signing, token refresh,
HMAC/signature generation, client-certificate operations, and secret-derived
header injection; the guest receives only opaque handles and bounded
non-sensitive results. An integration that truly requires raw secret access
must run as a separately isolated hosted-connector profile with its own
milestone/admission evidence and is excluded from ordinary Wasm/plugin security
claims.
Define plugins as stateless by default; any state capability is explicitly
tenant/plugin/instance namespaced, schema-versioned, quota-bound, exportable,
erasable, migratable, and registered in `0.51.2`. Goal: least-authority plugins. Deliverables:
manifest/evaluator, non-extractable secret-operation broker, authenticated HTTP/
signing/token/certificate host operations, and optional plugin-state port.
Verification: forging, scope escalation, state namespace collision, quota/
migration/deletion failure, handle extraction/reuse, guest-memory secret
canaries, broker confused deputy, derived-header leakage, stale/revoked handles,
and policy change pass. Exit criteria: plaintext credentials never enter guest
memory through any supported plugin API; exceptions are separate hosted
products and cannot inherit this plugin-security claim. `v0.114.0
implementation stop reached. Run pentest for this exact commit.`

## `0.115.0` — Resource Metering
Status: planned. Setup: per-plugin/tenant instructions and host-call work,
linear memory, tables, stack, instances, concurrency, output/log, wall time,
network bytes, epoch interruption, and OS process CPU/memory limits. Goal: resist
plugin denial of service. Deliverables: meters, cancellation and quota evidence.
Verification: guest/host limit bypass, amplification, slow output, connection
storms, accounting overflow and OS containment pass. Exit criteria: exhaustion
isolates the plugin. `v0.115.0 implementation stop reached. Run pentest for this exact commit.`

## `0.116.0` — Signed Plugin Registry And Rollout
Status: planned. Setup: package digest/signature, trust roots, compatibility, approval, staged rollout, rollback, revocation. Goal: controlled plugin lifecycle. Deliverables: registry aggregate and rollout engine. Verification: substitution, downgrade, malicious update, signer rotation, rollback/revocation pass. Exit criteria: install/activate are distinct approved actions. `v0.116.0 implementation stop reached. Run pentest for this exact commit.`

## `0.116.1` — Governed Plugin Catalog And Storefront

Status: planned.

Setup: separate discoverable catalog metadata from trusted package bytes;
define publisher identity, package/signature/digest, provenance, license,
privacy/data-flow declaration, requested capabilities, supported API/ABI/
platform versions, tenant eligibility, review state, pricing metadata if ever
used, vulnerability response, deprecation, revocation, and offline mirrors.
Define exact dependency identities/version ranges, a canonical bounded
dependency graph and lock manifest, transitive capability/data-flow union and
diff, cycle/depth/node/work limits, conflict resolution, revocation cascades,
threshold-signed root/catalog metadata, publisher-key compromise response,
freeze/rollback protection, and last-known-good recovery.

Goal: provide a storefront where tenants can discover extensions without making
browse, purchase, download, install, permission approval, or activation the same
security decision.

Deliverables: catalog and listing aggregates, signed catalog snapshots, package
transparency/provenance view, permission-diff UI/API, tenant allow/deny policy,
dependency resolver/lock manifest, transitive capability diff, threshold-root
and delegated publisher trust model, revocation-cascade planner, review workflow,
mirror protocol, and operator/publisher compromise runbooks.

Verification: publisher impersonation, typosquatting/confusable names,
listing/package substitution, hidden capability change, malicious update,
downgrade, license/privacy omission, review bypass, popularity/rating abuse,
dependency confusion/substitution, version-range ambiguity, graph cycles/bombs,
hidden transitive capability, dependency revocation cascade, compromised
publisher/root threshold, freeze/rollback attack, revoked/offline package,
mirror rollback, and tenant visibility leaks pass.

Exit criteria: only a separately approved signed package can move from catalog
discovery to installed state, and activation still requires explicit current
capability approval. `v0.116.1 implementation stop reached. Run pentest for this exact commit.`

## `0.117.0` — Connector SDK And Testkit
Status: planned. Setup: `0.52.1` service-principal identity and mandatory
sender-constrained workload tokens for privileged connector operations,
connector capabilities, non-extractable auth handles, cursor/idempotency,
schemas, rate/backoff, host-brokered authenticated operations, and test
simulation. Expose the typed remote-target concurrency descriptor, strong/weak
validator fixtures, conditional-write/precondition outcome contract, and
explicit unsupported/unconditional-reviewed profiles plus exception ID/guard/
attempt fixtures. Include host-owned transmission-window/start-claim fixtures;
the SDK exposes neither a raw-secret read nor a way to mint, extend, or replay a
start permit. Its testkit requires unique claim/worker/lease/permit-digest
binding, status-only replay, ambiguous-delivery reconciliation, and no persisted
permit representation. Goal: safe integration
development. Deliverables: private SDK/testkit, broker-operation mocks, guest-
memory canary harness, and conformance suite. Verification: principal/tenant/
audience confusion, SSRF, token replay, impersonation, handle extraction,
plaintext credential in guest memory, pagination loops, secret logs, and
malformed remote data, validator/resource/account substitution, ABA recreation,
provider conditional downgrade or ignored header, silent refresh, and response-
loss ambiguity, exception scope/revocation/expiry/final-attempt/restore, and
unguarded unconditional selection, long pause, expired/substituted deadline,
revocation before start claim, clock rollback, duplicate shared-credential
workers, claim-response loss, lease takeover, claimant/permit substitution,
permit replay/reconstruction, and uncertain retransmission pass. Exit criteria:
connectors pass conformance before
activation and cannot request plaintext credentials. `v0.117.0 implementation
stop reached. Run pentest for this exact commit.`

## `0.118.0` — Mail, Webhook, And Collaboration Connectors
Status: planned. Setup: sender verification, signed webhooks, deny-by-default
egress proxy, resolved-address validation, redirect and DNS-rebinding policy,
TLS identity, tenant allowlists, byte budgets, headers, action links, replay and
quotas. Goal: common secure integrations. Deliverables: connectors and recipes.
Verification: SSRF, header/HTML injection, spoofing, replay, redirect/DNS
rebinding, TLS confusion and notification abuse pass. Exit criteria: remote
input has no implicit command authority. `v0.118.0 implementation stop reached. Run pentest for this exact commit.`

## `0.118.1` — Microsoft Defender And Sentinel Connector Pack

Status: planned; blocked until exact Microsoft Defender XDR/Microsoft Sentinel
API profiles, authentication flow, client/TLS implementation, permissions,
licensing, maintenance, and rate-limit semantics are admitted.

Setup: bind one `0.52.1` connector service principal and audience to each
provider tenant/workspace; map alert/incident/entity/vulnerability IDs, delta
cursors and webhooks, raw evidence retention, schema versions, paging,
throttling/backoff, deletion/update claims, asset/identity links, severity/
status, checkpoint recovery, and optional outbound actions. Outbound
acknowledgement or case updates require separate capabilities and current policy.

Goal: let a governed WASM connector ingest Microsoft security alerts, incidents,
entities, and relevant exposure facts into Vitheim without granting remote data
implicit local command authority.

Deliverables: signed connector package/listing, provider adapters, normalized
mapping pack, raw-to-derived provenance, cursor/idempotency state, simulation
fixtures, dashboards, and installation/least-privilege runbook.

Verification: provider/workspace confusion, token/secret leak, webhook spoof/
replay, pagination loops, cursor rollback, schema drift, duplicate/update/delete
races, entity mis-link, severity/status trust abuse, throttling storms, outbound
action escalation, cross-tenant data, and parser fuzz pass.

Exit criteria: every imported Microsoft fact retains provider provenance and
cannot create/close/mutate local authority except through configured ordinary
commands. `v0.118.1 implementation stop reached. Run pentest for this exact commit.`

## `0.118.2` — Tenable Vulnerability Connector Pack

Status: planned; blocked until exact Tenable product/API profiles,
authentication, client/TLS implementation, permissions, licensing, maintenance,
export/job, pagination, and rate-limit semantics are admitted.

Setup: bind one `0.52.1` connector service principal and audience to each
source tenant/container; map asset and agent identity, network/cloud
identifiers, plugin/finding identity, severity and scoring versions, first/
last seen/fixed/reopened state, evidence, scan coverage, cursor/export
checkpoints, asset reconciliation, deletion claims, and raw payload retention.

Goal: ingest Tenable assets and vulnerability findings into the typed
vulnerability system and unified graph without overwriting authoritative asset
or risk decisions.

Deliverables: signed connector package/listing, source adapter, mapping pack,
asset/finding reconciliation rules, resumable export/cursor state, coverage
metrics, simulation fixtures, and least-privilege runbook.

Verification: source/container confusion, credential leakage, export/cursor
replay, asset identity collision, finding dedup errors, forged fixed state,
score/version drift, missing scan coverage, schema changes, oversized exports,
rate-limit storms, cross-tenant links, parser fuzz, and rebuild pass.

Exit criteria: Tenable findings remain versioned source assertions linked to
the correct assets; local priority, exception, remediation, and closure rules
remain authoritative. `v0.118.2 implementation stop reached. Run pentest for this exact commit.`

## `0.119.0` — Outbound-Only Integration Agent
Status: planned. Setup: stable device plus `0.52.1` service-principal identity,
separate local enrollment challenge, device key attestation/profile,
short-lived sender-constrained device/workload credential, audience-bound mTLS,
capability policy, encrypted spool, update, revoke, compromise response, and no
inbound listener. Spool records preserve the complete remote-target concurrency
profile, validator and provider capability evidence, request digest, idempotency
key, exact exception/guard/attempt receipt, `redeemed_at`, `transmit_before`,
effect attempt, audience/provider/account binding, unique claim ID, worker/
device instance, lease generation/fence, permit digest, and transmission-start
status—but never permit material. Offline replay cannot refresh, weaken,
substitute, or consume another exception, extend a deadline, return a second
permit, or retransmit a claimed/possibly started request. Capacity-policy
authority is never present in an agent spool.
This is not an OAuth authorization-server or token-endpoint claim. Goal: reach
private systems safely. Deliverables: agent enrollment/credential protocol,
runtime, and operator controls. Verification: takeover, identity cloning/
remapping, enrollment replay, credential/spool extraction, audience/scope
inflation, downgrade, revocation, validator/profile substitution, stale or
silently refreshed validator, conditional-capability downgrade, exception guard/
attempt substitution, revoked/expired exception replay, capacity-policy
injection, long offline pause, stale admission, deadline/audience/request
substitution, clock rollback, concurrent agent instance, claim/worker/lease/
permit substitution, claim-response loss, takeover, start-permit replay/
restore/reconstruction, uncertain transmission retry, and offline limits pass.
Exit criteria: agent
compromise is bounded and revocable without making Vitheim a general OAuth
issuer.
`v0.119.0 implementation stop reached. Run pentest for this exact commit.`

## `0.120.0` — Plugin Compatibility And Isolation Suite
Status: planned. Setup: ABI/runtime/version matrix, tenants, concurrent plugins,
failures, upgrades, and mandatory authority/tenant registry entries for every
host call/state surface. Goal: prove isolation and compatibility. Deliverables:
adversarial suite, authorization cases, and evidence matrix. Verification:
cross-plugin/tenant state, resource starvation, handle confusion, unregistered
interface, upgrade/rollback, sandbox escapes pass. Exit criteria: every supported
profile and authority-bearing interface has evidence. `v0.120.0 implementation
stop reached. Run pentest for this exact commit.`
