# Active Law Catalogs

Status: normative runtime-catalog plan introduced by `0.18.3`

The planning superset in `docs/LAW_MANIFEST_ADMISSIONS.md` is never admitted
directly. `VIT-INV-057` owns the single global
`LawManifestAdmissionSetV1` lineage. Distinct `VIT-INV-058` local owners admit
that lineage into exact enforcement-partition placement generations and retain
monotonic catalog, distrust, identity-fence, and validity-time ratchets.
`VIT-INV-059` separately owns durable multi-partition rollout coordination.
From `0.141.0`, `VIT-INV-060` independently owns the current dynamic placement
topology generation; rollout consumes its fenced snapshot and never becomes a
topology writer.
None of these transaction domains may update another's authority row.

Every active catalog is immutable and complete for all law generations
effective at its activation floor. It contains no generation effective after
that floor. A catalog remains applicable until the global owner explicitly
activates its successor; there is no maximum-platform-version field and a
platform version alone cannot silently supersede a catalog. At any
implementation milestone, the applicable planned catalog is the catalog with
the greatest activation floor not greater than that milestone. The checked
schedule proves exactly one such catalog for every milestone from `0.18.3`
through `1.0.0`.

Activation requires global expected-version CAS, a strictly increasing epoch,
the predecessor's verified envelope digest, compiled semantic realization, and
successful local admission. A cryptographically trusted tuple is not
activatable before its generation is effective and realized. Partial rollout
is an explicit degraded state: nodes that have not admitted the active global
epoch are unready for law-bearing dispatch or transmission start.

## Canonical Active Payload

`LawManifestAdmissionPayloadV1` contains these fields in exact order:

1. format literal `vitheim-law-manifest-admission-payload-v1`;
2. catalog ID and strictly increasing epoch;
3. predecessor envelope digest or `none` for the first active catalog;
4. activation floor as strict numeric SemVer;
5. product, edition, and compatibility scope;
6. sorted, unique tuple count and complete
   `(LawId, Generation, ManifestDigest)` ancestry;
7. payload digest.

The payload digest uses the project length-prefixed canonical encoding over
fields 1–6 and every tuple. It excludes itself, presentation, and signatures.
The tuple set must equal the latest generation of every law effective at the
activation floor plus every predecessor; omission and future inclusion both
fail closed.

The initial scope contract is exact rather than descriptive:

- product scope: `vitheim`;
- edition scope: `vitheim-core`;
- compatibility scope: `vitheim-platform-law-v1`.

A scope change requires a new catalog epoch and an explicitly reviewed scope
contract. A verifier supplied with a different build product, edition, or
compatibility expectation rejects the artifact even when all digests and
signatures are otherwise valid.

## Canonical Trust Envelope

`LawManifestAdmissionEnvelopeV1` content-binds these fields in exact order:

1. format literal `vitheim-law-manifest-admission-envelope-v1`;
2. exact profile enum: `CompiledCatalog` or `SignedCatalog`;
3. payload digest and predecessor envelope digest;
4. catalog ID, epoch, and activation floor;
5. product, edition, and compatibility scope;
6. validity policy enum (`NoExpiry` or `BoundedWindow`), canonical
   not-before/not-after values, and `maximum_time_uncertainty_ns`;
7. signer/key ID, signature profile, and trust-root epoch;
8. revocation policy and successor policy;
9. envelope digest.

The envelope digest uses length-prefixed canonical encoding over fields 1–8.
For `NoExpiry`, both times and `maximum_time_uncertainty_ns` are exact `none`
literals. For `BoundedWindow`, the times are ordered canonical timestamps and
the maximum uncertainty is a positive canonical integer within the selected
platform ceiling. For `CompiledCatalog`, signer/key/signature fields use exact
`none` literals and artifact provenance authenticates an envelope digest
compiled into the release. For `SignedCatalog`, none of those fields may be
`none`; the dedicated platform-law key signs the domain-separated envelope
digest. Trust roots arrive through compiled provenance or a separate
authenticated ceremony, never mutable catalog storage. Signature bytes are
outside the digest but bind its exact value. No hybrid profile or
profile-inapplicable field spelling is accepted.

Revocation and emergency distrust advance the global lineage even if no
successor can activate. A successor binds its predecessor's recomputed,
verified envelope digest. Restore accepts neither an older global epoch nor a
catalog below a local ratchet and cannot reconstruct profile, signer,
trust-root epoch, validity, scope, revocation, or successor authority from
database content.

## Trustworthy Bounded-Window Time

`BoundedWindow` is usable only through `VIT-CAP-058`, an admitted
`TrustedCatalogTime` capability returning a conservative
`[earliest, latest]` interval, uncertainty, continuity/boot identity, and
rollback/suspend evidence. The platform ceiling for uncertainty is frozen at
`0.140.1`; an envelope may select an equal or tighter bound. Admission and
every readiness, dispatch, and transmission-start recheck require:

```text
earliest >= not_before
latest < not_after
reported_uncertainty <= envelope_maximum <= platform_maximum
```

The local `CatalogAdmissionRatchetRow` persists the greatest admitted catalog
epoch/digest, greatest distrust epoch, last observed trusted lower bound, time
continuity identity, and expired-window tombstone. A lower time bound, clock
rollback, lost continuity, unaccounted suspend/resume, excessive uncertainty,
or unavailable trustworthy time fails closed and requires time re-attestation
before the node becomes ready. Suspend-aware sources must include suspended
duration; other sources lose continuity on resume.

Restore merges the greatest externally retained/local ratchet before catalog
use and obtains a fresh trusted interval. It never restores an older time
observation to extend a window. Once the trusted interval proves expiry, the
local tombstone and global revocation/distrust processing dominate backups. If
current trustworthy time or the non-rollback recovery ratchet is unavailable,
a bounded catalog remains unusable. `NoExpiry` avoids a time availability
dependency but not catalog epoch, digest, revocation, or distrust checks.

## Canonical Local Admission Owner

The ownership grain is one logical enforcement-partition placement generation,
not an interchangeable host, pod, process, or copied database row. The
canonical `CatalogAdmissionOwnerKeyV1` is:

```text
(DeploymentId, RegionId, ServiceRole, EnforcementPartitionId,
 PlacementGeneration)
```

The current placement manifest allocates each key exactly once. A local
`CatalogAdmissionRatchetRow` and every prepare/admission/convergence receipt
bind the complete key plus:

1. the current topology and placement-manifest generations;
2. an authenticated, non-clonable `WorkloadIdentity`;
3. fresh `BootOrContinuityId`;
4. binary capability-profile digest;
5. complete semantic-realization-set digest;
6. catalog epoch and envelope digest;
7. previous admitted local epoch and digest;
8. local fencing token and global/rollout owner fences; and
9. receipt ID, rollout ID, typed disposition, and canonical receipt digest.

The selected workload-identity profile must prevent two live runtimes from
presenting the same owner identity. A cloneable bearer identity, disk-derived
identity, or host name alone is unsupported. A cloned disk, restored VM,
duplicated pod, copied partition database, or replacement process receives no
usable authority from the copied ratchet: its workload/continuity identity,
placement generation, and current owner fence do not match. Replacement or
region movement increments `PlacementGeneration`, permanently fences the old
key, obtains a fresh identity and boot/continuity binding, and performs a new
admission from a verified global rollout receipt. Rollback cannot make a
predecessor placement current again.

### Workload Identity And Receipt Assurance

`WorkloadIdentityProofProfileV1` is a closed production assurance profile, not
the assertion that an ordinary mTLS key is “non-clonable.” Every admitted
profile binds issuer, subject, audience, deployment, region, service role,
enforcement partition, placement generation, public-key thumbprint, attestation
policy/version, issuance and expiry, revocation epoch, and the active
workload-identity fence. It defines issuance, renewal, rotation, simultaneous-
use detection, replacement, restore, and compromise recovery.

The selectable mechanisms at `0.140.1` are:

1. `HardwareAttestedKey`: the identity key is non-exportable and its current
   attestation binds the complete catalog-owner key and measured workload; or
2. `OrchestratorAttestedFencedLease`: a key-bound, short-lived orchestrator
   identity is usable only with one current single-active lease/fencing token
   and the operation-specific proof in the normative scope matrix below.
   Each single-use claim CAS-binds the instance ephemeral key,
   `BootOrContinuityId`, lease generation/fence, canonical action digest, one-
   use sequence, issuance, and expiry. No cached or offline lease authorizes
   a protected mutation, dispatch, transmission start, or positive readiness
   result. The only exposure after loss/fencing is an already
   claimed action until the frozen maximum action-claim lifetime; expiry forces
   abort/reconciliation. Duplicate renewal or simultaneous use immediately
   fences the affected incarnation and denies new claims.

The action-authority scope is closed and is frozen at `0.140.1`:

| Operation | Required online authority | Atomicity and result |
| --- | --- | --- |
| Readiness observation | reusable, bounded `OnlineWorkloadFreshnessProofV1`; no action claim | read-only; stale, unavailable, fenced, or topology-mismatched proof returns unready and cannot create authority |
| Positive local prepare, convergence, or admission receipt creation/commit | single-use `WorkloadLeaseActionClaim` | consume the claim, commit the receipt/admission and its typed result in one local owner transaction |
| Topology-authorization allocation | globally bounded but independently provisioned non-borrowable normal/recovery/break-glass ingress resources; an authenticated endpoint/audience/credential-profile-derived presentation lane owned by VIT-INV-061 with SoD promotion; current principal/session/delegation/policy/approval; bounded presentation/request rates; and layered admission/outstanding limits | Stage one commits every non-refundable presentation debit and internal single-use charge evidence before protected lookup. Stage two consumes that evidence, rechecks current mapping generation/fence/profile/lane, and atomically performs lookup plus any request charge/sequence/outcome/admission/reservation/issuance/receipt/outbox writes; mapping change or crash never refunds stage one, and retry gets a new charge. Emergency identities, ingress, presentation and request capacity are non-borrowable; denial history, terminal-only settlement, separate reconciliation and all existing security gates remain enforced |
| Topology handoff initialization/commit or topology successor mutation | independently issued `TopologyMutationAuthorizationReceiptV1`; orchestrator profile additionally requires a single-use `WorkloadLeaseActionClaim`, while hardware profile requires canonical-none claim fields and current hardware proof | `DeadlineConditionalTopologyCasV1` consumes the receipt, profile-applicable workload proof, time ratchet/tombstones, expected-version topology CAS, member fences/tombstones, and fence outbox in one VIT-INV-060 transaction |
| Topology-authorization replay checkpoint/compaction | no new workload or mutation authority; only the current VIT-INV-060 or VIT-INV-061 owner may compact its own local state | issuer request checkpoint covers every admitted/denied request before deletion and makes late denial historical; issuer issuance checkpoint may advance dense allocation watermark; consumer remains sparse unless complete authenticated issuer range plus trusted-time horizon/deadline and terminal-state proof yields `ConsumerCompactionEligibleThrough`; unavailable request/receipt proof never means new or absent |
| Dispatch | single-use `WorkloadLeaseActionClaim` | consume with the exact dispatch bundle and outcome in the dispatch owner transaction |
| Transmission start | single-use `WorkloadLeaseActionClaim` | consume with the unique start claim immediately before provider I/O |
| Global catalog proposal/activation/succession/revocation/distrust | no workload action claim for owner-to-owner delivery | authenticated control receipt and durable outbox/inbox protocol; an operator command separately requires current policy/session/approval authority |
| Rollout-root state transition and control delivery | no workload action claim for owner-to-owner delivery | authenticated process-manager message/receipt, expected-version CAS, and durable outbox/inbox; local positive receipt creation still follows its row above |
| Local application of revocation, distrust, or placement fence | no workload action claim | authenticated owner protocol; safety withdrawal cannot be delayed by issuer outage |

`OnlineWorkloadFreshnessProofV1` binds the workload key, issuer, audience,
lease generation/fence, boot/continuity ID, placement generation, current
topology challenge/receipt sequence and topology generation, catalog
epoch/digest, revocation epoch, issued-at, expiry, maximum uncertainty, and
the maximum age frozen at `0.140.1`. It is reusable only for read-only
readiness observations within that bound. It cannot authorize receipt
creation, admission, topology mutation, dispatch, or transmission start.

`WorkloadLeaseActionAuthorityPortV1` is the explicit external trust boundary
for that second mechanism. The external identity authority, not Vitheim
storage, owns the monotonic issuer/lease generation and sequence plus unique
`(ClaimId, ActionId)`. A stable idempotent request binds issuer, lease,
instance key, `BootOrContinuityId`, sequence, canonical action digest, issuance,
expiry, and revocation/fence epochs. An exact retry returns the original claim;
reuse with different bytes or action digest is rejected.

The Vitheim invariant owner performing the protected action validates the claim
and atomically commits the action, its typed outcome, and a
`ConsumedWorkloadLeaseActionClaim` tombstone in the same local transaction.
Replay precedence is normative:

1. look up the local consumed-claim tombstone before evaluating current claim
   expiry, revocation, fence, or sequence state;
2. when claim ID and canonical action digest exactly match, return the stored
   historical typed outcome without repeating the action, even when the claim
   later expired or was revoked;
3. when no tombstone exists, apply all current expiry, revocation, fence,
   sequence, identity, and digest checks before first consumption; and
4. reject every claim-ID or action-digest mismatch.

A historical response reports only the prior transaction; it grants no current
readiness, retry, follow-up mutation, dispatch, transmission, or other new
authority.
Lost issuance responses become `WorkloadLeaseActionClaimIssuanceUnknown` and
are reconciled by the stable request against the issuer. Lost protected-
transition responses become `WorkloadLeaseActionClaimOutcomeUnknown` and are
reconciled against the local tombstone/outcome. Neither state permits a new
claim for the same action. Expired, revoked, fenced, duplicate, out-of-sequence,
or digest-substituted claims fail closed; an issued but unconsumed claim may
expire without inventing completion.

Issuer records, greatest consumed-claim sequence/tombstone checkpoints, and
their exact outcomes survive failover, backup, restore, and migration. Restore
below either externally evidenced high-watermark is unready until reconciled;
it cannot reissue or reconsume a claim. This capability/consumption split does
not create a second Vitheim owner: the external authority owns issuance, while
each existing invariant owner exclusively owns the co-transactional
consumption tombstone and protected state.

Raw disk-held mTLS keys, bearer tokens, host names, pod names, VM identities
without key-bound attestation, and receipt digests alone are unsupported.
`CatalogReceiptAuthenticationV1` is exactly one closed variant:

1. `WorkloadSignedReceipt`: a current admitted workload key signs the canonical
   receipt bytes, profile/placement/lease fence, signer epoch, and domain;
2. `AuthorityMacReceipt`: a non-exportable authority key handle MACs the same
   fields and binds its owner, key epoch, purpose, and rotation/revocation
   state. KMS/HSM policy gives only the named sender `GenerateMac` for that
   owner/domain/key epoch and gives receivers `VerifyMac` only; receivers
   cannot generate, export, rotate, or impersonate the sender; or
3. `AttestedChannelAdmissionReceipt`: a unique verifier challenge, channel
   exporter, authenticated peer identity/key/attestation, canonical receipt
   bytes, admission/signer epochs, owner fences, and replay tombstone commit
   atomically into the durable admission record.

The channel variant's durable record is anchored by a signed/MACed checkpoint
or independently trusted integrity chain before recovery may rely on it.
Transport success, a database row, a digest, or an open-ended “equivalent”
profile is never receipt authenticity. Admission and recovery revalidate the
selected exact variant, issuer/key/attestation/revocation/lease/fence epochs,
challenge uniqueness, replay tombstone, and integrity anchor.

## Placement Topology Authority

