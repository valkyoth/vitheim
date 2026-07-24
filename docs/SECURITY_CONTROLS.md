# Security Controls

## Repository Baseline

- Rust `1.97.1`, edition 2024, resolver 3, warnings denied.
- Unsafe Rust forbidden workspace-wide.
- Panics, unwraps, expects, unreachable paths, TODOs, and debug macros denied
  by Clippy in production code.
- No third-party Cargo sources and no crate publication.
- Every Rust library currently `no_std`; every Rust source file at most 500
  lines.
- Locked builds, full action SHA pins, read-only CI permissions, and no
  persisted checkout credentials.
- Format, check, unit, documentation, Clippy, source-policy, link, license,
  advisory, and SBOM gates.

## Development Controls

Every change needs:

- a release-plan assignment and bounded scope;
- threat-model and attack-surface delta;
- positive, negative, boundary, and regression tests;
- property tests for state or algebraic invariants;
- fuzzing for untrusted syntax and decoders;
- authorization and tenant-isolation cases for affected reads/actions;
- failure-injection for persistence and distributed behavior;
- documentation, changelog, and release-note updates;
- exact-commit pentest and clean retest before tagging.

Tests must prove both acceptance and rejection. A rejected operation must not
partially mutate state, consume authority, expose hidden fields, or omit an
audit decision.

## Runtime Controls Planned Before Production

- Secure configuration defaults and startup validation.
- Law-manifest trust independent from mutable storage: exact admitted
  `(LawId, Generation, Digest)` tuples, compiled or dedicated-platform-law
  signed activation-floor catalogs, planning-superset separation, one global
  lineage, one rollout-root process manager, one independent dynamic-topology
  generation owner, and exact attested/fenced local placement owners with
  catalog/distrust/trusted-time fences; compiled static bootstrap and immutable
  successor topology/placement manifests; one active rollout generation with
  irreversible authorization receipt/outbox pinning and permanent
  pre-authorization loser supersession; staged exact-singleton topology handoff
  only after generation-2 admission and with exclusive authority; policy/
  approval-bound topology mutation authorization atomically consumed with the
  successor, action claim, tombstones, and fence outbox; current-topology
  normal-path admission/readiness/dispatch/start checks independent of rollout
  and fence delivery; closed single-use-claim, bounded readiness-freshness, and
  owner-protocol scope; co-transactional local consumption/outcome with
  tombstone-first historical replay, typed uncertainty/no reissue, restore
  high-watermarks, and zero offline authority; transactional prepare/activation/convergence/
  revocation delivery, authenticated authorization/global-result receipts, and
  closed signed/sender-generate receiver-verify MAC/attested-channel variants
  with replay and durable-integrity anchors rather than digest authority;
  expected-version explicit
  succession; gap-free milestone selection; shared runtime/CLI canonical
  cryptographic verification; complete scope/validity/uncertainty/signer/root/
  revocation/successor binding; catalog-bound checkpoint/backup/restore
  evidence; and rollback/suspend/expiry/emergency-distrust handling.
- Closed law-semantic dispatch: prose is evidence only; supported IDs
  exhaustively resolve to compiled transitions, typed outcomes, recovery, and
  positive/negative/model/fault tests, with stage-aware file/symbol/test
  realization and unknown IDs or incomplete predecessor closures rejected
  before readiness.
- Strong tenant partitions in storage, search, queues, caches, blobs, logs,
  exports, metrics labels, and backups.
- Authentication independent from authorization; sender-constrained privileged
  workloads; explicitly lower-assurance, non-privileged bearer policy;
  deny-by-default authorization.
- Field-level redaction preserved through API, search, reports, notifications,
  AI context, audit, and exports.
