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
Status: planned. Setup: capability calls, effect IDs, authorization, idempotency, replay, audit. Goal: controlled hosted extension effects. Deliverables: host-call broker and event receipts. Verification: unauthorized calls, replay, confused deputy, cross-tenant handles, partial failure pass. Exit criteria: every effect passes independent policy. `v0.113.0 implementation stop reached. Run pentest for this exact commit.`

## `0.114.0` — Capability And Secret Handles
Status: planned. Setup: manifests bind plugin digest, tenant, instance, action,
target, expiry, nonce, and policy version; opaque authenticated handles recheck
all bindings/current policy at redemption. External KMS/secret service retains
master keys, and brokered operations are preferred over plaintext release.
Define plugins as stateless by default; any state capability is explicitly
tenant/plugin/instance namespaced, schema-versioned, quota-bound, exportable,
erasable, and migratable. Goal: least-authority plugins. Deliverables:
manifest/evaluator, secret operation broker, and optional plugin-state port.
Verification: forging, scope escalation, state namespace collision, quota/
migration/deletion failure, extraction, reuse,
stale/revoked handles and policy change pass. Exit criteria: plaintext secrets
never enter guest memory unless explicitly unavoidable/reviewed. `v0.114.0 implementation stop reached. Run pentest for this exact commit.`

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

Goal: provide a storefront where tenants can discover extensions without making
browse, purchase, download, install, permission approval, or activation the same
security decision.

Deliverables: catalog and listing aggregates, signed catalog snapshots, package
transparency/provenance view, permission-diff UI/API, tenant allow/deny policy,
review workflow, mirror protocol, and operator/publisher runbooks.

Verification: publisher impersonation, typosquatting/confusable names,
listing/package substitution, hidden capability change, malicious update,
downgrade, license/privacy omission, review bypass, popularity/rating abuse,
revoked/offline package, mirror rollback, and tenant visibility leaks pass.

Exit criteria: only a separately approved signed package can move from catalog
discovery to installed state, and activation still requires explicit current
capability approval. `v0.116.1 implementation stop reached. Run pentest for this exact commit.`

## `0.117.0` — Connector SDK And Testkit
Status: planned. Setup: connector capabilities, auth handles, cursor/idempotency, schemas, rate/backoff, test simulation. Goal: safe integration development. Deliverables: private SDK/testkit and conformance suite. Verification: SSRF, replay, impersonation, pagination loops, secret logs, malformed remote data pass. Exit criteria: connectors pass conformance before activation. `v0.117.0 implementation stop reached. Run pentest for this exact commit.`

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

Setup: map provider tenant/workspace, alert/incident/entity/vulnerability IDs,
delta cursors and webhooks, raw evidence retention, schema versions, paging,
throttling/backoff, deletion/update claims, asset/identity links, severity/status,
checkpoint recovery, and optional outbound actions. Outbound acknowledgement or
case updates require separate capabilities and current policy.

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

Setup: map source tenant/container, asset and agent identity, network/cloud
identifiers, plugin/finding identity, severity and scoring versions, first/last
seen/fixed/reopened state, evidence, scan coverage, cursor/export checkpoints,
asset reconciliation, deletion claims, and raw payload retention.

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
Status: planned. Setup: device identity, enrollment, mTLS, capability policy, encrypted spool, update, revoke, no inbound listener. Goal: reach private systems safely. Deliverables: agent protocol/runtime and operator controls. Verification: takeover, identity cloning, spool extraction, replay, downgrade, offline limits pass. Exit criteria: agent compromise is bounded and revocable. `v0.119.0 implementation stop reached. Run pentest for this exact commit.`

## `0.120.0` — Plugin Compatibility And Isolation Suite
Status: planned. Setup: ABI/runtime/version matrix, tenants, concurrent plugins,
failures, upgrades, and mandatory authority/tenant registry entries for every
host call/state surface. Goal: prove isolation and compatibility. Deliverables:
adversarial suite, authorization cases, and evidence matrix. Verification:
cross-plugin/tenant state, resource starvation, handle confusion, unregistered
interface, upgrade/rollback, sandbox escapes pass. Exit criteria: every supported
profile and authority-bearing interface has evidence. `v0.120.0 implementation
stop reached. Run pentest for this exact commit.`
