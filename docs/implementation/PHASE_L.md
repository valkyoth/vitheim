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
Status: planned; audited runtime required. Setup: fuel, memory, imports, deterministic clock/random inputs, output, cancellation. Goal: sandboxed pure extensions. Deliverables: runtime port/adapter and determinism harness. Verification: fuel/memory bypass, nondeterminism, traps, covert imports, escape tests pass. Exit criteria: pure components have no ambient authority. `v0.112.0 implementation stop reached. Run pentest for this exact commit.`

## `0.113.0` — Effectful Component Execution
Status: planned. Setup: capability calls, effect IDs, authorization, idempotency, replay, audit. Goal: controlled hosted extension effects. Deliverables: host-call broker and event receipts. Verification: unauthorized calls, replay, confused deputy, cross-tenant handles, partial failure pass. Exit criteria: every effect passes independent policy. `v0.113.0 implementation stop reached. Run pentest for this exact commit.`

## `0.114.0` — Capability And Secret Handles
Status: planned. Setup: manifests bind plugin digest, tenant, instance, action,
target, expiry, nonce, and policy version; opaque authenticated handles recheck
all bindings/current policy at redemption. External KMS/secret service retains
master keys, and brokered operations are preferred over plaintext release.
Goal: least-authority plugins. Deliverables: manifest/evaluator and secret
operation broker. Verification: forging, scope escalation, extraction, reuse,
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

## `0.119.0` — Outbound-Only Integration Agent
Status: planned. Setup: device identity, enrollment, mTLS, capability policy, encrypted spool, update, revoke, no inbound listener. Goal: reach private systems safely. Deliverables: agent protocol/runtime and operator controls. Verification: takeover, identity cloning, spool extraction, replay, downgrade, offline limits pass. Exit criteria: agent compromise is bounded and revocable. `v0.119.0 implementation stop reached. Run pentest for this exact commit.`

## `0.120.0` — Plugin Compatibility And Isolation Suite
Status: planned. Setup: ABI/runtime/version matrix, tenants, concurrent plugins, failures, upgrades. Goal: prove isolation and compatibility. Deliverables: adversarial suite and evidence matrix. Verification: cross-plugin/tenant state, resource starvation, handle confusion, upgrade/rollback, sandbox escapes pass. Exit criteria: every supported profile has evidence. `v0.120.0 implementation stop reached. Run pentest for this exact commit.`
