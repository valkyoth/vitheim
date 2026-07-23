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
instance and lease generation. Its trusted `TransmissionExecutor` owns the claim
and provider socket, accepts an immutable authenticated instruction from the
guest-facing broker, consumes the sealed process-local permit by value, and
never exposes permit material or an authorizing digest to guest memory, RPC,
IPC, or queues. A plugin cannot delay, extend, replay, select the claimant, or
reinterpret duplicate instruction, executor failover, or uncertain transmission.
Every executor is admitted under the exact immutable, versioned
`ProviderExecutionProfile` for the claimed tenant/provider/account/action/
destination. It has neither a platform master-key ring nor general database
write authority, receives only opaque operation-specific secret handles, and
may redeem a handle only for the exact claimed receipt, request digest,
provider account, action, destination, and bounded lifetime. Provider network
access is deny-by-default and binds destination allowlists, TLS identity, DNS
rebinding/redirect rules, and socket ownership; the executor is never a general
HTTP proxy. Executor pools are partitioned by tenant/account or another
documented bounded trust domain, and a provider profile requiring an
unrestricted credential shared across unrelated tenants is rejected.
The profile belongs to one authoritative lineage with active/suspended/
superseded/revoked generations and monotonic profile, provider-account,
credential-version, and broker-policy epochs rechecked by start claim and handle
redemption. Profile activation uses the signed, digest-bound, semantically
reviewed typed control-plane lifecycle with current fences and a revocation
tombstone; plugins cannot propose, approve, activate, or rotate authority.
Remote rotation is an evidence-driven process with atomic local activation and
one authoritative lineage owner, a co-located one-non-terminal rotation guard,
stable provisioning idempotency, provider-inventory takeover, orphan
quarantine/revocation, credential-count charging, and bounded unknown-state
reconciliation. Start claim also requires a fresh admitted credential-capability
snapshot/epoch and reviewed semantic evaluator result; provider IAM discovery
never occurs in a plugin dispatch transaction. A superset, incomparable, or
unknown result quarantines the whole credential. Restore cannot revive old authority. Non-exportable
signing/mTLS/HSM profiles expose operations only. For bearer/API-key providers,
the hardened broker joins the
executor TCB and itself owns authorization serialization, redirects, TLS, start
claim, and socket. Bearer bytes may briefly exist in that broker's memory but
never in guest/upstream/general connector, RPC/queue, durable, log, diagnostic,
or crash surfaces. Credential export to a general connector is unsupported.
Goal:
controlled hosted extension
effects with truthful remote outcomes. Deliverables: host-call broker, typed
effect-capability descriptors, distinct lifecycle/outcome/resolution/
compensation receipts, reconciliation deadline/escalation boundary, and
authorized manual-resolution boundary; single-use dispatch-authorization
receipts, grant/service-principal redemption, and per-kind quota settlement/
compensation accounting integration; include conditional-write broker,
precondition outcome mapping, provider capability validation, and reviewed-
unconditional-exception owner/guard/attempt enforcement plus transmission-
window/unique-claimant/executor-boundary/no-permit-transport enforcement.
Include provider-execution-profile admission, scoped credential redemption,
lineage/epoch/profile-governance, rotation-state/evidence/deadline, credential-
capability snapshot/semantic-evaluator/safe-subset/whole-credential-quarantine
enforcement, rotation-guard/orphan/count enforcement, credential-operation/TCB placement, pool-
partition, egress, memory-canary, and residual-blast-radius evidence.
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
reconstruction/transport, digest authorization, duplicate instruction, executor
failover/compromise, arbitrary unclaimed provider socket use, secret-handle or
provider-account substitution, cross-tenant credential redemption, unrestricted
shared-credential admission, egress/TLS/DNS/redirect/general-proxy bypass,
profile/account/credential/broker epoch substitution/rollback, emergency
revocation, account suspension, unauthorized/self-approved activation, hidden
expansion, stale fence/tombstone, credential ABA, every rotation crash/unknown/
evidence/deadline/outage state, restored dual redemption, permission/role/group/
trust drift, concurrent rotation/idempotency/takeover/orphan/count-limit failure,
wildcard/deny/resource/condition comparison, evaluator downgrade/budget
exhaustion, queued/claimed/non-privileged quarantine bypass, callback reorder,
stale poll, policy-revision mismatch, restored
snapshot, stale instruction/restored
handle, signing/mTLS/HSM export, bearer material or HTTP/TLS/socket outside the
broker TCB, caller-owned claim, redirect/diagnostic/crash memory leak,
clock rollback, uncertain-start retransmission, provider
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
attributable. A compromised executor is bounded to its admitted provider
execution profile and cannot obtain platform-wide keys, general writes,
unclaimed credentials, or arbitrary network reach.
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
Each handle redemption is also bound to the immutable
`ProviderExecutionProfile`, exact claimed receipt, tenant/provider/account/
action/request digest/destination, and expiry. The secret broker issues the
least privilege and shortest practical credential supported by the provider;
it cannot return a reusable plaintext credential or authorize an unclaimed
socket operation. Hosted connector profiles preserve the same deny-by-default
egress/TLS/DNS/redirect controls and publish their remaining credential and
executor-compromise blast radius.
The handle also binds the current authoritative profile generation and profile/
account/credential/broker-policy epochs. Redemption rechecks them, rotation
locally activates its successor atomically under the one-lineage-owner rotation
guard while remote provisioning/revocation and orphan inventory reconcile
asynchronously; pending/orphan credentials remain quota-charged, and restore
never revives an old handle. Profile activation evidence and the current
credential-capability snapshot/epoch plus reviewed semantic evaluator result
are mandatory. Superset, incomparable, or unknown comparison quarantines all
handles and operations for the credential; plugin manifests cannot grant
lifecycle or rotation authority.
The manifest selects non-exportable signing/mTLS/HSM operation, brokered bearer
transmission, or unsupported. In the bearer profile, the hardened broker owns
authorization serialization, redirects, TLS, claim, and socket; temporary bearer
bytes stay inside that broker TCB and its memory-canary boundary.
Define plugins as stateless by default; any state capability is explicitly
tenant/plugin/instance namespaced, schema-versioned, quota-bound, exportable,
erasable, migratable, and registered in `0.51.2`. Goal: least-authority plugins. Deliverables:
manifest/evaluator, non-extractable secret-operation broker, authenticated HTTP/
signing/token/certificate host operations, provider-execution-profile evaluator,
scoped-handle redemption receipts, and optional plugin-state port.
Include profile/account/credential/broker epoch guards, profile lifecycle/
approval/tombstone validation, rotation state/evidence/deadline reconciliation,
credential-capability snapshot/epoch/freshness validation, the
credential-operation-profile evaluator, brokered-bearer TCB declaration, and
HTTP/TLS/redirect/diagnostic/crash memory canaries.
Verification: forging, scope escalation, state namespace collision, quota/
migration/deletion failure, handle extraction/reuse, guest-memory secret
canaries, broker confused deputy, derived-header leakage, stale/revoked handles,
claimed-receipt/request/account/action/destination substitution, arbitrary
unclaimed socket use, cross-tenant handle redemption, unrestricted shared
credential, egress/TLS/DNS/redirect/general-proxy bypass, and policy change
pass; include emergency revocation, account suspension, credential ABA, stale/
restored handle, epoch rollback, unauthorized activation/semantic expansion,
rotation crash/unknown/dual-redemption failure, provider permission drift/stale
snapshot, rotation concurrency/idempotency/takeover/orphan/count-limit failure,
semantic evaluator downgrade/budget failure, unsafe subset admission, whole-
credential quarantine bypass, key export, bearer escape from the hardened
broker, caller-owned claim/socket, and memory-canary failures. Exit criteria:
plaintext credentials never enter guest
memory through any supported plugin API; exceptions are separate hosted
products and cannot inherit this plugin-security claim; no supported profile
turns a credential broker or executor into a general secret, database, or
network authority. `v0.114.0
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
the SDK exposes neither a raw-secret read nor a way to mint, extend, replay, or
transport a start permit. Its testkit requires unique claim/worker/lease/permit-
digest binding, status-only replay, ambiguous-delivery reconciliation, and no
persisted permit representation. It models the supported split profile as
immutable authenticated instruction/status RPC to a trusted executor that owns
claim plus provider socket; no transferable permit API is exposed. It also
models immutable `ProviderExecutionProfile` admission, exact claim-bound opaque
secret operations, pool trust-domain partitioning, and deny-by-default
destination/TLS/DNS/redirect policy. It includes authoritative profile/account/
credential/broker epochs, rotation/restore fixtures, non-exportable key-operation
profiles, profile-governance command/approval/tombstone fixtures, asynchronous
rotation/evidence/unknown/deadline/outage fixtures, credential-capability
snapshot/epoch/semantic-comparison/safe-subset/whole-quarantine fixtures,
rotation-guard/takeover/orphan/count fixtures, and a brokered-bearer simulator that owns header/
redirect/TLS/claim/socket while instrumenting memory canaries. Goal: safe
integration development.
Deliverables: private SDK/testkit, broker-operation mocks, guest-memory canary
harness, provider-execution/egress fixtures, and conformance suite.
Verification: principal/tenant/
audience confusion, SSRF, token replay, impersonation, handle extraction,
plaintext credential in guest memory, pagination loops, secret logs, and
malformed remote data, validator/resource/account substitution, ABA recreation,
provider conditional downgrade or ignored header, silent refresh, and response-
loss ambiguity, exception scope/revocation/expiry/final-attempt/restore, and
unguarded unconditional selection, long pause, expired/substituted deadline,
revocation before start claim, clock rollback, duplicate shared-credential
workers, claim-response loss, lease takeover, claimant/permit substitution,
permit replay/reconstruction/transport, digest authorization, duplicate
instruction, executor failover/compromise, arbitrary unclaimed socket use,
secret-handle/account substitution, cross-tenant credential reuse, unrestricted
shared-credential admission, egress/TLS/DNS/redirect/general-proxy bypass, and
profile/account/credential/broker epoch rollback, emergency revocation, account
suspension, unauthorized activation/semantic expansion/stale tombstone,
credential ABA, every rotation crash/unknown/evidence/deadline/outage state,
rotation concurrency/idempotency/takeover/orphan/count-limit failure, semantic
wildcard/deny/resource/condition comparison, evaluator downgrade/budget
exhaustion, quarantine bypass, permission/role/group/trust drift, callback reorder, stale polling, policy-
revision mismatch, stale/restored snapshot, stale/restored handle, signing/mTLS
key export, bearer escape/caller-owned claim/socket/memory-canary failure, and
uncertain retransmission pass.
Exit criteria:
connectors pass conformance before
activation and cannot request plaintext credentials, arbitrary provider
operations, unrestricted shared credentials, or general network proxying.
`v0.117.0 implementation
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
status—but never permit material. The agent-local trusted executor owns claim
plus private-system socket and consumes its sealed permit locally; the central
service and spool exchange immutable authenticated instructions/status only.
The spool pins the admitted `ProviderExecutionProfile` digest and opaque scoped
secret-handle reference, never plaintext secret material. Agent credentials are
tenant/provider/account/action/request/destination/claim bound, least-privilege,
and short-lived where the provider supports it. Local egress, TLS identity,
resolved-address/DNS-rebinding, and redirect enforcement are deny-by-default;
the agent cannot become a general proxy. Agent executor pools are partitioned
by the supported bounded trust domain, and each profile documents its residual
compromise radius.
The spool also pins profile generation and profile/account/credential/broker
epochs; the local claim/redemption rechecks them. Rotation, suspension,
revocation, broker-policy change, and restore make stale work non-redeemable.
The spool pins profile activation evidence, current rotation state, and the
rotation guard/idempotency/takeover/orphan/count state and credential-capability
snapshot/epoch/freshness/semantic-evaluator result. Superset, incomparable, or
unknown comparison invalidates all spooled work for that credential. It cannot approve a
profile, advance remote rotation, refresh provider permissions, or bypass a
revocation tombstone; those remain authoritative control-plane/reconciler work.
Non-exportable key profiles expose operations only. Bearer/API-key profiles put
authorization serialization, redirects, TLS, claim, and private-system socket
inside the hardened agent broker/executor TCB; bearer bytes never enter the
spool, central service, general agent components, or diagnostics.
Offline replay cannot refresh, weaken, substitute, or consume another exception,
extend a deadline, return or transport a permit, authorize from its digest, or
retransmit a claimed/possibly started request. Capacity-policy
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
restore/reconstruction/transport, digest authorization, duplicate instruction,
executor failover/compromise, uncertain transmission retry, and offline limits
pass; also test arbitrary unclaimed socket use, secret-handle/account
substitution, cross-tenant credential reuse, unrestricted shared-credential
rejection, and egress/TLS/DNS/redirect/general-proxy bypass.
Also test epoch substitution/rollback, emergency revocation, account suspension,
unauthorized activation/hidden expansion/stale tombstone, rotation/ABA and every
crash/unknown/evidence/deadline/outage state, restored dual redemption,
rotation concurrency/idempotency/takeover/orphan/count-limit failure, wildcard/
deny/resource/condition comparison, evaluator downgrade/budget exhaustion,
whole-credential quarantine bypass, permission/role/group/trust drift, callback reorder, stale polling, wrong policy
revision, restored snapshot, stale/restored handle, signing/mTLS export, bearer material outside
the broker TCB, caller-owned claim/socket, and memory-canary failure.
Exit criteria: agent
compromise is bounded and revocable without making Vitheim a general OAuth
issuer, credential oracle, database writer, or network proxy.
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