`0.18.3` bootstraps only
`CompiledStaticPlacementTopologyV1`: an immutable, reviewed artifact containing
exactly one deployment/region/service-role/enforcement-partition placement at
generation one. It supports no dynamic join, leave, move, replacement,
split/merge, autoscaling identity reuse, or topology mutation. Any such request
before the governed handoff fails closed; the rollout root may snapshot this
artifact but cannot edit or supersede it.

`0.141.0` performs a staged, non-circular artifact-authorized handoff to
`VIT-INV-060 PlacementTopologyGenerationState` before split-service or HA
deployment. One
`PlacementTopologyGenerationRow` per deployment owns expected-version CAS over
the current monotonic topology generation, canonical sorted membership
manifest/digest, and each member's monotonic placement generation, predecessor
fence, and permanent tombstone. Typed join, leave, move, replacement,
service-role change, split, and merge commands create a complete successor
manifest; activation atomically makes it current and emits durable fence
intents for every removed or superseded placement. Restore takes the greatest
externally evidenced topology and placement-generation ratchets and cannot
resurrect a tombstone. Its handoff state is closed:
`Uninitialized`, `DormantInitialized`, or `Committed`.

The ceremony is:

1. keep the compiled singleton as the sole topology authority and
   `VIT-INV-060` in `Uninitialized`;
2. use currently active `VIT-LAW-008@g01` and that static singleton to activate
   and converge `VIT-LAWCAT-ACTIVE-e012-v1`, which contains
   `VIT-LAW-008@g02`;
3. only after every required local owner has admitted generation 2, execute
   `InitializeTopologyAuthorityHandoff`; its expected-version CAS creates
   `DormantInitialized` with bytes/digest exactly equal to the compiled
   singleton, while the compiled artifact remains the sole authority;
4. independently verify the stored manifest bytes/digest against the compiled
   singleton and completed epoch-12/local-admission evidence;
5. execute `CommitTopologyAuthorityHandoff`; its expected-version CAS binds the
   completed epoch-12 rollout ID/generation,
   catalog envelope digest, compiled static artifact digest, identical dormant
   manifest digest, and handoff receipt, then changes the row to `Committed`;
   and
6. only `Committed` may issue `CurrentPlacementTopologyReceiptV1` or accept
   dynamic commands.

Every initialization, handoff commit, and dynamic topology successor requires a
unique `TopologyMutationAuthorizationReceiptV1` issued only by independent
`VIT-INV-061 TopologyMutationAuthorizationState`. The topology owner cannot
share its issuer authority or credential and can never mint its own receipt.
One authoritative lineage owner holds proposal, quorum/separation decision,
issuance uniqueness, revocation, supersession, expiry, and issuance
high-watermarks. A stable request ID makes issuance idempotent; a lost response
becomes `TopologyMutationAuthorizationIssuanceUnknown` and is reconciled with
that owner rather than reissued.

Issuance is the authorization linearization point. In its own transaction,
VIT-INV-061 validates the initiating principal, interactive session or
delegation lineage, current principal/session/delegation/role-assignment/policy
epochs, change/incident/emergency record, approval quorum and separation of
duties. It then issues one immutable, narrowly scoped
`TopologyMutationAuthorizationReceiptV1`
binding authorization lineage/generation, monotonic
`AuthorizationIssuanceSequence`, mutation ID, expected topology
generation, canonical successor-manifest digest, mutation class, `issued_at`,
fixed `commit_before`, maximum time uncertainty, trusted-time profile ID/epoch,
issuer time-continuity ID, issuer identity/fence/key epoch, and authentication
profile.
The canonical V1 authentication preimage is domain-separated and length-
prefixed and covers every preceding authorization, topology, time, issuer, and
profile-applicable workload-proof field. Unknown/duplicate fields, noncanonical
ordering/encoding, omitted time/profile/continuity data, mixed profile fields,
or schema-version substitution reject before authentication.
If any contributing authority changes before issuance, issuance fails. A
change, revocation, or supersession after issuance prevents new receipts but
does not retroactively invalidate that exact already issued grant before
`commit_before`; expiry always blocks it. This bounded irrevocable-grant model
is explicit and does not pretend that external epoch reads and the topology CAS
share one transaction.

Authorization time reuses the conservative interval vocabulary defined in
“Trustworthy Bounded-Window Time” through domain-separated
`TrustedTopologyAuthorizationTime`. The immutable protocol ceilings frozen at
`0.140.1` are five minutes for `InitializeTopologyAuthorityHandoff`, two minutes
for `CommitTopologyAuthorityHandoff`, two minutes for every dynamic
join/leave/move/replace/service-role/split/merge successor, and the lesser of
the applicable class ceiling and sixty seconds for break-glass. Issuance
requires a current `[earliest, latest]`, valid continuity, and reported
uncertainty no greater than both receipt and platform ceilings; otherwise it
fails closed.

VIT-INV-060 independently obtains a fresh trusted interval and persists the
greatest observed lower bound, time-profile epoch, local continuity identity,
and permanent expired-authorization tombstone. After acquiring every topology
transaction lock, it calls mandatory `DeadlineConditionalTopologyCasV1`. The
storage authority evaluates the interval's `latest` plus admitted maximum
commit slack strictly below `commit_before` at the authoritative commit
linearization point and atomically persists the consumer time ratchet, receipt/
claim tombstones, topology CAS, member fences/tombstones, and fence outbox.
The admitted backend mechanism is either an in-commit authoritative-time
predicate or a hard no-late-commit fence. Client checks, statement timestamps,
timeouts, cancel requests, and connection loss are never deadline authority.
If the response becomes uncertain, reconciliation may discover an already
committed pre-expiry result, but backend evidence must prove an absent
transaction can never commit later; the same receipt is never retried as fresh
authority. Clock rollback, an NTP
step or issuer/consumer disagreement that widens uncertainty, unaccounted
suspend/resume, snapshot restore, or failover discontinuity fails closed.
Restore merges the greatest external/local time ratchet before receipt use and
cannot extend the deadline.