- Single-aggregate transactional local effects for command, consumer, timer,
  activity, and poison transitions; distinct dispatch/results; inbox/outbox,
  fencing, quotas, bounded retries, backpressure, and explicitly at-least-once
  remote calls. Stable external-effect identities and request digests bind
  provider idempotency/replay horizons, separate execution/provider-outcome/
  resolution-evidence/operational-workflow/compensation types, reconciliation
  deadlines, escalation, and authorized manual resolution. Assessment is not
  provider truth; unknown privileged or non-compensable work is never retried
  blindly. Effect intent always requires commit-time authorization and binds
  tenant, initiator, delegation, capability, target, purpose, request, policy,
  authentication assurance, and typed live-subject, approved-grant, or service-
  principal execution authority. Approved grants bind exact effect/request/
  target/version, purpose, approvers/quorum/separation, assurance at approval,
  window, attempts, policy, and revocation. Workers authenticate as themselves
  and never impersonate offline humans. Reviewed low-risk immutable effects may
  be `CommitBound`; privileged, destructive, secret-bearing, containment, and
  compensation effects are `CommitAndDispatch` and require fenced single-use
  authority redemption. Session expiry alone does not invalidate a grant;
  revocation, target drift, tenant suspension, grant exhaustion, and required
  approver/policy revalidation fail closed. Workers and leases confer no
  business authority, and binding substitution is forbidden. Every grant
  lineage has one authoritative stream: inline ownership stays in the approval
  aggregate; dedicated ownership uses immutable approval receipt plus outbox/
  process-manager continuation. Pre-issuance revocation wins, generation
  identities are unique, and a successor atomically leaves the superseded grant
  permanently non-redeemable in that owner stream. Redemption is linearized by
  a co-located fenced local `GrantRedemptionGuard`: lineage-owner transitions
  create/revoke/replace it, while dispatch advances only the effect stream and
  atomically compare-and-claims one bound attempt plus receipt/outbox. The guard
  serializes revocation/final-attempt races; retries and restore cannot create
  or resurrect consumption, and non-co-located or two-stream adapters fail.
  Every dispatch locks a complete bounded `DispatchAuthorityFenceSet` of
  applicable monotonic tenant, subject/principal, session/credential/mapping,
  delegation, group/role/relationship, and policy epochs. Authority-changing
  commands update their local epoch atomically with the owner event. Missing,
  stale, substituted, reused, or non-co-located fences deny; external-only
  bounded-stale facts never authorize privileged effects.
  Current-target dispatch also requires a typed `DispatchTargetFence`. Same-
  aggregate expected version/digest or a target-owner-maintained co-located row
  binds target identity, lifecycle, and deletion/supersession epoch. Remote,
  cross-shard, projection-only, stale, restored, or substituted target state
  denies before provider I/O.
  Provider-owned targets use a distinct `RemoteTargetConcurrencyProfile`, never
  a local fence. Strong conditional mutation binds exact provider/account/
  resource, validator bytes/kind/provenance, admitted provider capability,
  request digest, and idempotency key. Precondition failure is typed non-
  acceptance and cannot silently refresh; response loss remains unknown.
  Privileged/destructive/containment unconditional mutation requires a narrow
  expiring reviewed `RemoteMutationException`. It has one owner stream and exact
  tenant/provider/account/resource/action/request, approvals/quorum/separation,
  policy/provider epochs, assurance, time, and attempt bindings. Its co-located
  guard serializes revocation, expiry, supersession, provider-capability change,
  and final-attempt claims while dispatch advances only the effect stream.
  The resulting receipt is bounded by immutable `redeemed_at` and
  `transmit_before` plus effect/attempt, permitted service audience, provider/
  account/request, and admitted epochs. Immediately before I/O,
  `ClaimTransmissionStart` rechecks current fences and binds one globally unique
  claim to the exact authenticated worker instance, lease generation/fence,
  receipt/effect attempt, and permit digest. Non-persisted permit material is
  returned once only inside the trusted `TransmissionExecutor` that owns the
  provider socket. Split workers submit immutable authenticated instructions and
  receive status; permits never cross RPC/IPC/queues. The sealed non-`Clone`,
  non-serializable value is consumed by the write and best-effort zeroized; its
  digest is never authority. Duplicate instruction, executor failover,
  replacement worker, or possible start without proven absence is typed:
  pre-claim validation/CAS failure is `DefinitelyNotStarted`; ambiguous claim/
  permit delivery is `OutcomeUnknown`; committed claim is
  `StartClaimedReconciling`. The last two reconcile without ordinary
  retransmission. `VIT-LAW-006` registers the exact generation-specific start
  dependency set; the claim coordinates proof without owning any authority
  root.
  Restore cannot reconstruct the permit; failover, pause, or clock rollback
  cannot extend it. `1.0.0` supports no transferable permit profile.
  A bound `ProviderExecutionProfile` denies master-key/general database access,
  uses exact-claim-bound tenant/provider/account/action/request/destination
  opaque credential operations, provider-native least privilege, short lifetime
  where available, and destination/TLS/DNS/redirect controls with no general
  proxy. Executor pools isolate tenant/account trust domains; unrestricted shared
  cross-tenant privileged credentials are unsupported and unavoidable residual
  provider blast radius is documented. One authoritative profile lineage owns
  active/suspended/superseded/revoked generations plus monotonic profile,
  provider-account, credential-version, and broker-policy epochs; claim and
  redemption recheck them. Profile mutation is control-plane-only and uses typed
  proposal, approval, activation, suspension, revocation, and supersession
  commands; signed digest-bound admission; semantic expansion review; quorum/
  separation; current activation fences; and revocation tombstones. Remote
  rotation is asynchronous and
  evidence-driven; local successor activation atomically disables predecessor
  redemption, while unknown provider creation/revocation reconciles with bounded
  overlap and escalation. A lineage-owned guard serializes rotations; unknown
  states block successors, takeover inventories the provider, orphan credentials
  are quarantined and quota-counted, and late callbacks are fenced. Fresh
  credential-capability snapshots and local epochs bind raw/normalized policy,
  reviewed evaluator and policy-language versions, canonical comparison/
  explanation, and provider provenance. Only equal or explicitly admitted safe
  subset authority may operate; superset, incomparable, or unknown quarantines
  the entire credential, invalidates all handles/work, and emits an incident.
  Neither automatic profile widening nor break-glass may bypass it. The system
  cannot roll back the evaluator's signed binary/corpus-admitted lineage or
  monotonic epoch; evaluator change/revocation immediately requires
  re-evaluation and incompatible nodes reject startup. Re-evaluation uses
  an invalidation campaign root created atomically with the evaluator epoch,
  a canonical capability-owner source manifest, monotonic outbox sequences and
  campaign high-watermarks, exact destination receipts, fenced source topology,
  authoritative membership shard journals, sealed generations/high-watermarks,
  one scan receipt per membership-manifest shard, delivery and membership
  barriers, generation-bound idempotent jobs, explicit
  create/move/delete/quarantine/rotation dispositions, and authoritative
  capability-owner mismatch reconciliation. Search/projection indexes cannot
  prove completeness. Missing delivery is `MembershipDeliveryBlocked`; mismatch
  reconciliation remains an independent backstop. A successor campaign
  tombstones older enumeration and cannot inherit its counts. Re-evaluation then uses
  durable tenant/provider/account-partitioned jobs with stable generations,
  bounded concurrency/retry/provider-rate claims, global and tenant fairness,
  starvation bounds, privileged/near-term priority, and a non-borrowable
  security-cleanup lane. Old output remains unusable while queued, stale
  evidence is fetched again, and repeated replacement, crash, failover, or a
  hostile tenant cannot lose, duplicate, or monopolize work. Quarantine clears only
  through separated, current-evidence remediation/revalidation that creates a
  fresh capability generation and tombstones old work. Credential recovery uses
  an independently admitted cleanup-only remediation credential/channel through
  rotation/takeover, or enters manual intervention when no independent provider
  recovery path exists. Its first admission, rotation, loss, and compromise
  recovery use a signed separated-quorum ceremony, two independently
  administered recovery channels for automatic profiles, offline/manual
  recovery independent of the lost authority, independent KMS/identity failure
  domains where practical, expiry/availability monitoring, and tested recovery
  exercises. It cannot self-approve or recover its own compromise. Restore
  cannot resurrect any of this authority.
  Signing/mTLS/HSM key material remains non-
  exportable. Bearer/API-key profiles put HTTP authorization serialization, TLS,
  claim, and socket inside the hardened broker/executor TCB; bearer bytes may
  briefly exist only there and are prohibited from upstream, plugin, general
  connector, durable, log, diagnostic, and crash surfaces.
