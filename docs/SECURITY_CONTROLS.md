# Security Controls

## Truthful Capability And Release Evidence

- Every capability uses the normative evidence states in
  [Evidence And Roadmap Governance](EVIDENCE_AND_ROADMAP_GOVERNANCE.md).
  Planning prose, generated documentation, a type name, or a passing docs check
  proves `Specified` only.
- `Implemented` requires an executable owner and its exact required tests;
  `Supported` additionally requires the selected profile's release, security,
  compatibility, operational and exact-commit pentest evidence.
- README, API discovery, UI navigation, release notes, support matrices,
  installers and operator output must expose conditional and unsupported scope
  without silent fallback. Missing or stale evidence moves readiness toward
  refusal.
- `0.140.28` blocks a Hosted production claim unless mandatory dependency-free
  transport/crypto, storage, identity/session, hostile-input, packaging,
  operations, and recovery profiles are all Supported with exact evidence.
- One canonical roadmap manifest accounts for all 414 exact stops and their
  owners, evidence, authority review and pentest markers. Count or claim drift
  is a release-blocking integrity failure.

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

From `0.30.23`, every domain owns one checked identity/application/event
manifest with exact aggregate/stream, command, event, compatibility/upcaster,
read, and applicable consumer references; later typed extensions reference,
never copy, authoritative policy, tenant-surface, workflow, search, workspace,
API, and transfer registry entries. `0.30.24` enforces namespace, dependency,
generation, compatibility, rollback, mixed-node, atomic metadata admission,
scope separation, contribution-kind registry/lifecycle/test/certification
obligations, and no-authority-from-declaration rules. Metadata admission cannot
enable a feature, plugin, consumer, license, entitlement, or authorization.
`0.30.25` makes absent-surface-only deferrals exact, expiring, retested, and
product-state visible; existing schema, storage, routing, derived data, effects,
or messages cannot defer their structural controls.
`0.30.26` backfills current event ownership/evolution. `0.30.27` consumes the
complete `0.18.8–0.18.10` family and gates effects/messages/consumers/timers/
activities/poison/replay/quarantine/results. `0.30.28` requires permanent-ID,
fenced, drained, history-preserving retirement with orthogonal evidence and
distinct verified/loss/blocking terminals. `0.30.29` governs exact tenant-child
proposal authority and recovery; `0.51.5` owns authenticated deployment
membership cuts, topology reconciliation, and safe fence release; `0.51.6`
owns separated approval, exact-cut plan consumption, atomic campaign admission,
and constrained child-authority derivation; `0.51.7` owns successor-plan CAS,
allowed deltas, cumulative budgets, predecessor fencing, and resume authority;
`0.51.8` owns narrow domain guarding, authoritative post-cut absence/child
handoffs, and broad-fence transfer; `0.51.9` owns the joint successor/
protection-root CAS and ancestor-receipt validity; `0.51.10` owns bounded fair
isolated-child dispatch and truthful terminal aggregation; `0.51.11` owns
tenant-local residual-obligation handoff, authenticated receipt reconciliation,
and retained tenant fences; `0.51.12` separates immutable residual membership
from authenticated predecessor-linked mutable state; `0.51.13` owns exact
restore-safe partition delivery cuts so a folded parent head cannot hide local
state and defines absorbing consumption/canonical empty state; `0.51.14` owns
closed mutation classification, emergency restrictive invalidation, safety
epochs and mode-bound source status; `0.51.15–0.51.18` authorize/complete
target-slot takeover, atomically transfer funded capacity for retained
candidate controls, and reconcile every barrier release/retention receipt;
`0.51.19` archives before deletion under truthful uncertainty; `0.51.20`
independently authorizes exact retained-namespace safety; `0.51.21–0.51.48`
evaluate reinstall under partition fences, enforce explicit lifecycle
adjacency, serialize activation against abort,
require source-local activation-permit redemption and successor-restriction
bridges, fund each bridge under one durable owner, define canonical clean-empty
ownership/disposition roots, reconcile/abort/supersede partial admission
without treating unknown as absence, default permanent unknown to terminal
unavailable unless an independent two-CAS quarantine profile is selected and
fully fences it, make quarantined unknown restrictions maximal authoritative
members over a generated complete operation universe actively enforced by
evaluation, admission and funded bridges, consume replacement eligibility once
into a finite predecessor-linked evaluation lineage with cumulative budgets
and permanently terminal exhaustion, create exactly one proof-bound successor
lifecycle, keep lowering evaluation/permits distinct from reinstall authority,
use one closed top-or-pre-operational-lowered genesis tag through lifecycle
creation, per-partition adoption and final activation so neither the restriction
branch nor eligibility can be consumed incorrectly; require closed Top/Lowered
partition-receipt and admission-root variants with no optional authority
members; preserve bridge identity and capacity while carrying the lowered
branch through the same expected-generation lifecycle CAS and tagged
admission/ownership roots; atomically consume both candidates only after
complete admission and bridge-ownership transfer; commit-revalidate evidence,
coverage, safety, restriction, revocation/expiry and prepared-root/bridge-owner
state plus distinct current guard-slot, non-operational candidate and expected
successor generations; route every final freshness failure through typed
`ActivationPrepared → AdmissionRevalidationRequired`, with Blocked diagnostics
derived only and permanent denial continuing through abort/disposition;
reconcile both reinstall release families; permit
already-operational lowering only through the same fresh guard-slot CAS; and
release the old top only through per-enforcement-point Released or
RetainedAccepted receipts committed by expected-version member CAS with
absorbing terminals, with unknown remaining pending; canonical parent vectors
select one maximum authenticated version independently per member and allow
heterogeneous cross-member versions; identical pending observations coalesce
under a separate bounded attempt budget; pending version saturation reserves
terminal capacity; and completion requires zero pending under authenticated
conservation.
`0.51.41` derives every finite budget from governed per-class bounds and cost
units and funds the checked worst authorized work without borrowing.
`0.51.42` constructs immutable manifest members, transition and retry-ledger
geneses in authority-inert bounded batches, seals their exact root, and leaves
the guard-slot transaction only a bounded root recheck/binding; inactive roots
are safely disposed under retained funding. Pending advances only below its
ceiling, enters saturation exactly at the ceiling and jumps from valid
Pending/saturation directly to the reserved terminal version.
`0.51.43` forbids cross-store transactions: source release and destination
retention each commit a local effect receipt, while a durable parent inbox
folds only the selected intent through one parent-local member/head CAS.
`0.51.45` source-fences the complete distributed predecessor inventory through
activation; `0.51.46–0.51.47` commit one parent intent and require its closed,
activation-bound one-shot authority to be consumed with the remote effect.
`0.51.48` keeps contradictory physical effects nonterminal until every losing
effect is removed/transferred or durably funded and exact conservation holds.
Saturated recovery remains
a retry-only lane with no terminal or cleanup authority; `0.51.44` charges its
non-resetting lifetime limit through a separate versioned ledger before outbox
work and binds that head into restore and terminal evidence. Dispatch remains
closed until continuity from sealed construction genesis is admitted; a
signature, larger version or reconstructed history alone grants nothing.
No wildcard tenant or cross-tenant retirement transaction exists, and loss
never counts as clean or grants deletion/hold release. `0.51.4` immediately
certifies tenant surfaces; `0.139.1` iterates
contribution-kind obligations; and `0.145.4` destructively certifies retirement
without first implementation. Missing obligations block the owner and release.

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
  only after generation-2 admission and with exclusive authority; one
  independent topology-authorization issuer with issuance-time authority/
  quorum checks, short immutable grants, idempotent unknown-response recovery,
  revocation/supersession of future issuance, independent break-glass recovery,
  and restore high-watermarks; authenticated mutation class/issued-at/deadline/
  maximum-uncertainty/trusted-time-profile/issuer-continuity fields with
  concrete five-minute initialization, two-minute commit-or-successor, and
  sixty-second break-glass ceilings; fail-closed issuance and rollback-
  resistant consumer lower-bound/profile/continuity/expiry ratchets proving
  pre-expiry CAS despite clock steps, suspend, restore, failover, or skew;
  canonical `TopologyMutationAuthorizationReceiptV1` persistence and mandatory
  backend `DeadlineConditionalTopologyCasV1` with an authoritative commit-time
  predicate or hard no-late-commit fence; atomic time-ratchet/receipt/claim/
  topology/member-fence/tombstone/outbox persistence and typed reconciliation
  where client timeouts never permit a later commit;
  bounded `TopologyAuthorizationReplayLifecycleV1` with independently
  provisioned, non-borrowable `Normal`/`Recovery`/`BreakGlass` accept queues,
  sockets/file descriptors, TLS workers, decode CPU/memory, executor queues and
  pools under one aggregate fail-safe ceiling; server-controlled listener/TLS
  routing selects an ingress lane but grants no authority; per-lane
  pre-authentication ingress byte/concurrency/cryptographic/canonical-decode
  work limits;
  VIT-INV-061 as sole owner of the versioned presentation-lane mapping, with
  separated requestor/approver/activator roles for emergency promotion under
  current policy and recorded change or incident authority;
  a two-stage presentation protocol where
  `ChargeTopologyAuthorizationPresentation` durably charges after
  authentication/canonicalization but before protected idempotency lookup and
  issues bounded internal, non-exportable, single-use
  `TopologyAuthorizationPresentationChargeV1` evidence bound to request/caller,
  ingress/presentation lane, mapping identity/generation/fence/profile digest,
  budget epoch/sequence and owner/boot continuity;
  `ConsumeTopologyAuthorizationPresentationCharge` consumes that evidence,
  rechecks the current mapping generation, and only then performs the
  first-seen request/outcome/issuance transaction; mapping change returns
  `TopologyAuthorizationPresentationLaneChanged`, while crash or fenced
  continuity leaves the charge spent, allocates no logical request, and
  requires a fresh retry charge; evidence/dispositions are bounded and
  checkpointed before deletion;
  atomic stage-one debit/evidence/sequence/`ChargedAwaitingStageTwo` persistence
  or pre-lookup failure on charge-ledger saturation; a closed disposition table
  whose `Consumed`, `MappingChanged`, `ControlledAbortAbandoned`, and
  `ContinuityFencedOrphaned` outcomes are irreversible; and
  `CheckpointedCompacted` preservation of the original terminal kind and
  result/evidence commitment;
  non-borrowable Normal/Recovery/BreakGlass charge-ledger rows, bytes, awaiting
  state, backlog, checkpoint/archive I/O, and compaction workers below
  aggregate ceilings; immutable VIT-INV-061 capacity-profile successors with
  expected-version activation, governed emergency/aggregate changes,
  drain-before-shrink, physical provisioning proof, downgrade fencing, and
  restore from the greatest authenticated committed activation record rather
  than raw generation or numeric maximum;
  atomic lane-scoped PendingDrain fence installation; one nonterminal successor;
  stage-one fit against active and successor profiles; typed pre-debit draining
  denial; exact action-authorized expected-version activation/rejection with
  atomic fence consumption; authenticated
  failover/restore; stale-worker and competing-successor rejection; and
  Recovery isolation;
  mandatory PendingDrain for every canonical reduction; overflow-safe typed
  complete-profile comparison with unknown/incomparable schemas treated as
  reductions; canonically derived aggregate-to-lane fence coverage; fixed
  lane/aggregate capacity-row locking; activation-record-selected recovery
  with lineage/activation high-watermarks; and atomic, uncallable fence
  lifecycle events;
  action-bound drain authorization for Normal/Recovery/BreakGlass/aggregate
  actions with exact scope/diff/coverage/policy/approval/SoD/expiry/nonce/
  idempotency binding and separately authorized rejection/abandonment; closed
  Issued/Consumed/ExpiredUnused/RevokedUnused authorization consumption,
  atomic tombstone/result/mutation/event/audit/outbox persistence, exact retry
  recovery, typed conflicting retry, and permanent non-reuse;
  conservative trusted-time authorization validation with not-before/issued/
  expiry, uncertainty, profile/epoch, issuer continuity, signer/key epoch/
  authentication profile, long-drain historical validity, fresh activation
  authority, and rollback/suspend/restore/failover ratchets;
  canonical non-wrapping predecessor-linked activation records atomically
  committed with head/supersession/fence/audit/result/outbox, authenticated
  checkpoint-before-delete covering authorization/result/time/key
  high-watermarks, validation evidence and replay tombstones, and chain/head/
  high-watermark rollback refusal;
  bounded authenticated sparse drain-replay checkpoints/archives preserving
  exact canonical results or authenticated references, request/lifecycle/
  scope/predecessor/key commitments, exact-set membership/non-membership,
  resource-bounded verification and durable cursors; no permanent unbounded
  retention or arbitrary-ID dense-watermark inference; unavailable archive,
  key, chunk or proof fails closed without execution under reserved Recovery
  maintenance capacity;
  one cumulative non-wrapping predecessor-linked replay head per tenant/
  deployment, with non-membership checked against its greatest committed root
  plus current hot rows; staged immutable upload and verification followed by
  one local head-CAS/exact-hot-delete transaction; readers ignore staged/
  verified/orphan data, unknown external outcomes retain hot state, local
  unknowns reconcile the bundle, and orphan GC requires no committed reference
  or authenticated successor equivalence without a distributed transaction;