`TopologyAuthorizationReplayLifecycleV1` bounds anti-replay storage without
weakening logical permanence. Before VIT-INV-061 allocates durable authority,
`TopologyAuthorizationAdmissionBudgetV1` enforces frozen per-deployment and
issuer/class plus canonical principal-or-authority/class successful-admission-
rate and outstanding limits. A separate bounded
`TopologyAuthorizationIngressWorkBudgetV1` first caps deployment/listener bytes,
concurrent authentication, signature/MAC work, canonical decode bytes/
allocation/depth/work and failures; trustworthy transport-source limits are
additive and request-controlled values are never the sole key.
`TopologyAuthorizationIngressLaneV1` partitions independently provisioned,
non-borrowable normal/recovery/break-glass listener, accept/file-descriptor,
TLS/crypto-worker, decode memory/CPU, executor-queue and connection-pool
capacity under a global safety ceiling. Server-controlled listener/TLS trust
configuration and upstream policy route work but grant no authorization. A separate
bounded `TopologyAuthorizationPresentationRateBudgetV1` charges every
authenticated canonical presentation after authentication/canonicalization and
before protected idempotency lookup, including exact
retry, replay, concurrent duplicate, changed-digest conflict and typed denial,
but creates no logical request, authority, or reservation. Saturation returns
transient `TopologyAuthorizationPresentationRateLimited` without reading or
replacing an immutable request outcome; unauthenticated/noncanonical traffic
is handled by the ingress-work budget.
`TopologyAuthorizationPresentationLaneV1` is closed to `Normal`, `Recovery`,
and `BreakGlass` and derives only from authenticated endpoint/audience plus a
versioned, fenced credential-or-authority profile. Body fields, requested
class, principal labels and untrusted routing metadata cannot select it.
Emergency lanes use separately provisioned identities/audiences and
non-borrowable presentation/request capacity. Missing, revoked, stale,
ambiguous or restored-old mapping denies. Full authorization must yield a
`TopologyAuthorizationBudgetClass` exactly matching the lane or
`TopologyAuthorizationPresentationLaneMismatch` creates no request, admission
or outstanding state.
VIT-INV-061 solely owns stable mapping identity, proposal, SoD promotion/
activation, rotation, revocation, generation/fence/profile digest and recovery.
Emergency promotion requires distinct requestor, approver and activator,
quorum, current policy/session and change-or-incident evidence.
`ChargeTopologyAuthorizationPresentation` commits the non-refundable debit and
unique internal `TopologyAuthorizationPresentationChargeV1` before lookup.
`TopologyAuthorizationPresentationChargeId` binds request/caller, ingress and
presentation lanes, mapping identity/generation/fence/profile, budget epoch,
charge sequence and owner/boot continuity; it is non-exportable and single-use.
The separate `ConsumeTopologyAuthorizationPresentationCharge` transaction
consumes evidence, rechecks current mapping and performs lookup plus first-seen
request/outcome/issuance writes. Mapping change returns
`TopologyAuthorizationPresentationLaneChanged` before request allocation
without refund. Crash between stages leaves an orphan spent charge, retry gets
a new charge and fenced-continuity evidence is unusable; evidence/dispositions
are bounded and checkpoint-before-delete. Stage one atomically creates debit,
evidence, sequence and `ChargedAwaitingStageTwo`, or ledger saturation fails
before lookup without state.
`TopologyAuthorizationPresentationChargeLedgerCapacityV1` supplies
non-borrowable Normal/Recovery/BreakGlass hot rows, bytes, awaiting records,
checkpoint backlog, checkpoint/archive I/O, and compaction workers below
aggregate disk/work ceilings. Stage-one admission reserves its own lane's
terminalization/checkpoint work; Normal or break-glass saturation cannot block
Recovery, and an incapable adapter refuses VIT-CAP-061. The only terminal
dispositions are irreversible
`Consumed`, `MappingChanged`, `ControlledAbortAbandoned`, and
`ContinuityFencedOrphaned`; `CheckpointedCompacted` preserves the original
terminal kind and result/evidence commitment after its checkpoint. Timeout is
not a transition.
VIT-INV-061 alone owns the immutable
`TopologyAuthorizationPresentationChargeLedgerCapacityProfileV1` lineage:
stable ID, monotonic generation/epoch, canonical digest, predecessor, closed
state and expected-version activation CAS. Emergency reductions and aggregate
changes require separated approval. Every reduction of a canonical lane,
reserve, aggregate, storage, I/O, or worker field must follow Proposed ->
PendingDrain -> Active; only an overflow-safe typed proof that every field is
equal or increasing permits direct Proposed activation. Unknown, omitted,
incomparable, or mixed-schema fields require drain. A shrink stays
`PendingDrain` or rejects
until every lane's usage, awaiting charges, reservations, backlog, maintenance
obligations and protected reserve fit. Obligations never change lane, capacity
never transfers, and increases require authenticated physical disk/I/O/worker
evidence. Restore selects active state from the greatest authenticated
committed activation record rather than greatest raw generation; it never
merges maximum numeric ceilings or accepts a downgrade writer.
Every PendingDrain transition requires current
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainAuthorizationV1`,
including Normal-only drain. It binds deployment/tenant, action, exact
predecessor/successor/diff/derived coverage, policy/change/incident authority,
requestor/approvers/activator/quorum/SoD; not-before/issued/expiry, maximum
uncertainty, trusted-time profile/epoch, issuer continuity, signer/key
identity/epoch and authentication profile; nonce and idempotency. Its closed
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainAuthorizationConsumptionV1`
lifecycle is Issued, Consumed with action/request/result digests,
ExpiredUnused, or RevokedUnused. Consumption, permanent tombstone, canonical
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainActionResultV1`,
mutation, event, audit and outbox are atomic. Identical post-commit retry
returns that result with no new effect; changed bytes/digest/action returns
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainAuthorizationConflict`.
Trusted-time and continuity/key high-watermarks deny rollback, suspend,
restore, failover or key-rotation resurrection. Activation uses a separate
currently valid action authorization binding the begin-drain authorization and
consumption digests and rechecks current state; historical begin-drain validity
survives its later expiry, and revocation while draining leaves the fence safe
until fresh activation authority or separately authorized rejection.
Rejection/abandonment uses separate action-authority and audit. Unauthorized,
expired-unused, replayed, self-approved, cross-scope or substituted requests
write nothing.
Authenticated sparse replay archiving is mandatory; permanent unbounded
retention is forbidden.
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainAuthorizationReplayCheckpointV1`
and
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainAuthorizationReplayArchiveV1`
bind each sparse action/idempotency ID, request/authorization digest, terminal
lifecycle, complete result or authenticated result reference, action/profile/
scope/policy, predecessor checkpoint, encoding/key epoch and archive
commitment. Exact membership returns result or conflict; exact-set
non-membership is never inferred from a dense watermark. Missing history
returns
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainHistoricalStateUnavailable`
without execution.
One authoritative cumulative
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainAuthorizationReplayHeadV1`
per tenant/deployment binds non-wrapping sequence, predecessor/root/scope,
expected-version CAS, key epoch, publication identity and covered-row version.
Proofs use the greatest committed head plus current hot rows; individual
archives/checkpoints, stale heads and roots alone cannot prove non-membership.
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayArchivePublicationV1`
has only Staged, Verified, CommittedHead, HotRowsDeleted and OrphanGcEligible.
Immutable chunks upload and verify before one local database transaction CAS-
installs the head and deletes exact covered rows. Readers ignore staged/
verified/orphan data. Unknown external publication retains hot rows; unknown
local commit reconciles the indivisible bundle. Orphan GC requires no
committed reference or authenticated successor equivalence. No distributed
transaction is assumed.
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionGuardV1`
requires a proof for writer-authoritative head `H` to be verified outside the
database transaction, then binds it inside one local write transaction by
locking the authoritative head and exact action/idempotency key, re-reading
exactly `H`, and checking current hot state. A mismatch returns
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayHeadChanged`
without writing and restarts proof verification. Only non-membership for
unchanged `H` plus hot absence may insert the unique replay row and atomically
commit consumption/result/mutation/event/audit/outbox. Unique conflict never
permits second execution. The compactor uses the same head-first lock order.
Async replicas, followers, caches, and weak/changing snapshots cannot
authorize; unsupported adapters refuse `VIT-CAP-061`.
Canonical
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayKeyV1`
contains tenant, deployment, action kind, action ID and idempotency ID.
Action ID and idempotency ID are independently unique within tenant/deployment
scope through separate constraints that must identify the same row; kind is
bound, not a namespace. One-sided reuse is historical conflict.
Durable
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayRestartBudgetV1`
applies across one logical admission attempt and has finite automatic
head-change restarts, observed head advances, cumulative proof bytes, decode,
verification work and conservative elapsed-time bounds. Failover, crash,
cursor recreation, process or adapter retry cannot reset it. Exhaustion returns
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionContended`
without consumption or execution and is distinct from unavailable history.
Finite authenticated-admission/compaction scheduling quanta, bounded
caller-independent yield and protected Recovery capacity prevent starvation
without allowing admission to pin compaction.
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptV1`
owns the restart budget with only Active/RestartPending nonterminal and
Succeeded/HistoricalConflict/HistoricalUnavailable/Contended/
ExpiredNoExecution terminal states. One key has one nonterminal attempt;
identical requests join without another budget and changed material conflicts.
Owner workload, boot/continuity, lease generation, fencing token and CAS make
takeover exclusive while retaining all counters/deadline. Cancellation or
disconnect does not reset/delete; success co-commits with replay row/action
bundle and no-write terminals cannot later succeed.
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptCapacityV1`
bounds active/terminal rows/bytes, queues, principal attempts, takeover work,
terminalization backlog and cleanup workers by lane/deployment. Capacity is
reserved before admission, Recovery is non-borrowable, and checkpoint/link-
gated cleanup uses
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptCheckpointV1`
to bind terminal state/counters/fence/capacity release and removes no replay-
critical state.
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptCapacityLedgerV1`
atomically locks head -> key/attempt -> capacity -> profile/fence/domain,
reserves the original active/terminal/terminalization/checkpoint/cleanup/
deletion set, inserts the attempt and commits all-or-none. Identical joins have
no durable waiter and allocate no row, budget or reservation. Every transition
uses this order; success rechecks attempt ownership/fence/deadline/budget/head/
authority before co-committing replay/action state and active-to-terminal
transfer. No-write terminalization transfers atomically, and profile changes
cannot recompute original buckets.
Stable
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptCapacitySettlementId`
and immutable `...CapacitySettlementV1` settle each reservation-set leg once.
Checkpoint settles terminalization/backlog but not the envelope; physical
deletion settles envelope/cleanup/deletion. Duplicate/reordered/unknown
outcomes reconcile without double decrement, while checkpoint/archive
occupancy stays charged.
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayProofBudgetV1`
bounds bytes/entries/chunks/depth/decode/work/jobs and a durable
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayVerificationCursor`
resumes verification. After immutable chunk upload and verification, one local
database transaction commits cumulative head/cursor/exact-delete;
archive/key/chunk loss, outage, budget exhaustion or backlog saturation fails
closed under reserved Recovery maintenance capacity.
`PendingDrain` atomically installs
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainFenceV1`, binding
the active predecessor and pending successor generations/digests, affected
lanes, reduced aggregate dimensions, sequence, expected version, and
continuity. The owner derives affected lanes; aggregate reduction includes
every capable consumer lane. One predecessor has at most
one nonterminal successor/fence. Stage one must fit both active and pending
lane-specific and aggregate limits after prospective reservation or return
`TopologyAuthorizationPresentationChargeLedgerCapacityDraining` before debit
or evidence. Admission/activation lock the same capacity rows in fixed order.
Existing obligations retain completion capacity. Activation or
authorized rejection locks and consumes only the exact fence after rechecking
usage, reservations, backlog, maintenance, provisioning, and predecessor.
Competing/stale/missing/restored-unauthenticated fences and worker bypass deny;
Normal/BreakGlass draining cannot block Recovery.
Activation atomically persists
`TopologyAuthorizationPresentationChargeLedgerCapacityProfileActivationRecordV1`
with non-wrapping sequence/predecessor digest, old/new state, expected/
committed aggregate versions, transition/diff, fence consumption or
canonical-none, provisioning/begin-drain/activation-authorization digests,
owner continuity,
transaction/journal identity, encoding and integrity binding. Record/head/
supersession/activation/optional fence event/audit/idempotent result/outbox are
indivisible. Predecessor-linked authenticated
`TopologyAuthorizationPresentationChargeLedgerCapacityProfileActivationCheckpointV1`
precedes record deletion and preserves the active/pending/fence tuple,
authorization-consumption/result/time/key high-watermarks, canonical
authorization/validation-evidence digests, trusted-time interval/profile/epoch,
signer/key epochs/authentication profile and replay tombstones, plus the sparse
checkpoint/archive root, complete result or authenticated reference,
predecessor checkpoint, proof-budget profile, verification cursor,
encoding/key epoch, availability evidence, cumulative head sequence/
predecessor/root/scope/version, publication identity/state and covered-row
deletion evidence. Membership/non-membership targets the greatest committed
head plus current hot rows; individual archive, stale head, digest or
high-watermark alone is insufficient.
Install/clear helpers are uncallable. PendingDrain emits atomic
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainFenceInstalled`;
activation/rejection emits atomic
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainFenceConsumed`.
Recovery reconstructs
`TopologyAuthorizationPresentationChargeLedgerCapacityRecoveryStateV1` with
activation-selected active profile, optional pending successor/exact fence,
lineage and activation high-watermarks, authorization sparse replay archive/
checkpoint/key/cursor state, cumulative replay-head/publication high-watermarks,
canonical replay-key uniqueness state, logical-attempt restart counters/
deadline, attempt lifecycle/owner/lease/fence/capacity/checkpoint state,
reservation-set/settlement-leg high-watermarks and original-bucket balances,
fairness-scheduler state, and verified derived coverage. Late exact retry
returns the archived result, changed retry returns historical conflict, and
unavailable proof returns typed historical-state-unavailable without
execution.
Multiple-active, contradictory-record, unreachable-predecessor, or
pending/fence half-state, activation gap/fork/reorder/duplicate, active-row
disagreement, missing checkpoint, or high-watermark rollback fails closed.
`TopologyAuthorizationRequestRateBudgetV1` charges exactly once for every
first-seen canonical request ID/digest and binds that charge to monotonic
`TopologyAuthorizationRequestSequence`. Exact retries charge presentation rate
again but reuse the request charge, sequence, and outcome. Concurrent identical
presentations each charge presentation rate but serialize to one request
charge/sequence/outcome; changed-digest reuse charges presentation rate and
rejects without a second request charge. Only successful allocation also gets
`AuthorizationIssuanceSequence`. `TopologyAuthorizationPrincipalBudgetKey` binds the
authenticated principal, issuing-authority lineage and class. Every layer must
admit and caller identity splitting never widens an aggregate ceiling.
`Normal`, `Recovery`, and
`BreakGlass` have separate counters and rate ceilings. A small per-deployment
break-glass reserve and recovery-processing lane are non-borrowable in either
direction: normal saturation cannot starve emergency repair, while break-glass
floods cannot consume normal capacity or suppress revocation/recovery.
Break-glass has no exemption from trusted time, quorum/SoD, canonical receipt,
single consumption, deadline CAS, replay checkpoint, or unavailable-history
denial. Each successful allocation binds both sequences into the receipt. On
first-seen success, the exact committed presentation-charge evidence is
consumed while the request charge, request-sequence allocation, quota validation,
admission/outstanding counter and reserve mutations,
preserved `TopologyAuthorizationOriginalQuotaClaimSetV1`,
`TopologyAuthorizationOutstandingReservation` creation, sequence allocation,
canonical receipt, request-digest-bound idempotent result, and issuance outbox
are one VIT-INV-061 local atomic transaction. A first-seen denial commits its
request sequence, one request-rate charge, caller/class binding and typed
idempotent denial; it creates no admission token, reservation, authorization
issuance sequence, receipt, or outbox, and neither rate charge is refunded.
`SettleTopologyAuthorizationOutstandingReservation` transitions
`OutstandingReserved` to `OutstandingReleased` exactly once using a stable
`ReservationSettlementId` and authenticated receipt-specific terminal-evidence
digest. The reservation embeds the original deployment, issuer/class,
principal/authority key, budget epochs, class, reserve source, units, and
quantities, and settlement atomically decrements those original counters rather
than recomputed current-policy buckets. Issuer-lineage revocation or
supersession blocks new grants but cannot release an issued receipt that
remains consumable before immutable `commit_before`. Release requires
consumer-authenticated consumption, conservative expiry beyond that deadline,
consumer-authenticated definitely-not-committed or permanently-unresolved
state, or a receipt-specific VIT-INV-060 revocation tombstone proven by
`TopologyAuthorizationConsumerTerminalReceiptV1`. Immediate individual
revocation uses `TopologyAuthorizationReceiptRevocationIntentV1`; VIT-INV-060
serializes its consumer-side fence/tombstone against consumption and emits the
terminal receipt. The envelope canonically binds deployment, consumer owner
partition/generation/fence, authorization/issuance/receipt/optional-intent,
closed outcome, result version/sequence, tombstone/time, sender/key/profile,
message/idempotency ID and outbox sequence. Outcomes are
`RevokedBeforeConsumption`, `AlreadyConsumed`, `Expired`,
`DefinitelyNotCommitted`, or `PermanentlyUnresolved`.
`TopologyAuthorizationConsumerDispositionV1` contains either
`Terminal(TopologyAuthorizationConsumerTerminalOutcomeV1)` or
`Reconciling(TopologyAuthorizationConsumerReconciliationEvidenceV1)`.
Reconciliation emits a separate
`TopologyAuthorizationConsumerReconciliationReceiptV1` and may later advance
to terminal under a greater result/outbox sequence.
`SettleTopologyAuthorizationOutstandingReservation` accepts only
`TopologyAuthorizationConsumerTerminalReceiptV1`; disposition and
reconciliation types are not settlement arguments. VIT-INV-060 has sender-only
authentication and VIT-INV-061 verify-only credentials. Incomplete/open/
conflicting/rolled-back evidence and reconciliation retain capacity.
VIT-INV-061 cannot manufacture this evidence. Timeout,
cancellation, disconnect, unknown response, retry, replay, lineage change,
compaction, or a lost revocation result never releases capacity; duplicate or
reordered settlement cannot partially decrement or decrement twice.
VIT-INV-061 keeps exact denial replay through the frozen horizon, then commits
authenticated predecessor-linked
`TopologyAuthorizationRequestReplayCheckpointV1` over request sequence/range,
request/caller/class/request-rate-charge/outcome, success link, archive, counter, schema/
algorithm and key evidence before deleting denied rows. A late compacted denial
is historical; missing proof returns
`TopologyAuthorizationHistoricalStateUnavailable`, never reevaluation. Request
rows/bytes, checkpoint backlog, archive proof bytes/depth/work, decode
allocation, jobs and compaction latency are bounded.
Both
VIT-INV-061 issuance results and VIT-INV-060 consumption/expiry/deadline results
remain exactly replayable in hot storage for the frozen horizon. Each owner
then compacts only its own state by atomically installing authenticated
predecessor-linked `TopologyAuthorizationReplayCheckpointV1` before deleting
covered hot rows. The
checkpoint commits to the canonical request/mutation/receipt terminal-state
set, typed-result archive, counters, schema/algorithm, and signing key epoch.

