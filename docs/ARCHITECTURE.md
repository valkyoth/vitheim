# Vitheim Architecture

Status: normative baseline for `0.1.0`

## Product Decision

Vitheim is a secure, explainable work and evidence graph, not a direct clone of
an existing ticketing product. It combines universal work concepts with typed
first-party applications for service management, security operations, assets
and services, risk and compliance, knowledge, custom cases, and controlled
automation.

The initial deployment architecture is a modular deployable. Separate API,
worker, ingest, indexer, agent, and CLI processes become optional deployment
choices only after the crate boundaries work inside one process.

Vitheim is API-first. The hosted API contract/transport and UI are separate
crates and deployable boundaries. The first-party UI consumes the same
versioned commands, policy-filtered reads, consistency tokens, and errors
available to other authorized clients; it has no privileged repository,
dispatcher, database, or hidden administration path.

The interface is a governed composition system rather than one fixed screen.
Vitheim supplies safe layout primitives, panels, lists, graphs, forms, actions,
navigation, and supported workspace profiles. Tenants may compose these like
Lego blocks within schema, policy, accessibility, performance, and provenance
constraints. A small organization may intentionally use a unified operations
page, while a larger organization may separate tickets, incidents, alerts,
vulnerabilities, assets, and administration without changing domain or
authorization semantics.

## Architectural Laws

1. Domain logic performs no I/O and reads no ambient clock, randomness, files,
   environment, database, network, AI provider, or notification service.
2. State changes enter through typed commands and yield either typed events or
   explicit rejection. No boundary directly mutates domain records.
3. Events are immutable facts. Projections and indexes are disposable and
   rebuildable.
4. Authorization applies to commands, reads, fields, search, workflow,
   plugins, AI context, exports, attachments, webhooks, and notifications.
5. Tenant identity is mandatory data, never an optional query filter.
6. Frameworks such as ITIL, NIST, and DORA remain signed, versioned data packs,
   not hard-coded shortcuts around policy.
7. AI is optional, untrusted, provenance-recorded advice with no implicit
   authority and no direct storage access.