- proof-to-execution admission binds the proof for writer-authoritative head
  `H` to an unchanged head, exact-key lock, current-hot absence and unique
  replay insert in one local write transaction; head change returns a typed
  no-write restart, compaction uses the same head-first lock order, and async
  replicas, followers, caches or weak snapshots never authorize;
- canonical drain replay keys bind tenant/deployment/action kind/action ID/
  idempotency ID while independent scoped unique constraints prevent one-sided
  ID reuse; durable logical-attempt budgets accumulate head restarts, proof
  bytes, decode/work, elapsed time and observed advances across crash/failover/
  retry, returning typed no-write contention at exhaustion; finite authenticated
  admission/compaction quanta cannot be held by unauthenticated callers and
  retain protected Recovery progress;
- one closed drain replay-admission attempt owns each nonterminal canonical
  key/budget; identical requests join and changed material conflicts; workload/
  boot/lease/fence/CAS takeover preserves counters/deadline and rejects stale
  owners; success co-commits with replay/action state, no-write terminals are
  irreversible, bounded attempt/terminalization/cleanup capacity is reserved,
  and checkpoint/link-gated cleanup removes no replay-critical evidence;
- the attempt-capacity ledger locks replay head→optional settlement journal
  head→key/attempt→capacity→domain, atomically
  reserves original active/terminal/checkpoint/cleanup buckets with creation,
  gives joins no reservation, rechecks fence/deadline/budget/head at success,
  and transfers active-to-terminal with the action/no-write bundle; stable
  per-leg settlement identities separate checkpoint from physical-deletion
  release, reconcile unknown outcomes and prevent double decrement or
  current-profile recomputation;
