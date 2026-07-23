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
   remote execution.
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
    observations cannot expire in favor of an authoritative rollup until its
    manifest is committed, integrity verified, externally checkpointed, and
    restore tested.
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
    silently omit a surface. External-copy disposition uses typed evidence
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
  commands, events, domain entities, workflow IR, policy, queries, evidence
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
