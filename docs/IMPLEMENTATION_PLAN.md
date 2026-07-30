# Vitheim Implementation Plan

Status: complete planning baseline from `0.1.0` through `1.0.0`

This index turns the [release ladder](RELEASE_PLAN.md) into implementation
handoffs. Every milestone has its own status, setup, goal, deliverables,
verification, and exact-commit pentest stop. A milestone may be split before
implementation if one review pass becomes too broad; later work may never be
pulled into an earlier tag merely for convenience.

The canonical roadmap contains 414 exact release stops: 150 base `0.x.0`
stops, 263 companion stops, and one `1.0.0` stop. Only the limited `0.1.0`
repository/N0 scaffold is currently executable, and its release status remains
reopened. Every other capability is `Specified` until its versioned executable
owner and evidence gates pass. The authoritative claim vocabulary, cardinality
law, production-profile boundary, and protocol-specification extraction rules
are in [Evidence And Roadmap Governance](EVIDENCE_AND_ROADMAP_GOVERNANCE.md).
The [Implementation Scope Audit](IMPLEMENTATION_SCOPE_AUDIT.md) applies the
small-loop rule to every stop, assigns 65 decomposition companions to the 18
families that exceeded it, and records 109 later focused capability,
requirement-ownership, decomposition, integration, discovery, and coherence
companions.

## Universal Setup

Every version begins from a clean `main` after the previous version's permanent
pentest report and tag. Before code changes, update the latest stable Rust and
verification tools, review current official specifications and practices,
define crate/layer boundaries and input budgets, draft threat-model and attack-
surface deltas, write tests first where practical, and create draft release
notes and pentest scope.