VIT-INV-061 owns complete allocation history and may advance a dense issued-
through watermark. VIT-INV-060 sees only presented receipts, so its checkpoint
is a sparse set commitment by default. Dense
`ConsumerCompactionEligibleThrough` requires an authenticated
`TopologyAuthorizationIssuedRangeManifestV1` binding issuer lineage/fence/key,
exact range, ordered issued sequences/receipt digests, every `commit_before`,
maximum deadline/uncertainty, predecessor digest, and authentication profile.
The authenticated root binds total range/entry/chunk counts, ordered chunk-root
digest and terminal marker. Larger ranges use predecessor-linked
`TopologyAuthorizationIssuedRangeChunkV1`; the frozen profile limits header and
chunk encoded bytes, entries and chunks per manifest, entries per chunk,
canonical decode allocations, verification work per step/job, proof depth and
roots/chunks per job. These limits are
`TopologyAuthorizationRangeProofBudgetV1`. A larger range uses predecessor-
linked successor roots. A durable
`TopologyAuthorizationRangeVerificationCursor` permits incremental progress
without resetting lineage or work accounting. Limits are checked before entry
allocation. Partial, truncated, cyclic, reordered, duplicated, overlapping,
substituted, mixed-profile or over-budget chains cannot advance dense
eligibility.
The consumer also proves with conservative trusted time that the exact replay
horizon and every deadline passed, and that each locally known member is
terminal or `TopologyAuthorizationPermanentlyUnresolved`. The manifest is
evidence only, never cross-owner mutation authority. Missing, forged,
incomplete, duplicate, overlapping, or stale-fence evidence leaves the consumer
sparse.