8. Storage adapters implement every applicable versioned
   `AtomicWorkCommitBundle` variant—command, consumer, timer, activity, and
   poison/dead-letter—plus snapshots, projections, scheduler/quota state,
   checkpoints, and idempotency. An adapter that cannot atomically validate
   fencing and commit receipt/effects/audit/outbox/integrity/quota fails
   capability negotiation. Each bundle advances at most one authoritative
   aggregate stream and contains local durable effects only. External calls
   execute from committed intents and return through a later bundle; Vitheim
   never claims a distributed database/provider transaction or exactly-once
   remote execution. Every external effect has a stable identity, request
   digest, declared retry/idempotency/reconciliation/compensation capability,
   and separately typed execution lifecycle, provider outcome, resolution
   source/evidence, operational-resolution workflow, and compensation state.
   Manual assessment never becomes verified provider truth. Unknown privileged
   or non-compensable work is reconciled or escalated, never blindly replayed;
   late provider evidence and manual decisions are retained and resolved under
   fenced concurrency rules. Intent creation always requires authorization and
   immutably binds tenant, initiator, delegation, capability, target, purpose,
   request, policy, authentication assurance, and typed execution authority. A
   dispatch redeems current `LiveSubjectAuthority`, immutable
   `ApprovedExecutionGrant`, or current `ServicePrincipalAuthority`. An approval
   grant binds exact effect/request/target/version, purpose, quorum, separation,
   assurance at approval, not-before/expiry, attempts, policy version, and
   revocation rules. The worker authenticates as itself, never as an offline
   human; session expiry alone does not invalidate a valid grant, while target
   drift, explicit revocation, tenant suspension, exhausted window/attempts, and
   required approver/policy revalidation fail closed. Each grant lineage has
   exactly one authoritative owner stream. Inline
   approval/grant state advances one aggregate; a dedicated lineage is created
   later from an immutable approval receipt through outbox/process-manager work.
   Pre-issuance revocation is authoritative over delayed issuance, and successor
   creation atomically leaves its predecessor permanently non-redeemable in that
   same owner stream. Redemption never advances that stream in the effect
   transaction: a co-located, fenced `GrantRedemptionGuard` is local
   transactional authority. The lineage-owner transaction creates/revokes/
   replaces it; the effect transaction compare-and-claims one bound attempt and
   atomically records its dispatch receipt/outbox. The shared guard serializes
   revocation against
   final-attempt claims, and restore cannot resurrect consumption. A reviewed
   capability declares `CommitBound` or
   `CommitAndDispatch`, with the latter as default;
   privileged, destructive, secret-bearing, containment, and compensation
   effects always use the fenced single-use dispatch gate. Worker or lease
   identity never grants business authority, and a changed binding requires a
   new intent.
   Every dispatch also locks a bounded canonical `DispatchAuthorityFenceSet`
   containing the applicable monotonic tenant, subject/principal, session/
   credential/mapping, delegation, group/role/relationship, and policy epochs.
   Authority changes increment their local epoch with the owner event; whichever
   epoch update or dispatch transaction wins establishes the order. External-
   only bounded-stale facts cannot authorize privileged effects without an
   authoritative co-located local revocation epoch.
   Current-target dispatch also locks a typed `DispatchTargetFence`. The effect
   aggregate's expected version/digest is sufficient when it is the target;
   otherwise the target owner atomically maintains a co-located fence binding
   tenant, kind/ID, version/digest, lifecycle, and deletion/supersession epoch.
   Remote, cross-shard, and projection-only current-target semantics are
   unsupported, and restore cannot reuse an earlier target epoch.
   Provider-owned mutable targets use a separate
   `RemoteTargetConcurrencyProfile`, never a local fence. Conditional mutation
   binds the exact provider/account/resource, strong validator and provenance,
   admitted provider capability/version, request digest, and idempotency key.
   The provider enforces the precondition after local commit; failure is typed
   non-acceptance, never silent validator refresh. Privileged/destructive/
   containment work requires strong conditional mutation unless an exact,
   expiring reviewed unconditional exception applies. That exception is first-
   class one-owner authority binding exact scope, approvals, policy/provider
   epochs, time, and attempts; a co-located guard serializes revocation,
   supersession, capability change, and attempt claims while dispatch advances
   only the effect stream. Response loss remains unknown and reconciling.
   A committed authorization receipt is not permanent transmission authority.
   It binds `redeemed_at`, an immutable `transmit_before` derived from the
   earliest authority/exception/target/provider bound and a platform maximum,
   one effect attempt, worker/service audience, provider/account, request
   digest, and admitted epochs. Immediately before I/O, a local
   `ClaimTransmissionStart` rechecks current fences and issues one short,
   monotonic single-use permit. Definite expiry before transmission requires
   fresh authority; uncertainty after the start claim becomes `OutcomeUnknown`,
   never ordinary redelivery. Restore and clock rollback cannot extend it.
   Each effect carries a bounded atomic set of typed quota claims rather than
   one universal reservation. Concurrency releases with its local lease;
   consumable operations follow declared evidence rules; provider-rate tokens
   become non-refundable at transmission; estimated liabilities hold and settle
   to actual cost or distinct audited write-off; retained bytes follow verified
   local allocation/deletion. Only provider-dependent claims remain held for
   unknown outcomes. Quota ledgers/claim sets are co-transactional local
   authority, not aggregate streams. Each canonical set reserves all-or-none
   under deadlock-free resource ordering, returns an opaque token/digest, and
   thereafter has immutable membership; bundles transition that exact set
   without reacquisition. Idempotent settlement and recovery bind set plus claim
   identity, and partial/corrupt sets are quarantined rather than reconstructed.
   Each set and work bundle share one local quota partition. Global/regional
   limits allocate fenced hierarchical capacity leases into local partitions;
   child capacity cannot exceed its parent and work never opens a cross-shard/
   region transaction. The `1.0.0` topology uses authoritative-region writes
   with fenced failover, not active/active authoritative multi-region writes.
   A lease binds kind, unit, period, and settlement policy. Expiry blocks new
   reservations but preserves spent or encumbered capacity; parents reclaim only
   proven free remainder. Outstanding claims settle against the original
   encumbrance or move through an outbox/inbox
   `QuotaCapacityTransferState` process manager. Stable transfer identity,
   epochs, digest, sequence, authenticated acknowledgement, and old-child fence
   proof provide receipt-idempotent local transitions over at-least-once
   delivery. Uncertain movement stays conservatively charged; double-entry
   recovery may overcharge temporarily but never frees capacity at both ends,
   and late evidence retains the original claim/transfer lineage. Transfer also
   freezes accounting owner, hierarchy root/parent lease, period, work/recovery
   lane, capacity class, residency/region, and source/destination authorization.
   Existing capacity never changes class; protected-to-business transitions are
   structurally invalid regardless of privilege. Only future unallocated parent
   capacity may be resized by a versioned, simulated, separation-of-duties
   `QuotaCapacityPolicy`. Each policy lineage owns exactly one parent; activation
   atomically appends its event and CAS-updates the co-located parent ledger
   under the current independently governed floor-set version. The policy cannot
   lower its own floor. Multi-parent changes are conservative process-manager
   rollouts, never distributed commands. Every delayed transfer transition
   rechecks its current local tenant, principal, and policy epochs; historical
   decisions are evidence, not authority.
   Composite transactions acquire stream head, authority fences, target fence,
   remote-mutation-exception guard, grant guard, quota lease/keys, uniqueness
   claims, then receipts in one canonical order.
   Only classified deadlocks receive bounded, identity-preserving retries.
   Compensation is accounted separately. Tenant/work-class
   partitioning, fair share, ceilings, starvation bounds, and a scoped emergency
   reserve keep reconciliation/security cleanup available without admitting
   tenant work or allowing one tenant to monopolize recovery.