All crates remain private, dependency direction points inward, Rust files stay
under 500 lines, and third-party Cargo code remains forbidden unless a separate
explicit policy decision changes that rule. Unavailable safe hosted technology
blocks its milestone rather than causing an improvised protocol implementation.
Before the first line of any hosted adapter or protocol implementation, that
milestone must approve a version-bound implementation-admission record covering
the exact dependency/runtime, maintenance, license, unsafe/native code, protocol
profile, trust boundary, replacement port, and rejection alternatives. The
admission record is not a dependency-policy exception and cannot authorize
third-party Cargo code. Under the current repository-wide prohibition, a hosted
profile needing any external Cargo dependency remains blocked even after its
record is complete. Only a separate explicit owner-approved policy change can
allow such code; until then N0, N1, and Hosted all remain dependency-free.
If that policy ever changes, N0/N1 still remain absolutely dependency-free,
Hosted code may use only exact reviewed allowlisted dependencies behind
project-owned ports, and third-party types can never cross inward-facing APIs.
The
`0.140.x` decisions revalidate and freeze production support from those records;
they are never the first technology selection.
`0.18.16` makes the selected owner-policy option operational before affected
Hosted work: repository-wide zero dependencies remain binding, so each
capability is backed by an audited dependency-free project implementation or
remains explicitly unsupported/deferred. It grants no exception. Any future
policy amendment requires its own owner-approved exact roadmap decision before
adapter work, while `0.140.14` remains final revalidation rather than first
resolution. `0.140.28` is the mandatory Hosted production go/no-go: if safe
dependency-free TLS/crypto, storage, identity/session, hostile-input handling,
packaging, operations, and recovery evidence is incomplete, a Hosted `1.0.0`
claim remains blocked rather than silently shrinking its meaning.
Every user-facing capability is API-first: API contract/application/transport
crates remain separate from UI composition/rendering crates, and the first-
party UI has no privileged command, repository, or database path.
Every domain milestone delivers its headless application commands, policy-
filtered reads, and project-owned internal DTOs before its UI or external
adapter can exit. External API/SDK stops expose and freeze those contracts; they
never introduce the domain application service for the first time.
From `0.30.23`, each domain has one stable `DomainManifest` keyed by dedicated
`DomainId`, owning crate, requirement set, exact aggregate/stream, command,
event, compatibility/upcaster-owner, application-read, and applicable
projector/process-manager references, classifications, and typed extension
references. It never embeds another registry's semantics. `0.30.24` resolves
references to exact authoritative IDs and atomically admits complete compatible
metadata generations while keeping compiled catalog, deployment profile, tenant
feature, and signed plugin-installation scopes separate; metadata admission
never enables runtime availability or authority. Every contribution kind owns
its registry/lifecycle binding, certification owner, generated tests, and
canonical/schema, fuzz, budget, concurrency/replay, evidence, migration,
failure/recovery and timing/count/metadata-leakage dimensions; omission fails,
while inapplicability requires a reviewed typed `NotApplicable`. `0.30.25`
governs bounded deferrals and product-state effects, but code/data/routing/
schema that already exists can
never defer structural ownership, policy, lifecycle, deletion/rebuild, or
reconciliation registration. `0.30.26` backfills current domain-event ownership
and installs a prospective compatibility gate; `0.30.27` does the same for
outbox effects, messages/consumers, timers/activities, poison/dead-letter,
replay/quarantine, result/reconciliation, and compensation contracts after the
complete `0.18.8–0.18.10` realization family. `0.30.28` defines permanent-ID,
fenced, dependency-draining, history-preserving domain retirement at
introduction with orthogonal authority/work/data/history evidence and distinct
verified/loss/blocking terminals. `0.30.29` separately owns exact tenant-child
retirement proposal authority, atomic audit/outbox commitment, cancellation and
crash recovery. After authoritative tenant lifecycle exists, `0.51.5` freezes
and safely releases one authenticated deployment membership cut, `0.51.6`
admits one separately approved exact-cut plan, `0.51.7` fences successor-plan
lineage and resume authority, `0.51.8` transfers broad topology fencing to a
narrow domain guard with authoritative post-cut handoffs, `0.51.9` joins the
successor head to one canonical protection root, `0.51.10` aggregates every
terminal child honestly, `0.51.11` transfers non-clean obligations through
tenant-local handoffs, `0.51.12` owns residual state evolution, `0.51.13`
proves partition currency and canonical empty state, `0.51.14` owns urgent
restrictive invalidation, `0.51.15–0.51.18` authorize/complete takeover,
atomically fund retained candidate controls, and release its barriers,
`0.51.19–0.51.20` archive cleanup and verify retained namespaces, and
`0.51.21–0.51.48` evaluate reinstall, linearize activation against abort,
obtain source-partition admission, fund durable bridge ownership, terminate or
supersede partial admission, decide and conditionally implement conservative
permanent-unknown quarantine recovery, actively enforce the maximal unknown
restriction over a generated complete operation universe, run one finite
cumulative-budget replacement-evaluation lineage with permanently terminal
exhaustion, evaluate/admit lowering under separate non-substitutable authority,
create exactly one fresh proof-bound successor from a closed top-or-lowered
tag, carry either branch through one tagged admission/ownership pipeline,
adopt every prepared lowered bridge without duplication through closed receipt/
root variants and the shared lifecycle CAS, use distinct guard-slot/candidate/
successor generations for commit-fresh tagged final activation without
re-consuming replacement eligibility, route every final mismatch through the
sole typed shared-lifecycle revalidation edge, consume
the completely admitted successor, release both candidate-control families,
lower an operational guard only through a commit-fresh prepared CAS, and
release the old top only through expected-version absorbing member outcomes,
canonical heterogeneous per-member version-vector folds, coalesced bounded
pending observations with reserved terminal capacity, and zero-pending
authenticated funded reconciliation. The final release-member refinements
derive policy-bound budgets and worst-case funding, construct and seal the
complete immutable member/genesis roots in bounded authority-inert batches,
bind them through a bounded guard CAS, keep source/destination effects local
and fold their receipts through a parent inbox, define exact ceiling
arithmetic, and place retry charges in a separate versioned non-resetting
ledger. The final four stops source-fence one distributed predecessor
inventory cut, select one parent effect intent, require activation-bound
one-shot local effect authority, and keep contradictory physical effects
nonterminal until funded conservation settles every owner. Dispatch remains
closed until construction, inventory, authorization and continuity contracts
are certified.
`0.145.4`
destructively certifies
selected retirement/reinstall profiles rather than first implementing teardown.
Tenant lifecycle references begin only
after `0.51.2`, with immediate backfill certification at `0.51.4`;
authorization follows Phase F, workflow Phase G, search Phase J, workspace its
block vocabulary, and API/transfer their Phase N contracts. Each surface stop
defines and backfills its typed extension, then a separate stop certifies it.
Late certification cannot add missing domain behavior, and no Supported/RC/
`1.0.0` profile may carry an unresolved required deferral.
Optional federation, AI, vendor-connector, plugin-storefront, and semantic-index
crates depend inward on stable ports. The kernel and first-party domains must
build, test, and operate without any optional product family.
Vitheim operational telemetry and customer-service measurements are distinct
planes. All fact-bearing domains reuse the shared N1 provenance, correction,
confidence, and four-clock vocabulary rather than creating local substitutes.
Semantic index storage and embedding generation are independently replaceable
and independently admitted.
From `0.18.14`, every normative functional, security, operational, migration,
support, and verification requirement also has one stable `VIT-REQ-*` entry
with exactly one primary implementation stop, predecessors, producing and
consuming crates, schema/migration owner, primary test owner, later integration/
retest stops, lifecycle, and planned/implemented/superseded/deferred status.
`0.20.5` and `0.30.18–0.30.21` backfill the complete current roadmap before
Phase D begins. Thereafter a requirement cannot exit its introducing stop until
the bidirectional registry checker proves it is neither omitted nor multiply
owned. Requirement ownership complements invariant/law authority ownership; it
does not create a second authority or allow prose to override either registry.
`0.18.15` then makes source coverage prospective: each normative block has a
stable adjacent marker or structured-manifest origin, canonical content digest,
and supersession lineage. The checker detects newly added normative language,
not merely drift in registry rows it already knows.
Authority-bearing invariants are indexed by stable IDs in
[Invariant Ownership Registry](INVARIANT_OWNERSHIP.md). From `0.18.3` onward,
every invariant must have an introducing milestone declaration, exactly one
ownership row, one lifecycle/supersession row, an owner-maintained guard,
transaction placement, and stable enforcement/capability/test/recovery/fence
contract IDs before its milestone may exit. Bidirectional checks derive coverage
from declarations across every implementation document rather than a static
expected count. Cross-owner guarantees use declared, lifecycle-governed
`VIT-LAW-*` records with one proof coordinator, explicit contributors, local
linearization points, fail-closed state, versioned dependency/recovery contracts,
and end-to-end recovery; they never invent a shared owner. Every enforcement
point explicitly binds a stable semantic child ID to its negative test and
active/retired status; textual order has no authority. Phase
prose supplies context but cannot establish a second owner; storage profiles,
concrete tests, recovery manifests, owner transfers, mixed-version behavior,
and rollback floors must resolve the stable contracts instead of relying on
prose. Supersession is acyclic and version ordered.
The [Composite Security Law Generations](LAW_GENERATIONS.md) registry is the
canonical historical law contract: each generation binds its effective
milestone, predecessor, coordinator, exact dependency delta, linearization/
failure/recovery semantics, mixed-version intersection, activation fence,
migration, rollback, dependency contract, and recovery contract. A later root
cannot be inserted into an earlier law generation. The ownership registry is
only the latest resolved view. Each row materializes the canonical
[Law Generation Manifest](LAW_GENERATION_MANIFEST.md), including resolved
dependencies, a semantic contract, and a content digest verified by storage and
recovery tooling. A later generation needs a meaningful dependency,
coordinator, or semantic delta; removal-only and semantics-only evolution is
valid. Digest self-consistency never grants authority: startup, storage,
migration, import, restore, failover, and recovery admit only exact
`(LawId, Generation, Digest)` tuples in the independently trusted
[Law Manifest Admission Set](LAW_MANIFEST_ADMISSIONS.md), whose compiled or
platform-law-signed catalog identity, epoch, digest, and trust profile are
bound into checkpoints, backups, and release evidence. Database access alone
cannot extend this set. That registry is a planning superset only. Runtime uses
the immutable milestone-scoped payloads and fully content-bound envelopes in
[Active Law Catalogs](LAW_ACTIVE_CATALOGS.md): each exact
`CompiledCatalog` or `SignedCatalog` contains complete effective ancestry, no
future tuple, and an activation-floor fence; it remains applicable until the
global owner explicitly activates a verified successor. `VIT-INV-057` owns only
that global lineage, expected-version activation, succession, revocation,
emergency distrust, and epoch/digest. Independent `VIT-INV-058` local owners
are exact enforcement-partition placement generations and hold identity fence,
catalog/distrust/trusted-time ratchets. `VIT-LAW-007` composes both with
platform safety-floor, dispatch, and transmission-start roots.
`VIT-INV-059`/`VIT-LAW-008` add a separate durable rollout process manager:
immutable topology/placement manifests, irreversible `ActivationAuthorized`
with atomic authorization receipt/outbox and pinned generation, closed
converge/complete/block/revoke/abandon/supersede states, transactional delivery,
and authenticated identity/fence-bound receipts without a distributed
transaction. `0.18.3` permits only the compiled immutable single-placement
topology. At `0.141.0`, epoch 13 activates/converges under generation 1/static
authority; after every local generation-2 admission, generation 2 initializes/
verifies the exact dormant singleton and commits the handoff that makes
independent `VIT-INV-060` current. The two topology sources are never co-
authoritative. `VIT-LAW-007@g02` then makes current topology an independent
local admission, readiness, dispatch, and transmission-start gate even after
rollout completion or missing fence delivery. Every topology handoff/mutation
uses a short immutable authorization independently issued by `VIT-INV-061`
after current authority/quorum validation; changes before issuance deny and
changes after issuance block new grants while the exact grant remains usable
only until fixed `commit_before`. `0.140.1` freezes concrete class ceilings
(five minutes for initialization, two minutes for commit/dynamic successors,
and at most sixty seconds for break-glass) and a shared conservative trusted-
time vocabulary. The authenticated grant carries issued-at/deadline,
uncertainty, time-profile epoch, and issuer continuity; issuance and consumption
fail closed on unavailable or discontinuous time. VIT-INV-060 ratchets its own
trusted lower bound/continuity and consumes only when its interval proves the
CAS will commit before expiry through a backend-enforced
`DeadlineConditionalTopologyCasV1`, so rollback, suspend, restore, failover, or
clock disagreement cannot lengthen authority. `0.21.0` freezes canonical
`TopologyMutationAuthorizationReceiptV1` storage and the deadline-CAS port;
`0.22.0–0.27.0` prove every backend pause/failover outcome; `0.29.0–0.30.0`
prevent migration/export field loss; and `0.140.2` admits only a concrete
commit-time predicate or hard no-late-commit fence. Client timeouts are never
deadline authority. The same versions freeze and prove bounded authorization
anti-replay. Separate non-borrowable `Normal`, `Recovery`, and `BreakGlass`
accept queues, sockets/file descriptors, TLS workers, decode CPU/memory,
executor queues, and pools sit under an aggregate fail-safe ceiling; a
server-controlled listener/TLS route selects only an ingress lane and grants no
authority. VIT-INV-061 exclusively owns the versioned presentation-lane
mapping lineage, and emergency promotion requires separated requestor,
approver, and activator roles. Bounded ingress bytes/concurrency/cryptographic/
decode work precedes a two-stage authenticated presentation protocol. Stage one
durably charges every canonical presentation before protected idempotency
lookup and emits bounded internal single-use evidence bound to request/caller,
ingress/presentation lane, mapping identity/generation/fence/profile digest,
budget epoch/sequence, and continuity. Stage two consumes that evidence,
rechecks the current mapping generation, and then performs the first-seen
request/outcome/issuance transaction. Changed mapping, crash, or fenced
continuity never refunds or reuses the stage-one charge; retry obtains a new
charge and no logical request exists unless stage two commits. Stage one
atomically couples debit, evidence, sequence, and awaiting disposition or fails
before lookup on ledger saturation. The closed disposition table has four
irreversible terminal kinds—consumed, mapping changed, controlled abort, and
continuity-fenced orphan—and checkpointed compaction preserves the original
kind/result commitment.
`TopologyAuthorizationPresentationChargeLedgerCapacityV1` partitions hot rows,
bytes, awaiting records, checkpoint backlog, checkpoint/archive I/O, and
compaction workers into non-borrowable Normal/Recovery/BreakGlass capacity
below aggregate disk/work ceilings. Stage-one admission reserves its own
lane's terminalization and checkpoint work; Normal or break-glass saturation
cannot block Recovery, and an incapable adapter refuses VIT-CAP-061.
An immutable VIT-INV-061-owned capacity-profile lineage controls those limits
by stable ID, monotonic generation/epoch, canonical digest, predecessor and
expected-version activation. Shrinks remain pending until current usage,
awaiting charges, lifecycle reservations, backlog and protected reserves fit;
capacity cannot move between lanes, increases require authenticated physical
provisioning evidence, and restore selects the greatest authenticated profile
generation rather than the largest numeric ceilings. Pending shrink installs a
durable lane-scoped drain fence. New stage-one work must satisfy both active
and successor limits or receive a typed pre-debit draining denial, while
existing reservations continue to terminalization/checkpoint. Activation or
authorized rejection atomically rechecks and consumes the exact fence;
failover/restore cannot lose or bypass it, and Normal/BreakGlass draining never
blocks Recovery. Every canonical reduction must pass through PendingDrain;
unknown/incomparable schemas drain conservatively. Aggregate reductions derive
all capable consumer lanes and enforce successor lane plus aggregate limits
under fixed row locking. Recovery selects active state from committed
activation records, restores pending/fence state and high-watermarks
separately, and exposes no independent fence install/clear command. Drain entry
itself is authorized for every lane and aggregate with exact scope/action/diff/
policy/approval/SoD/expiry/nonce/idempotency and trusted-time/signer/key
bindings. A closed Issued/Consumed/ExpiredUnused/RevokedUnused lifecycle
atomically persists the replay tombstone, canonical action result, mutation,
event, audit and outbox; exact response-loss retries recover that result while
changed request bytes/digest/action conflict. Activation uses fresh current
authority while historically authenticating the consumed begin-drain proof;
rejection/abandonment is separately authorized and audited.
Canonical non-wrapping predecessor-linked activation records commit with head/
supersession/fence/audit/result/outbox and checkpoint before deletion; gaps,
forks, reorder, duplicates or rollback deny recovery. Checkpoints also preserve
authorization consumption/result/time/key high-watermarks, validation evidence
and replay tombstones. Select bounded authenticated sparse replay archives;
permanent unbounded retention and arbitrary-ID dense watermark inference are
forbidden. Capacity recovery additionally freezes both settlement heads, both
non-wrapping predecessor/sequence chains and their authenticated coverage,
root/key/publication/cursor, exact covered/current hot-row IDs/versions/ranges,
settlement/trigger/ordered-bundle/result identity, attempt-checkpoint linkage,
exact settled and remaining leg sets, and conservative original-bucket
balances. Missing fields deny. Singular-head state was never an admitted
Vitheim schema and is quarantined before authority mutation; the current
roadmap provides no split migration or genesis inference.
Every `0.29.0–0.30.0` migration/import uses one durable
`MigrationImportWorkBudgetV1` bound to its job/material, tenant/deployment,
source/destination, schema/manifest, authenticated initiator, immutable budget
profile and fenced owner. Operation-wide byte/object/cryptographic-work/
temporary-staging/stream/retry/time/cleanup/concurrency counters are monotonic
across crash, cursor recreation, failover and adapter retry. Creation reserves
staging, verification, result/checkpoint, rollback/quarantine cleanup and
protected Recovery capacity; each bounded quantum is precharged before work.
Typed exhaustion leaves the source unchanged and destination unready, enters
bounded resumable cleanup, and stores only bounded metadata/digests in
quarantine.
The same milestones declare `VIT-INV-062 MigrationImportJobAuthorityState` for
operation uniqueness, budget/reservations, closed job/fence/candidate/
authorization/barrier/result/cleanup control state and `VIT-LAW-009
AtomicMigrationImportActivation` for the exact domain-owner commit. Trusted code
derives `MigrationImportOwnerManifestV1` from source/destination schema
manifests, migration-plan digest, the currently admitted destination
VIT-LAW-009 tuple/manifest, its authenticated dependency set and the versioned
contributor algorithm. That law dependency closure is the only owner universe;
no separate runtime invariant catalog exists, and importer input cannot select
or omit owners. The manifest types VIT-INV-062 as the one live destination
coordinator and every other applicable dependency as an importable domain
contributor. The coordinator participates in the proof and lock order, but its
live control rows never enter the staged candidate or a dormant imported
generation. `MigrationImportAdmissionCandidateV1`
binds that manifest, final counters, staged root, expected owner versions/
epochs and dormant generations, lease/fence, independently issued activation
authorization and idempotency digest. Each existing owner authenticates only
its dormant generation through an owner-held capability; VIT-INV-062 has
verify-only access. `MigrationImportActivationAuthorizationV1` is
candidate-specific. `AdmitMigrationImportActivationAuthorization` is its only
Absent-to-Issued path; the closed lifecycle also includes
RevokedBeforeAdmission, Consumed, ExpiredUnused and RevokedUnused; admission
after target expiry records ExpiredUnused rather than Issued. Revocation
requires authenticated `MigrationImportActivationRevocationIntentV1` delivery
and one destination-local shared-row commit. When the row is absent it creates
a permanent authorization-digest/candidate-bound RevokedBeforeAdmission
tombstone that later admission must join. The issuer sequence is scoped to that
exact authorization lineage, the
intent cannot expire before its target authorization, remote emission alone
has no effect, and late revocation after Consumed returns the activation result
without reversal. One `MigrationImportActivationBarrierV1`
binds the complete receipt set and current job/owner state. Through `1.0.0`, one co-located local transaction
uses the canonical
deployment-retirement-fence→active-coordinator-generation→job→candidate/barrier→authorization→ordered-domain-owner→control-settlement-archive-head→control-settlement-journal-head→recovery-capacity-parent-ledger→backend-storage-cost-active-recost-campaign-slot→backend-storage-cost-recost-campaign-fence→corruption-control-reserve→history-obligation→corruption-fence→corruption-control-lineage→corruption-control-lineage-checkpoint→lineage-disposition→recovery-authorization→clearance-anchor-source-manifest-head→clearance-anchor-source-manifest-authorization→corruption-clearance-anchor-registry→corruption-clearance-scope→corruption-clearance-authorization→corruption-clearance-attempt→corruption-rebuild→corruption-rebuild-rejection-authorization→archive-head→history/idempotency→recovery-lineage-budget→attempt/successor-budget→retention/legal-hold→audit/result/outbox
order, rederives the manifest, rechecks the `AdmissionPrepared` job, budget/fence,
authorization lifecycle, receipts and all domain-owner versions, consumes and
tombstones authorization, then activates every domain owner plus barrier/job result/
history obligation/lineage disposition/audit/outbox, or none. Exactly one
bounded Pending plus zero-counter lineage, cryptographic NoHistory zero-
eligibility proof, or custody-governed NotRequested record, co-commits; cleanup cannot remove its
descriptors until a terminal append checkpoint. Pre-activation rejection,
exhaustion, cancellation or
quarantine permanently fences the candidate; post-activation cleanup touches
only staging. VIT-INV-062 coordinates security-control completeness but never
domain authority. Cross-backend import refuses nonterminal source jobs; imports
terminal VIT-INV-062 history only after activation into an inert archival
namespace; and returns a typed conflict for job/operation/authorization/
candidate/barrier identity collisions. VIT-INV-062 schema succession uses a
separate stable-ID, independently authorized and budgeted closed lifecycle for
predecessor drain, checkpoint, dormant local successor and atomic coordinator-
generation/fence handoff, with canonical result/conflict recovery, never the
candidate it coordinates. A pre-admission-revocable begin grant is consumed
when the drain installs; a distinct fresh checkpoint/verification-bound handoff
grant authorizes commit; and a third action-bound grant authorizes canonical
idempotent cancellation. Authority loss releases the drain and advances the
fence instead of stranding the bootstrap. One action-discriminated revocation
intent/apply protocol binds the exact grant/action, issuer continuity, target
lifetime and target-scoped sequence; only its destination-local inbox/
tombstone/bootstrap-result transaction has effect. Every VIT-INV-062 mutation rechecks that generation
first, so old predecessor work cannot commit after handoff. History append has
its own authenticated scope/provenance/manifests/terminal-result, sequence,
idempotency, retention, bounded budget, cleanup reserve and durable disposition;
its collision or failure cannot alter the activation result. The activation-
atomic obligation and archive head make missing work distinguishable from
NoHistory/NotRequested. Exhaustion retains nonterminal ManualRecoveryPending
and its descriptors. RetryAppend reaches only Appended or
ManualRecoveryPending; successor exhaustion produces typed evidence, not
abandonment. Every fresh action requires independent authority, while one
cumulative obligation-lineage budget prevents work/time/attempt/byte/successor
counter reset. Activation creates it with zero counters beside every Pending
obligation; each initial append precharge atomically advances its attempt and
cumulative rows. NoHistory proves authenticated zero eligibility; NotRequested commits a
current retention/classification/legal-hold/evidence-floor/compliance/legal/SoD
record in the activation transaction and active-hold weakening denies. Missing
nonterminal lineage commits an obligation-scoped corruption fence/result before
return; append, recovery and cleanup stop. Activation creates every fence as
Healthy generation zero, absence fails closed and all history paths use one
fence-before-budget order. A separately authorized manifest-lineage bootstrap
creates exactly one generation zero before activation. Governed publication-
profile lineage fixes the exact witness/source set, quorum, authentication and
time policy; a non-recursive provisioned/compiled trust anchor, explicit
bootstrap/rotation/checkpoint/high-watermark operations, compatibility
decision and monotonic distrust ratchet govern succession. Profile transition,
distrust and manifest activation serialize through a governance-root external
CAS activation-fence port, producing one durable winner across response loss
with authenticated request/receipt/status, consensus assumptions and
fork/rollback finality; independent signatures are insufficient. CAS and
status reads are linearizable, request IDs bind one digest, final results are
immutable and compaction retains authenticated request-result membership.
Profiles are tenant/deployment scoped with one exact nonterminal attempt slot.
Root loss or full compromise has no in-place `1.0.0` recovery: an independent
retirement authority records Pending→Retired/EvidenceUnavailable without the
lost root. EvidenceUnavailable permits empty new-identity bootstrap but
permanently quarantines old custody; the replacement inherits no profile/
fence/slot/ratchet/high-watermark/authority state. Activate/Abort/
PermanentlyUnresolved terminal meanings use the same governance sequence and
one per-transition CAS, never an independently writable journal. Its identity/
generation/digest is bound into authorization, checkpoint, requests/receipts,
activation record and heads. Every transition
moves through Prepared, ProposalPublishedVerified, LocalActivationCommitted and
Active, with Aborted/PermanentlyUnresolved terminals. Proposal and active-
manifest high-watermarks are distinct: proposal publication never claims
activation, the local head CAS precedes an externally witnessed activation
receipt, and timeouts reconcile stable per-witness request identities. Restore
derives latest only from the greatest externally Activated journal entry under
the profile that governed it. Finalization rechecks the current profile head,
MayActivateExisting/TerminalizationOnly/EmergencyDistrust decision and ratchet;
the latter two win the activation fence and force authenticated abort without
changing operational state; an activation that already won that fence is
immutable and later distrust applies only as a successor decision.
Every attempt reserves non-borrowable witness/reconciliation/terminal-result/
audit/outbox/checkpoint capacity before first publication. A locally consistent older snapshot, missing
external lifecycle proof or operational-active head below the active watermark returns typed
`ManifestHistoryUnavailableOrRolledBack` and leaves the deployment unready.
An unresolved greater proposal blocks its own activation, descendants and
cleanup but cannot displace or poison the last proved Active predecessor.
Separate operational-active and transition-candidate heads make that rule
structural: only the operational head equals externally Activated evidence.
PermanentlyUnresolved requires an authenticated external terminal seal;
timeout, retry exhaustion or witness absence only retains reconciliation state.
Activation binds that witnessed head, creates registry generation zero and
reserves non-borrowable Recovery capacity for fence/scope/terminal/result/
audit/outbox state from a trusted profile/platform bound. Activation also
creates one obligation-wide corruption-control lineage over that original
reserve. One typed lifetime-work budget conserves available, episode-reserved,
terminalization-reserved and nondecreasing spent proof/retry/hash/signature/
bytes-processed/time. A separate physical-capacity ledger conserves reserved-
unoccupied, occupied, reclaim-pending and released rows/bytes-stored/audit/
outbox capacity; verified archive plus exact deletion alone releases it.
Signed backend storage-cost profiles conservatively charge destination
artifacts by backend/schema/index generation using checked rational ceiling
arithmetic and canonical boundary/golden vectors. Their independently rooted
lineage/head/high-watermark, complete-domain weakening classifier, destructive
authorization and complete re-cost checkpoint govern backend/schema activation.
The classifier is a bounded closed-form rounded-affine proof with explicit
format/proof/work maxima. Only ValidWeakening is authorizable;
InvalidOrUnverifiable is terminal no-write. Large child sets use an epoch-cut
re-cost campaign with one parent/selector active slot, a total state/recovery-
intent table, fixed pre-cut snapshot and bounded authenticated post-cut fold/
tail. Parent conservation includes active, campaign RecostPending, pending-
successor and workspace aggregates; every application moves equal amounts
between the middle two, while workspace reservation/settlement uses stable
parent transfer/inverse identities. A pre-reservation release settles only
active charge and tombstones the snapshot member; later cases settle
RecostPending or pending successor, and the reservation binds the folded-log
cut. The closed campaign+mutation-fence product returns preflight-origin
recovery to bounded Preflighting work, never an unbounded transaction.
Activation/abort/one-shot-authorized quarantine share one terminal CAS/
checkpoint that alone releases the slot. Final activation
consumes current authority and requires a Verified campaign-owned workspace
whose checkpoint binds the same exact closed logical/physical cut. Its state/
cursor/physical high-watermark/source ledger covers build, catch-up, bounded
post-slot cleanup, quarantine and deletion-proved exact-once inverse settlement.
Immutable OriginalTotal, monotonic Released and exact complete-leg tombstones
derive the remaining parent member; settlement moves each live leg to Released
and credits the identical parent quantity without rewriting a current total.
The named settlement checkpoint binds the old terminal campaign fence and
parent credit. A durable cleanup admission lane/contention budget forces
bounded progress and hard terminal-workspace backlog maxima. Permanent
deletion uncertainty enters bounded CleanupReconciling and can move into a
precharged PermanentlyRetained pool only under independent SoD authority,
without parent credit or activation/abort-result mutation. A closed cleanup
origin/reference makes activated and aborted work symmetric and resume only
their matching pending state. Retention and lineage BeginRelease/
ReplanCustodyRelease/AbandonCustodyRelease/CommitCustodyRelease have complete
six-state destination-applied authorization
families. Whole-member custody
release later consumes one closed disposition per remaining leg:
AuthenticatedDeleted proves exact storage generation/root deletion,
TransferredToCustodyLedger requires Begin to move a cost-profile-derived
maximum into TransferPending before external work. Commit converts it into the
conservatively calculated archive/legal-hold custody member before exact source
credit; unlike dimensions share a transfer identity, not numeric equality.
Unknown preserves predecessor and pending charge until typed definitely-never-
transferred or exact-destination-deleted reconciliation. Reservations pin the
existing governed profile generation/evaluator; live dependencies retain it
and drain incompatible/weakening successors, while weakening remains
destructively authorized. Adapter streaming limits and atomic bounded extension
ensure capacity commits before any extra bytes or finalization. Transfer state
is Open→SealPending→Sealed; only Open mutates, unknown seal reconciles without
guessing and reopens only with permanent never-completed provider proof; exact
provider-fenced Sealed binds immutable object/root/size/
ETag/version before eligibility. Evaluator
binary/corpus digests and node readiness are required; emergency distrust
blocks transfer/extension/eligibility/Commit until independent migration
preserves at least the existing maximum. Reassessment never clamps corrected
charge to the plan maximum: a protected emergency reserve covers positive
deficit or readiness fences until separately authorized remediation.
EffectiveCharge joins base plus covered deficit and final Commit atomically
settles both into one member. Remediation and unknown resolution receive full
destination-applied authorization/revocation families. Remediation actions map
totally to one continuation; Begin consumes execution authority before
dispatch, Complete never redispatches and fresh finalization authority owns
later deletion release/permanent retention. Broker-only Dispatch is the
current legal/hold/policy cut and atomically rechecks all destructive-effect
epochs while redeeming one capability into EffectDispatched. A governed
provider-effect profile/result freezes dedup/query horizons and authenticated
definitely-no-effect semantics. Dispatch persists one application-level
transmission claim as a VIT-INV-006 realization. Only the winning executor
receives one unreconstructable process-local permit; durable row/digest/status
is never bearer authority and retries cannot return a permit. Only transport
retransmission inside that uninterrupted invocation is allowed, and any
returned/crashed/uncertain claim becomes query-only. Permanent Unknown
is independently
converted at full charge into a fenced member with retained legal-hold
evidence and no late-evidence refund. Platform/tenant ceilings and a separate
authorization family govern confirm-present, verified complete-namespace
deletion or permanent-unresolvable successors without quarantine rewrite.
BeginRelease admission uses a bounded pre-Begin pool whose exact winning
charge transfers atomically into the newly created lineage budget; cleanup
requires terminal authorization, exact candidate non-reference and different-
winner mapping. Final Commit selects With/WithoutResidualCustody and transfers
each surviving unknown member into its own budgeted obligation under a sorted
immutable descriptor/transfer root; mutable child/budget/aggregate states
advance separately and atomically with one externally checkpointed cumulative
anti-rollback state head. Winning Begin explicitly creates
LineageOwned routing generation 1 with the new plan/budget—absence is never an
owner—and an explicit NoneCanonicalEmpty aggregate reference; the generationed
head linearizes authorization/resolution/checkpoint/
GC ownership. MarkEligible/final Commit bind one complete remediation-attempt
set and refuse every nonterminal effect/capability/reconciliation obligation;
every authorization/effect/capability/evidence/reconciliation/archive writer
advances that set atomically under one order. A later mutation places the
authoritative attempt in typed PreparingRevalidationRequired with mandatory
invalidation/root bindings; PreparingOpen alone admits new effect/artifact
work, and the separate fence is evidence rather than authority. Each further
covered mutation while Required CAS-advances a non-wrapping epoch/sequence,
previous/current root, latest mutation and cumulative commitment with immutable
advance evidence. Full MarkEligible revalidation verifies the chain or
checkpointed prefix plus suffix and binds its terminal root without blocking
restrictive work admitted by the proven lifetime bound. Begin/Replan proves
overflow-safe headroom across fixed `u128` attempt-set/revalidation/canonical
capacity-checkpoint/capacity-replay-head counters plus capacity-archive guard
generation, reserving each terminal value
solely for an absorbing exhaustion fence. The archive sequences form one pair
with one pair sentinel and advance together only on successful capacity-
archive Commit (`ArchiveFinalize`), never FinalizeGc.
Insufficient headroom denies before external work; unexpected exhaustion
permanently unreadies the owner without inventing a mutation. A lineage-wide
capacity state owns class-specific admitted/consumed/reserved/remaining counts
with `admitted = consumed + reserved + remaining`, total
head writes, revalidation advances/rollovers, sentinel reservation and current
counter tuple. Admission atomically moves remaining→reserved before any
permit. Terminal selection moves selected legs reserved→consumed and unused
mutually exclusive legs reserved→remaining with the result/event/audit/outbox;
retry, CAS loss, timeout and failover move nothing. Reservation IDs,
quantities and settlements remain integrity-committed across Replan,
checkpoint/archive and restore. Every writer locks it before the attempt-set head and atomically
consumes one immutable exact-retry charge with mutation/head/result. Every
ordinary writer then locks/reads the stable high-watermark guard and denies
PreparePending/AbortDrainPending/Witnessed; it may omit unrelated later rows, while archive
writers continue through publication before replay head. Every acquired subset
preserves relative canonical order. Replan and history lifecycle preserve
consumption. A dedicated capacity checkpoint binds
the exact archived charge set, result lookup, all capacity/sentinel equations
and publication/key/encoding epochs; its predecessor-linked archive-replay head
plus hot suffix is the only authoritative lookup. Same-material retry returns
the historical result, changed material conflicts, and missing archive evidence
fails closed without charging or advancing a head. A dedicated immutable
manifest, proof budget, cursor and closed Staged/Verified/Consumed-or-Orphan/
Collected receipt machine own publication. A generationed guard moves
Unprepared(`g`)→PreparePending(`g`)→Witnessed(`g`)→Committed(`g`) or
PreparePending(`g`)→AbortDrainPending(`g`)→
AbortedDefinitelyUnwitnessed(`g`) or AbortDrainPending(`g`)→Witnessed(`g`)→
Committed(`g`) when the authority reports WitnessWon. Commit/abort atomically retain the old tombstone and install
Unprepared(`g + 1`); replay installation and captured deletion cannot split
from Commit rollover. Prepare returns the only process-local non-bearer
submission permit. Only after the winning Prepare commit may it submit; every
other state, stale generation, uncertainty and retry is query-only. Unknown witness state
never reopens. Every
external result enters only through Reconcile under one stable disposition
ID/charge/result. An acyclic canonical proposal excludes future signature/
receipt and Reconcile/Commit result digests; the receipt binds the signed
proposal, Reconcile binds proposal+receipt and Commit binds proposal+receipt+
Reconcile. Generated dependency-graph checks reject cycles and encoding/epoch
substitution. Prepare, terminal Reconcile and ArchiveFinalize Commit are three
distinct hot charges/head advances. A Recovery-funded query budget derives
stable IDs from the bounded admission writer sequence. Admission and
terminalization are separate charges. Admission atomically reserves immutable
capacity for its future terminalization charge/head advance, result/audit/
outbox bytes/work and concurrency settlement or writes nothing and returns no
permit. Reconcile consumes the reservation exactly once with one closed
outcome and settlement. Timeout, cancellation, worker loss, Replan and restore
cannot release, move or borrow it; exactly `q` reservations are created and
consumed, yielding direct-Witnessed-route `3 + 2q - e`. Unknown is read-only only for
the witness disposition. Trusted-time profile/uncertainty/continuity/epoch
binds deadline/backoff, and rollback cannot replenish capacity. Exhaustion
never implies unwitnessed. A governed tenant/lineage witness profile freezes predecessor
CAS, non-equivocation, signature/rotation/distrust, permanent proposal-seal
evidence, durability and failover. Abort enters AbortDrainPending, denies new
queries and uses one non-bearer seal claim to invoke
`SealCapacityArchiveWitnessProposalDefinitelyUnwitnessed`. The authority
serializes seal and submission by expected-predecessor/proposal CAS, durably
tombstones rejection, rejects late submissions and exposes an independently
discoverable receipt. Only after that receipt, every query reservation and
settlement is consumed, and no positive receipt exists may abort open the next
guard. Positive evidence after a seal is authority equivocation and makes the
old lineage/authority identity permanently absorbing. Both receipts are
retained; there is no ClearFence or receipt selection. Independently governed
recovery retires the authority and creates a fresh authority identity and
lineage with fresh sequence/permit namespaces, conservative capacity
carry-forward and no refund; the old lineage never reopens. A unique
old-fence-keyed replacement head admits exactly one Staged successor, one
ActivatedPendingPointerWitness current pointer and, only after signed `P_n`
reconciliation, one Operational lineage; changed candidates are terminally
rejected.
Retirement is one local AuthorityRetirement class/charge and one recovery-head
advance. Pre-reserved parent Recovery funds the separate closed recovery
writer matrix plus a non-releasable post-fence evidence-maintenance partition;
`P_0` uses a separate deployment-bootstrap reserve and imports an already
signed receipt without external I/O in its transaction. An explicit frozen-source outbox,
non-operational destination inbox, reservation mapping/quarantine proof and
independent predecessor-linked transfer commitment reconcile response loss
without a distributed transaction. Activation requires exact inbox
consumption, source reconciliation and current conformance; inherited consumed
is a genesis baseline, never new head-charge credit. A dedicated exact-set
recovery checkpoint, bounded staged publication, replay head and restore cursor
preserve every recovery charge/result/transfer/pointer artifact. Their hash
graph begins with signed tenant/deployment-bound `P_0`, explicit
CanonicalNoPredecessor and Healthy recovery guard, then is staggered and
generated-test enforced: `C_1→P_0`,
`C_n→P_(n-1), H_n→C_n, P_n→H_n`; checkpoint creation and `P_n` remain hot
until later cuts, and `C_n→P_n` is invalid. Dedicated typed checkpoint-create,
pointer publication/Reconcile/status-query, restore-cursor and restore-
completion protocols own bounded charges, reservations, exact outcomes and
unreconstructable process-local permits. MarkOrphan proves locked non-reference
across replay/transfer/pointer/replacement/restore/activation/evidence/hold
owners; externally referenced publications exact-commit or stay unready and
cannot be collected. Restore obtains both independent predecessor-linked
greatest pointer and fence anchors through their dedicated query lanes, replays the recovery
hot suffix and exact-completes witnessed operationalization or stays unready;
pointer contradiction atomically Healthy→Fenced with both receipts, requests
and discovery evidence from pre-reserved capacity. Post-bootstrap writers lock
the guard first: AuthorityChanging requires Healthy, while EvidenceMaintenance
under Fenced can only checkpoint/archive the fence, publish/query an independent
fence high-watermark, verify/export restore evidence or strengthen custody.
One shared anchor sequence makes that fence dominate all earlier pointer
anchors; restore obtains both greatest anchors. The fence has no generic clear
or recursive automatic replacement. The old
archive is never a fallback. The Phase C milestone runs the full replacement
adversarial/cross-backend/DAG/reference suite; `0.140.11` repeats and freezes
it. Every pointer query first obtains an externally registered
RegisteredUnresolved intent and a fully escrowed `R_first` evidence route.
Registry terminal states and a sealed exact-set zero-unresolved completeness
frontier replace current-status absence. The registry closes new operational
claims and drains/expires the bounded live set before query permission.
Its closed authority machine includes ObservationBlocked,
FenceAnchorPending, absorbing AuthorityFenced and RestoreUnready; a rolled-back
local Healthy mirror cannot reopen any of them. Claim admission is
structurally bounded by `c_max` across command/effect/queue/projection
sublimits and pre-reserves every drain/terminal route.
Claim acquisition itself uses Admit/Publish/Reconcile/status with one-shot
permits and closed Issued/Rejected/Unknown/Unavailable/
ExpiredDefinitelyUnredeemed outcomes. Authority mutations use registry claim→
separate non-journal PreparedNonAuthoritative proposal→signed
RegistryConfirmed/Rejected→fresh immutable event/result/audit/outbox append
plus unsigned commit record→post-commit signer reconciliation→signed receipt→
registry settlement; effects also redeem at a provider/executor fence.
Proposals allocate no journal identity and never satisfy successful command
idempotency. Each claim has exactly one DomainAggregateTarget,
ControlOwnerTarget or CanonicalNoAggregateTarget; domain finalization remains
one stream and cross-aggregate work uses the Phase B process manager/outbox.
Registry confirmation signs the complete ordered ProposedEventDescriptor root,
whose closed payload union permits inline bytes only when non-sensitive and
otherwise carries an encrypted/externally erasable reference or erased
tombstone under Phase A lifecycle/residency/hold rules. Classified plaintext
never enters proposal, registry, signer, status, audit or archive evidence.
PayloadReferenceUseClaim tracks exact proposal/event/shared members,
transfer-pending/unknown custody and authoritative release eligibility across
hot/archive/restore/retention/hold authorities; proposal terminality or a local
count cannot erase a shared reference. `P_claim` reserves the bounded
per-distinct-reference pre-settlement routes, while admission also reserves a
tenant PayloadLifecycleMaintenanceCapacity landing slot. After local signing
the execution enters PayloadMaintenanceHandoffPending. Before finalization-
receipt publication, one atomic local handoff transfers exact obligations into
that long-lived ledger; a reference-free command instead commits
CanonicalNoPayloadMaintenanceHandoffProof. Only either exact proof advances to
RegistrySettlementPending and releases `P_claim`; registry settlement later
releases `c_max`. Retained memberships, transfer unknown, archives, holds,
release proof, erasure and compaction consume protected `L_max`.
Conservation prevents double/no owner, lifecycle saturation backpressures new
classified payloads only, and existing cleanup remains funded. Stable
reservation sets progress through maintenance, cleanup, tombstone checkpoint,
verified archive and authenticated physical deletion under predecessor-linked
exact settlements. Archive unavailability retains capacity; only absorbing
PhysicallyReleased leaves `L_max`. The target also
binds the expected predecessor envelope digest. Domain finalization atomically
uses a passing CommitCutRecordedTimePort and advances a journal-authority
RecordedTimeAuthorityRatchet, adds event ID,
stream version, journal offset, transaction position and a conservative
interval enclosing the authoritative commit cut, then derives the intra-batch
predecessor chain canonically and binds all of it in the commit record. Time
rollback without authenticated continuity is Unready. Zero domain events
reject; control/no-aggregate work binds CanonicalNoDomainEventChain. SQLite,
PostgreSQL, MySQL, MongoDB and SurrealDB must prove native authenticated commit
time/sequence, a backend commit-before fence or equivalent attestation for the
exact profile; transaction-start/row-insert/client time is invalid and failing
adapters reject DomainAggregateTarget.
Separate tenant/deployment unique constraints on command ID and idempotency ID
must both resolve to one execution; one-sided reuse conflicts across hot and
archived history. That execution progresses from
ClaimAcquisitionPending through proposal/confirmation/commit/signing/settlement
to a typed terminal state; identical retry joins active state, changed material
conflicts, and cancellation ends at ProposalPrepared. Commit proof uses one
selected attestation profile: trusted signer-adapter authoritative read,
authenticated database attestation or explicit hosted-runtime attester.
Before admission, the selected signer profile must provision either a
threshold/redundant set or root-authorized successor path with non-borrowable
recovery/status capacity. Its signed `n_signer_max` and `k_signer` bounds fund
every member attempt, response-loss query, partial, concurrency settlement,
terminalization and one canonical quorum-combination/import operation. Signer loss enters
CommitReceiptSignerRecoveryRequired and cannot change committed events/results
or release the claim.
All Phase B/C writers declare a subset and generation of
GlobalTransactionLockRankCatalogV1: recovery/authority guards→fences→quota/
uniqueness→command/claim/proposal→payload-use keys sorted by structural
identity→membership/custody/lifecycle settlement→time ratchet→aggregate/
journal→commit/result/audit/outbox. Catalog activation fences legacy writers;
collection, retention, hold/erasure, archive/restore and finalization preserve
the relative subset, while static phase/adapter-trace validation rejects any
contradictory order.
Unknown acquisition, signer or finalization state remains live and blocks
observation. Exact-set claim/proposal checkpoint/archive replay provides
bounded retention without compacting live, redeemed, outcome-unknown,
confirmed-unsettled or frontier-referenced claims. Staged/Verified archive
failures use Commit-status reconciliation and protected non-reference/retention/
legal-hold orphan collection; Committed or frontier-referenced history never
orphans.
Restore uses TokenAcquired→LocalActivationPrepared→RegistryConfirmed→
LocalFinalizeCommitted→SignaturePending↔
CommitReceiptSignerRecoveryRequired→SignedCommitRecord→
RegistryFinalizationSettled→Operational, or
RestoreUnready, never a distributed CAS. Unknown/Unavailable remains
RegisteredUnresolved, local exhaustion is LocallyExhaustedUnresolved,
authenticated external seal alone is ExternallySealedPermanentlyUnresolved,
and late contradiction remains appendable. Registration, cancellation,
terminalization and fence anchoring each own bounded Publish/Reconcile/status
lanes. A named registry authority port and conformance profile make unsupported
adapters refuse the capability.
Ordinary `C_n/H_n` archive writers are Healthy-only and distinct from fenced
`E_m/J_m` EvidenceMaintenance writers. The signed non-borrowable `B_EM`
equation bounds every intent, archive-verification, anchor-query,
restore/export and custody-strengthening class and cannot be replenished
before `1.0.0`. `P_0` trust begins from a pinned root/provenance/lineage,
deterministic offline signing request and single-use receipt import; TOFU and
caller-selected roots are invalid. BeginAbortDrain first commits a typed result and non-releasable
completion reservation covering sealed abort, WitnessWon Commit continuity,
bounded seal-status queries, outputs/drain, exhaustion and equivocation;
missing capacity is no-write/no-permit. Lost response/failover/restore enters
Unready and uses only the same AbortDrainPending Recovery-funded seal-status
admission→one process-local permit→typed Reconcile protocol, with closed
SealWon/WitnessWon/Unknown/TransportFailure/DeadlineExceeded/
ContradictoryEvidence outcomes, trusted-time backoff, immutable
terminalization reservation and exact-once settlement. Seal retry is
status-only; special unmetered restore I/O is forbidden. Letting `s` count
seal queries, sealed abort and contradiction are `3 + 2q + 2s - e`,
WitnessWon then Commit is `4 + 2q + 2s - e`, and exhaustion is
`3 + 2q + 2s`; exact `q`/`s` reservations and every route artifact stay hot.
An independent high-watermark authority witnesses the exact proposed successor before final CAS; restore
establishes it through the applicable pre-reserved bounded ordinary/seal query
lane before local state, and a witnessed successor exact-commits or stays
unready. Final witnessed head installation, captured-row deletion, old
generation tombstone and next Unprepared guard are one transaction whose own
history-lifecycle charge remains hot. Begin creates plan generation 1 and
PreparingOpen. Terminal
reconciliation is recovered only by
independently authorized monotonic Replan, which fences/supersedes old
attempts/grants/receipts and creates new bundle/reservation identities;
independently authorized Abandon fences only and never refunds Begin. Every
Replan freshly proves backend atomic feasibility and reserves its replacement/
future-Commit plus retained-history/cleanup allowance. One immutable
cumulative lineage budget bounds all generations and work; checkpoint/archive
compaction preserves exact replay/anti-reuse and exhaustion never refunds.
Every post-Begin destination admission atomically creates/joins a stable pessimistic
original-bucket budget charge; exact retry never recharges and Recovery
capacity is non-borrowable. The same transaction
settles every leg, advances Released to OriginalTotal,
removes/credits the identical parent member and records CustodyReleased. Its
release paths share one residual-routing-head→residual-state-head→counter-
capacity-state→remediation-attempt-set-head→counter-capacity-archive-high-
watermark→counter-capacity-archive-publication→counter-capacity-archive-replay-
head→archive-head→plan-head→commit-attempt→sorted-remediation-
attempt/capability/evidence/authorization/reconciliation/checkpoint rows→
receipt combined
lock rank and must preflight the complete
ordinary-plus-workspace receipt/profile/reservation/custody-ledger/
reconciliation/GC bundle against backend row/byte/lock/write/work/time maxima
before ReleasePending. Permanent
quarantine has issuer-intent/destination-apply revocation, a first-terminal-wins
outcome table returning stored results, and retains the entire parent member
until broader custody-safe release; it never permits a campaign-level partial
refund.
The lineage release kernel has explicit Begin and Commit commands with
action-specific payload/result/conflict types; commit binds the stored begin
result, non-authoritative verified publication receipt, predecessor/proposed
archive and journal heads, physical dispositions, cost profiles/reservations,
bundle/authorization and expected version. Stage, Verify, MarkOrphan and
FinalizeGc own the precharged
receipt lifecycle. Stage/Verify admit only the current PreparingOpen attempt
and otherwise return no-write AttemptClosed
before upload/verification/budget.
Stage, Verify, MarkEligible, Commit, Replan, Abandon and orphan admission
serialize on archive-head→plan-head→attempt→receipt-state. MarkOrphan accepts only
Superseded/Abandoned; missing/expired/revoked Commit authority is not
ineligibility. Commit alone moves CommitEligible→Consumed and
Verified→ConsumedByCommit while installing
the authoritative archive head with exact covered-hot-row deletion,
dispositions, settlements and results. Orphan/Collected receipts cannot commit
and readers ignore all non-head evidence. Retention and
lineage authorization issuers use explicit monotonic signed-intent Revoke
commands, while destination Apply alone advances their exhaustive six-state
tables, including no-write absent expiry/consumption.
A co-located Recovery parent
ledger and immutable parent/child transfers atomically pair every child
allocation/release with parent debit/credit; one logical operation maps to one
transfer identity, restore never repairs by choosing a side, and completion
reserves follow the same equation. Atomic parent aggregates, exact membership
commitments and predecessor checkpoints support protected cursor-budget
streaming after restore; affected partitions remain VerificationPending or
Fenced until complete proof makes them Ready. Checkpoint creation reserves the
complete derived verification cost before the checkpoint is eligible as a
restorable head. Deployment retirement likewise consumes a separately issued
six-state single-use grant, advances a genesis-created fence rechecked at every
authority/execution boundary and retains a complete terminalization reserve in
that one transaction. The retirement fence is the first universal rank; the
active campaign slot then campaign fence follow their parent ledger.
Stable kind-specific transfer identities, explicit unused-capacity rules and
dimension/ledger isolation survive every clearance and re-fence. Exhaustion or failure to
retain minimum future-control capacity permanently quarantines the lineage and
keeps the obligation fenced. Rebuild terminalizes the predecessor as Rebuilt;
Release requires a custody-safe checkpoint proving that no future operation is
possible and settles each original reserve leg exactly once through separate
authenticated local settlement-journal and verified archive-replay heads;
missing or rolled-back membership retains the fence. Clearance has a distinct admitted/revocable/
expiring single-use authorization, destination-ratcheted mandatory-class/
quorum anchor registry and authenticated collection receipt. One fence-wide
scope admits one live authorization/attempt and retains lifetime proof charges
across replacements. Registry advancement atomically rebinds an Open scope,
terminalizes any live grant as stale without losing charges and never rewrites
a terminal scope. Manifest weakening and permanent rebuild rejection each use
the complete destination-local admission/revocation/expiry/consumption table;
their destructive-revocation intent preimages bind issuer/continuity,
signer/key/epoch/profile, issued-at/not-before, target-covering expiry,
time uncertainty/profile/epoch, closed reason, nonce and a distinct revocation
idempotency. Missing or substituted fields deny, and remote grants or
revocations have no effect. Restoration uses field-specific typed state algebra. If
unprovable, one rebuild parent permits bounded proposals, independently
authorized permanent rejection and one successor while the old evidence stays
fenced.
Every history operation uses the shared
`MigrationImportRegistryHistoryLockRankV1` fence-before-lineage order; adapter
trace tests and release rechecks include obligation, fence, lineage, checkpoint
and custody authority.
Candidate, barrier and activation authorization bind the exact Pending/
NoHistory/NotRequested tag, variant evidence and custody epochs, so changed
history treatment requires fresh activation authority.
Its initial ceilings must fit the platform hard maximum and
cannot be amended or increased through `1.0.0`. Recovery authority and result
use closed RetryAppend/Waive/Abandon tagged unions with canonical absence of
other-action fields, and the union tag is the sole action authority; any index
is derived and read-verified. Admission, expiry, revocation and consumption
share one total six-state row and return one closed outcome enum, including
Fenced as observed state rather than conflict. Explicit
expiry is Issued-only; absent expiry/consumption returns typed no-write
NotAdmitted, while admission alone may authenticate an already expired grant.
One closed operation-conflict wrapper carries only authorization, revocation
or recovery mismatch detail. Different valid operations on one exact
target reread the table after CAS loss; only changed target/idempotency material
conflicts. Typed winner results make every exact retry reproducible, with expiry never
converted into revocation. Recovery revocation takes effect only in its destination row and
binds explicit signer, key-epoch, authentication-profile and trusted-time
fields.
Waiver/abandonment terminals require their own canonical custody records,
current retention/classification/legal-hold proof and independent compliance/
legal approval before a checkpoint. A topology requiring a
distributed transaction or unreviewed global activation selector is refused.
Archive exact results or authenticated result references with
request/lifecycle/scope/predecessor/key commitments, bounded proof work and a
durable cursor. Late exact retry returns the archived result, changed retry
conflicts, and missing/unverifiable history fails closed without execution. A
single cumulative head per tenant/deployment orders archive roots with a non-
wrapping predecessor chain and CAS. Proofs use its greatest committed value
plus current hot rows. Immutable chunks stage and verify before one local head-
CAS/exact-delete transaction; readers ignore noncommitted publications,
unknown external outcomes preserve hot state, local unknowns reconcile the
atomic bundle, and fenced orphan cleanup assumes no distributed transaction. A
proof-to-execution guard verifies against writer-authoritative head `H` outside
the transaction, then locks/re-reads the head and exact key, checks current hot
state, and inserts the unique replay claim with the atomic result bundle.
Changed heads restart without writes; compaction shares the head-first lock
order, and replicas, caches, or weak snapshots cannot authorize. A
canonical replay key makes action ID and idempotency ID independently unique
within tenant/deployment scope. A durable cumulative restart budget survives
head change, crash, failover, cursor recreation and adapter retry; exhaustion
returns typed contention without consumption or execution, separately from
unavailable history. Bounded authenticated-admission/compaction quanta and
protected Recovery capacity prevent starvation. A
closed admission-attempt owner permits one nonterminal attempt per canonical
key: identical requests join, changed material conflicts, fenced takeover
preserves counters/deadline, and cancellation cannot reset it. Success is
atomic with the replay/action bundle and no-write terminals are irreversible.
Attempt rows/bytes/queues/principals/takeover/terminalization/cleanup are
bounded and reserved, with checkpoint-gated cleanup preserving replay state. A
transactional capacity ledger atomically reserves the complete original set
and creates the attempt under fixed replay-head/optional-settlement-journal-
head/key/capacity/domain lock order; joins
allocate nothing. Success rechecks fence/deadline/budget/head and transfers
active-to-terminal with the action bundle. Stable settlement IDs release
checkpoint and physical-envelope legs separately and exactly once, never from
current-profile recomputation. A
domain-separated local settlement journal covers every checkpoint and deletion
leg. Checkpoint decrements, per-leg rows, journal append, attempt checkpoint,
audit and result commit atomically; physical deletion follows the same protocol
for its separate legs. A distinct verified archive replay head advances only
with publication and exact captured-hot-row deletion and can cover mixed
trigger kinds. Lookup combines archive head, current hot-row version and journal
continuity and revalidates head H before proof use. Exact retry returns the
archived result, changed trigger/leg bytes conflict, absent-envelope non-
membership cannot decrement, and unavailable checkpoint or deletion proof
retains capacity.
Exact-ID tombstones, bounds, recovery and migration replace any dense inference
or permanent rows. A
once-per-
first-seen-request rate, successful-admission/outstanding quotas, monotonic
request and issuance
sequences, an exact replay horizon, authenticated checkpoint/archive
commitments, checkpoint-before-delete compaction, fail-closed missing history,
and storage-growth alerts. Phase O implements, failover-tests, restores, soaks,
and hardens the selected construction before `1.0.0`. The issuer publishes
authenticated complete sequence/deadline range evidence; the consumer stays
sparse across unseen receipts unless time and range proof make dense compaction
eligible. Separate non-borrowable normal/recovery/break-glass counters preserve
one bounded emergency repair path without relaxing any security gate. Every
first-seen canonical denial consumes a previously committed presentation charge
plus request rate but creates no authority. Every first-seen canonical request
gets a stable request sequence and request charge; exact retries first commit a
new presentation charge while reusing the logical outcome. Emergency lanes use
separate ingress resources, identities, and non-borrowable capacity; caller-
selected lanes, authorized-class mismatch, and mapping-generation change fail
before logical request allocation. Presentation-charge evidence and
dispositions checkpoint before bounded deletion, as does denied-request
history. Denials remain historical after
compaction, fail closed when proof is unavailable, and have bounded rows/bytes/
archive/verification work. Stage-two successful issuance atomically consumes
the stage-one charge evidence and commits the request charge, layered
deployment/issuer/caller quota reservation, original quota claim set, request/
issuance sequences, immutable outcome, receipt, idempotent result and outbox.
Lineage revocation or supersession blocks
new grants but does not free a live receipt. Settlement decrements the original
counters all-or-none only after authenticated consumer terminal proof or
conservative expiry. Immediate individual revocation is a separate VIT-INV-060
consumer-fence/tombstone protocol whose terminal receipt the issuer cannot
forge. Its complete canonical envelope uses closed terminal outcomes, while
ongoing reconciliation uses separate evidence and receipt types. The
terminal-settlement port accepts only terminal receipts; sender-only consumer
authentication and verify-only issuer credentials apply. Timeout and a lost
revocation response retain capacity.
Bounded predecessor-linked range chunks cap bytes, entries, decode allocation,
verification work and proof depth before dense eligibility. VIT-INV-060 only consumes that
profile-discriminated receipt and local workload proof with its CAS—there is no
cross-owner atomic transaction. Challenge/sequence/expiry-bound topology
receipts and local observation ratchets prevent signed-old replay. Rollout
consumes topology receipts and cannot create
membership or fences. `0.140.1` selects a hardware-attested identity or an
orchestrator-attested lease with a closed action-authority scope: bounded
reusable freshness for readiness, authenticated owner protocol for control/
safety withdrawal, and externally owned online single-use claims for mutations,
atomic local consumption/outcome, typed uncertainty, no reissue, fixed maximum
lifetime, tombstone-first historical replay, restore high-watermarks, and zero
offline authority. Authorization
and global-result receipts use a closed signed, sender-only authority-MAC, or
attested-channel-admission variant with replay and durable-integrity binding; a
disk key, digest, transcript, or row is not
authority. Every
artifact is canonically decoded and cryptographically verified by one project-
owned core shared by runtime and release CLI. No clone, startup, restore,
migration, failover, import, law activation, dispatch, or transmission start
may infer trust from mutable storage, copied identity, field-shaped text,
platform version, or an untrusted clock.
Canonical semantic prose is review evidence, not executable input. The
[Law Semantic Realization Registry](LAW_SEMANTIC_REALIZATIONS.md) exhaustively
binds every `VIT-LSEM-*` to compiled Rust transitions, typed outcomes, recovery
logic, and exact positive/negative/model/fault test contracts. Unknown or mismatched
semantic IDs fail closed; no prose interpreter, reflection path, or plugin may
create authority. A reference to `VIT-LAW-NNN@gNN` claims the complete
predecessor closure `g01..gNN`, and conformance evidence enumerates and admits
every tuple and realization in that closure. Every realization binds
positive/negative/model/fault contracts. Once the later of its effective
milestone and `0.18.3` leaves planned status, CI requires its Rust
transition/recovery files, closed enum/dispatch entry, typed symbols, and
concrete test IDs.
The [Milestone Authority Reviews](AUTHORITY_REVIEWS.md) registry gives every
milestone after `0.18.3` exactly one `declares`, `extends`, `none`, or
conservative `proposed` disposition. Before implementation begins, `proposed`
must resolve to exact stable declarations, exact extended roots/laws, or a
reviewed non-authority reason; no milestone, option decision, release
candidate, or production gate may silently omit that review. CI permits a
proposal only while that milestone’s own status is planned. Law extensions use
`VIT-LAW-NNN@gNN` and must name the latest generation effective at the
milestone, so conformance cannot claim a future generation. That shorthand is
an ancestry-closure assertion, never permission to omit predecessor manifests,
admission tuples, semantic realizations, or their evidence.
Before `0.51.2`, every milestone that creates or changes tenant-bearing durable,
cached, indexed, backed-up, or external-copy state must supply the neutral
`0.8.1` lifecycle descriptor and inventory fixture without depending outward on
Phase F. `0.51.2` backfills and validates every earlier surface; its generated
`TenantDataSurface` compile/registration gate then applies prospectively to
`0.51.2` and every later milestone. This lifecycle registry remains separate
from authority-interface registration. Every asynchronous state effect must use
the applicable `0.18.2` command/consumer/timer/activity/poison atomic variant;
best-effort receipts are forbidden. Each bundle advances no more than one
authoritative aggregate stream and includes only local durable effects;
provider/network work begins from committed intent and returns in a later
bundle under explicitly at-least-once semantics. Each external-effect
capability follows the `0.16.0–0.18.2` contract with distinct execution state,
remote outcome, resolution source/evidence, operational-resolution workflow,
and compensation state. Manual assessment never becomes verified provider
truth; unknown privileged or non-compensable work is never retried blindly.
Authorization is mandatory at effect-intent commit and binds tenant, initiator,
delegation, capability, target, purpose, request, policy, assurance, and typed
execution authority. Dispatch redeems a current live subject, exact durable
approval grant, or current scoped service principal. Grants bind approvers/
quorum/separation, approval assurance, exact effect/request/target version,
purpose, window, attempts, policy version, and revocation conditions. A worker
authenticates as itself and never impersonates an offline human; approver-session
expiry alone does not invalidate a valid grant, while target drift, explicit
revocation, tenant suspension, expiry/attempt exhaustion, and required approver/
policy revalidation fail closed. Every capability declares `CommitBound` or
`CommitAndDispatch`, with dispatch recheck as the default; only reviewed
immutable low-risk effects may be commit-bound, while privileged, destructive,
secret-bearing, containment, and compensation effects require a fenced single-
use dispatch decision. Each grant lineage has exactly one authoritative stream:
either the approval aggregate owns issuance/revocation/successors inline, or an
immutable approval receipt and outbox/process manager create one dedicated
lineage stream later. Pre-issuance revocation defeats delayed issuance;
successors preserve lineage and leave superseded generations permanently non-
redeemable without a two-stream transaction.
Redemption uses a co-located fenced `GrantRedemptionGuard` as transactional
local authority. Issuance/revocation/successor transactions maintain it beside
the one lineage-owner stream; dispatch compare-and-claims one stable attempt
identity beside the effect stream and records the receipt/outbox atomically.
Revocation versus redemption serializes on that guard, retry cannot consume a
second attempt, and capability negotiation rejects non-co-located topologies or
grant/effect two-stream mutation.
Every dispatch also binds and atomically locks a bounded canonical
`DispatchAuthorityFenceSet` of applicable monotonic tenant, subject/principal,
session/credential/mapping, delegation, group/role/relationship, and policy
epochs. Their owner commands update the local epoch with the event, closing the
read-before-dispatch TOCTOU window. External-only bounded-stale facts cannot
authorize privileged effects without authoritative local revocation state.
Current-target work also binds a typed `DispatchTargetFence`: the effect
stream's expected version/digest when it is the target, otherwise an
authoritative fence row updated atomically by the local target owner. It binds
lifecycle and deletion/supersession epoch as well as identity/version, must
co-locate with the effect bundle, and rejects remote, cross-shard, or projection-
only freshness.
Provider-owned mutable targets use a distinct `RemoteTargetConcurrencyProfile`,
not a local fence. Conditional mutation freezes provider/account/resource,
validator kind/bytes/strength/provenance/time, admitted provider capability,
request digest, and idempotency key. Precondition failure is typed non-
acceptance and cannot trigger automatic validator refresh; privileged,
destructive, and containment work requires a strong validator unless a narrow
reviewed unconditional exception applies. The exception is one-owner,
revocable, scoped, expiring, provider/policy-versioned, and attempt-bounded; a
co-located guard serializes revocation/capability change/final-attempt use while
dispatch advances only the effect stream. Response loss stays unknown.
Every admitted dispatch receipt also binds `redeemed_at`, immutable
`transmit_before`, effect attempt, permitted service audience, provider/account/
request digest, and admitted epochs. Immediately before I/O, a local current-
fence `ClaimTransmissionStart` binds a unique claim to one exact worker instance
and lease generation/fence. The production `TransmissionExecutor` owns that
claim and the provider socket; upstream/split workers exchange immutable
authenticated instructions and status, never permit material. Its sealed non-
`Clone`, non-serializable permit is consumed by value and best-effort zeroized;
the stored digest grants no authority. Duplicate instruction, executor failover,
replacement worker, or ambiguous delivery/start becomes `OutcomeUnknown`.
Restore cannot reconstruct the permit, clock rollback cannot extend the window,
and transferable permit profiles are unsupported for `1.0.0`. Its immutable
`ProviderExecutionProfile` removes master-key/general database authority, binds
opaque credential redemption to the exact claim and tenant/provider/account/
action/request/destination, enforces least-privilege credentials and destination/
TLS/DNS/redirect policy without a general proxy, partitions unscopable provider
trust domains, and rejects unrestricted cross-tenant privileged credentials.
One authoritative profile lineage and never-reused profile/account/credential/
broker-policy epochs make suspension, revocation, queued work, and restore
linearizable. Profile authority uses typed control-plane commands, signed exact-
digest admission, semantic expansion review, quorum/separation, current
activation fences, and pre-activation revocation tombstones. Provider credential
rotation is an asynchronous evidence/reconciliation workflow; only local
successor activation is atomic and disables predecessor redemption. One lineage-
owned guard serializes rotations; unknown states block successors, authorized
takeover inventories the provider, orphan credentials stay quarantined and
quota-counted, and late callbacks are fenced. A fresh,
versioned credential-capability snapshot and monotonic local epoch fence out-of-
discovery in the dispatch transaction. A reviewed versioned semantic evaluator
returns equal, subset, superset, incomparable, or unknown with raw/AST/evaluator/
policy-language/explanation evidence. Only equal or an explicitly admitted
proven-safe subset operates; all other results quarantine the whole credential,
invalidate pending authority, create an incident, and prohibit automatic
widening or break-glass promotion. Evaluator binaries/corpora are governed by
their own signed lineage and monotonic epoch; activation/revocation immediately
requires reevaluation and incompatible nodes cannot start. Quarantine resolution
requires current evaluator/provider/epoch/consistency and separated-resolver
evidence, creates a new capability generation, and cannot revive earlier work.
Rotation/takeover recovery uses a separately admitted cleanup-only remediation
credential/channel; absence of an independent provider path means manual
intervention. Non-exportable signing/mTLS exposes
operations only;
bearer/API-key transmission places header serialization, TLS, claim, and socket
inside the hardened credential-broker/executor TCB, where bearer bytes may
briefly exist but cannot escape to upstream/plugin/general connector or durable/
diagnostic surfaces.
Each effect carries a bounded atomic set of typed quota claims with independent
amount/unit, settlement policy, and admission/lease/dispatch/transmission/
storage boundary. Concurrency releases with the local lease; operation, rate,
estimated-liability, and retained-byte claims follow their distinct documented
rules. Only provider-dependent claims hold on unknown outcomes. Refunds remain
evidence-bound and exactly once; administrative write-off is separate from
provider evidence; compensation has a separate claim set. Quota claim sets are
local transactional authority, not aggregate streams. They reserve all-or-none
under canonical deadlock-free ordering, bind immutable ordered membership to an
opaque token/digest, and are consumed/settled idempotently as that exact set
without member reacquisition. Restore/reconciliation accepts the complete
verified set or quarantines it; partial reconstruction is forbidden.
Each set and work bundle reside in one local quota partition. Wider global or
regional limits use fenced hierarchical capacity leases allocated into that
partition before work admission; parent/child capacity is conserved and a work
bundle never starts a distributed cross-shard/region transaction. The `1.0.0`
profile supports authoritative-region writes plus fenced failover and rejects
active/active authoritative multi-region writes.
Each hierarchical lease binds quota kind, unit, period, and settlement policy.
Expiry stops new reservations but preserves spent/encumbered capacity; a parent
reclaims only proven free remainder. Outstanding claims settle against the
original encumbrance through a durable `QuotaCapacityTransferState` outbox/inbox
process manager. Stable identities, epochs, digests, sequences, receipts, an
authenticated acknowledgement, and old-child fence proof make local transitions
idempotent over at-least-once delivery. Uncertainty stays charged and double-
entry recovery never exposes capacity at both ends; late evidence retains its
original claim/transfer lineage. Transfer freezes accounting owner, hierarchy
root/parent lease, period, work/recovery lane, capacity class, residency/region,
and authorization decisions. Ordinary transfer cannot cross tenant, hierarchy,
period, lane, class, or residency. Existing capacity never changes class, and
protected-to-business conversion has no privileged escape hatch. Only future
unallocated parent capacity may be resized through versioned, simulated,
separation-of-duties `QuotaCapacityPolicy` activation. Each policy lineage owns
one parent and atomically CAS-updates its co-located parent ledger under an
independently governed floor-set version. Floor reduction has a separate
capability/approval lineage, cross-command separation, operational fences,
obligation simulation, append-only history, and a durable versioned platform-
floor ratchet. Nodes below an admitted high-watermark reject startup; mixed-
version operation uses the stricter same-key profile and downgrade/rollback/
restore cannot release capacity. Every entry has a typed canonical accounting-
owner/root/kind/unit/scale/period/class/lane/region/residency/settlement
`PlatformSafetyFloorKey`; migrations map the complete old/new key sets without
loss or overflow. Multi-parent finalization CAS-validates a root-owned canonical
parent manifest, unchanged membership epoch, one still-active rollout generation,
complete prepared-receipt set, and total conservation. Successors atomically
supersede predecessors; rollback is a complete successor over current manifest/
actual limits and late or restored predecessor messages fail. It only permits
activation: every parent then
freshly CAS-revalidates its prepared state, ledger/unallocated capacity, floor
ratchet/set, obligations, root generation/manifest, and current operational
fences or remains conservatively blocked/reconciling. Delayed transfer steps
recheck current local tenant, principal, and policy epochs.
Pre-preparation cancellation terminates directly. Once any parent has prepared,
cancellation atomically creates one root-owned recovery successor over the
complete manifest and actual limits; parents remain conservative, cannot restore
independently, and recover through idempotent restore-safe receipts with current
state/authority checks and deadline escalation.
Composite transactions use one order—stream head, authority fences, target
fence, remote-mutation-exception guard, grant guard, quota lease/keys,
uniqueness claims, then receipts—and retry only
classified deadlocks under a bounded identity/digest/version-preserving policy.
Tenant/work-class
partitioning, fair share, ceilings, starvation bounds, and a scoped emergency
reserve protect reconciliation/security cleanup from tenant exhaustion and
monopolization without admitting new tenant work.
External-copy lifecycle evidence uses the typed `0.51.2` strength model and may
never promote an attestation, unconfirmed request, or unverifiable disclosed
plaintext to local deletion proof or controlled-key erasure. Rollup-substitution
expiry requires its full authority proof, but a controlling mandatory erasure,
maximum-retention, or closure deletion obligation takes precedence; any
resulting loss of historical authority is recorded immutably and exposed as
unknown/unavailable. Raw data, rollups, manifests, derived results, caches/
projections, exports, and linkable checkpoint metadata each receive their own
disposition decision; only independently permitted non-authoritative data and
allowed non-sensitive tombstone/authority-loss evidence may remain.