- checkpoint and physical-deletion capacity-settlement evidence uses one
  domain-separated authenticated sparse checkpoint/archive with two heads and
  one namespace for every
  checkpoint/deletion leg: checkpoint decrements/per-leg rows/journal append/
  attempt checkpoint/audit/result commit atomically, and physical deletion uses
  the same protocol for separate legs; the local journal head implies no
  archive availability; the verified archive replay head advances only after
  upload/verification and its CAS commits with exact captured-version row
  deletion, including mixed-trigger archives;
  authoritative lookup revalidates archive head H and combines it with current
  hot-row version and journal continuity; absent-envelope non-membership never
  decrements, archived duplicates return one result, changed bindings conflict,
  unavailable checkpoint/deletion history retains the affected charge, exact
  tombstones survive coalescing,
  and bounded settlement storage/proof/compaction plus Recovery capacity forbid
  permanent rows or dense settlement inference;
- fail-closed capacity recovery decodes one complete tuple containing both
  settlement heads, both non-wrapping chains and authenticated coverage,
  root/key/publication/cursor, exact covered/current rows, settlement/trigger/
  bundle/result identity, attempt-checkpoint linkage, settled and remaining
  leg sets, and conservative original-bucket balances; omission or defaulting
  denies; singular-head state was never an admitted Vitheim schema and is
  quarantined before authority mutation, without split migration, invented
  predecessor/coverage history, genesis inference or capacity release;
- migration/import work uses one durable fenced job budget with monotonic
  operation and principal/tenant/deployment counters for cumulative encoded/
  decoded bytes, objects/chunks, allocation and cryptographic/proof work,
  temporary/staged storage, files/streams, resumes/retries/time, cleanup and
  concurrency; creation reserves terminal and Recovery-protected cleanup
  capacity, work precharges bounded quanta, exhaustion fences promotion and
  preserves the source, and quarantine stores only bounded metadata/digests;
- `VIT-INV-062 MigrationImportJobAuthorityState` owns migration/import
  operation uniqueness, budget/reservations, closed lifecycle, lease/fence,
  candidate/tombstone, authorization consumption, barrier/result and cleanup
  security-control state, but owns no imported domain state;
- `VIT-LAW-009 AtomicMigrationImportActivation` derives the complete ordered
  `MigrationImportOwnerManifestV1` in trusted code from both schema manifests,
  migration-plan digest, the currently admitted VIT-LAW-009 tuple/manifest and
  its authenticated dependency set; this law closure is the only owner universe,
  no separate runtime invariant catalog exists, importer-supplied selection is
  never authority, VIT-INV-062 is typed only as the live destination
  coordinator, and every remaining selected contributor retains domain
  ownership;
- owner-held authentication produces dormant-preparation receipts while
  VIT-INV-062 has verify-only access; activation uses an independently issued,
  candidate-bound `MigrationImportActivationAuthorizationV1`;
  `AdmitMigrationImportActivationAuthorization` alone creates Issued, while the
  closed lifecycle also contains RevokedBeforeAdmission, Consumed,
  ExpiredUnused and RevokedUnused with trusted-time/key/continuity ratchets and
  permanent tombstones; admission after target expiry creates ExpiredUnused,
  never Issued;
- revocation becomes effective only when an authenticated candidate-bound
  `MigrationImportActivationRevocationIntentV1` advances the monotonic issuer
  authorization-scoped sequence and either creates a permanent
  RevokedBeforeAdmission tombstone on an absent row or CAS-transitions Issued
  to RevokedUnused with inbox receipt/result/audit/outbox; admission,
  activation, expiry and revocation use the same row, the intent cannot expire
  before its target authorization, remote emission is not revocation, and a
  late intent after Consumed returns the activation result without reversal;
- through `1.0.0` every affected owner guard is co-located with the job/barrier,
  and one local transaction uses
  deployment-retirement-fence→active-coordinator-generation→job→candidate/barrier→authorization→ordered-domain-owner→control-settlement-archive-head→control-settlement-journal-head→recovery-capacity-parent-ledger→backend-storage-cost-active-recost-campaign-slot→backend-storage-cost-recost-campaign-fence→corruption-control-reserve→history-obligation→corruption-fence→corruption-control-lineage→corruption-control-lineage-checkpoint→lineage-disposition→recovery-authorization→clearance-anchor-source-manifest-head→clearance-anchor-source-manifest-authorization→corruption-clearance-anchor-registry→corruption-clearance-scope→corruption-clearance-authorization→corruption-clearance-attempt→corruption-rebuild→corruption-rebuild-rejection-authorization→archive-head→history/idempotency→recovery-lineage-budget→attempt/successor-budget→retention/legal-hold→audit/result/outbox,
  then rechecks current budget/fence/authorization/
  manifest/receipts/owner versions, consumes authorization, then activates all
  owner generations plus Pending/zero-counter-lineage or
  NoHistory/zero-eligibility-proof or NotRequested/custody-record and
  result/audit/outbox or
  none; every pre-activation
  failure permanently fences the candidate, response-loss retry is idempotent,
  cleanup cannot promote or delete authority, and non-co-located selector
  fallback is unsupported;