An issuer sequence at or below the issuer watermark, a consumer member in its
sparse commitment, or a sequence covered by valid consumer eligibility means
historical, never absent. A first presentation after compaction is expired/
historical.
Within the exact horizon, replay returns the original typed outcome. Later, an
authenticated archive proof may return it; missing/corrupt archive,
membership/non-membership proof, checkpoint predecessor, or key yields
`TopologyAuthorizationHistoricalStateUnavailable` and blocks affected
consumption and ambiguous-key issuance. It never permits reissue or inference
of non-consumption. Checkpoint coalescing/key rotation preserve the authenticated
predecessor and issuer-dense/consumer-sparse-or-eligible-dense meaning. Restore/
import merge the greatest request/issuance sequences, denial-request/issuance
checkpoint digests and high-watermarks, applicable sparse commitment, range
manifest and key epoch before serving.
Backlog saturation fails closed before allocation, and hot/checkpoint/archive/
proof-index/manifest/chunk bytes and rows, denied-request rows/bytes, denial
checkpoint lag, archive proof/decode/work/jobs, layered outstanding counts,
presentation-rate saturation, request-rate charges, reservation-settlement lag,
verification work/depth/cursor age, oldest
uncompacted age, proof availability and quota/backlog thresholds are measured
and alerted.

The receipt is profile-discriminated. `OrchestratorAttestedFencedLease` requires
the exact action-claim ID/digest/expiry fields and canonical-none hardware-proof
fields. `HardwareAttestedKey` requires current hardware proof fields and
canonical-none action-claim fields. Mixed, missing, or inapplicable field
combinations reject. Break-glass issuance additionally comes from an
independently recoverable authority and binds reason, narrow scope, duration,
incident linkage, accountable owner, and retrospective-review deadline.
VIT-INV-060 authenticates the receipt and atomically consumes it, its local
replay tombstone, the applicable workload proof, successor CAS, and fence
outbox. Receipt absence, issuer/topology-owner collision, reuse, self-approval,
stale-at-issuance evidence, manifest substitution, mixed profile fields, or
expiry returns `TopologyMutationAuthorizationBlocked`. The residual risk of
issuance-time linearization is explicit: compromised credentials can retain an
already issued exact grant for no longer than its frozen class ceiling (at most
sixty seconds for break-glass), and only while the trusted-time proof remains
valid and before its single consumption; compromise blocks later issuance.

The handoff state is the exclusive source selector: before commit the compiled
singleton is authoritative and the row is inert; after commit `VIT-INV-060` is
authoritative and the compiled singleton is provenance only. They are never
simultaneously authoritative. Recovery replays catalog rollout/local
convergence/initialization/handoff boundaries and never infers `Committed`.

The rollout process manager reads an authenticated
`CurrentPlacementTopologyReceiptV1`, seals its exact topology generation and
manifest digest into the rollout manifest, and later revalidates that receipt.
Every receipt binds the verifier request nonce/challenge, monotonic
topology-receipt sequence, topology and placement generations, canonical
manifest digest, member tombstone/fence state, topology-owner identity and
fencing token, issued-at, expiry, maximum time uncertainty, signer/key epoch,
and exact `CatalogReceiptAuthenticationV1` profile. An authenticated old
receipt is not current authority.
It cannot issue topology generations or placement fences. A topology change
blocks the affected rollout and requires a new rollout manifest; a rollout
message cannot make topology current. Search, discovery, orchestration APIs,
and observed pods/nodes are evidence inputs only, never topology authority.

After handoff commit, `VIT-LAW-007@g02` independently re-reads a current
authenticated topology receipt during local admission, readiness, dispatch,
and transmission start. The receipt's deployment, service role, enforcement
partition, placement identity/generation, manifest digest, and topology
generation must match the local owner. Each local admission owner durably
ratchets `LastObservedTopologyGeneration` and
`LastObservedTopologyReceiptSequence`; lower, repeated under a new challenge,
wrong-nonce, expired, excessive-uncertainty, or signer/fence-stale receipts
fail even when cryptographically valid. Readiness binds those fields into
`OnlineWorkloadFreshnessProofV1`; dispatch and transmission start obtain a
fresh response or operate only inside the maximum currentness window frozen at
`0.140.1`. Unavailability or mismatch blocks even
when the latest catalog rollout is already complete and an old placement's
fence message was suppressed; no new catalog rollout is needed to make that
stale placement unsafe.