## Universal Verification And Exit

Release-specific verification is additive to `scripts/checks.sh`, supported-
target checks, tool freshness, SBOM and license review, CI, CodeQL default
setup, docs/release-note review, threat-model and unsafe/dependency deltas,
authorization and tenant-isolation matrices, changed-parser fuzzing, changed-
invariant property tests, and migration/restore evidence where applicable.
`0.58.0–0.60.0` backfill every authority-bearing interface implemented through
Phase F. Every later milestone that adds one must register its tenant, subject,
action, resource, fields, purpose, obligations, audit behavior, and negative
cases in that conformance registry before exit. External effects additionally
register intent-commit and dispatch enforcement points, immutable bindings,
freshness and execution-authority profile, grant issuance/redemption/revocation,
grant owner/lineage/successor/outbox causation, redemption-guard/attempt-claim
placement and receipt, authority-fence sources/epochs/co-location/staleness,
bounded quota-claim kinds/boundaries/settlement, exact-set token/digest/
linearization, quota partition/capacity-lease/encumbrance-transfer topology,
target-fence owner/epoch/co-location/placement, receipt-idempotent capacity-
transfer delivery/conservation/classification, remote-target concurrency
profile/provider capability/precondition outcome, remote-mutation-exception
owner/guard/attempt, transmission-window/start-claim/time/uncertainty behavior,
unique claimant/worker-instance/lease-fence/one-time-permit behavior, capacity-
policy owner/parent-ledger/high-watermark, independent-floor governance/cross-
command separation/platform-floor key/profile/ratchet, root-manifest membership/
conservation/active-generation successor/fresh parent activation/current-
transition authority, transmission-executor/provider-execution-profile/no-
permit-transport behavior, canonical floor-key/migration behavior, canonical
composite lock/retry behavior,
refund/write-off evidence, and
compensation/recovery-capacity behavior.