- VIT-INV-062 is never imported by the candidate it coordinates: destination
  operation/job/budget/fence/candidate/authorization/barrier/result/cleanup
  state remains live authority; nonterminal source jobs deny, terminal history
  is inert and post-activation archival only under authenticated provenance,
  sequence/idempotency, retention, bounded work and protected cleanup state;
  archive collision/failure has a separate durable disposition and never
  changes activation; cleanup waits for the terminal obligation checkpoint and
  absence is never treated as NoHistory/NotRequested; exhausted work remains
  nonterminal ManualRecoveryPending with descriptors/reservations retained
  until exact recovery authority acts; RetryAppend can reach only Appended or
  ManualRecoveryPending; activation creates immutable zero-counter lineage
  beside Pending, initial work atomically charges attempt and lineage budgets,
  NoHistory/NotRequested prove no executable lineage, and missing nonterminal
  lineage commits an obligation-scoped corruption fence/result. Activation
  creates a Healthy generation-zero fence for every obligation; absence denies.
  Before activation, one independently authorized source-manifest genesis and
  Prepared→ProposalPublishedVerified→LocalActivationCommitted→Active lifecycle
  rejects fork, gap, reorder, raw-generation selection and lazy initialization.
  A governed publication-profile lineage binds exact witnesses/sources, quorum,
  crypto/time rules and identity/generation/digest into every artifact; callers
  cannot select the mode. A non-recursive trust anchor, explicit bootstrap/
  rotation/checkpoint/high-watermark lifecycle, compatibility decision and
  monotonic distrust ratchet govern succession. Profile transition, distrust
  and activation serialize on one governance-root external CAS activation
  fence port with domain-separated key, sequence/predecessor, stable request,
  operation digest, authenticated receipt/status, consensus assumptions and
  anti-fork/rollback finality; independent signatures cannot satisfy it. CAS
  and status reads are linearizable, request identity binds one digest, final
  results are immutable and compaction retains authenticated request-result
  membership. Profiles are tenant/deployment scoped with one exact
  nonterminal attempt slot. Root loss/full compromise uses an independently
  rooted Pending→Retired/EvidenceUnavailable retirement protocol that never
  needs the lost root; unavailable evidence permits empty replacement bootstrap
  but permanently quarantines old custody. Replacement inherits no authority/
  sequencing state, and `1.0.0` has no in-place recovery root. Retirement
  consumes an independently admitted six-state single-use grant in the same
  transaction that advances a genesis-created Operational/RetirementPending/
  Retired fence; every authority and execution boundary rechecks that fence,
  creates Pending and reserves complete terminalization capacity or none.
  That fence is the first universal lock rank. Activate, Abort
  and PermanentlyUnresolved share the governance sequence and one immutable
  per-transition terminal CAS; journal/high-watermarks are receipt projections.
  Proposal and active high-watermarks are separate,
  stable request identities reconcile unknown publication, and local CAS is
  followed by an external activation receipt or authenticated abort/unresolved
  disposition. Restore/import trusts only externally Activated lifecycle under
  the bound profile; an older self-consistent local snapshot,
  unavailable lifecycle/witness/key proof or operational-active head below the active watermark is
  typed `ManifestHistoryUnavailableOrRolledBack` and unready. Activation binds
  that witnessed head; a greater unresolved proposal cannot poison the last
  proved Active predecessor and blocks only itself, descendants and cleanup.
  Separate operational-active and transition-candidate heads enforce that rule.
  Finalization rechecks current compatibility/distrust and terminalizes rather
  than activates an old profile when required. Every publication attempt
  reserves complete non-borrowable completion capacity before its first send.
  PermanentlyUnresolved requires an authenticated external terminal seal;
  timeout, retry exhaustion or witness absence retains fenced reconciliation.
  Activation creates registry generation zero and a non-borrowable Recovery
  control reservation for fence/scope/terminal/result/audit/outbox state under
  a trusted capacity profile and immutable platform maximum. It also creates an
  obligation-wide control lineage holding the original reservation. Each
  lifetime-work budget conserves available/reserved/nondecreasing spent proof,
  retry, hash, signature, bytes-processed and time. Its separate physical-
  capacity ledger conserves reserved-unoccupied/occupied/reclaim-pending/
  released rows, bytes-stored, audit and outbox; only verified archive plus
  exact deletion releases it. Signed backend cost profiles charge canonical
  destination artifacts by backend/schema/index generation with checked
  rational ceiling arithmetic and canonical boundary/golden vectors. An
  independently rooted cost-profile lineage/head/high-watermark and analytical
  complete-domain classifier require destructive authorization for any
  possible lower charge. The rounded-affine symbolic classifier has explicit
  input/proof/work maxima; only ValidWeakening is authorizable, while invalid,
  unknown, malformed, overflowed or over-budget input is terminal no-write.
  Backend/schema activation uses one parent/selector active campaign slot, a
  total state/recovery-intent table, parent epoch/fence, fixed pre-cut snapshot
  and bounded post-cut fold with a hard final tail. Parent conservation covers
  active, campaign RecostPending, pending-successor and workspace aggregates;
  each forward transfer moves equal amounts between the middle two, while
  workspace reservation/settlement uses exact parent transfer/inverse rows.
  Workspace OriginalTotal is immutable, Released is monotonic and the remaining
  parent member is derived; a complete leg moves to Released atomically with
  its inverse credit and settlement evidence.
  Before reservation,
  pre-cut release settles active charge only and tombstones the child into the
  folded reservation cut; later releases settle RecostPending or pending
  successor. The campaign fence follows its parent-ledger rank. Prior-state
  Fenced recovery stays bounded and preserves Open/Finalizing. Abort/quarantine
  close; Closed never reopens; activation/abort/quarantine share one terminal
  CAS/checkpoint. Permanent quarantine consumes a distinct six-state one-shot
  grant under SoD; remote revocation is only a signed issuer intent until the
  destination sequence/inbox/apply transaction commits it. Quarantined
  capacity remains the whole parent member until broader custody-safe release.
  Revocation/expiry/consumption use one first-terminal-wins result table, so
  CAS losers return the stored terminal outcome rather than loop/conflict.
  Final activation consumes current authority and binds a Verified campaign-
  owned workspace at the exact same closed logical/physical cut, with physical
  high-watermark, source ledger/ceiling, bounded old-fence cleanup and a
  deletion-proved settlement checkpoint plus inverse parent credit. A protected
  cleanup lane, durable contention budget and hard terminal-backlog maxima
  force bounded cleanup progress without a backend fairness assumption.
  Unknown deletion outcomes enter bounded reconciliation. Independently
  authorized permanent retention consumes a precharged pool slot, preserves
  the complete parent charge and removes the exhausted workspace from the
  active lane without changing activation or abort; an authenticated cleanup
  origin returns only to its matching pending state. Retention and lineage
  BeginRelease/ReplanCustodyRelease/AbandonCustodyRelease/
  CommitCustodyRelease use closed destination-applied
  authorization state/sequence/inbox/tombstone/outcome families, so custody
  evidence alone has no command authority. Broader custody release can credit
  only after every remaining leg proves AuthenticatedDeleted for its exact
  storage generation/root or TransferredToCustodyLedger against a Begin-created
  TransferPending maximum. A governed versioned profile maps unlike source/
  destination generations, units and overhead with checked rational ceilings.
  Each reservation pins its exact generation/evaluator in the existing
  governed lineage; live dependencies retain old evaluators and fence
  incompatible/weakening activation, with destructive authority required for
  weakening. A streaming charge cap and atomic bounded extension commit
  capacity before extra bytes or finalization. External transfer follows
  Open→SealPending→Sealed; only Open mutates, unknown seal is never guessed and
  reopening requires provider proof the old completion can never occur;
  provider-fenced Sealed binds immutable object/root/size/ETag/version before
  eligibility. Evaluator binary/corpus digests
  and authenticated node readiness are mandatory; emergency distrust denies
  chunks, extension, eligibility and Commit until independent migration
  preserves at least the existing maximum. Reassessment never clamps corrected
  charge: positive deficit debits protected emergency capacity or fences
  tenant/backend readiness until separately authorized remediation.
  EffectiveCharge combines base plus covered deficit, and Commit atomically
  settles both into one conservative custody member before
  exact source credit. Unknown preserves predecessor and pending charge; only
  definitely-never-transferred or exact destination-deleted reconciliation
  releases it. After bounded permanent uncertainty, independent quarantine
  converts the full EffectiveCharge into a permanent member, fences namespace/
  transfer, retains legal-hold evidence and never treats late evidence as
  refund authority. Platform/tenant ceilings and a separately authorized
  confirm/delete/permanently-unresolvable workflow preserve quarantine and
  legal-hold denial. Both destructive workflows have full destination-applied
  six-state authorization/revocation families. Remediation actions have a total
  continuation matrix; Begin consumes authority and creates the exact effect
  before dispatch, Complete never redispatches, and destructive completion
  uses fresh finalization authority. Broker-only Dispatch is the current legal/
  hold/policy cut and rechecks credential/distrust/fence/routing epochs while
  atomically redeeming one-use capability into EffectDispatched. A governed
  provider profile/result freezes effect-ID, dedup/query horizon and
  authenticated no-effect guarantees. One persisted application-level
  transmission claim realizes VIT-INV-006: only the winning executor receives
  one unreconstructable process-local permit, while the durable row/digest is
  non-bearer status evidence and retry returns no permit. It permits only
  in-invocation transport retransmission; return, crash, lease loss or
  uncertainty is query-only. BeginRelease
  Admit charges a
  bounded pre-Begin pool; winning Begin transfers it into the lineage budget,
  and cleanup is exact-candidate scoped under a winner mapping. Final Commit
  selects completed with/without residual custody and transfers every surviving
  terminal unknown member to its own budgeted residual obligation under a
  sorted immutable descriptor/transfer root; versioned child/budget/aggregate
  state settles atomically with one externally checkpointed cumulative anti-
  rollback head. Winning Begin creates explicit LineageOwned routing generation
  1 plus NoneCanonicalEmpty aggregate state, and the generationed CAS selects
  lineage or residual ownership for all destination operations; absence never
  implies ownership. MarkEligible and final Commit bind a complete attempt-set
  root and refuse all nonterminal provider work. A closed writer matrix makes
  every authorization/effect/capability/evidence/reconciliation/archive
  mutation advance it under one order. Mutation after CommitEligible proceeds
  while atomically selecting typed PreparingRevalidationRequired with mandatory
  invalidation/root bindings; PreparingOpen alone admits new effect/artifact
  work and the separate fence is integrity evidence, not authority. Every
  further covered mutation while Required appends an immutable non-wrapping
  advance, CASes previous/current root and cumulative commitment, and remains
  denied. Full eligibility validation must verify the continuous chain or
  authenticated checkpoint plus suffix and bind its final current root.
  Begin/Replan requires an overflow-checked lifetime-capacity proof over fixed
  `u128` attempt-set/revalidation/canonical capacity-checkpoint/capacity-
  replay-head counters plus capacity-archive guard generation and reserves each
  `u128::MAX` exclusively for an
  absorbing exhaustion fence. The archive sequences form one pair with one
  atomic pair sentinel and advance together only on successful capacity-
  archive Commit (`ArchiveFinalize`), never FinalizeGc. Insufficient headroom denies before
  external work; a valid sentinel permanently unreadies every effect and
  Commit path and never represents the triggering mutation. A lineage-wide
  capacity state owns class-specific admitted/consumed/reserved/remaining
  counts satisfying `admitted = consumed + reserved + remaining` and
  head/counter equations. Permit admission moves remaining→reserved; the
  terminal result/event/audit/outbox transaction moves selected legs
  reserved→consumed and unused exclusive legs reserved→remaining. Retry, CAS
  loss, timeout and failover move nothing. Reservation IDs/amounts and
  settlement history remain integrity-committed through Replan, compaction,
  restore and migration. Every writer locks it before the attempt-set head and
  atomically consumes one immutable exact-retry charge with mutation/head/
  result. Every ordinary writer then locks/reads the high-watermark guard and
  denies PreparePending/AbortDrainPending/Witnessed and may omit only unrelated later rows;
  archive writers lock publication before replay head. Acquired subsets always
  preserve relative rank. Replan, compaction, restore and migration cannot reset it. Dedicated
  capacity checkpoints and a predecessor-linked archive-replay head commit
  exact charge/result membership, capacity/sentinel equations and archive
  epochs. Only the greatest verified head plus hot suffix is authoritative;
  archive loss returns typed historical-state-unavailable without a charge or
  head advance. Publication uses a bounded manifest/cursor/budget and closed
  Staged→Verified→Consumed or Orphan→Collected receipt machine funded by
  non-borrowable Recovery capacity. The guard is generationed. Prepare moves
  Unprepared(`g`)→PreparePending(`g`) and returns the sole process-local
  unreconstructable submission permit; only after that Prepare commit may the
  permit submit, while every other state, stale generation and retry is
  query-only. Witnessed(`g`)
  can end only when Commit atomically installs replay head, deletes captured
  rows, records Committed(`g`) and opens Unprepared(`g + 1`). Ordinary
  negative status never rolls a guard. Abort moves through AbortDrainPending,
  denies new queries and calls
  `SealCapacityArchiveWitnessProposalDefinitelyUnwitnessed` with one
  non-bearer seal claim. Expected-predecessor/proposal CAS serializes seal
  against submission; the authority permanently tombstones rejection, rejects
  every late submission and exposes an independently discoverable receipt.
  Abort opens `g + 1` only after that receipt, every query is terminal, every
  terminalization reservation and settlement is consumed and no positive
  receipt exists. Positive-after-seal evidence fences the lineage as authority
  equivocation. That fence is permanently absorbing for the lineage and old
  authority identity/key epoch. Both receipts are retained; no ClearFence,
  receipt preference or old namespace reuse exists. Only independent quorum
  and SoD may retire that authority and bootstrap a new identity/lineage with
  fresh sequencing/permit namespaces and conservative consumed/reserved
  carry-forward that cannot increase remaining capacity. A unique fence-keyed
  NoReplacement→Staged→ActivatedPendingPointerWitness→Operational head and
  current pointer prevent split-brain replacements; different material is
  permanently rejected. Signed `P_n` reconciliation alone makes the pending
  lineage operational. Retirement is one
  local AuthorityRetirement writer/class/charge, atomically terminal with one
  recovery-head advance. A parent Recovery escrow funds the separate recovery
  writer head and non-releasable Fenced EvidenceMaintenance partition.
  Generation-zero bootstrap instead verifies a pre-signed receipt under a
  separate deployment-bootstrap reserve, with no signer call in its local
  transaction. Frozen-source outbox/destination-inbox transfer,
  one-to-one-or-quarantined reservation disposition and an independent
  predecessor-linked high-watermark make one-sided rollback detectable; the
  destination remains non-operational until exact import/conformance and
  pointer activation. Dedicated exact-set recovery checkpoint/publication/
  replay/restore state and independent pointer/fence high-watermarks in one
  total recovery-anchor chain
  begin from signed tenant-bound `P_0` plus explicit CanonicalNoPredecessor and
  Healthy recovery guard, require `C_1→P_0`, and use only the acyclic stagger
  `C_n→P_(n-1), H_n→C_n, P_n→H_n`; generated
  schema/hash-DAG tests reject same-generation back-edges and future signature/
  result inclusion. Dedicated typed checkpoint-create, pointer publish/
  Reconcile/query and restore advance/complete writers are bounded and return
  no reusable permit. Orphan/GC proves current non-reference across all replay,
  transfer/pointer, activation, restore, evidence, retention and legal-hold
  authorities; externally bound publication cannot orphan. These controls
  prevent compaction loss or older-authority revival across sequential
  equivocations; historical unavailability stays unready and never falls back
  to the old archive. Contradictory pointer evidence atomically consumes a
  pre-reserved terminalization leg, preserves both requests/receipts/discovery
  evidence and CASes Healthy→Fenced. Every post-bootstrap writer locks the
  guard first. AuthorityChanging requires Healthy; Fenced EvidenceMaintenance
  permits only exact checkpoint/archive Commit, independent fence-anchor
  publication/query, restore verification/export and monotone custody
  strengthening. A shared non-wrapping anchor sequence makes the fence
  high-watermark dominate all earlier pointers, and restore compares both
  greatest anchors. No generic clear or recursive automatic replacement
  exists. Every pointer query is first registered in an independent
  rollback-resistant observation registry. A signed no-fence assertion covers
  only its sealed exact-set zero-unresolved frontier. There is no
  cross-system CAS: registry claim drain, non-authoritative local preparation,
  signed registry confirmation/rejection, exact local CAS, signed local-
  finalization receipt and registry settlement order restore and every
  authority mutation. Effects additionally redeem a current claim at the
  executor/provider fence immediately before send. The external registry
  denies claims in ObservationBlocked, FenceAnchorPending and RestoreUnready;
  exact `F_m` enters absorbing AuthorityFenced, which a stale local Healthy
  restore cannot reopen. Operational admission proves live plus outcome-
  unknown claims never exceed signed per-kind/tenant/deployment/global
  `c_max`, and every claim owns protected drain/terminal work. Confirmation,
  timeout or row absence cannot release a claim without authenticated local
  commit or permanent no-commit evidence.
  Initial claim creation itself uses durable Admission, one-shot Publish,
  signed Reconcile and bounded status-query settlement; a lost Issued receipt
  cannot reconstruct a permit, and Unknown/Unavailable stays potentially live.
  PreparedNonAuthoritative is stored only in a proposal namespace and allocates
  no stream version, journal offset, event ID, outbox/projection position or
  successful idempotency result. Finalization appends a new immutable batch
  whose canonical event bodies match the confirmed proposal and atomically
  writes an unsigned commit record. The selected signer signs only that
  post-commit record through its own response-loss protocol; no HSM/KMS call or
  implicit in-process signature occurs inside the database transaction.
  Claims bind exactly one DomainAggregateTarget, ControlOwnerTarget or
  CanonicalNoAggregateTarget. A domain proposal/finalization touches one stream
  only; cross-aggregate work is rejected to the Phase B process-manager/outbox
  path. Registry confirmation signs a ProposedEventDescriptor root covering
  event/schema identity, target, tenant, command/causation/correlation, time,
  sensitivity/custody and payload lifecycle. Inline payload is permitted only
  for non-sensitive schemas; classified data remains an opaque encrypted/
  externally erasable reference or erased tombstone and never enters registry,
  signer, status, audit, log/trace/error or archive records as plaintext.
  Residency, retention, hold, ciphertext digest, keyed/domain-separated
  plaintext commitment and key custody remain bound through finalization/
  export; raw dictionary-testable hashes are forbidden. PayloadReferenceUseClaim
  binds every proposal/event/shared member, transfer-unknown disposition and
  authoritative release proof. Neither proposal terminality nor a local count
  authorizes erasure. `P_claim` funds pre-settlement work and admission reserves
  a tenant PayloadLifecycleMaintenanceCapacity landing slot. Post-signing enters
  PayloadMaintenanceHandoffPending; an exact local handoff, or
  CanonicalNoPayloadMaintenanceHandoffProof for an empty governed-reference
  set, is required before settlement publication and `P_claim` release, while
  registry settlement later releases `c_max`. Conservation admits neither dual
  nor absent ownership. Stable reservation/settlement IDs, a predecessor-linked
  journal, verified archive replay and authenticated physical-deletion receipt
  carry each leg to absorbing PhysicallyReleased. Unavailable archive retains
  occupancy and exact retry cannot double-release. Lifecycle
  saturation rejects new classified payloads without blocking unrelated
  commands or existing cleanup. The target binds its expected predecessor; only journal
  identity, a commit-cut-containing interval under the non-regressing recorded-
  time ratchet and the canonically derived predecessor chain are finalizer-
  owned, and the signed commit record covers them. A version-bound
  CommitCutRecordedTimePort must prove native authenticated commit evidence,
  a backend commit-before hard fence or formally equivalent attestation for
  SQLite/PostgreSQL/MySQL/MongoDB/SurrealDB; start/insert/client time is invalid.
  Clock rollback or missing
  failover/restore continuity unreadies. Zero-event domain batches reject;
  control/no-aggregate targets bind CanonicalNoDomainEventChain instead.
  Every local writer follows its declared subset of
  GlobalTransactionLockRankCatalogV1: recovery/authority guards, fences,
  quota/uniqueness, command/claim/proposal, canonically sorted payload
  lifecycle, time ratchet, aggregate/journal and commit/result/audit/outbox.
  Catalog activation fences legacy writers; static phase/adapter-trace checks
  reject reordering, reference-only/process-local keys and undeclared locks.
  Before claim acquisition, independent scoped unique constraints resolve
  command ID and idempotency ID to the same terminal or active execution;
  one-sided or cross-pair reuse conflicts even after compaction, unavailable
  history unreadies, and cancellation ends at ProposalPrepared before
  disposition publication. Remote signing requires either trusted-adapter
  authoritative reread or authenticated backend commit attestation. The
  explicit hosted-runtime profile names its trust boundary; caller-provided
  bytes, cache/replica reads and transaction-return success are not proof.
  Claim admission also preselects and cardinality-funds a bounded
  threshold/redundant signer set or root-authorized successor lineage.
  `S_claim` covers every member attempt, response-loss query, partial,
  concurrency/terminalization route and quorum import. Recovery signs only the
  identical commit, never rewrites events/results or resets capacity; without a valid successor,
  CommitReceiptSignerRecoveryRequired remains live and authority stays closed.
  Unknown/Unavailable and local exhaustion remain distinct fail-closed
  unresolved states; authenticated external seal alone assigns permanent
  unresolved meaning, and late contradiction always strengthens toward
  Fenced. Registration, cancellation, terminalization and fence anchoring have
  separate bounded response-loss lanes. The named observation-registry
  authority port must pass linearizability, failover, non-equivocation,
  key/retention, partitioning and budget conformance or the adapter refuses.
  Exact-set claim checkpoints and Stage/Verify/Commit archives preserve live,
  redeemed, outcome-unknown, confirmed-unsettled and frontier-referenced
  history; missing replay/history enters RestoreUnready. Active/terminal row
  and byte ceilings backpressure tenants before unsafe compaction.
  Staged/Verified claim-history publications reconcile Commit status before
  current multi-authority non-reference, retention and legal-hold checks may
  mark them orphan eligible. A separate non-borrowable cleanup reserve prevents
  normal claim load from starving GC. Committed or frontier-referenced history
  is permanently ineligible for orphaning.
  Contradiction before `E/J/F` publication therefore remains externally
  visible across restoration of an older local backup. Healthy `C_n/H_n` and
  fenced `E_m/J_m` archives have disjoint command/result/discriminant
  vocabularies; FenceEvidence Commit has no orphan/GC surface. The signed
  non-borrowable `B_EM` ledger escrows the full `R_first` anchor route before
  any pointer-query permit and has no pre-`1.0.0` replenishment.
