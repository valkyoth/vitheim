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

Composite-law content and authority are separate boundaries. Canonical manifest
digests detect alteration, while only an independently anchored compiled or
platform-law-signed active admission catalog can trust an exact generation
tuple. The reviewed planning superset is never a runtime catalog. Every
activation-floor catalog has complete effective ancestry, excludes future
tuples, carries one exact profile, and content-binds its complete
payload/envelope. It remains applicable until explicit successor activation,
and the release checker proves exactly one applies to every milestone.
`PlatformLawCatalogLineage` has one global owner and expected-version
activation/succession/revocation/emergency-distrust commands; separate local
owners are exact enforcement-partition placement generations and maintain
identity-fence/catalog/distrust/trusted-time ratchets. A third owner runs the
durable catalog rollout process manager over immutable placement manifests,
transactional messages, and prepare/convergence receipts; it coordinates but
never turns the operation into a distributed transaction or topology
authority. The bootstrap topology is a compiled immutable singleton.
`VIT-INV-060` later becomes the sole dynamic topology-generation owner with
expected-version successor manifests, monotonic member placement generations,
fences, and tombstones; rollout generation 2 consumes its authenticated
snapshot only after epoch 12 activates/converges under generation 1 and
every required local owner has admitted generation 2, authorizing
initialization, exact equality verification, and the dormant-singleton handoff
CAS; static and dynamic sources
are never co-authoritative. Each catalog lineage has one monotonic active rollout
generation, irreversible `ActivationAuthorized` state with atomic receipt/
outbox and pinning, and permanent pre-authorization `Superseded` losers.
Workload identity is an executable hardware-attested profile or an
orchestrator-attested lease whose external issuer owns online single-use claims
and whose protected local owner atomically persists consumption/outcome. Typed
uncertainty blocks reissue and restore honors greatest claim high-watermarks;
offline authority is zero. Canonical receipts—including authorization and
global activation result—use only signed, sender-only authority-MAC, or
attested-channel-admission variants with replay and durable-integrity binding;
a disk key, digest, transport transcript, or ordinary row is not authority. One project-owned
canonical verifier serves runtime and release tooling. Stored manifests,
cloned runtimes, field-shaped text, untrusted clocks, and database
administrators cannot extend or reconstruct that authority.
Canonical semantic prose is never interpreted at runtime: a closed Rust
realization table binds every supported semantic ID to typed transitions,
outcomes, recovery, and tests. Every terminal generation reference includes its
complete predecessor closure across startup, storage, migration, import,
restore, failover, and release evidence.

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
   one effect attempt, permitted service audience, provider/account, request
   digest, and admitted epochs. Immediately before I/O, a local
   `ClaimTransmissionStart` rechecks current fences and CAS-binds one globally
   unique claim to the exact authenticated worker instance, lease generation/
   fence, receipt/effect attempt, and permit digest. Non-persisted permit
   material exists only inside a trusted `TransmissionExecutor` that owns both
   the claim and provider socket. Split-service workers send immutable
   authenticated instructions and receive status, never permits. The sealed,
   non-`Clone`, non-serializable permit is consumed by value and best-effort
   zeroized; its stored digest is evidence, not authority. Replay returns status.
   Duplicate instructions, executor failover, replacement workers, and ambiguous
   delivery reconcile as `OutcomeUnknown`. Restore cannot reconstruct the permit,
   and clock rollback cannot extend it. Transferable start capabilities are
   unsupported for `1.0.0`. Declared `VIT-LAW-006` makes this one complete
   boundary over the exact dispatch/authority, grant-or-exception, target,
   provider profile/
   account/credential/broker, capability/evaluator/quarantine, lease/claimant,
   deadline/time, and quota roots. The start claim coordinates proof but never
   owns those roots. Failed validation/CAS before a claim is
   `DefinitelyNotStarted`; ambiguous claim/permit delivery is
   `OutcomeUnknown`; a committed claim is `StartClaimedReconciling`. The last
   two reconcile without ordinary retransmission. A bound
   `ProviderExecutionProfile` gives the executor
   neither master-key nor general database authority; exact-claim-bound opaque
   credential handles, provider-native least privilege, tenant/account trust-
   domain partitioning, destination/TLS/DNS/redirect enforcement, and no general
   proxy prevent authenticated unclaimed egress. Unscopable cross-tenant
   privileged credentials are unsupported; unavoidable provider residual blast
   radius is explicit. One authoritative profile lineage owns active/suspended/
   superseded/revoked generations and never-reused profile, provider-account,
   credential-version, and broker-policy epochs. Start claim and handle
   redemption recheck those epochs. Typed control-plane proposal, approval,
   activation, suspension, revocation, and supersession commands require signed
   digest-bound admission, semantic expansion review, risk ownership, required
   quorum/separation, current activation fences, and a revocation tombstone.
   Remote credential rotation is an evidence-driven process: only local
   successor activation is atomic and disables predecessor redemption; unknown
   provider creation/revocation reconciles to bounded deadlines. One credential-
   lineage owner and co-located guard allow only one non-terminal rotation;
   unknown states block ordinary successors, authorized takeover inventories the
   provider, orphan credentials remain quarantined and provider-count-quota
   charged, and late callbacks are generation/digest fenced. A fresh
   `ProviderCredentialCapabilitySnapshot` and monotonic local epoch bind
   observed permissions, role/group/trust provenance, provider policy revision,
   raw and normalized policy digests, reviewed evaluator/policy-language
   versions, canonical comparison/explanation, profile, and credential
   generation. Evaluators have their own signed binary/corpus-admitted
   authoritative lineage and monotonic epoch; activation or ordinary/emergency
   revocation immediately requires reevaluation, and incompatible nodes reject
   startup. Only equal or explicitly admitted proven-safe subset authority
   may operate. Superset, incomparable, or unknown quarantines the whole
   credential, invalidates all pending handles/work, and creates a security
   incident; automatic profile widening and break-glass promotion are forbidden.
   Quarantine exits only through an owned evidence-backed investigation and
   verified remediation/revalidation state machine that creates a fresh
   capability generation without reviving old work. Credential repair uses an
   independently admitted cleanup-only remediation credential/channel through
   rotation/takeover; if the provider has none, recovery is manual.
   Dispatch never discovers remote permissions inside its transaction. Restore cannot
   resurrect old authority. Non-exportable signing/mTLS/HSM profiles
   expose operations only. For bearer/API-key profiles, the hardened broker is
   part of the executor TCB and owns header serialization, redirects, TLS, claim,
   and socket. Bearer bytes may briefly exist there, but never in upstream
   workers, plugins, general connector code, durable state, or diagnostics.
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
   under the current independently governed floor-set version. Floor reductions
   have a separate capability/approval lineage, operational fences, obligation
   simulation, append-only history, a versioned/digested durable platform-floor
   ratchet, and cross-command separation from policy spending. Nodes below the
   admitted minimum reject startup; mixed versions use the stricter profile, and
   upgrade, rollback, restore, or lower defaults cannot release capacity.
   Each ratchet entry uses a canonical `PlatformSafetyFloorKey` over accounting
   owner/root, quota kind, unit/scale, period, class/lane, region/residency, and
   settlement-policy version; key-set migration is total, conservation-
   preserving, and overflow checked. Multi-parent changes freeze a root-owned
   canonical parent manifest and membership epoch. The root owns one
   `ActiveRolloutGeneration`; successor creation permanently supersedes the
   predecessor, and rollback is a complete successor over current actual limits.
   Cancellation before preparation terminates directly; after any preparation it
   creates one complete root-owned recovery successor over actual parent limits.
   Prepared parents stay conservative, never restore independently, and use
   idempotent restore-safe recovery receipts, current-state/authority rechecks,
   and overdue-recovery escalation.
   Finalization requires one bound prepared receipt from every exact member plus
   total per-class conservation. Membership change invalidates preparation.
   Finalization only permits activation: every parent validates the still-active
   generation, then locks
   its prepared state and freshly CAS-revalidates its ledger/unallocated
   capacity, floor ratchet/set, obligations, root generation/manifest, and
   current operational fences. Drift remains conservatively
   `ActivationBlocked` or `ReconciliationRequired`. Cancelled/superseded late or
   restored messages fail closed. Rollout remains a
   conservative process manager, never a distributed command. Every delayed
   transfer transition rechecks its current local tenant, principal, and policy
   epochs; historical decisions are evidence, not authority.
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
24. Every authority-bearing invariant has one stable ID and exactly one owner
    in `docs/INVARIANT_OWNERSHIP.md`. Introducing phase markers, ownership rows,
    and lifecycle/supersession rows are bidirectionally checked. Stable
    enforcement/capability/test/recovery/fence contracts bind its guard update
    path, transaction domain, concrete enforcement and verification, supported
    storage profiles, restore/migration monotonic state, mixed-version behavior,
    and rollback floor. Coverage is declaration-derived, not a hand-written
    count. Phase prose and projections cannot become alternate authority.
    `docs/LAW_GENERATIONS.md` preserves the exact historical coordinator,
    dependency delta, semantics, activation/migration/rollback, and recovery
    contract for every composite law generation. Its canonical
    `LawGenerationManifestV1`, semantic ID, and content digest are persisted and
    verified by adapters/recovery tooling; the latest view cannot import a
    future invariant into an earlier release or alter semantics silently.
    Removal-only and semantics-only successor generations are valid when
    content-bound and nonempty. Every milestone after the
    registry bootstrap also has exactly one checked authority disposition in
    `docs/AUTHORITY_REVIEWS.md`; an unresolved proposal cannot survive its
    transition out of planned status, and law claims name the effective
    `@gNN`.
25. Evaluator replacement remains immediately fail closed but re-evaluation is
    bounded, durable, and complete. Epoch activation/revocation atomically
    creates an invalidation-campaign root. A canonical capability-owner source
    manifest, monotonic outbox sequences/high-watermarks, exact destination
    receipts, and fenced source topology prove delivery before authoritative
    membership journals seal generations/high-watermarks. One fenced scan and
    receipt per membership-manifest shard, final barriers, and capability-owner
    mismatch reconciliation ensure no affected credential is missed. Missing
    source delivery is visibly `MembershipDeliveryBlocked`; search/projection
    indexes are accelerators only and never evidence of completeness.
    Tenant/provider/account queues, stable job generations,
    leases/cursors, provider-rate claims, global fair share, tenant ceilings,
    starvation bounds, and a non-borrowable cleanup lane prevent a fleet surge
    or hostile tenant from denying recovery. Queued work never uses old output,
    and stale retained evidence is fetched again.
26. Remediation authority begins and recovers through a separate root-of-trust
    ceremony. Automatic recovery requires admitted independently administered
    channels, quorum and separation, and a path that does not authenticate
    through the authority being recovered. It cannot self-approve or
    self-remediate; providers without that path are explicitly manual-only.

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