At each implementation stop: record the exact evidence state and support scope;
do not tag, publish, or begin the next milestone.
Pentest the exact commit, fix every blocking finding, rerun all gates, obtain a
permanent `Status: PASS` report, and run the versioned readiness gate. Patch
and companion versions contain corrections, one pre-declared focused
parent-family completion slice, or one explicitly planned bounded capability
within the current phase family. They introduce no unrelated scope and follow
the same process.

## Phase Documents

- [Phase A — Pure Foundation (`0.1.0–0.10.0`)](implementation/PHASE_A.md)
- [Phase B — Journal And Projections (`0.11.0–0.20.3`, including corrective `0.18.3–0.18.5` passes)](implementation/PHASE_B.md)
- [Phase C — Storage Portability (`0.21.0–0.30.0`)](implementation/PHASE_C.md)
- [Phase D — Universal Work (`0.31.0–0.40.0`)](implementation/PHASE_D.md)
- [Phase E — IT Service Management (`0.41.0–0.50.0`)](implementation/PHASE_E.md)
- [Phase F — Identity, Tenancy, And Policy (`0.51.0–0.60.0`)](implementation/PHASE_F.md)
- [Phase G — Durable Workflows (`0.61.0–0.70.0`)](implementation/PHASE_G.md)
- [Phase H — Security Operations (`0.71.0–0.80.0`)](implementation/PHASE_H.md)
- [Phase I — Assets And Services (`0.81.0–0.90.0`)](implementation/PHASE_I.md)
- [Phase J — Search And Knowledge (`0.91.0–0.100.0`)](implementation/PHASE_J.md)
- [Phase K — Compliance And Risk (`0.101.0–0.110.0`)](implementation/PHASE_K.md)
- [Phase L — WASM And Integrations (`0.111.0–0.120.0`)](implementation/PHASE_L.md)
- [Organization Federation (`0.120.1–0.120.5`)](implementation/FEDERATION.md)
- [Phase M — Optional AI (`0.121.0–0.130.0`)](implementation/PHASE_M.md)
- [Phase N — Product Experience (`0.131.0–0.140.0`)](implementation/PHASE_N.md)
- [Pre-Production Option Decisions (`0.140.1–0.140.11`)](implementation/OPTION_DECISIONS.md)
- [Foundation And Storage Scope Splits (`0.18.6–0.30.16`)](implementation/SCOPE_SPLITS_FOUNDATION_STORAGE.md)
- [Product And Production Scope Splits (`0.70.1–0.149.3`)](implementation/SCOPE_SPLITS_PRODUCT_PRODUCTION.md)
- [Focused Product Capability Completions (`0.20.4–0.140.27`)](implementation/PRODUCT_CAPABILITY_COMPLETIONS.md)
- [Requirement Ownership And Product Integration Completions (`0.18.14–0.145.3`)](implementation/REQUIREMENT_AND_INTEGRATION_COMPLETIONS.md)
- [Roadmap Coherence Completions (`0.18.15–0.140.28`)](implementation/ROADMAP_COHERENCE_COMPLETIONS.md)
- [Roadmap Authority And Recovery Completions (`0.30.29–0.145.4`)](implementation/ROADMAP_AUTHORITY_COMPLETIONS.md)
- [Phase O — Production Hardening (`0.141.0–0.150.0`)](implementation/PHASE_O.md)
- [`1.0.0` — Production Acceptance](implementation/PRODUCTION_1_0.md)

The integration decisions and sequencing changes resulting from the roadmap
review are tracked in [Roadmap Gap Dispositions](ROADMAP_GAP_DISPOSITIONS.md).

## First-Ten Crate Graph

```text
vitheim facade
├── vitheim-id, vitheim-time, vitheim-error
├── vitheim-budget, vitheim-fixed
├── vitheim-value, vitheim-schema, vitheim-codec
├── vitheim-context, vitheim-command, vitheim-event
├── vitheim-aggregate, vitheim-incident
└── vitheim-cli (hosted in-memory demonstration only)
```

N0 crates use neither `std` nor an allocator. N1 may use explicit `alloc` but
not OS facilities. Hosted crates expose project-owned interfaces and never leak
runtime, database, protocol, plugin-host, or UI implementation types inward.
