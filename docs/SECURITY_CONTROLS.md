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
  atomically redeeming one-use capability into EffectDispatched. BeginRelease
  Admit charges a
  bounded pre-Begin pool; winning Begin transfers it into the lineage budget,
  and cleanup is exact-candidate scoped under a winner mapping. Final Commit
  selects completed with/without residual custody and transfers every surviving
  terminal unknown member to its own budgeted residual obligation under a
  sorted immutable descriptor/transfer root; versioned child/budget/aggregate
  state settles atomically. Winning Begin creates explicit LineageOwned routing
  generation 1, and the generationed CAS selects lineage or residual ownership
  for all destination operations; absence never implies ownership. Begin
  creates plan generation 1 and Preparing. Only independently
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
  residual routing head/archive head/plan head/commit-attempt disposition/publication state,
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
  precharged receipt transitions. Stage/Verify admit only the current Preparing
  attempt and otherwise return no-write AttemptClosed before upload,
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