9. Every untrusted parser, query, workflow, plugin, attachment, import, report,
   and export has explicit size, depth, time, memory, and work budgets.
10. Every important result is explainable from commands, events, policy,
    workflow, evidence, provenance, and versioned configuration.
11. The API is the product boundary; the UI is an API client and cannot acquire
    authority through layout, hidden endpoints, or direct domain/storage access.
12. User-composed interfaces can narrow discovery and presentation but never
    widen RBAC/ABAC rights, field visibility, query budgets, or command authority.
13. Organization federation never merges tenants. Shared spaces and managed-
    service relationships use explicit bilateral trust, resource projections,
    delegated capabilities, provenance, revocation, and bounded synchronization.
14. Plugin catalogs distribute signed capability requests, not ambient trust.
    Installation, permission approval, activation, upgrade, and revocation are
    separate governed actions.
15. A protected mutation commits its authoritative audit intent atomically with
    events, receipt, stream head, integrity links, and outbox. A protected read
    or download records its audit authorization receipt before releasing bytes.
16. Hosted telemetry follows one early tenant-safe bounded schema. Metrics,
    traces, logs, health, or exporter failure never become authority and never
    contain secrets, sensitive payloads, or unbounded attacker-controlled labels.
17. Customer-service observations used for SLI/SLO and service health form an
    authenticated append-only measurement plane. They are not Vitheim's own
    operational telemetry and cannot be synthesized from it implicitly. Raw
    observations cannot expire merely in favor of an authoritative rollup until
    its manifest is committed, integrity verified, externally checkpointed, and
    restore tested. A controlling mandatory-erasure, maximum-retention, or
    tenant-closure deletion obligation still proceeds when that proof is
    unavailable. Raw observations, rollup payload, source manifest, derived
    result, cache/projection, export, and linkable checkpoint metadata each
    receive an independent lifecycle decision. A rollup remains stored but non-
    authoritative only when independently permitted; otherwise covered derived
    surfaces are deleted or cryptographically erased, leaving only permitted
    non-sensitive tombstone/authority-loss evidence. Affected history becomes
    unknown/unavailable either way.
18. Provenance-bearing domains reuse one N1 source/observation identity,
    correction/supersession, confidence-policy, and four-clock model.
19. Secret plaintext is scoped, non-displayable, non-serializable through
    supported APIs, excluded from diagnostics and plugins, and handled under
    explicit per-platform best-effort memory assurances rather than claims of
    perfect erasure.
20. Semantic vector storage and embedding generation are separate ports and
    admission boundaries; production similarity requires evidence for both.
21. Every tenant-bearing durable, cached, indexed, backed-up, or externally
    copied surface registers its lifecycle contract. Export, hold, residency,
    topology migration, erasure, key destruction, restore, and closure cannot
    silently omit a surface or let related surfaces inherit one disposition
    decision. External-copy disposition uses typed evidence
    strength and never equates a provider attestation, unconfirmed deletion
    request, or unverifiable previously disclosed plaintext with locally
    verified deletion or controlled-key cryptographic erasure.
22. Vitheim is an OAuth resource server for workload authentication at `1.0.0`;
    an admitted external issuer authenticates clients and issues tokens.
    Privileged workload APIs require an admitted sender-constrained token/
    request profile. Any bearer profile is explicitly lower assurance,
    short-lived, narrow-audience, and restricted to non-privileged actions;
    replay caching is not represented as protection from first use of a stolen
    bearer token.
    Operating an OAuth authorization server requires a separate future
    milestone and is not implied by agent enrollment.