- Stable invariant IDs in `docs/INVARIANT_OWNERSHIP.md` bind every authority
  declaration to exactly one ownership and lifecycle row. Stable enforcement,
  capability, test, recovery-manifest, and owner-fence IDs bind the owner-updated
  guard, transaction placement, concrete enforcement, supported storage,
  P/N/M/F evidence, restore/migration fields, supersession, mixed-version
  behavior, and rollback floor. CI derives coverage from phase declarations and
  rejects unregistered, multiply owned, untested, unsupported, asymmetrically
  superseded, or recovery-incomplete invariants; adapters cannot claim support
  without every applicable semantic capability.
- Canonical composite-law generations bind the actual effective milestone,
  predecessor, proof coordinator, dependency delta, linearization/failure/
  recovery semantics, mixed-version intersection, activation fence, migration,
  rollback, semantic/dependency/recovery contract versions, canonical manifest,
  and content digest. CI rejects future-effective dependencies, broken/no-op
  chains, semantic or digest drift, and future-generation conformance while
  permitting a genuine removal-only or semantics-only successor. A separate
  complete milestone review registry rejects undeclared authority work,
  proposals after planned status, bare law claims, or missing option/production
  decisions.
- Durable quota accounting uses a bounded atomic claim set with typed
  concurrency, consumable-operation, provider-rate, estimated-liability, and
  retained-byte settlement. Only provider-dependent claims hold for unknown
  outcomes; concurrency releases with its lease, rate tokens become
  non-refundable at transmission, liabilities reconcile to actual cost or a
  distinct audited write-off, and byte claims follow local allocation/deletion.
  Refunds are evidence-bound and exactly once; manual assessment cannot mint
  provider evidence; compensation has separate claims. Claim sets are local
  transactional authority, not aggregate streams: canonical deadlock-free
  ordering reserves all members or none, an opaque token/digest freezes ordered
  membership, bundles never reacquire individual members, transitions are
  idempotent by set/claim identity, and partial restore/reconciliation is
  quarantined. Each set shares one local quota partition with its work bundle;
  wider limits allocate fenced hierarchical capacity leases into local
  partitions and conserve parent/child capacity without distributed work
  transactions. Active/active authoritative multi-region writes are unsupported
  at `1.0.0`; incompatible placement fails closed. Capacity leases bind kind,
  unit, period, and settlement policy. Expiry stops admission but retains spent/
  encumbered capacity; parents reclaim only proven free remainder, and claims
  settle against their original encumbrance through a
  `QuotaCapacityTransferState` outbox/inbox process manager. Local transitions
  are receipt-idempotent, delivery is at least once, reclaim requires
  authenticated acknowledgement and old-epoch fence proof, uncertainty stays
  charged, and double-entry recovery never frees capacity at both ends.
  Transfer also freezes accounting owner, hierarchy root/parent lease, period,
  work/recovery lane, capacity class, residency/region, and source/destination
  authorization. A transfer cannot change tenant, parent, period, region, lane,
  or turn emergency/security-cleanup/reconciliation capacity into business
  capacity. Existing capacity class is immutable regardless of privilege. Only
  future unallocated parent capacity can change allocation through a fenced,
  simulated, separation-of-duties `QuotaCapacityPolicy` command. Each policy
  lineage owns one parent and atomically updates its co-located parent ledger
  under an independently governed floor-set version. Floor reductions use a
  separate capability and approval lineage, current tenant/hierarchy/incident/
  emergency/policy fences, obligation simulation, append-only epochs, a
  versioned/digested durable platform-floor ratchet, and cross-command separation
  from spending released capacity. Nodes below the admitted floor reject
  startup; mixed versions use the stricter profile, and downgrade/restore cannot
  release capacity. Multi-parent finalization proves one prepared receipt for
  every member of a root-owned canonical manifest under an unchanged membership
  epoch and per-class conservation constraints. It only permits activation:
  every parent freshly CAS-revalidates its ledger/unallocated capacity, floor
  ratchet/set, obligations, root generation/manifest, and current operational
  fences or remains conservatively blocked/reconciling. Each ratchet entry has a
  canonical accounting owner/root, quota kind, unit/scale, period, class/lane,
  region/residency, and settlement-policy key; profile migration is total,
  conservation-preserving, and overflow checked. The root admits exactly one
  active rollout generation; successors permanently supersede predecessors,
  rollback is a complete successor over actual limits, and late or restored
  cancelled/superseded work fails closed. Cancellation after any preparation
  creates a complete root-owned recovery successor; prepared parents stay
  conservative, never restore independently, recheck current state/authority,
  use idempotent restore-safe receipts, and escalate missed recovery deadlines.
  Tenant work cannot invoke it, and every delayed transfer transition rechecks
  current local tenant/principal/policy epochs.
  Composite transactions use the canonical stream/authority-fence/target-fence/
  remote-exception-guard/grant-guard/quota/uniqueness/receipt order with bounded
  identity-preserving deadlock retry.
  Per-tenant/work-class
  ceilings, fair share, starvation bounds, and a scoped emergency reserve keep
  recovery available without tenant borrowing or monopolization.
- Capability-limited plugins and integrations; opaque secret handles and
  host-brokered authenticated operations; plaintext credentials never enter
  Wasm guest memory.
- Tamper-evident event and evidence history with independently stored signed
  checkpoints.
- Tested backup/restore, projection/search rebuild, workflow continuation,
  migration rollback, and disaster recovery.
- Typed tenant-surface disposition evidence that distinguishes local deletion/
  controlled-key erasure from provider attestations, unconfirmed requests, and
  unverifiable previously disclosed plaintext. A controlling mandatory erasure,
  maximum-retention, or closure deletion obligation outranks rollup
  preservation. Every raw/rollup/manifest/result/cache/export/checkpoint-
  metadata surface is disposed independently; lost historical authority is
  recorded without retaining prohibited sensitive/linkable content and exposed
  as unknown.
- Complete audit provenance without recording plaintext secrets.

## Release Decision

Critical and high findings block release. Medium and lower findings require
remediation or an explicit, scoped, time-bounded acceptance with owner,
compensating controls, review date, and expiry. No acceptance may waive tenant
isolation, audit immutability, or legal obligations.
