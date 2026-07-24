# Changelog

All notable Vitheim changes are documented here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and releases use
[Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

### Added

- Added a cumulative per-scope drain-replay head and staged immutable archive
  publication protocol, preventing stale-checkpoint non-membership proofs and
  avoiding any database/object-store distributed-transaction assumption.
- Added a proof-to-execution drain-replay admission guard: verify against
  writer-authoritative head `H`, then lock/re-read that head and the exact key,
  check hot state, and uniquely claim execution in one local transaction.
  Head changes restart without writes; replicas and weak snapshots cannot
  authorize.
- Bounded repeated replay-head changes across one durable logical attempt,
  separated transient contention from unavailable history, froze independent
  action/idempotency uniqueness, and added fair compaction/admission scheduling
  with protected Recovery progress.
- Added a closed, fenced replay-admission-attempt lifecycle with duplicate
  joining, crash takeover, irreversible no-write terminals, checkpoint-gated
  cleanup, and bounded attempt/terminalization capacity.
- Defined the transactional attempt-capacity ledger, global lock order,
  original reservation buckets, atomic active-to-terminal transfers, and
  exact-once checkpoint/deletion settlement.
- Added bounded authenticated sparse retention for physical-deletion settlement
  evidence, preserving exact duplicate results and conservative capacity across
  hot-row compaction, restore, and migration.
- Split settlement continuity into a database-local journal head and a
  verified archive replay head, with separate CAS boundaries, exact captured-
  range compaction, and proof-head revalidation.
- Unified checkpoint and physical-deletion capacity settlements under that
  journal/archive protocol, including atomic checkpoint bundles and mixed-leg
  archive replay.
- Closed the settlement recovery-schema drift by making both heads/chains and
  coverage, exact rows, triggers/bundles/results, attempt-checkpoint linkage,
  settled/remaining legs, and conservative balances one mandatory fail-closed
  tuple. Because Vitheim never admitted a singular-head schema, such input is
  now explicitly quarantined before mutation rather than split, migrated, or
  treated as empty genesis.
- Selected bounded authenticated sparse archives for exact drain-action replay
  after compaction, with canonical result recovery, historical conflicts,
  resource-bounded proof verification, and fail-closed unavailable history.
- Closed the capacity-drain authorization lifecycle with atomic consumption,
  permanent replay tombstones, stable exact-retry results, typed conflicting
  retries, trusted-time/key/continuity ratchets, long-drain semantics, and
  checkpoint-complete failover/restore recovery.
- Added action-bound authorization for every capacity-drain transition and a
  canonical non-wrapping predecessor-linked activation record/checkpoint whose
  active-head, supersession, fence, audit, result, and outbox effects commit
  atomically and recover fail closed.
- Strengthened capacity-profile transitions so every lane, reserve, aggregate,
  storage, I/O, or worker reduction must pass through PendingDrain; aggregate
  fences derive all capable consumer lanes; recovery follows committed
  activation records and explicit high-watermarks; and fence lifecycle is
  represented only by atomic transition events.
- Added a durable lane-scoped capacity drain fence for pending charge-ledger
  profile reductions. New stage-one work must satisfy both active and pending
  limits, over-target lanes receive a typed pre-debit draining denial, existing
  obligations retain completion capacity, and fence install/clear/activation
  is expected-version serialized and recovery authenticated.
- Added an immutable VIT-INV-061-owned presentation-charge capacity-profile
  lineage with expected-version activation, governed emergency/aggregate
  resizing, drain-before-shrink semantics, physical provisioning evidence,
  downgrade fencing, and restore by authenticated profile generation rather
  than maximum numeric limit.
- Partitioned the durable topology presentation-charge ledger and its
  checkpoint/archive/compaction work by `Normal`, `Recovery`, and
  `BreakGlass` lane. Each lane now has non-borrowable row, byte, awaiting,
  backlog, I/O, and worker capacity below aggregate disk/work ceilings, so
  Normal or break-glass saturation cannot starve Recovery.
- Added monotonic topology-authorization request sequencing and bounded
  checkpoint-before-delete denial history, so compacted denials cannot become
  fresh after policy changes or grow without explicit storage/proof limits.
- Froze the complete consumer terminal-receipt envelope and five closed terminal
  outcomes; moved ongoing reconciliation into separate disposition, evidence,
  and receipt types, with a terminal-only settlement port.
- Corrected topology-authorization reservation accounting so lineage revocation
  or supersession cannot free a still-consumable receipt; added original quota-
  claim settlement, separate presentation/request/admission/outstanding
  ledgers, and a
  consumer-fenced receipt-specific revocation protocol with authenticated
  terminal receipts.
- Resolved retry-accounting ambiguity: every authenticated canonical
  presentation is rate charged before protected idempotency lookup, while each
  first-seen canonical ID/digest receives exactly one request-rate charge and
  immutable request sequence/outcome.
- Added bounded pre-authentication ingress work and authenticated
  `Normal`/`Recovery`/`BreakGlass` presentation lanes derived from endpoint,
  audience and credential/authority profile; emergency identities and
  presentation/request capacity are non-borrowable and authorized class must
  match the lane.
- Split topology-authorization presentation accounting into two durable stages:
  stage one commits the presentation debit and issues bounded internal
  single-use evidence before any protected lookup; stage two consumes that
  evidence, rechecks the mapping generation, and atomically records the logical
  request/outcome/issuance. Crashes leave an orphaned spent charge, retries
  require a fresh charge, and mapping rotation fails closed without refund.
- Assigned presentation-lane mapping ownership to VIT-INV-061 with separated
  emergency-promotion roles, and added independently provisioned,
  non-borrowable normal/recovery/break-glass listener, TLS, decode, executor,
  and pool resources under a global safety ceiling. Pre-auth routing grants no
  authorization.
- Declared the previously prose-only VIT-INV-060/061 enforcement and negative-
  test children, expanded VIT-INV-061 owned mapping/budget/charge/checkpoint
  storage and recovery state, and made the ownership checker reject undeclared
  references or duplicate enforcement/test child IDs.
- Froze the presentation-charge disposition state machine: atomic
  debit/evidence/awaiting creation, four irreversible terminal outcomes,
  checkpointed compaction preserving the original outcome, and fail-atomic
  charge-ledger saturation before protected lookup.
- Updated the not-yet-effective VIT-LAW-008@g02 canonical planning manifest to
  match the strengthened authorization model and re-authenticated its
  generation and planning-catalog digests.
- Made topology-authorization issuance one local atomic
  quota/reservation/sequence/receipt/result/outbox transaction, added exact-once
  terminal capacity settlement and caller sub-limits, and bounded chunked
  issuer-range proof decoding and verification.
- Refined topology anti-replay compaction with issuer-authenticated range
  manifests, sparse-by-default consumer commitments, deadline/time-gated dense
  eligibility, and non-borrowable normal/recovery/break-glass issuance budgets.
- Added a bounded topology-authorization anti-replay lifecycle with pre-
  allocation quotas, exact replay horizons, authenticated archival checkpoints,
  monotonic compaction high-watermarks, fail-closed unavailable-history
  behavior, storage-growth accounting, and abuse/HA/DR/soak verification.
- Added canonical topology-authorization receipt persistence and a mandatory
  backend deadline-conditional topology CAS, with atomic time/claim/topology/
  fence state, no-late-commit proofs, per-backend pause/failover conformance,
  and non-lossy migration, restore, and import requirements.
- Bound topology-mutation authorization expiry to authenticated trusted-time
  profile/epoch/continuity evidence, concrete per-class lifetime ceilings,
  fail-closed issuance, conservative consumer intervals, rollback-resistant
  time ratchets, expiry tombstones, and explicit residual-risk acceptance.
- Added independent `VIT-INV-061` topology-authorization issuance with
  issuance-time current-authority checks, immutable bounded grants, idempotent
  unknown-response recovery, independent break-glass recovery, and strict
  separation from the topology owner.
- Added challenge/sequence/generation/expiry-bound topology receipts and local
  last-observed ratchets to reject signed-old, cache-replayed, failover-rolled-
  back, or restored-old currentness evidence.
- Made topology authorization receipts profile-discriminated: orchestrator
  claims and hardware proof are mutually exclusive canonical variants.
- Added `VIT-LAW-007@g02` so dynamic topology independently gates local
  admission, readiness, dispatch, and transmission start after handoff,
  including lost-fence stale-placement tests.
- Added a closed action-authority scope matrix, bounded reusable readiness
  freshness proof, and tombstone-first replay precedence that returns only
  historical outcomes after expiry or revocation.
- Added policy- and approval-bound `TopologyMutationAuthorizationReceipt`
  with independent issuance, local receipt/profile-proof/topology-CAS/fence-
  outbox consumption, and break-glass review bindings.
- Moved topology initialization behind epoch-12 convergence and every local
  generation-2 admission, adding explicit `Uninitialized` state so no
  generation-2 transition executes before its semantic realization is active.
- Added authenticated `CatalogActivationAuthorizationReceipt` and
  `CatalogGlobalActivationResultReceipt` contracts with version/outcome/
  idempotency/replay bindings and sender-generate/receiver-verify MAC roles.
- Assigned workload action-claim issuance to an external authority port and
  atomic consumption/outcome to each protected Vitheim owner, with typed
  uncertainty, no-reissue reconciliation, and backup/restore high-watermarks.
- Made catalog activation authorization an irreversible, atomic
  `ActivationAuthorized` state with receipt/outbox persistence, active-
  generation pinning, globally serialized activate-versus-revoke recovery, and
  explicit abandon/supersede/failover/delay race tests.
- Replaced the circular topology transition with a staged
  `DormantInitialized` to `Committed` handoff: epoch 12 activates and converges
  under generation 1 before an exact rollout/artifact/manifest/local-admission
  CAS transfers exclusive authority to `VIT-INV-060`.
- Closed workload and receipt assurance gaps with online single-use
  `WorkloadLeaseActionClaim` authority, a frozen maximum exposure window and
  zero offline authority, plus three exhaustive authenticated-receipt variants
  with replay tombstones and durable integrity anchors.
- Added independent dynamic placement-topology authority (`VIT-INV-060`) with
  an artifact-authorized singleton handoff at `0.141.0`, expected-version
  successor manifests, monotonic member generations, fences, tombstones, and
  `VIT-LAW-008@g02` consumption before split-service deployment.
- Defined executable `WorkloadIdentityProofProfileV1` and
  `CatalogReceiptAuthenticationV1` decisions: hardware-attested or
  orchestrator-attested single-active-lease identity, complete lifecycle and
  clone detection, and authenticated canonical receipts rather than digest or
  transport-success authority.
- Serialized catalog candidates with per-lineage `ActiveRolloutGeneration`,
  terminal `Superseded` losers, permanent late-message rejection, and
  two-coordinator lost-response/restart testing before the first successor.
- Added durable distributed catalog rollout ownership (`VIT-INV-059`) and
  composition (`VIT-LAW-008`): immutable catalog/topology/placement manifests,
  closed process-manager states, exact prepare/convergence receipts,
  transactional outbox/inbox delivery, global activation CAS, deadline
  reconciliation, topology fencing, and emergency-distrust propagation without
  implying a distributed transaction.
- Made every `VIT-INV-058` admission owner an exact enforcement-partition
  placement generation keyed by deployment, region, service role, partition,
  and placement generation, with non-clonable workload/continuity identity,
  binary/semantic bindings, and fresh fenced admission after clone, restore,
  replacement, or region movement.
- Staged rollout bootstrap and proof across `0.18.3–0.30.0`, froze identity,
  placement, activation-policy, topology, and HA decisions at `0.140.1`,
  `0.140.2`, and `0.140.6`, and carried split-service, failover, disaster
  recovery, pentest, and production evidence through `0.142.0–1.0.0`.
- Split global platform-law lineage (`VIT-INV-057`) from independently updated
  local catalog admission, distrust, and trusted-time ratchets
  (`VIT-INV-058`); strengthened `VIT-LAW-007` with partial-rollout,
  unreachable-node, revocation-propagation, failover, and restore contracts.
- Replaced ambiguous catalog maximum versions with explicit-successor
  activation floors and a checker that proves exactly one applicable catalog
  for every implementation milestone through `1.0.0`.
- Required non-planned catalog artifacts to pass a project-owned Rust verifier
  shared with runtime, including canonical decode, digest/ancestry/predecessor,
  profile, compiled/signature trust, and exact product-scope verification.
- Defined trustworthy `BoundedWindow` time intervals, maximum uncertainty,
  clock-rollback and suspend handling, local validity ratchets, expiry
  tombstones, restore rules, and fail-closed time unavailability.
- Added `VIT-INV-057` and `VIT-LAW-007` so the active platform-law catalog has
  one lifecycle owner, expected-version activation, succession/revocation/
  emergency-distrust commands, local rollback ratchets, and explicit
  safety-floor/dispatch/transmission-start composition.
- Separated the future-inclusive planning admission superset from immutable
  milestone-scoped active catalogs, with a checked successor schedule that
  excludes future tuples and requires complete effective ancestry.
- Defined fully content-bound active-catalog payload and trust envelopes with
  exact `CompiledCatalog`/`SignedCatalog` profiles and version, scope, validity,
  signer/root, revocation, and successor fields.
- Made semantic realization enforcement stage-aware and added explicit
  positive/negative/model/fault contracts plus concrete file, enum/dispatch,
  symbol, recovery, and test-ID gates.
- Added an independently trusted law-manifest admission catalog so a canonical
  digest proves content but cannot authorize an attacker-authored generation;
  compiled or dedicated-platform-law-signed tuples now flow through
  checkpoints, storage, migrations, option decisions, restore, and production.
- Added an exhaustive law-semantic realization registry binding every
  `VIT-LSEM-*` to planned Rust transitions, typed outcomes, recovery paths, and
  exact positive/model/fault test contracts; prose interpretation and unknown
  semantics fail closed.
- Tightened composite generation structure, strict ASCII/canonical field
  validation, and `@gNN` ancestry-closure evidence with adversarial repository
  checks.
- Content-bound every law generation with a canonical
  `LawGenerationManifestV1` schema, semantic contract, resolved dependencies,
  and verified SHA-256 planning digest carried through storage, migrations,
  option freezes, recovery, and production evidence.
- Made authority proposals legal only while their milestone is planned and
  pinned every law-extension/conformance claim to the latest `@gNN` effective
  at that milestone.
- Allowed legitimate removal-only, coordinator-only, and semantics-only law
  generations while rejecting no-op generations and current semantic drift.
- Added canonical generation-by-generation composite-law history with exact
  effective dependencies, coordinators, semantics, activation/migration/
  rollback/recovery bindings, and CI rejection of future-root or latest-view
  drift.
- Added one checked authority disposition for every milestone after `0.18.3`,
  including all pre-production option decisions and `1.0.0`; proposals must
  resolve before implementation and cannot enter Phase O or production.
- Split transmission-start failure into `DefinitelyNotStarted`,
  `OutcomeUnknown`, and `StartClaimedReconciling`, with ordinary retransmission
  allowed only for proven pre-claim failure.
- Added source-side evaluator-membership delivery proof at `0.18.4`: canonical
  source topology, monotonic outbox watermarks, exact inbox receipts, topology
  fencing, and visible `MembershipDeliveryBlocked` before shard completion.
- Added declarations and full lifecycle/version/recovery governance for
  composite laws, explicit semantic enforcement-to-negative child mappings,
  split identity/provider authority roots, and the end-to-end
  `VIT-LAW-006` transmission-start boundary.
- Incorporated the latest gap review by separating one-owner invariant roots
  from composite security laws, adding independently updated authority roots,
  per-enforcement negative-test child contracts, all-document declaration
  scanning, and acyclic version-ordered lifecycle validation.
- Replaced projection-authoritative evaluator discovery with append-only
  membership journals, sealed shard generations/high-watermarks, fenced moves,
  one completion receipt per shard, a final barrier, and authoritative mismatch
  reconciliation carried through storage, HA, option, and production gates.
- Expanded `0.18.3` from a nine-row shape check into a complete declaration-
  driven ownership and lifecycle registry through `0.18.2`, with stable
  enforcement, capability, verification, recovery, and owner-fence contracts.
- Strengthened `0.18.4` with a crash-atomic evaluator invalidation campaign,
  authoritative snapshot-generation enumeration, idempotent materialization,
  concurrent credential dispositions, and terminal completeness proof.
- Added `0.18.3–0.18.5` corrective passes for a machine-checkable stable-ID
  invariant ownership registry, bounded fair evaluator re-evaluation scheduling,
  and quorum-controlled non-circular remediation-authority bootstrap/recovery.
- Added production option freezes and acceptance evidence for invariant storage
  capability coverage, evaluator surge/outage/failover behavior, independent
  recovery channels/KMS domains, manual-only providers, and recovery exercises.
- Initialized the dependency-free Rust workspace and security baseline.
- Added private `no_std` foundation crates and the `vitheim` facade.
- Added architecture, implementation, release, security, and tooling policy.
- Expanded every planned milestone from `0.1.0` through `0.150.0` and `1.0.0`
  into a version-specific implementation handoff with mechanically checked
  setup, goal, deliverables, verification, and pentest exit criteria.
- Incorporated the roadmap gap review by reopening `0.1.0`, moving structural
  tenant and release-evidence controls earlier, splitting WebAuthn review, and
  adding pre-production option-decision releases before Phase O.
- Incorporated the second roadmap review with first-consumer technology
  admission, early sensitive-payload and security-audit architecture, explicit
  hosted HA adapters, corrected cross-phase integration gates, separated API/
  SDK/import/export milestones, and explicit production-profile freeze decisions.
- Expanded the product roadmap with an API-first UI crate boundary, governed
  composable dashboards and organization-scale layouts, deeper RBAC,
  organization federation/shared spaces/managed-service delegation, a signed
  plugin storefront with Microsoft and Tenable connector packs, complete
  vulnerability management, and evidence-bound cross-domain graph correlation.
- Closed the next roadmap review by making mandatory audit crash-atomic,
  establishing early telemetry semantics, hardening generic cases and
  federation protocol evidence, assigning every intended interchange/semantic
  search adapter, and adding typed on-call, paging, notification, SLO,
  service-health, and status-communication capabilities.
- Incorporated the latest gap review with atomic command commit semantics,
  shared early provenance/four-clock primitives, in-process secret handling,
  workload authentication, production customer-measurement/paging/status paths,
  enforced threat-intelligence markings, a conditional concrete CMDB connector,
  and separately governed embedding generation. Narrowed syslog to authenticated
  alert-bearing input and made SCIM direction, STIX publication, SIEM/detection,
  and CMDB support explicit pre-production decisions.
- Closed the final architectural gap review with atomic consumer and fenced
  timer/activity/poison commit variants, authoritative measurement rollups, a
  mandatory tenant data-surface lifecycle registry, an external-issuer OAuth
  resource-server profile, strict no-plaintext-credentials-in-Wasm enforcement,
  and a governed external identity-link lifecycle.
- Refined the closed architecture without adding scope: atomic work is
  single-aggregate and local-only with distinct at-least-once dispatch/results;
  privileged workload tokens are sender constrained; external-copy disposition
  evidence carries honest proof strength; and raw measurements cannot expire
  until rollup authority is externally checkpointed and restore verified.
- Strengthened the closed roadmap without new versions: mandatory deletion now
  outranks unavailable rollup-preservation proof; remote effects have durable
  ambiguous-outcome and reconciliation semantics; and the tenant-surface
  registry has an inward descriptor, explicit backfill, and prospective gate.
- Removed the undeclared ripgrep dependency from repository verification so
  GitHub-hosted runners use portable `grep`/`git grep` policy, plan, link, SBOM,
  release-readiness, and tool-freshness checks.
- Refined the closed roadmap without new versions by separating external-effect
  lifecycle/provider truth/resolution/manual/compensation models, independently
  disposing every rollup-derived surface, and restoring mechanically checked
  Phase G network-call/crash-point verification.
- Closed the delayed-effect control gaps without adding versions: restored the
  complete compensation milestone, bound effect intents to commit-time and
  risk-based current dispatch authorization, and tied quota hold/refund/
  compensation semantics plus protected recovery capacity to the typed
  external-effect lifecycle through HA and production acceptance.
- Refined delayed execution without adding versions: scheduled work now redeems
  typed live-subject, immutable approval-grant, or scoped service-principal
  authority without impersonating offline humans; quota accounting now uses
  bounded multi-kind claims with distinct concurrency/rate/cost/storage
  settlement and fairly partitioned recovery capacity.
- Closed the final transaction-model ambiguities without adding versions:
  execution-grant lineages now have one explicit authoritative owner with
  outbox-driven dedicated issuance and revocation-safe successors, while quota
  claim sets reserve all-or-none under canonical ordering and transition or
  recover only through their exact immutable token/digest.
- Closed the remaining redemption/topology ambiguity without adding versions:
  grant attempts now linearize through a co-located fenced local guard while
  dispatch advances only the effect stream; quota sets stay in one local
  partition and wider limits use conserved hierarchical capacity leases.
  `1.0.0` explicitly rejects active/active authoritative multi-region writes.
- Closed the remaining dispatch and lease-lifecycle races without new versions:
  every authority source now supplies a monotonic local dispatch fence; expired
  hierarchical quota leases retain per-kind encumbrances through settlement or
  fenced transfer; and composite transactions share one canonical lock
  order with bounded identity-preserving deadlock retry.
- Closed the target-state and cross-partition transfer gaps without new
  versions: current-target dispatch now locks a typed co-transactional fence
  covering lifecycle and deletion/supersession epochs, while quota capacity
  moves through an explicit outbox/inbox state machine with receipt-idempotent
  local transitions, at-least-once delivery, authenticated reclaim, conservative
  double-entry accounting, and original claim/transfer lineage.
- Closed the provider-concurrency and transfer-reclassification gaps without new
  versions: remote mutations now bind an admitted conditional-write profile and
  immutable validator without pretending to be locally fenced, while capacity
  transfer freezes its complete accounting hierarchy, lane, class, residency,
  and authorization lineage.
- Closed the remaining unconditional-mutation and capacity-class escape hatches
  without new versions: reviewed unconditional mutations now redeem a one-owner,
  revocable, attempt-bounded guarded exception, while existing capacity classes
  are immutable and only future unallocated parent capacity can be resized by a
  fenced, simulated, separation-of-duties policy that preserves protected floors.
- Bounded the interval between dispatch authorization and provider transmission:
  admitted receipts now expire, recheck current fences at a single-use start
  claim, bind the exact worker/provider/request attempt, and treat an uncertain
  start as `OutcomeUnknown` instead of retryable work.
- Gave every capacity-policy lineage one parent and one atomic activation
  boundary over its co-located ledger and independently governed floor set;
  multi-parent rollout now remains conservatively under-allocated until each
  parent transition is durably acknowledged.
- Bound every transmission-start claim to one globally unique claim, exact
  worker instance and lease generation/fence; non-persisted permit material is
  returned once, while ambiguous delivery, duplicate workers, or takeover route
  to reconciliation.
- Made multi-parent capacity rollout depend on a hierarchy-root-owned canonical
  membership manifest, unchanged root epoch, complete prepared-receipt set, and
  total per-class conservation before finalization.
- Added independent protected-floor governance with a separate capability and
  approval lineage, operational-state fences, obligation simulation, platform
  minima, append-only history, and cross-command separation from policies that
  spend released capacity.
- Made root rollout finalization permission-only: every parent must freshly
  CAS-revalidate its ledger, unallocated capacity, floors, obligations, manifest,
  and current operational authority or remain conservatively blocked/reconciling.
- Located non-persisted start permits inside a trusted transmission executor
  that owns both claim and provider socket; split services exchange immutable
  instructions/status only, and transferable permit profiles remain unsupported.
- Versioned and durably ratcheted platform safety floors so stale/lower nodes,
  mixed-version rollout, downgrade, rollback, lower defaults, failover, and
  restore cannot silently release protected capacity.
- Bounded provider execution with immutable versioned profiles: executors have
  no master-key ring or general writes, redeem only exact claim-bound opaque
  secret operations, use least-privilege credentials, enforce deny-by-default
  TLS/DNS-safe egress, and run in documented tenant/account trust partitions.
- Linearized capacity rollout replacement with one monotonic active generation,
  permanent successor supersession, complete-successor rollback over current
  actual limits, conservative blocked parents, typed cancellation versus
  partial-activation supersession, and no late-message or restore reactivation.
- Fully typed platform safety-floor keys now bind accounting hierarchy, quota
  kind, unit/scale, period, lane/class, region/residency, and settlement-policy
  version; every key-set change requires a total overflow-checked non-lossy
  migration or startup fails.
- Made provider execution and credential authority revocable through one
  authoritative profile lineage, monotonic profile/account/credential/broker-
  policy epochs, atomic local successor activation, claim/redemption ordering,
  and restore anti-resurrection.
- Governed profile authority with typed control-plane lifecycle commands, signed
  exact-digest admission, semantic expansion review, risk/quorum/separation
  controls, current activation fences, and pre-activation revocation tombstones.
- Recast remote credential rotation as an evidence-driven asynchronous process
  with atomic local activation, fail-closed unknown states, bounded overlap and
  escalation, confirmed provider revocation, and restore-safe redeemability.
- Added versioned credential-capability snapshots and monotonic local epochs so
  stale, broadened, insufficient, or policy-mismatched out-of-band provider
  permission state cannot authorize privileged transmission.
- Replaced Boolean/string-set permission comparison with reviewed, versioned
  provider semantic evaluators returning equal, subset, superset, incomparable,
  or unknown and binding raw/normalized/evaluator/language/explanation evidence.
- Serialized credential rotation through one lineage owner and co-located guard,
  stable rotation/idempotency/digest identity, authorized provider-inventory
  takeover, quarantined orphan workflows, and credential-count quota accounting.
- Made superset, incomparable, or unknown permission results quarantine the
  entire credential, invalidate every handle and queued instruction, emit a
  security incident, and reject automatic widening or break-glass promotion;
  safe-subset continuation is an explicit profile decision.
- Added governed permission-evaluator lineages with signed binary/corpus
  admission, monotonic epochs, emergency revocation, immediate re-evaluation,
  and incompatible-node startup rejection.
- Added an evidence-backed quarantine resolution state machine that requires
  current evaluator/provider/epoch/consistency and separated-resolver evidence,
  creates a new capability generation, and never revives pre-resolution work.
- Added independently admitted, cleanup-only credential-remediation authority
  for rotation/takeover recovery; providers without an independent recovery
  channel fail to manual intervention instead of reusing quarantine or
  break-glass.
- Replaced the impossible blanket no-plaintext executor claim with explicit
  credential-operation profiles: signing/mTLS/HSM keys stay non-exportable,
  while bearer authorization serialization, TLS, claim, and socket live inside
  one hardened broker/executor TCB with memory canaries and honest limitations.
- Added root-owned recovery for pre-finalization cancellation after preparation:
  one complete successor over actual limits, conservative parents, no
  independent restore, idempotent restore-safe receipts, current-state/
  authority rechecks, and deadline escalation.
- Added local and GitHub verification gates without a crate publication path.