## Durable Distributed Rollout

`0.18.3` introduces `VIT-INV-059`/`VIT-LAW-008` and the durable
`LawCatalogRolloutRootRow`; `0.18.4` uses it for the first real successor.
`LawCatalogRolloutId` is globally unique. Each catalog lineage also owns a
monotonic `ActiveRolloutGeneration`. Candidate creation uses expected-version
CAS to claim the next generation, so at most one rollout for that lineage is
current and nonterminal. Its immutable
`CatalogPlacementManifestV1` binds the candidate catalog ID/epoch/envelope
digest, predecessor epoch/digest, topology generation, sorted required local
owner keys, required binary capability and semantic-realization profiles,
activation policy, deadlines, global/local owner fences, and manifest digest.
Changing membership or any bound requirement creates a successor manifest
generation; an in-flight manifest is never edited.

Both messages crossing the rollout/global-owner boundary are first-class
authenticated receipts under the selected exact
`CatalogReceiptAuthenticationV1` variant:

- `CatalogActivationAuthorizationReceipt` binds authorization ID, rollout ID/
  generation, manifest digest, catalog ID/epoch/envelope digest, predecessor
  epoch/digest, expected global lineage version, distrust/revocation epoch,
  sender owner/fence, signer/key epoch, idempotency ID, and replay tombstone;
- `CatalogGlobalActivationResultReceipt` binds that authorization and request
  digest, the authoritative activated/revoked/blocked outcome, prior and
  resulting global CAS versions, resulting catalog/distrust/revocation state,
  global-owner fence, signer/key epoch, idempotency ID, and replay tombstone.

The global owner verifies the first before its CAS; the rollout owner verifies
the second before changing rollout state. A transport-authenticated message,
untyped outbox row, copied authorization, unauthenticated global result, or
receiver-forgeable MAC never advances either owner.

The closed rollout states are:

```text
Candidate -> Preparing -> ActivationAuthorized -> GloballyActivated
                                                 -> Converging -> Completed
               \-> Blocked(source phase)
Candidate/Preparing/Blocked(pre-authorization) -> Abandoned
stale or losing Candidate/Preparing/Blocked(pre-authorization) -> Superseded
any nonterminal state or Completed -> Revoked
```

`Blocked` records its source phase and may resume only that phase after the same
manifest's contradiction or availability issue is reconciled.
`ActivationAuthorized` is an irreversible authorization-commit state. Entering
it atomically persists the canonical authenticated activation authorization and
its outbox intent, pins `ActiveRolloutGeneration`, and forbids abandonment,
supersession, manifest replacement, or ordinary successor creation. The rollout
may reach `GloballyActivated`, remain `Blocked` awaiting/reconciling the global
result, or be revoked; delayed delivery cannot reopen `Preparing`. After
authorization or global activation, abandonment is forbidden. `Abandoned` is an explicit pre-authorization
operator cancellation. `Superseded` is the permanent losing-candidate state;
`Revoked`, `Abandoned`, and `Superseded` are terminal.

Creating an ordinary successor is allowed only when the current rollout is
`Completed`, `Revoked`, `Abandoned`, or `Superseded`. An explicit pre-authorization
supersession CAS may replace `Candidate`, `Preparing`, or pre-authorization
`Blocked` whose source phase predates authorization, atomically advance
`ActiveRolloutGeneration`, and tombstone the old rollout. An
`ActivationAuthorized`, globally activated, or converging rollout pins the
generation and must resolve globally, complete, or be revoked. Local inboxes
and the global owner accept prepare, activation-
authorization, convergence, and revocation messages only from the exact current
rollout generation. Late receipts or authorization from a losing generation
are permanently rejected and retained as audit evidence.

The normal protocol is an at-least-once process manager, not a distributed
transaction:

1. candidate creation seals the catalog/placement manifest;
2. the rollout root enters `Preparing` and transactionally appends one outbox
   intent per required placement;
3. local inbox processing verifies identity, placement/fence, binary
   capability, semantic set, catalog bytes, predecessor local epoch, and time,
   then atomically records one idempotent `CatalogPrepareReceipt`;
4. the rollout root admits receipts by exact identity/authenticator and, only
   when policy is satisfied, atomically enters `ActivationAuthorized`, stores
   one canonical `CatalogActivationAuthorizationReceipt`, and commits its
   outbox message;
5. `VIT-INV-057` consumes that receipt in its own expected-version activation
   CAS and emits one authenticated
   `CatalogGlobalActivationResultReceipt`;
6. the rollout root authenticates and consumes that result receipt, enters
   `GloballyActivated`, emits
   activation deliveries, and enters `Converging`;
7. each `VIT-INV-058` owner admits the active global epoch and emits one
   `CatalogConvergenceReceipt`; and
8. the root reaches `Completed` only after every policy-required current
   placement receipt is present and freshly revalidated.

`0.18.3–0.140.6` supports `AllRequired`: every placement in the sealed current
manifest must prepare and converge. A `FencedQuorum` profile is unsupported
unless `0.140.6` explicitly selects it after proving that every unprepared
placement is durably fenced before global activation and cannot regain
readiness from cached state. A numeric quorum without that fencing is invalid.

Join, leave, replacement, service-role change, region movement, partition
split/merge, and topology-generation changes fence the old placement
generation and block an affected in-flight rollout. Reconciliation seals a new
manifest or completes only when the original manifest is still exactly current.
No receipt crosses rollout, topology, placement, workload, boot/continuity,
binary, semantic, catalog, predecessor, or fence generations.

Revocation and emergency distrust bypass candidate preparation. The global
owner advances distrust first and transactionally emits high-priority
revocation deliveries. Connected local owners ratchet immediately. An
unreachable placement cannot perform the required current-global-authority
recheck and is therefore unready; cached admission is insufficient. Revocation
reconciliation continues until every current placement has a receipt or is
durably fenced. Missing, late, duplicate, or contradictory receipts move the
root to `Blocked`, retain conservative readiness, and trigger a bounded
deadline escalation with operator-visible evidence.
For an `ActivationAuthorized` rollout, activate versus revoke is serialized by
the global owner over the exact rollout/authorization ID, generation, candidate
epoch/digest, expected lineage version, and distrust epoch. Revocation either
tombstones the not-yet-activated authorization or follows an activation win and
revokes the activated catalog; the rollout remains pinned until it consumes the
global result. A delayed authorization cannot bypass the global tombstone.

Recovery replays transactional outbox/inbox state, re-reads the global owner,
current topology/placement manifest, and every local owner, and resumes from
durable authenticated receipts. It also reconciles action-claim issuance/
consumption uncertainty against the external issuer and local co-transactional
tombstone without reissue or reconsumption. Crash injection covers before and after manifest seal,
prepare outbox commit, local receipt commit, root receipt admission, activation
authorization, global CAS, global receipt delivery, local convergence, final
receipt admission, completion, topology change, revocation, abandonment,
supersession, and
every response-loss boundary. Duplicate/reordered delivery is idempotent;
ambiguous state never invents preparation, activation, convergence, or
revocation completion.
The first-successor suite also races two candidates through preparation, lets
one claim `ActivationAuthorized`, loses the global response, and restarts both
coordinators. Exactly one remains pinned and reconciles the global outcome; the
other becomes permanently `Superseded` before authorization, and none of its
late messages can change global or local authority. Separate tests race
authorization commit against abandon/supersede, delayed authorization against
revocation, and coordinator failover before/after authorization/outbox commit.

## Project-Owned Artifact Verification

`0.18.3` implements one `no_std` verification core used by startup, restore,
import, local admission, and the hosted
`vitheim-law-catalog-verify` release tool. The release tool must decode the
binary artifact through the canonical Rust codec and call that same core; CI
does not parse key/value text or accept field-shaped comments as evidence.
For every non-planned activation milestone,
`scripts/check_law_active_catalogs.sh` invokes the tool with the expected
catalog ID, epoch, activation floor, exact scope, profile, and actual
predecessor artifact.

