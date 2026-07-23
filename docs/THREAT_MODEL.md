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
| IDOR, authority/target-state TOCTOU, stale/deleted/superseded local target, remote resource ABA/validator downgrade or refresh, unconditional-exception scope reuse/revocation loss/final-attempt duplication, grant-lineage fork, two-stream dispatch, offline-human impersonation, or confused deputy | Typed commands, immutable effect binding, typed live/grant/service authority, one grant-lineage stream and guard, bounded dispatch-authority fences, typed local target fence, provider/account/resource/validator-bound remote profile, strong conditional mutation or one-owner scoped/expiring/attempt-bounded `RemoteMutationException`, co-located exception guard, provider-capability epoch, typed precondition failure, no silent refresh or worker-derived authority |
| Event/evidence tampering | Append-only journal semantics, expected versions, integrity chains, signed checkpoints, restore verification |
| Replay, duplicated effects, stale/revoked provider profiles or credentials, bearer-token export, audience-sharing workers claiming one transmission, executor bypass through reusable credentials or unrestricted egress, permit leakage across service boundaries, indefinitely delayed admitted dispatch, or ambiguous provider outcomes | Single-aggregate local commits, stable effect ID/digest, immutable redemption/transmission deadline, current-fence transmission-start CAS, globally unique claim bound to exact worker instance and lease generation/fence, audience/provider/request/effect/permit-digest binding, trusted executor owning claim plus socket, immutable instruction-only split-service protocol, sealed consumed-by-value non-serializable permit, one-time process-local return, authoritative profile lineage plus monotonic profile/account/credential/broker epochs, revocation/rotation-versus-redemption linearization, exact-claim-bound scoped secret operations, non-exportable signing/mTLS/HSM profiles, bearer HTTP/TLS/socket wholly inside the hardened broker/executor TCB, memory/diagnostic canaries, no master-key/general DB authority, least-privilege credentials, destination/TLS/DNS/redirect enforcement, partitioned executor trust domains, explicit residual provider blast radius, restore anti-resurrection, status-only replay, monotonic start enforcement, ambiguous-claim reconciliation, distinct execution/outcome/resolution/manual/compensation types, provider-evidence strength, no transferable `1.0.0` permit or uncertain-start/blind privileged/non-compensable retry |
| Partial quota reservation, cross-partition transaction, capacity duplication/loss, free-at-both-ends transfer, protected-class conversion through transfer/adjustment/policy abuse, floor-reduction-then-spend approval reuse, incomplete rollout parent set, stale post-finalization parent activation, independent rollback after partial activation, cancelled prepared-parent capacity stranded or independently restored, superseded rollout replay, platform-floor key confusion or downgrade, non-atomic capacity-policy activation, transient multi-parent over-allocation, stale delayed activation authority, deadlock/retry duplication, token/member substitution, refund/write-off fraud, cross-kind settlement, liability loss, or recovery starvation | Local non-aggregate quota authority, canonical all-or-none sets, immutable transfer hierarchy/class/authorization, existing-capacity class immutability, one-parent `QuotaCapacityPolicy` lineage, co-located parent-ledger CAS, independent protected-floor capability/history, operational fences and obligation simulation, durable versioned/digested fully scope-keyed platform-floor admission ratchet, total overflow-checked key-set migration, strict mixed-version floor and stale-node startup rejection, cross-command separation, root-owned canonical parent manifest/membership epoch and single active rollout generation, atomic permanent successor supersession, direct cancellation only before preparation, complete root-owned cancellation-recovery successor after preparation, conservative parents/no independent restore, idempotent restore-safe recovery receipts and deadline escalation, complete bound preparation set and total conservation, root finalization as permission only, fresh local parent activation CAS over active generation/ledger/floor/obligations/root/current fences with blocked/reconciliation state on drift, successor-root rollback over current actual limits, cancelled/superseded message and restore rejection, conservative multi-parent rollout, per-transition current tenant/principal/policy fences, stable receipts, authenticated ack plus old-epoch fence, conservative double-entry conservation, canonical composite lock/retry, whole-set restore/quarantine, active/active rejection, per-kind evidence, separate compensation, fair recovery partition |
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