- Provision recovery genesis trust from a pinned canonical root/provenance
  lineage, never caller keys or first-seen material. Deterministically build
  `P_0`, obtain an independent offline/remote quorum signature, and import its
  receipt once. Rotation preserves historical verification; irreversible
  distrust invalidates pending material, unreadies recovery and preserves any
  existing Fenced state without re-signing genesis.
- Identities never
  cross generations. A charged local fence
  precedes external traffic. BeginAbortDrain returns no seal permit unless its
  typed transaction reserves the complete non-releasable sealed-abort/
  WitnessWon-Commit/seal-query/output/drain/exhaustion/equivocation envelope.
  Lost response, failover and restore enter Unready and use only a separately
  typed AbortDrainPending Recovery-funded seal-status admission→one-shot
  process-local permit→Reconcile lane. SealWon/WitnessWon/Unknown/
  TransportFailure/DeadlineExceeded/ContradictoryEvidence close under trusted-
  time backoff, immutable terminalization reservation and exact-once
  settlement; seal retry is status-only, and unmetered restore I/O/reseal is
  forbidden. WitnessWon CASes AbortDrainPending→Witnessed and preserves
  ArchiveFinalize; SealWon waits for full drain; contradiction fences without
  rollover.
  All external outcomes enter only through Reconcile with one disposition
  ID/charge/result. The authority signs an acyclic canonical proposal that
  excludes its future receipt and Reconcile/Commit result digests; receipt,
  Reconcile and Commit add only forward references. Generated dependency-graph
  verification rejects cycles, signature inclusion and encoding/epoch
  substitution. Prepare, terminal Reconcile and ArchiveFinalize Commit remain
  three distinct hot charges/head advances. Begin/Replan reserves bounded non-
  borrowable Recovery query capacity. Stable IDs derive from guard generation
  plus admission writer sequence, adding no counter. Each admission and
  terminalization is separately charged. Admission atomically reserves the
  future terminalization charge/head advance, result/audit/outbox bytes/work
  and concurrency settlement or writes nothing and returns no permit.
  Reconcile consumes that immutable reservation with one closed outcome and
  settlement exactly once; timeout, cancellation, worker loss, Replan and
  restore cannot release, move or borrow it. Positive/permanently sealed
  negative evidence may
  co-commit the disposition; other outcomes remain read-only only for that
  disposition. Direct Commit is `3 + 2q - e`. With `s` seal queries, sealed
  abort and contradiction are `3 + 2q + 2s - e`, WitnessWon then Commit is
  `4 + 2q + 2s - e`, and typed exhaustion while fenced is
  `3 + 2q + 2s`. Exactly `q` and `s` reservations are consumed; completion
  escrow and every route charge/result remain hot. Trusted-time profile,
  uncertainty, continuity and epoch bind deadline/backoff; rollback cannot
  replenish elapsed capacity. Exhausted calls/bytes/work/time/concurrency
  permit no traffic and never imply unwitnessed. A governed tenant/lineage witness profile freezes
  predecessor CAS, non-equivocation, signatures/rotation/distrust, permanent
  seal/tombstone discovery, bounded typed seal-status reconciliation and
  positive-after-seal equivocation semantics, durability and failover. An independent precommit high-watermark witnesses the exact successor; restore establishes it through the applicable pre-reserved bounded ordinary/seal query lane first, and final witnessed
  head installation, exact captured deletion, terminal tombstone and next
  guard are atomic and leave the compaction charge hot. Begin
  creates plan generation 1 and PreparingOpen. Only independently
  authorized Replan can recover a terminally reconciled plan by fencing/
  superseding old attempts/grants/receipts and atomically creating a new
  generation/bundle/reservations; Abandon fences only and never refunds Begin.
  Every Replan repeats trusted backend-limit preflight and atomically reserves
  replacement/future-Commit plus retained-history capacity. An immutable
  cumulative lineage budget cannot reset; only authenticated checkpoint/
  archive proof compacts exact replay/anti-reuse state, and exhaustion does not
  refund.
  Every post-Begin destination admission atomically creates/joins one pessimistic,
  original-bucket budget charge; exact retry never recharges, settlement waits
  for checkpoint/archive and Recovery capacity is non-borrowable.
  Commit consumes those receipts while
  settling every leg, advancing Released to OriginalTotal and committing
  CustodyReleased with the matching parent inverse. The combined rank acquires
  residual routing head/residual state head/counter-capacity state/remediation
  attempt-set head/counter-capacity archive-high-watermark/counter-capacity
  archive-publication/counter-capacity archive-replay head/archive head/plan
  head/commit-attempt disposition/sorted remediation
  attempt/capability/evidence/authorization/reconciliation/checkpoint rows/
  publication state,
  settlement head, sorted custody profile heads/
  ledgers/reservations, parent, current slot, sorted old campaign fences,
  control/lineage/checkpoint, authorization/custody and outputs; an aggregate
  bundle maximum proves every ordinary/workspace leg, disposition receipt,
  reservation/reconciliation/GC obligation and custody-ledger write fits the
  backend transaction before ReleasePending. Explicit Begin and Commit
  lineage commands alone mutate ReleasePending/Released and persist
  action-specific results; commit rebinds the begin result, verified receipt,
  predecessor/proposed heads, dispositions/profiles/reservations/bundle/grant
  and expected version. Stage, Verify, MarkOrphan and FinalizeGc alone own
  precharged receipt transitions. Stage/Verify admit only the current
  PreparingOpen attempt and otherwise return no-write
  AttemptClosed before upload,
  verification or budget. Stage, Verify, MarkEligible, Commit, Replan, Abandon
  and orphan admission serialize on archive-head→plan-head→attempt→
  receipt-state. MarkOrphan accepts
  only Superseded/Abandoned; authorization absence/expiry/revocation is not
  permanent ineligibility. Only Commit moves CommitEligible→Consumed and
  Verified→ConsumedByCommit while installing the head with exact hot-row
  deletion and every capacity effect.
  Orphan/Collected receipts cannot commit, and readers ignore non-head
  evidence. Each retention/release
  issuer Revoke command allocates one
  monotonic signed intent/result without destination capability; destination
  Apply alone executes the full six-state table, including absent no-write and
  first-terminal observation rules. A co-located
  Recovery parent ledger atomically pairs child allocation/release with parent
  debit/credit under one deterministic transfer ID/equation, including
  completion reserves; restore verifies both sides from one snapshot and never
  guesses compensation.
  Atomic parent aggregates, exact membership commitments and predecessor
  checkpoints make admission bounded. Restore gates each affected partition
  while protected monotonic cursor/work-budget verification streams to Ready
  or Fenced; checkpoint creation reserves the complete derived snapshot cost,
  crash cannot reset work and no startup-wide scan is permitted.
  Kind-specific exact-once transfers update scope/lineage atomically. Every re-fence uses both ledgers; clearance cannot reset them,
  and exhaustion or loss of
  minimum future capacity permanently quarantines. Rebuild and custody-safe,
  no-future-operation Release are explicit terminals; release checkpoints
  before settling each original reserve leg exactly once through authenticated
  local settlement-journal and verified archive-replay heads. Every history
  path follows the shared typed fence-before-lineage lock order; adapter traces
  prove it and Release includes the Recovery parent ledger, obligation, fence,
  lineage, checkpoint and custody authority; Released requires the exact
  parent credit. Append,
  recovery and cleanup stop until a separately issued/admitted/revocable/
  expiring single-use clearance authorization and a destination-ratcheted
  mandatory-class/quorum anchor registry with authenticated collection receipt
  prove the exact activation and complete post-activation lineage. One fence-
  wide scope admits one live grant/attempt generation and preserves lifetime
  charges/tombstones. Registry advance atomically rebinds an Open scope,
  terminalizes a live stale grant with charges preserved and leaves terminal
  scopes unchanged. Source-policy weakening and permanent rebuild rejection
  each require complete destination-local admission, pre-admission/Issued
  revocation, expiry and same-transaction consumption. Their revocation intents
  bind issuer/continuity, signer/key/epoch/profile, issued-at/not-before,
  target-covering expiry, time uncertainty/profile/epoch, closed reason, nonce
  and distinct revocation idempotency; omission/substitution denies and remote
  messages confer no effect. Typed restoration algebra separates monotonic counters,
  exact ceilings, derived capacity, causal heads and consistent snapshots.
  Unprovable state stays fenced; one rebuild parent owns bounded proposals,
  independently authorized permanent rejection and one successor without
  hiding old evidence. Candidate, barrier and activation authority
  bind the exact disposition/evidence/policy epochs. NoHistory proves zero
  eligibility; NotRequested commits current retention/classification/hold/
  evidence-floor/compliance/legal/SoD authority and cannot weaken an active
  hold. Cumulative lineage limits never reset, recovery
  ceilings fit a platform hard maximum and cannot be increased through
  `1.0.0`. Recovery authorization/result payload tags are the sole action
  discriminators and any index is derived/read-verified. The shared six-state
  lifecycle returns one closed outcome including Fenced; explicit expiry is Issued-only and
  absent expiry/consumption is typed no-write NotAdmitted. One closed top-level
  conflict wrapper carries only changed-material authorization/revocation/
  recovery conflicts; CAS losers reread the state
  table, and different valid operation kinds on one exact target are not
  changed material. Recovery
  revocation is destination-local with explicit signer/key/time binding, and
  Waive/Abandon require distinct current
  policy/legal-hold/compliance authority plus canonical custody records;
  identity collisions fail closed; and coordinator-schema
  migration requires a separate stable-ID, independently authorized, budgeted
  closed lifecycle with pre-admission-revocable begin, fresh handoff and
  explicit cancellation grants, typed checkpoint/successor receipt, and atomic
  coordinator-generation/fence handoff with canonical per-action result/conflict;