The verifier:

1. rejects noncanonical/trailing/duplicate/unknown bytes and resource-bound
   violations;
2. recomputes payload and envelope digests from decoded typed values;
3. reconstructs and verifies the complete generation tuple ancestry against
   the compiled project generation registry;
4. compares the successor's predecessor digest with the predecessor artifact's
   recomputed envelope digest;
5. enforces every profile- and validity-specific `none`/required field rule;
6. compares `CompiledCatalog` with the release-compiled expected envelope
   digest, or verifies `SignedCatalog` with the separately admitted root,
   signature profile, key ID, and root epoch;
7. confirms the exact product, edition, compatibility, activation-floor, and
   build context supplied by the caller; and
8. returns a typed verified-catalog value or a typed fail-closed reason—never a
   partially trusted decoded structure.

Golden bytes and digests, bit flips in every field, truncation/trailing data,
tuple reorder/omission/substitution, forged self-consistent digests, wrong
predecessor artifact, profile-field confusion, compiled-digest mismatch,
invalid signature/root epoch, wrong scope, rollback, and bounded-time boundary
tests are mandatory. The CLI/runtime equivalence test feeds identical bytes and
context to both entry points and requires the same typed result.

The first catalog has a deliberately narrow bootstrap: its
`CompiledCatalog` payload/envelope, compiled expected envelope digest, and
`VIT-LAW-007@g01` realization are embedded in the reviewed artifact. Provenance
establishes the initial global owner row, the static single-placement topology,
and each local admission row. Mutable
state cannot self-admit the law that validates it. The same bootstrap seeds the
empty rollout root and compiled `VIT-LAW-008@g01` realization, so the first
`0.18.4` successor is governed without circular self-admission. After that
seed, every activation, trust-profile transition, rollout, local admission, and
emergency distrust follows `VIT-INV-057`/`VIT-INV-058`/`VIT-INV-059` and
`VIT-LAW-007`/`VIT-LAW-008`; a transition to `SignedCatalog` additionally
requires the separately provisioned trust-root ceremony.

## Planned Runtime Catalog Schedule

The frontier column is compact notation for a complete ancestry closure. For
example, `VIT-LAW-001@g03` requires tuples g01, g02, and g03. Release tooling
materializes and hashes the full set. Each row's catalog remains applicable
from its activation floor until the next row is explicitly activated; the last
row remains applicable until an explicitly reviewed successor is added. The
artifact path and project-owned cryptographic verification become mandatory
when the activation milestone leaves planned status.

| Epoch | Catalog ID | Activation floor | Profile | Predecessor envelope contract | Required law frontiers | Canonical artifact |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | VIT-LAWCAT-ACTIVE-e001-v1 | `0.18.3` | CompiledCatalog | none | VIT-LAW-001@g02, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-005@g04, VIT-LAW-006@g01, VIT-LAW-007@g01, VIT-LAW-008@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e001-v1.catalog` |
| 2 | VIT-LAWCAT-ACTIVE-e002-v1 | `0.18.4` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e001-envelope-v1 | VIT-LAW-001@g02, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g01, VIT-LAW-007@g01, VIT-LAW-008@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e002-v1.catalog` |
| 3 | VIT-LAWCAT-ACTIVE-e003-v1 | `0.51.1` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e002-envelope-v1 | VIT-LAW-001@g03, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g02, VIT-LAW-007@g01, VIT-LAW-008@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e003-v1.catalog` |
| 4 | VIT-LAWCAT-ACTIVE-e004-v1 | `0.52.0` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e003-envelope-v1 | VIT-LAW-001@g04, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g03, VIT-LAW-007@g01, VIT-LAW-008@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e004-v1.catalog` |
| 5 | VIT-LAWCAT-ACTIVE-e005-v1 | `0.52.1` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e004-envelope-v1 | VIT-LAW-001@g05, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g04, VIT-LAW-007@g01, VIT-LAW-008@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e005-v1.catalog` |
| 6 | VIT-LAWCAT-ACTIVE-e006-v1 | `0.53.0` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e005-envelope-v1 | VIT-LAW-001@g06, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g05, VIT-LAW-007@g01, VIT-LAW-008@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e006-v1.catalog` |
| 7 | VIT-LAWCAT-ACTIVE-e007-v1 | `0.53.1` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e006-envelope-v1 | VIT-LAW-001@g07, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g06, VIT-LAW-007@g01, VIT-LAW-008@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e007-v1.catalog` |
| 8 | VIT-LAWCAT-ACTIVE-e008-v1 | `0.55.0` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e007-envelope-v1 | VIT-LAW-001@g08, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g07, VIT-LAW-007@g01, VIT-LAW-008@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e008-v1.catalog` |
| 9 | VIT-LAWCAT-ACTIVE-e009-v1 | `0.56.0` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e008-envelope-v1 | VIT-LAW-001@g09, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g08, VIT-LAW-007@g01, VIT-LAW-008@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e009-v1.catalog` |
| 10 | VIT-LAWCAT-ACTIVE-e010-v1 | `0.57.0` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e009-envelope-v1 | VIT-LAW-001@g10, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g09, VIT-LAW-007@g01, VIT-LAW-008@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e010-v1.catalog` |
| 11 | VIT-LAWCAT-ACTIVE-e011-v1 | `0.59.0` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e010-envelope-v1 | VIT-LAW-001@g11, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g10, VIT-LAW-007@g01, VIT-LAW-008@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e011-v1.catalog` |
| 12 | VIT-LAWCAT-ACTIVE-e012-v1 | `0.141.0` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e011-envelope-v1 | VIT-LAW-001@g11, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g10, VIT-LAW-007@g02, VIT-LAW-008@g02 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e012-v1.catalog` |

`0.18.3` delivers the canonical codec, shared verification core, CLI, first
compiled artifact, exact local owner identity, split global/rollout/local
owners, durable process manager, authenticated authorization/result receipts,
external action-claim authority port plus local atomic consumption, and
trusted-time interface. `0.18.4` verifies the first actual predecessor
transition through every rollout/control-receipt/claim state and crash boundary.
`0.19.0` binds verified envelope digests, rollout/control receipts/replay
tombstones, claim high-watermarks/outcomes, and local identity/ratchets into
checkpoints.
`0.21.0–0.22.0` negotiate and destructively conform storage without making it a
trust root. `0.29.0–0.30.0` prove migration/import with the real verifier.
`0.140.1` freezes compiled versus signed profile, signature suite/root ceremony,
time source, maximum uncertainty, workload-identity/claim proof, receipt
authentication, and sender/verifier MAC roles. `0.140.2` freezes separate
global, rollout-root, future topology, external-issuer evidence, and local
consumption placement. `0.140.6` freezes `AllRequired` or a fully fenced quorum,
topology evolution, distribution, failover, revocation, claim uncertainty, time
loss, and recovery. `0.141.0` hands the compiled static topology to
`VIT-INV-060` without circular authority: epoch 12 is activated and converged
under `VIT-LAW-008@g01`; only then does locally admitted generation 2 authorize
initialization, exact verification, and the one-time handoff CAS. Epoch 12 also
activates `VIT-LAW-007@g02`, so current topology independently gates normal
admission, readiness, dispatch, and transmission start after commit. Each
topology mutation requires a bounded VIT-INV-061-issued authorization distinct
from workload authentication; VIT-INV-060 cannot issue it and consumes it
without claiming external-epoch atomicity. Challenge/sequence/expiry receipt
fields and local observation ratchets make “current topology” replay safe.
`0.142.0–0.143.0` prove split service
and HA behavior. `0.145.0` proves backup/restore cannot clone a local
owner, invent a receipt, resurrect topology, or roll back catalog/validity
state. Phase O and
`1.0.0` require zero unresolved rollout receipts, identity clones, coverage
gaps, overlaps, future tuples, incomplete closures, unrealized semantics,
text-only artifact checks, or envelope fields outside cryptographic
verification.