23. Plaintext credentials never enter Wasm guest memory. Plugins use opaque
    handles and host-brokered authenticated operations; an unavoidable
    plaintext integration is a separately isolated hosted profile outside the
    ordinary plugin claim.

## Layers

```text
N0: no_std, no allocator
  identifiers, time, errors, budgets, fixed values, capability IDs
                         ↓
N1: no_std + alloc
  commands, events, domain entities, workflow IR, policy, queries, evidence,
  neutral tenant-data lifecycle descriptors
                         ↓
H: hosted std ports and orchestration
  semantic storage, crypto provider, search, identity, runtime, plugin host
                         ↓
H: adapters and binaries
  databases, HTTP/TLS, OS services, UI, agents, deployment integrations
```

An inner layer may never depend on an outer layer. Third-party types may never
appear in a domain API. Vitheim currently admits no third-party Cargo crate;
hosted implementation begins only when the dependency policy and safe adapter
strategy for that milestone are explicitly approved.

## Planned Crate Families

- Foundation: `vitheim-id`, `vitheim-time`, `vitheim-error`,
  `vitheim-budget`, `vitheim-value`, `vitheim-codec`, `vitheim-schema`,
  `vitheim-capability`, `vitheim-context`, and `vitheim-fact-model`.
- Kernel: `vitheim-command`, `vitheim-event`, `vitheim-aggregate`,
  `vitheim-journal-model`, `vitheim-projection-model`, `vitheim-query`,
  `vitheim-audit-model`, `vitheim-evidence-model`, `vitheim-crypto-api`, and
  `vitheim-tenant`. The kernel has no optional-product dependency.
- Domains: focused work, incident, request, catalog, problem, change, release,
  alert, SecOps, vulnerability, risk, control, obligation, evidence, asset,
  software-asset, service, service-health, relationship, knowledge, SLA,
  SLI/SLO, on-call, paging, notification preference, status communication,
  approval, and case crates.
- Engines: kernel orchestration, workflow, policy, compliance, correlation,
  reconciliation, scheduling, notification, search planning, and reporting.
- Product boundaries: `vitheim-api-contract` owns transport-neutral public
  schemas, `vitheim-api-application` owns authorized use cases,
  `vitheim-api-http` is one hosted transport, and `vitheim-ui-client`,
  `vitheim-ui-composition`, and `vitheim-ui-shell` consume the API without
  depending on domain or storage crates.
- Hosted ports/adapters: storage, blobs, queues, customer measurements,
  paging/notification delivery, hosted status, search/index, embedding
  generation, human and workload identity, plugins, integrations, runtime,
  import/export, federation transport, and optional AI broker. API contract/
  application/transport crates remain separate from UI shell/composition/
  rendering crates.
- Optional product families: federation trust/shared-space/protocol/host,
  AI provider/broker, vendor connector packs, and plugin storefront crates
  depend inward on stable ports. Core/kernel and first-party domain crates must
  build and operate without them.

Crates are created only when their release begins. Empty speculative crates are
not accepted. The facade re-exports only reviewed capabilities.

## Core State Model

A `WorkItem` composes identity, lifecycle, ownership, timing, security labels,
relationships, collaboration, compliance context, and custom fields. Typed
aggregates add their own invariants; an incident, vulnerability, request, and
change are not aliases for one universal mutable ticket table.

All relationships are first-class, tenant-scoped, temporal, provenance-aware
records. Asset and service facts retain source, observation time, confidence,
evidence, and reconciliation decisions instead of silently overwriting values.
Cross-domain graph projections may connect teams, services, assets,
vulnerabilities, alerts, incidents, changes, evidence, and remediation work,
but every node and edge retains its source-domain identity and authorization.

Federated records remain owned by their source organization. A shared-space
projection contains explicit origin, audience, permitted operations, sync
position, retention, and revocation state. Remote facts never become local
authority merely because two Vitheim deployments are connected.

## Portability

The N0 and N1 layers target Linux, Windows, BSD, macOS, Android, iOS, browser or
component-model WASM where appropriate, and a future Aesynx port. Hosted
support is earned separately per platform profile. No current claim implies an
Aesynx runtime exists; the architecture merely avoids locking it out.

## Compatibility Dimensions

Product version, public API version, event schema, workflow IR, policy
language, plugin ABI, framework pack, export format, and agent protocol are
independently versioned. A product release never silently equates them.