- begin, handoff and cancellation revocation share one action-discriminated
  authenticated intent, exact-authorization/action sequence key and target-
  covering lifetime; only its destination-local same-row apply transaction
  commits inbox, tombstone, required bootstrap terminalization, result/audit/
  outbox, while remote emission has no effect;
- every VIT-INV-062 mutation locks and rechecks the active coordinator
  generation/fence first; a stale transaction or binary that omits the guard
  cannot commit or become ready after handoff;
  a once-per-first-seen-request rate and successful-admission/outstanding quotas,
  monotonic request sequence for every first-seen canonical request,
  separate successful issuance sequence, exact replay horizon,
  authenticated checkpoint/archive commitments, checkpoint-before-delete
  compaction, fail-closed unavailable history, key/restore ratchets, and
  storage/backlog accounting and alerts;
  issuer-authenticated complete sequence/deadline range manifests, sparse-by-
  default consumer commitments, trusted-time/deadline-gated dense consumer
  eligibility, late-presentation denial, and separate non-borrowable normal/
  recovery/break-glass identities, presentation/request rate, outstanding
  counters and reserve, exact authenticated-lane/authorized-class matching,
  with no emergency
  exemption from authorization, deadline, or replay controls;
  atomic stage-two topology-authorization success where the exact presentation
  charge evidence, request charge, layered deployment/issuer/canonical-caller
  admission/outstanding quotas, original quota claim, reservation, request and
  issuance sequences, immutable outcome, canonical receipt, idempotent result,
  and outbox commit together; denied first-seen canonical requests consume the
  already committed presentation charge and request rate but create no
  authority, while exact retries require a new presentation charge; lineage
  revoke/supersede never releases a live
  receipt; settlement decrements the original counters all-or-none and exactly
  once only after consumer-authenticated consumption/definite absence/
  permanent-unresolved state, conservative expiry, or receipt-specific
  VIT-INV-060 fencing proven by an authenticated consumer terminal receipt;
  bounded denial-request replay with exact retry identity/outcome, authenticated
  predecessor-linked request checkpoint before deletion, historical late
  requests, fail-closed missing proof, and explicit row/byte/backlog/archive/
  decode/verification-work limits;
  canonical `TopologyAuthorizationConsumerTerminalReceiptV1` binding consumer
  owner/fence, authorization/receipt/intent, closed outcome, result/tombstone/
  time, sender/key/profile, message and outbox sequences; only VIT-INV-060 has
  sender credentials and VIT-INV-061 is verify-only; a separate consumer
  disposition/evidence/receipt family represents reconciliation, and only the
  terminal receipt type is accepted for settlement;
  resource-bounded issuer range roots/chunks with encoded-byte, entry, decode-
  allocation, verification-work, proof-depth and per-job chunk ceilings,
  resumable verification cursor, and fail-closed partial-chain handling;
  profile-discriminated authorization locally
  consumed with the successor, applicable workload proof, tombstones, and fence
  outbox without cross-owner atomicity; challenge/sequence/expiry topology
  receipts and monotonic local observation ratchets; current-topology
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
