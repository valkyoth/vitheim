# Threat Model

Status: initial repository baseline; expand with every release

## Security Objectives

Vitheim must preserve tenant isolation, authorization correctness, event and
evidence integrity, availability under bounded hostile input, confidentiality
of records and secrets, deterministic replay, safe recovery, and explainable
decisions. Secure failure is preferred to an unsupported fallback.

## Trust Boundaries

The complete design anticipates boundaries between:

- unauthenticated clients and public APIs;
- authenticated users and tenant-scoped command/read policy;
- tenants and every shared cache, queue, index, blob, log, and database;
- deterministic domain logic and hosted I/O;
- API processes, workers, ingest, indexers, agents, and operators;
- Vitheim and identity, database, storage, search, mail, webhook, and AI
  providers;
- host and capability-restricted WASM components;
- source repository, CI runners, build tools, release evidence, and artifacts;
- online systems, backups, exports, imports, and disaster recovery.

## Adversaries

- unauthenticated remote attackers;
- malicious or compromised tenant users and administrators;
- a tenant attempting cross-tenant access or exhaustion;
- compromised connectors, agents, plugins, identity providers, or AI models;
- malicious imported records, attachments, framework packs, and workflows;
- supply-chain attackers targeting source, tools, dependencies, CI, tags, or
  artifacts;
- insiders abusing privileged or break-glass access;
- accidental operator errors that produce equivalent security impact.

## Primary Threats And Required Controls

| Threat | Mandatory controls |
| --- | --- |
| Cross-tenant disclosure or mutation | Non-optional tenant types, policy at every boundary, partitioned tests, cache/index/blob isolation |
| Tenant data survives export/hold/erasure/closure | Foundation lifecycle descriptors, complete registry backfill plus prospective generated gate, explicit retention precedence, typed honest evidence, disposition receipts, closure policy/blocker |
| IDOR, authority/target-state TOCTOU, stale/deleted/superseded local target, remote resource ABA/validator downgrade or refresh, grant-lineage fork, double/final-attempt redemption, two-stream dispatch, offline-human impersonation, or confused deputy | Typed commands, immutable tenant/initiator/delegation/capability/target/request binding, typed live/grant/service authority, one grant-lineage stream, co-located redemption guard, stable attempt claim/receipt, bounded canonical dispatch-authority fence set with monotonic local epochs, typed co-located local target fence, separate provider/account/resource/validator-bound remote concurrency profile, strong conditional mutation or reviewed exception, typed precondition failure, no silent refresh, no worker-derived authority |
| Event/evidence tampering | Append-only journal semantics, expected versions, integrity chains, signed checkpoints, restore verification |
| Replay, duplicated effects, or ambiguous provider outcomes | Single-aggregate local commits, stable effect ID/digest, distinct execution/outcome/resolution/manual/compensation types, provider-evidence strength, reconciliation deadline/fencing, no blind privileged/non-compensable retry |
| Partial quota reservation, cross-partition transaction, capacity or encumbrance duplication/loss, free-at-both-ends transfer, tenant/parent/period/region/lane/class reclassification, deadlock/retry duplication, token/member substitution, refund/write-off fraud, cross-kind settlement, liability loss, or recovery starvation | Local non-aggregate quota authority, canonical all-or-none acquisition in one partition, immutable set token/membership, per-kind fenced capacity leases, expiry-safe encumbrance, stable outbox/inbox transfer state and receipts, immutable accounting hierarchy/class/authorization binding, distinct authorized adjustment for cross-class movement, authenticated acknowledgement plus old-epoch fence proof, conservative double-entry conservation over at-least-once delivery, parent/free-remainder conservation, canonical composite lock order, bounded identity-preserving retry, whole-set restore/quarantine, active/active write rejection, per-kind evidence, separate compensation, fair recovery partition |
| Parser/resource exhaustion | Explicit byte/item/depth/allocation/work limits, cancellation, quotas, fuzzing and load tests |
| Injection and unsafe content | Canonical parsers, contextual encoding, attachment quarantine, no arbitrary scripts or SQL exposure |
| Workflow or policy bypass | Deterministic IR, version pinning, simulation, approval, signed activation, fail-closed evaluator |
| Plugin escape or secret extraction | Capability manifest, no direct database access, no plaintext credential in guest memory, brokered authenticated operations, memory/fuel/time/output/network limits, signed rollout |
| Workload identity, bearer theft, or issuer confusion | External-issuer resource-server validation, sender-constrained privileged tokens, restricted lower-assurance bearer policy, immutable issuer-subject/audience/tenant binding, no local token endpoint |
| AI prompt/tool abuse | Permission-filtered context, provenance, tainting, structured proposals, independent policy and human approval |
| Secret leakage | Non-extractable handles, host-brokered secret operations, redacted errors/logs, no core or Wasm plaintext secret storage, rotation and best-effort zeroization policy |
| Supply-chain compromise | No current dependencies, pinned tools/actions, lockfile, SBOM, read-only CI, signed provenance and pentest gate |
| Availability failure | Tenant quotas, per-tenant/work-class recovery ceilings and fair share, starvation bounds, non-borrowable emergency reserve, backpressure, poison queues, bounded retries, leases, provider-outage reconciliation and chaos testing |
| Historical authority conflicts with mandatory deletion | Rollup-substitution gate, independent disposition for raw/rollup/manifest/result/cache/export/checkpoint metadata, permitted non-sensitive tombstone, unknown history, immutable authority-loss fact |

## Initial `0.1.0` Attack Surface

The initial workspace has no server, networking, storage, parser, plugin, AI,
or executable product. Its attack surface is repository and build integrity:
malicious contributions, CI workflow changes, toolchain compromise, accidental
publication, policy bypass, misleading claims, and release-evidence forgery.

Controls include `publish = false`, no registry/git dependencies, read-only CI,
full action SHA pins, strict lints, source-size enforcement, SBOM generation,
versioned pentest reports, and a readiness gate that refuses a non-PASS report.

## Non-Goals And Non-Claims

Memory-safe Rust does not prove authorization, tenant isolation, cryptographic
correctness, side-channel resistance, availability, or safe operations. A
pentest is additional evidence, not a replacement for review, fuzzing,
conformance, formal methods, or recovery testing. `0.x` milestones are not
production-supported unless explicitly stated.

## Required Delta Process

Every release records new assets, actors, entry points, data flows, trust
boundaries, abuse cases, mitigations, tests, residual risk, and removed surface.
The pentest scope must cover that delta and relevant regression paths from the
previous tag.
