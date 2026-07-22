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
8. Storage adapters implement semantic contracts such as atomic append,
   expected version, outbox, checkpoints, leases, and idempotency—not generic
   CRUD exposed to domain code.
9. Every untrusted parser, query, workflow, plugin, attachment, import, report,
   and export has explicit size, depth, time, memory, and work budgets.
10. Every important result is explainable from commands, events, policy,
    workflow, evidence, provenance, and versioned configuration.

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
  `vitheim-capability`, and `vitheim-context`.
- Kernel: `vitheim-command`, `vitheim-event`, `vitheim-aggregate`,
  `vitheim-journal-model`, `vitheim-projection-model`, `vitheim-query`,
  `vitheim-audit-model`, `vitheim-evidence-model`, `vitheim-crypto-api`, and
  `vitheim-tenant`.
- Domains: focused work, incident, request, catalog, problem, change, release,
  alert, SecOps, vulnerability, risk, control, obligation, evidence, asset,
  software-asset, service, relationship, knowledge, SLA, approval, and case
  crates.
- Engines: kernel orchestration, workflow, policy, compliance, correlation,
  reconciliation, scheduling, notification, search planning, and reporting.
- Hosted ports/adapters: storage, blobs, queues, search, identity, plugins,
  API, integrations, runtime, UI, import/export, and optional AI broker.

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

## Portability

The N0 and N1 layers target Linux, Windows, BSD, macOS, Android, iOS, browser or
component-model WASM where appropriate, and a future Aesynx port. Hosted
support is earned separately per platform profile. No current claim implies an
Aesynx runtime exists; the architecture merely avoids locking it out.

## Compatibility Dimensions

Product version, public API version, event schema, workflow IR, policy
language, plugin ABI, framework pack, export format, and agent protocol are
independently versioned. A product release never silently equates them.

