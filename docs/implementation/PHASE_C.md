# Phase C — Storage Portability

Scope: `0.21.0–0.30.0`. Domain code sees semantic ports only. Each hosted
adapter requires an independently approved implementation-admission record
before code begins. The default `1.0.0` target is in-memory for semantics,
SQLite for single-node, and PostgreSQL for HA; MySQL, MongoDB, and SurrealDB are
experimental unless `0.140.2` promotes an evidenced profile.
Every database profile must implement every applicable negotiated `0.18.2`
`AtomicWorkCommitBundle` variant and every other mandatory semantic port claimed
for that profile, or fail startup capability negotiation. No adapter may
emulate a missing atomic component with a later best-effort write. A claimed
grant profile must co-locate lineage owner, `GrantRedemptionGuard`, and effect
work bundle in one local transaction domain; a claimed quota profile must
co-locate every claim set with its work bundle, and any wider limit must consume
a fenced hierarchical capacity lease already allocated to that local partition.
Every privileged dispatch profile must co-locate its complete
`DispatchAuthorityFenceSet`, persisted `DispatchTransmissionWindow`, and
`ClaimTransmissionStart` state. Its CAS must bind one globally unique claim ID,
exact worker instance and lease generation/fence, receipt/effect attempt,
service audience, and permit digest, while persisting no reconstructable permit
material. The selected production profile places claim plus provider socket in
one trusted `TransmissionExecutor`; queues/RPC carry immutable authenticated
instructions/status and never permit authority. Its `ProviderExecutionProfile`
must prove no master-key/general write access, claim-bound scoped secret
operations, least-privilege credentials, bounded executor trust domains, and
deny-by-default destination/TLS/DNS/redirect egress without a general proxy.
Co-locate the authoritative profile-lineage generation and never-reused profile,
provider-account, credential-version, and broker-policy epochs with the start-
claim guard; claim and handle redemption recheck them and restore cannot roll
them back. Persist typed profile lifecycle proposals/approvals/tombstones and
atomically co-locate active-generation updates with their current-fence checks.
Persist asynchronous credential-rotation state, provider evidence, unknown
outcomes, overlap/escalation deadlines, atomic local successor activation, one
credential-lineage owner, co-located rotation guard, rotation/successor/
idempotency/digest identity, authorized takeover inventory, typed orphan state,
late-callback fences, and provider-credential-count quota encumbrance.
Co-locate the fresh `ProviderCredentialCapabilitySnapshot` and never-reused
local capability epoch with the claim guard; an authenticated reconciler, never
the dispatch transaction, observes provider permission/policy drift. Persist
raw-policy/normalized-AST/evaluator/policy-language/comparison/explanation
evidence, reduced drift, whole-credential quarantine, affected-execution
incident references, and the quarantine-to-first-use fence. Persist the
authoritative evaluator lineage/generation, signed binary/corpus admission,
provider/language compatibility, never-reused evaluator epoch, reevaluation
state, and startup/readiness compatibility. Persist the capability owner's
investigation/remediation/replacement-or-revalidation/resolution states,
strong-revision/consistency/resolver-separation evidence, new capability
generation, and permanent pre-resolution tombstones. Persist the independent
remediation profile/credential lineage/approvals/audit/epochs/egress/security-
cleanup quota and rotation/takeover-only guard separately from business
credentials. The
negotiated credential-operation profile must distinguish non-
exportable signing/mTLS/HSM operations from brokered bearer transmission. The
bearer broker joins the executor TCB and owns header serialization, redirects,
TLS, claim, and socket; credential-exporting general connectors are unsupported.
Every current-target profile must also co-locate
the target owner, authoritative `DispatchTargetFence`, and effect work bundle;
same-aggregate targets use the expected stream version/digest, while different-
aggregate targets use a fence row updated atomically with target events. Remote,
cross-shard, or projection-only current-target semantics are not a capability.
Provider-owned mutable targets use the separate negotiated
`RemoteTargetConcurrencyProfile`; conditional provider mutation is post-commit
I/O and never satisfies or weakens local target-fence placement. A claimed
unconditional profile must co-locate the one-owner
`RemoteMutationExceptionGuard`, effect work bundle, and provider-capability/
policy epoch rows so dispatch can claim an attempt without advancing the
exception stream.
Cross-shard/region distributed work transactions are not a capability. Capacity
movement uses the receipt-idempotent, at-least-once-delivered
`QuotaCapacityTransferState` process manager, not a distributed exactly-once
claim. All adapters use the canonical composite acquisition order and bounded
identity-preserving deadlock retry contract. Capacity-transfer persistence
freezes accounting owner, hierarchy root/parent lease, period, work/recovery
lane, capacity class, residency/region, and authorization lineage. Existing
capacity is class-immutable. Only future unallocated parent capacity can be
resized through a versioned, fenced `QuotaCapacityPolicy`. Each policy lineage
owns exactly one parent and must co-locate its stream head, parent-capacity
ledger, and independently governed floor-set row for atomic activation.
Floor management requires its own capability/history, operational fences,
durable versioned platform-floor ratchet, and cross-command separation from
policy activation. Ratchet entries use the full typed accounting/kind/unit/
period/class/lane/region/settlement key and migrations preserve complete key-set
conservation without overflow. Multi-parent changes use a hierarchy-root-owned
canonical membership manifest, root epoch CAS, one active rollout generation,
complete prepared-receipt set, fresh local post-finalization parent activation
CAS, atomic successor supersession, and conservative process-manager rollout,
not a distributed transaction. Cancellation after any preparation creates one
complete root-owned recovery successor over actual parent limits, with
idempotent restore-safe receipts, conservative parents, no independent restore,
current-state/authority rechecks, and deadline escalation. Each delayed transfer transition
rechecks current local tenant/principal/policy epochs.

## `0.21.0` — Storage Capability Negotiation

Status: planned.

Setup: derive mandatory invariant capabilities from every declaration-resolved
ownership/lifecycle row in `docs/INVARIANT_OWNERSHIP.md`, then classify
mandatory/optional `VIT-CAP-*` capabilities,
and require canonical `LawGenerationManifestV1` codec, resolved-generation,
semantic-contract, digest persistence/readback, and digest-verification
capabilities for every law generation effective at the adapter milestone.
Also require `LawManifestAdmissionSetV1` catalog ID/epoch/digest/trust-profile
persistence and independent admission, plus exhaustive
`LawSemanticRealization` support for every tuple in each claimed generation's
predecessor closure. Require `VIT-CAP-057` for the one global catalog-lineage
owner, expected-version activation CAS, and predecessor/successor/revocation/
emergency-distrust state. Separately require `VIT-CAP-058` for each local
catalog/distrust ratchet, admitted trusted-time interval and uncertainty,
continuity/boot identity, last-observed lower bound, expiry tombstone, and
startup/restore enforcement. The local capability uses exactly one canonical
deployment/region/service-role/enforcement-partition/placement-generation key
and binds workload identity, boot/continuity ID, binary/semantic digests, and
local fence. Require `VIT-CAP-059` for rollout ID/root, immutable catalog/
placement/topology manifest, closed state, transactional outbox/inbox,
prepare/activation/convergence/revocation receipts, irreversible
`ActivationAuthorized` state, atomic authorization-receipt/outbox bundle,
pinned active generation, authenticated global-result receipt, replay
tombstones, external action-claim issuance evidence, co-transactional local
consumption tombstone/outcome, typed uncertainty, deadlines, reconciliation,
and `AllRequired` policy. Preserve the closed operation-scope classification,
bounded readiness-freshness proof fields, and tombstone-first replay outcome
without allowing a historical result to become current authority. The future
`VIT-CAP-060` contract separately persists
the closed uninitialized/dormant/committed handoff selector and exact completed-
rollout/artifact/manifest/local-admission bindings, independently issued
`TopologyMutationAuthorizationReceiptV1` canonical bytes/digest and local
consumption tombstone, mutation class, `issued_at`, immutable `commit_before`,
maximum uncertainty, trusted-time profile ID/epoch, issuer continuity ID,
profile-discriminated workload proof, consumer last trusted lower bound/time-
profile epoch/continuity ID, permanent expired-receipt tombstone, atomic
successor/fence outbox, monotonic
topology-receipt sequence, and receipt challenge/generation/manifest/tombstone/
owner-fence/time/uncertainty/signer fields. VIT-CAP-058 persists the greatest
locally observed topology generation and receipt sequence. Future
`VIT-CAP-061` separately persists authorization lineage/generation,
proposal/quorum/SoD, issuance request/unique mutation/manifest, immutable
receipt bytes/digest, mutation class, `issued_at`, `commit_before`, uncertainty
ceiling, trusted-time profile/epoch, issuer continuity, revocation/supersession,
typed unknown response, independent break-glass authority, and issuance/time
high-watermarks/tombstones. Backup and restore merge every monotonic issuer and
consumer time field with the greatest externally retained/local value and can
never reset continuity, erase expiry, or extend a deadline. No adapter may infer
initialization or completion. Negotiate the planning
superset separately from immutable active payload/envelope support. Exact
`CompiledCatalog` and `SignedCatalog` capabilities report independently; no
combined capability is valid. The adapter consumes only the typed result of the
shared `LawCatalogVerifierV1`, never decoded field presence. Payload/envelope
codecs cover activation floor, exact scope, validity/maximum uncertainty,
signer/root-epoch, revocation, and successor fields,
evidence version, startup
probe, downgrade policy, transaction-domain placement/topology compatibility,
authority-fence and target-fence freshness/co-location, capacity-transfer
receipt/delivery and immutable-classification semantics, remote-target provider
capability/validator evidence, exception-guard/provider-capability-epoch
co-location, transmission-window/start-claim/time capability, one-parent policy-
owner/parent-ledger/floor-set activation atomicity, unique claimant/lease-bound
one-time permit return, floor-governance/cross-command-separation capability,
platform-floor profile/admission/ratchet semantics, root-manifest complete-
membership rollout plus active-generation successor semantics and fresh local
parent activation, typed floor-key migration, trusted `TransmissionExecutor`/
instruction-only split protocol, revocable `ProviderExecutionProfile` lineage/
epoch guards, profile-governance/approval/tombstone state, asynchronous
rotation/evidence/unknown/deadline state, credential-capability snapshot/epoch/
reconciler, credential-lineage/rotation-guard/takeover/orphan/count-quota state,
semantic permission-evaluator/evidence/result/reduced/quarantine/incident state,
evaluator-lineage/admission/epoch/reevaluation/startup state, owned quarantine-
resolution/new-generation/tombstone evidence, independent remediation lineage/
approval/audit/quota or manual-only recovery state, remediation bootstrap/
recovery ceremony/quorum/channel/KMS-independence/epoch state, evaluator
re-evaluation queue/job-generation/cursor/lease/fair-share/provider-rate/
cleanup-lane state, evaluator invalidation-campaign root, capability-owner
source/topology manifest, monotonic outbox sequence/high-watermark, exact inbox
receipt/delivery barrier/blocked state, authoritative membership journal/shard-
generation/high-watermark, fenced move, campaign-shard scan/cursor/single-
receipt/final-barrier/materialization/reconciliation/stuck state,
explicit credential-operation/TCB placement, cancellation-recovery
successor semantics, bounded
deadlock-retry semantics, and fail-closed behavior.

Freeze the canonical `TopologyMutationAuthorizationReceiptV1` codec here. Its
domain-separated, length-prefixed authentication preimage includes schema
version; authorization lineage/generation and stable request ID; mutation ID
and class; monotonic `AuthorizationIssuanceSequence`; deployment and expected
topology generation; canonical successor-manifest digest; principal/session/
delegation/role/policy/change/incident/
emergency/approval bindings; `issued_at`; `commit_before`; maximum uncertainty;
trusted-time profile ID/epoch; issuer continuity ID; issuer identity/fence/key
epoch; authentication profile discriminator; and its exact applicable action-
claim or hardware-proof fields with canonical-none values for the other
profile. Unknown fields, duplicate fields, noncanonical order/encoding, omitted
time/profile/continuity fields, and version substitution reject before
authentication.

Any adapter claiming `VIT-CAP-060` must also claim
`DeadlineConditionalTopologyCasV1`. That port atomically consumes the exact
receipt, applicable workload claim and replay tombstones; advances the consumer
trusted-time lower-bound/profile-epoch/continuity ratchet; evaluates
`latest + maximum_commit_slack < commit_before` at the backend's authoritative
commit linearization point; commits the topology successor/member fences/
permanent tombstones/fence outbox and a typed deadline result; or proves the
transaction absent. A closed mechanism enum permits only
`AuthoritativeCommitTimePredicate`, where the deadline predicate executes
inside the same authoritative commit operation using an admitted time source,
or `HardNoLateCommitFence`, where backend-enforced cancellation/fencing
provably prevents commit after the deadline. A statement-time predicate,
client timer, socket timeout, cancellation request, connection loss, or
post-commit audit timestamp is not this capability. An alternative
authorization linearization point requires a successor law generation and
separate residual-risk decision; it is not accepted by `VIT-LAW-008@g02`.
Response loss may yield typed reconciliation only when the backend proof still
guarantees that any successful commit linearized before expiry and no absent
transaction can later commit.

Freeze `TopologyAuthorizationReplayLifecycleV1` as part of VIT-CAP-060/061.
Every durable authorization allocation receives a monotonic
`AuthorizationIssuanceSequence` bound into
`TopologyMutationAuthorizationReceiptV1`. Layered per-deployment,
per-issuer/class, and canonical principal-or-authority/class successful-
admission-rate and outstanding-authorization quotas execute before allocation;
every layer must admit, and `TopologyAuthorizationPrincipalBudgetKey` binds the
authenticated principal plus issuing-authority lineage and class, so caller
identity splitting cannot increase an aggregate ceiling. A separate bounded
`TopologyAuthorizationIngressWorkBudgetV1` applies before authenticated owner
state. It limits request bytes, connections and concurrent handshakes,
signature or MAC verification work, canonical decode bytes/allocation/depth/
work, and authentication failures at deployment/listener scope plus a
transport-source scope only where that source is trustworthy. Caller-controlled
identifiers are never its sole key. Its closed
`TopologyAuthorizationIngressLaneV1` partitions independently provisioned,
non-borrowable `Normal`, `Recovery`, and `BreakGlass` listeners and their
accept queues/file-descriptor quotas, TLS/cryptographic workers, decode memory/
CPU, executor queues, and connection pools. The route derives only from
server-controlled bind/listener/TLS trust configuration and upstream network
policy, confers no authorization, and is still bounded by a global deployment
safety ceiling. Normal cannot consume either emergency partition and
break-glass cannot consume recovery capacity.
After successful authentication and canonicalization,
`TopologyAuthorizationPresentationRateBudgetV1` charges every authenticated
canonical presentation, including exact retries, response-loss retries,
historical replays, and requests that will receive policy/quota/replay denial.
It protects protected idempotency lookup, denial-history/archive proof
verification, and later authorization work; it creates no logical request,
authority, or reservation.
The presentation rate is partitioned by the closed
`TopologyAuthorizationPresentationLaneV1` values `Normal`, `Recovery`, and
`BreakGlass`. Lane selection is derived before protected lookup exclusively
from the authenticated endpoint/audience and credential-or-authority profile
under a versioned, fenced lane mapping; a body field, requested class, principal
label, or untrusted routing header cannot select it. Recovery and break-glass
use separately provisioned identities and audiences. Their presentation and
request-rate capacity is non-borrowable in either direction, and unavailable,
revoked, stale, ambiguously mapped, or mismatched lane evidence fails closed.
After full authorization, the requested `TopologyAuthorizationBudgetClass`
must exactly equal the authenticated lane or
`TopologyAuthorizationPresentationLaneMismatch` rejects without request,
admission, or outstanding allocation.
VIT-INV-061 is the sole authoritative owner of presentation-lane mapping
identity, proposal, activation, rotation, revocation, generation, and fence
state. Promotion into `Recovery` or `BreakGlass` requires a distinct requestor,
approver, and activator with the frozen quorum/SoD, current policy/session,
change-or-incident evidence, and no self-approval; configuration deployment
cannot promote an identity. The owner exposes only authenticated current
mapping reads and advances a monotonic externally retained generation/fence on
activation, rotation, or revocation.

Presentation charging and request processing are an explicit two-stage local
protocol. Stage one,
`ChargeTopologyAuthorizationPresentation`, atomically commits the non-
refundable presentation-rate debit and a bounded internal
`TopologyAuthorizationPresentationChargeV1` under a unique
`TopologyAuthorizationPresentationChargeId` before any protected idempotency
lookup. The evidence binds canonical request ID/digest, authenticated
principal/authority, ingress lane, presentation lane, mapping identity/
generation/fence, credential-profile digest, presentation budget epoch, charge
sequence, owner/boot continuity and creation horizon. It is internal,
non-exportable and single-use; possessing it confers neither request identity
nor authorization.

Stage two, `ConsumeTopologyAuthorizationPresentationCharge`, consumes that
evidence and performs the protected request lookup in one VIT-INV-061
transaction. It first rechecks that the authoritative mapping identity,
generation, fence, profile digest and lane still exactly match the charge. A
rotation or revocation between stages returns typed
`TopologyAuthorizationPresentationLaneChanged`, consumes no request/admission/
outstanding capacity, creates no immutable request outcome, and never refunds
the presentation debit. An exact existing request consumes the new charge
evidence and returns its immutable outcome; a conflicting request consumes the
evidence and rejects; a first-seen authenticated canonical request atomically
receives a monotonic
`TopologyAuthorizationRequestSequence` and one separate
`TopologyAuthorizationRequestRateBudgetV1` charge; retries with the same
canonical request ID/digest/principal/authority/class reuse that sequence,
request charge and immutable outcome but still consume presentation rate.
Request-ID reuse with a different digest, principal, authority lineage, or
budget class consumes presentation rate and rejects as conflict without a new
request charge. The request sequence is distinct
from `AuthorizationIssuanceSequence`: every admitted or denied canonical
request has the former, while only a successful authority allocation has the
latter and binds both sequences into its receipt/result. The
budget class is closed: `Normal`, `Recovery`, or `BreakGlass`. Each has
independent admission-rate/outstanding counters; a small per-deployment break-
glass reserve and recovery-processing lane are non-borrowable in both
directions.
Normal saturation cannot consume emergency capacity, while break-glass floods
cannot consume normal capacity or delay revocation/recovery processing.
Break-glass remains subject to its own strict ceiling and every trusted-time,
quorum/SoD, canonical receipt, single-consumption, deadline-CAS, and replay-
checkpoint control.

Stage-one presentation charging commits before protected request lookup. Presentation
saturation returns typed `TopologyAuthorizationPresentationRateLimited`
without reading, replacing, or becoming the immutable request outcome; a later
presentation may retrieve that outcome. Concurrent identical first-seen
presentations each spend presentation rate, serialize on the canonical request
key, and create exactly one request sequence, request-rate charge and outcome.
A crash after stage-one commit and before stage two conservatively leaves an
orphan spent charge; client retry must obtain a new charge. Unconsumed evidence
from a fenced boot/owner continuity is never reusable. Stage-two abort marks
the evidence abandoned in a separate fail-closed cleanup transaction or fences
the serving continuity before more work; it cannot reuse or refund the charge.
Stage one atomically writes debit, complete evidence, charge sequence, and
`ChargedAwaitingStageTwo`; row/byte/backlog saturation returns
`TopologyAuthorizationPresentationChargeLedgerSaturated` with none of those
writes and no lookup. The closed
`TopologyAuthorizationPresentationChargeDispositionV1` state machine permits
only `ChargedAwaitingStageTwo` to transition to `Consumed` with an immutable
stage-two result link, `MappingChanged` with observed mapping evidence,
`ControlledAbortAbandoned` with authorized abort evidence, or
`ContinuityFencedOrphaned` with an authenticated continuity fence. Those four
terminal kinds are irreversible. After a predecessor-linked checkpoint commits,
`CheckpointedCompacted` preserves the original terminal kind, debit, result
commitment, continuity, charge identity/sequence, and covered-through
high-watermark before hot deletion. Timeout/age alone causes no transition.
No terminal kind can change, return to awaiting, or refund. Terminal evidence
is bounded by rows/bytes/age and compacted without changing aggregate debit
history.

`TopologyAuthorizationPresentationChargeLedgerCapacityV1` makes the durable
charge lifecycle non-borrowable by authenticated presentation lane, not merely
the presentation-rate counter. `Normal`, `Recovery`, and `BreakGlass` each
receive independent ceilings for hot rows, encoded bytes,
`ChargedAwaitingStageTwo`, checkpoint backlog, checkpoint/archive I/O, and
compaction workers under one aggregate disk and maintenance-work safety
ceiling. A successful stage-one admission reserves enough lane-local lifecycle
capacity for stage two to consume or terminalize and checkpoint the charge;
later cleanup cannot borrow another lane. Normal saturation rejects only
Normal stage-one commits, and break-glass saturation cannot block Recovery.
Any adapter unable to prove both the partitions and aggregate ceiling refuses
the protected VIT-CAP-061 profile.

VIT-INV-061 owns one immutable
`TopologyAuthorizationPresentationChargeLedgerCapacityProfileV1` lineage.
Every profile binds stable ID, monotonic generation/epoch, canonical digest,
predecessor, closed `Proposed`/`PendingDrain`/`Active`/`Superseded`/`Rejected`
state, expected-version activation CAS, per-lane limits/reserves, aggregate
ceilings, and authenticated
`TopologyAuthorizationPresentationChargeLedgerProvisioningEvidenceV1`.
No limit mutates in place and exactly one generation is active. The predecessor
remains active while its successor is proposed or pending drain. A proposal
may become pending drain or rejected. Every successor that reduces any
canonical lane limit, reserve, aggregate ceiling, storage allowance, I/O
allowance, or worker allowance must follow `Proposed` -> `PendingDrain` ->
`Active`; only a successor proven equal-or-increasing in every canonical
dimension may activate directly from `Proposed`. The owner derives this
classification as
`TopologyAuthorizationPresentationChargeLedgerCapacityProfileDiffV1` and
`TopologyAuthorizationPresentationChargeLedgerCapacityProfileTransitionClassV1`
with overflow-safe typed units over the complete canonical profile. Unknown
fields, incomparable units, omitted dimensions, and mixed schema versions
classify conservatively as reductions. A permitted proposed
or pending-drain successor becomes active only in one local expected-version
transaction that simultaneously supersedes the predecessor. Superseded and
rejected are terminal, and no transition returns to proposal or active. A reduction of
Recovery/BreakGlass capacity or change to aggregate ceilings requires current
change-or-incident authorization, separated requestor/approver/activator roles
and quorum. Activation first proves every lane's successor limits cover current
usage, awaiting charges, terminalization reservations, checkpoint backlog,
maintenance obligations and protected reserve. If not, the successor remains
`PendingDrain` or is rejected; existing obligations cannot be cancelled,
reclassified, or forced into another lane. Capacity never transfers between
lanes, although a separately approved successor can assign future unencumbered
capacity. Aggregate increases require adapter-authenticated physical disk, I/O
and worker provisioning evidence rechecked at activation. Stale CAS,
predecessor forks, old profile
generations and downgrade writers deny.

Freeze
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainAuthorizationV1`
because entering PendingDrain immediately changes admission and is itself a
denial-capable capacity reduction. The canonical authorization binds
deployment and tenant; action kind; predecessor and successor profile IDs,
generations and digests; the exact typed diff digest; derived lanes and reduced
aggregate dimensions; policy epoch; change-or-incident authority; requestor,
approver identities, activator, quorum and separation proof; issued/expiry
times; nonce; and idempotency ID. Its authenticated time envelope is exactly
`not_before`, `issued_at`, `expires_at`, maximum uncertainty, trusted-time
profile/epoch, issuer continuity, signer/key identity and epoch, and
authentication profile. It authorizes one exact begin-drain,
activation, rejection, or controlled-abandonment action and cannot be reused
across an action, predecessor, successor, diff, deployment, tenant, or policy
epoch. Every Normal, Recovery, BreakGlass, and aggregate drain requires current
authorization and at least the same requestor/approver/activator separation as
the effective reduction.

Freeze
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainAuthorizationConsumptionV1`
as the sole closed authorization lifecycle:
`Issued`, `Consumed { action_id, request_digest, result_digest }`,
`ExpiredUnused`, or `RevokedUnused`.
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainActionResultV1`
is the canonical request-digest-bound result. Authorization consumption,
permanent replay tombstone, that result, the exact profile/fence mutation,
event, audit, and outbox commit in one local transaction. An identical
canonical request using the same action and idempotency ID returns the original
result without another mutation, event, audit-success, sequence, or outbox
entry. Reuse with different canonical bytes or digest returns typed
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainAuthorizationConflict`
and writes nothing. Consumed authority cannot authorize another action;
expired-unused and revoked-unused authority remain permanently non-consumable.

Select authenticated sparse replay archiving rather than permanent exact
retention. Permanent retention is rejected because unbounded replay-critical
rows would contradict the bounded storage, maintenance, and recovery-capacity
contracts. Freeze
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainAuthorizationReplayCheckpointV1`
and
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainAuthorizationReplayArchiveV1`.
Each sparse entry binds the stable action/idempotency ID, canonical request
digest, authorization digest and terminal lifecycle state, complete canonical
action result or authenticated result-archive reference, action kind,
predecessor/successor identities, tenant/deployment, policy epoch, predecessor
checkpoint digest, encoding/key epoch, and archive commitment. Membership
proves the exact historical request/result; changed request bytes prove
historical conflict. Non-membership is valid only for the exact sparse
authenticated set and never follows from an action, nonce, idempotency, or
other dense high-watermark.

Freeze exactly one authoritative cumulative
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainAuthorizationReplayHeadV1`
per tenant/deployment scope. It binds a non-wrapping head sequence,
predecessor-head digest, cumulative sparse root digest, exact scope,
expected-version CAS, encoding/key epoch, archive publication identity, and
covered hot-row snapshot/version. Sequence exhaustion denies before
publication and a head never forks, wraps, or reuses a sequence. Membership or
non-membership is valid only against the greatest committed cumulative head
plus current hot rows checked under the same head/scope version; an individual
checkpoint/archive, stale reader head, or head root alone cannot prove
non-membership.

Freeze
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayArchivePublicationV1`
with the closed lifecycle `Staged` -> `Verified` -> `CommittedHead` ->
`HotRowsDeleted` -> `OrphanGcEligible`. Immutable content-addressed archive
chunks are uploaded before the local database commit and are non-authoritative
while staged. Verification authenticates every chunk/root/key, exact contents,
durable visibility, proof-budget profile, and covered hot-row snapshot.
Only then may one local expected-version transaction install the cumulative
committed head and delete exactly its covered hot rows. `CommittedHead` and
`HotRowsDeleted` are logically ordered but co-committed and never externally
observable as head-without-deletion or deletion-without-head. Unknown upload,
visibility, or verification outcome retains all hot rows. Unknown local-commit
response reconciles the exact transaction/head identity: either the atomic
head/delete bundle exists or the hot rows remain.

Readers ignore `Staged`, `Verified`, and orphan publications and trust only the
greatest cumulative committed head with its co-committed deletion evidence.
`OrphanGcEligible` permits cleanup only when no committed head references the
chunks or a later cumulative committed head has authenticated equivalent
entries/results and retention/key policy permits deletion; garbage collection
is never replay authority. Checkpoint coalescing creates a new cumulative head
and cannot replace, fork, or weaken the current head. This protocol uses no
database/object-store distributed transaction.

Freeze
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionGuardV1`
as the proof-to-first-execution linearization contract. The reader first reads
authoritative cumulative head `H`, then fetches and resource-bounded verifies
the archive proof for exactly `H` outside the database transaction. The proof
guard binds tenant/deployment scope, action/idempotency key, canonical request
digest, head sequence/root/digest/version, proof digest and verification
profile/cursor.

Freeze the canonical key as
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayKeyV1 {
tenant_id, deployment_id, action_kind, action_id, idempotency_id }`. Its
encoding is ordered and versioned. `action_id` and `idempotency_id` are each
independently unique within tenant/deployment scope; `action_kind` is bound
data, not a uniqueness namespace. The store enforces unique
`(tenant_id, deployment_id, action_id)` and unique
`(tenant_id, deployment_id, idempotency_id)` constraints that resolve to the
same canonical row. Exact retry supplies both original IDs, action kind and
request digest. Reusing either ID with a changed counterpart, kind or request
is historical conflict and never a new key.

The reader then begins one local write transaction and locks, in the declared
order, the authoritative per-scope replay-head row and exact action/
idempotency-key row. It re-reads the head and requires byte-for-byte equality
with `H`; mismatch returns typed
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayHeadChanged`
with no write and restarts bounded proof verification outside the transaction.
With the same head/key locks held, it checks current hot state. Only an
authenticated non-membership proof for that unchanged greatest committed head
plus absence of the exact hot row may proceed to first execution. The
transaction inserts the unique replay row and atomically commits authorization
consumption, canonical result, mutation, event, audit and outbox. Unique-key
conflict is resolved as exact retry or historical conflict, never another
execution.

Every authority-bearing head, key and hot-row read uses the authoritative
writer/linearizable local transaction. An asynchronous replica, follower,
cache, read-only snapshot, statement-level changing snapshot, or any isolation
mode unable to hold a stable head/key predicate cannot authorize execution and
must refuse VIT-CAP-061. Compaction and first execution share the head-first,
then canonical-key/covered-row lock order, preventing an old-head proof from
being paired with post-compaction hot-row absence.

Freeze durable
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayRestartBudgetV1`
for the complete logical admission attempt, not one proof job. It binds an
unforgeable attempt ID, replay key, canonical request digest, lane/class,
budget-profile epoch, starting/latest head, restart count, observed head
advances, cumulative proof bytes, decode allocation, verification work and
conservative elapsed-time deadline. The profile sets finite maxima for every
counter and for automatic `ReplayHeadChanged` restarts. Head changes,
failover, crash/recovery, cursor recreation, connection-pool or adapter retry,
and process restart resume the same monotonic counters and deadline; they
cannot create a fresh budget for the same in-flight attempt.

If another valid head can be tried within every remaining bound, persist the
restart accounting before releasing the attempt for bounded re-verification.
Otherwise return typed
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionContended`
without consuming authority, inserting replay state or executing the action.
This is transient contention and is distinct from
`...DrainHistoricalStateUnavailable`, which means required history is missing
or unverifiable. A new caller attempt remains subject to presentation, request
and principal rate limits, so reconnects cannot manufacture unbounded work.

Use an authenticated-admission/compaction scheduler with finite per-scope
quanta. After bounded publication work, compaction yields to an already
authenticated queued admission; after bounded admission work it may resume.
Recovery admissions use their protected, non-borrowable lane and maintenance
capacity. Yield/backoff has finite lower and upper bounds and cannot be
reserved, extended or held by an unauthenticated caller, while admission cannot
pin compaction indefinitely or endanger replay permanence.

Freeze
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptV1`
as the sole owner of the logical restart budget and
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptStateV1`
as a closed lifecycle:
`Active` -> `RestartPending` -> `Active`, or either nonterminal state to exactly
one of `Succeeded { replay_row, result }`, `HistoricalConflict`,
`HistoricalUnavailable`, `Contended`, or `ExpiredNoExecution`. Every terminal
state is irreversible. Historical-unavailable remains the proof/history
failure, contended remains cumulative-budget/scheduling exhaustion, and expired
means the conservative attempt deadline elapsed before execution; none can
later transition to success.

One tenant/deployment-scoped canonical replay key has at most one nonterminal
attempt. Concurrent requests with the identical key and canonical request
digest join that attempt and observe its counters/outcome without allocating
another budget; any changed digest, action kind, action ID or idempotency ID
uses the existing typed historical conflict path. The attempt binds its stable
ID, key/request digest, lane/class/principal, budget epoch/counters/deadline,
owner workload identity, boot/continuity ID, lease generation, fencing token
and expected-version CAS. Only the current fenced owner may advance it.

Crash takeover increments the lease generation/fence under CAS and preserves
every counter, observed head and original deadline. A stale owner cannot
verify, restart, terminalize or execute after takeover. Cancellation,
disconnect, worker loss, failover and retry neither delete the attempt nor
reset its budget. `Succeeded` commits in the same local transaction as the
unique replay row and complete action bundle. Each no-write terminal outcome
atomically records its typed disposition and audit/checkpoint linkage without
consuming authority or writing replay-critical success state.

Freeze
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptCapacityV1`
with finite lane/deployment and canonical-principal limits for active and
terminal rows/bytes, queued attempts and concurrent takeovers, plus deployment/
lane limits for takeover work, terminalization backlog and cleanup workers.
Admission reserves lane-local terminalization and cleanup capacity before
creating or joining work; saturation fails before allocation. Normal and
BreakGlass cannot borrow protected Recovery attempt/terminalization/cleanup
capacity. Terminal attempt cleanup requires an authenticated result/replay-row
or typed no-write audit/checkpoint link and a committed predecessor-linked
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptCheckpointV1`
binding attempt ID/key/request digest, terminal state, final counters/deadline,
owner fence, result/replay-row or no-write audit link, capacity release,
predecessor digest, encoding and integrity epoch. Cleanup may remove only the
attempt envelope after its
terminal meaning and required counters are recoverable; it cannot delete or
weaken replay rows, authorization tombstones, results, archive commitments,
audit evidence inside its retention horizon, or cumulative budget evidence.

Freeze
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptCapacityLedgerV1`
and canonical
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptReservationSetV1`.
The set binds attempt/key/request, tenant/deployment, original lane/class/
principal, capacity-profile ID/generation/epoch, active row/bytes, terminal
row/bytes, terminalization work, checkpoint backlog/row/bytes, cleanup work/
worker and envelope-deletion quantities using overflow-checked typed units.
Creation is one local expected-version transaction: lock the current replay
head, skip the untouched settlement journal head, then lock canonical key/attempt,
applicable attempt-capacity rows, then profile/fence/domain rows in that global
order; recheck current profile and head; verify every bound; reserve the
complete original set; insert the unique nonterminal attempt; and commit
all-or-none.

An identical join resolves the existing nonterminal attempt under the key lock
and allocates no attempt row, restart budget, reservation set, terminalization
or cleanup capacity. The core profile persists no waiter row: joiners receive
the stable attempt reference and use separately bounded connection/polling
surfaces. Any future durable waiter requires a separately versioned capacity
ledger and cannot charge the attempt reservation set.

Every attempt transition follows replay head -> settlement journal head when
touched -> key/attempt -> attempt-capacity -> profile/fence/domain lock order.
The settlement archive replay head is a separate publication/read boundary and
is never advanced by an attempt transition. Before success, while those locks
are held,
recheck `Active`, canonical key/request, owner workload and boot/continuity,
lease generation, fencing token, expected-version CAS, conservative deadline,
all cumulative budget counters, authoritative head and current profile/fence/
domain authority. The single transaction commits `Succeeded`, replay row/
result, authorization consumption, domain mutation, event, audit, outbox, and
the original active-to-terminal capacity transfer. No-write terminalization
uses the same transaction and original-bucket transfer.

Capacity-profile activation, migration, restore or policy change never
reclassifies or resizes an existing reservation set from current rules;
settlement uses its original lane/class/principal/profile buckets.
Freeze stable
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptCapacitySettlementId`
and immutable
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptCapacitySettlementV1`
binding settlement ID, reservation-set ID, settlement leg, original bucket/
quantity, triggering checkpoint or deletion identity, transaction identity and
result digest. Exactly one record exists per reservation-set ID and leg.
The unified checkpoint-settlement transaction described below settles
terminalization work and checkpoint-backlog work exactly once but does not
release terminal-envelope rows/bytes or cleanup/deletion capacity while the
envelope exists. Physical envelope deletion, after the authenticated attempt
checkpoint is durable, uses the same settlement protocol for the original
terminal-envelope rows/bytes and cleanup/deletion reservations exactly once.
The committed checkpoint's own occupancy remains charged to its checkpoint/
archive ledger. Duplicate/reordered/unknown-response calls replay or reconcile
the stable settlement result and cannot decrement twice or release another
reservation set.

Freeze domain-separated
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptCapacitySettlementCheckpointV1`,
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptCapacitySettlementArchiveEntryV1`,
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptCapacitySettlementJournalHeadV1`,
and
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptCapacitySettlementArchiveReplayHeadV1`
by reusing the existing authenticated
sparse archive codec, immutable publication lifecycle, bounded proof verifier
and verification cursor rather than creating an independent retention system.
Each exact sparse entry binds reservation-set ID, settlement leg and ID,
original bucket/quantity, checkpoint-or-deletion trigger identity, immutable
result digest, local transaction identity, settled status, predecessor
checkpoint/head, encoding/key epoch and domain separator.

`...CapacitySettlementJournalHeadV1` is the database-local, non-wrapping
integrity/append head, with one lineage per tenant/deployment settlement scope.
It binds its predecessor and sequence, the canonical ordered settlement-row
set digest and row-set version, every reservation-set/leg/settlement ID in that
atomic bundle, trigger kind, transaction/result/audit identities and owner
continuity. It advances atomically with one or more hot settlement rows for
every checkpoint or deletion settlement, but never claims that archive chunks
exist or are available.

Every capacity-settlement leg uses one unified transaction contract and the
same journal/archive namespace; adapters cannot route checkpoint legs through a
different replay system. A checkpoint-settlement transaction locks replay head
-> settlement journal head -> key/attempt -> capacity -> profile/fence/domain,
revalidates the terminal attempt, owner/fence/CAS and every unsettled checkpoint
leg, decrements only its original terminalization/checkpoint-backlog buckets,
writes one immutable `...CapacitySettlementV1` per leg, advances the settlement
journal head over the canonical ordered bundle, writes the authenticated
attempt checkpoint, audit and canonical result, and commits all-or-none.
Checkpoint occupancy remains charged to its checkpoint/archive ledger.
Response loss and exact duplicate before or after settlement compaction return
the same checkpoint-settlement result without another decrement; changed
checkpoint/deletion trigger or leg material conflicts.

The physical envelope-deletion transaction follows that same protocol: it
locks replay head -> settlement journal head -> key/attempt -> capacity ->
profile/fence/domain, revalidates the checkpoint and every unsettled deletion
leg, deletes the envelope, applies only the original-bucket decrements, writes
one immutable deletion settlement per leg and atomically advances the
predecessor-linked settlement journal head. The
envelope deletion, decrements, ordered hot-row bundle, journal-head advance,
audit and canonical transaction result are indivisible. Response loss
reconciles that exact transaction and settlement IDs. Exact
duplicate after envelope or hot settlement-row deletion returns the recorded
settlement result without another decrement. Changed canonical settlement
bytes, substituted settlement/reservation-set ID, leg, bucket, quantity,
trigger or result returns typed
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptCapacitySettlementConflict`
without mutation.

`...CapacitySettlementArchiveReplayHeadV1` is the greatest authenticated,
verified and published cumulative archive root. It advances only after
immutable chunks upload and verify; it binds its predecessor/root/key epoch,
publication identity, exact covered hot-row IDs and captured row-set version/
range, trigger kinds, and the corresponding settlement-journal sequence/digest.
It never advances in a checkpoint or physical-deletion settlement transaction.

Compaction captures an exact hot-row set and version/range without treating
later rows as covered. After upload and verification, its final local
transaction locks the archive replay head before the settlement journal head
and exact covered hot rows, rechecks the captured row-set version and journal
continuity, CAS-installs the new archive replay head and deletes only those
exact covered rows. This is the indivisible CommittedHead -> HotRowsDeleted
boundary within the existing Staged -> Verified -> CommittedHead ->
HotRowsDeleted -> OrphanGcEligible protocol. A new settlement racing the
snapshot remains hot.
Archive chunks and heads may contain any canonical mixture of checkpoint and
deletion legs. Membership, conflict, coalescing and tombstones remain per exact
settlement/reservation-set/leg identity; trigger kind cannot partition or alias
the ID namespace.

Authoritative lookup is the greatest verified archive replay head plus current
hot settlement rows/version plus local settlement-journal head/continuity. A
proof verified against archive head H outside the database transaction becomes
authoritative only after a local transaction locks or re-reads exactly H,
rechecks the hot-row version and journal continuity, and confirms the exact
settlement key. Archive non-membership never authorizes a decrement when the
attempt envelope is absent. Coalescing preserves every exact sparse settlement
ID/result and settled-leg bitmap/tombstone; no dense high-watermark can infer
an arbitrary settlement settled. Missing/forked/rolled-back/unverifiable
journal head, archive replay head, checkpoint, archive, key, chunk or proof
returns
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptCapacitySettlementHistoricalStateUnavailable`
and conservatively retains the affected original capacity charge, including
terminalization/checkpoint-backlog charge for a checkpoint leg; unavailable
history never authorizes another decrement.

Extend attempt-capacity bounds with settlement hot rows/bytes, checkpoint
rows/bytes/backlog, archive chunks/bytes, proof bytes/depth/decode/work/jobs,
settled-leg tombstones and settlement compaction workers. Reserve settlement
terminalization/checkpoint/archive/cleanup work before attempt creation under
the original lane, with protected Recovery capacity. Restore, failover,
migration and import preserve the greatest local journal head and verified
archive replay head, both non-wrapping predecessor/sequence chains and their
authenticated coverage relationship, root/key/publication state, exact covered
and current hot-row IDs/versions/ranges, every settlement ID, trigger kind,
ordered bundle digest and canonical result, attempt-checkpoint linkage, exact
checkpoint/deletion settled-leg tombstones, remaining unsettled legs,
verification cursor/budget and conservative original-bucket balances.

Freeze
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayProofBudgetV1`
with exact maximum checkpoint/archive/root/chunk encoded bytes, entries and
chunks, proof depth, decode allocation, verification work, roots/chunks per
job, and concurrent jobs, plus durable
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayVerificationCursor`.
After immutable chunk upload and verification, cumulative-head installation,
replay high-watermarks/cursor, publication state, and exact hot-row deletion
commit in one local database transaction. Missing/unverifiable history, key or
chunk loss, archive outage, proof-budget exhaustion, or incomplete
verification returns typed
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainHistoricalStateUnavailable`
without consuming authority or executing an action. Bounded archive and
verification backlog reserves are charged to the non-borrowable Recovery
maintenance capacity; saturation applies backpressure before accepting another
authorization whose permanent replay proof cannot be guaranteed.

`TransitionTopologyAuthorizationPresentationChargeLedgerCapacityProfileToPendingDrain`
authenticates that authorization and rechecks current policy, change/incident
authority, approval validity/quorum/separation, typed diff, derived coverage,
conservative trusted-time interval, expiry, nonce/idempotency, and predecessor
expected version before any state or fence write. Unavailable/discontinuous
time, excessive uncertainty, clock rollback, restore below the local
lower-bound/profile/key high-watermarks, or an unauthenticated signer denies
consumption. Activation requires its own currently valid single-action
authorization, binds the installed begin-drain authorization and consumption
digests, and rechecks both immutable drain bindings and current
policy/authority/approval/predecessor/fence state. The consumed begin-drain
authorization must have been valid at fence installation but need not remain
unexpired throughout a long drain. Its historical authentication remains
mandatory. Revocation after installation never removes the safety fence:
activation waits for fresh current authority or a separately authorized
rejection.
Rejection and controlled abandonment require their own action-bound current
authorization and append audit evidence, preventing an unauthorized actor from
cycling drains. Unauthorized, expired, replayed, self-approved, cross-tenant,
or digest/subfield-substituted requests fail before successor-state, fence,
event, audit-success, or outbox writes.

Transition into `PendingDrain` atomically installs
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainFenceV1` with the
active predecessor ID/generation/digest, successor generation/digest, affected
lanes, reduced aggregate dimensions, install sequence, expected version, and
owner continuity. `affected_lanes` is derived from the canonical typed profile
diff and never accepted from a caller. A lane-specific reduction includes that
lane; reducing a shared aggregate disk, I/O, worker, row, byte, backlog, or
maintenance dimension includes every lane capable of consuming that dimension.
One active
predecessor admits at most one nonterminal successor and one fence. Stage-one
admission locks the fence and must fit both the active profile and every
applicable pending successor, including both its lane-specific limits and every
successor aggregate limit after the new charge's terminalization and
checkpoint reservation. Admission and activation lock the same canonical
lane-capacity and aggregate-capacity rows in one fixed declared order. If
current or prospective lane/aggregate usage exceeds the successor ceiling,
return
`TopologyAuthorizationPresentationChargeLedgerCapacityDraining` before debit,
evidence, sequence, disposition, or protected lookup. Accepted obligations
retain their original lane reservations and continue through stage two,
terminalization, checkpoint, archive, and compaction.

Successor activation locks and rechecks the fence, live usage, reservations,
backlog, every affected aggregate-capacity row, maintenance obligations,
physical provisioning evidence, and predecessor version in its atomic
activate/supersede transaction. Authorized
rejection or controlled abandonment atomically moves the successor to
`Rejected` and removes only that exact fence under expected-version CAS.
Workers cannot clear it. Competing successors, stale fence generation,
ambiguous lineage, or unauthenticated/missing fence recovery state deny.
Normal and BreakGlass fences affect only their lanes and cannot consume or
block Recovery resources; a Recovery successor must retain the protected
reserve.

Every successful activation appends canonical
`TopologyAuthorizationPresentationChargeLedgerCapacityProfileActivationRecordV1`.
It binds the non-wrapping activation sequence and predecessor activation-record
digest; old/new profile IDs, generations, digests, and states; expected and
committed aggregate versions; transition class and typed-diff digest; exact
drain-fence identity/digest and consumption sequence, or canonical-none for a
permitted direct activation; provisioning-evidence digest; exact policy/
change/incident begin-drain and activation-authorization digests; owner
partition and continuity/
fencing identity; transaction identity and journal position; canonical
encoding version; and integrity/checkpoint binding. Sequence exhaustion fails
closed before mutation and sequences never wrap or reuse.

The activation record, active-head update, predecessor supersession, successor
activation, optional exact fence consumption, fence-consumed event, journal
append, audit evidence, idempotent result, and outbox evidence commit in one
local transaction. A record cannot be deleted until an authenticated
predecessor-linked
`TopologyAuthorizationPresentationChargeLedgerCapacityProfileActivationCheckpointV1`
preserves the complete activation head plus active/pending/fence recovery
tuple; drain-authorization consumption and result high-watermarks; canonical
authorization and validation-evidence digests; trusted-time profile/epoch and
validated interval; signer/key epochs and authentication profile; and every
replay tombstone needed to prevent resurrection. It also commits the complete
sparse replay checkpoint/archive root, entry/result or authenticated result
reference, predecessor checkpoint, proof-budget profile, verification cursor,
encoding/key epoch, archive availability evidence, authoritative cumulative
head sequence/predecessor/root/scope/version, publication identity/state and
covered hot-row snapshot, and exact sparse membership/non-membership semantics
over greatest committed head plus current hot rows. A digest, individual
checkpoint, stale head, or high-watermark alone is never
an exact-retry result or proof that an arbitrary ID was unseen. Checkpoint and
archive publication precede deletion
and local or external replicated time, key, consumption, result, and activation
high-watermarks cannot roll back. Response loss for begin-drain, activation,
rejection, or abandonment replays the same stable action result; it never
consumes authority twice or appends another event or sequence.

Fence installation and consumption are not independently callable commands.
`TransitionTopologyAuthorizationPresentationChargeLedgerCapacityProfileToPendingDrain`
is the only command that enters PendingDrain.
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainFenceInstalled` is
an event in the atomic PendingDrain transition, and
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainFenceConsumed` is
an event in the atomic activation or authorized rejection transaction. Direct
install, clear, or worker invocation is unrepresentable at the domain/API
surface and denied if received from an older or malformed codec.

Recovery authenticates and reconstructs
`TopologyAuthorizationPresentationChargeLedgerCapacityRecoveryStateV1` as the
tuple of the active profile selected from the greatest authenticated committed
activation record, an optional pending successor, its optional exact drain
fence, the lineage-generation high-watermark, and the activation-sequence
high-watermark plus drain-authorization consumption/result/time/key
high-watermarks, replay tombstones, sparse replay checkpoint/archive roots,
the greatest cumulative committed replay head and predecessor/sequence/scope/
version high-watermarks, co-committed covered-hot-row deletion evidence,
publication states, proof-budget profile, archive/key availability and
verification cursor, plus attempt lifecycle/key/digest, owner/boot/lease/fence/
CAS, cumulative counters/deadline, capacity reservations/backlogs and terminal
checkpoint/result/audit links, reservation-set IDs/original buckets/balances,
active-to-terminal transfers, settlement ID/leg/trigger/result records, the
greatest local settlement journal head, greatest verified archive replay head,
both non-wrapping predecessor/sequence chains and their authenticated coverage
relationship, root/key/publication state, exact covered/current hot-row IDs,
versions and ranges, every settlement ID, checkpoint/deletion trigger kind,
ordered bundle digest and canonical result, verification cursor, exact
checkpoint/deletion settled-leg tombstones, attempt-checkpoint linkage,
remaining unsettled legs, and conservative original-bucket balances. Omission
or defaulting of either head, linkage, trigger, settled leg, remaining leg or
balance fails decoding and admission. No Vitheim release admitted a singular-
head settlement schema, so such a snapshot is unsupported input: recovery
quarantines it before authority mutation and never infers, migrates or
initializes the two-head tuple from it. Only an explicitly new empty deployment
may create both heads at canonical genesis.
Raw
profile generation never implies activation. Rejected and
unactivated proposed generations remain historical only. A recovered pending
successor and fence are applied jointly to new admission; recovery recomputes
the canonical affected-lane and reduced-aggregate sets from the profile diff
and verifies them against the authenticated fence before admitting work.
Multiple active profiles, pending-without-fence, fence-without-pending,
contradictory activation records, unreachable predecessors, incomparable
schemas, gaps/forks/reordering/duplicate activation sequences,
active-row/record disagreement, a missing activation checkpoint, or a
rolled-back local/external high-watermark deny startup/admission. Recovery then
reconstructs usage, reservations, backlog and maintenance work. It never merges
the greatest numeric limits: an older,
larger profile cannot revive capacity removed by a newer active generation.
An exact late retry after compaction returns the archived canonical action
result; changed bytes/digest return the historical conflict. Missing or
unverifiable sparse history returns
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainHistoricalStateUnavailable`
and cannot make the action unseen, reusable, or executable.

For successful first-seen issuance, stage-two charge consumption, request-
sequence allocation, request-rate charging, quota validation, every applicable
admission counter/reserve mutation,
`TopologyAuthorizationOutstandingReservation` creation,
`AuthorizationIssuanceSequence` allocation, canonical receipt persistence,
request-digest-bound idempotent result persistence, and issuance outbox
insertion are one VIT-INV-061 local atomic transaction after the independently
committed presentation debit. A denied first-seen authenticated canonical
request atomically commits charge consumption, its request sequence, bounded
request-rate charge, caller/class binding, and
typed idempotent denial result; it allocates
no admission token, outstanding reservation, authorization issuance sequence,
receipt, or issuance outbox. Presentation, request and admission rate charges
are never refunded; exact retries spend only presentation rate again.

Each reservation embeds immutable
`TopologyAuthorizationOriginalQuotaClaimSetV1`: exact deployment bucket,
issuer/class bucket, `TopologyAuthorizationPrincipalBudgetKey`, every budget
epoch, `Normal`/`Recovery`/`BreakGlass` class, reserve source, unit, and
quantities originally encumbered. Policy, principal-key, class, reserve, or
budget-epoch changes create successor buckets; settlement never recomputes
current keys. The original ledgers remain recoverable until all bound
reservations settle.

A committed reservation remains outstanding across client timeout,
cancellation, disconnect, process crash, unknown response, lineage revocation,
or lineage supersession. Those lineage transitions block new issuance only;
they do not invalidate the already-issued receipt before its immutable
`commit_before` and therefore cannot release capacity. The reservation
transitions exactly once from `OutstandingReserved` to `OutstandingReleased`
only when VIT-INV-061 authenticates evidence that the exact receipt is no
longer consumable:

- a consumer-authenticated consumption result;
- conservative trusted time beyond the exact `commit_before`;
- a consumer-authenticated `TopologyMutationDefinitelyNotCommitted` result;
- a consumer-authenticated `TopologyAuthorizationPermanentlyUnresolved` seal;
  or
- a receipt-specific revocation tombstone already committed by VIT-INV-060 and
  proven by `TopologyAuthorizationConsumerTerminalReceiptV1`.

Immediate receipt revocation is a separate protocol:
`TopologyAuthorizationReceiptRevocationIntentV1` binds the exact authorization
ID, issuance sequence, receipt digest, issuer lineage/fence, reason, and
revocation epoch. VIT-INV-060 serializes that intent against consumption and
expiry, commits the receipt-specific tombstone plus terminal result/outbox in
its local transaction, and emits the consumer-authenticated terminal receipt.
VIT-INV-061 cannot forge or self-assert consumer terminal state. Loss of that
receipt conservatively retains the reservation until evidence is recovered or
expiry is proven.

Freeze `TopologyAuthorizationConsumerTerminalReceiptV1` as a canonical,
versioned authenticated envelope. Its authentication preimage binds deployment;
VIT-INV-060 owner partition, generation, and fence; authorization ID;
`AuthorizationIssuanceSequence`; authorization receipt digest; optional
receipt-revocation-intent digest using canonical-none outside that path; one
closed `TopologyAuthorizationConsumerTerminalOutcomeV1`; consumer result
version and monotonic result sequence; receipt-specific tombstone digest;
applicable `commit_before`, trusted-time profile/epoch/continuity and
conservative terminal-time evidence; sender workload/owner identity; signing or
MAC key epoch and closed authentication profile; stable message/idempotency ID;
and transactional outbox sequence. The terminal outcome type contains only
`RevokedBeforeConsumption`, `AlreadyConsumed`, `Expired`,
`DefinitelyNotCommitted`, and `PermanentlyUnresolved`.
`TopologyAuthorizationConsumerDispositionV1` is the separate closed sum
`Terminal(TopologyAuthorizationConsumerTerminalOutcomeV1)` or
`Reconciling(TopologyAuthorizationConsumerReconciliationEvidenceV1)`.
VIT-INV-060 emits `TopologyAuthorizationConsumerTerminalReceiptV1` only for
the terminal variant. Reconciling uses a domain-separated
`TopologyAuthorizationConsumerReconciliationReceiptV1` and can later advance
to a terminal receipt under a greater consumer result/outbox sequence.
`SettleTopologyAuthorizationOutstandingReservation` accepts the terminal
receipt type, never the disposition or reconciliation types, so reconciliation-
based release is unrepresentable at the settlement port.
VIT-INV-060 alone has sender/signing or sender-MAC generation authority;
VIT-INV-061 has issuer-side verification only and cannot possess credentials
that manufacture the envelope. Receipt replay is idempotent by message ID,
result sequence, exact digest, and settlement ID; conflicting outcomes or
sequence rollback reject and retain capacity.

`SettleTopologyAuthorizationOutstandingReservation` locks every original claim
bucket in canonical order, verifies `ReservationSettlementId` plus terminal-
evidence digest, decrements every original outstanding/reserve quantity with
checked arithmetic, and changes reservation state in one local transaction.
Partial release, current-policy recomputation, underflow, or double decrement is
impossible; duplicate/reordered evidence returns the original result. Unknown
issuance and unresolved consumption continue to count until safely reconciled
or terminally settled.

Denied-request history has its own bounded branch inside
`TopologyAuthorizationReplayLifecycleV1`. A
`TopologyAuthorizationRequestReplayCheckpointV1` binds deployment and issuer
lineage; inclusive `TopologyAuthorizationRequestSequence` range; predecessor
checkpoint digest; canonical ordered request ID/digest, principal/authority,
budget-class, request-rate charge, and typed-outcome commitments; successful
request-to-`AuthorizationIssuanceSequence` links; archive digest/profile;
schema/algorithm version; counters; signing identity/key epoch; and creation
time. VIT-INV-061 keeps exact request outcomes hot for the frozen minimum
horizon, atomically installs the authenticated predecessor-linked request
checkpoint before deleting denied rows, and advances a request covered-through
high-watermark only across complete evidence. A retry at or below that
high-watermark is historical: it returns the exact denial when hot or proven by
the archive and is never reevaluated under newer policy/approval state. Missing
or corrupt proof returns `TopologyAuthorizationHistoricalStateUnavailable` and
cannot become a new request or a successful issuance. Freeze maximum denied
rows/bytes, request-checkpoint backlog, archive proof bytes/depth/work, decode
allocation, verification jobs, and compaction latency; saturation fails closed
before admitting another canonical request. Request sequence, checkpoint chain,
covered-through high-watermark, key epochs, and request-rate-charge commitments
survive crash, migration, failover, restore, and backend conversion.

A closed `HotExact` ->
`CheckpointPending` -> `ArchivedCompacted` lifecycle keeps the exact request,
mutation, receipt, and typed result locally replayable for a frozen minimum
exact-outcome horizon. Compaction first atomically installs an authenticated,
predecessor-linked `TopologyAuthorizationReplayCheckpointV1`, then may remove
covered hot rows. The checkpoint binds deployment and issuer lineage,
inclusive issuance range, prior checkpoint digest, canonical sorted
request/mutation/receipt terminal-state set commitment, typed-result archive
digest/profile, schema/algorithm version, counters, signing identity/key epoch,
and creation time.

VIT-INV-061 knows the complete sequence allocation history and may advance its
dense issued-through checkpoint high-watermark. VIT-INV-060 observes only
presented receipts and therefore uses a sparse set commitment by default; it
must not advance a dense marker across unseen sequence gaps. It may advance
`ConsumerCompactionEligibleThrough` only after authenticating
`TopologyAuthorizationIssuedRangeManifestV1` from VIT-INV-061. The manifest
binds deployment, issuer lineage/fence/key epoch, exact contiguous range,
canonical ordered issued sequence numbers and receipt digests, per-receipt
`commit_before`, maximum deadline/uncertainty, predecessor manifest digest, and
authentication profile. It is evidence, never consumer mutation authority or a
cross-owner transaction.

`TopologyAuthorizationIssuedRangeManifestV1` is also a resource-bounded proof
format. `TopologyAuthorizationRangeProofBudgetV1` declares maximum entries and
chunks per manifest, header and chunk bytes, entries per chunk, canonical decode
allocations, verification work units per step and per compaction job, proof
depth, and manifest roots/chunks consumed per job. A larger range uses canonical
predecessor-linked successor `TopologyAuthorizationIssuedRangeManifestV1`
roots whose bounded pages contain predecessor-linked
`TopologyAuthorizationIssuedRangeChunkV1` chunks. Each authenticated root binds
its complete inclusive subrange, total entry and chunk counts, ordered chunk-
root digest, predecessor-root digest, maximum deadline/uncertainty, and
terminal-chain marker; each chunk binds its ordinal, exact subrange,
predecessor digest, ordered entries, codec/profile, and root. Parsing checks
length/count/depth limits before entry allocation, and verification is
incremental through a durable bounded
`TopologyAuthorizationRangeVerificationCursor`. No single chunk, partial
root/chain, truncated terminal marker, or over-budget proof permits dense
consumer advance.

Consumer eligibility additionally requires a conservative trusted-time proof
that the exact replay horizon has elapsed and every manifest receipt is past
`commit_before`; every locally known member is terminal or sealed
`TopologyAuthorizationPermanentlyUnresolved`, which forever denies retry and
late commit. Omitted, duplicated, overlapping, unauthenticated, stale-fence, or
incomplete range evidence leaves the consumer sparse. A receipt first presented
after sparse or eligible dense compaction is historical/expired and never
absent or fresh. Within the exact horizon its original typed outcome must
replay. After that horizon an authenticated archive proof may reproduce the
exact outcome; if the range manifest, archive, membership/non-membership proof,
checkpoint key, or predecessor is unavailable, return
`TopologyAuthorizationHistoricalStateUnavailable`, deny mutation and new
allocation for the ambiguous key/range, and never reissue or infer
non-consumption. Checkpoint coalescing preserves the predecessor commitment and
issuer-dense, consumer-sparse, or consumer-eligible-dense meaning. Key rotation
cross-authenticates the successor
checkpoint key. Restore, migration, import, or failover merges the greatest
checkpoint/high-watermark before serving. Rate/backlog/cardinality limits,
compaction failure backpressure, hot/checkpoint/archive/manifest/chunk bytes
and rows, range-verification work/depth/cursor age, oldest uncompacted
sequence/age, quota and principal-sub-limit saturation, proof availability,
and alert thresholds are mandatory capability fields rather than operator
folklore.

Goal: prevent adapters from silently weakening correctness.

Deliverables: stable capability vocabulary, signed/probed report model,
compatibility decision engine, declaration-to-invariant-to-`VIT-CAP-*` coverage
report, declared composite-law contributor/coordinator/dependency/recovery
lifecycle placement report with generation-qualified manifest/digest support,
trusted-catalog and complete ancestry report, explicit semantic per-enforcement
negative-child
realization, lifecycle/supersession/owner-fence
placement report, and operator diagnostics. A claimed storage profile fails
admission when any applicable
registry `requires:` capability is missing.

Verification: false/missing/conflicting claims, version skew, downgrade, probe
failure, non-co-located grant guard or quota set, active/active authoritative
write claim, missing/non-co-located authority fence, stale external authority
offered for privileged dispatch, missing/non-co-located target fence, remote or
projection-only local current target, false strong-conditional provider claim,
ignored/weakened conditional mechanism, unauthorized unconditional profile,
missing/non-co-located exception guard, stale provider-capability epoch,
unbounded/reusable exception attempt, missing/extendable transmission deadline,
non-atomic start claim, audience-only claimant, duplicate permit return,
persisted/reconstructable/transported permit, digest used as authority, split
worker without an executor-owned provider socket, unsupported duplicate-
instruction/ambiguous-delivery/executor-failover or clock-rollback behavior,
missing executor credential/egress profile, master-key/general-write access,
unclaimed or cross-tenant credential-handle use, unrestricted shared privileged
credential, destination/TLS/DNS/redirect/general-proxy bypass,
missing/stale/reused profile/account/credential/broker epoch, non-atomic
local successor activation, unauthorized or self-approved profile activation,
unsigned/wrong-digest admission, hidden semantic expansion, stale activation
fence, ignored revocation tombstone, emergency replacement activation, missing
rotation state/evidence/unknown/deadline/outage profile, restored dual
redeemability, missing/non-co-located rotation guard, simultaneous non-terminal
rotations, unknown-state successor, unauthorized takeover, lost orphan/count
encumbrance, stale/unverifiable/insufficient/broader/wrong-policy capability
snapshot, missing/unreviewed evaluator or corpus, unsupported semantic construct
treated as known, complexity-budget fail-open, superset/incomparable/unknown
without whole-credential quarantine, non-privileged quarantine bypass, automatic
widening/break-glass promotion, unsafe subset continuation, evaluator lineage/
epoch rollback, unsigned binary/corpus activation, stale
snapshot after evaluator revocation, incompatible-node startup, partial
reevaluation, generic or incident-only quarantine clear, weak/stale/
inconsistent resolution, missing resolver separation, old-work revival,
remediation/business lineage merge, circular remediation authority, self-
approved bootstrap/recovery, shared channel/KMS dependency presented as
independent, stale recovery epoch, or false automatic recovery without an
independent provider path; missing evaluator job uniqueness, durable cursor,
fair-share ceiling, protected cleanup lane, current generation fence, or
fresh-evidence refetch; non-atomic evaluator-epoch/campaign-root creation, lost
capability membership intent, missing source partition/topology/sequence/high-
watermark/inbox receipt or delivery barrier, premature source retirement,
missing/corrupt membership journal/generation/high-watermark, projection or
search used as authority, unstable manifest/scan/receipt/final barrier, unfenced
shard move, unaccounted concurrent lifecycle mutation, incomplete
materialization/reconciliation proof, or predecessor
campaign satisfying a successor; remote permission
discovery in dispatch, restored revoked generation
or handle, stale queued instruction after
suspension, credential export from signing/mTLS/HSM, bearer serialization/TLS/
socket outside the broker TCB, separate broker caller claiming transmission,
missing HTTP/TLS/redirect/diagnostic/crash memory canaries,
mutable existing capacity class, tenant-invokable capacity policy, multiple
parents per policy lineage, non-co-located policy owner/parent ledger/floor set,
policy-controlled validation floor, shared floor/policy authority, missing
platform minimum or operational fences, coordinator-discovered/partial parent
set, missing root epoch/manifest conservation, finalization treated as stale
parent authority, missing/ambiguous active generation or successor supersession,
independent parent rollback, missing local activation CAS or blocked/
reconciliation state, prepared cancellation without one complete recovery
successor, independent prepared-parent restore, non-idempotent recovery receipt,
missing overdue-recovery escalation, unversioned or scalar floor profile/ratchet, incomplete/
lossy/overflowing key migration, stale/lower-floor node admission, weak mixed-
version floor, unsafe partial rollout, missing delayed-transition authority
recheck,
cross-partition transaction requirement; self-consistent manifest absent from
the trusted catalog, catalog signer/root substitution, stale/revoked catalog,
missing ancestor tuple, unknown semantic ID, or missing compiled
transition/outcome/recovery/P/N/M/F realization;
distributed-exactly-once capacity-transfer claim, unbounded or identity-changing
deadlock retry, and optional-performance fallback tests pass.

Also reject a `VIT-CAP-060` claim that omits any canonical receipt field,
issuer/consumer time high-watermark, continuity field, expiry tombstone, or
atomic bundle member; uses client-side deadline checks; reports an unproven
commit mechanism; permits a timeout-abandoned transaction to commit later; or
allows migration, downgrade, backup, restore, or import to reset those fields.
Reject VIT-CAP-060/061 when issuance can bypass its presentation/request/
admission/outstanding budget,
when pre-authentication bytes/concurrency/cryptographic/canonical-decode work
is unbounded, when presentation lane derives from a request body or untrusted
route, when emergency identities/audiences are not separately provisioned,
when lane capacity borrows, or when authenticated lane and fully authorized
budget class can differ,
when ingress accept/TLS/decode/executor/pool resources are shared or borrowable
across lanes without reserved capacity and an aggregate ceiling, when a route
confers authorization, when VIT-INV-061 is not the sole mapping owner or lane
promotion lacks SoD, when presentation debit and evidence do not commit before
lookup, when charge evidence is forgeable/exportable/reusable/unbounded, when
stage two does not recheck mapping generation/fence/profile/lane, or when a
stage-one crash can refund/reuse the debit,
when debit/evidence/sequence/`ChargedAwaitingStageTwo` can split, charge-ledger
saturation occurs after debit, disposition is open/reversible, a terminal kind
can change or return to awaiting, compaction loses the terminal kind/result
commitment, or timeout/age manufactures abandonment,
the exact replay horizon or maximum hot/backlog cardinality is unspecified,
compaction deletes before checkpoint installation, a covered request can look
absent, archive/proof loss permits reissue, checkpoint/key rotation is
unauthenticated, or storage-growth accounting and fail-closed alerts are absent.
Also reject a profile without a monotonic request sequence for every first-seen
authenticated canonical request; one that recharges request rate or renumbers
an exact retry; omits denied request ID/digest, caller/class, request-rate charge, typed
outcome, or success-to-issuance link from its authenticated request checkpoint;
deletes denial state before checkpoint; reevaluates a late compacted denial;
treats missing denial proof as new; or leaves denial rows/bytes, checkpoint
backlog, archive proof, decode allocation, verification work, or compaction
latency unbounded.
Also reject a merged/borrowable budget class, a break-glass path without its
own ceiling, any emergency exemption from ordinary authorization/deadline/
replay controls, consumer dense compaction without complete authenticated
issuer-range and trusted-time eligibility evidence, or a range gap/late receipt
that can be treated as absent. Reject issuance whose quota reservation,
sequence, receipt, idempotent result, or outbox can commit separately; any
timeout-, lineage-revocation-, or lineage-supersession-based release while the
receipt remains consumable; duplicate, partial, recomputed-key, issuer-forged,
or unauthenticated outstanding-counter release; loss of the original quota
claim set/budget epoch/reserve source; denial that creates authority or a
reservation; a presentation, first-seen request, or successful issuance that
escapes its respective presentation, request, admission, or outstanding
charge; an
exact retry charged request/admission/outstanding capacity again; an
authenticated canonical denial that can bypass presentation or request rate;
a terminal receipt with an open/unknown or `Reconciling` outcome (which must be
unrepresentable), omitted owner/authorization/receipt/intent/result/tombstone/
time/sender/key/message/outbox field, noncanonical optional intent, consumer-
result sequence rollback, conflicting replay; a settlement port accepting
`TopologyAuthorizationConsumerDispositionV1`,
`TopologyAuthorizationConsumerReconciliationEvidenceV1`, or
`TopologyAuthorizationConsumerReconciliationReceiptV1`;
consumer authentication credentials available to VIT-INV-061;
missing principal/authority sub-limits where a class has multiple callers; and
an unbounded, oversized, over-depth, cyclic, partial, or non-canonical range
manifest/chunk proof.

Exit criteria: correctness never depends on an unverified optional capability.
`v0.21.0 implementation stop reached. Run pentest for this exact commit.`

## `0.22.0` — Storage Conformance Testkit

Status: planned.

Setup: derive tests from every semantic port and every applicable stable
invariant declaration, `VIT-ENF-*` enforcement contract, `VIT-TST-*`
verification contract, `VIT-RCV-*` recovery field, lifecycle row, and exact
effective `VIT-LAW-*` generation. Validate generation coordinator, resolved
dependency set, activation fence, mixed-version intersection, migration,
rollback, semantic/recovery binding, canonical manifest bytes, and content
digest rather than only the latest law view. Expand every cited `@gNN` into
`g01..gNN` and verify every exact admitted tuple and semantic realization. The
authority disposition cites
exactly `VIT-LAW-001@g02`, `VIT-LAW-002@g01`, `VIT-LAW-003@g01`,
`VIT-LAW-004@g01`, `VIT-LAW-005@g04`, `VIT-LAW-006@g01`, and
`VIT-LAW-007@g01`, and `VIT-LAW-008@g01`; later Phase F generations are not valid `0.22.0`
conformance claims. Define
fault injection, concurrency
schedule, adversarial twin tenants with colliding local IDs, connection-session
state reuse, cleanup, administrator threat boundary, and evidence format.

Goal: make production-support claims depend on identical observable behavior.

Deliverables: reusable adapter harness, mandatory capability matrix, randomized
state machine, machine-readable declaration/enforcement/test/recovery/lifecycle
and law-generation coverage and conformance report; manifest/digest round-trip,
trusted-catalog round-trip/admission, ancestry enumeration, realization
dispatch, tamper, self-consistent-untrusted, noncanonical encoding,
semantic-drift, unknown-semantic, future-generation, planning-superset-as-
runtime, future-planning-tuple-in-active-catalog, combined-profile, omitted-
envelope-field, signer/root-substitution, activation-CAS, actual-predecessor-
digest mismatch, text-only artifact, wrong product/edition/compatibility scope,
global/local owner collision, partial rollout/unreachable node, revocation-
propagation lag, excessive time uncertainty, rollback/suspend/time loss,
revocation-versus-readiness/dispatch/start, and local catalog/distrust/time-
ratchet rollback fixtures; cloned workload/boot/placement identity, copied
ratchet, mutable topology manifest, illegal rollout transition, missing/
duplicate/contradictory/cross-generation receipt, topology join/leave/replace/
move race, post-activation abandon, unfenced quorum, and crash at every
prepare/activate/converge/finalize/revoke boundary;
claim crash-after-commit, expiry-before-response, revocation-before-replay,
restore-before-tombstone reconciliation, digest-mismatched historical replay,
freshness-proof misuse as mutation authority, missing/replayed/self-approved/
stale-at-issuance/manifest-substituted topology authorization, issuer/topology
collision, issue-versus-epoch-change/revoke ordering, post-issuance bounded
grant behavior, lost issuance response, circular break-glass, mixed hardware/
claim profile fields, signed-old/wrong-challenge/lower-sequence topology
receipt, proxy/cache replay, clock rollback, topology-owner failover, older
restore, omitted/substituted canonical authorization time/profile fields, and
split authorization/consumer-time-ratchet/expiry-tombstone/claim/topology-CAS/
fence-outbox fixtures. Add a `DeadlineConditionalTopologyCasV1` oracle that
pauses immediately after lock acquisition, after trusted-time observation,
before CAS submission, during backend commit, at client timeout/response loss,
and across backend failover. Advance time beyond `commit_before` at each point
and accept only a typed provably pre-expiry commit or
`TopologyMutationDefinitelyNotCommitted`; a reconciliation result may hide
which of those occurred but the backend must prove no transaction can commit
later. Reject statement-time-only checks, best-effort cancellation, late
commit, reset ratchets, lost expiry tombstones, and receipt V1 encoding/
authentication-preimage drift;
add a `TopologyAuthorizationReplayLifecycleV1` state-machine oracle covering
quota-before-allocation, horizon boundaries, checkpoint install versus hot-row
delete, concurrent old replay versus compaction, archive availability, proof
corruption, checkpoint coalescing, signing-key rotation, crash/restart, and
cardinality/backlog saturation. Include sparse consumer sequences, issuer
manifests with never-presented gaps, missing/duplicate/overlapping sequence,
maximum-deadline and horizon boundary, permanently unresolved seals, forged/
stale-fence manifest, and first presentation after compaction. It must prove
every covered receipt remains
denied or replays its original typed outcome, never appears unused, and that
archive/proof unavailability returns
`TopologyAuthorizationHistoricalStateUnavailable` without reissue;
exhaust normal capacity and prove one otherwise valid reserved break-glass
authorization succeeds, then flood break-glass and prove its ceiling denies
without consuming normal capacity or delaying revocation/recovery. During
checkpoint/archive outage and compaction saturation, the reserve bypasses only
normal capacity exhaustion—missing anti-replay/uniqueness proof still denies;
and destructive reference
adapters that each omit or split one `0.18.2` command/consumer/timer/activity/
poison bundle component: inbound or work receipt, events/head, fence validation,
audit intent, outbox, commitment, uniqueness claim, bounded quota claim-set/
per-kind transition, timer dispatch/result receipt, activity completion, or
dead-letter transition.
Include invalid reference adapters that accept two authoritative aggregate
streams, split an inline grant from its approval stream, mutate both approval
and dedicated grant streams, omit immutable approval receipt/outbox continuation,
treat redemption/attempt consumption as a second stream, mutate grant and effect
streams together, update a redemption guard by eventual projection, resurrect a
consumed attempt, read authority facts before rather than lock them during the
dispatch transaction, omit or eventually project a required authority epoch,
reuse a policy epoch after rollback, acquire composite rows out of order, retry
with a new identity, omit a current target fence, update the target fence by
eventual projection, accept a remote/cross-shard current target, restore a stale
deletion/supersession epoch, treat quota state as another aggregate, partially
reserve/reconstruct a claim set, reacquire set members, span quota partitions,
reclaim spent/encumbered child capacity, claim distributed exactly-once
capacity transfer, activate without inbox receipt, reclaim without authenticated
acknowledgement and old-epoch fencing, make transfer capacity free at both ends,
reclassify transfer owner/root/parent/period/lane/class/region, authorize an
acknowledgement for a different destination hierarchy, refresh a remote
validator after precondition failure, treat weak/ignored conditional mutation as
strong, treat unconditional review as an unguarded flag, mutate exception and
effect streams together, project an exception guard eventually, resurrect an
exception attempt, allow an admitted receipt to transmit without a bounded
window/current-fence start claim, extend a deadline on retry/restore, reuse a
start permit, return a permit twice or to an audience-sharing replica, persist
or transport permit material, expose it to an upstream/split worker, serialize
or clone it, treat its digest as authority, separate claim from the executor-
owned provider socket, let a replacement worker transmit, classify a lost claim
response or post-claim crash as definitely unstarted, give an executor master-
key/general database authority, expose bearer/API-key material outside the
hardened broker TCB, redeem a handle without the exact claim or for another tenant/
account/action/request/destination, bypass TLS/DNS/redirect/destination controls,
expose a general proxy, share one unrestricted privileged credential across
tenants, omit or roll back profile/account/credential/broker epochs, resurrect a
revoked profile or rotated handle, allow credential ABA, export key material
from a signing/mTLS/HSM profile, let a general connector serialize bearer auth
or own TLS/socket, let a separate broker caller claim transmission, omit HTTP/
TLS/redirect/diagnostic/crash memory canaries, treat evaluator identity/version
as metadata without one signed binary/corpus-admitted lineage and monotonic
epoch, keep old snapshots valid after activation/revocation, admit an
incompatible node, authorize partial reevaluation, clear quarantine with an
administrator flag or incident closure, resolve without strong revision/
consistency/resolver separation/current epochs, reuse the pre-resolution
capability generation or revive old work, merge remediation and business
credential lineages, derive remediation from quarantine, expose remediation
business operations, omit its cleanup quota, self-bootstrap or self-recover,
share the lost credential/KMS/channel dependency, roll back the recovery epoch,
or claim automated recovery without an independent provider path; lose or
duplicate evaluator jobs/cursors, use old output while queued, let one tenant
starve others, lend the cleanup lane to business work, or complete against a
superseded evaluator generation; split evaluator epoch from campaign root,
omit a source manifest/partition/sequence/high-watermark/destination receipt/
delivery barrier or membership mutation/journal/shard/scan/receipt/job, change
a sealed high-watermark, lose a concurrent disposition or fenced move, accept
completion without both barriers and zero mismatch, or let an old campaign
close the current epoch; omit a declared invariant/law or law lifecycle, alter
a dependency contract without versioning, omit an explicit semantic per-point
negative contract,
lifecycle row, acyclic version-ordered symmetric supersession, owner fence,
mixed-version rule, migration contract, or rollback floor; rewrite an existing
capacity class, use a cross-class adjustment, activate capacity policy without
its one owner or atomic co-located parent/floor transaction, let a policy lower
its own floor, reuse floor approvers to spend released capacity, ignore
operational fences/obligations/platform minimum, finalize from a discovered or
incomplete parent set, transiently over-allocate during multi-parent rollout,
activate from historical authorization IDs without current epochs, apply
prepared values after post-finalization ledger/floor/obligation/incident/tenant/
principal/policy drift, admit a lower floor profile or lose its durable ratchet
during upgrade/downgrade/restore, use a scalar/incomplete floor key, omit or
duplicate a key, accept lossy/rounded/overflowing unit conversion or incompatible
period/region/settlement migration, activate a historically finalized but
superseded rollout, independently roll back one parent, or restore a superseded
generation, cancel after preparation without atomically creating one complete
recovery successor, restore a prepared parent independently, accept duplicate/
non-idempotent recovery receipts, skip current-state/authority recovery checks,
or omit stuck-recovery deadline escalation,
or execute a network/provider call inside the transaction.

Verification: prove every deliberately incomplete bundle adapter and adapters
that lose snapshots, scheduler state, quota state, rejection receipts, audit
authority, or integrity commitments fail the relevant capability/conformance
test; prove grant-owner ambiguity, approval/grant two-stream commits, delayed
issuance after pre-issuance revocation, successor fork, noncanonical overlapping-
set acquisition, partial claim-set reservation/restore, token/digest mismatch,
revocation/final-attempt claim races, crash-before-provider-call claim
recovery, claim/receipt
substitution, target drift, consumed-attempt restore, non-co-located guard,
multi-stream redemption, cross-partition set, stale/duplicated hierarchical
lease, lease expiry/reclamation with retained bytes/unknown liability/spent
tokens, child loss, late settlement, every transfer crash/duplicate/reorder/lost-
ack/failover/stale-epoch/conflict and owner/root/parent/period/lane/class/region/
authorization-substitution case, emergency/security-cleanup-to-business
reclassification, remote validator/account/resource substitution, ABA
delete/recreate, weak/strong confusion, provider downgrade/ignored conditional,
unsafe automatic refresh, precondition-failure and response-loss outcome
misclassification, exception revocation/expiry/provider-capability/final-attempt
races, exception scope/request substitution, guard omission, restore
resurrection, long pause before transmission, revocation/expiry/capability
change after receipt, deadline/worker/audience/request substitution, clock
rollback, concurrent duplicate workers with shared credentials, claim ID/
worker-instance/lease-generation/permit-digest substitution, same-claim replay,
claim-response loss, stale lease takeover, pre/post-start-claim crash, old-
permit restore/reconstruction, uncertain retransmit,
split-executor duplicate instruction, permit RPC/IPC/queue/log/crash-dump
exposure, executor failover/compromise, digest-as-authority,
arbitrary unclaimed socket request, credential-handle tenant/provider/account/
action/request/destination substitution, reusable credential or bearer material
outside the hardened broker TCB, master-
key/general-write authority, egress allowlist/TLS/DNS/redirect/general-proxy
bypass, cross-tenant executor compromise, unrestricted shared credential, missing
residual-blast-radius evidence, profile/account/credential/broker epoch rollback/
reuse, emergency revocation/account suspension/rotation/ABA race, stale/restored
handle, signing/mTLS key export, caller-owned bearer claim/socket, HTTP/TLS/
redirect/log/diagnostic/crash memory-canary failure, evaluator security-fix/
semantic/corpus activation, unsigned digest, epoch rollback, mixed-node
downgrade, emergency revocation, partial reevaluation, unsafe quarantine clear/
old-work revival, weak/inconsistent resolution, missing resolver separation/
consistency barrier/new generation, sole-key quarantine, remediation compromise/
derivation/business use/circularity/substitution/outage/response loss/count
exhaustion/no-path automation,
protected-class conversion by adjustment, capacity-policy owner ambiguity,
non-atomic parent update, concurrent allocation, stale parent high-watermark,
delta/simulation/floor-version substitution, floor-update race, floor reduction
then spend by the same actor/approval lineage, approval substitution, stale
incident/emergency/obligation fence, platform-minimum violation, omitted parent,
add/remove/reparent race, duplicate alias, stale root manifest/epoch, incorrect
conservation total, coordinator failover, parent activation under another
manifest, allocation/reclamation/floor increase/new incident or obligation/
tenant suspension/principal revocation/policy supersession/parent failover
between finalization and activation, missing `ActivationBlocked`/
`ReconciliationRequired` result, floor-profile ID/version/digest/epoch
substitution, floor-key owner/root/kind/unit/scale/period/class/lane/region/
settlement substitution, omitted/duplicate key, rounding/overflow/lossy mapping,
lower-floor startup, mixed-version/downgrade/rollback/lower-default weakening,
concurrent successor creation, root cancellation/finalization race, partial
activation then rollback, late predecessor preparation/finalization/activation,
active-generation substitution, blocked-parent recovery, coordinator failover or
restore during supersession, cancellation after each preparation, lost/duplicate
cancellation/recovery delivery, missing or duplicate recovery successor/
receipt, independent parent restore, recovery drift/deadline escalation, policy replay/floor violation, partial rollout/
rollback/restore,
tenant-suspension/principal/policy change during delayed
activation or acknowledgement, missing/substituted authority fence,
missing/substituted target fence, target deletion/merge/migration/supersession/
restore and target-change-versus-dispatch races, stale projection and cross-
shard target placement, every authority-change-versus-dispatch race, composite
lock-order inversion, exhausted/identity-changing retry, active/active
authoritative topology, and remote-in-transaction adapters fail; run the memory adapter
through all atomicity/isolation/recovery cases.
For topology authorization, split every issuance-transaction write point and
prove no partial reservation/sequence/receipt/result/outbox state. Prove lineage
revocation and supersession before `commit_before` retain capacity; only
consumer-authenticated consumption/definitely-not-committed/permanently-
unresolved/receipt-revoked evidence or conservative expiry releases it. Forge
terminal evidence with issuer keys, change principal/policy/budget epochs before
settlement, and race settlement with consumption, expiry, failover and duplicate
delivery; original buckets release all-or-none exactly once. Prove every
pre-authentication byte, concurrency, handshake/signature/MAC, and canonical-
decode work limit before owner state. Present normal credentials to recovery
and break-glass endpoints, claim emergency class in the body, substitute
audience/profile/mapping generation, rotate and revoke lane credentials, fail
over and restore an older mapping, and prove fail-closed rejection. Flood many
normal principals without consuming emergency presentation/request capacity,
then flood break-glass and prove recovery processing remains available. After
policy evaluation, prove any requested-class/authenticated-lane mismatch
rejects without request/admission/outstanding allocation. Prove every
normal ingress accept/TLS/signature/decode/executor/pool exhaustion cannot
consume recovery or break-glass reserves, break-glass exhaustion cannot consume
recovery, and the global ceiling still bounds the aggregate. Prove the ingress
route grants no authorization. Race mapping proposal/SoD activation, rotation
and revocation against both stage commits. Split every stage-one debit/evidence
and stage-two evidence-consumption/request/issuance write point; crash before
and after each commit on every adapter. Prove protected lookup never starts
before durable charge evidence, a crash between stages leaves the charge spent
and forces a new charge, old continuity evidence cannot be reused, mapping
change fails before request allocation, and request/outcome/issuance remains
all-or-none. Stall Normal checkpoint/archive processing and compaction workers,
then exhaust Normal charge-ledger rows, bytes,
`ChargedAwaitingStageTwo` records, checkpoint backlog, I/O, and worker capacity
before stage one and prove no debit/evidence/initial disposition exists for
the rejected Normal request. Prove Recovery and BreakGlass still complete both
protocol stages. Saturate BreakGlass independently and prove Recovery remains
available. Exercise every lane at its boundary and prove the aggregate disk/
worker ceiling remains bounded, lifecycle work never borrows another lane, and
a backend without provable isolation refuses VIT-CAP-061. Race profile shrink
against stage-one reservation, stage-two terminalization, checkpoint creation
and compaction; interrupt activation before and after its CAS; fail over
between generations; restore an older larger profile; present insufficient or
forged physical-capacity evidence; and attempt to reassign Recovery capacity
to Normal or BreakGlass. Prove unsafe shrink remains `PendingDrain` or rejects,
the predecessor stays active until its atomic supersession, invalid or reversed
state edges deny, the exact active generation/digest wins, every existing
obligation remains in its original lane, old writers deny, and numeric maximum
merging never occurs. Prove every reduction—including an initially safe
lane-only, reserve-only, aggregate-only, storage-only, I/O-only, and
maintenance-worker reduction—must enter PendingDrain before activation, while
an equal-or-increasing successor may take the direct path. Race the initially
safe reduction classification/transition with a final predecessor-profile
admission; reject overflow, unknown-field, incomparable-unit, omitted-field,
and mixed-schema attempts to classify as non-reductions. Sustain stage-one
traffic throughout shrink; race
admission with fence installation, activation with the final old-profile
admission, and rejection/controlled abandonment with admission. Crash, fail
over and restore with a fence installed; attempt stale-worker clear/bypass and
multiple successors for one predecessor. Prove over-target work receives the
typed pre-debit draining denial, accepted obligations finish normally, only
the exact fence can be consumed, and Normal/BreakGlass drain cannot starve
Recovery. For aggregate-only disk, I/O, worker, row, byte, backlog, and
maintenance reductions, keep traffic flowing through individually unchanged
lanes and prove the derived affected-lane set covers every consumer, lane and
aggregate rows use the fixed lock order, and prospective aggregate usage
cannot bypass the successor. Recover active state from committed activation
records rather than highest profile generation; exercise proposed/pending/
rejected generations above the active one, multiple-active and contradictory
activation records, unreachable predecessors, pending/fence half-state, and
affected-lane mismatch. Prove direct fence install/clear calls are
unrepresentable or denied and only the atomic transition events exist.
Attempt every unauthorized, expired, replayed, self-approved, cross-tenant,
wrong-policy, wrong-predecessor/successor, diff/coverage/digest-substituted, and
nonce/idempotency-reused begin-drain against Normal, Recovery, BreakGlass, and
aggregate reductions; prove no successor/fence/event/outbox write. Race policy,
approval, predecessor version, and expiry changes with fence install and
activation. Attempt unauthorized rejection/abandonment and repeated
install/remove cycling; require action-bound authorization and audit evidence.
For begin-drain, activation, rejection, and abandonment, lose the response
after commit and require an exact retry to return the original result without
another event, outbox entry, audit-success, authorization consumption, or
sequence. Reuse the stable action/idempotency ID with changed canonical bytes,
digest, action, successor, or tenant and require the typed conflict with no
write. Exercise consumed-authority reuse, expired-unused and revoked-unused
authority, expiry during a long drain, policy/authority revocation while
draining, fresh activation/rejection authority, unavailable time, excessive
uncertainty, clock rollback, host suspend/resume, old-snapshot restore, signer
and key rotation, and authentication-profile substitution. The installed fence
must remain safe after authority revocation; historical begin-drain validity
must not require its expiry to extend through activation.
Delete, reorder, fork, duplicate, substitute, or roll back activation records,
checkpoints, active-head rows, journal positions, transaction identities,
authorization consumption/result/time/key high-watermarks, replay tombstones,
validation evidence, external high-watermarks, and response-loss results.
Delete the authorization checkpoint before hot replay-state deletion and prove
recovery denies rather than resurrecting authority. Prove activation sequence
exhaustion fails before mutation, direct activation records canonical-none
fence fields, and every active-row-versus-record contradiction denies recovery.
Use sparse, nonsequential action/idempotency IDs and exercise first late exact
retry after compaction, changed-digest late retry, authenticated sparse
membership and non-membership, archive outage, result-reference loss, missing/
reordered/duplicated/substituted chunks, checkpoint fork, key rotation/loss,
oversized encoding, excessive entries/chunks/depth/decode allocation/
verification work/jobs, verification-cursor crash/restart, compaction crash at
every checkpoint/archive/delete boundary, failover/restore, and cross-backend
migration. Only the archived original result, historical conflict, or typed
historical-state-unavailable is permitted; no dense watermark can establish an
arbitrary ID as unseen.
Race new consumption against snapshot, immutable chunk upload, verification,
head CAS and exact hot-row deletion. Exercise stale-head readers, competing
publishers, head sequence exhaustion/fork/predecessor/root/scope/version
substitution, checkpoint coalescing, delayed object-store visibility, unknown
upload/verification/local-commit responses, staged/orphan reads, orphan cleanup
before and after successor publication, committed-head rollback, and crash at
every publication-state edge. A stale or individual archive proof cannot
authorize non-membership; staged/orphan chunks are ignored; unknown publication
keeps hot state or reconciles the indivisible committed-head/delete bundle.
Add deterministic proof-to-execution pauses after proof verification before
the transaction, after head lock/re-read before hot-state lookup, after
observing absence before unique replay-row insertion, and at every concurrent
compaction/first-execution interleaving. Serve mismatched head/hot-row versions
from asynchronous replicas, followers, weak snapshots and caches. Require
typed head-changed restart or refusal; no schedule may combine proof for `H`
with absence created by `H+1`, execute twice, or perform network proof work
while holding the write transaction.
Continuously advance the head until every restart, cumulative proof-byte,
decode, work, elapsed-time and observed-advance boundary is reached. Exercise
malicious publication churn, failover, crash/recovery, cursor recreation and
adapter retry between accounting updates; none may reset the logical-attempt
budget. Exhaustion returns only typed replay-admission-contended with no
authority consumption or execution, while missing/corrupt proof remains
historical-state-unavailable. Reuse `action_id` with a new `idempotency_id`,
reuse `idempotency_id` with a new `action_id`, change only action kind, and race
both unique constraints. Test fair progress under Normal churn, bounded
compactor yield, unauthenticated queue pressure, and a Recovery drain using
protected capacity.
Run duplicate identical joins before proof, during `RestartPending`, during
takeover and at terminalization; exactly one attempt/budget exists and all
joiners observe one outcome. Change only the digest or either key component and
require conflict. Crash the owner at every lifecycle edge, race two takeovers,
resume with a stale fence, cancel/disconnect clients and restore old snapshots;
counters/deadline never reset and only the greatest fenced owner advances.
Attempt success must be atomic with replay row/action bundle; inject every
no-write terminal followed by a success attempt and require denial. Attempt
cleanup before checkpoint/link, missing or substituted links, active cleanup
and replay-state deletion must fail. Saturate active/terminal rows and bytes,
queues, per-principal attempts, takeover work, terminalization backlog and
cleanup workers, then prove bounded failure and Recovery progress during a
Normal attempt flood.
Crash before and after every capacity lock, bound check, reservation-set write,
attempt insert, lifecycle transition, action-bundle write, active-to-terminal
transfer, checkpoint write, envelope deletion, settlement write and commit
response. Inject duplicate/reordered/unknown-response settlement for every leg.
Require all-or-none creation, reservation-free join, fixed lock order, current
attempt/head/deadline/budget/fence revalidation, atomic success/no-write
transfer, no terminal-envelope release at checkpoint, exact release at physical
deletion, and no double decrement. Change capacity profiles between creation,
terminalization, checkpoint and cleanup; every debit/release uses the original
reservation buckets.
Lose the deletion-settlement response, retry after the envelope disappears,
compact the hot settlement row and retry again; every path returns one result
and one decrement. Substitute settlement ID, reservation set, leg, original
bucket/quantity, trigger or result and require conflict. Crash after the local
settlement/journal commit but before upload, after upload but before
verification, after verification but before archive-head CAS, and at the
archive-head-CAS/exact-hot-row-delete transaction boundary; the journal and
archive heads retain their separate meanings and the final boundary is
indivisible. Race a duplicate deletion against settlement compaction and race
a new settlement after the captured hot-row version/range; only the exact
covered rows delete.

Lose the checkpoint-settlement response and retry before and after its hot rows
compact; the authenticated attempt checkpoint, ordered settlement bundle,
journal append, original-bucket decrements, audit and result are either all
present once or all absent. Race checkpoint settlement against archive snapshot
and publication, then publish archives containing mixed checkpoint and
deletion legs. Substitute checkpoint and deletion trigger kinds or leg IDs and
require conflict without decrement. Restore and cross-backend migrate after
checkpoint settlement but before physical deletion; the checkpoint legs remain
settled, deletion legs remain unsettled, and all original balances/tombstones
are conserved. Remove checkpoint-settlement history/proof and require the
terminalization/checkpoint-backlog charge to remain conservatively held.
Round-trip the complete recovery codec, then omit each head, linkage, trigger,
settled-leg tombstone, remaining-leg set and original-bucket balance in turn;
decoding and admission must fail closed. Feed a purported singular-head snapshot
claiming local-journal, verified-archive, both, empty or fully reconstructable
meaning and require the same pre-mutation unsupported-schema quarantine.
Supply complete-looking hot rows, archives, chunks, keys, checkpoints,
reservation sets and balances alongside it and prove they still cannot invent
either historical chain. Lose the refusal response and retry; no destination
head, anchor, tombstone, balance, supersession or migration marker may appear.
Restore at every boundary between checkpoint settlement and physical deletion
and prove that neither leg set is reopened or pre-settled.

Fork or roll back either head, substitute their relationship, change head H
after proof verification, and remove archive keys/chunks/proofs; re-read/lock
detects the stale proof and the original charge remains conservatively held.
Prove archive non-membership with an absent envelope and require no decrement.
Exercise archive publication, coalescing and exact sparse IDs, proving no dense
inference. Saturate every settlement row/byte/checkpoint/archive/proof/backlog/
worker bound. Restore and cross-backend migrate after local settlement, during
publication and after compaction; both heads, their predecessor relationship,
hot-row versions, tombstones and balances must remain identical.
Drive every
permitted charge-disposition edge and reject undeclared edges, terminal-to-
terminal substitution, terminal-to-awaiting rollback, timeout-derived
abandonment, compaction before checkpoint, and compacted loss of the original
terminal kind/result commitment. Prove every
authenticated presentation—including every concurrent duplicate, response-
loss retry and historical replay—spends presentation rate. Prove exactly one
first-seen canonical denial atomically allocates one request sequence and
request-rate charge without creating an admission token/reservation/
authorization issuance sequence/receipt/outbox; exact retries reuse that
identity/outcome and never spend request/admission/outstanding capacity again.
During presentation-rate saturation, retry returns the transient presentation-
limited result without replacing the immutable request outcome. Changed-digest
request-ID reuse spends presentation rate, rejects conflict and creates no
request charge. Compact denial history across the hot-horizon boundary,
policy/approval change, checkpoint crash, archive outage, key rotation,
failover, restore and backend conversion; a late request returns its historical
denial or fail-closed unavailable-history, never reevaluation. Saturate every
denial row/byte/backlog/proof/decode/work bound.
For `TopologyAuthorizationConsumerTerminalReceiptV1`, omit or substitute every
canonical field, use an unknown outcome, make optional intent noncanonical,
roll back result/outbox sequence, replay a conflicting digest, forge with issuer
credentials, and attempt to construct a terminal receipt from
`Reconciling`; the type/codec/settlement port must make the latter
unrepresentable. Prove each closed terminal outcome, the separate reconciliation
receipt/evidence path, monotonic reconciliation-to-terminal transition, and
sender-only consumer/verify-only issuer role. Successful first-seen issuance
charges presentation, request, admission and outstanding; exact retry charges
presentation only. Exhaust one principal sub-
limit without exhausting its class. Feed oversized entry counts,
encoded lengths, decode allocations, verification work, proof depths, chunk
counts, cyclic/reordered/substituted chains, truncated terminal markers, and
resume-cursor crashes; each case rejects or remains sparse within the frozen
resource budget.

Exit criteria: an adapter cannot claim support by skipping or weakening tests.
`v0.22.0 implementation stop reached. Run pentest for this exact commit.`

Every `0.23.0`–`0.27.0` database adapter must map
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionGuardV1`
to an evidenced writer-authoritative isolation and locking profile. Its
capability probe must prove head-first/key-second locking, exact head re-read,
current-hot lookup and unique replay insertion share one local write
transaction with the atomic result bundle. Read replicas, followers, caches
and statement-level changing snapshots are never eligible authority sources.
It must also enforce the two independent replay-key unique constraints,
durably increment the logical-attempt counters/deadline across its native
retry, reconnect and failover behavior, preserve the typed contention/
unavailable-history distinction, and implement finite scheduler quanta without
allowing an unauthenticated session to hold compactor yield.
It must enforce one nonterminal attempt per canonical key, atomic identical
join versus conflict, owner/boot/lease/fence/CAS takeover, success co-commit,
irreversible terminals, every attempt-capacity reservation/bound and
checkpoint/link-gated envelope cleanup. Native retry or session failover cannot
create another owner or budget.
It must implement atomic reservation-set/attempt creation, the global replay
head -> optional settlement journal head -> key/attempt -> capacity -> profile/
fence/domain lock order, reservation-free
joins, pre-success attempt/head/deadline/budget/authority rechecks, original-
bucket active-to-terminal transfer and unique exact-once checkpoint/deletion
settlement records. Backend-generated retries cannot hide an unknown settlement
or recompute from the current profile.
Every checkpoint and deletion settlement must use the same journal/archive
namespace. Checkpoint settlement must co-commit original terminalization/
backlog decrements, immutable per-leg settlement rows, journal-head advance,
attempt checkpoint, audit and result. Physical deletion must co-commit its
separate original-bucket decrements, per-leg settlement rows, envelope deletion,
audit/result and predecessor-linked local settlement-journal-head advance.
Neither transaction implies archive availability.
The adapter must separately prove that only verified publication can advance
the archive replay head; publication locks that head before the journal head
and exact covered hot rows, rechecks the captured row-set version/range and
journal continuity, then atomically CAS-installs the archive head and deletes
only those rows. It must also prove archive-head-H revalidation before a proof
becomes authoritative, archive-head-plus-hot-plus-journal lookup, exact
archived retry versus typed conflict, no decrement from non-membership with an
absent envelope, conservative retained capacity for unavailable checkpoint or
deletion history, mixed checkpoint/deletion archive membership and conflicts,
exact sparse settled-leg tombstones, and bounded settlement rows, bytes,
chunks, proofs, checkpoint backlog and compaction work.
An adapter that cannot prove the required predicate/row-lock and uniqueness
semantics and both distinct CAS boundaries must report `VIT-CAP-061`
unsupported and refuse the feature; an emulation that narrows the guarantee is
not parity.

## `0.23.0` — SQLite Adapter

Status: planned; blocked until this milestone approves the exact SQLite driver,
bundling/native-code policy, maintenance, license, and file-encryption strategy.

Setup: document single-node limits, dedicated database-file-per-tenant strong
profile, shared-file evaluation-only profile, ownership, secure paths, journal
mode, transactions, busy handling, migrations, backup, cancellation, keys, and
the version-bound implementation-admission record. To claim `VIT-CAP-060`,
select and evidence one admitted `DeadlineConditionalTopologyCasV1` mechanism
inside SQLite itself; host timers, busy timeouts, connection interruption, and
statement-time predicates are insufficient. Otherwise report the capability
unsupported and refuse dynamic-topology-owner startup.

Goal: support development, evaluation, tests, and documented single-node use.

Deliverables: semantic adapter, migration set, secure file setup, backup/restore
tooling, capability profile, canonical
`TopologyMutationAuthorizationReceiptV1` codec/readback, complete issuer/
consumer time schema, atomic deadline-CAS evidence, quota rows, exact-replay
hot store, authenticated checkpoint/high-watermark, archive index, and bounded
compaction worker; include non-borrowable ingress-lane accept/TLS/decode/
executor/pool profiles with a global ceiling, two-stage presentation charge
rows/evidence/sequence/closed dispositions/result links/continuity/checkpoints/
compaction and atomic saturation behavior, non-borrowable per-lane charge
rows/bytes/awaiting/backlog/checkpoint/archive-I/O/compaction-worker
reservations below aggregate disk/work ceilings, immutable capacity-profile
lineage/typed-diff/activation-record/sequence/drain/provisioning-evidence rows,
drain-authorization identity/digest/replay state, activation checkpoints,
lineage/activation high-watermarks, the authenticated derived lane/aggregate
drain-fence row, atomic fence events and typed draining result, authenticated endpoint/
audience/credential-profile presentation-lane mappings with generation/fence/
revocation state, separate normal/recovery/break-glass counters and
reserve, issuer range manifests, consumer sparse commitments, and eligible-
through proof state.

Verification: injection, locking, crash rollback, symlink/permission attacks,
tenant isolation, interrupted migration, restore, every omitted/reset receipt/
time/profile/continuity/tombstone field, every `0.22.0` deadline-CAS pause
point, timeout with attempted late commit, replay-horizon/quota/checkpoint/
archive/compaction crash and concurrent-replay cases, bounded file growth under
maximum admitted issuance, sparse-gap/late-presentation range cases, normal-
exhausted break-glass success, break-glass flood isolation, and conformance
pass, including normal-to-emergency lane forgery, lane/class mismatch,
credential rotation/revocation, mapping rollback on restore, and pre-auth work
exhaustion, cross-lane ingress starvation, stage-one/stage-two crash boundaries,
orphan charge non-refund/reuse, mapping-change TOCTOU, every closed disposition
transition, terminal irreversibility, checkpoint-before-compaction, and atomic
charge-ledger saturation.

Exit criteria: no HA claim and all single-node semantics are evidenced.
`v0.23.0 implementation stop reached. Run pentest for this exact commit.`

## `0.24.0` — PostgreSQL Reference Adapter

Status: planned; blocked until this milestone approves the exact PostgreSQL
driver, TLS stack/profile, pool, maintenance, license, and native-code policy.

Setup: define TLS/authentication, non-owner least-privilege role, composite keys/
foreign keys, `ENABLE` plus `FORCE ROW LEVEL SECURITY`, transaction-local tenant
binding with pool cleanup/startup probes, prepared queries, migrations, and cancellation.
Record the version-bound implementation admission before adapter code begins.
The production profile must select and prove either an authoritative
commit-time predicate or hard no-late-commit fence for
`DeadlineConditionalTopologyCasV1`; PostgreSQL statement/transaction timestamps,
client timeouts, cancel requests, and connection loss alone do not qualify.

Goal: establish the deepest-tested reference production backend.

Deliverables: complete `0.18.2` atomic work-bundle variants plus journal, projection,
audit authority, rejection receipt, outbox, inbox, lease/scheduler, durable
quota with all-or-none canonical claim-set reservation/exact-token consumption,
co-located hierarchical capacity-lease accounting, grant-lineage ownership/
process-manager state, co-located redemption guards/attempt claims, snapshot,
co-located authority-fence epochs/sets, per-kind quota encumbrance and transfer
accounting, co-located target-fence rows and owner-update triggers,
`QuotaCapacityTransferState` outbox/inbox process manager and receipt ledger,
immutable capacity-transfer hierarchy/classification/authorization columns and
constraints, no-reclassification constraints, versioned unallocated-parent
capacity-policy lineage heads, parent-ledger epochs/high-watermarks, independent
floor-set rows, exact deltas/simulation records, atomic activation constraints,
atomic policy-event/parent-CAS/audit/outbox commit, conservative prepared/
finalized rollout receipts, root membership manifests/digests/epochs and total-
conservation constraints, active-rollout-generation/successor/cancellation/
supersession/cancellation-recovery state, idempotent recovery receipts/deadlines,
protected-floor history/reduction receipts/platform floor
profile/version/digest and fully typed keyed admission ratchet, total key-set
migration evidence, and cross-command separation records, prepared/activated/
blocked/reconciliation parent states and fresh active-generation guards,
delayed-transition current-epoch guards,
co-located remote-mutation-exception guard/attempt receipts and provider-
capability epochs, immutable transmission-window receipts and atomic start-
claim transitions with unique claimant/worker-instance/lease-fence/permit-digest
columns and no persisted permit material, executor/instruction audit binding and
an enforced prohibition on permit transport, immutable provider-execution-
profile ID/version, exact-claim secret-handle redemption receipts, denied
executor key/database capabilities, authoritative profile lineage/generation
plus monotonic profile/account/credential/broker-policy epoch rows and guards,
typed profile lifecycle command/proposal/approval/signed-admission/semantic-
diff/tombstone records and atomic activation constraints, authoritative
credential-rotation state with provider identity/permission/revocation evidence,
unknown outcomes, overlap/escalation deadlines and atomic local activation,
one-owner lineage and co-located rotation guard, rotation ID/successor/
idempotency/digest binding, takeover/inventory receipts, orphan lifecycle and
late-callback guards, provider-credential-count quota encumbrances, credential-
capability snapshots, monotonic local epochs, freshness/validator guards and
reconciliation cursors, raw-policy/normalized-AST/evaluator/language/comparison/
explanation evidence, reduced/quarantine state, incident/affected-execution
references and first-use fence, evaluator-lineage/generation/admission/epoch/
reevaluation/startup rows, capability-owner quarantine-transition/strong-
revision/consistency/resolver/new-generation/tombstone rows, remediation
profile/credential-lineage/approval/audit/epoch/egress/cleanup-quota and
rotation/takeover guard rows, credential-operation-profile/TCB placement,
and scoped egress/pool partition evidence,
canonical composite lock-order/deadlock-retry implementation,
integrity commitment, and configuration adapters; migrations, operator guide,
backup/restore, observability, canonical
`TopologyMutationAuthorizationReceiptV1` bytes/digest, complete VIT-CAP-060/061
issuer and consumer time columns/high-watermarks/tombstones, and the atomic
deadline-CAS mechanism/result ledger; plus pre-allocation budgets, hot exact
results, request and authorization issuance sequences, authenticated denial-
request and issuance replay checkpoints/covered-through high-watermarks,
archive proofs, issuer range manifests, consumer sparse/eligible-dense state,
bounded range chunks/verification cursors, layered deployment/issuer/principal
non-borrowable ingress-lane resource profiles/global ceiling, two-stage
presentation-charge evidence/continuity/checkpoint, and sole-owner/SoD
authenticated presentation-lane mapping state,
presentation/request/admission/outstanding normal/recovery/break-glass counters, original
quota claim sets/budget epochs/reserve sources, outstanding reservations,
receipt-revocation intents, terminal and reconciliation receipts and exact-once
settlements; canonical terminal outcome and separate disposition/
reconciliation evidence, result and outbox sequences/authentication roles;
non-borrowable reserve; denial and issuance
compaction/backpressure state; proof-work budgets; and growth metrics. Startup
fails capability negotiation if any
mandatory semantic component or transaction-domain placement is absent.

Verification: injection, auth downgrade, transaction crashes, concurrent append,
grant issuance/revocation reorder, revocation/final-attempt claim concurrency,
claim/receipt idempotency and substitution, consumed-attempt failover/restore,
grant/effect two-stream rejection, overlapping claim-set serialization,
deadlock/livelock, partial set crash/restore, hierarchical lease conservation/
per-kind encumbrance/reclamation/transfer/failover, late settlement, authority-
epoch revocation races, target deletion/merge/migration/supersession and current-
target dispatch races, stale target projection, target-fence restore,
capacity-transfer crash/duplicate/reorder/lost-ack/source-destination-failover/
stale-epoch/conflict/late-evidence and accounting-owner/hierarchy/parent/period/
lane/class/region/authorization-substitution cases, exception revocation/
expiry/provider-capability/final-attempt concurrency and restore, protected-
class adjustment rejection, existing-class immutability, capacity-policy floor/
simulation/replay, owner/parent/floor co-location, concurrent allocation/
activation, partial rollout/rollback/restore, delayed-transition stale-authority,
transmission-window expiry, current-fence start-claim concurrency, clock
rollback, duplicate shared-credential workers, lease takeover, claim-response
loss, claimant/claim/permit substitution, post-claim crash/unknown outcome,
permit restore/replay/reconstruction, omitted/aliased parent, membership epoch
race, manifest/conservation substitution, post-finalization parent ledger/floor/
obligation/authority drift, stale activation instead of blocked reconciliation,
floor-approval/cross-command-separation/operational-fence/platform-minimum
bypass, floor-profile/ratchet downgrade through startup, mixed-version upgrade,
rollback or restore, permit transport/digest authorization, duplicate
instruction/executor failover, arbitrary unclaimed provider request, credential-
handle/cross-tenant/account substitution, unrestricted shared credential,
profile/account/credential/broker epoch race/rollback/ABA/restore, signing/mTLS
key export, unauthorized/self-approved profile activation, digest/admission/
semantic-expansion/quorum/fence/tombstone bypass, every rotation-state crash,
duplicate provider creation, lost create/revoke response, eventual consistency,
old-key continued validity, overlap/deadline/outage failure, restored dual
redemption, simultaneous rotation, guard bypass, unknown successor, rotation/
generation/idempotency/digest substitution, timeout-then-create, late callback,
unauthorized takeover, orphan replay/revocation loss/restore, credential-count
exhaustion, two-stream local activation, provider permission expansion/reduction,
role/group/trust drift,
callback reorder, stale poll, wrong provider-policy validator, stale/restored
capability snapshot or epoch, wildcard/`NotAction`/deny/conditional/boundary/
organization/inheritance semantic error, evaluator downgrade, complexity-budget
failure, raw/AST/result/explanation mismatch, non-privileged quarantined use,
safe-subset policy bypass, queued/claimed/first-use quarantine race, automatic
widening, break-glass promotion, evaluator security-fix/semantic/corpus
activation, unsigned digest, epoch rollback, emergency revoke, partial
reevaluation, mixed incompatible node, unsafe quarantine clear/resolver/
consistency evidence, old-work revival, same-credential generation reuse,
remediation compromise/derivation/business use/circularity/cross-tenant
substitution/outage/response loss/count exhaustion/no-path automation, remote
permission discovery in dispatch, bearer
serialization/TLS/socket outside the broker, broker caller
claim, HTTP/TLS/redirect/diagnostic/crash memory leakage, destination/TLS/DNS/
redirect/general-proxy bypass, floor-key omission/
substitution/unit-period-region conversion/overflow, concurrent successor
creation, partial activation rollback, stale/superseded rollout messages/restore,
cancel-before-preparation, cancellation after every preparation point, lost/
duplicate recovery receipt, independent parent restore, parent drift and overdue
cancelled/prepared recovery, blocked-parent successor recovery, composite lock-order inversion and bounded retry,
cross-partition rejection, tenant bypass, pool exhaustion, migration rollback,
restore, every omitted/reset authorization receipt/time/profile/continuity/
expiry-tombstone field, every lock/time/CAS/commit/timeout/response-loss/
failover pause from `0.22.0`, attempted post-deadline commit, quota and
checkpoint races, compaction crash/failover/key rotation/concurrent replay,
archive loss, sparse consumer gaps/late presentation, normal exhaustion with
reserved break-glass success, break-glass flood isolation, bounded growth under
maximum admitted rate, atomic issuance crash points, timeout-preserved and
duplicate-settled reservations, lineage revoke/supersede retention, issuer-
forged terminal rejection, original-bucket settlement across policy changes,
presentation-per-retry/request-once/admission-once accounting, reconciliation-
type settlement rejection, principal
monopolization, denial request-sequence/checkpoint/horizon/archive-loss/late-
retry behavior, terminal-envelope field/outcome/authentication/result-sequence
conformance, and bounded range-chunk decode/verification exhaustion, and
conformance pass.

Exit criteria: production claims match tested deployment profiles only.
`v0.24.0 implementation stop reached. Run pentest for this exact commit.`

## `0.25.0` — MySQL Adapter

Status: planned experimental; blocked until a concrete requirement and
implementation-admission record approve the exact driver/TLS profile.

Setup: prefer database-per-tenant strong isolation; otherwise require composite
tenant constraints, generated statements, least-privilege views/routines, and
explicitly weaker non-production classification; map isolation, locking,
encodings/collations, TLS/auth, migrations, and cancellation. A
`VIT-CAP-060` claim additionally selects and proves an admitted
`DeadlineConditionalTopologyCasV1` commit-time mechanism; ordinary server/client
timeouts and best-effort cancellation do not qualify, and absence keeps dynamic
topology unsupported.

Goal: evaluate portable business correctness without making a `1.0.0`
production-support claim by default.

Deliverables: semantic adapter, migration/operation guide, capability profile,
and portability discrepancy register.

Verification: encoding/collation confusion, isolation anomalies, injection,
deadlock retry, rollback, tenant partition, restore, omission/reset of every
receipt V1 and issuer/consumer time/continuity/tombstone field, the complete
deadline-CAS pause/failover matrix, attempted late commit, and conformance pass.
The adapter also proves the common issuance budget, exact-replay horizon,
authenticated checkpoint/compaction, unavailable-archive denial, and bounded-
storage proof. That proof includes issuer range manifests, consumer sparse-gap
behavior,
eligible-through time/deadline checks, and independent non-borrowable normal/
recovery/break-glass counters and ceilings. It also proves one atomic
reservation/sequence/receipt/result/outbox issuance transaction, exact-once
terminal release from consumer evidence or conservative expiry, lineage revoke/
supersede retention, original-bucket settlement, distinct presentation/request/
admission rate accounting, authenticated lane derivation, non-borrowable lane
capacity, exact lane/class matching, two-stage charge commit/consume and mapping
TOCTOU recheck, denial request-sequence/checkpoint/late-retry and archive-loss
behavior, canonical terminal-envelope/outcome/authentication conformance,
principal/authority sub-limits, and bounded chunked manifest decoding and
verification.

Exit criteria: no backend-specific behavior leaks into domain correctness.
`v0.25.0 implementation stop reached. Run pentest for this exact commit.`

## `0.26.0` — MongoDB Adapter

Status: planned experimental; blocked until a concrete requirement and
implementation-admission record approve the exact driver/TLS profile.

Setup: bind tenant into every document ID, unique index, shard key, session and
transaction; co-locate stream head/events/receipts/outbox for atomicity; define
write concern, migrations, retry semantics, and topology limits. A
`VIT-CAP-060` profile must keep every authorization/consumer-time bundle member
in one transaction and prove an admitted `DeadlineConditionalTopologyCasV1`
mechanism under the selected write concern and failover model; driver timeout
or session cancellation is insufficient.

Goal: evaluate canonical event-journal behavior on a document backend without a
`1.0.0` production-support claim by default.

Deliverables: semantic adapter, collection/index definitions, capability profile,
backup/restore procedure, and divergence notes.

Verification: operator/query injection, partial transactions, retry duplication,
cross-tenant filters, failover, migration interruption, omission/reset of every
receipt V1 and issuer/consumer time/continuity/tombstone field, all deadline-CAS
pause points including primary failover and response loss, attempted late
commit, common quota/horizon/checkpoint/compaction/archive-loss/bounded-growth
cases, sparse-gap/range-manifest/late-presentation cases, break-glass reserve
isolation, issuance atomicity/settlement idempotency/principal isolation, and
lineage-retention/original-claim/consumer-terminal/presentation-versus-request-
versus-admission semantics, ingress-work bounds, authenticated lane derivation/
rotation/revocation/restore and exact lane/class semantics, non-borrowable
ingress resources, two-stage charge crash/TOCTOU semantics, denial request-sequence/checkpoint/late-retry/
archive-loss and terminal-versus-reconciling type/authentication semantics,
oversized/deep/partial/
cyclic manifest-chunk rejection, and
conformance pass.

Exit criteria: document flexibility never weakens mandatory journal semantics.
`v0.26.0 implementation stop reached. Run pentest for this exact commit.`

## `0.27.0` — SurrealDB Adapter

Status: planned experimental; blocked until a concrete requirement and
implementation-admission record approve the exact client/TLS profile.

Setup: use strict tenant namespaces/databases, schema and record permissions,
least-privilege non-system application identity, transactions, graph features,
query parameters, migrations, capability probes, and version support. A
`VIT-CAP-060` claim requires an admitted
`DeadlineConditionalTopologyCasV1` mechanism proven against the exact supported
server version; a query-time predicate, RPC timeout, or cancellation request is
not sufficient, and an incapable version reports dynamic topology unsupported.

Goal: evaluate graph capabilities as optimization without changing correctness
or claiming default `1.0.0` support.

Deliverables: semantic adapter, schema/migrations, capability profile, graph
optimization boundary, and operational guide.

Verification: namespace escape, query injection, unauthorized edges, transaction
failure, capability lies, backup/restore, omission/reset of every receipt V1 and
issuer/consumer time/continuity/tombstone field, every deadline-CAS pause/
failover/response-loss case, attempted late commit, common quota/horizon/
checkpoint/compaction/archive-loss/bounded-growth cases, and full conformance
pass; include sparse-gap/range-manifest/late-presentation behavior and break-
glass reserve isolation, atomic issuance and exact-once settlement, caller
sub-limit isolation, lineage-retention/original-claim/consumer-terminal/
presentation-versus-request-versus-admission semantics, ingress-work and
authenticated-lane derivation/non-borrowing/class-match semantics, ingress
partition/global-ceiling and two-stage charge/TOCTOU semantics, denial request-sequence/
checkpoint/late-retry/archive-loss and terminal-versus-reconciling type/
authentication semantics, and
bounded chunk/proof verification.

Exit criteria: optional graph behavior is replaceable and policy equivalent.
`v0.27.0 implementation stop reached. Run pentest for this exact commit.`

## `0.28.0` — Blob-Store API And Filesystem Adapter

Status: planned; encryption work is blocked until this milestone approves its
hash/encryption implementation admission.

Setup: define immutable blob ID/digest, tenant/case scope, envelope encryption
and tenant/data-class keys, staged upload, limits, quarantine, atomic publish,
retention/legal hold/disposition hooks, deletion verification, and filesystem root.

Goal: store large content outside event streams without path-based authority.

Deliverables: blob semantic port, secure filesystem adapter, manifest/integrity
model, quarantine lifecycle, and conformance tests.

Verification: traversal, absolute paths, symlink/hardlink races, digest mismatch,
partial writes, quota exhaustion, tenant confusion, and restore pass.

Exit criteria: callers never control storage paths and content is verified.
`v0.28.0 implementation stop reached. Run pentest for this exact commit.`

## `0.28.1` — S3-Compatible Object-Storage Adapter

Status: planned; blocked until the exact client, TLS stack/profile, signing
scheme, maintenance, license, and native-code admission record is approved.

Setup: bind tenant/object namespace, immutable digest identity, multipart upload,
conditional publish, encryption metadata, retention/legal hold, versioning,
deletion verification, credentials, endpoints, redirects, cancellation, quotas,
backup/restore, and eventual-consistency limits to the `0.28.0` port.

Goal: provide HA-capable object storage without leaking S3 wire/client types
into inner crates.

Deliverables: S3-compatible adapter, capability probes, credential broker
integration, lifecycle configuration, conformance fixtures, and operator guide.

Verification: bucket/key confusion, cross-tenant access, SSRF/endpoint spoofing,
TLS downgrade, multipart races, stale versions, retention bypass, credential
leakage, partial delete, restore, and object-store conformance pass.

Exit criteria: multi-node blob claims use a tested immutable object profile, not
the local filesystem adapter. `v0.28.1 implementation stop reached. Run pentest for this exact commit.`

## `0.28.2` — KMS And Secret-Provider Adapters

Status: planned; blocked until exact KMS/secret clients, authentication, TLS,
cryptographic profiles, maintenance, licenses, and failure semantics are admitted.

Setup: bind tenant/data-class key hierarchy, key IDs/versions, wrap/unwrap/sign/
verify operations, rotation, revocation, recovery, destruction, caching limits,
service identity, audit, rate limits, outages, and provider substitution.
Implement the provider credential rotation port as the exact asynchronous
`ProviderCredentialRotationState`: authenticated creation, identity/account/
effective-permission verification, atomic local activation, old-generation
revocation pending, evidence-confirmed completion, unknown/failed/manual states,
bounded overlap/escalation, and a declared single-credential maintenance
profile. Serialize it with one credential-lineage owner and co-located guard,
stable rotation/successor/idempotency/digest identity, authorized provider-
inventory takeover, bounded orphan quarantine/revocation, late-callback fences,
and provider credential-count quota accounting. Implement capability observation
as authenticated events or bounded polling producing versioned
`ProviderCredentialCapabilitySnapshot` values;
provider IAM discovery is never a dispatch-transaction operation.
Each adapter provides a reviewed versioned semantic permission evaluator and
conformance corpus for its policy language. It returns equal, subset, superset,
incomparable, or unknown under explicit expansion/work/depth budgets and binds
raw policy, normalized AST, evaluator/language, result, and explanation evidence.
Superset/incomparable/unknown drives whole-credential quarantine and a security
incident; safe-subset continuation is an explicit profile. Implement its
authoritative evaluator lineage with signed binary/corpus admission, exact
provider/language versions, monotonic epoch, emergency revocation, immediate
reevaluation of retained raw evidence, and incompatible-node startup gate.
Implement quarantine investigation/remediation/replacement-or-revalidation/
resolution using fresh strong-revision evidence, provider consistency barrier,
current epochs, separated resolver, fresh capability generation, and permanent
old-work tombstones. Implement provider remediation only through a separately
admitted cleanup-only credential/recovery channel and rotation/takeover guard;
providers without one advertise manual-intervention-only recovery.

Goal: keep master keys and long-lived secrets outside Vitheim processes while
preserving provider-neutral inner ports.

Deliverables: KMS and secret-provider ports/adapters, fake provider, envelope-key
broker, capability probes, rotation state machine/reconciler/evidence store,
rotation guard/takeover/orphan/count-quota tooling, permission-capability
observer/snapshot validator, provider semantic evaluators/corpora, quarantine/
incident/resolution workflow, evaluator-lineage admission/upgrade/revocation/
reevaluation tooling, independent remediation credential/channel profile and
cleanup-quota tooling, migration/rotation tooling, and operator runbook.

Verification: tenant/key confusion, stale/revoked keys, substitution, rollback,
cache leakage, confused deputy, outage/timeout/retry storms, rotation, destruction,
recovery, audit failure, every rotation crash point, duplicate creation, lost
create/revoke response, eventual consistency, continued old-key validity,
overlap/deadline, single-key outage, restore dual redemption, permission
expansion/reduction, role/group/trust change, callback reorder, stale poll,
wrong policy revision, simultaneous rotations, timeout-then-create, late
callbacks, unauthorized takeover, orphan revocation loss, credential-count
exhaustion, wildcard/`NotAction`, explicit deny, conditional resources/tags/
time/network/identity/session, boundaries/organization policy/inheritance,
evaluator downgrade/budget exhaustion, non-privileged quarantine bypass,
automatic widening, break-glass promotion, claimed-work race, and restored
snapshot/quarantine cases; include evaluator security-fix/semantic/corpus
upgrade, unsigned digest, mixed-node downgrade, emergency revoke, partial
reevaluation, unsafe clear or incident-only closure, weak/stale/inconsistent
resolution, missing resolver separation/consistency barrier, old-work revival,
sole-key quarantine, remediation compromise/derivation/business use/circular
dependency/cross-tenant substitution/outage/response loss/count exhaustion, and
false automatic recovery without an independent provider path. All fail closed.

Exit criteria: no production encryption/signing path depends on filesystem keys
or plaintext configuration secrets. `v0.28.2 implementation stop reached. Run pentest for this exact commit.`

## `0.28.3` — In-Process Secret Handling

Status: planned; any zeroization or locked-memory implementation is blocked
until its exact implementation, platform behavior, maintenance, license,
unsafe/native-code use, and measurable assurance are admitted.

Setup: define non-`Debug`, non-`Display` secret wrappers; prohibit ordinary
clone, equality diagnostics, serialization, formatting, and telemetry; minimize
plaintext scope/lifetime; bound cache size and expiry; define best-effort
zeroization, panic/error redaction, crash/core-dump policy, swap and locked-
memory profiles where supported, and plugin/worker isolation. Document where
compiler, allocator, copies, platform dumps, or runtime behavior prevent a
perfect erasure guarantee.
Define the hardened `BrokeredBearerTransmission` memory path explicitly:
authorization-header construction, HTTP serialization, redirect processing, TLS
plaintext staging, socket write, response/error handling, and drop/zeroization.
Bearer bytes may briefly exist inside that broker/executor TCB; this milestone
must not claim otherwise.

Goal: reduce exposure after secrets enter process memory without making false
claims about guaranteed physical erasure.

Deliverables: project-owned secret-handle/value interfaces, scoped reveal API,
redacted error/diagnostic types, bounded expiring cache, admitted best-effort
zeroization adapter, platform hardening matrix and operator guide, crash-policy
checks, bearer HTTP/TLS/redirect memory-flow map, and secret-sink test harness.

Verification: compile-fail formatting/clone/serialization cases; panic, error,
audit, log, metric, trace, crash-report, heap-dump fixture, swap-profile,
cache-expiry, cancellation, worker/plugin memory, bearer header serialization,
TLS buffers, redirect/error paths, and fault-path tests; canary
scans prove plaintext does not enter prohibited sinks.

Exit criteria: each supported platform states its exact memory assurance and
limitations, and no secret can enter audit, telemetry, crash reports, plugin
linear memory, or durable configuration through a supported API. Integrations
requiring plaintext run only as separately isolated hosted profiles and are not
ordinary Wasm plugins. Bearer material is confined to the admitted hardened
broker/executor TCB for the shortest practical lifetime and cannot enter a
general connector process. `v0.28.3
implementation stop reached. Run pentest for this exact commit.`

## `0.29.0` — Migration Registry And Resumable Migrations

<!-- vitheim-invariant VIT-INV-062 0.29.0 -->
<!-- vitheim-law VIT-LAW-009 0.29.0 -->

Status: planned.

Setup: define immutable migration identity/hash, ordering, preconditions,
forward/rollback steps, leases, checkpoints, signatures, operator approval, and
an explicit ban on rewriting original event bytes; event evolution uses the
`0.8.0` registry and pure `0.14.0` upcasters. Treat
`PlatformSafetyFloorAdmission` as monotonic security state: a migration may
raise a typed-key high-watermark through a governed capacity plan, but schema
rollback, binary downgrade, interruption, and restore cannot lower or omit it.
Every floor-profile change maps the complete canonical old/new
`PlatformSafetyFloorKey` sets with exact unit/scale and period semantics,
conservation proof, checked arithmetic, and no rounding or scope confusion.
Treat every invariant owner change or split as a registered migration. The old
and new `VIT-INV-*` lifecycle rows must contain symmetric supersession, stable
`VIT-FEN-*` old/new owner fencing, explicit mixed-version behavior, a resolved
`VIT-RCV-*` migration contract, and a rollback floor. A migration cannot edit
history to make the new owner appear original, activate both owners, or remove
the superseded row. The generated recovery manifest includes every applicable
stable invariant field before the new owner becomes authoritative.
Replay migrations additionally preserve the authoritative cumulative head,
replay-head/optional-settlement-journal-head/key lock-order contract, uniqueness
constraint and existing replay
claims, current hot rows, admission-guard isolation profile and typed
head-changed behavior, canonical replay-key encoding and both independent
unique indexes, logical-attempt counters/deadline, lane/class and fairness
scheduler state, attempt lifecycle/owner/boot/lease/fence/CAS, single-active
join constraint, capacity reservations/backlogs, terminal checkpoints/links
and cleanup high-watermarks, complete reservation-set IDs/original buckets/
balances, transfers, settlement IDs/legs/trigger/result records and lock-order
contract, greatest local settlement journal head, greatest verified archive
replay head, both non-wrapping predecessor/sequence chains and their
authenticated coverage relationship, root/key/publication state, exact covered
and current settlement hot-row IDs/versions/ranges, verification cursor,
settlement IDs, checkpoint-versus-deletion trigger kinds, ordered bundle
digests/results, attempt-checkpoint linkage, exact settled-leg tombstones,
remaining unsettled legs and conservative original-bucket balances as one
compatibility boundary. This roadmap defines no
`CapacitySettlementLegacyHeadMigrationV1` and no singular-head split: no
Vitheim release admitted that schema, and a single digest cannot authenticate
two historical chains. Migration preflight accepts only the complete canonical
two-head tuple. Any singular source-schema identity or representation is
quarantined before destination authority mutation, leaves the source untouched,
keeps the destination fenced/unready and every ambiguous capacity charge
conservative, and returns the same refusal on retry. It cannot be reclassified
as empty genesis even when it claims no settlements. Omission or defaulting of
any tuple member likewise denies. If a real external compatibility population
is discovered later, a new milestone must admit its exact source schema,
evidence, quarantine and idempotent application contract after security review;
`0.29.0` cannot improvise one. Migration between checkpoint settlement and
physical deletion cannot settle, reopen or reclassify either leg set.

Freeze project-owned `MigrationImportWorkBudgetV1` for every migration and
import job. It binds a stable job ID and closed migration-or-import kind;
tenant/deployment; exact source and destination identities; source schema/
version and canonical manifest digest; immutable budget-profile ID/generation/
epoch/digest; authenticated initiating principal and request/approval digest;
owner workload/boot/continuity; lease generation, fencing token and expected-
version CAS; and conservative creation/deadline state. The destination-local
migration registry implements `VIT-INV-062
MigrationImportJobAuthorityState` and is the sole writer of operation-key
uniqueness, job/budget/reservations, cursor, lifecycle, lease/fence,
candidate/tombstone, activation-barrier head/sequence/predecessor,
authorization consumption, result and cleanup disposition. This
security-control state is authoritative and must satisfy complete
`VIT-ENF-062`, `VIT-CAP-062`, `VIT-TST-062`, `VIT-RCV-062` and `VIT-FEN-062`
contracts. Its scheduler remains a non-domain authority: it cannot make
imported ticket, asset, identity, policy, audit or other domain state current.
Final domain admission remains exclusively with the existing invariant owners
and their shared verifiers under `VIT-LAW-009`.

The budget persists monotonic overflow-checked counters for cumulative source
encoded and decoded bytes, decode allocation/work, manifest entries, records,
blobs and chunks, hash bytes/work, signature checks, proof bytes/depth/work,
temporary and staged bytes/rows, open files, concurrent streams, checkpoints,
resumes, reconnects, adapter-native retries, conservative elapsed time,
cleanup/reconciliation bytes/rows/work/backlog, and concurrent jobs at
principal, tenant and deployment scopes. A canonical operation key over tenant,
deployment, operation kind, source, destination and manifest digest has at most
one nonterminal job. Exact job/material retry joins or resumes its counters;
duplicate job ID with changed material conflicts, and a fresh job/cursor/
connection/process cannot reset the operation or aggregate counters.

Job creation atomically reserves bounded staging/temporary storage,
verification CPU/memory/work, terminal result/checkpoint capacity, rollback-or-
quarantine cleanup capacity and protected non-borrowable Recovery progress
before source processing. Each reader, decoder, hasher, signature/proof
verifier, staging writer and reconciliation step durably precharges a maximum
bounded quantum before allocation or external work; unused reservation may
remain conservatively charged until terminal reconciliation, but no action can
overspend and later report it. Cancellation stops new source work without
resetting counters and enters the same fenced cleanup lifecycle.

Exhaustion returns typed `MigrationImportBudgetExceeded`, irreversibly blocks
source processing and destination promotion for that job/profile, preserves
the source unchanged, leaves destination authority fenced/unready, and enters
bounded resumable `CleanupPending`. Cleanup uses only its reserved capacity and
protected Recovery lane; Normal jobs cannot borrow it. Quarantine persists
only bounded canonical metadata, identities, counters, dispositions and
cryptographic digests, never attacker-sized source bytes, decoded values,
blobs, chunks or proofs. Exact retry after response loss returns the same
budget-exceeded/quarantine result. A larger successor budget requires explicit
current change authority, binds the exhausted predecessor and its counters, and
cannot silently restart work or erase the security record.

Define closed `MigrationImportJobLifecycleV1` with only `Admitted`, `Reading`,
`Staged`, `Verified`, `AdmissionPrepared`, `Activated`, and `CleanupComplete`
on the success path. `Rejected`, `BudgetExceeded`, `Cancelled`, `Quarantined`,
and `AdmissionFailed` are mutually exclusive irreversible pre-activation
dispositions; their separately bounded cleanup substate may advance but can
never return to preparation or activation. `Activated` is also irreversible:
later cancellation or exhaustion returns the canonical activation result and
cannot revoke authority. Before activation, every terminal disposition
atomically advances the job fence, permanently tombstones the candidate and
prevents cleanup, retry, takeover, failover or restore from promoting it.

Freeze trusted-code-derived `MigrationImportOwnerManifestV1`. Its canonical
derivation binds source and destination schema manifests, migration-plan
digest, the currently admitted destination `VIT-LAW-009@gNN` tuple and
canonical law-generation manifest digest, that authenticated generation's
complete dependency set, a fixed contributor-selection algorithm ID/version,
and every applicable invariant ID with its expected generation. The admitted
active law catalog under VIT-INV-057/058 and the verified
`LawGenerationManifestV1` are the only owner-universe trust roots. There is no
runtime `InvariantCatalogV1`, no mutable database-selected owner universe and
no separate invariant-catalog authority.

Importer input, the planning ownership registry and a self-consistent
invariant-catalog-shaped artifact may be comparison evidence but are never
authority. VIT-INV-062 verifies the admitted VIT-LAW-009 tuple and manifest,
resolves its authenticated dependency closure, and recomputes the selected
owners before candidate sealing and again inside activation. A stale or future
law generation, omitted or injected dependency, contributor-algorithm mismatch,
catalog or law-manifest digest substitution, unknown schema, generation drift,
or noncanonical non-applicable result denies. Any future invariant that can own
migrated state must enter a successor `VIT-LAW-009` generation and active law
catalog before that state can be imported.

The resolved dependency closure has two typed classes. Its one coordinator
entry is exactly `VIT-INV-062` with role
`DestinationMigrationImportCoordinator`; every other applicable entry is an
`ImportableDomainContributor`. The coordinator remains in the law proof and
activation lock set, but never contributes source rows, a dormant imported
generation, or a replaceable owner receipt. `MigrationImportOwnerManifestV1`
binds both the current destination coordinator identity/version/lease/fence and
the ordered domain-contributor set so exclusion cannot be mistaken for
omission. Any second coordinator, source-selected role, missing coordinator, or
attempt to classify VIT-INV-062 as imported domain state denies.

Freeze canonical `MigrationImportAdmissionCandidateV1`. It binds the job and
operation key; exact tenant/deployment, source/destination and manifest digest;
budget-profile identity and final cumulative counters; staged-state root;
complete trusted-code-derived owner manifest; every owner
identity, authoritative key, expected version/epoch and proposed dormant
generation/root; migration lease generation and fence; trusted-time interval,
deadline and exact activation-authorization digest; and candidate digest plus stable
idempotency identity. It also binds the exact
`MigrationImportRegistryHistoryLineageDispositionV1` tag and its complete
history commitment: Pending binds obligation, ordinary/cumulative budget and
lineage-profile digests; NoHistory binds the zero-eligibility proof digest; and
NotRequested binds the custody-record/approval digest. Every variant binds the
retention/classification/legal-hold identities and epochs used to prepare it.
Each existing invariant owner validates its portion and
prepares only a dormant, non-authoritative candidate generation. Its canonical
authenticated `MigrationImportOwnerPreparationReceiptV1` binds all candidate,
owner-manifest, owner, version/epoch, dormant-generation/root, verifier/build
and fence fields. Receipt authentication is issued only through an owner-held
signing/MAC capability. VIT-INV-062 receives verification-only access and
cannot fabricate owner preparation. Each receipt binds authentication profile,
issuer/signer identity, key epoch, owner continuity and replay ID; a backend
without portable verification must keep issuance and verification behind an
unforgeable owner-only capability.
Preparation never changes the current generation and one owner rejection
permanently makes the candidate `AdmissionFailed`.
Before sealing the candidate digest, the job pessimistically precharges the
complete bounded owner-preparation, activation, result and response-recovery
quantum, so the bound final counters already include every later handoff step.
No owner may perform uncharged preparation. The job moves from `Verified` to
`AdmissionPrepared` only while atomically persisting the complete unique
ordered receipt set and barrier draft; a partial set remains dormant in
`Verified` and cannot be interpreted as ready.

Freeze canonical `MigrationImportActivationAuthorizationV1`. It binds the
candidate and job IDs/digests; tenant/deployment and exact operation scope;
source/destination and schema manifests; staged root; owner-manifest digest;
budget profile/final counters; requestor, approvers, quorum and separation of
duties; policy, change and optional incident authority; issued-at, not-before,
expiry, maximum uncertainty, trusted-time profile/epoch and issuer continuity;
signer/issuer identity, key epoch and authentication profile; and nonce/
idempotency identity. It binds the candidate's exact history-disposition tag,
the variant-specific Pending lineage/budget, NoHistory proof or NotRequested
custody/approval digest, and the retention/classification/legal-hold identities
and epochs plus clearance-anchor source-manifest identity/generation/digest
approved at issuance. `MigrationImportActivationAuthorizationAuthorityPortV1`
is an independent authority-capability boundary. VIT-INV-062 and every domain
owner have verification-only access: registry, importer and migration runners
cannot mint or self-approve activation.

`AdmitMigrationImportActivationAuthorization` is the only operation that can
make an authorization usable. It authenticates the canonical issuer bytes,
rechecks candidate/scope/time/key/continuity and locks the authorization key
shared with revocation before transitioning `Absent` to `Issued`. Its durable
`MigrationImportActivationAuthorizationConsumptionV1` lifecycle is closed to
`RevokedBeforeAdmission`, `Issued`, `Consumed`, `ExpiredUnused` and
`RevokedUnused`. If trusted time proves the target lifetime ended before
admission, the same operation creates `ExpiredUnused` and never `Issued`.
Consumption is single-use and candidate-specific. Authorization bytes/digest,
the permanent consumption tombstone, time/profile/continuity/key ratchets,
canonical `MigrationImportActivationResultV1`, all domain-owner activations,
barrier/job result, audit and outbox commit in the same destination-local
transaction. Exact post-commit retry returns the original result. Reuse for a
different candidate, staged root, owner manifest, counters, request bytes or
history disposition/evidence/policy epoch returns typed
`MigrationImportActivationHistoryDispositionConflict`; other changed action
material returns typed `MigrationImportActivationAuthorizationConflict` without
mutation.

Revocation uses canonical `MigrationImportActivationRevocationIntentV1`
binding authorization and candidate digests; tenant/deployment and operation
scope; issuer continuity; a non-wrapping monotonic issuer revocation sequence;
signer identity/key epoch/authentication profile; reason code; issued-at,
not-before, the exact target-authorization not-after, maximum uncertainty and
trusted-time profile/epoch; and nonce/idempotency identity. It has no
independent earlier expiry: its not-after equals the target authorization's
signed expiry, and the permanent terminal/tombstone remains authoritative
afterward. The sequence high-watermark key is exactly
`MigrationImportActivationRevocationSequenceKeyV1(issuer identity, issuer
continuity, tenant, deployment, authorization identity/digest, candidate
digest)`. It orders successors for one target only; traffic for another
authorization cannot advance or invalidate it. The independent issuer emits it through an
authenticated outbox. VIT-INV-062 authenticates it through verify-only access
and records a destination-local inbox receipt; remote emission, transport
receipt or observation alone is not revocation.

`ApplyMigrationImportActivationRevocationIntent` locks the same canonical
authorization row as activation, verifies exact candidate/scope/current issuer
continuity and target-scoped monotonic sequence. If the row is absent, the
operation atomically creates `RevokedBeforeAdmission` bound to the exact
authorization identity/digest, candidate, scope and target lifetime. If it is
`Issued`, the operation CAS-transitions it to `RevokedUnused`. Both paths
atomically persist the intent bytes/digest, sequence high-watermark, inbox
receipt, permanent revocation tombstone, canonical result, audit and result
outbox. Revocation is effective only at this destination-local commit. Later
authorization admission locks that same row and joins the exact
`RevokedBeforeAdmission` result without ever creating `Issued`; changed
authorization bytes/digest/scope conflict without mutation. Exact duplicate
delivery returns the original revocation result; changed bytes, candidate,
sequence or idempotency material returns typed
`MigrationImportActivationRevocationConflict` without mutation.
If activation already committed `Consumed`, a late valid revocation returns the
canonical activation result and never reverses domain authority. Expiry uses
the same row and CAS rule. Therefore activation, expiry and revocation have
exactly one locally linearized result: complete consumption, expired-unused or
revoked-before-admission/revoked-unused.

Freeze canonical `MigrationImportActivationBarrierV1` containing the exact
candidate digest, complete ordered owner-manifest and preparation-receipt set,
expected current destination generations, current job state/lease/fence and
budget profile/final counters, activation authorization and closed consumption
state, the exact history-disposition tag, variant-specific evidence digests and
retention/classification/legal-hold identities/epochs, exact clearance-anchor
source-manifest identity/generation/digest, trusted-time evidence,
non-wrapping activation sequence/predecessor, and canonical result. VIT-INV-062 coordinates completeness and owns only this
security-control state. It cannot approve a domain transition, fabricate a
receipt or make prepared state authoritative.

The supported through-`1.0.0` activation profile requires the live coordinator
generation, job, candidate, barrier, authorization row and every affected
domain-owner activation guard to be co-located in one destination-local
transaction domain. The canonical full order is
`deployment-retirement-fence→active-coordinator-generation→job→candidate/barrier→authorization→ordered-domain-owner→control-settlement-archive-head→control-settlement-journal-head→recovery-capacity-parent-ledger→backend-storage-cost-active-recost-campaign-slot→backend-storage-cost-recost-campaign-fence→corruption-control-reserve→history-obligation→corruption-fence→corruption-control-lineage→corruption-control-lineage-checkpoint→lineage-disposition→recovery-authorization→clearance-anchor-source-manifest-head→clearance-anchor-source-manifest-authorization→corruption-clearance-anchor-registry→corruption-clearance-scope→corruption-clearance-authorization→corruption-clearance-attempt→corruption-rebuild→corruption-rebuild-rejection-authorization→archive-head→history/idempotency→recovery-lineage-budget→attempt/successor-budget→retention/legal-hold→audit/result/outbox`.
This is `VIT-LAW-009
AtomicMigrationImportActivation`: trusted derivation selects the exact affected
domain-owner set while every selected domain owner retains exclusive authority.
Authorization admission, revocation and expiry use that order's
deployment-retirement-fence→active-coordinator-generation→job→candidate/barrier→authorization prefix.
Every path rechecks
`AdmissionPrepared`, exact current job lease/fence, budget profile and final
counters, absence of every failure disposition, current trusted time and
authorization lifecycle, complete unique ordered receipts, exact staged root,
the independently rederived owner manifest, and every
unchanged domain-owner version/epoch; invokes each domain owner's own verifier;
then atomically consumes and tombstones authorization, activates all dormant
domain-owner generations, commits the barrier sequence/result, moves the job to
`Activated`, creates exactly one bounded history-append obligation or explicit
NoHistory/NotRequested terminal, and writes audit/result/outbox.
It rechecks the current history-disposition evidence and custody epochs against
the candidate, barrier and authorization and locks/rechecks the bound anchor
source manifest immediately before commit. Any tag,
Pending budget/lineage digest, NoHistory proof, NotRequested custody/approval
digest, policy epoch or anchor source-manifest change requires a fresh
activation authorization and
returns `MigrationImportActivationHistoryDispositionConflict`; it is never
substituted under a generally worded activation grant.
Missing, duplicate, reordered or substituted receipts, stale owner/job state,
partial preparation, expired authority or any owner rejection commits no
activation. Exact concurrent or response-loss retry returns the one barrier
result; changed material conflicts. No distributed transaction is claimed.
A topology unable to provide this complete local atomic boundary refuses the
migration/import profile before reading or staging authority. A future
non-co-located activation selector would be an authority root and therefore
requires a separately versioned invariant/composite-law review; it is not an
implicit fallback.

Cleanup locks and rechecks the barrier and job disposition. Before activation
it may remove only permanently fenced dormant/staged data through each owner's
non-authoritative cleanup port while retaining bounded result/tombstone
evidence. After activation it may remove only non-authoritative staging;
authoritative generations are thereafter governed and deleted solely by their
existing invariant owners. An active job with a missing/mismatched barrier,
receipt or owner generation is corrupt authority state and fails closed rather
than being reconstructed from staging.

VIT-INV-062 never prepares itself as a domain generation. One canonical
`MigrationImportCoordinatorGenerationV1` row owns the active non-wrapping
generation, schema/semantic/code digests, law generation, predecessor handoff
digest and fence. Every VIT-INV-062 job admission, authorization admission,
revocation, expiry, activation, cleanup, archive and bootstrap transaction must
lock that row first and compare its expected generation/fence before any
mutation. Handoff atomically advances it. A stale transaction begun under the
predecessor therefore cannot commit afterward. Supported storage enforces the
expected generation in its mutation interface/constraint and rejects an old
binary that omits it; old binaries remain unready during bootstrap.

Its schema can advance only through canonical
`MigrationImportCoordinatorBootstrapV1`, which binds a stable `BootstrapId`,
idempotency key, deployment/tenant scope, predecessor coordinator generation/
fence/schema and checkpoint digest, successor generation/schema/code/semantic
digests, exact admitted VIT-LAW-009 tuple/manifest, change and optional incident
authority, work-budget profile, authorization digest, requested-at and
canonical request digest. One predecessor generation has at most one
nonterminal bootstrap and one successor identity.

The bootstrap lifecycle is closed:

- `Proposed -> BeginAuthorized -> Draining -> Checkpointed ->
  SuccessorVerified -> Committed`;
- `Proposed` or `BeginAuthorized -> Rejected`;
- any nonterminal state before handoff may enter
  `CancelledBeforeHandoff` through an independently authorized cancellation
  that atomically clears the drain and advances the predecessor fence; and
- an unrecoverable validation, authorization, budget or cleanup failure enters
  `FailedFenced`.

`Committed`, `Rejected`, `CancelledBeforeHandoff` and `FailedFenced` are
terminal. Retryable work stays in its current state with monotonic attempts; no
transition skips checkpoint or successor verification.

Canonical `MigrationImportCoordinatorBootstrapAuthorizationV1` is the sealed
action-discriminated envelope for three independently issued, non-
interchangeable grants. Every variant binds bootstrap/request/action digests;
predecessor and successor generation/schema/code/semantic/law identities;
requestor, approvers, activator, quorum and SoD; policy/change/incident
authority; issued-at, not-before, expiry, maximum uncertainty and trusted-time
profile/epoch; issuer continuity, signer/key/authentication profile; nonce and
idempotency:

- `MigrationImportCoordinatorBootstrapBeginAuthorizationV1` permits only
  `BeginMigrationImportCoordinatorBootstrapDrain`. Its shared destination row
  is closed over `RevokedBeforeAdmission`, `Issued`, `ConsumedAtDrain`,
  `ExpiredUnused` and `RevokedUnused`.
  `AdmitMigrationImportCoordinatorBootstrapBeginAuthorization` is the only
  Absent-to-Issued transition; authenticated revocation against absence creates
  the permanent exact-bootstrap/action/digest tombstone. Entering `Draining`
  consumes it atomically with drain installation and
  `MigrationImportCoordinatorBootstrapBeginResultV1`; changed canonical
  material returns `MigrationImportCoordinatorBootstrapBeginConflict`. After
  consumption its validity is historical and later expiry/revocation cannot
  strand the drain.
- Fresh `MigrationImportCoordinatorHandoffAuthorizationV1` additionally binds
  the exact canonical checkpoint and successor-verification receipt. Its row is
  closed over `RevokedBeforeAdmission`, `Issued`, `ConsumedAtHandoff`,
  `ExpiredUnused` and `RevokedUnused`; only
  `AdmitMigrationImportCoordinatorHandoffAuthorization` creates Issued.
  Handoff consumes it atomically.
- `MigrationImportCoordinatorBootstrapCancellationAuthorizationV1` permits only
  `CancelMigrationImportCoordinatorBootstrap`, binds the current lifecycle,
  drain/checkpoint/successor state and requested cancellation reason, and has
  `RevokedBeforeAdmission`, `Issued`, `ConsumedAtCancellation`,
  `ExpiredUnused` and `RevokedUnused`. Only
  `AdmitMigrationImportCoordinatorBootstrapCancellationAuthorization` creates
  Issued.

Each action uses same-row authorization admission, revocation, expiry and
consumption ordering. Delayed admission joins `RevokedBeforeAdmission`; exact
retry returns the canonical action result and changed bytes/digest/action
returns its typed conflict without mutation. Begin authorization expiry or
revocation before consumption atomically terminalizes the bootstrap, releases
any reserved pre-drain capacity and advances the predecessor fence. Handoff
authorization expiry or revocation while Draining, Checkpointed or
SuccessorVerified atomically enters `CancelledBeforeHandoff`, clears the drain,
reserves/finishes Recovery cleanup and advances the predecessor fence.
Cancellation-authority loss leaves the already authorized begin/handoff path
unchanged and permits only a fresh bounded cancellation grant; it cannot reset
attempt or elapsed-time budgets.

Authenticated bootstrap revocation is one sealed, action-discriminated delivery
protocol, not three adapter-defined side effects.
`MigrationImportCoordinatorBootstrapAuthorizationRevocationIntentV1` binds the
bootstrap/request digest, begin/handoff/cancellation action kind, exact
authorization identity and canonical digest, predecessor and successor
generations/fences/schema/code/semantic/law identities, issuer identity and
continuity, signer/key/authentication profile, target authorization
not-before/expiry and maximum uncertainty, reason, non-wrapping sequence, nonce
and idempotency. Its
`MigrationImportCoordinatorBootstrapAuthorizationRevocationSequenceKeyV1` is
scoped to issuer identity/continuity, tenant/deployment, bootstrap ID, action
kind and exact authorization identity/digest; activity against one grant cannot
suppress revocation of another. The intent remains admissible for at least the
complete target-authorization lifetime. Transport delay, receipt at a relay or
remote outbox commit is never revocation.

`ApplyMigrationImportCoordinatorBootstrapAuthorizationRevocation` first locks
the active coordinator generation, then the bootstrap and exact action-
authorization row. One destination-local transaction authenticates the intent
and current issuer continuity, advances the target-scoped sequence, commits the
inbox receipt and permanent tombstone, changes Absent to
`RevokedBeforeAdmission` or Issued to `RevokedUnused`, terminalizes the
bootstrap and clears its drain when the action semantics above require it, and
stores `MigrationImportCoordinatorBootstrapAuthorizationRevocationResultV1`,
audit and result outbox. Exact duplicate delivery returns that result. Changed
bootstrap/action/authorization bytes, target lifetime, issuer continuity,
sequence, nonce or idempotency returns
`MigrationImportCoordinatorBootstrapAuthorizationRevocationConflict` without
mutation. A valid late intent against a consumed grant returns the already
committed begin/handoff/cancellation result without reversal. Admission,
expiry, consumption and revocation therefore linearize on the same destination
row, and restore must recover the inbox, sequence high-watermark, tombstone,
bootstrap terminalization and result as one atomic outcome.

`CancelMigrationImportCoordinatorBootstrap` locks active generation, bootstrap,
cancellation authorization, drain/checkpoint/successor and budget rows; rechecks
the exact nonterminal state; consumes the cancellation grant; clears the drain;
advances the predecessor fence; preserves checkpoint evidence; and atomically
stores `MigrationImportCoordinatorBootstrapCancellationResultV1`, audit and
outbox. Exact response-loss retry returns that result; changed cancellation
material returns
`MigrationImportCoordinatorBootstrapCancellationConflict`. Cancellation racing
handoff serializes on the bootstrap row: exactly Committed or
CancelledBeforeHandoff wins and the losing action returns the stored terminal
result.

`MigrationImportCoordinatorBootstrapCheckpointV1` canonically contains the
bootstrap/predecessor generation and fence; closed job, operation-key, budget,
reservation, candidate/tombstone, activation-authorization/revocation,
barrier/result, history-obligation/archive-head, cleanup and outbox high-
watermarks; schema/codec/law manifests; authenticated root/digest; non-wrapping
checkpoint sequence/predecessor; owner continuity and created time. A dormant
successor emits owner-authenticated
`MigrationImportCoordinatorSuccessorVerificationReceiptV1` binding that exact
checkpoint, successor schema/code/semantic/law digests, binary capability,
storage/isolation proof, boot/continuity, verifier identity, key profile, result
and expiry. Digest-only or registry-minted evidence is invalid.

`MigrationImportCoordinatorBootstrapWorkBudgetV1` durably limits rows/bytes,
decode/allocation/hash/signature/proof and successor-verification work,
checkpoint/copy/cleanup storage, attempts, elapsed time and concurrency. It
precharges bounded quanta and reserves terminal result, rollback and protected
Recovery cleanup capacity. Exhaustion fences the bootstrap and cannot discard
the authenticated predecessor checkpoint.

The current coordinator drains new admissions, terminalizes and outbox-settles
live jobs, checkpoints every control-state high-watermark, creates and verifies
a dormant local successor, then commits one predecessor-bound handoff. The
handoff transaction uses
active-coordinator-generation→bootstrap→handoff-authorization→checkpoint/
successor-verification-receipt→budget→audit/result/outbox locking, rechecks zero
live work and exact current authorization/budget/checkpoint/successor evidence,
advances the global generation/fence, consumes handoff authorization, commits
`MigrationImportCoordinatorBootstrapResultV1` and fences the old coordinator.
Exact request retry returns that result; changed bytes, successor, authority or
idempotency returns `MigrationImportCoordinatorBootstrapConflict` without
mutation. Response loss recovers only from the generation row plus canonical
result. The import candidate cannot seed or authorize bootstrap.

A migration or import
cannot route authority reads to a replica, synthesize absence, reset a unique
claim or restart budget, reinterpret contention as unavailable history, or
admit the destination until it proves equal-or-stronger
`VIT-CAP-061` semantics.
Treat every law-generation activation as a registered migration as well. It
must preserve the predecessor record, resolve the exact dependency delta only
after every added root is effective, persist the activation fence and contract
digests, enforce the conservative predecessor/successor intersection during
rolling deployment, and prevent rollback below the generation floor.
Persist the canonical predecessor and successor `LawGenerationManifestV1`
bytes/digests, verify both before each checkpoint or recovery transition, and
never synthesize a manifest from only the flattened latest law view. Preserve
and verify the `VIT-INV-057` global lineage separately from every
`VIT-INV-058` local catalog/distrust/time ratchet; preserve active catalog
ID/epoch, recomputed payload/envelope digests, exact profile, activation floor,
actual predecessor, exact scope, validity/maximum uncertainty, signer/root
epoch, revocation/successor state, every tuple in both ancestry closures, and
each closed semantic realization through the shared verifier. Independently
preserve `VIT-INV-059` rollout root/state, immutable topology/placement
manifest generation, outbox/inbox, prepare/global/convergence/revocation
receipts, irreversible authorization state and receipt/outbox atomicity, pinned
active rollout generation, authenticated global-result receipt/replay
tombstone, external claim issuance sequence, co-transactional local consumption
tombstones/outcomes/typed uncertainty, deadlines/escalation, exact local owner
identities, and all fences.
Preserve `VIT-INV-060` and `VIT-INV-061` separately: canonical
`TopologyMutationAuthorizationReceiptV1` bytes/digest and authentication
profile; every mutation/time/profile/continuity field; issuer issuance/time
high-watermarks; consumer trusted lower-bound/profile-epoch/continuity ratchet;
consumed and expired receipt tombstones; exact
`DeadlineConditionalTopologyCasV1` mechanism/profile and result ledger;
topology generations, member fences/tombstones, and fence outbox. A migration
updates this complete set transactionally or remains pre-migration and
unready. It cannot synthesize omitted fields, map unknown time profiles, reset
continuity, erase expiry/consumption, change the deadline-CAS mechanism, or
permit an older binary/schema to write. Downgrade below this schema is rejected
before opening the authority rows.
Preserve `TopologyAuthorizationRequestSequence`,
`AuthorizationIssuanceSequence`, pre-allocation budget state,
`TopologyAuthorizationIngressWorkBudgetV1`, non-borrowable
`TopologyAuthorizationIngressLaneV1` resource profiles and global ceilings, the closed
`TopologyAuthorizationPresentationLaneV1`, endpoint/audience/credential-profile
lane mappings, sole VIT-INV-061 ownership/SoD activation, and their generations/
fences/revocations, every presentation-charge ID/sequence/binding/disposition/
continuity/checkpoint, per-lane lifecycle capacity/reservation/maintenance
high-watermark and aggregate disk/work ceiling, active capacity-profile ID/
generation/digest/predecessor/state/typed diff/provisioning evidence, committed
activation record/sequence/checkpoint, drain-authorization digests/replay
state, lineage/activation high-watermarks, pending
successor and exact drain-fence identity/generation/digest/derived lanes/
reduced aggregates/sequence/continuity plus atomic fence events,
layered deployment/issuer/principal presentation-rate/request-rate/admission/
outstanding counters,
immutable original quota claim sets/budget epochs/class/reserve sources,
outstanding reservations, receipt-revocation intents, canonical consumer
terminal receipt envelope/outcome/result and outbox sequences, separate
reconciliation evidence/receipts, authentication roles, and exact-once
terminal settlement records; exact replay-horizon metadata; every
hot request/result not yet covered; authenticated denial-request and issuance
replay checkpoint chains/current digests/request covered-through high-watermark; issuer
dense issued-through watermark and bounded range manifest/chunks/verification
cursor, consumer sparse set commitment and any
`ConsumerCompactionEligibleThrough` proof, accumulator/archive digest/profile,
separate normal/recovery/break-glass counters/reserve, compaction
cursor/backlog, and key epochs. Migration installs and verifies the destination
checkpoint before deleting or transforming a source row; it cannot restart
sequence space, reopen a compacted key, silently shorten the exact horizon,
weaken proof availability, turn sparse consumer history into an unproven dense
range, split issuance atomicity, release a reservation from timeout, duplicate
a terminal release, release from lineage revocation/supersession without
receipt-specific consumer proof, recompute current quota keys, accept issuer-
forged terminal evidence, pass reconciliation evidence to the terminal-only
settlement port, omit or alter a terminal or reconciliation envelope field/
authentication role, lose/renumber/recharge a request
sequence, reevaluate a compacted denial, treat unavailable denial proof as new,
derive a lane from request content, roll back a lane mapping, merge or borrow
ingress or presentation-lane capacity, accept lane/class mismatch, merge the
two stage commits, refund/reuse/forge a charge, skip the commit-time mapping
recheck, accept evidence from fenced continuity, conflate presentation, request, and
admission rates, drop a caller
sub-limit, widen a range-proof resource budget, make budget classes borrowable,
or treat an unavailable archive as absence.
Replacement creates a successor placement generation and fresh admission;
migration never clones authority from a copied local row.
Migration authority cannot come from a manifest or catalog stored under the
same mutable database authority; a missing, stale, revoked, or untrusted
catalog blocks activation and rollback.

Goal: make schema evolution auditable, interruptible, and recoverable.

Deliverables: registry, planner, dry run, resumable executor, rollback evidence,
adapter migration contract, and floor-profile ratchet migration/compatibility
gate with total key-set mapping manifest and proof; preserve never-reused
provider-profile/account/credential/broker epochs, non-redeemable predecessor
generations, profile proposal/approval/tombstone state, rotation state/provider
evidence/unknown outcome/overlap deadline, rotation owner/guard/identity/
takeover/orphan/count encumbrance, capability snapshots/local epochs/freshness
provenance, raw-policy/normalized-AST/evaluator/language/result/explanation
evidence, evaluator lineage/generation/admission/epoch/reevaluation/startup
compatibility, reduced/quarantine investigation/remediation/verification/
resolution/new-generation/tombstone/incident/first-use state, independent
remediation profile/credential-lineage/approval/audit/epoch/cleanup-quota or
manual-only limitation, and cancellation-recovery
lineage/receipts across every schema change; include declaration/lifecycle/
contract-ID coverage, supersession receipts, old/new owner fence state,
mixed-version admission, rollback floor, evaluator campaign root/source
manifest/topology/outbox sequences/high-watermarks/inbox receipts/delivery
barrier/blocked state/membership journals/generations/high-watermarks/fenced
moves/scan receipts/final barrier/mismatch proof/stuck state, composite-law
generation/predecessor/coordinator/dependency/activation/migration/rollback/
semantic/recovery lifecycle plus canonical manifest bytes and digests,
planning-superset versus active-catalog separation, complete owned payload/
envelope metadata/full ancestry and ratchets, closed semantic realizations, explicit
per-point negative-child realization,
and concrete `VIT-RCV-*` fields. The adapter migration contract explicitly
accepts only complete two-head settlement state and exposes no singular-head
conversion path. It also exposes the durable `MigrationImportWorkBudgetV1`
transaction, precharge, aggregate-concurrency and cleanup semantics or refuses
the migration profile. Deliver the closed job lifecycle, canonical admission
candidate/owner-manifest/preparation-receipt/activation-barrier codecs, dormant
owner preparation ports, owner-local verification, one co-located activation
transaction and idempotent result/recovery/cleanup ports. No non-co-located
activation profile is supported.

Verification: reorder/substitution, partial failure, concurrent runner, lease loss,
downgrade, malicious input, retry, backup restore, floor-profile conflict,
interrupted higher-floor admission, lower-default binary, and stale-node startup
tests pass; include accounting owner/root, quota-kind, unit/scale, daily/hourly
period, class/lane, region/residency, settlement-version substitution, omitted/
duplicate key, rounding, overflow, and lossy mapping.
Include epoch rollback/reuse, credential/profile resurrection, credential ABA,
missing profile approval/tombstone or rotation/evidence/deadline state, restored
dual redemption, lost rotation guard/orphan/count encumbrance, stale/restored
credential-capability snapshot or epoch, changed evaluator semantics without
versioning, evaluator epoch rollback or old output restored as current,
incomplete reevaluation, incompatible-node admission, cleared/partially advanced
quarantine, missing resolution evidence or old-work tombstone, remediation
lineage merged with business authority, lost cleanup quota/manual-only
limitation, or affected-execution incident linkage,
asymmetric/unknown/cyclic or version-regressing invariant supersession,
inconsistent active/superseded/retired state,
missing owner fence, unsafe mixed-version admission, unresolved recovery
contract, rollback below the declared floor, deleted superseded history,
future-effective law dependency, skipped or rewritten law generation, latest-
view drift, missing generation activation fence/digest, unsafe generation
intersection, altered/noncanonical manifest, digest mismatch, or future-
generation conformance claim, self-consistent-but-untrusted successor,
catalog/root substitution or rollback, omitted predecessor admission tuple, or
unknown/missing semantic realization,
omitted/defaulted/truncated authorization receipt V1 field, reset issuer or
consumer time high-watermark, continuity substitution, erased expiry tombstone,
changed deadline-CAS mechanism, partial atomic bundle migration, downgrade
writer admission, or post-migration late commit,
reset issuance sequence/budget/high-watermark, omitted uncompacted hot result,
checkpoint-chain fork, accumulator/archive substitution, compaction before
checkpoint commit, shortened replay horizon, unavailable historical proof
treated as unused, issuer-range omission/forgery, sparse-to-dense promotion
without eligibility, late-presented gap acceptance, budget-class merge/reserve
loss, or key-rotation loss,
missing campaign membership journal/scan receipt/final barrier/mismatch state,
missing operation-profile discriminator, cancelled-prepared recovery receipt
loss/duplication, and restored independent-parent-release cases.
Present singular settlement sources under every claimed meaning and with
partial or apparently complete rows, archives, chunks, keys, attempt
checkpoints, reservation sets, leg sets and balances. Preflight must quarantine
before destination authority mutation, leave the source untouched, retain
conservative charges and keep the destination unready. Lose and retry the
refusal response; neither run may create a destination head, anchor,
tombstone, balance, supersession, checkpoint or migration marker. Only a
complete authenticated two-head source can proceed.
Feed millions of individually valid small records; cumulative encoded/decoded
bytes, allocation, record/blob/chunk counts and work must stop at the job
budget. Flood hashing, signatures and proof verification; exhaust temporary
disk, staged rows, open files and streams; crash after every precharge/cursor/
checkpoint/staging boundary; recreate cursors, reconnect, fail over, trigger
adapter-native retries and lose responses. Counters never reset or undercount.
Race duplicate job IDs, same operation under new IDs and changed-manifest
reuse. Saturate principal/tenant/deployment job limits and prove Normal
migration traffic cannot consume Recovery cleanup capacity. Budget exhaustion
never promotes destination authority, mutates the source or stores hostile
payload in quarantine.
Exercise every legal and illegal `MigrationImportJobLifecycleV1` transition.
Race exhaustion and cancellation immediately before every activation lock and
during the transaction; stale-owner takeover, cleanup and concurrent
activation attempts; and every owner-version change. Omit, duplicate, reorder
or substitute manifest members and preparation receipts; leave one owner
unprepared or rejecting; lose the activation response; fail over after
preparation; restore a prepared but unactivated candidate; and present
`Activated` with a missing barrier, receipt or owner generation. Exactly one
complete local transaction activates every domain owner plus job/result/audit/outbox,
or none does; no prepared state is readable as authority and no failure cleanup
can later promote it.
Test stale/future admitted VIT-LAW-009 generation, omitted/injected dependency,
contributor-algorithm mismatch, active-catalog or generation-manifest digest
substitution, and a self-consistent forged `InvariantCatalogV1`-shaped artifact.
Test cross-candidate authorization reuse; revocation intent emission versus
delivery versus local commit; revocation before authorization delivery;
authorization loss and late admission against `RevokedBeforeAdmission`;
activation/admission/revocation/expiry CAS races; duplicate, reordered, delayed
and changed-intent delivery; unrelated-authorization sequence reordering; target
authorization expiry during transport; late revocation after consumption;
issuer-key, sequence and continuity rollback; expiry after partial preparation;
registry-forged owner receipts; importer-supplied owner omission; failover/
restore before and after tombstone creation or authorization admission; and
response loss after either commit. Exercise every `VIT-LAW-009` generation
transition; only one complete activation or the exact typed no-write/idempotent
result is valid.
Exercise every bootstrap lifecycle edge and reject every omitted/skipped edge.
Race a predecessor job, authorization admission, revocation, activation,
cleanup and archive transaction across handoff; old/mixed binaries, missing
generation CAS, competing successors, changed-idempotency replay, bootstrap
begin/handoff/cancellation authorization replay, revocation-before-admission,
remote emission without destination apply, per-action sequence isolation,
changed-intent conflict, expiry before and after consumption at every lifecycle
state, delayed admission over tombstone, drain cancellation,
cancellation-versus-handoff, lost cancellation response, budget exhaustion,
checkpoint/verification-receipt omission or substitution, Recovery cleanup
after authority loss, response loss, failover, restore and rollback must yield
one fenced coordinator generation and canonical result.

This milestone also registers the VIT-LAW-009
`MigrationImportRegistryHistoryV1`/`AppendMigrationImportRegistryHistory`
semantic contract before cross-backend interchange consumes it at `0.30.0`.
Local conformance proves authenticated scope/provenance/original terminal
result/manifests, archive sequence/predecessor/idempotency, bounded work and
protected cleanup, nonterminal manual recovery with independently authorized
successor budget or separately authorized evidenced waiver/abandonment,
cumulative obligation-lineage budgets, same-row recovery-authorization
revocation, canonical custody records/disposition/result/conflict and the
non-negotiable rule that post-activation archive failure cannot alter
activation. Prove the initial lineage fits the platform hard maximum and that
no policy/profile/issuer/action/backend/idempotency/migration/restore/rollback
path can raise a ceiling, reduce a consumed counter or reuse an ordinal.
Crash/fault every activation boundary and prove Pending never commits without
its zero-counter immutable lineage row. NoHistory must prove authenticated
zero eligibility. NotRequested must bind the eligible digest/count and pass
current retention/classification/legal-hold/evidence-floor/compliance/legal/SoD
rechecks in its canonical record; activate a hold before commit and require
denial whenever omission weakens custody. Both terminals commit their distinct
evidence plus a canonical no-executable-lineage marker that binds why no budget
row exists. Substitute Pending/NoHistory/NotRequested after authorization,
change any variant evidence digest or rotate a bound policy epoch: candidate,
barrier and authorization mismatch must return the typed history-disposition
conflict and require fresh authorization. Every obligation atomically receives
Healthy fence generation zero; omit/delete/default/roll back the row and
require fail-closed corruption rather than implicit health. For every initial append quantum, crash
between both budget updates and work start; per-attempt and cumulative charges
must commit together, never undercount, and never be created lazily. Missing or
mismatched lineage for Pending/ManualRecoveryPending must return typed
corruption only after the exact obligation-scoped fence/result commits. Race
detectors, append, recovery and cleanup; exact detection joins one fence,
changed evidence conflicts, scope cannot widen and no cleanup/checkpoint occurs.
Model-check every history-operation pair against the universal lock order,
including a missing lineage row, and prove no fence-versus-budget inversion or
backend-specific absent-row lock behavior can deadlock or bypass fencing.
Clearance must authenticate/admit/consume one exact-target authorization,
survive pre-admission and Issued revocation/expiry/response loss, stay within
its proof budget and authenticate the activation bundle plus complete post-
activation lineage through the current destination-ratcheted anchor registry.
Race anchor admission/advancement against authorization admission and final
restore; omitted/downgraded anchors or a changed registry generation return the
typed stale result and never clear. Exercise the complete clearance
authorization operation table and durable attempt lifecycle. Crash, cancel,
take over and lose responses before/after every proof precharge, cursor/result
commit and terminal CAS; cumulative charges never reset or disappear, one
authorization has at most one active attempt, and every CAS loser rereads and
reapplies the table identically on every adapter. Admit multiple otherwise valid
grants against one fence generation and prove the clearance scope selects only
one live authorization/attempt. Rotate expiry, revocation, stale anchors and
per-grant exhaustion through replacement generations; every precharge remains
in the scope lifetime counters and no replacement exceeds remaining capacity.
PermanentlyUnprovable, Cleared and RebuildActivated tombstones reject all later
admission. Omit activation-created anchor-registry genesis, substitute its
source manifest, present raw generation without a committed manifest activation
record/operational-active head and verified external lifecycle/profile/active-high-
watermark,
restore a locally self-consistent older manifest/operational/candidate-head/
activation snapshot,
fork/gap/reorder genesis, checkpoint or a successor, withhold/revoke/rotate the
witness/key or lose checkpoint proof, weaken sources/
classes/quorum/nonresponse/time/continuity without an admitted transition
grant, or lazily initialize either lineage and require denial. Exercise
Prepared→ProposalPublishedVerified→LocalActivationCommitted→Active plus
Aborted/PermanentlyUnresolved transitions. Prove proposal publication cannot
advance the active high-watermark, the candidate head cannot displace its
externally Active predecessor until the activation receipt, an unresolved
candidate cannot poison that predecessor's readiness, authority/profile/CAS
loss produces authenticated abort, and unknown response uses status
reconciliation. Prove timeout, retry exhaustion and witness absence cannot
manufacture PermanentlyUnresolved; only its authenticated external terminal
seal can prevent a later activation. Saturate local storage before attempt
admission and after proposal publication; require a complete non-borrowable
completion reserve before the first send and successful bounded terminal
recording from it. Exercise profile root bootstrap/rotation, every compatibility
decision and emergency-distrust ratchet between local CAS and finalization;
only MayActivateExisting can advance operational Active, while the other
decisions authenticate LocalActivationCommitted→Aborted. Race concurrent
ActivateManifest/RotateProfile/EmergencyDistrust requests against the concrete
activation-fence port at every response-loss/status/rotation boundary; require
one final CAS receipt, predecessor continuity and fork/rollback refusal.
Independent witness signatures cannot pass the capability test. Lose or fully
compromise the current root and prove permanent fencing plus new-identity
reprovisioning, never in-place recovery or manifest activation. Attempt to
share a profile across tenants/deployments or admit a second nonterminal
attempt; require scope denial or exact join of the one bound slot. Record adapter lock
traces and reject every deviation from obligation→fence→lineage→checkpoint,
including settlement without the obligation/custody recheck. Exercise
manifest initialization, weakening and rebuild-rejection admission, pre-
admission/Issued revocation, expiry, consumption, response loss and every CAS
race through the complete destructive-authority table; remote issuance/
revocation alone has no effect. Omit/substitute each destructive revocation
issuer/continuity, signer/key/epoch/profile, issued-at/not-before/not-after,
target-lifetime coverage, uncertainty/time-profile/epoch, reason, nonce,
sequence and revocation-idempotency field and require canonical decode or
admission denial. Advance the registry while Healthy/no-scope,
with an Open scope and no live grant, with an Issued/EvidenceWait attempt and
against every terminal scope; the registry
and scope binding either commit their one canonical rebinding result or none,
all charges survive and no Open scope remains stranded.
Old, forked, incomplete, unanchored or over-budget evidence leaves the fence
permanent or requires fresh authority exactly as the state machine specifies.
Property-test the typed restoration algebra for idempotence, associativity,
commutativity, conservation, overflow and incompatible/forked evidence. Race
bounded rebuild proposals, retryable rejection, independently authorized
permanent rejection and activation across coordinator generations; require one
parent, at most one activated successor and commit-time recheck of fence,
unprovable result, anchor/source-policy, coordinator and custody state.
Saturate ordinary rows, bytes, audit and outbox capacity before and during
corruption detection for Pending, NoHistory and NotRequested. The non-borrowable
activation reservation must still commit fence/scope/result/audit/outbox and
every bounded terminalization. Reduce the active capacity profile afterward;
existing reservations and scope maxima remain intact, detector/adapter limits
are ignored, and new activation fails atomically when its full reserve is
unavailable. Repeatedly clear and re-fence through every allowed episode;
episode ordinals and proof/retry/hash/signature/bytes-processed/time WorkSpent
increase once across scopes and never reset, while rows/bytes-stored/audit/
outbox move independently through ReservedUnoccupied, Occupied,
ReclaimPending and Released. Exhaust every typed dimension, alias processed and
stored bytes, lose minimum future capacity, race rebuild and custody release,
crash around checkpoint/archive/deletion/settlement and retry after response
loss; require PermanentlyQuarantined, Rebuilt, ReleasePending or Released
exactly as specified, no operational return without the minimum reserve, no
WorkSpent refund, no physical release before archive/deletion proof and no
duplicate/recreated capacity. For every allocation and release, fault between
parent debit/credit, child transition and transfer-row/result writes; require
one atomic parent/child outcome, exact retry and
ParentTotal = ParentAvailable + active child + campaign RecostPending +
pending-successor + workspace encumbrances. Exercise each forward transfer as an equal
RecostPending decrease/pending-successor increase, inverse transfers and
activation reclassification without changing that total. Apply the same test
to publication-attempt completion reserves. Vary backend family/version,
schema/index generation, artifact kind, encoded size, expansion factor,
overhead and rounding; reject unknown/overflowing cost profiles, recompute
destination import charges and prove runtime disk-pressure guards can only
fence earlier.
For every workspace dimension, generate transitions and settlements against
immutable OriginalTotal, monotonic Released and exact leg membership. Fault
between live-bucket decrement, Released increment, workspace-member decrement,
ParentAvailable credit, inverse transfer, settlement/checkpoint/result/audit
writes and require all-or-none. Reject fractional/duplicate legs,
OriginalTotal rewrite, Released rollback/overflow and restore mismatch. Drive
unfair foreground acquisition schedules, release bursts, stale cleanup
claimants, response loss and activation backlog pressure; require a positive
cleanup quantum within the hard foreground bound, no no-op priority reset and
no hard-maximum overflow.
Drive AuthenticatedPresent and DeletionOutcomeUnknown from every cleanup crash
boundary with lost credentials, lost/rotated verification keys, inconsistent
object-store responses, failover, late evidence and exhausted reconciliation
for both Activated and Aborted CleanupOrigin. Return only to the origin-matched
pending state and bind retention to the exact activation-or-abort checkpoint.
Race cleanup, every fully typed retention and lineage-release authorization
admission/expiry/revocation/consumption, and custody release. Require exact
first-terminal retry, unchanged activation/abort, no evidence-as-authority, no
parent credit on CleanupReconciling/PermanentlyRetained, bounded removal from
the active cleanup lane, permanent-pool conservation and no foreground
deadlock.
For Quarantined and PermanentlyRetained workspaces, fault the broader lineage
release between each remaining-leg tombstone, Released advance, parent-member
removal/credit, CustodyReleased checkpoint/result/audit/outbox and final lineage
result. Require either the complete whole-member outcome or the fully
encumbered predecessor, never parent-released/workspace-encumbered divergence.
Generate linked workspace/control-leg bundles at, below and above every
CustodyReleaseBundleHardMaximum dimension. Record acquisition traces and require
archive/journal→parent→current-slot→old-fences-in-ID-order→control/lineage/
checkpoint→authorization/custody→outputs; over-limit bundles are no-write
before ReleasePending and no final transaction exceeds backend limits.
Fault explicit BeginLineageRelease and CommitCustodyRelease commands before/
after payload validation, authorization consumption, expected-version CAS,
publication receipt/head recheck, deletion, each ledger/leg write, result and
outbox. Exact retries must return the action-specific stored result; changed
begin/receipt/head/bundle/authorization/version/idempotency must return only the
matching conflict. Attempt direct terminal mutation from publisher/storage
adapter identities and require capability/dispatch denial.
For both retention and lineage-release grants, exhaustively run admission,
expiry, issuer Revoke intent creation, destination Apply, consumption and CAS
loss from every six-state row. Require monotonic issuer sequences, signed-intent
exact retry, no issuer destination write, no-write absent expiry/consumption,
late-admission revocation, stable terminal observation and stale/changed
conflict exactly as the shared table specifies.
Exercise admission, expiry, revocation and consumption from every state in the
total table, including every exact duplicate, changed-material conflict and
race; expiry winning must return its canonical expiry result without becoming
revocation. Expiry and consumption against Absent must return the one typed
NotAdmitted outcome without any row/tombstone/sequence/idempotency write;
admission of an authenticated expired grant is the only absent-to-expired path.
Every operation must encode its winning admission/expiry/revocation/recovery
result through the same closed outcome enum and every detailed conflict through
the matching Authorization/Revocation/Recovery variant of the one top-level
operation-conflict wrapper. Fenced is an outcome, never a conflict: admission/
consumption observes it without a write while expiry/revocation may still
terminalize existing authority without clearing the fence. Race
different operations on the same exact target and require CAS losers to reread/
reapply the table, never conflict merely because operation kinds differ.
Apply the same total-table suite to permanent-quarantine authorization:
Consumed revocation observes the stored quarantine result, ExpiredUnused
observes expiry, revoked terminals observe revocation, exact replays join and
only changed target/digest/scope/sequence/idempotency conflicts.
Admission may be followed by revocation or expiry; the first of consumption,
expiry and revocation to terminalize wins. Reused operation/idempotency identity
with changed target bytes/identity/digest/scope conflicts. Omit or substitute each revocation signer/key-epoch/
authentication-profile/issued-at/not-before/target-expiry/uncertainty/trusted-
time-profile/epoch field and require pre-mutation denial. Negative codec and
semantic tests must reject Waive carrying retry-budget fields, RetryAppend
carrying waiver or abandonment fields, changed action with a reused
authorization identity, unknown or duplicate action discriminants, mixed
variants, action-inapplicable fields, non-minimal options and `Some(empty)`.
Contradictory outer/payload action encodings must be unrepresentable; corrupt a
derived storage/index action and require read failure. Apply the same sole-tag
and canonical-absence tests to recovery results and revocation targeting.
Exhaust every
RetryAppend successor and prove it returns
ManualRecoveryPending with `MigrationImportRegistryHistorySuccessorBudgetExhausted`,
never AbandonedWithEvidence. Race fresh RetryAppend/Waive/Abandon admission,
revocation, expiry and consumption; reset attempts/counters through new
authorizations and backends; attempt to increase ceilings through policy/
profile changes; substitute policy/hold epochs or approvals; and
activate legal hold before commit. Only the action-authorized transition may
win, cumulative counters never decrease, and hold-weakened waiver/abandonment
writes nothing.

Exit criteria: interrupted migrations cannot leave unclassified partial state.
`v0.29.0 implementation stop reached. Run pentest for this exact commit.`

## `0.30.0` — Cross-Backend Export And Import

Status: planned.

Setup: freeze canonical export version, tenant scope, event/blob manifests,
integrity checkpoints, planning-superset provenance, separate `VIT-INV-057`
global lineage and `VIT-INV-058` local catalog/distrust/time ratchets, active
catalog identity/epoch/recomputed payload-and-envelope digests/exact profile/
activation floor/actual predecessor/scope/validity/maximum uncertainty/signer/
root epoch/revocation/successor fields and full generation ancestry; the
`VIT-INV-059` rollout root, immutable placement manifest, exact local owner
keys/fences, messages, receipts, irreversible authorization state, atomically
paired authorization outbox, authenticated global result/replay tombstones,
pinned active generation, action-claim issuer/consumption/uncertainty state,
and deadline/reconciliation state; separate VIT-INV-060/061 canonical
`TopologyMutationAuthorizationReceiptV1` bytes/digest, issuer time fields/high-
watermarks, consumer lower-bound/profile-epoch/continuity ratchet, consumed/
expired tombstones, topology/member generations/fences/outbox, exact
`DeadlineConditionalTopologyCasV1` mechanism/profile and result evidence,
`TopologyAuthorizationReplayLifecycleV1` quotas/horizon/hot results,
ingress-work and non-borrowable ingress-lane profiles/global ceiling,
presentation-lane owner/SoD mappings/generations/fences/revocations, presentation-
charge evidence/dispositions/continuity/checkpoint,
request and authorization sequences, denial-request and issuance checkpoint
chains/current digests/covered-through high-watermarks, set and archive
commitments, issuer range manifests/dense watermark, consumer sparse and
eligible-dense state, bounded chunks/verification cursor, layered caller/class
presentation-rate/request-rate/admission/outstanding counters, original claim
sets/epochs/reserve
sources, outstanding reservations/settlements, receipt-revocation intents/
canonical consumer terminal receipt envelopes/outcomes/result and outbox
sequences, separate reconciliation evidence/receipts, authentication profiles,
normal/recovery/break-glass counters/reserve,
denial and issuance compaction cursors/backlogs/proof-work budgets, key epochs,
and growth-accounting state,
encryption/signing ports, position mapping, and budgets.

Goal: migrate between backends without claiming direct database interchange.

Deliverables: streaming exporter/importer, preflight verifier, reconciliation
report, resumable checkpoints, source/destination mapping, and explicit
manifest/admission/semantic-realization closure. The importer reuses the exact
`MigrationImportWorkBudgetV1` job, operation-key uniqueness, monotonic counters,
precharged reservations, typed exhaustion, bounded quarantine and cleanup
lifecycle from `0.29.0`; export enumeration, transfer and destination staging
are charged to that same operation rather than separate resettable budgets.
It also reuses the exact `MigrationImportJobLifecycleV1`,
`MigrationImportAdmissionCandidateV1`, trusted-code-derived
`MigrationImportOwnerManifestV1`, owner-held authenticated preparation
receipts, independent `MigrationImportActivationAuthorizationV1` and its closed
consumption lifecycle, and `MigrationImportActivationBarrierV1` from
`0.29.0`. VIT-INV-062 rederives the exact owner set from exported and local
schema manifests, migration-plan digest, the currently admitted destination
VIT-LAW-009 tuple/manifest and its authenticated dependency closure;
exported/importer-supplied owner selection or a separate invariant catalog is
never authority. The derivation classifies VIT-INV-062 only as the live
destination coordinator; it is never an importable domain contributor. The
destination operation claim, budget, lifecycle, lease/fence, candidate,
authorization admission/revocation state, barrier, result, cleanup and outbox
remain authoritative outside the staged candidate through result/outbox
commit. Import preserves revocation intents, local inbox receipts,
exact-target sequence high-watermarks, consumption/revocation tombstones and
canonical results. Import never exposes a
partially prepared domain owner: all domain-owner generations remain dormant until the one
supported destination-local activation transaction atomically commits the
complete domain-owner set, authorization consumption/tombstone, barrier, job result,
audit and outbox under VIT-LAW-009. A destination that
would require a cross-partition, cross-region or external activation selector
refuses before staging rather than weakening the handoff.

Preflight refuses any source snapshot containing a nonterminal
`MigrationImportJobAuthorityState` as importable state, including a job
targeting this destination or referencing this operation. A source may export
only bounded, authenticated terminal registry history as inert
`MigrationImportRegistryHistoryV1`; it is excluded from owner roots and staged
authority, then may be appended after activation to a separate archival
namespace by a successor transaction. Stable job ID, operation-key,
authorization ID, candidate or barrier collisions return typed
`MigrationImportRegistryIdentityConflict` before staging and never merge,
replace or resume either lineage. Cyclic self-import and source/destination
aliasing deny.

The `0.29.0` `MigrationImportRegistryHistoryV1` contract canonically binds
history ID and idempotency;
archival namespace, tenant/deployment and classification/retention policy;
source coordinator generation/fence, original job/operation/candidate/barrier,
terminal lifecycle and result bytes/digest; source export and destination import
manifest/candidate/activation-result digests; authentication profile, signer/
issuer/key epoch and provenance chain; non-wrapping archive sequence,
predecessor digest and entry digest; and append-budget profile/counters. It is
evidence only and cannot be decoded through a live job, authorization, barrier
or owner-state interface.

The activation transaction always creates exactly one
`MigrationImportRegistryHistoryAppendObligationV1` beside its barrier/result/
outbox. Its closed `MigrationImportRegistryHistoryLineageDispositionV1`
commits exactly one lineage meaning. `Pending` atomically creates both the
bounded ordinary work-budget reservation and
`MigrationImportRegistryHistoryRecoveryLineageBudgetV1`. The lineage row binds
the obligation, exact
`MigrationImportRegistryHistoryRecoveryPlatformHardMaximumV1` profile identity,
version and digest, immutable cumulative ceilings no greater than that profile,
zero counters, initial ordinal zero and canonical predecessor absence.
`Pending` binds only bounded authenticated source-history descriptors,
entry/root digests, source/destination scope, archive namespace and policy,
activation result, those budget identities/digests and idempotency; it never
copies unbounded history into the activation transaction. `NoHistory` is the
terminal cryptographic proof that the authenticated source manifest contains
no eligible terminal registry history, binding its manifest identity/digest,
eligibility algorithm/version, zero eligible count and empty-set commitment.
`NotRequested` is a custody-governed terminal, not a policy shortcut. The
activation transaction locks and rechecks current retention/classification/
legal-hold authority before it commits canonical
`MigrationImportRegistryHistoryNotRequestedRecordV1`. That record binds the
authenticated source-history manifest and eligible-history digest/count,
retention and classification policy identity/generation/digest, legal-hold
state/epoch, required evidence-retention floor, policy-decision provenance,
records/compliance/legal approval authority with requestor/approver/operator
separation, activation result, commit-time policy receipt and audit/outbox
positions. An active hold rejects NotRequested whenever declining archival
would weaken custody; no stale receipt, emergency flag or ordinary retention
setting overrides that denial. `NoHistory` and `NotRequested` each commit canonical
`MigrationImportRegistryHistoryNoExecutableLineageV1` in addition to the
distinct evidence above, proving why no
executable budget row exists or is required and requiring canonical absence of
all executable-lineage fields. An absent obligation or a mismatched
obligation/lineage pair is corrupt activation state, never shorthand for a
terminal.
The same activation transaction creates exactly one
`MigrationImportRegistryHistoryCorruptionFenceV1` for every Pending, NoHistory
or NotRequested obligation. Its non-wrapping fence generation starts at zero
in `Healthy`; absence is corruption and never means healthy. Candidate,
barrier and activation authorization bind this initial fence identity/
generation beside the history-disposition commitment. Activation therefore
commits obligation, Healthy fence, lineage disposition and the variant-specific
lineage/proof/custody evidence atomically or commits none.

The candidate, barrier and activation authorization also bind the current
independently governed
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestV1`.
That manifest exists before the candidate is admitted. Stable tenant/deployment
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestLineageV1`
has closed
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestLineageStateV1`
`Uninitialized` or `Active` state and two separately stored heads:
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestOperationalActiveHeadV1`
and
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestTransitionCandidateHeadV1`.
The operational head alone selects the manifest usable by activation, reads,
exports and custody decisions and must equal externally Activated evidence. The
candidate head serializes Prepared, ProposalPublishedVerified,
LocalActivationCommitted, Aborted and PermanentlyUnresolved descendants and
grants no operational authority.
`InitializeMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifest`
is the only absent/Uninitialized-to-generation-zero path. It consumes the
independent policy-transition authorization defined below only at final
activation. Initialization first creates a non-authoritative Prepared
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestTransitionV1`
with canonical no-predecessor manifest bytes; preparation CAS-installs only the
transition-candidate head and leaves the operational-active head canonically
empty. Its closed
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestTransitionStateV1`
is Prepared, ProposalPublishedVerified, LocalActivationCommitted, Active,
Aborted or PermanentlyUnresolved. Prepared and ProposalPublishedVerified are
non-authoritative; LocalActivationCommitted has installed the destination-local
candidate head but is not externally Active and cannot replace the last
externally Activated operational head until final activation publication is
verified. The transition-candidate head orders candidates; it is never by itself
the operational-head selector. Genesis has no operational predecessor and
therefore remains unready.
`PrepareMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestTransition`
also prepares every successor under exact expected head/predecessor bytes.
Exact retry joins canonical
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestTransitionResultV1`;
an initialized competing genesis, changed bytes, identity/version mismatch or
competing transition returns
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestInitializationConflict`
without mutation. There is exactly one genesis; no adapter, deployment
configuration or activation worker can synthesize it.

Every manifest binds exact expected source identities and classes, manifest
generation/digest and policy generation, required per-class quorum and bounded
nonresponse policy, collection interval/expiry/maximum uncertainty/trusted-time
profile, and source signer/key-continuity requirements.
Checkpoint publication policy is independently governed state, not a call-site
choice. Stable
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublicationProfileLineageV1`
has a non-wrapping generation, exact predecessor and CAS-protected
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublicationProfileCurrentHeadV1`.
Each canonical
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublicationProfileV1`
binds its identity/generation/digest, exact witness/source identities and
classes, per-source authentication/key-continuity requirements, minimum quorum,
request/receipt codecs, time/uncertainty rules and availability/reconciliation
limits. Trusted code classifies each exact predecessor/successor diff with
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublicationProfileSuccessorClassificationV1`
as NonWeakening or Weakening. NonWeakening succession requires the independent
ordinary publication-profile owner; Weakening additionally consumes the
complete destructive policy-transition protocol below with action
`WeakenCheckpointPublicationProfile`, exact predecessor/successor bytes and
current-head CAS. The profile lineage has independently authenticated
activation/high-watermark evidence under a concrete, non-recursive
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublicationProfileTrustAnchorV1`.
That independently provisioned or compiled root binds domain, algorithm,
root-key set/quorum and genesis digest outside the mutable profile database.
Genesis requires a root-authenticated bootstrap. Rotation requires canonical
old-root authorization plus new-root possession proof and advances an
externally retained non-wrapping profile high-watermark; no profile signs
itself into trust. The supported through-`1.0.0` profile has no offline or
break-glass root-recovery authority. Loss or suspected full compromise of the
current root permanently fences and makes that tenant/deployment identity
unready; it cannot rotate in place. Recovery requires controlled reprovisioning
under a new deployment identity, with custody-preserving export/import treated
as untrusted evidence and every authority re-admitted. A later in-place
recovery quorum would require a new reviewed law generation and release
decision; no operator, database administrator or witness may infer it.
An authenticated local safety-stop may only force unready/fenced service and
emit audit/incident evidence; it cannot rotate a root, clear the fence, activate
a profile/manifest or transfer authority to the new identity.
Root loss does not depend on the lost root to authenticate its own retirement.
Canonical
`MigrationImportRegistryHistoryDeploymentIdentityRetirementV1` is owned by an
independently provisioned
`MigrationImportRegistryHistoryDeploymentIdentityRetirementAuthorityPortV1`
whose trust root and custody are separate from the publication-profile root.
The port may issue only canonical, single-use
`MigrationImportRegistryHistoryDeploymentIdentityRetirementAuthorizationV1`.
Its closed lifecycle is Absent, RevokedBeforeAdmission, Issued, Consumed,
ExpiredUnused or RevokedUnused. The independently authenticated issuer and
destination-local admitter are separate roles. Admission binds the exact
tenant, deployment identity, profile-lineage root, operational and candidate
heads, governance-fence predecessor, incident and closed reason, issued-at,
not-before, target-covering expiry, maximum time uncertainty and trusted-time
profile/epoch, issuer/key/continuity, quorum and separation-of-duty evidence,
nonce, authorization digest and distinct admission/revocation/retirement
idempotency identities. An authenticated revocation received before admission
creates the permanent authorization-digest tombstone. Expiry or revocation can
win only while Issued; consumption, expiry and revocation race on one
destination-local same-row CAS, exact retry returns its stored result and
changed material conflicts. Retirement authority possession alone is not an
admitted grant.

Genesis creates
`MigrationImportRegistryHistoryDeploymentRetirementFenceV1` as Operational;
absence is corruption and never means Operational. Its closed states are
Operational, RetirementPending and Retired. Every read, mutation, export,
worker admission, readiness decision, dispatch, external-send start and local
commit structurally locks or reads and rechecks this fence. RetirementPending
permits only status reconciliation, custody-evidence collection and
retirement terminalization; Retired permits only retained evidence reads and
the separately authorized old-custody import rule below. No cached readiness,
lease, queued work or already-created outbox bypasses a later fence state.

The retirement record's closed
`MigrationImportRegistryHistoryDeploymentIdentityRetirementStateV1` is
Pending, Retired or EvidenceUnavailable. Only
`RetireMigrationImportRegistryHistoryDeploymentIdentity` may create Pending
and terminalize it. Its first local transaction atomically consumes the
admitted Issued authorization, advances Operational to RetirementPending and
records Pending, a stable retirement request/outbox, audit and the
non-borrowable
`MigrationImportRegistryHistoryDeploymentIdentityRetirementCompletionReserveV1`
covering maximum status reconciliation, custody-evidence collection, terminal
result, audit, outbox, checkpoint and recovery work in that same transaction,
or none of them. Insufficient complete reserve makes admission no-write and
cannot leave a preparatory capacity encumbrance. The reserve remains encumbered across
unknown response, retry, failover and EvidenceUnavailable evidence collection,
and is released only by the ordinary authenticated settlement protocol after
a durable terminal checkpoint. A bounded
worker then submits independently authenticated RetireDeploymentIdentity to the
same governance-fence sequence used below. Its linearizable winner permanently
rejects every later profile or manifest operation for the old deployment; lost
response is status-reconciled before Pending can terminalize. Neither stage
needs a publication-root signature, and no distributed transaction is assumed.
Pending means the old deployment is locally safety-fenced while the external
retirement winner and bounded evidence collection remain in progress. Retired binds the old
tenant/deployment/profile lineage, last proved profile and operational/
candidate heads, external proposal/active high-watermarks, governance-fence
sequence/status, external transition terminal statuses, root generation,
incident, custody inventory and trusted-time evidence. EvidenceUnavailable is
an authenticated terminal finding that one or more required old-identity or
custody proofs cannot be recovered; it never asserts a guessed head or safe
custody state.

The retirement authority can only safety-fence, record Retired or record
EvidenceUnavailable. It cannot rotate a root, activate or terminalize a
manifest, clear a fence, export custody, admit an import or transfer authority.
Exact retry returns the stored state; changed identity/evidence/incident/
authority/idempotency conflicts. A separately authenticated fresh empty
deployment may bootstrap under a new deployment identity after either Retired
or EvidenceUnavailable without importing, mounting, serving or deriving
authority from old custody. Retired permits a later old-custody import only
through the ordinary untrusted import and complete re-admission path;
EvidenceUnavailable permanently quarantines that custody unless a future
reviewed law generation defines a stronger proof protocol. The replacement
genesis may cite the retirement record only as provenance and cannot copy or
continue the old profile generation, fence sequence, attempt slot,
compatibility decision, ratchet, high-watermark, authorization or idempotency
namespace. Absence of a retirement record blocks old-custody export/import but
does not block independently provisioned empty bootstrap under a genuinely new
identity; an operator-created linkage grants no authority.

The complete profile lifecycle is implemented only by
`BootstrapMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublicationProfile`,
`PrepareMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublicationProfileTransition`,
`ActivateMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublicationProfileTransition`,
`AbortMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublicationProfileTransition`,
`CheckpointMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublicationProfileLineage`,
`PublishMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublicationProfileHighWatermark`
and
`RestoreMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublicationProfileLineage`.
They exclusively mutate canonical
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublicationProfileTransitionV1`,
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublicationProfileCheckpointV1`
and
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublicationProfileHighWatermarkV1`.
Every operation binds expected profile head, trust-anchor generation, exact
predecessor/successor bytes, authorization/result, audit/outbox and stable
idempotency. Restore verifies the external profile high-watermark and complete
lineage; it never selects a raw local maximum.

Publication profiles are scoped to exactly one tenant/deployment/profile
lineage; sharing one mutable profile lineage across tenants or deployments is
unsupported through `1.0.0`. Canonical
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublicationProfileAttemptSlotV1`
is Empty or binds exactly one predecessor/profile-bound nonterminal attempt.
`PrepareMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestTransition`
atomically CAS-fills an Empty slot, exact retry joins it, and only an
authenticated terminal disposition plus completion checkpoint clears it.
Profile succession therefore classifies zero or one bounded attempt rather
than enumerating an unbounded set. The slot key and value bind tenant,
deployment, profile-lineage generation, expected slot version, attempt identity
and canonical attempt digest. Clearing compares that exact tuple; a stale
clear, second request identity, cross-tenant clone or changed attempt conflicts.
Restore cannot accept an Empty slot while retained external journal or
completion evidence proves a nonterminal bound attempt.

Every successor records
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublicationProfileCompatibilityDecisionV1`
for that optional predecessor-bound nonterminal attempt: MayActivateExisting,
TerminalizationOnly or EmergencyDistrust. Independently authenticated
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublicationProfileRevocationRatchetV1`
is monotonic and binds profile/key/witness distrust plus effective trusted time.
Profile transition/ratchet publication and manifest Activated disposition
serialize through one governance-root external CAS key,
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublicationProfileActivationFenceV1`.
The only external interface is
`MigrationImportRegistryHistoryManifestGovernanceActivationFencePortV1`.
Its domain-separated
`MigrationImportRegistryHistoryManifestGovernanceActivationFenceKeyV1` binds
tenant, deployment and profile-lineage identity. Canonical
`MigrationImportRegistryHistoryManifestGovernanceActivationFenceRequestV1`
binds stable request/idempotency identity, expected non-wrapping sequence and
predecessor digest, closed ActivateManifest/AbortManifest/
SealPermanentlyUnresolved/RotateProfile/EmergencyDistrust/
RetireDeploymentIdentity operation kind,
canonical operation/profile/ratchet digest, trust generation and signer/quorum
evidence. RetireDeploymentIdentity is authenticated only by the independent
retirement authority and permanently closes the old deployment's governance
key. The three manifest-terminal operations also bind
`MigrationImportRegistryHistoryManifestExternalTransitionKeyV1`: tenant,
deployment, profile lineage, manifest transition/checkpoint/proposal receipt
identity and digest, plus expected ProposedPublished disposition. RotateProfile,
EmergencyDistrust and RetireDeploymentIdentity encode canonical absence of a
transition key.
One linearizable compare-and-swap atomically installs exactly one winning value
and returns authenticated
`MigrationImportRegistryHistoryManifestGovernanceActivationFenceReceiptV1`;
status lookup returns canonical
`MigrationImportRegistryHistoryManifestGovernanceActivationFenceStatusV1`
containing the same final receipt, a still-pending unknown outcome or typed
unavailable history by stable request identity. Every activation request binds its expected
fence sequence and profile/ratchet digest. If activation wins that CAS, later distrust is a successor decision and
cannot retroactively rewrite the Active record; if compatibility change or
distrust wins first, the old-profile activation cannot commit and the candidate
must terminalize. Response loss reconciles the one external winner.
The port contract freezes monotonic sequence/finality, predecessor continuity,
fork and rollback detection, authenticated status history, quorum-intersection
or consensus assumptions and trust-root/key-rotation verification.
Request identity is globally unique within the fence key and permanently binds
one canonical request digest; reuse with changed material conflicts. CAS and
status reads are linearizable with respect to that key. A final winning or
losing result is immutable, status may report Pending only while the provider
cannot yet prove a final result, and unavailable history is never interpreted
as Empty, Pending or permission to resubmit with a new identity. Sequence
`n + 1` cannot finalize until the final value at `n` is durably readable and
its predecessor digest matches. For a manifest-terminal operation, that same
CAS also installs the unique immutable Activated, Aborted or
PermanentlyUnresolved terminal mapping and canonical
`MigrationImportRegistryHistoryManifestExternalTransitionTerminalReceiptV1`.
Linearizable
`MigrationImportRegistryHistoryManifestExternalTransitionTerminalStatusV1`
returns ProposedPublished or that one terminal receipt by transition key.
There is no separate journal writer or later overwrite path: the external
transition journal and its high-watermarks are authenticated projections of
these governance-fence receipts. Thus an abort before LocalActivationCommitted
still races activation and unresolved sealing on the same sequence and cannot
produce a second terminal meaning.
Retention or compaction must preserve an
authenticated checkpoint plus request-to-final-result membership sufficient
to reconcile every still-retained attempt; otherwise the profile is refused.
Independent witness signatures, a quorum of unrelated append-only receipts or
eventual last-write-wins storage do not satisfy the CAS capability. Missing,
forked, rolled-back or unverifiable fence history returns
`MigrationImportRegistryHistoryManifestGovernanceActivationFenceHistoryUnavailable`
and leaves activation/profile succession unready. Conformance races all three
terminal operation kinds against each other and against RotateProfile/
EmergencyDistrust/RetireDeploymentIdentity, response loss, status lookup,
rotation and rollback. It
must prove that no accepted history contains two terminal meanings for one
transition. An
adapter that cannot prove one linearizable winner refuses this profile.
MayActivateExisting permits final activation only under the exact compatibility
proof and current ratchet. TerminalizationOnly permits status lookup,
authenticated abort and unresolved sealing but never activation.
EmergencyDistrust rejects old-profile activation evidence regardless of receipt
time and uses the current governance root only for terminalization. Every
successor retains the declared status/terminalization capability for already
published predecessor-bound attempts without implicitly retaining activation
authority. A caller, adapter, transition worker, clearance role or witness
cannot select a mode, source set, compatibility decision or quorum.

Any profile-head change invalidates every Prepared or
ProposalPublishedVerified transition bound to the predecessor; it must be
externally aborted under the authorized terminalization path before a new
transition is prepared. A LocalActivationCommitted transition is handled by
its exact compatibility decision: MayActivateExisting may finalize after the
mandatory current-head/ratchet recheck, while TerminalizationOnly or
EmergencyDistrust must externally terminalize and atomically move
LocalActivationCommitted to Aborted without changing the operational Active
head. The consumed manifest authority stays consumed.
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestAuthorityPortV1`
is separate from clearance, detection, import and collection roles.
`AdvanceMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifest`
prepares under the transition-candidate head using expected-version CAS and
requires that no non-authoritative descendant is already live. It derives its
predecessor from the operational-active head using a non-wrapping generation,
exact predecessor digest and canonical
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestAdvanceResultV1`/
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestConflict`
exact-retry semantics.

Every Prepared transition creates
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointV1`
with non-wrapping checkpoint sequence, exact predecessor checkpoint, proposed
transition-candidate-head digest, current operational-active-head digest,
manifest/policy generation, transition authorization and
prepared-result digests, trusted-time evidence and signer/key/profile/
continuity. The transition authorization, checkpoint, every request/receipt,
activation record, transition-candidate head and operational-active head all
bind the exact checkpoint-publication
profile identity/generation/digest that was current when preparation committed.
Independent
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointAuthorityPortV1`
publishes it only under that governed profile.
`PublishAndVerifyMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpoint`
first creates one durable
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublicationAttemptV1`
with stable attempt/idempotency identity, profile binding, bounded request/
receipt/byte/retry/time counters, cursor, owner/boot continuity, lease and
fencing token. In the same local transaction and before the first external
send it admits a non-borrowable
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPublicationAttemptCompletionReserveV1`
from the protected Recovery capacity pool. Trusted code derives exact
rows/backend-cost-profile bytes-stored/audit/outbox/checkpoint and bounded
worker/I/O capacity for
all witness requests and receipts, reconciliation cursors, external activation/
abort/unresolved evidence, local transition/result, audit/outbox,
checkpoint/archive publication and reservation settlement. Ordinary work,
another attempt, an adapter or a profile change cannot borrow or resize it.
Insufficient complete capacity rejects the attempt atomically before any
externally visible publication.

The attempt and reserve share one admission result and stable reservation-set
identity. Reserve allocation and release use the same parent/child double-entry
capacity protocol as the corruption-control physical ledger: parent debit,
child reservation and the immutable parent/child transfer record commit
together. Every completion write consumes only its bound physical-capacity leg.
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPublicationAttemptCompletionCheckpointV1`
must authenticate the terminal external disposition, every local result and
complete capacity ledger before
`ReleaseMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPublicationAttemptCompletionReserve`
can settle unused or archived-and-deleted physical legs through the unified
settlement journal/archive protocol. Unknown external status, missing
checkpoint/archive membership or uncertain deletion retains the reserve.
Every selected witness receives a stable
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointWitnessRequestV1`
and returns an independently authenticated
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointWitnessReceiptV1`;
response loss never creates a second logical request. Timeout or unknown
response invokes
`ReconcileMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublication`
to query status by those identities before another bounded send.

The external
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestExternalTransitionJournalV1`
has closed
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestExternalTransitionDispositionV1`
ProposedPublished, Activated, Aborted or PermanentlyUnresolved and two distinct
non-wrapping heads:
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestProposalPublicationHighWatermarkV1`
and
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestActiveManifestHighWatermarkV1`.
The journal is a read projection of the governance-fence sequence and
per-transition terminal map, not an independently writable authority. Only
the port's ActivateManifest CAS may produce Activated. Only
`AbortMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestExternalTransition`
may request AbortManifest, and only
`SealMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPermanentlyUnresolved`
may request SealPermanentlyUnresolved; both exact-reconcile the returned
terminal receipt/status before any local CAS. A terminal request whose key is
already terminal exact-joins only when operation and digest match; every other
terminal meaning returns the immutable winner without mutation. Proposal,
terminal receipt, request identity and governance sequence are retained as one
authenticated membership proof.
Proposal publication advances only the proposal head and can never assert that
the manifest is active. Once the governed quorum authenticates proposal
publication, canonical
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublicationReceiptV1`
and the local attempt CAS the transition to ProposalPublishedVerified.
Unavailable, insufficient, stale, revoked, profile-mismatched or discontinuous
evidence keeps it non-authoritative.

Only
`ActivateMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestTransition`
may CAS a ProposalPublishedVerified transition to LocalActivationCommitted and
install the local transition-candidate head. It rechecks the bound publication-
profile head, revocation ratchet and current operational manifest predecessor.
Initialization/weakening consumes its
still-Issued destructive grant in this transaction; strengthening consumes the
exact ordinary source-manifest authority result. Manifest, local candidate head,
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestActivationRecordV1`,
publication receipt,
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestInitializationResultV1`
or advance result, audit and outbox commit together or none. Fork, duplicate
generation/checkpoint, gap, reorder, predecessor mismatch and wrap are rejected.
Exact retry joins the closed transition result; changed transition/publication/
head/authority material returns
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestTransitionConflict`
without mutation.

After that local CAS, the durable publication attempt publishes and verifies
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestExternalActivationReceiptV1`
as the ActivateManifest terminal receipt from the same governed profile and
transition key. Only
`FinalizeMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestExternalActivation`
may then advance the external active-manifest high-watermark and CAS
LocalActivationCommitted to Active. Before accepting the receipt it locks and
rechecks the current publication-profile head, exact predecessor-bound
compatibility decision, trust-anchor generation and revocation/distrust ratchet.
Only MayActivateExisting under the current ratchet permits activation.
TerminalizationOnly or EmergencyDistrust invokes the authenticated external
abort path and atomically restores the transition-candidate head to its
operational predecessor while recording Aborted; genesis returns to the
canonical no-candidate state. The operational Active head never changes on
that abort. Finalization alone atomically advances the local operational-active
head with the Active transition/result/audit/outbox after the external
activation proof is verified. Until this receipt is verified the
candidate cannot serve or gain a successor. An already authenticated Active
predecessor remains the operational head; only genesis remains deployment-
unready. A timeout or lost response is status-queried and reconciled by stable
request identity.
This workflow never assumes a distributed transaction between the local
database and witness system: external publication/status and each local CAS are
separate idempotent stages, and recovery reapplies the state table from durable
attempt plus authenticated journal evidence.

If authority expires/revokes, the publication profile changes or the local
candidate-head CAS loses before LocalActivationCommitted, the attempt must
request and verify the unique AbortManifest terminal through
`AbortMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestExternalTransition`;
the attempt authenticates the resulting
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestExternalAbortTombstoneV1`
projection and only then may CAS the transition to Aborted. An authenticated superseding Activated
journal entry may serve as the abort proof for a losing predecessor. If bounded
reconciliation cannot prove Activated or Aborted, it retains the durable
attempt and candidate in its current non-authoritative state with bounded,
fenced reconciliation suspended. PermanentlyUnresolved commits only through
`SealMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPermanentlyUnresolved`
when its authenticated external terminal seal receipt and matching local CAS prove that the
same transition can never later become Activated or Aborted; local retry
exhaustion, timeout or witness absence cannot create that disposition. That
candidate and all descendants stay unusable and the proposal is never reused.
A prior externally Activated predecessor remains operational; genesis remains
unready.
Orphan proposal bytes are eligible for cleanup only after authenticated
external Aborted or supersession membership is checkpointed. Neither timeout
nor local absence implies abort.

Restore/import verifies both proposal-publication and active-manifest
high-watermarks plus the complete external transition-journal membership. It
derives the latest manifest only from the greatest authenticated Activated
journal entry and matching external activation receipt, reachable local Active
record/transition lineage and profile identity/generation/digest that governed
that activation. The exact
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestOperationalActiveHeadV1`
must equal that entry. The independently verified
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestTransitionCandidateHeadV1`
may equal it, be canonically empty or name one reachable non-authoritative
descendant, but never selects the operational head. A
greater ProposedPublished entry is not rollback and does not
become active; it is reconciled before that candidate, any descendant or its
orphan cleanup may proceed, while the last proved Active predecessor remains
operational. Local Active state below the external active-manifest
high-watermark, a locally complete rollback, missing journal/profile/receipt
continuity for the selected Active entry or unavailable selected-head proof
returns typed
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestHistoryUnavailableOrRolledBack`
and keeps the deployment unready. No proposal checkpoint, local manifest,
activation-record or current-head row alone may assert latest state.
Removing a source/class, lowering quorum, widening nonresponse, time uncertainty
or expiry, or weakening continuity requires an independent action-bound
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionAuthorizationV1`
whose complete lifecycle is defined below; ordinary update cannot weaken it.

Activation locks/rechecks that manifest and atomically creates
`MigrationImportRegistryHistoryCorruptionClearanceAnchorRegistryV1` generation
zero beside every obligation and Healthy fence. Genesis has canonical no-
predecessor encoding, binds the exact manifest generation/digest and mandatory
class/quorum policy, and starts each component high-watermark at its canonical
empty lower bound. No adapter may lazily initialize it. Absence, defaulting or
a genesis/manifest mismatch is corruption and denies append, fencing,
clearance, cleanup and import.

Activation also creates
`MigrationImportRegistryHistoryCorruptionControlReserveV1` for every Pending,
NoHistory and NotRequested obligation from a non-borrowable deployment Recovery
partition. The reservation binds an authenticated active
`MigrationImportRegistryHistoryCorruptionControlCapacityProfileV1` generation/
digest and is bounded by immutable
`MigrationImportRegistryHistoryCorruptionControlPlatformHardMaximumV1`. Trusted
code derives and stores the future clearance-scope hard maximum plus bounded
row/byte/audit/outbox capacity for every fence transition, scope creation,
authorization/attempt terminalization and terminal result. A detector or
adapter supplies none of those limits. Ordinary work cannot borrow the
reservation; a later capacity-profile reduction preserves already admitted
reservations until the obligation reaches a terminal custody-safe state.
The reservation also binds the active backend storage-cost profile used for
every physical dimension. Under the universal rank, activation locks the
Recovery parent-capacity ledger before the child reserve and atomically debits
ParentAvailable, creates the child ReservedUnoccupied balance and writes the
unique parent/child allocation transfer. Activation fails atomically if it
cannot reserve the complete control-state envelope or preserve the parent
equation.

That transaction also creates one obligation-wide
`MigrationImportRegistryHistoryCorruptionControlLineageV1` with stable identity,
zero episode/WorkSpent/Released state, no active Fenced scope and closed
`MigrationImportRegistryHistoryCorruptionControlLineageDispositionV1` Active.
Immutable
`MigrationImportRegistryHistoryCorruptionControlLineageHardMaximumV1` binds the
non-wrapping maximum episode count and cumulative proof/retry/hash/signature/
bytes-processed/time work ceilings across every future corruption episode plus
separate rows/bytes-stored/audit/outbox physical-capacity ceilings; versioned
`MigrationImportRegistryHistoryCorruptionControlMinimumFutureCapacityV1` binds
the smallest complete fence/scope/terminalization envelope that must remain
reserved before an obligation may return to operational health. Both derive in
trusted code from the reservation/profile under the immutable platform
maximum. The lineage owns the original reservation identity and exact
overflow-checked
`MigrationImportRegistryHistoryCorruptionControlCapacityStateV1`, which is a
canonical envelope over two independently typed ledgers and is not itself an
arithmetic bucket set.

`MigrationImportRegistryHistoryCorruptionControlLifetimeWorkBudgetV1` owns only
irreversible logical work: proof attempts, retries, hash work, signature work,
bytes_processed and conservative elapsed time. Per dimension it stores
WorkAvailable, EpisodeWorkReserved, TerminalizationWorkReserved and WorkSpent
and enforces:

`lifetime_work_limit = work_available + episode_work_reserved + terminalization_work_reserved + work_spent`.

WorkSpent never decreases. Work transfer uses stable
`MigrationImportRegistryHistoryCorruptionControlLifetimeWorkTransferIdV1` and
immutable
`MigrationImportRegistryHistoryCorruptionControlLifetimeWorkTransferV1`.
Episode creation moves WorkAvailable to EpisodeWorkReserved; execution moves
the exact reservation to WorkSpent atomically with scope counters. Unused work
may return to WorkAvailable only in the authenticated episode terminal
transaction, and lineage closure retires rather than refunds the remaining
logical ceiling.

`MigrationImportRegistryHistoryCorruptionControlPhysicalCapacityLedgerV1` owns
present parent-pool encumbrance for rows, bytes_stored, audit records, outbox
records, checkpoint/archive records and their protected I/O/worker slots. Per
dimension it stores ReservedUnoccupied, Occupied, ReclaimPending and Released
and enforces:

`original_physical_reservation = reserved_unoccupied + occupied + reclaim_pending + released`.

The present parent-pool encumbrance is exactly ReservedUnoccupied + Occupied +
ReclaimPending. Creation moves ReservedUnoccupied to Occupied. Authenticated
terminal/checkpoint evidence may move exact Occupied units to ReclaimPending;
only verified archive membership plus exact physical deletion and settlement
may move ReclaimPending to nondecreasing Released. Deleting data never changes
WorkSpent, and completing logical work never releases physical capacity.
Physical transfers use stable
`MigrationImportRegistryHistoryCorruptionControlPhysicalCapacityTransferIdV1`
and immutable
`MigrationImportRegistryHistoryCorruptionControlPhysicalCapacityTransferV1`.

`bytes_stored` is not a backend-reported file or page count. It is a
conservative destination charge derived by trusted code under signed,
versioned
`MigrationImportRegistryHistoryBackendStorageCostProfileV1`. That profile binds
backend family and supported version range, schema/index generation, artifact
kind, canonical encoding version, fixed per-artifact/index overhead, maximum
expansion factor, rounding/allocation unit and measurement semantics. For each
artifact, the expansion factor is a canonical positive rational numerator and
nonzero denominator, evaluated with ceiling division before the outer
allocation-unit rounding. Wide checked arithmetic implements
`charged_bytes_stored = round_up(fixed_overhead + ceil(canonical_encoded_bytes × expansion_numerator / expansion_denominator), allocation_unit)`.
Unknown artifact/backend/schema fields, unproved profile signatures or
arithmetic overflow deny admission. The independently governed storage-
capacity profile owner authenticates it; an adapter cannot sign, select or
weaken its own cost profile.

The cost profile is governed state, not a freely replaceable signed document.
Stable
`MigrationImportRegistryHistoryBackendStorageCostProfileLineageV1` has a
non-wrapping generation, exact predecessor and CAS-protected
`MigrationImportRegistryHistoryBackendStorageCostProfileCurrentHeadV1`.
Its non-recursive
`MigrationImportRegistryHistoryBackendStorageCostProfileTrustAnchorV1` is
provisioned independently of every storage adapter. Canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileTransitionV1` has
closed
`MigrationImportRegistryHistoryBackendStorageCostProfileTransitionStateV1`
Proposed, Active, Superseded or Rejected, and every Active transition produces
`MigrationImportRegistryHistoryBackendStorageCostProfileActivationRecordV1`.
Only
`BootstrapMigrationImportRegistryHistoryBackendStorageCostProfile`,
`PrepareMigrationImportRegistryHistoryBackendStorageCostProfileTransition`,
`ActivateMigrationImportRegistryHistoryBackendStorageCostProfileTransition`,
`RejectMigrationImportRegistryHistoryBackendStorageCostProfileTransition`,
`CheckpointMigrationImportRegistryHistoryBackendStorageCostProfileLineage` and
`RestoreMigrationImportRegistryHistoryBackendStorageCostProfileLineage` may
mutate the lineage, transition,
`MigrationImportRegistryHistoryBackendStorageCostProfileCheckpointV1` or
externally retained non-wrapping
`MigrationImportRegistryHistoryBackendStorageCostProfileHighWatermarkV1`.
Every operation binds expected head/predecessor, complete canonical profile,
trust generation, authorization, stable idempotency, result, audit and outbox;
exact retry joins and changed material conflicts. Restore never selects a raw
local maximum.

Trusted
`MigrationImportRegistryHistoryBackendStorageCostProfileSuccessorClassificationV1`
is ValidNonWeakening, ValidWeakening or InvalidOrUnverifiable. It compares each
predecessor/successor cost function analytically over the complete declared
artifact-kind and canonical-size domain using exact arithmetic. The supported
function family is rounded
affine cost only: fixed overhead plus a positive rational expansion, followed
by outer allocation-unit rounding. Its closed-form symbolic dominance proof
partitions only at algebraically derived crossings and residue classes; it
never enumerates every possible ceiling/allocation breakpoint or artifact
size. The profile format fixes platform maxima for profile entries, artifact
kinds, canonical size, allocation unit, rational numerator and denominator,
encoded proof bytes and proof nodes. Canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileClassifierWorkBudgetV1`
precharges decode, normalization, checked arithmetic, comparison and proof
verification before evaluation. Unsupported functions, arithmetic overflow,
exceeded format/proof/work limits, malformed or unverifiable proofs, unknown
artifact kinds and classifier-budget exhaustion are
InvalidOrUnverifiable and terminal no-write rejection. No policy-transition
authority may override semantic invalidity or unverified accounting, and there
is no sampled fallback; sampled or golden-vector comparison alone is
insufficient.
Property and golden vectors compare the symbolic result with exhaustive
evaluation over small bounded domains, including all rounding residues,
crossings and maximum-value arithmetic.
An artifact without a proved conservative bound is InvalidOrUnverifiable; any
valid size at which the successor can charge less is ValidWeakening.
ValidNonWeakening
requires the independent ordinary cost-profile owner. Only ValidWeakening may
consume the complete destructive policy-transition authorization lifecycle
below with action WeakenBackendStorageCostProfile, exact predecessor/successor
profile bytes, classifier proof and current-head CAS. The storage adapter,
schema migrator, importer and parent-ledger allocator cannot classify or
authorize their own successor.

Existing child charges retain their bound
cost-profile identity. A backend/schema/index transition requires an admitted
successor profile and conservative capacity re-admission before activation:
the nonnegative re-cost delta is transferred through canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignV1`.
Its immutable start transaction binds the predecessor/successor profiles,
backend/schema/index selector, a fixed child-set snapshot and exact membership
commitment, parent/checkpoint versions, stable campaign identity and
idempotency, and installs a durable lease. In that transaction it CASes
`MigrationImportRegistryHistoryBackendStorageCostProfileActiveRecostCampaignSlotV1`
from None to the exact parent/selector/campaign/epoch/predecessor/successor and
expected version. There is at most one nonterminal campaign for one parent and
selector scope. Exact start retry joins the slot; changed material conflicts.
The slot remains occupied while Fenced and may be reused only after an
authenticated
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignTerminalCheckpointV1`
proves Activated, Aborted or PermanentlyQuarantined. Slot clearing co-commits
with that checkpoint or is a later exact transaction that locks the slot and
verifies its checkpoint identity/version; no other evidence clears it. A second
successor cannot create another pending profile, campaign fence or allocation-
charge interpretation.

The same transaction installs
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignEpochV1`
and
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignFenceV1`.
The campaign epoch cuts the parent ledger: the authenticated snapshot contains
every pre-cut child, while every post-cut allocation or release belongs to a
bounded
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPostCutLogV1`.
Its closed
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignStateV1`
is Preflighting, RecostPending, Applying, Complete, Activated, Aborting,
Aborted, Fenced or PermanentlyQuarantined. Its mutation fence is Open,
Finalizing or Closed. Canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignRecoveryIntentV1`
is ResumeTowardActivation, CompleteAbort or PermanentQuarantine and is written
durably before recovery work. PermanentQuarantine is written only by admission
of the dedicated one-shot authorization below and is consumed only by its
dedicated command. The complete legal state table is:

- Preflighting may move to RecostPending, Aborting or Fenced.
- RecostPending may move to Applying, Aborting or Fenced.
- Applying may remain Applying or move to Complete, Aborting or Fenced.
- Complete may move only to Activated, Aborting or Fenced.
- Aborting may remain Aborting or move to Aborted or Fenced.
- Fenced records its exact prior campaign and mutation-fence states. A proved
  ResumeTowardActivation moves prior Preflighting to Preflighting, prior
  RecostPending or Applying to Applying, and prior Complete to Complete after
  checkpoint revalidation. A proved CompleteAbort moves any recoverable prior
  state to Aborting. A separately authorized PermanentQuarantine intent moves
  only to PermanentlyQuarantined.
- Activated, Aborted and PermanentlyQuarantined are terminal.

The campaign/mutation-fence product is also closed:

- Preflighting, RecostPending and Applying pair with Open. Complete pairs with
  Finalizing. Activated, Aborted and PermanentlyQuarantined pair with Closed.
- Fenced preserves the exact Open or Finalizing state at which fencing won.
  Fenced+Open denies allocations but permits an authenticated release through
  the protected release lane only when its charge disposition and log
  continuity are exact. Fenced+Finalizing permits no mutation.
- Recovery preserves Open or Finalizing when resuming the prior campaign
  state. CompleteAbort first folds any admitted release, then CASes Open or
  Finalizing to Closed before entering Aborting. Permanent quarantine always
  CASes the mutation fence to Closed.
- Closed never reopens. Activation, abort and permanent quarantine race on the
  same expected campaign state, mutation-fence generation and terminal-result
  slot; exactly one terminal checkpoint can win.

No inferred, backwards, cross-intent or invalid product-state transition
exists.
`StartMigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaign`,
`ApplyMigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaign`,
`FinalizeMigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaign`
and
`ActivateMigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaign`
are distinct commands with canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignStartResultV1`,
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignStartConflict`,
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignApplyResultV1`,
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignApplyConflict`,
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignFinalizeResultV1`,
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignFinalizeConflict`,
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignActivationResultV1`
and
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignActivationConflict`.
Their action tags are not interchangeable;
exact retries return the stored result and changed state/material returns only
the command-specific conflict without performing another command.
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignFenceCheckpointV1`
binds prior campaign and mutation-fence states, fence/lease generations,
recovery intent, exact accounting roots/counters, last transfer, preflight
cursor and post-cut fold checkpoint. Canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignTerminalCheckpointV1`
instead binds one terminal campaign+Closed pair, final active/RecostPending/
pending-successor roots and balances, terminal authority consumption and
result, workspace/cleanup disposition, audit/outbox positions, terminal
checkpoint sequence and unique slot-release identity. Contradictory, missing
or unauthenticated accounting evidence cannot authorize a refund or activation:
it permits only separately authorized PermanentlyQuarantined and conservatively
retains the exact known encumbrance plus maximum unresolved reserved amount
as a permanent parent encumbrance. No campaign-level reconciliation, workspace
settlement or later evidence may release only the apparent excess, reopen the
campaign, admit the rejected successor or change its terminal disposition.
Capacity can return only through the broader custody-safe parent-release
protocol after that protocol proves that no future operation can depend on any
quarantined campaign or workspace byte and atomically settles the entire
parent member. A linked workspace participates through its whole-member
CustodyReleased transaction so parent membership, OriginalTotal/Released, every
remaining leg and both terminal checkpoints close together; the broader
protocol cannot credit it independently. Retry or worker exhaustion alone is
not evidence loss and cannot
select quarantine.

A bounded
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignCursorV1`
evaluates every snapshot child, proves the complete checked aggregate
nonnegative delta and charges
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignWorkBudgetV1`
before work. Only canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignFixedSnapshotCheckpointV1`
may atomically move the entire aggregate delta from ParentAvailable into one
campaign-owned RecostPending bucket. That transaction locks the post-cut log
and fold checkpoint, binds one specific authenticated folded-log high-
watermark, proves every earlier pre-cut release tombstone has been subtracted
from the fixed-snapshot aggregate and proves no admitted release can fall
between aggregate calculation and reservation. Insufficient aggregate, post-
cut-log, fold or terminalization capacity makes the transition no-write,
stores the typed preflight result and creates no pending-successor charge. The
campaign remains Preflighting until bounded cursor/fold work can reserve the
complete live amount or its explicit owner-authorized abort runs. Every parent
allocation and release transaction locks and rechecks the active-campaign slot
and campaign epoch/fence after the parent-ledger rank.

While Open, a post-cut allocation admits the active-profile charge plus the
checked nonnegative successor delta, stores the latter as
`MigrationImportRegistryHistoryBackendStorageCostProfilePendingSuccessorChargeV1`
bound to campaign and successor profile, and appends one stable event to the
post-cut log. Release follows one exhaustive, state-discriminated matrix:

1. A pre-cut child released while Preflighting and before whole-delta
   reservation releases only its active charge, appends an immutable release
   tombstone, and receives no successor credit because RecostPending does not
   yet exist. The bounded preflight fold excludes or subtracts that child.
2. A pre-cut child released after whole-delta reservation but before its
   application decreases campaign RecostPending by its exact snapshot delta
   and credits ParentAvailable.
3. An applied pre-cut child or any post-cut child decreases its exact pending-
   successor charge and credits ParentAvailable.

Every case uses a stable release/inverse identity, updates the applicable
aggregate and membership commitment atomically, and appends or binds the
corresponding release event/tombstone. The fixed snapshot remains immutable;
its authenticated post-cut overlay determines the live set. Campaign admission
reserves bounded log and separate release-lane capacity. Reaching the mandatory close margin
denies new allocations and requests Finalizing; the protected release lane
remains available until the finalizer acquires the exclusive fence after all
already-admitted mutations finish. That brief exclusive interval blocks both
allocation and release while it closes the authenticated
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPostCutHighWatermarkV1`.
No live mutation is unlogged, and ordinary churn neither silently fences nor
resets the campaign.
No release can remove the active child while leaving an existing successor
encumbrance, and no pre-reservation tombstone can create a successor credit.

`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPostCutFoldCursorV1`
and
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPostCutFoldCheckpointV1`
fold that log into cumulative membership, active-charge and pending-successor
roots/counters in bounded transactions while Open. Open to Finalizing
atomically fixes the high-watermark and is admitted only when the unfurled tail
fits platform-hard entry, byte and work maxima sized for the exclusive
interval. Finalizing folds only that bounded tail. Activation verifies
constant-sized final roots, counters, versions and checkpoint links; it never
scans the child set or replays the complete post-cut log.

Each bounded application transaction uses a stable child/delta transfer
identity and canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignChildDeltaTransferV1`
to move that child's exact amount from RecostPending into its separate pending
successor charge, never its active cost charge. The same atomic transaction
decreases AggregateCampaignRecostPending and increases
AggregatePendingSuccessorEncumbrance by the identical checked amount, updates
both membership commitments and preserves ParentTotal. It advances the durable
monotonic cursor, cumulative charges and checkpoint under the campaign lease/
fence. Exact retry returns the original transfer; changed material,
unlogged mutation, duplicate movement, retry-limit exhaustion or cursor
contradiction fences. A non-borrowable
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignCompletionReserveV1`
covers lease takeover, exact-response-loss reconciliation, terminal result,
abort, inverse transfers, audit, outbox and checkpoint work at every crash
boundary.

The independently selected cost-profile campaign owner alone may authorize
`AbortMigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaign`;
the worker, adapter, classifier and parent allocator cannot. The canonical
command binds campaign/epoch/fence, predecessor/successor profile, current
cursor/checkpoint/log high-watermark, closed reason and stable idempotency.
It returns
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignAbortResultV1`
or the one closed
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignConflict`.
Abort advances to Aborting and reverses every unapplied RecostPending amount
and every pending successor charge through stable campaign-derived inverse
transfer IDs, atomically crediting ParentAvailable. Exact retry joins the
stored forward/inverse result; changed material conflicts. Retry exhaustion
only fences for recovery and never authorizes abort or by itself makes a
staging amount permanent. Aborted commits only after the cursor/checkpoint proves
zero RecostPending and zero pending successor charges, the mutation fence is
Closed, and the terminal checkpoint binds workspace Cleaned or a completely
reserved AbortCleanupPending cleanup obligation. Active cost charges are
untouched.

`RecoverMigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaign`
is the only transition out of Fenced. Its independently authorized request
binds campaign slot/epoch, fence and takeover generations, predecessor/
successor, last authenticated state/checkpoints/roots, one terminal intent,
lease owner, cumulative recovery work budget and stable idempotency. The
campaign owner cannot self-approve recovery; workers, adapters, classifiers and
allocators have no recovery authority. Exact retry returns
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignRecoveryResultV1`;
changed material returns
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignRecoveryConflict`.
Recovery itself performs only constant-sized state/checkpoint revalidation and
advances the lease/fence generation while preserving the existing preflight/
application cursor, cumulative work, post-cut fold position, reservations and
mutation-fence state. ResumeTowardActivation from prior Preflighting returns to
Preflighting so later ordinary bounded work continues the fixed checkpoint;
it never completes the remaining snapshot in the recovery transaction. Prior
RecostPending or Applying returns to Applying after complete forward-transfer
and log-root revalidation. Prior Complete returns to Complete only after the
complete/fold/workspace checkpoint roots revalidate. CompleteAbort requires
complete forward/inverse evidence and enters Aborting after the mutation fence
closes. Missing, contradictory or unauthenticated accounting evidence cannot
be selected by recovery as a convenient terminal: only the one-shot permanent-
quarantine authorization and command below may retain encumbrance, reject the
successor and preserve the predecessor. Lease/fence generation prevents old-
worker resumption after takeover. Recovery budget exhaustion remains Fenced
with every counter intact.

Permanent quarantine is a destructive availability and capacity-retention
decision, not a generic recovery result. Canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationV1`
has independently issued, destination-admitted
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationStateV1`
Absent, RevokedBeforeAdmission, Issued, Consumed, ExpiredUnused or
RevokedUnused. Its signed canonical preimage binds campaign/slot/epoch,
predecessor/successor, prior campaign and mutation-fence states, exact
unavailable/contradictory evidence commitment, conservative retained-capacity
upper bound, workspace disposition, successor rejection and predecessor
preservation, retention/classification/legal-hold epochs, issued-at/not-before/
expiry/uncertainty/trusted-time continuity, requestor/approvers/operator,
quorum/SoD, reason, nonce and idempotency. Admission, pre-admission revocation,
Issued revocation and Issued-only expiry are explicit destination-local state
transitions, but revocation reaches them only through the Apply command below.
Admission and Issued-only expiry are performed by
`AdmitMigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorization`,
and
`ExpireMigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorization`
and exact retry returns
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationResultV1`
or
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationConflict`.
Remote revocation is not a destination mutation.
`RevokeMigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorization`
is issuer-side only and creates signed
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationRevocationIntentV1`
plus a target-scoped, non-wrapping
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationRevocationSequenceV1`;
exact retry returns the same signed intent and changed material returns the
authorization conflict without minting a second sequence. It never changes
destination state. The intent binds the exact authorization
identity and digest, campaign/slot/epoch/action, issuer, signing key and
continuity, issued-at/not-before/target-covering expiry/not-after, maximum
uncertainty and trusted-time profile, reason, nonce, idempotency and sequence.
Only
`ApplyMigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationRevocation`
may commit the destination effect through
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationRevocationInboxV1`
and a durable
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationRevocationTombstoneV1`.
It returns
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationRevocationResultV1`
or
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationRevocationConflict`.
The destination verifies target, digest, signature/key continuity, time window
and fresh sequence before it atomically records Absent→RevokedBeforeAdmission
or Issued→RevokedUnused with inbox, tombstone, result, audit and outbox, or
does none.

Admission, expiry, revocation application and quarantine consumption expose
their canonical inner results through closed
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationOutcomeV1`:
Admitted or Expired contains the authorization result, Revoked contains the
revocation result, and Consumed contains the permanent-quarantine result.
Changed canonical material is wrapped by
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineAuthorizationOperationConflictV1`
as Authorization, Revocation or Quarantine. After a CAS loss, the caller
rereads the same row and reapplies this total table; a valid later operation
against a terminal target observes the first terminal result rather than
starting a retry/conflict loop:

| Current state | Valid revocation application | Exact replay / changed material |
|---|---|---|
| Absent | Atomically commits RevokedBeforeAdmission, inbox, tombstone and Revoked outcome | Exact replay joins Revoked; changed target/digest/scope/sequence/idempotency conflicts |
| Issued | Atomically commits RevokedUnused, inbox, tombstone and Revoked outcome | Exact replay joins Revoked; changed material conflicts |
| Consumed | Returns the stored Consumed permanent-quarantine result without mutation | Exact terminal observation joins Consumed; changed material conflicts and cannot reverse quarantine |
| ExpiredUnused | Returns the stored Expired result without converting expiry to revocation | Exact terminal observation joins Expired; changed material conflicts |
| RevokedBeforeAdmission | Returns the stored Revoked result without mutation | Exact replay joins Revoked; changed material conflicts |
| RevokedUnused | Returns the stored Revoked result without mutation | Exact replay joins Revoked; changed material conflicts |

Consumption, expiry and revocation race on one row and their first terminal
transition wins. A lower or stale changed sequence conflicts; an exact
previously stored sequence returns its result. Operation kind alone does not
make otherwise identical target material a conflict. The sequence is scoped to
one exact authorization target/action and can never suppress an unrelated
grant. Every adapter returns the same outcome wrapper and implements CAS-loser
reread/reapply; transport retry policy is not part of the state machine.

Only
`PermanentlyQuarantineMigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaign`
may consume the still-Issued authorization. One transaction CASes Fenced+
Open/Finalizing to PermanentlyQuarantined+Closed, retains the proved
conservative encumbrance, marks the successor Rejected and predecessor Active,
quarantines workspace capacity, writes
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineResultV1`,
terminal checkpoint/audit/outbox, and clears the slot as specified above, or
does none. Changed authority/evidence/capacity/workspace/state/idempotency
returns
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignPermanentQuarantineConflict`.
The quarantine issuer, destination admitter and consuming operator are
separated; campaign owner, recovery authorizer, worker, adapter, classifier and
allocator cannot issue or self-consume this authority.

The complete checkpoint proves snapshot membership, aggregate delta, every
stable transfer, the closed post-cut high-watermark and fold checkpoint, zero
unapplied RecostPending and zero unaccounted tail. Physical transition work is
separately admitted through
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceReservationV1`.
It conservatively reserves shadow data/index bytes, WAL/journal amplification,
verification and rollback/cleanup space, worker and I/O capacity, and crash/
failover terminalization. When the existing migration staging budget supplies
these resources, its immutable reservation ID, profile, amounts and completed
checkpoint are embedded rather than duplicated, and that staging protocol must
implement every lifecycle and settlement rule below.

Canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceStateV1`
is Reserved, Building, Catchup, Verified, ActivatedCleanupPending,
AbortCleanupPending, CleanupReconciling, Cleaned, Quarantined,
PermanentlyRetained or CustodyReleased. Cleaned means ordinary authenticated
cleanup settled the workspace; CustodyReleased means a later whole-member
custody release settled a quarantined or permanently retained workspace. The
two terminal meanings are never substituted.
Canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCleanupOriginV1`
is Activated or Aborted and binds the exact campaign terminal result/
checkpoint that selected ActivatedCleanupPending or AbortCleanupPending.
CleanupReconciling always persists this origin; it is not inferred from current
selector state or a mutable campaign projection.
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCleanupTerminalReferenceV1`
is the closed origin-discriminated reference: Activated contains only the exact
activation result/checkpoint identity and Aborted contains only the exact abort
result/checkpoint identity. Mixed, absent or inapplicable fields are
noncanonical.
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCursorV1`
and
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePhysicalMutationHighWatermarkV1`
bound and resume initial copy plus change catch-up. The exact source
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCapacityLedgerV1`
and checked
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceAggregateV1`
bind capacity-profile identity, rows/bytes, shadow/index/WAL/verification/
cleanup quantities, worker/I/O units and platform aggregate ceilings and
persist immutable
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceOriginalTotalV1`
plus monotonic, non-wrapping
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceReleasedV1`.
They enforce, per dimension:

`workspace_original_total = workspace_reserved_unoccupied +
workspace_building_occupied + workspace_cleanup_pending +
workspace_quarantined + workspace_permanently_retained +
workspace_released`.

`workspace_parent_encumbrance =
workspace_original_total - workspace_released`.

ActivatedCleanupPending, AbortCleanupPending and CleanupReconciling all remain
in workspace_cleanup_pending; state refinement cannot move quantity outside
the equation. PermanentlyRetained uses only
workspace_permanently_retained and does not alias workspace_quarantined.
The original total equals the exact initial parent transfer and is immutable
through state transition, settlement, restore, migration and repair.
WorkspaceReleased starts at zero, can only increase, can never exceed the
original total and is independently authenticated against every settled-leg
tombstone. The remaining parent encumbrance is derived rather than rewritten.
Any rollback/decrease of Released, change to OriginalTotal or mismatch among
the equation, parent member and settlement history fences the affected
partition without credit.

Workspace reservation atomically decreases ParentAvailable and increases the exact
workspace-encumbrance membership and aggregate by the same checked amount,
creates Reserved state and records
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceParentTransferV1`
with its result/checkpoint/audit/outbox, or does none. Cleanup settlement
operates on one or more complete immutable reservation legs in a bounded
transaction; a leg can never be fractionally settled. Each leg binds its
original source bucket/quantity and exact current lifecycle bucket. The
transaction decreases that exact live bucket, increases WorkspaceReleased,
decreases the exact parent workspace encumbrance and increases ParentAvailable
by the identical checked quantity through
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceParentInverseTransferV1`;
it then appends settlement, inverse-transfer, checkpoint, audit and result, or
does none. Partial workspace progress across complete legs is permitted;
independently calculated amounts, partial legs and rewriting WorkspaceOriginalTotal
are forbidden.

`BuildMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspace`,
`SynchronizeMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspace`,
`VerifyMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspace`,
`CleanupMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspace`,
`ReconcileMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCleanup`,
`QuarantineMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspace`,
`PermanentlyRetainMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspace`,
`ReleaseMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustody`
and
`SettleMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspace`
are bounded stable-idempotency commands returning canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceOperationResultV1`
or
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceOperationConflict`.
They alone perform Reserved→Building→Catchup→Verified,
Verified→ActivatedCleanupPending after campaign activation,
nonterminal→AbortCleanupPending after abort, either cleanup-pending state→
Cleaned after verified old-copy/shadow deletion, or any nonterminal→Quarantined
under the campaign's authorized terminal disposition. An indeterminate
post-terminal deletion observation moves ActivatedCleanupPending or
AbortCleanupPending→CleanupReconciling while persisting Activated or Aborted
CleanupOrigin and without changing the already committed campaign terminal
result. Bounded reconciliation may return only to the origin-matched
ActivatedCleanupPending or AbortCleanupPending with authenticated evidence that
cleanup can safely resume, reach Cleaned only with authenticated deletion, or
consume independent workspace-retention authority to reach
PermanentlyRetained. PermanentlyRetained and Quarantined can reach only
CustodyReleased through the whole-member custody-release protocol below.
Settlement releases each reservation leg exactly once only after authenticated
deletion through
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceSettlementV1`
and
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceSettlementCheckpointV1`.
The checkpoint binds authenticated deletion, the old campaign terminal
checkpoint, every reservation leg and workspace state, immutable original
total, prior/new monotonic released amount, remaining parent encumbrance, each
parent inverse transfer/credit, result, audit/outbox and predecessor
checkpoint. Response loss joins the same settlement. Cleaned is reachable only
when authenticated deletion is complete, every non-quarantined leg is settled,
WorkspaceReleased equals WorkspaceOriginalTotal and the remaining workspace
parent encumbrance is zero.

Canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceDeletionOutcomeV1`
is AuthenticatedDeleted, AuthenticatedPresent or DeletionOutcomeUnknown.
Unknown covers lost storage credentials, unavailable verification keys,
inconsistent backend observations and unavailable or irrecoverable deletion
evidence; it never means deleted. CleanupReconciling persists the exact
observations, credential/key/evidence generations, cursor, attempts, bytes,
work, conservative elapsed time, CleanupOrigin, terminal reference, next action
and predecessor checkpoint in
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCleanupReconciliationV1`.
Its reservation-funded entry/byte/work/time/attempt ceilings survive crash,
failover and retry. Exhaustion cannot manufacture deletion, reset the budget or
alter the committed activation/abort result.

`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationV1`
is independent of campaign permanent-quarantine authority and binds the exact
workspace/campaign/CleanupOrigin/activation-or-abort terminal reference, all
remaining legs and encumbrance,
deletion observations and reconciliation budget, retention/classification/
legal-hold generations, custody evidence, reason, trusted-time window,
approver quorum/SoD, nonce and stable idempotency. A retention issuer cannot be
the workspace worker, cleanup claimant, custody releaser or sole custody/
legal-hold approver.

Canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationStateV1`
is Absent, RevokedBeforeAdmission, Issued, Consumed, ExpiredUnused or
RevokedUnused.
`AdmitMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorization`
returns
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationAdmissionResultV1`
and
`ExpireMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorization`
returns
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationExpiryResultV1`;
issuer-side
`RevokeMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorization`
allocates the next target-scoped non-wrapping sequence and returns signed
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationRevocationIntentResultV1`
or
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationRevocationIntentConflict`.
Its one issuer transaction binds the exact authorization/action/target digest,
sequence, issuer/key continuity, time window, reason, nonce and revocation
idempotency, stores the signed intent/result/audit/outbox, or does none. Exact
retry returns that stored intent; changed material conflicts. It cannot write
any destination authorization state, inbox or tombstone.
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationRevocationIntentV1`
with target-scoped non-wrapping
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationRevocationSequenceKeyV1`,
is the only issuer-created revocation input. The Admit and Expire commands
named above, together with
`ApplyMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationRevocation`
are the only commands that may mutate the destination authorization state. The
destination atomically stores
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationRevocationInboxV1`,
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationRevocationTombstoneV1`,
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationRevocationResultV1`,
the authorization row, audit and outbox. Canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationOutcomeV1`
returns admitted, expired, revoked or the stored PermanentlyRetained result;
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationOperationConflictV1`
wraps only changed authorization, revocation or retention material. Every CAS
loser rereads and reapplies the same six-state first-terminal table: Consumed
returns the stored retention result, ExpiredUnused the stored expiry and either
revoked state the stored revocation. Exact operations join; changed target,
terminal reference, evidence, legs, scope, sequence or idempotency conflicts.

Only the consuming retention command may
atomically move CleanupReconciling→PermanentlyRetained, move the exact remaining
live legs from cleanup-pending to permanently-retained without changing
WorkspaceReleased or ParentAvailable, append the terminal retention checkpoint/
result/audit/outbox, release the workspace's active cleanup-lane claim and
consume its precharged permanent-retention-pool slot. Exact retry joins; changed
authority, evidence, legs, terminal reference or idempotency conflicts.

`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionPoolV1`
and immutable
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionHardMaximumV1`
bound count, rows, bytes, parent encumbrance, evidence, audit/outbox, age,
escalation work and terminal custody-release capacity. Workspace reservation
precharges one non-borrowable escalation/terminalization slot sized for its
maximum remaining member; activation cannot commit without that reserve.
Moving to PermanentlyRetained consumes the slot and removes the workspace from
the active cleanup backlog without credit. Late deletion evidence is appended
under bounded evidence capacity but cannot return the workspace to cleanup,
change activation/abort, mark Cleaned or refund capacity. Only a later,
separately authorized whole-member custody release can reduce the encumbrance.

Quarantined and PermanentlyRetained freeze the remaining derived encumbrance.
Canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyReleaseAuthorizationReferenceV1`
binds the exact Issued
`MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationV1`
whose action is CommitCustodyRelease, lineage/checkpoint/bundle digest and
workspace terminal reference match. Custody approval or legal-hold evidence is
an authenticated input to that grant and its commit-time recheck, never mutable
command authority by itself. Canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyReleaseSettlementV1`
and
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyReleaseCheckpointV1`
close the workspace side of the broader custody-safe parent release. Canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyReleasePhysicalDispositionV1`
is the closed per-remaining-leg set AuthenticatedDeleted,
TransferredToCustodyLedger or Unknown. AuthenticatedDeleted binds the exact
workspace/leg and quantity dimensions, storage generation, object and root
identity, immutable deletion-receipt identity, verification evidence/key/
profile and terminal idempotency. TransferredToCustodyLedger binds those source
fields plus verified destination object/root and transfer receipt, the exact
archive or legal-hold
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityLedgerV1`
identity/generation/version, exact pending reservation, governed cost profile,
canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityMemberV1`
and checked destination charges. Commit records
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityTransferV1`
for that reservation-to-member conversion and links it to the exact but
potentially dimension-different source credit.

Immutable, versioned
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityCostProfileV1`
binds source and destination storage generations, complete source-unit to
destination-dimension mapping, compression and encryption behavior,
replication/index/object overhead, checked rational ceiling rules, overflow
denial, verified encoded-destination-size method and backend atomic limits.
It is a domain-separated artifact kind in the already selected governed
`MigrationImportRegistryHistoryBackendStorageCostProfileLineageV1`; it reuses
that lineage's typed CurrentHead, Transition, TransitionState,
ActivationRecord, SuccessorClassification, bootstrap/prepare/activate/reject/
checkpoint/restore commands and WeakenBackendStorageCostProfile destructive
authorization rather than creating a second mutable profile owner. Canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityCostProfileBindingV1`
pins stable lineage, admitted Active generation/digest, evaluator version,
cryptographic evaluator binary digest and admitted conformance-corpus digest,
while
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityCostProfileReservationDependencyV1`
indexes every nonterminal reservation by that exact generation.
Canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileEvaluatorArtifactV1`
binds binary/algorithm/ABI digests, conformance-corpus root, build provenance,
supported profile generations and platform/architecture constraints.
Every node publishes an authenticated
`MigrationImportRegistryHistoryBackendStorageCostProfileEvaluatorReadinessManifestV1`
covering every evaluator required by active reservations before it is Ready;
startup, rolling upgrade, failover and restore remain unready if any pinned
artifact/corpus is absent, digest-mismatched or non-executable.

Existing reservations never follow CurrentHead: a superseded generation and
its evaluator remain retained and usable for only their pinned reservations
until every dependency is ConsumedByCustodyMember,
ReleasedDefinitelyNeverTransferred, ReleasedAfterDestinationDeletion or
ConvertedToQuarantinedUnknownTransferMember. A
compatible ValidNonWeakening successor may activate for new reservations while
the predecessor remains evaluable. Any incompatible or ValidWeakening
successor installs
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityCostProfileDrainFenceV1`;
activation is no-write while any live predecessor dependency exists.
ValidWeakening additionally consumes the existing complete
WeakenBackendStorageCostProfile destructive authorization. InvalidOrUnverifiable
never activates. Fence, dependency set, classification proof, activation
record and head CAS commit through the existing profile-lineage transaction;
profile expiry, ordinary supersession or current-head drift never strands a
pinned transfer.

Independently rooted
`EmergencyDistrustMigrationImportRegistryHistoryBackendStorageCostProfileEvaluator`
commits
`MigrationImportRegistryHistoryBackendStorageCostProfileEvaluatorDistrustRecordV1`
and returns
`MigrationImportRegistryHistoryBackendStorageCostProfileEvaluatorDistrustResultV1`
or
`MigrationImportRegistryHistoryBackendStorageCostProfileEvaluatorDistrustConflict`.
It binds exact evaluator/profile generations and digests, vulnerability/
incident/change authority, issuer/key/time continuity and a non-wrapping
distrust epoch. Distrust is a restrictive emergency action: the same local CAS
makes every affected adapter guard deny new chunks, reservation extension,
MarkCommitEligible and Commit; ordinary profile succession cannot clear it.
Unknown distrust state is distrusted.
Only independently authorized
`MigrateMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityReservationEvaluator`
may replace an affected reservation binding. Its canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityReservationEvaluatorMigrationResultV1`
or
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityReservationEvaluatorMigrationConflict`
binds old/new evaluator artifacts, current reservation/accepted bytes/
destination namespace, complete-domain compatibility proof and stable
idempotency. In one transaction it fences the old evaluator use, reserves any
positive charge delta, installs the new dependency and removes the old one.
The successor must implement the same governed cost-function generation
byte-for-byte or a proved strictly more conservative interpretation within the
existing transfer hard maximum, except that the deficit-remediation path below
may authorize an exact larger effective charge after its entire positive delta
is already covered. That exception cannot admit another byte, change the
sealed object/root, plan disposition, storage namespace or profile semantics.
Every plan pre-reserves one bounded evaluator-
migration chain slot per reservation, and the later Commit grant/payload binds
the current migration result/head in addition to the immutable plan bundle.
The post-migration reservation is never smaller than its original or current
maximum; a cheaper result preserves the higher charge, unknown/incomparable
evaluation denies, and no accepted byte or transfer identity is forgotten.
An uncertain external transfer is not evaluator-migratable and instead follows
the permanently retained unknown-transfer path below.

Distrust never clamps corrected accounting to an obsolete plan hard maximum.
Trusted
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyEvaluatorReassessmentV1`
recomputes the conservative charge from the best authenticated encoded-size/
object evidence under the replacement evaluator with checked arithmetic.
Canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitV1`
is `corrected_charge - reserved_charge` when positive and zero otherwise; the
record binds old/new artifacts, evidence, arithmetic profile, plan/reservation/
sealed-transfer identity and distrust epoch. Overflow or an unrepresentable
corrected charge is an accounting-unrepresentable fence, never saturation or
maximum-value clamping.

The platform provisions non-borrowable
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityEmergencyQuarantineReserveV1`
with deployment and tenant count/byte/liability ceilings, protected
terminalization rows/work and no ordinary allocation path. When the corrected
charge exceeds the reservation or plan maximum, one local transaction records
the reassessment/deficit and either debits the full deficit from this reserve
into an exact deficit encumbrance or records an uncovered liability and fences
the tenant/backend unready. MarkEligible, Commit, new chunks, extension and
ordinary Replan remain denied until the deficit is fully covered or separately
authorized remediation completes. Unknown transfers under a distrusted
evaluator must execute this reassessment/deficit transaction before permanent
unknown-member conversion.

Canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityEffectiveChargeV1`
is the checked sum of the still-encumbered base reservation and the exact
covered deficit. It binds the reassessment, base reservation/version,
emergency or additionally provisioned deficit-encumbrance provenance, sealed
transfer and replacement evaluator. It may exceed the historical plan hard
maximum only through the remediation-authorized, already-covered exception;
overflow, missing provenance or an uncovered unit denies. Canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitSettlementV1`
has closed disposition PendingCommit, ConvertedIntoCustodyMember,
ReleasedAfterVerifiedDeletion or PermanentlyFencedRetained and accounts for
every covered unit exactly once.

Only the independently authorized closed
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationAuthorizationV1`
may consume one
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationActionV1`:
ProvisionAdditionalCapacity, VerifyDeletion or
MigrateToSufficientCapacity may resolve a deficit, while
RetainPermanentlyFenced is the only action allowed to choose permanent
retention. Each rechecks current
retention/legal hold, sealed/unknown-transfer fence, evaluator/distrust epoch,
physical evidence and both capacity ledgers. Provisioning atomically moves
newly proved capacity into the deficit encumbrance; verified deletion releases
only after exact immutable object/namespace absence and categorical legal-hold
approval; migration first charges sufficient destination capacity and verifies
the old object deleted. It returns
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationResultV1`
or
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationConflict`.
Exact retry joins; changed evidence/action/amount conflicts. No remediation
rewrites the original reassessment, quarantine or distrust record.

The action/result mapping is total and closed:

| Authorized action | Only permitted successful continuation |
|---|---|
| ProvisionAdditionalCapacity | ResumableCommit |
| VerifyDeletion | VerifiedDeletionAndReplan |
| MigrateToSufficientCapacity | MigratedPlanReadyForReplan |
| RetainPermanentlyFenced | PermanentlyFencedRetained |

No failed, retryable or Unknown provisioning/migration/deletion attempt may
select another row or fall through to permanent retention. Asynchronous
authority is durably captured before external execution:

- `BeginMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediation`
  consumes the exact Issued one-shot action grant and returns
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationBeginResultV1`
  or
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationBeginConflict`;
- in the same local transaction it creates canonical
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationAttemptV1`
  in ExecutionAdmitted with one stable effect ID, canonical request digest,
  exact action/mapped continuation, capacity reservation, provider target,
  constrained non-exportable capability handle, policy/hold generations,
  fence, idempotency and exact governed provider-effect conformance profile/
  result digests;
- only the broker may redeem that stored one-use capability. Workers never
  receive provider credentials or invoke the provider directly;
- `DispatchMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediation`
  returns
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationDispatchResultV1`
  or
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationDispatchConflict`.
  The broker transaction uses the complete attempt-set writer rank below,
  including routing head, residual state head, attempt-set head, plan-bound
  commit attempt and remediation attempt before capability/evidence/
  authorization rows. It rechecks current legal hold, retention, policy,
  evaluator-distrust, namespace-fence, provider-credential and owner-routing
  epochs, atomically redeems
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationDispatchBrokerCapabilityV1`,
  stores immutable
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationDispatchBrokerRedemptionV1`
  and
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationProviderEffectTransmissionClaimV1`,
  advances the complete attempt-set head and CASes
  ExecutionAdmitted→EffectDispatched in one transaction before the broker can
  issue the provider call. Dispatch, not Begin, is the legal/policy
  linearization cut;
- restrictive policy/hold activation or any credential, distrust, namespace-
  fence or owner-routing mismatch closes the attempt as
  FailedDefinitelyNoEffect without capability redemption or provider traffic.
  A new attempt requires fresh execution authorization and a capability under
  current epochs. Two workers join the same redemption/result and cannot
  obtain two call rights;
- EffectDispatched means the provider call may have happened. Crash, broker
  takeover or response loss after its CAS enters ExternalOutcomeUnknown and
  can never return to ExecutionAdmitted. The broker uses the stable effect ID
  as provider idempotency/query identity; an adapter without durable same-
  effect deduplication and reconciliation refuses destructive remediation;
- expiry or revocation after Begin prevents a new attempt, while expiry,
  revocation or policy change after EffectDispatched cannot erase or reinterpret
  historical execution authority. Fresh finalization authority remains
  mandatory where specified below;
- `CompleteMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediation`
  returns
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationCompletionResultV1`
  or
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationCompletionConflict`
  and may only reconcile EffectDispatched/ExternalOutcomeUnknown for that
  effect ID/request digest into its table-mapped continuation. It never
  dispatches or allocates another provider operation.

Canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationProviderEffectConformanceProfileV1`
is immutable governed adapter capability, not a self-asserted provider flag. It
binds provider/account/operation class, effect-ID scope and uniqueness,
idempotency-key construction, the one application-level transmission-claim
deadline, permitted in-claim transport retransmission and deduplication horizons,
linearizable or conservatively monotonic query semantics, accepted/
definitely-no-effect evidence authentication, credential rotation and fencing,
late-duplicate behavior, timeout/partition semantics, takeover and supported
reconciliation method. Canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationProviderEffectTransmissionClaimV1`
binds one non-wrapping claim identity, effect/request/provider/account,
redemption, immutable transmit-before deadline, worker/executor identity and
lease/fence generation. It is the deficit-remediation
domain realization of VIT-INV-006 `TransmissionStartClaimState` and uses the
VIT-CAP-006 trusted-executor claim transaction. Only the winning transaction
receives the
unreconstructable process-local transmission permit. The durable claim row and
permit digest are status/integrity evidence, never bearer authority; neither a
queue message, RPC value, retry, restore nor post-commit response loss can
derive or reconstruct the permit. Exact command retries return only persisted
claim/status/result. Exactly one application-level provider invocation may
consume the winning permit. Only transport-layer retransmission wholly inside
that uninterrupted
invocation is permitted; return to application control, timeout with uncertain
delivery, crash, lease loss or takeover terminalizes the claim and moves the
attempt to ExternalOutcomeUnknown. No worker, executor or reconciler may issue a
second application-level send, even inside the provider deduplication horizon.
That horizon covers in-claim transport duplicates and late delivery; after
claim terminalization reconciliation is authenticated query-only. Canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationProviderEffectConformanceResultV1`
binds the exact profile/provider version and adversarial suite evidence.
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationProviderEffectDefinitelyNoEffectEvidenceV1`
is the only provider evidence that permits a dispatched/unknown effect to close
as definitely no effect. Begin and Dispatch require a current passing result;
profile/version/credential drift is no-dispatch. Unsupported providers refuse
the destructive action rather than weakening the state machine.

The attempt states are ExecutionAdmitted, EffectDispatched,
ExternalOutcomeUnknown, FailedDefinitelyNoEffect or
CompletedMappedContinuation. Response loss after dispatch enters
ExternalOutcomeUnknown and retains the predecessor object, base reservation,
covered deficit, dispatch redemption, capacity/capability evidence and fences
indefinitely; exact retry/reconciliation joins the same attempt without
redispatch.
FailedDefinitelyNoEffect closes the attempt without a policy outcome, and any
new attempt requires a fresh authorization. Changed action/effect/request/
target/capacity/evidence/idempotency conflicts.

Completion never makes a fresh policy choice from old execution authority.
Verified-deletion capacity release and permanently fenced retention additionally
consume an exact Issued
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationFinalizationAuthorizationV1`
for respectively ReleaseAfterVerifiedDeletion or
FinalizePermanentlyFencedRetention. This family independently instantiates the
same complete state/admission/expiry/issuer-revoke/destination-apply/inbox/
tombstone/outcome/NotAdmitted table below. Its canonical machinery is
AuthorizationStateV1, Admit/AdmissionResult, Expire/ExpiryResult,
Revoke/RevocationIntent/RevocationIntentResult/RevocationIntentConflict/
RevocationSequenceKey, ApplyRevocation, RevocationInbox/Tombstone/Result,
AuthorizationOutcome and AuthorizationOperationConflict, all under the
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationFinalization`
name stem. Policy/hold drift or absent finalization authority keeps the admitted
attempt and full charge fenced; it cannot reuse the execution grant.
The exact family is
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationFinalizationAuthorizationV1`,
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationFinalizationActionV1`,
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationFinalizationAuthorizationStateV1`,
`AdmitMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationFinalizationAuthorization`,
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationFinalizationAuthorizationAdmissionResultV1`,
`ExpireMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationFinalizationAuthorization`,
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationFinalizationAuthorizationExpiryResultV1`,
`RevokeMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationFinalizationAuthorization`,
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationFinalizationAuthorizationRevocationIntentV1`,
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationFinalizationAuthorizationRevocationIntentResultV1`,
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationFinalizationAuthorizationRevocationIntentConflict`,
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationFinalizationAuthorizationRevocationSequenceKeyV1`,
`ApplyMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationFinalizationAuthorizationRevocation`,
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationFinalizationAuthorizationRevocationInboxV1`,
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationFinalizationAuthorizationRevocationTombstoneV1`,
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationFinalizationAuthorizationRevocationResultV1`,
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationFinalizationAuthorizationOutcomeV1`,
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationFinalizationAuthorizationOperationConflictV1`
and
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationFinalizationAuthorizationNotAdmitted`.

RetainPermanentlyFenced requires its own action-bound records/security and
independent records, legal, custody and capacity quorum/SoD. Its successful
transaction creates
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityPermanentlyFencedMemberV1`,
moves the entire base plus covered deficit into that named member at the exact
EffectiveCharge, records DeficitSettlement=PermanentlyFencedRetained and
completes the admitted RetainPermanentlyFenced attempt while consuming its
FinalizePermanentlyFencedRetention authorization. It returns no surplus,
keeps the object/namespace/evaluator/legal-hold fences and is the only explicit
storage representation of that continuation.

Deficit-remediation and retained-unknown-resolution grants are never reusable
signed blobs. Each family independently implements AuthorizationStateV1 with
Absent, RevokedBeforeAdmission, Issued, Consumed, ExpiredUnused and
RevokedUnused; Admit/AdmissionResult; Expire/ExpiryResult; issuer-side
Revoke intent/result/conflict and scoped monotonic sequence; destination-side
Apply; revocation Inbox/Tombstone/Result; closed AuthorizationOutcome;
AuthorizationOperationConflict; and AuthorizationNotAdmitted. Their canonical
families are respectively:

- `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationAuthorizationStateV1`,
  `AdmitMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationAuthorization`,
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationAuthorizationAdmissionResultV1`,
  `ExpireMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationAuthorization`,
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationAuthorizationExpiryResultV1`,
  `RevokeMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationAuthorization`,
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationAuthorizationRevocationIntentV1`,
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationAuthorizationRevocationIntentResultV1`,
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationAuthorizationRevocationIntentConflict`,
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationAuthorizationRevocationSequenceKeyV1`,
  `ApplyMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationAuthorizationRevocation`,
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationAuthorizationRevocationInboxV1`,
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationAuthorizationRevocationTombstoneV1`,
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationAuthorizationRevocationResultV1`,
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationAuthorizationOutcomeV1`,
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationAuthorizationOperationConflictV1`
  and
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationAuthorizationNotAdmitted`.
- `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferResolutionAuthorizationStateV1`,
  `AdmitMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferResolutionAuthorization`,
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferResolutionAuthorizationAdmissionResultV1`,
  `ExpireMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferResolutionAuthorization`,
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferResolutionAuthorizationExpiryResultV1`,
  `RevokeMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferResolutionAuthorization`,
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferResolutionAuthorizationRevocationIntentV1`,
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferResolutionAuthorizationRevocationIntentResultV1`,
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferResolutionAuthorizationRevocationIntentConflict`,
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferResolutionAuthorizationRevocationSequenceKeyV1`,
  `ApplyMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferResolutionAuthorizationRevocation`,
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferResolutionAuthorizationRevocationInboxV1`,
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferResolutionAuthorizationRevocationTombstoneV1`,
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferResolutionAuthorizationRevocationResultV1`,
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferResolutionAuthorizationOutcomeV1`,
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferResolutionAuthorizationOperationConflictV1`
  and
  `MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferResolutionAuthorizationNotAdmitted`.

For each family, issuer and destination keys/roles are independent; admission,
revocation application and destructive operation use separated quorum/SoD,
and consumption rechecks retention/legal hold. The same complete first-
terminal table used below applies: one CAS selects expiry, applied revocation
or action consumption; exact duplicate/CAS loser returns the stored outcome,
while changed target/action/digest/scope/sequence/evidence/amount/idempotency
conflicts without action. Pre-admission revocation tombstones survive
restore/import, and VerifyDeletion cannot execute from the signed value unless
its exact destination row is currently Issued and consumed in the same local
transaction as the capacity result.

The profile therefore has a stable lineage/generation/digest and a complete-domain
compatibility/weakening decision; callers cannot supply ad hoc factors. Begin
derives a conservative nonzero maximum custody charge for every planned
transfer. Unknown, omitted, incomparable, non-monotonic, zero-rounded or
overflowing mappings deny before any reservation or external work. Commit
recomputes the final custody charge from the Verified transfer receipt's
encoded size under the reservation's exact pinned profile generation and
retained evaluator, irrespective of CurrentHead. It may be less than the reserved
base maximum but never greater unless the trusted reassessment/covered-deficit
path above produces an exact EffectiveCharge; unused base capacity returns to
Available in that same transaction. Covered deficit follows only its
DeficitSettlement and is not treated as base surplus. The source parent credit remains the exact source-leg
amount. Source and destination quantities share one transfer identity and
conservation proof but need not be numerically identical across unlike
dimensions.

Canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityExternalTransferV1`
has closed
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityExternalTransferStateV1`:
Open, SealPending or Sealed. Open alone accepts a generation/fence-bound chunk,
extension, multipart part or pre-seal evaluator migration. Each accepted
mutation advances a non-wrapping transfer mutation version and invalidates
every earlier proposed root/size/finalization receipt.
`SealMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityExternalTransfer`
CASes Open→SealPending and binds the exact mutation version, accepted encoded
size, proposed root, destination generation/object/namespace, multipart
identity, provider conditional-write token and seal idempotency before asking
the provider to close writes, returning
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityExternalTransferSealResultV1`
or
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityExternalTransferSealConflict`.

Only an authenticated
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityExternalTransferSealReceiptV1`
may CAS SealPending→Sealed. Sealed immutably binds destination generation,
object identity, encoded size, root, ETag/version, multipart completion,
provider fence generation and a provider-authenticated guarantee that stale
credentials, retries and delayed parts cannot append, overwrite, complete or
finalize another version. No chunk, extension, overwrite, multipart
completion, transfer finalization or namespace reuse is accepted after Sealed.
Evaluator reassessment may add capacity against the immutable object but may
not mutate it; remediation needing object mutation must use verified
delete/migrate under a new fenced identity.

`ReconcileMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityExternalTransferSeal`
returns the stored seal result, presents permanent never-completed proof and CASes
SealPending→Open with a fresh seal epoch, or retains SealPending when outcome
is unknown, through
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityExternalTransferSealReconciliationResultV1`
or
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityExternalTransferSealReconciliationConflict`.
The only proof that permits SealPending→Open is provider-authenticated
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityExternalTransferSealDefinitelyNeverCompletedReceiptV1`.
It binds the old provider operation/idempotency, seal epoch, conditional token,
object and multipart generation, cancellation/fence generation, observation
cut and provider guarantee that the old seal/completion request is permanently
rejected and can never complete later. The new Open epoch uses a strictly newer
provider fence and cannot reuse the old conditional token or multipart
generation. Current absence, cancellation request acceptance, timeout, missing
credentials or eventual visibility is insufficient; without permanent non-
completion proof the state remains SealPending and admits no new operation.
Providers without conditional creation, immutable versions and an
equivalent hard write fence are unsupported for custody transfer. MarkEligible
requires the exact Sealed state/receipt and rechecks it against the current
reservation/evaluator-migration/deficit heads. SealPending admits no chunk,
extension, evaluator migration, eligibility or Commit. A pre-seal reservation
or evaluator mutation forces a new seal epoch and receipt; every post-seal
mutation denies rather than resetting the attempt.

Canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityTransferStreamingLimitV1`
binds the reservation/version, pinned profile, accepted encoded bytes and
conservatively calculated running charge. Before accepting each bounded chunk,
the transfer adapter proves the prospective running charge is at most the
current TransferPending amount; it cannot finalize, publish or make visible a
destination object above that amount.
`ExtendMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityReservation`
returns
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityReservationExtensionResultV1`
or
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityReservationExtensionConflict`.
It may atomically move additional Available capacity into the same
TransferPending reservation under the pinned profile and non-wrapping
reservation version only before the next bytes are accepted and only up to the
plan's immutable transfer hard maximum/backend limit. Exact retry returns the
stored extension; changed amount/profile/version/transfer/idempotency conflicts.
If extension cannot commit, the adapter aborts before accepting the overflowing
chunk or finalizing the object and retains the original reservation until
verified cleanup or definitely-never-transferred reconciliation.

Canonical
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityReservationV1`
is created only by Begin or Replan and has closed
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityReservationStateV1`:
TransferPending, ConsumedByCustodyMember, ReleasedDefinitelyNeverTransferred,
ReleasedAfterDestinationDeletion, or
ConvertedToQuarantinedUnknownTransferMember. Begin/Replan atomically moves the
conservative
maximum from custody Available to TransferPending, binds lineage/begin result,
workspace/leg, source root/generation, destination ledger/generation, cost-
profile lineage/admitted generation/digest/evaluator, transfer identity,
initial charge, current extended maximum, immutable plan hard maximum,
non-wrapping version, expiry-independent
terminalization identity and precharged reconciliation/orphan-cleanup capacity.
The external transfer adapter accepts only that exact still-TransferPending
reservation; it cannot create destination bytes from an unreserved request.
Commit atomically converts TransferPending into the final custody member,
joins its covered-deficit encumbrance, charges the exact EffectiveCharge and
returns only proved base surplus. The same transaction moves every covered
deficit unit out of emergency-deficit pending state into the ordinary custody-
ledger member, records DeficitSettlement=ConvertedIntoCustodyMember and leaves
no stranded deficit encumbrance. Emergency reserve Available is not silently
refunded: replenishment requires separately proved capacity.

`ReconcileMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityReservation`
returns
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityReservationReconciliationResultV1`
or
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityReservationReconciliationConflict`.
Unknown external transfer outcome or authenticated destination presence keeps
TransferPending and its full charge. Release to
ReleasedDefinitelyNeverTransferred requires backend-authenticated proof that
the transfer could not have occurred; release to
ReleasedAfterDestinationDeletion requires authenticated deletion of the exact
destination generation/object/root. One local transaction consumes that
evidence, returns the pending amount, stores the terminal result/audit/outbox
and makes exact retry join; changed evidence, generation, root, profile,
transfer or idempotency conflicts. Expiry, cancellation, operator assertion,
timeout or missing credentials never releases the reservation.

Independently authorized
`QuarantineMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransfer`
is the only escape from permanently uncertain TransferPending. Its payload
binds the exact plan/attempt/reservation/version, full reserved maximum,
transfer and destination namespace, last authenticated observations,
reconciliation budget exhaustion, retention/classification/legal-hold
generations, separated records/security/legal approvals, reason/change/
incident authority and stable idempotency. One transaction consumes the exact
QuarantineUnknownTransfer grant, CASes TransferPending→
ConvertedToQuarantinedUnknownTransferMember, converts the full pending maximum
plus every covered deficit without surplus return into one EffectiveCharge in
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferMemberV1`,
installs
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferNamespaceFenceV1`,
terminalizes the evaluator dependency at its already charged maximum and
writes
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferQuarantineResultV1`,
audit and outbox; changed material returns
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferQuarantineConflict`.
The transfer identity and namespace fence never reopen or accept another
write. Later evidence is bounded append-only custody history and never
automatically refunds, deletes or reinterprets the member. Replan may treat
this state as terminal only by reserving entirely new capacity and identities.
Admission also charges non-borrowable deployment/tenant
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferPlatformHardMaximumV1`
count, base-charge, emergency-deficit, evidence-row/byte and resolution-work
ceilings in addition to the plan-lineage budget; exhaustion fences new custody
transfers before external work.

The member has its own closed
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferResolutionStateV1`:
RetainedUnknown, ConfirmedPresent, DeletionVerified or
PermanentlyUnresolvable. The original quarantine record and charge are
immutable in every successor.
`ResolveMigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransfer`
requires a separate complete six-state
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferResolutionAuthorizationV1`
whose exact
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferResolutionActionV1`
is ConfirmPresent, VerifyDeletion or
DeclarePermanentlyUnresolvable. ConfirmPresent first requires completed
evaluator reassessment/deficit coverage, authenticates the exact fenced
object/version/root and atomically converts the retained member into a normal
permanent custody member at the same EffectiveCharge, atomically settles the
deficit into that member and never reduces its charge. VerifyDeletion requires
provider-authenticated absence of every object/multipart/version reachable
under the permanently fenced namespace and independently authorized exact
release of base plus emergency-deficit encumbrances. Active or uncertain legal
hold categorically denies release. DeclarePermanentlyUnresolvable preserves
the member, deficit charge, fence and evidence permanently.
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferResolutionResultV1`
or
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferResolutionConflict`
commits with authorization consumption, ledger settlement, state, original-
quarantine link, audit/outbox and cumulative budget charge. Exact retry joins;
changed action/evidence/policy/amount/idempotency conflicts. No outcome rewrites
the quarantine decision or turns late evidence into implicit authority.
While the lineage is Active/BudgetExhaustedRetained the command binds its
lineage budget charge; after CompletedWithResidualCustody it instead binds the
exact ResidualCustodyObligation/budget/transfer result and cannot mutate or
charge the completed plan lineage.

Every remediation result names exactly one continuation. ResumableCommit binds
the current replacement-evaluator head, EffectiveCharge and sealed transfer
and permits MarkEligible/Commit even when the fully covered amount exceeds the
historical plan maximum. VerifiedDeletionAndReplan records
DeficitSettlement=ReleasedAfterVerifiedDeletion, proves the exact old object
absent and requires a fresh Replan identity/reservation before any new external
work. MigratedPlanReadyForReplan binds authenticated old-object deletion, exact
new fenced destination/member capacity and a new transfer identity, but cannot
mutate the current plan or resume its Commit; only a freshly authorized Replan
may consume it. PermanentlyFencedRetained exists only for the explicit
RetainPermanentlyFenced action and names the permanently fenced custody member,
full EffectiveCharge and immutable fences. No generic success result leaves
the caller to infer which continuation is safe.
External deletion or transfer is outside the database transaction.
Only a verified, idempotent terminal physical-disposition receipt may enter the commit payload.
Its canonical type is
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyReleasePhysicalDispositionReceiptV1`.
An external timeout, unverified observation, partial leg, changed storage
generation/root or Unknown is never such a receipt:
Unknown retains PermanentlyRetained, or the exact Quarantined predecessor, and
authorizes no tombstone, Released advance, parent credit or custody-ledger
change.

After locking the broader lineage release, every referenced custody-capacity
ledger and workspace at the canonical ranks, the one bounded precharged
transaction rechecks terminal state, immutable original total, monotonic
released amount, every remaining leg, retention/classification/legal-hold
generations, custody approvals/evidence, terminal campaign and workspace
checkpoints, current Issued CommitCustodyRelease authorization and proof that
no future operation depends on any retained byte.
It authenticates exactly one closed physical-disposition receipt per complete
remaining leg. For AuthenticatedDeleted it proves the exact physical bytes are
terminally absent. For TransferredToCustodyLedger it requires the exact
TransferPending reservation, recomputes the destination charge and atomically
converts that reservation into the matching custody member before source
credit. Insufficient, stale, overflowing or mismatched reservation, profile,
encoded size or custody capacity makes the entire command no-write.
Preflight admits a TransferredToCustodyLedger target only when its ledger can
join the same local atomic transaction; otherwise the backend refuses before
requesting external transfer. No distributed database transaction or
post-credit compensation is an implementation option.

The enclosing custody-release bundle consumes the authorization exactly once;
this workspace component atomically consumes every disposition receipt,
settles every remaining complete leg, advances WorkspaceReleased exactly to
WorkspaceOriginalTotal, removes the entire remaining workspace parent member,
credits ParentAvailable by the identical checked amount, moves the workspace
to CustodyReleased and writes one domain-separated typed
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyReleasePhysicalDispositionTombstoneV1`,
disposition tombstone per leg, reservation-to-custody-member transfers where
selected, inverse transfer, terminal checkpoint, stored result, audit and
outbox, or does none.
The broader lineage release does not separately credit or remove that workspace member.
Exact retry returns the stored result; any crash, missing/forked disposition,
physical/custody-ledger
proof mismatch or response loss retains the whole remaining encumbrance and
restores the predecessor state. Campaign cleanup cannot invoke this protocol
or partially settle a quarantined/retained member. Reservation admission caps
total leg/receipt/profile/pending-reservation/custody-ledger count, encoded
bytes and work and precharges reconciliation/orphan cleanup, the largest whole-
member transaction and all terminal rows, so custody release is never
implemented as a partially visible multi-transaction loop.

Workspace rows are campaign-owned, co-located and never independently locked.
Their source capacity ledger is a co-located dimension/member of
`MigrationImportRegistryHistoryRecoveryCapacityParentLedgerV1` and is acquired
as part of that one rank; all workspace rows/cursors/high-watermarks/results
are normally acquired inside the existing active-campaign-slot→campaign-fence
rank. After a terminal checkpoint has cleared the old active slot, cleanup
locks the parent ledger, acquires the current parent/selector slot row only to
preserve rank serialization, then acquires the old campaign's stable Closed
fence by campaign identity. It does not require that the slot still names that
campaign and may proceed when the slot is None or names a newer campaign. It
cannot alter the current selector/profile, current slot, newer campaign or its
fence. Every cleanup transaction has platform-hard entry, byte, work and time
limits, releases the shared slot row between quanta, and therefore cannot
indefinitely block new campaign work. The old Closed fence remains addressable
until the workspace settlement checkpoint commits. No workspace-specific
rank, adapter lock or callable out-of-campaign mutation path exists.

Lock fairness is not an availability assumption. Per parent/selector scope,
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCleanupAdmissionLaneV1`
owns a durable non-wrapping count of foreground slot acquisitions since the
last terminal-cleanup quantum and one cleanup claimant/fence.
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCleanupContentionBudgetV1`
monotonically charges failed acquisitions, restarts, foreground grants, bytes,
work and conservative elapsed time across retry, crash, failover and takeover.
When cleanup is pending, at most the profile-bound foreground-acquisition
limit may win before the lane must admit one bounded cleanup quantum. A
separate finite protected release burst may settle already-live foreground
encumbrance, but it cannot reset or bypass the cleanup turn. Once either bound
is reached, new campaign start/build/apply/finalize and allocation return typed
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCleanupBackpressure`
without mutation until the admitted cleanup quantum commits or yields; safety-
reducing release remains bounded and cannot be used as an unlimited starvation
stream. The scheduler decision and slot acquisition are co-located and fenced,
so backend mutex fairness is irrelevant. A cleanup turn resets the foreground
count only after it atomically deletes/settles at least one precharged positive
unit, or consumes independent retention authority and atomically transfers one
exhausted CleanupReconciling workspace into its precharged permanent-retention
pool. That transfer is terminal progress for the active lane but never an
accounting release. Contention, crash, cancellation and response loss cannot
reset any budget. An empty yield or stale claimant cannot count as progress.
An unknown observation cannot count as progress either; exhaustion fences/
takes over the claimant while preserving priority and schedules bounded
reconciliation/retention escalation.

`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCleanupBacklogV1`
and immutable profile-bound
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCleanupHardMaximumV1`
bound terminal workspace count, rows, bytes, remaining parent encumbrance,
cleanup entries/work/time, oldest-work age, queued quanta and terminalization
capacity. Workspace reservation precharges its complete terminal row/cleanup
quantum plus reconciliation and permanent-retention escalation capacity.
Campaign start and Open→Finalizing apply soft-threshold backpressure;
activation proves that adding ActivatedCleanupPending remains within every hard
maximum and retains a pool slot for a worst-case permanently indeterminate
outcome, or leaves the predecessor authoritative. No successful activation can
create an unreserved terminal workspace, make either active-cleanup or
permanent-retention backlog exceed a hard maximum, or strand the cleanup lane
behind unverifiable deletion. The lane, budgets, both backlogs, pool
reservations and maxima are restored before foreground admission.
The completed
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCheckpointV1`
binds campaign identity/epoch, predecessor and successor selector/profile
digests, fixed-snapshot root, the exact closed post-cut high-watermark and fold
root, physical mutation high-watermark, source/successor roots and counts,
writer-fence generation, reservation, cursor, result and verification-profile
digests. It proves one exact shared logical/physical cut rather than two
independently current checkpoints. Catch-up may advance while Open, but the
workspace remains Catchup. Verify may produce Verified only after campaign
Complete pairs with mutation-fence Finalizing, the logical high-watermark is
closed, every old writer is fenced and the physical high-watermark equals that
exact logical cut. Open→Finalizing is admitted only when both the remaining
logical fold tail and physical catch-up tail fit platform-hard entry, byte and
work maxima. A workspace verification opened against a moving cut is
invalidated rather than accepted. Failure retains cleanup capacity until
authenticated cleanup or permanent quarantine; runtime guards cannot replace
this durable physical reservation.

The final local activation bundle first holds Finalizing so mutations cannot
cross the cut. In one transaction it locks and rechecks the current deployment
retirement fence, active-campaign slot, campaign fence/epoch, cost-profile
current head, classifier result/proof digest, post-cut and complete checkpoints,
physical workspace reservation/completed checkpoint, selector and accounting
aggregates. For ValidWeakening it consumes the still-Issued, unexpired and
unrevoked destructive grant; for ValidNonWeakening it consumes the current
ordinary-owner activation result. It CASes the profile head, moves Proposed to
Active and predecessor to Superseded, activates the backend/schema/index
selector, reclassifies all campaign-tagged pending successor charges as active,
must move Verified workspace to ActivatedCleanupPending, moves Complete to
Activated and the campaign fence to Closed, clears the active slot only through
the authenticated terminal checkpoint, and writes one stable activation result,
record, audit and outbox. None of those effects commits alone.
Reclassification changes neither ParentTotal nor ParentAvailable and is allowed
only when AggregateCampaignRecostPending is zero. Later logical row compaction
and verified workspace cleanup are non-authoritative for activation. Missing
child, unlogged mutation, nonzero
RecostPending, failed delta or workspace admission, stale authority/epoch/
parent/head/slot, incomplete checkpoint, unverified successor or unfenced old
writer refuses activation.
The transaction additionally requires exact campaign/workspace checkpoint
identity and root equality for the campaign, epoch, selector/profile digests,
fixed snapshot, closed post-cut high-watermark/fold root and writer-fence
generation. Rechecking two independently valid but differently cut
checkpoints is insufficient.
Destination migration/import recomputes every charge from canonical artifacts
under the destination profile and never copies source `bytes_stored` counters.
Runtime free-disk/WAL/page/temporary-space guards may fence or reject earlier
than the logical and physical reservations but cannot replace a reservation,
reduce a charge, credit the parent or authorize release. Each admitted
backend/profile pair supplies canonical
boundary and golden vectors for zero/minimum/maximum artifact sizes, fractional
expansion, allocation rounding, fixed/index overhead, aggregate accumulation
and every overflow edge. If the profile cannot conservatively upper-bound a
supported artifact for that backend/schema/index generation, that combination
is unsupported rather than assigned an optimistic charge.

Co-located
`MigrationImportRegistryHistoryRecoveryCapacityParentLedgerV1` is the sole
owner of protected Recovery physical capacity. Per kind/dimension it stores
immutable ParentTotal, current ParentAvailable and the exact active child
encumbrance, campaign RecostPending, pending-successor and workspace
encumbrance sets and
enforces:

`parent_total = parent_available + sum(active_child_encumbrances) +
sum(campaign_recost_pending) + sum(pending_successor_encumbrances) +
sum(workspace_encumbrances)`.

The parent never recomputes that sum in an unbounded startup transaction.
Per kind/dimension,
`MigrationImportRegistryHistoryRecoveryCapacityParentAggregateV1` stores the
checked aggregate active, campaign RecostPending, pending-successor and
workspace
encumbrances beside exact membership row sets and authenticated
`MigrationImportRegistryHistoryRecoveryCapacityParentMembershipCommitmentV1`.
Every parent/child transfer transaction updates ParentAvailable, the aggregate,
the exact membership row/commitment and a predecessor-linked
`MigrationImportRegistryHistoryRecoveryCapacityParentCheckpointV1` or none.
The constant-time admission equation is therefore
`parent_total = parent_available + aggregate_active_child_encumbrance +
aggregate_campaign_recost_pending +
aggregate_pending_successor_encumbrance +
aggregate_workspace_encumbrance`; the
streaming membership proof independently establishes that the aggregate equals
the exact active, campaign-pending, pending-successor and workspace sets. Each
workspace member additionally proves immutable WorkspaceOriginalTotal,
monotonic WorkspaceReleased, exact settled-leg membership and
`member = original_total - released`; parent verification never trusts a
rewritten current workspace total.

Canonical
`MigrationImportRegistryHistoryRecoveryCapacityParentVerificationV1` has
closed
`MigrationImportRegistryHistoryRecoveryCapacityParentVerificationStateV1`
VerificationPending, Ready or Fenced. It binds parent/checkpoint/commitment,
stable non-recreatable verification identity, monotonic
`MigrationImportRegistryHistoryRecoveryCapacityParentVerificationCursorV1`,
cumulative counters and non-borrowable
`MigrationImportRegistryHistoryRecoveryCapacityParentVerificationWorkBudgetV1`
plus protected Recovery rows/bytes/audit/outbox/worker/I/O capacity. After
restore, every affected capacity partition starts VerificationPending and is
unavailable for allocation, release, cost-profile activation or other capacity
mutation. Only
`VerifyMigrationImportRegistryHistoryRecoveryCapacityParent` may stream bounded
canonical child chunks against the fixed checkpoint snapshot, precharging each
decode/hash/proof/byte/time quantum before work. Ready commits only after exact
membership, aggregate, transfer adjacency, predecessor checkpoint and both
ledger equations verify. Mismatch, unavailable history, budget exhaustion,
cursor contradiction or snapshot churn becomes Fenced.

Every restorable parent checkpoint carries
`MigrationImportRegistryHistoryRecoveryCapacityParentVerificationReservationV1`.
Checkpoint creation derives the complete required reservation with checked,
profile-bound maxima from authenticated child count and encoded bytes,
membership-commitment depth and chunk count, maximum decode/hash/proof work per
entry, adapter-specific bounded scan/continuation overhead, and terminal
result/audit/outbox/checkpoint/recovery requirements. The reservation covers
the complete fixed snapshot, not merely one worker quantum. It is atomically
encumbered before that checkpoint may become a restorable head; insufficient
capacity leaves the predecessor head authoritative and creates no candidate
head. Restore may spend the reservation in smaller bounded quanta, but its
cumulative budget cannot exceed or be recreated beyond the reserved amount,
and an honest maximum-sized admitted snapshot has sufficient reserved capacity
to finish. Profile bounds whose conservative derivation overflows, depends on
unbounded adapter work or cannot be reserved are unsupported.

Crash, failover and retry resume the same cursor and cumulative charges; they
cannot recreate the verification, reset work or rescan a verified prefix for
free. Child-set churn is serialized behind the VerificationPending/Fenced
partition gate, then normal atomic transfers resume only after Ready. A backend
that cannot provide bounded snapshot/cursor continuation and protected
verification capacity refuses the parent-capacity profile; startup never scans
the whole tenant/deployment set in one transaction.

Allocation and release use stable
`MigrationImportRegistryHistoryRecoveryCapacityParentTransferIdV1` and
immutable
`MigrationImportRegistryHistoryRecoveryCapacityParentTransferV1`, binding
parent/child identities and versions, cost profile, kind, dimension, quantity,
direction, trigger, settlement evidence and result. Allocation atomically
debits ParentAvailable while creating child ReservedUnoccupied. Final release
atomically moves child ReclaimPending or eligible ReservedUnoccupied to
Released, removes the exact child encumbrance and credits ParentAvailable.
Campaign forward transfer instead creates a pending-successor encumbrance;
activation atomically moves its aggregate classification to active without a
parent balance change, and abort's deterministic inverse removes it while
crediting ParentAvailable. All three paths update the applicable aggregate,
membership commitment and predecessor checkpoint in the same transaction.
There is no child Released transition without the matching parent credit, nor
a parent credit without that child transition and unique transfer row. Exact
retry returns the original transfer/result; changed material conflicts.
Response loss, restore and failover reconcile the immutable transfer identity
and both ledger versions. A backend unable to transact over the co-located
parent and child rows refuses the capacity profile.
The stable logical operation deterministically selects its one transfer
identity; a timeout or retry cannot mint another identity for the same
allocation or release. The immutable result binds expected and resulting
parent/child versions, before/after balances, active/pending membership and
the shared settlement result digest. Recovery verifies transfer adjacency and
both equations through the bounded verification state above. It never repairs divergence
by trusting the parent, trusting the child or replaying a guessed compensating
credit. Missing history, duplicate logical-operation mapping, one-sided state
or an unexplained version gap permanently fences capacity until an independently
authorized complete atomic restore proves the original transaction.

Activation assigns immutable work and physical completion/final-custody
envelopes to their typed terminalization reservations and the remainder to the
matching available/unoccupied buckets. No quantity is optional, inferred,
shared across ledgers or movable between dimensions. The same exact typed
transfer cannot apply twice after response loss. Overflow, underflow,
conservation failure, unknown transfer history or a changed retry keeps the
obligation fenced. A per-fence scope, detector, restore or adapter cannot
replace either ledger, replenish a lifetime limit or reset counters.

`AppendMigrationImportRegistryHistory` consumes only a durable Pending
obligation after the canonical activation result/outbox commit, under
the universal history order defined below. It rejects an absent fence and
proceeds only from Healthy or ClearedAfterRestore.
Canonical
`MigrationImportRegistryHistoryArchiveHeadV1` binds tenant/deployment/
namespace, non-wrapping sequence, predecessor/root/entry digest, key/profile,
publication identity and covered obligation/result. The
`MigrationImportRegistryHistoryAppendDispositionV1` is closed to nonterminal
`Pending` and `ManualRecoveryPending`, and terminal `NoHistory`,
`NotRequested`, `Appended`, `ConflictFenced`, `RejectedFenced`,
`WaivedFenced` or `AbandonedWithEvidence`. One transaction
authenticates provenance, precharges bounded
`MigrationImportRegistryHistoryWorkBudgetV1` decode/hash/signature/proof/
bytes-processed/time work while separately reserving rows/bytes-stored/audit/
outbox physical capacity, and atomically advances the matching authoritative
lineage ledgers before doing work or creating storage.
No per-attempt precharge may commit without its cumulative charge, or vice versa.
It then
CAS-advances the archive head and commits
`MigrationImportRegistryHistoryAppendResultV1`. Exact retry returns the result;
changed identity, bytes, provenance, namespace or idempotency returns
`MigrationImportRegistryHistoryAppendConflict`. Retryable failure remains
Pending with monotonic attempts; exhaustion uses protected cleanup capacity and
becomes `ManualRecoveryPending`. That transition persists the exhausted budget,
failure/result evidence, bounded source descriptors and reservations; it does
not create a terminal checkpoint and authorizes no deletion.

`MigrationImportRegistryHistoryRecoveryAuthorizationV1` is an independently
issued, single-use authorization for exactly one action represented by the
closed `MigrationImportRegistryHistoryRecoveryActionV1` tagged union. Its
common envelope binds the obligation and descriptor digests, exhausted budget
lineage/result, current archive-head identity/sequence, source and destination
scope, requestor/approver/operator/quorum/SoD,
trusted-time/profile/continuity/key fields, nonce and idempotency. Its payload
is exactly one of:

- `RetryAppend { predecessor_budget_and_result_digest, successor_ordinal,
  successor_budget_profile, strict_per_successor_ceilings }`;
- `Waive { waiver_reason, change_or_incident_authority,
  retention_and_classification_policy_identity_generation_digest,
  legal_hold_state_epoch, records_compliance_legal_approval_authority,
  required_evidence_retention_floor }`; or
- `Abandon { abandonment_reason, change_or_incident_authority,
  retention_and_classification_policy_identity_generation_digest,
  legal_hold_state_epoch, records_compliance_legal_approval_authority,
  required_evidence_retention_floor }`.

Fields belonging to either other variant are canonically absent. Decoding and
admission reject unknown action discriminants, duplicate tags, mixed or
action-inapplicable fields, non-minimal option encodings and `Some(empty)`
substitutions before allocation or row creation. Reusing an authorization
identity with another action or payload is changed canonical material, never a
new authorization or an exact retry.
The union variant tag is the sole authoritative action discriminator.
Any storage/index action column is derived
from the canonical authorization bytes, is never independently writable or
hashed as authority, and is verified equal on every read; mismatch is
corruption and cannot be repaired by choosing either value.
`AdmitMigrationImportRegistryHistoryRecoveryAuthorization` shares its row with
revocation and expiry. The closed
`MigrationImportRegistryHistoryRecoveryAuthorizationStateV1` is Absent,
RevokedBeforeAdmission, Issued, Consumed, ExpiredUnused or RevokedUnused.
Admission commits canonical
`MigrationImportRegistryHistoryRecoveryAuthorizationAdmissionResultV1`; expiry
through `ExpireMigrationImportRegistryHistoryRecoveryAuthorization` commits canonical
`MigrationImportRegistryHistoryRecoveryAuthorizationExpiryResultV1`. Changed
canonical authorization, intent, timing, sequence or idempotency material
returns `MigrationImportRegistryHistoryRecoveryAuthorizationConflict` without
mutation.
All admission, expiry, revocation and consumption APIs return
`Result<MigrationImportRegistryHistoryRecoveryAuthorizationOutcomeV1,
MigrationImportRegistryHistoryRecoveryAuthorizationOperationConflictV1>`. The closed
outcome is exactly `Admitted(AdmissionResultV1)`,
`Expired(ExpiryResultV1)`, `Revoked(RevocationResultV1)`,
`Consumed(RecoveryResultV1)` or
`NotAdmitted(MigrationImportRegistryHistoryRecoveryAuthorizationNotAdmitted)`,
or `Fenced(MigrationImportRegistryHistoryCorruptionResultV1)`.
NotAdmitted is a typed no-write observation: it creates no authorization row,
sequence, tombstone, idempotency result or authority.
The closed top-level conflict wrapper is exactly
`Authorization(MigrationImportRegistryHistoryRecoveryAuthorizationConflict)`,
`Revocation(MigrationImportRegistryHistoryRecoveryAuthorizationRevocationConflict)`,
or `Recovery(MigrationImportRegistryHistoryRecoveryConflict)`. Existing
detailed conflict records remain canonical inner variants and are never exposed
as incompatible top-level API errors. Corruption is an observed durable state,
not changed request material, and therefore appears only as Fenced outcome.
Admission or consumption against Fenced returns that canonical no-write
outcome. Expiry and revocation of an already Issued grant remain permitted
safety-reducing transitions and return Expired or Revoked; they cannot clear,
bypass or reinterpret the fence.

Recovery authorization revocation is a complete delivery protocol.
`MigrationImportRegistryHistoryRecoveryAuthorizationRevocationIntentV1` binds
the obligation and descriptor, exact canonical authorization identity/digest,
signer identity, key identity and epoch, authentication profile, issuer
identity/continuity, issued-at, not-before, exact target expiry, maximum
trusted-time uncertainty, trusted-time profile and epoch, reason, non-wrapping
sequence, nonce and idempotency. Its
`MigrationImportRegistryHistoryRecoveryAuthorizationRevocationSequenceKeyV1`
is scoped to issuer identity/continuity, tenant/deployment, obligation,
exact authorization identity/digest, and its lifetime
covers the target authorization.
The target action exists only as the tag inside the referenced canonical
authorization bytes. Revocation intent, sequence key and result do not encode a
second authoritative action. A denormalized action index is derived and
read-verified under the same corruption rule as authorization storage.
`ApplyMigrationImportRegistryHistoryRecoveryAuthorizationRevocation` locks the
active coordinator generation, obligation and same authorization row used by
admission/expiry/consumption. One destination transaction authenticates the
intent, advances the target sequence and commits inbox receipt, permanent
RevokedBeforeAdmission or RevokedUnused tombstone,
`MigrationImportRegistryHistoryRecoveryAuthorizationRevocationResultV1`,
audit and outbox. Remote emission has no effect. Exact duplicate returns that
result; changed target/authorization-bytes/continuity/sequence/idempotency returns
`MigrationImportRegistryHistoryRecoveryAuthorizationRevocationConflict`
inside the operation-conflict wrapper without mutation. A late valid revocation after consumption returns the
committed recovery result and cannot change the action or disposition. Restore
recovers authorization, inbox, sequence watermark, tombstone and result as one
atomic lineage before admission or recovery resumes.

Admission, expiry, revocation and consumption implement this total same-row
state table. Explicit expiry operates only on a stored authenticated Issued
grant and current trusted time; admission of an authentic already-expired grant
is the sole Absent-to-ExpiredUnused transition. An “exact” operation has the
identical canonical request/intent identity and digest. Where a durable winner
exists, changed material returns
the matching inner conflict inside
`MigrationImportRegistryHistoryRecoveryAuthorizationOperationConflictV1`
without a write:

| Current state | Admission | Expiry | Revocation | Consumption | Exact duplicate / changed material |
|---|---|---|---|---|---|
| Absent | A valid unexpired grant commits Issued and `Admitted`; admission at or after exact target expiry authenticates the complete grant, commits ExpiredUnused and returns `Expired` | Returns typed `NotAdmitted` without a write because no stored authenticated grant exists | A valid authenticated intent commits RevokedBeforeAdmission and returns `Revoked` | Returns typed `NotAdmitted` without a write | Admission or revocation may create the first row; guessed expiry/consumption identities cannot. An exact loser joins the winner and changed durable material conflicts |
| RevokedBeforeAdmission | Returns `Revoked` and never creates Issued | Returns `Revoked` and never converts the tombstone | Returns `Revoked` | Returns `Revoked` without action | Exact operations join the revocation result; changed material conflicts |
| Issued | Returns `Admitted` | Authenticates the stored grant, commits ExpiredUnused and returns `Expired` | Commits RevokedUnused and returns `Revoked` | The exact authorized action commits Consumed and returns `Consumed` | Exact admission joins its result; expiry, revocation and consumption race by one CAS; changed material conflicts |
| Consumed | Returns `Consumed` | Returns `Consumed` | Returns `Consumed` | Returns `Consumed` | Exact operations join the recovery result; changed material conflicts and no action is reversed |
| ExpiredUnused | Returns `Expired` and never creates Issued | Returns `Expired` | Returns `Expired` without converting expiry to revocation | Returns `Expired` without action | Exact operations join the expiry result; changed material conflicts |
| RevokedUnused | Returns `Revoked` and never creates Issued | Returns `Revoked` | Returns `Revoked` | Returns `Revoked` without action | Exact operations join the revocation result; changed material conflicts |

Every durable result identifies the state, exact authorization digest, winning
operation, trusted-time decision and audit/outbox positions, and every API
maps it to the single closed outcome enum. There is no adapter-specific union,
implicit state, last-writer-wins conversion or transport-level effect.
Admission, expiry, revocation and consumption targeting the same exact
authorization are different valid operations, not changed material. After a
CAS loss, the loser rereads the row and reapplies this table. Admission may
therefore be followed by valid revocation to RevokedUnused or valid expiry to
ExpiredUnused. Consumption, expiry and revocation serialize on the row and
their first terminal transition wins. A conflict requires changed target bytes,
identity, digest or scope under the same operation identity, or reuse of an
idempotency identity with changed canonical material; a fresh valid operation
against the same target returns or advances the table outcome.

`MigrationImportRegistryHistoryRecoveryLineageBudgetV1` binds immutable
overflow-safe cumulative ceilings for the entire obligation: initial and every
successor work quantum, rows/bytes, decode/hash/signature/proof/storage work,
attempts, conservative elapsed time and successor count. Every budget has a
non-wrapping successor ordinal and exact predecessor/result digest; all
precharges advance the obligation-level counters. A fresh authorization can
use only remaining lineage capacity, never reset counters by changing issuer,
profile, action, attempt, process, backend or idempotency. Once a cumulative
dimension is exhausted, RetryAppend admission fails closed; the obligation
stays ManualRecoveryPending until distinct Waive or Abandon authority is
admitted. `MigrationImportRegistryHistoryRecoveryPlatformHardMaximumV1` is a
versioned compile-time/deployment-profile upper bound; the initial lineage
ceiling must be no greater in every dimension.
No lineage-budget amendment or increase operation is supported through `1.0.0`.
Policy/profile/authority
changes, successor grants, migration, restore and rollback cannot raise a
ceiling, replace its lineage, reduce consumed counters or reuse a successor
ordinal. An adapter that cannot prove this exact no-increase rule refuses the
profile.
The lineage row is created only by the activation transaction, never lazily by
append, exhaustion, recovery, repair or restore. Missing, duplicate,
zero-initialized-late, profile-mismatched or counter-inconsistent lineage state
for Pending or ManualRecoveryPending returns typed
`MigrationImportRegistryHistoryLineageStateMissing` and must durably fence the
exact obligation before returning. Migration and restore require the
exact lineage row for every nonterminal archival obligation and the canonical
no-executable-lineage proof for NoHistory/NotRequested.

Corruption fencing is separately owned state and never a new append
disposition. `MigrationImportRegistryHistoryCorruptionFenceV1` is keyed only by
the exact obligation and has a non-wrapping fence generation plus closed
`MigrationImportRegistryHistoryCorruptionFenceStateV1` Healthy, Fenced or
ClearedAfterRestore states. Activation alone creates Healthy generation zero;
Fencing and clearance each increment the generation, and later detection may
move ClearedAfterRestore to a higher-generation Fenced. Absence, rollback,
wraparound or an unexpected transition is corruption and never interpreted as
Healthy.

Every append, detection, recovery, clearance, checkpoint and cleanup path uses
one universal relative order encoded by the shared, non-overridable
`MigrationImportRegistryHistoryLockRankV1`:
deployment-retirement-fence→active-coordinator-generation→job→candidate/barrier→authorization→ordered-domain-owner→control-settlement-archive-head→control-settlement-journal-head→recovery-capacity-parent-ledger→backend-storage-cost-active-recost-campaign-slot→backend-storage-cost-recost-campaign-fence→corruption-control-reserve→history-obligation→corruption-fence→corruption-control-lineage→corruption-control-lineage-checkpoint→corruption-control-lineage-release-authorization→lineage-disposition→recovery-authorization→clearance-anchor-source-manifest-head→clearance-anchor-source-manifest-authorization→corruption-clearance-anchor-registry→corruption-clearance-scope→corruption-clearance-authorization→corruption-clearance-attempt→corruption-rebuild→corruption-rebuild-rejection-authorization→archive-head→history/idempotency→recovery-lineage-budget→attempt/successor-budget→retention/legal-hold/custody→audit/result/outbox.
An operation locks only its present/applicable rows and reservations, but it
never acquires a later position before an earlier one. In particular no path
holds a budget while waiting for the fence, and detection of a missing lineage
row locks the obligation and activation-created fence before testing or
attempting to lock that lineage. Adapters cannot define another rank mapping.
The deployment-retirement fence is the first rank for every deployment-local
read or mutation, including coordinator, parent-capacity and domain-owner work;
retirement therefore never waits while holding a later row. The active re-cost
campaign slot follows its parent ledger, and its campaign fence follows the
slot; both are locked/rechecked by every parent allocation, release, campaign
start/apply/finalize/recover/abort and activation transaction.
When one operation acquires multiple campaign-fence instances it deduplicates
their canonical identities and locks them in ascending canonical campaign-ID
byte order. Release uses the same slot/fence ranks before every later control,
lineage, authorization, custody or output row.
Conformance tests record every acquisition/recheck trace, compare it to the
shared rank type and exercise absent-row, duplicate, release and contention
paths. An adapter unable to prove this order refuses the profile.

`FenceMigrationImportRegistryHistoryCorruption` uses that order. Its one local
transaction first claims the activation-created protected control reservation,
then locks the history obligation, corruption fence and obligation-wide control
lineage in rank order and binds the obligation,
expected Healthy/ClearedAfterRestore fence generation, observed lineage
presence/bytes/digest, corruption reason,
coordinator generation/fence, detector identity, bounded evidence, idempotency
and audit/outbox positions. It first claims one non-wrapping corruption-episode
ordinal. For every lifetime-work dimension, episode creation atomically
transfers the complete bounded worst-case quantum from WorkAvailable to
EpisodeWorkReserved and leaves TerminalizationWorkReserved untouched. It does
not increment WorkSpent. In the physical ledger it binds an exact episode
reservation set and moves only capacity for rows/bytes-stored/audit/outbox
actually created from ReservedUnoccupied to Occupied. Only checked typed
capacity may fund the new immutable
`MigrationImportRegistryHistoryCorruptionControlEpisodeV1` and canonical
`MigrationImportRegistryHistoryCorruptionClearanceScopeV1` generation zero for
that exact obligation/Fenced generation. The transaction then increments the
fence generation, records the active fence/scope in the control lineage and
commits Fenced, the episode/scope, and canonical
`MigrationImportRegistryHistoryCorruptionResultV1`. The scope maximum is copied
only from that EpisodeWorkReserved allocation and bound physical reservation
set, cannot exceed their checked remaining lifetime
capacity and is never detector-, adapter- or new-fence-supplied. Every scope
proof/retry/work precharge atomically transfers the exact quantity from
EpisodeWorkReserved to WorkSpent in both scope and lineage state; it never adds
the same quantity independently to both. Every created or enlarged durable
artifact independently moves its exact physical units from ReservedUnoccupied
to Occupied. Scope terminalization consumes only the bound
TerminalizationWorkReserved and matching physical terminalization reservation.
An
episode that reaches Cleared or RebuildActivated may return unused
EpisodeWorkReserved to WorkAvailable only in its authenticated terminal-result/
checkpoint transaction under a stable work-transfer identity.
PermanentlyUnprovable or PermanentlyQuarantined keeps unused work and physical
capacity encumbered until the lineage’s custody-safe Release. Clearance cannot
refund WorkSpent, mark Occupied as Released or reset either ledger. Fence,
episode, scope, result, reservation/lineage
accounting, audit and outbox commit together even when all ordinary capacity is exhausted.
Episode-count, WorkAvailable, ReservedUnoccupied or cumulative WorkSpent
exhaustion, or inability to retain
`MigrationImportRegistryHistoryCorruptionControlMinimumFutureCapacityV1`
sets the lineage PermanentlyQuarantined, commits the evidence/result using its
protected terminal reserve and keeps the obligation Fenced without creating
fresh operational capacity. Exact retry returns that result;
changed observation under the same idempotency returns
`MigrationImportRegistryHistoryCorruptionConflict`. Detection has no effect
until this commit; the fence is obligation-scoped and cannot quarantine a
tenant/deployment or alter append disposition. Append, recovery and cleanup
lock/recheck the fence after the obligation lock. Fenced returns the canonical
corruption result, permits no append/recovery/checkpoint/cleanup and never
creates lineage or infers counters.

Clearance is not ordinary editing and has its own complete authority protocol.
The clearance scope is the fence-wide coordination lineage, not an
authorization-local cache. Its closed disposition is Open,
PermanentlyUnprovable, Cleared or RebuildActivated under
`MigrationImportRegistryHistoryCorruptionClearanceScopeDispositionV1`. It binds the sole active
authorization identity and non-wrapping authorization generation; immutable
`MigrationImportRegistryHistoryCorruptionClearanceScopeHardMaximumV1`;
overflow-checked cumulative
decode/hash/signature/proof/bytes/time/retry counters; current anchor source-
manifest and registry generations/digests; and terminal result/audit/outbox.
The hard maximum must equal the value derived by trusted code and reserved at
activation from the authenticated active control-capacity profile and allocated
to this episode by the obligation-wide control lineage. It cannot exceed
lineage remaining capacity or be increased/reconstructed from a new fence,
detector, adapter, restore or import input.
Every authorization admission, proof precharge, terminal attempt, restore and
rebuild locks/rechecks this row. Absence, generation rollback or mismatch
returns `MigrationImportRegistryHistoryCorruptionClearanceScopeConflict`
without mutation.

Canonical
`MigrationImportRegistryHistoryCorruptionClearanceAuthorizationV1` binds the
exact obligation, current Fenced generation and observed-corruption digest;
exact proposed restoration bundle/root and expected current archive,
checkpoint, attempt, cumulative-lineage and result heads; a versioned
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSetV1`; immutable
`MigrationImportRegistryHistoryCorruptionClearanceVerificationBudgetV1` whose
ceilings do not exceed the scope’s remaining lifetime capacity; exact clearance
scope identity/authorization generation; source-manifest and anchor-registry
generations/digests;
requestor/approvers/operator, quorum and SoD; signer/issuer/key/profile/
continuity; trusted-time interval/profile/epoch; nonce and idempotency.
`MigrationImportRegistryHistoryCorruptionClearanceAuthorizationAuthorityPortV1`
is an independent issuer/admitter capability boundary. The detector, importer,
activation actor, archive worker, affected domain owner and ordinary recovery
issuer have verification-only access and cannot mint, admit or self-approve
clearance.

“Greatest-known” is destination-ratcheted state, never an assertion supplied by
the clearance issuer. Canonical
`MigrationImportRegistryHistoryCorruptionClearanceAnchorRegistryV1` is keyed by
stable tenant/deployment/obligation scope and binds a non-wrapping registry
generation, predecessor digest, versioned required anchor classes, per-class
minimum quorum, typed high-watermarks, exact current
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestV1`
generation/digest, anchor issuer/key epoch/continuity/time/provenance and the
admitted collection-receipt digest.
`MigrationImportRegistryHistoryCorruptionClearanceAnchorRegistryAuthorityPortV1`
is the independent destination admission boundary.
`AdvanceMigrationImportRegistryHistoryCorruptionClearanceAnchorRegistry`
accepts only an independently authenticated
`MigrationImportRegistryHistoryCorruptionClearanceAnchorCollectionReceiptV1`
that binds the full expected source set from the current manifest,
authenticated responses and policy-bounded nonresponses, collection interval/
expiry/uncertainty/trusted-time evidence, source key continuity, registry
predecessor and proposed anchor set. Its destination-
local transaction rejects a missing required class, insufficient quorum,
omission of any already-known anchor, component downgrade, predecessor mismatch
or generation wrap, stale/changed source manifest, unexpected/unqueried source,
unpermitted nonresponse or time/continuity failure. It then locks registry,
clearance scope, active authorization and attempt in that order and advances
the registry plus scope binding atomically:

- when no scope exists because the locked fence is still initial Healthy, it
  advances the registry without creating a scope; scope absence while Fenced is
  corruption and cannot be repaired by this operation;
- when the scope is Open with no live authorization/attempt, it preserves the
  scope generation, authorization generation, lifetime counters and hard
  maximum while replacing only the manifest/registry binding;
- when the scope is Open with a live grant, it consumes that grant and
  terminalizes its attempt as AnchorSetStale, preserves all charges, releases
  the active slot, increments the non-wrapping scope authorization generation
  and installs the new binding; and
- when the scope is PermanentlyUnprovable, Cleared or RebuildActivated, the
  registry may advance but the terminal scope bytes and disposition never
  change.

Canonical
`MigrationImportRegistryHistoryCorruptionClearanceScopeAnchorRebindingResultV1`
is embedded in
`MigrationImportRegistryHistoryCorruptionClearanceAnchorRegistryAdvanceResultV1`;
registry, optional grant/attempt terminalization, scope rebinding, protected
control-reserve accounting, result, audit and outbox commit together or none.
Exact response-loss retry joins that result; reused advancement identity with
changed registry/receipt/class/quorum/high-watermark material returns
`MigrationImportRegistryHistoryCorruptionClearanceAnchorRegistryAdvanceConflict`
without mutation. The clearance issuer, detector, restore worker and corrupted local
history state cannot nominate or sign the collection receipt. The production
profile selects a non-empty mandatory class set and quorum; unconstrained
“and/or” anchor semantics are unsupported.

Authorization admission binds and rechecks the current clearance scope,
source-manifest and anchor-registry generations/digests, exact expected sources,
required class/quorum/nonresponse/time profile and collection receipt. It CAS-
installs the sole active authorization and next non-wrapping authorization
generation only while the scope is Open and no other authorization/attempt is
live. Final restoration locks and rechecks all three lineages again. A stale set presented before
admission returns typed no-write
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSetStale`; advancement
after admission performs the atomic registry/scope rebinding above, consumes
and terminalizes that authorization/attempt with the same typed result and
leaves Fenced, so a fresh authorization must bind the advanced registry. There
is no stranded Open scope and no adapter-defined rebinding path.

Expiry, RevokedUnused, terminal AnchorSetStale or per-authorization
BudgetExceeded may release the active slot only in the same transaction that
terminalizes the attempt and preserves its proof charges. A replacement grant
increments the scope authorization generation and receives no more than the
remaining fence-lifetime budget. EvidenceWait never releases the slot.
Authenticated Unprovable or exhaustion of the scope hard maximum atomically
sets PermanentlyUnprovable and a durable tombstone; admission then always
denies. Successful proof may set scope Cleared and fence ClearedAfterRestore
only if the locked control lineage remains Active and retains its configured
minimum future fencing/terminalization capacity; otherwise it atomically sets
the control lineage PermanentlyQuarantined and leaves the fence operationally
closed. Rebuild activation sets scope RebuildActivated and the control lineage
Rebuilt. Every terminal disposition invalidates any stale competing
grant/worker by the scope generation, and none may return to Open.

`AdmitMigrationImportRegistryHistoryCorruptionClearanceAuthorization` is the
only Absent-to-Issued path. The closed
`MigrationImportRegistryHistoryCorruptionClearanceAuthorizationStateV1` is
Absent, RevokedBeforeAdmission, Issued, Consumed, ExpiredUnused or
RevokedUnused. Admission and
`ExpireMigrationImportRegistryHistoryCorruptionClearanceAuthorization` return
canonical
`MigrationImportRegistryHistoryCorruptionClearanceAuthorizationAdmissionResultV1`
and
`MigrationImportRegistryHistoryCorruptionClearanceAuthorizationExpiryResultV1`.
The authenticated
`MigrationImportRegistryHistoryCorruptionClearanceAuthorizationRevocationIntentV1`
uses an exact-authorization/obligation/fence-generation-scoped non-wrapping
`MigrationImportRegistryHistoryCorruptionClearanceAuthorizationRevocationSequenceKeyV1`;
only
`ApplyMigrationImportRegistryHistoryCorruptionClearanceAuthorizationRevocation`
may create RevokedBeforeAdmission or CAS Issued to RevokedUnused in the
destination row and returns
`MigrationImportRegistryHistoryCorruptionClearanceAuthorizationRevocationResultV1`.
Remote emission has no effect. All operations return the
closed
`MigrationImportRegistryHistoryCorruptionClearanceAuthorizationOutcomeV1` or
typed
`MigrationImportRegistryHistoryCorruptionClearanceAuthorizationConflict`;
the outcome is exactly Admitted, Expired, Revoked,
Attempt(`MigrationImportRegistryHistoryCorruptionClearanceAttemptResultV1`) or
NotAdmitted, plus typed no-write AnchorSetStale before admission. Attempt
carries both nonterminal and terminal attempt results.
exact response-loss retries return the committed result and changed target,
anchor, bundle, budget, time or idempotency material conflicts without
mutation.

Clearance authorization and restoration implement this normative same-row
authorization and clearance-scope table. An exact operation has identical canonical
scope/authorization generation, authorization, attempt, source-manifest,
anchor-registry, bundle and idempotency material:

| Current authorization state | Admission | Expiry | Revocation | Restore / verify | Exact duplicate, CAS loss or changed material |
|---|---|---|---|---|---|
| Absent | Only an Open scope with no active grant may CAS the next authorization generation and admit a valid current unexpired grant; an authentic expired grant commits ExpiredUnused without occupying the slot; stale manifest/registry input is no-write AnchorSetStale | NotAdmitted without a write | A valid intent commits RevokedBeforeAdmission and returns Revoked | NotAdmitted without an attempt or charge | Admission/revocation may create the row; guessed expiry/restore cannot. Exact losers join the winner; a second live grant or changed material denies/conflicts |
| RevokedBeforeAdmission | Revoked | Revoked | Revoked | Revoked without an attempt | Exact operations join revocation; changed material conflicts |
| Issued | Admitted only when it remains the scope’s active generation | Before exact trusted expiry returns Admitted without mutation; at/after expiry CAS to ExpiredUnused, releases the scope slot and returns Expired | CAS to RevokedUnused, releases the scope slot and returns Revoked | Create or join the unique durable attempt. Success CASes scope to Cleared; Unprovable or lifetime exhaustion CASes PermanentlyUnprovable; per-grant BudgetExceeded or post-admission AnchorSetStale consumes the grant and releases the slot; EvidenceTemporarilyUnavailable retains Issued and the slot | Expiry, revocation and terminal restore race by one scope/row CAS. A loser rereads/reapplies both rows and the attempt; changed material conflicts |
| Consumed | Returns the stored terminal attempt result | Returns that attempt result | Returns that attempt result | Returns that attempt result and never restores twice | Exact operations join one result; changed material conflicts |
| ExpiredUnused | Expired | Expired | Expired without conversion | Expired and, if an attempt exists, terminalize it as AuthorizationLost | Exact operations join expiry; changed material conflicts |
| RevokedUnused | Revoked | Revoked | Revoked | Revoked and, if an attempt exists, terminalize it as AuthorizationLost | Exact operations join revocation; changed material conflicts |

`MigrationImportRegistryHistoryCorruptionClearanceAttemptV1` has stable
authorization-scoped identity and a unique active-attempt key, exact bundle/
anchor/budget digests, non-wrapping attempt and lease-fencing generations,
closed `MigrationImportRegistryHistoryCorruptionClearanceAttemptStateV1`
Prepared, Verifying, EvidenceWait, Cleared, Unprovable, BudgetExceeded,
AnchorSetStale or AuthorizationLost, a durable verification cursor, immutable
ceilings, overflow-checked cumulative decode/hash/signature/proof/bytes/time/
retry counters and canonical result. `BeginOrResumeMigrationImportRegistryHistoryCorruptionClearanceAttempt`
joins the same live attempt; another worker may take over only after the lease
and fencing-token CAS, and the old token cannot commit.

Every proof execution transaction precharges its bounded worst-case quantum
atomically against attempt counters and clearance-scope lifetime counters while
moving the identical typed quantity from the active episode’s
EpisodeWorkReserved bucket to the obligation-wide lineage’s monotonic WorkSpent
bucket before
external fetch, decode, allocation, hash or signature work. Scope and lineage
updates share one transaction and transfer identity; no adapter may debit
WorkAvailable, retain EpisodeWorkReserved and increment WorkSpent for the same
work. Durable cursor/result growth separately moves exact bytes_stored/row/
audit/outbox units from ReservedUnoccupied to Occupied and never charges
bytes_processed as bytes_stored.
Completion
commits the cursor/result under the same quantum identity. Exact response-loss
retry joins a committed step; an ambiguous or crashed incomplete execution
keeps its charge and takeover precharges a fresh retry, so crash, cancellation,
lease loss, backend change or failover cannot reset or undercount work.
`MigrationImportRegistryHistoryCorruptionClearanceEvidenceTemporarilyUnavailable`
commits EvidenceWait without consuming authority and resumes only the same
attempt while Issued. `MigrationImportRegistryHistoryCorruptionClearanceUnprovable`,
`MigrationImportRegistryHistoryCorruptionClearanceBudgetExceeded` and post-
admission `MigrationImportRegistryHistoryCorruptionClearanceAnchorSetStale` are
terminal, consume the grant and leave Fenced. Unprovable permits only the
successor rebuild below. BudgetExceeded permits only a fresh independently
approved authorization and new attempt within the scope’s remaining lifetime
capacity and platform cap; it cannot reset lifetime counters, resume or enlarge
the consumed grant. AnchorSetStale permits only a fresh
authorization binding the advanced registry.
`MigrationImportRegistryHistoryCorruptionClearanceAuthorizationLost` is
terminal when expiry/revocation wins, preserves all charges/evidence, performs
no restore and requires fresh authority.

`RestoreMigrationImportRegistryHistoryAtomicBundle` accepts only the admitted
Issued authorization and its unique attempt. It authenticates the exact
activation-era barrier/result/obligation/Healthy-fence/lineage-disposition
bundle plus every post-activation attempt/cumulative charge, append/recovery
result, archive-head advance and checkpoint. It must prove the proposed root
covers every class/quorum and component high-watermark in the locked current
anchor registry and equals the locked expected current heads; a historically
authentic but older bundle cannot roll back newer counters, heads or results.
Canonical
`MigrationImportRegistryHistoryCorruptionClearanceCounterJoinV1` computes each
monotonic consumed-work G-counter as the overflow-checked component-wise maximum
of authenticated comparable evidence. It is only one case in the partial typed
`MigrationImportRegistryHistoryCorruptionClearanceStateJoinV1` algebra:

- immutable ceilings/profile identities require exact equality;
- remaining capacity is derived only by checked ceiling-minus-consumed
  subtraction and is never joined independently;
- ordinals, archive/journal/checkpoint heads and results select one
  authenticated causal chain that contains the others; forked or incomparable
  chains have no join;
- balances, reservations and conservation-linked fields come only from one internally consistent authenticated snapshot;
  they are never assembled by
  field-wise maxima; and
- G-counter joins require compatible dimensions/epochs and remain within the
  immutable platform and clearance-scope hard maxima.

The committed state must equal this typed join. Overflow, unequal immutable
material, broken subtraction/conservation, incomparable evidence, cap excess or
any undefined combination remains fenced. Property/model tests prove each
defined join’s idempotence, associativity and commutativity plus conservation,
causal-head selection, overflow denial and rejection of incompatible evidence.
Its universal-order local transaction consumes the single-use authorization,
commits the computed bytes/counters, increments Fenced to
ClearedAfterRestore, and writes
`MigrationImportRegistryHistoryCorruptionClearanceResultV1`, terminal Cleared
attempt, authorization tombstone, audit and outbox atomically. Exact retry
returns that result; changed material returns the authorization or corruption
conflict without mutation.

Authenticated proof that the lineage is missing, forked, inferred,
incompatible or cannot cover the required anchors returns typed
`MigrationImportRegistryHistoryCorruptionClearanceUnprovable` and leaves
Fenced permanent with custody evidence retained. Temporary evidence outage,
budget exhaustion and registry advancement retain their distinct typed attempt
results and do not masquerade as Unprovable. The only v1 fallback for
Unprovable is
`RebuildMigrationImportRegistryHistoryUnderSuccessorCoordinator`: a separately
authorized coordinator-bootstrap and activation flow creates a new coordinator
generation and new obligation identity from independently anchored evidence.
Canonical `MigrationImportRegistryHistoryCorruptionRebuildRecordV1` is uniquely
keyed by old obligation identity and exact Fenced generation and binds the
corruption-result digest, anchor-registry generation/set/collection receipt,
terminal unprovable/clearance-scope result, stable rebuild identity, immutable
proposal-attempt count/work ceilings, old immutable evidence archive namespace,
and result/audit/outbox. It is the one parent row; its closed
`MigrationImportRegistryHistoryCorruptionRebuildStateV1` is Open, Activated or
PermanentlyRejected.

Each valid candidate uses an immutable bounded
`MigrationImportRegistryHistoryCorruptionRebuildProposalAttemptV1` with
non-wrapping ordinal, stable idempotency identity, proposed successor
coordinator generation/new obligation and disjoint live archive namespace,
authorization/evidence/policy digests, budget charges and Proposed,
RejectedRetryable or Activated result. Malformed, unauthenticated, stale,
wrong-predecessor or over-budget proposals return a typed no-write
`MigrationImportRegistryHistoryCorruptionRebuildProposalNotAdmitted`; they do
not create the parent, consume an ordinal or block a corrected proposal.
A valid proposal that loses a commit-time recheck may become
RejectedRetryable while the parent stays Open and capacity remains.

Permanent rejection requires an independently issued/admitted, action-bound
`MigrationImportRegistryHistoryCorruptionRebuildRejectionAuthorizationV1`
binding the parent/predecessor/fence generation, terminal unprovable result,
reason/custody justification, retention/classification/legal-hold epochs,
quorum/SoD, signer/key/continuity, trusted time and idempotency. Only
`PermanentlyRejectMigrationImportRegistryHistoryCorruptionRebuild` consumes it
and atomically moves Open to PermanentlyRejected with canonical result/audit/
outbox and
`MigrationImportRegistryHistoryCorruptionRebuildRejectionResultV1`; changed
authority/parent/reason/custody/time/idempotency returns
`MigrationImportRegistryHistoryCorruptionRebuildRejectionConflict` without
mutation. No importer, failed candidate, coordinator, worker or adapter may infer
permanent rejection.

The source-manifest policy-transition and rebuild-rejection grants are
destructive-authority protocols, not signed blobs. Closed
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionActionV1`
is InitializeManifest, WeakenManifest or
WeakenCheckpointPublicationProfile or WeakenBackendStorageCostProfile. The canonical manifest action binds stable
lineage/target, expected predecessor/current-head bytes, and exact proposed
genesis/successor manifest bytes. Publication-profile weakening instead binds
the stable profile lineage, expected profile head, exact predecessor/successor
profile bytes and typed weakening-classification result. Storage-cost-profile
weakening binds its stable lineage/current head, exact predecessor/successor
profile bytes, complete-domain analytical classifier proof, affected backend/
schema/index selector and required re-cost checkpoint. Fields belonging to the
other action variants are canonically absent. Canonical rebuild rejection binds PermanentlyReject, the exact
parent/predecessor/fence/current bytes, and canonical absence of proposed
successor bytes. Both authorization envelopes bind issued-at, not-before, exact
expiry, maximum uncertainty, trusted-time profile/epoch, signer/key/profile/
continuity, requestor/approvers/operator, quorum/SoD, reason/custody and
legal-hold inputs where applicable, nonce and idempotency.

Their closed states are independently typed
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionAuthorizationStateV1`
and
`MigrationImportRegistryHistoryCorruptionRebuildRejectionAuthorizationStateV1`,
each exactly Absent, RevokedBeforeAdmission, Issued, Consumed, ExpiredUnused or
RevokedUnused. Only
`AdmitMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionAuthorization`
or
`AdmitMigrationImportRegistryHistoryCorruptionRebuildRejectionAuthorization`
may admit the corresponding grant and return its canonical
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionAuthorizationAdmissionResultV1`
or
`MigrationImportRegistryHistoryCorruptionRebuildRejectionAuthorizationAdmissionResultV1`.
Issued-only expiry uses
`ExpireMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionAuthorization`
or
`ExpireMigrationImportRegistryHistoryCorruptionRebuildRejectionAuthorization`
and the matching
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionAuthorizationExpiryResultV1`
or
`MigrationImportRegistryHistoryCorruptionRebuildRejectionAuthorizationExpiryResultV1`.

Authenticated
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionAuthorizationRevocationIntentV1`
and
`MigrationImportRegistryHistoryCorruptionRebuildRejectionAuthorizationRevocationIntentV1`
bind the exact target authorization bytes/digest; revocation issuer identity
and continuity; signer identity, key identity/epoch and authentication profile;
issued-at and not-before; target-covering expiry/not-after; maximum uncertainty
and trusted-time profile/epoch; closed reason code; nonce; and a distinct
revocation idempotency identity. The canonical not-after covers the complete
target authorization lifetime and cannot be shortened by transport or adapter
defaults. Both use target-scoped non-wrapping
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionAuthorizationRevocationSequenceKeyV1`
or
`MigrationImportRegistryHistoryCorruptionRebuildRejectionAuthorizationRevocationSequenceKeyV1`.
Only destination-local
`ApplyMigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionAuthorizationRevocation`
or
`ApplyMigrationImportRegistryHistoryCorruptionRebuildRejectionAuthorizationRevocation`
may commit the corresponding inbox, sequence high-watermark,
RevokedBeforeAdmission/RevokedUnused tombstone,
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionAuthorizationRevocationResultV1`
or
`MigrationImportRegistryHistoryCorruptionRebuildRejectionAuthorizationRevocationResultV1`,
audit and outbox. Remote issuance or revocation has no effect until that
destination transaction commits.

All operations return the matching closed
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionAuthorizationOutcomeV1`
or
`MigrationImportRegistryHistoryCorruptionRebuildRejectionAuthorizationOutcomeV1`;
changed canonical action, target, predecessor, successor/absence, timing,
signer, sequence, nonce or idempotency returns
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestPolicyTransitionAuthorizationConflict`
or
`MigrationImportRegistryHistoryCorruptionRebuildRejectionAuthorizationConflict`
without mutation. Initialization/weakening or permanent rejection consumes one
Issued grant in the same transaction as the manifest current-head transition
or rebuild-parent transition, result, audit and outbox.

Both destructive grants implement this total same-row table:

| Current state | Admission | Expiry | Revocation | Destructive consumption | Exact duplicate, CAS loss or changed material |
|---|---|---|---|---|---|
| Absent | Valid unexpired exact grant commits Issued; authentic already-expired admission commits ExpiredUnused | No-write NotAdmitted because no stored grant exists | Valid intent commits RevokedBeforeAdmission | No-write NotAdmitted | Only admission/revocation may create the row; exact losers join and changed material conflicts |
| RevokedBeforeAdmission | Revoked | Revoked | Revoked | Revoked without action | Exact operations join revocation; changed material conflicts |
| Issued | Admitted | At/after exact expiry commits ExpiredUnused | Commits RevokedUnused | Exact action atomically commits Consumed and its target transition | Expiry, revocation and consumption race by one CAS; loser rereads and reapplies this table |
| Consumed | Stored consumed result | Stored consumed result | Stored consumed result | Stored consumed result; action never repeats | Exact operations join; changed material conflicts |
| ExpiredUnused | Expired | Expired | Expired without conversion | Expired without action | Exact operations join expiry; changed material conflicts |
| RevokedUnused | Revoked | Revoked | Revoked | Revoked without action | Exact operations join revocation; changed material conflicts |

Every result binds the canonical authorization/action digest, winning operation,
trusted-time decision and audit/outbox positions. Pre-admission revocation
tombstones survive restore/import, expiry never guesses an absent grant, and
after any CAS loss the loser rereads the destination row and reapplies the
table rather than inferring success or retrying the destructive action.

Activation atomically rechecks the parent is Open; exact old obligation and
Fenced generation; terminal PermanentlyUnprovable scope/result; current anchor
source-manifest and registry generations/digests; coordinator generation; and
current retention/classification/legal-hold/custody state. It then commits one
`MigrationImportRegistryHistoryCorruptionRebuildResultV1`, the successor
coordinator generation and new Healthy obligation, marks that attempt and
parent Activated, and moves the clearance scope to RebuildActivated. Exact
retry joins it and a different/late successor returns
`MigrationImportRegistryHistoryCorruptionRebuildConflict` without mutation.
The parent CAS and unique activated-successor index ensure at most one attempt
can activate across all coordinator generations.
Until Activated no rebuilt history is current; afterward reads, exports and
custody selection follow only the mapped successor while the old namespace
remains immutable corruption evidence and is never merged or presented as
current. PermanentlyRejected is terminal and creates no successor.
It never clears, overwrites or reuses the old fenced obligation. Restore,
migration, failover and rollback preserve every Healthy/Fenced/
ClearedAfterRestore generation, anchor-registry ratchet/receipt, authorization,
attempt/cursor/charge/result and predecessor-successor mapping before any worker
starts; omission, duplication or recreation refuses readiness.

The control lineage disposition is exactly Active, PermanentlyQuarantined,
Rebuilt, ReleasePending or Released. Rebuild activation atomically records
Rebuilt and prevents another corruption episode on the predecessor.
PermanentlyQuarantined preserves the fence and enough non-borrowable capacity
to record its final custody decision; neither state can return to Active.
ReleasePending is non-operational and retains every physical encumbrance until
authenticated archive/deletion settlement completes. Before any physical
capacity is released, canonical
`MigrationImportRegistryHistoryCorruptionControlLineageCheckpointV1` must cover
every episode ordinal/scope/fence/result, lifetime-work budget, physical-
capacity ledger, audit/outbox position and the exact original/remaining
reservation.

Canonical
`MigrationImportRegistryHistoryCorruptionControlLineageReleaseActionV1` is
BeginRelease, ReplanCustodyRelease, AbandonCustodyRelease,
QuarantineUnknownTransfer, MigrateDistrustedEvaluatorReservation or
CommitCustodyRelease.
`MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationV1`
binds exactly one action, lineage/disposition/fence/checkpoint, release-plan
generation/head, commit-attempt identity/version, settlement heads, complete
ordinary-leg and linked-workspace bundle digest, current retention/
classification/legal-hold generations, custody evidence/quorum/SoD, trusted-
time window, reason, nonce and stable idempotency; QuarantineUnknownTransfer
also binds the exact observation/quarantine member/namespace fence, while
MigrateDistrustedEvaluatorReservation binds old/new evaluator artifacts,
reservation charge floor and distrust epoch. Its canonical
`MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationStateV1`
is Absent, RevokedBeforeAdmission, Issued, Consumed, ExpiredUnused or
RevokedUnused.
`AdmitMigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorization`
returns
`MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationAdmissionResultV1`
and
`ExpireMigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorization`
returns
`MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationExpiryResultV1`;
issuer-side
`RevokeMigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorization`
allocates the next target/action-scoped non-wrapping sequence and returns signed
`MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationRevocationIntentResultV1`
or
`MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationRevocationIntentConflict`.
The issuer transaction binds the exact authorization/action/lineage/checkpoint/
bundle digest, sequence, issuer/key continuity, time window, reason, nonce and
revocation idempotency, stores intent/result/audit/outbox atomically, and has no
destination mutation capability. Exact retry returns the same signed intent;
changed material conflicts.
`MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationRevocationIntentV1`
with target/action-scoped non-wrapping
`MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationRevocationSequenceKeyV1`,
is the only issuer-created revocation input. The Admit and Expire commands
named above, together with
`ApplyMigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationRevocation`
are the only commands that may mutate the destination authorization state.
Canonical
`MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationOutcomeV1`
returns admitted, expired, revoked or the stored BeginRelease,
ReplanCustodyRelease, AbandonCustodyRelease, QuarantineUnknownTransfer,
MigrateDistrustedEvaluatorReservation or CommitCustodyRelease result,
while
`MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationOperationConflictV1`
wraps only changed authorization, revocation or action material. Inbox,
tombstone and result are canonical
`MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationRevocationInboxV1`,
`MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationRevocationTombstoneV1`
and
`MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationRevocationResultV1`;
they, audit and outbox commit with the destination state. CAS
losers reread/reapply the six-state first-terminal table; exact operations join
and changed action/checkpoint/bundle/policy/custody/sequence/idempotency
conflicts. Custody approval evidence cannot invoke release without this grant.

Permanent-retention, lineage-release, deficit-remediation execution, retained-
unknown-resolution and deficit-remediation finalization authorization families
all instantiate this exact
destination operation table. Their typed no-write absent outcomes are
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspacePermanentRetentionAuthorizationNotAdmitted`,
`MigrationImportRegistryHistoryCorruptionControlLineageReleaseAuthorizationNotAdmitted`,
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationAuthorizationNotAdmitted`,
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityUnknownTransferResolutionAuthorizationNotAdmitted`
and
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyCapacityDeficitRemediationFinalizationAuthorizationNotAdmitted`.
“Consumption” means PermanentlyRetain for the first family and the exact
BeginRelease, ReplanCustodyRelease, AbandonCustodyRelease,
QuarantineUnknownTransfer, MigrateDistrustedEvaluatorReservation, or
CommitCustodyRelease command for the second; BeginDeficitRemediation for
ProvisionAdditionalCapacity, VerifyDeletion, MigrateToSufficientCapacity or
RetainPermanentlyFenced for the third;
ConfirmPresent, VerifyDeletion or DeclarePermanentlyUnresolvable for the
fourth; and ReleaseAfterVerifiedDeletion or
FinalizePermanentlyFencedRetention for the fifth:

| Current state | Admission | Expiry | Applied issuer revocation | Consumption | Exact replay, stale sequence or changed material |
|---|---|---|---|---|---|
| Absent | Valid unexpired exact grant commits Issued; authentic already-expired admission commits ExpiredUnused | No-write NotAdmitted; absent expiry creates no row, sequence or idempotency state | Valid signed intent commits RevokedBeforeAdmission with inbox/tombstone/result | No-write NotAdmitted; no target mutation | Only admission or applied revocation may create the row; exact CAS losers join and changed material conflicts |
| RevokedBeforeAdmission | Returns stored Revoked; late admission cannot create Issued | Returns stored Revoked | Returns stored Revoked | Returns stored Revoked without action | Exact operations join the revocation; stale/lower or changed target/action/digest/scope/sequence/idempotency conflicts |
| Issued | Returns stored Admitted | At/after exact expiry atomically commits ExpiredUnused | Atomically commits RevokedUnused | Exact action atomically commits Consumed with its matching action-specific result | Expiry, applied revocation and consumption race by one CAS; loser rereads/reapplies; changed material conflicts |
| Consumed | Returns stored consumed action result | Returns stored consumed action result | Returns stored consumed action result without conversion | Returns stored consumed action result; action never repeats | Exact terminal observations join; stale/lower or changed material conflicts |
| ExpiredUnused | Returns stored Expired | Returns stored Expired | Returns stored Expired without conversion | Returns stored Expired without action | Exact observations join expiry; stale/lower or changed material conflicts |
| RevokedUnused | Returns stored Revoked | Returns stored Revoked | Returns stored Revoked | Returns stored Revoked without action | Exact observations join revocation; stale/lower or changed material conflicts |

The issuer-side Revoke command is not the table's revocation transition: it
only allocates and signs an intent. Only destination Apply consumes that intent
and advances the table. A fresh higher valid sequence against an already
terminal exact target returns its stored terminal outcome without conversion;
an exact issuer retry returns the stored signed intent; a stale/lower sequence
or reused identity with different canonical material conflicts. Every adapter
uses this table and the same outcome/conflict wrappers.

Canonical
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleasePlanV1`
has stable lineage identity, monotonic non-wrapping generation, exact
predecessor and CAS-protected
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleasePlanHeadV1`.
Generation 1 is created by Begin and binds the begin result, lineage/checkpoint
version, sorted workspace/fence set, per-leg Delete/Transfer choice, pinned
custody cost-profile generations, reservation identities/initial amounts/
transfer hard maxima, publication/bundle digest and stable plan idempotency.
No caller-supplied “current plan” inference is accepted.

BeginRelease authorization admission cannot spend a lineage budget that Begin
has not created. It instead atomically reserves from bounded
`MigrationImportRegistryHistoryCorruptionControlLineagePreBeginReleaseAdmissionBudgetV1`
through
`MigrationImportRegistryHistoryCorruptionControlLineagePreBeginReleaseAdmissionChargeV1`.
The deployment and tenant pools impose non-wrapping count/row/byte/work/time
ceilings, segregate non-borrowable terminalization/reconciliation capacity and
have no policy/grant path that raises a committed ceiling. The stable charge
binds proposed lineage identity, authorization/action digest, issuer/target,
admission idempotency, original pool/bucket, pessimistic Begin row/work amount
and a unique candidate generation.

Its closed
`MigrationImportRegistryHistoryCorruptionControlLineagePreBeginReleaseAdmissionChargeStateV1`
is Reserved, ActivatedIntoLineageBudget, CleanupPending,
ReleasedAfterNoBeginProof or PermanentlyRetainedWithEvidence.
`ReconcileMigrationImportRegistryHistoryCorruptionControlLineagePreBeginReleaseAdmissionCharge`
returns
`MigrationImportRegistryHistoryCorruptionControlLineagePreBeginReleaseAdmissionChargeReconciliationResultV1`
or
`MigrationImportRegistryHistoryCorruptionControlLineagePreBeginReleaseAdmissionChargeReconciliationConflict`.
Exact admission retry/CAS loss joins the same charge. Competing grants for one
proposed lineage have distinct candidate generations and are all bounded; only
the exact winning Issued grant can activate. Canonical
`MigrationImportRegistryHistoryCorruptionControlLineagePreBeginReleaseAdmissionCandidateWinnerMappingV1`
binds proposed lineage, winning candidate generation/charge/authorization,
activated plan head/budget and activation settlement identity. Expiry or applied revocation
moves a non-winning candidate to CleanupPending, never directly to released.
Cleanup proof is candidate-scoped: no Begin result, plan, reservation or
external effect may reference the exact losing candidate generation and
charge; the authoritative head is either absent or its winner mapping names a
different candidate; and the losing authorization is terminal. Cleanup CASes
only that candidate's CleanupPending row while rechecking the winner mapping.
Its domain-separated cleanup settlement identity can never equal the winner's
activation/lineage-budget settlement identity. Unknown crash/recovery outcome
retains the charge and protected work until reconciliation proves either that
candidate is the exact Begin winner or permanent no-Begin for that candidate.

Immutable
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleasePlanLineageBudgetV1`
is created with Begin. The same local transaction moves the winning pre-Begin
charge to ActivatedIntoLineageBudget and transfers its original bucket/amount/
settlement identity without refund or double charge into generation 1; plan,
budget, Begin result and activation all commit or none do. It imposes
cumulative non-wrapping ceilings across the
whole lineage for generations, attempts, Replan/Abandon/quarantine/evaluator-
migration grants and operations, authorization fences, canonical/result/audit/
outbox bytes and rows, external transfer attempts and bytes, terminal
reservations/unknown-transfer members, publication receipts/chunks/orphan
collections, retained evaluator dependencies, reconciliation/verification/GC
work, seal attempts/receipts, evaluator reassessments/deficits/remediation,
unknown-member resolution and budget-charge records and conservative time.
Begin reserves the initial plan plus its complete
terminalization allowance; every later operation pessimistically charges its
maximum before creating durable or external work. Policy, issuer, backend,
restart, failover, restore and a new grant cannot reset or increase the
ceiling. Canonical
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleasePlanLineageDispositionV1`
is Active, BudgetExhaustedRetained, CompletedWithoutResidualCustody or
CompletedWithResidualCustody. Command admission is total:

| Lineage-budget disposition | Admitted command classes |
|---|---|
| Active | Normal release, recovery and protected terminalization commands within remaining budget |
| BudgetExhaustedRetained | Protected reconciliation, revocation, quarantine, retained-member resolution, checkpoint and GC only |
| CompletedWithoutResidualCustody | Exact replay and authenticated proof/checkpoint maintenance only |
| CompletedWithResidualCustody | The lineage itself admits only replay/proof maintenance; retained-member resolution, authorization revocation, evidence append, checkpoint and GC execute solely through the transferred residual obligation |

A Replan that cannot fit is
no-write while its old attempt remains PreparingOpen,
PreparingRevalidationRequired or CommitEligible so it
cannot destroy a possible Commit. If the attempt is already Abandoned or
Superseded, the same expected-version transaction may commit
BudgetExhaustedRetained, its permanent authorization fence and
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleasePlanLineageBudgetExhaustedResultV1`
without refund, new transfer or new publication; cleanup of already orphan-
eligible artifacts remains bounded and permitted.

Canonical
`MigrationImportRegistryHistoryCorruptionControlLineageResidualCustodyObligationV1`
is an immutable descriptor for exactly one unknown-transfer member surviving
final Commit. It binds stable child/member/lineage identity, transfer-result
digest, initial budget-descriptor digest and immutable custody/fence provenance.
Its mutable state is structurally separate in versioned
`MigrationImportRegistryHistoryCorruptionControlLineageResidualCustodyObligationStateV1`
with non-wrapping generation, predecessor digest, expected-version CAS and
Active, ConfirmedPresent, DeletionVerified or PermanentlyUnresolvable
disposition. Each child has a non-borrowable immutable ceiling/provenance
descriptor
`MigrationImportRegistryHistoryCorruptionControlLineageResidualCustodyObligationBudgetV1`
and separately versioned
`MigrationImportRegistryHistoryCorruptionControlLineageResidualCustodyObligationBudgetStateV1`
containing its exact remaining precharged resolution/revocation/evidence/
checkpoint/GC allowance. Canonical immutable
`MigrationImportRegistryHistoryCorruptionControlLineageResidualCustodyObligationSettlementV1`
binds the one child transition/result/checkpoint and exact budget debit. A child
cannot consume, close, settle or release another child's slice.
`MigrationImportRegistryHistoryCorruptionControlLineageResidualCustodyObligationTransferResultV1`
binds the member/EffectiveCharge, deficit settlement, namespace fence,
quarantine and resolution-authorization history, capacity provenance, original
lineage/plan/budget checkpoint and child budget.

Canonical
`MigrationImportRegistryHistoryCorruptionControlLineageResidualCustodyMembershipCommitmentV1`
binds the exact canonically sorted obligation IDs plus immutable obligation-
descriptor and transfer-result digests and their Merkle root. Mutable state,
remaining counters and budget-state bytes are excluded by schema and domain,
not by an undocumented digest convention, so the membership root never changes
when a child resolves.
`MigrationImportRegistryHistoryCorruptionControlLineageResidualCustodyAggregateBudgetV1`
is the immutable checked sum of initial child budget descriptors plus non-
borrowable aggregate checkpoint/GC terminalization capacity and original
lineage-budget provenance. Versioned
`MigrationImportRegistryHistoryCorruptionControlLineageResidualCustodyAggregateStateV1`
holds remaining-member/checkpoint counters, remaining aggregate allowance,
predecessor digest and non-wrapping generation under expected-version CAS.
Canonical
`MigrationImportRegistryHistoryCorruptionControlLineageResidualCustodyStateHeadV1`
is the cumulative anti-rollback head. It binds a non-wrapping sequence and
predecessor digest, routing generation, immutable membership-root digest, a
canonical root over every child state version/digest and budget-state version/
digest, latest settlement/checkpoint digest per child, aggregate-reference
tag/version/digest, encoding epoch, integrity-key epoch and the latest
authenticated external high-watermark. Canonical signed
`MigrationImportRegistryHistoryCorruptionControlLineageResidualCustodyStateCheckpointV1`
binds that complete head and is published to the configured independent
anti-rollback anchor before covered hot predecessor rows may compact. Restore
requires a continuous local chain at or beyond the greatest authenticated
external high-watermark; missing anchor history, deletion, fork or coordinated
child/aggregate/head rollback makes the residual owner unready without
inventing state.

Child terminalization locks routing head→residual state head→aggregate budget/
state→child descriptor/state→child budget/state→authorization/result, then atomically
writes the child state and settlement, debits only that child, advances the
aggregate state/counters, advances the cumulative state head and records its
checkpoint. Concurrent siblings
serialize on the aggregate state and cannot lose or duplicate a decrement.
Aggregate capacity settles only after all children are terminal and
checkpointed. Mixed child outcomes are ordinary and never imply sibling
mutation.

Canonical
`MigrationImportRegistryHistoryCorruptionControlLineageResidualCustodyRoutingHeadV1`
has LineageOwned or ResidualOwned, a non-wrapping generation and the exact
lineage, plan-head, lineage-budget and stable owner/idempotency identity plus
the residual membership root, residual-state-head generation and canonical
`MigrationImportRegistryHistoryCorruptionControlLineageResidualCustodyAggregateReferenceV1`.
That reference is a closed tagged union: NoneCanonicalEmpty or
SomeAggregate with exact aggregate-budget/state generation and digests. Row
absence never supplies either tag. Absence is never
LineageOwned. The exact winning
`BeginMigrationImportRegistryHistoryCorruptionControlLineageRelease`
transaction creates routing generation 1 as LineageOwned with its new plan
head/lineage budget, canonical-empty residual root, aggregate reference
NoneCanonicalEmpty and residual-state-head generation 1 over the empty child
set/None tag. It creates no aggregate row. Missing, duplicate or
pre-existing inconsistent genesis makes Begin no-write. Replan preserves this
head and expected-version checks it without changing owner or resetting
generation. Final Commit is the only command that CASes
LineageOwned→ResidualOwned in the same transaction as every child creation,
budget transfer, membership commitment and completed disposition. Admit,
Expire, destination revocation Apply, Resolve, evidence append, checkpoint and
GC lock/read the routing head first: before the CAS they charge/mutate the
lineage owner; afterward they charge/mutate the exact child/aggregate residual
owner. CAS losers reread and reroute without duplicating authorization rows,
inboxes, charges or results. Issuer-side intents remain evidence-only and never
select an owner. Missing, duplicated, rolled-back, inferred or identity-mismatched
routing genesis refuses readiness and restore.

Final Commit atomically transfers every surviving terminal quarantined member
and its remaining protected capacity into its own independently restorable
residual obligation, commits the exact sorted obligation set/root and aggregate
budget/state plus the next residual state head, and advances the routing head
before selecting CompletedWithResidualCustody. With no survivor it creates no
aggregate rows: in the same transaction it advances the state head over the
empty child root/NoneCanonicalEmpty reference and routing to ResidualOwned,
then selects CompletedWithoutResidualCustody. Thus zero-member state is an
explicit tag and authenticated head, never inferred from absent rows. After transfer, unknown-
member resolution and its authorization revocation charge only that child's
residual slice plus named aggregate work; plan-history compaction cannot delete
the routing generation, membership/transfer results or any authorization/
deficit/fence/provenance needed to restore each obligation.

Every destination-local admission after Begin atomically creates or
joins
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleasePlanLineageBudgetChargeV1`.
Its stable settlement identity binds lineage/budget generation, exact command/
action/idempotency, original counter bucket, pessimistic row/byte/work/time/
external-effect amount, protected Recovery or ordinary class, reservation,
terminal disposition and checkpoint/archive membership. Closed charge state is
Reserved, Consumed, SettledAfterCheckpoint or
PermanentlyRetainedWithEvidence; timeout and cancellation are not settlement.

Budget charge and command state share one local transaction for release-
authorization admission and destination revocation inbox/apply; Stage and
Verify; reservation extension and reconciliation; seal/seal reconciliation;
evaluator reassessment/migration and deficit remediation; unknown quarantine/
resolution while the lineage is Active/BudgetExhaustedRetained; MarkEligible,
Abandon and Replan; and orphan admission/GC. After
CompletedWithResidualCustody, resolution/revocation/evidence/checkpoint/GC
charges only the transferred residual budget. Issuer-
only intent creation has no destination budget capability; destination Admit
or Apply charges before creating its row. Exact retry or CAS-loser join returns
the stored charge/result and allocates no second amount. Changed material
conflicts without another charge. Each charge settles only when its named
terminal result and authenticated plan-lineage checkpoint/archive membership
commit; compaction preserves original bucket, amount and disposition.
Non-borrowable Recovery charge capacity was reserved by Begin/Replan so
ordinary admissions or tenant exhaustion cannot block seal reconciliation,
deficit fencing, authorization revocation, quarantine, orphan cleanup,
checkpoint or terminal result.
BeginRelease admission is the sole exception: it charges the pre-Begin pool
above, and Begin atomically imports that unchanged reservation into the new
lineage budget before any plan/reservation or external work becomes visible.

Old plan generations may compact only after authenticated
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleasePlanLineageCheckpointV1`
and the shared verified archive cover every exact plan/attempt/grant/fence/
reservation/member/receipt/extension/migration/result identity, cumulative
counter and predecessor link. Hot or archived lookup must still return exact
replay/conflict and anti-reuse proof; dense inference, deletion without
coverage, counter rollback and generation/reservation/transfer identity reuse
are forbidden.

Canonical
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseRemediationAttemptSetHeadV1`
is the non-wrapping predecessor-linked current head for every effectful deficit-
remediation attempt under the release lineage. Canonical
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseRemediationAttemptSetCommitmentV1`
binds the exact canonically sorted complete attempt IDs and state digests,
effect/request IDs, broker capability/redemption disposition, provider target
and conformance profile/result, reconciliation obligation/budget and execution/
finalization destination-applied authorization history. Issuer-side revocation
intent creation remains evidence-only until destination Apply imports it.
Empty is an explicit canonical root, never absence. Missing, forked,
rolled-back or partially enumerated attempt state is conservative nonterminal.

The following writer set is closed. No command outside these classes may
mutate a field covered by the attempt-set commitment:

| Writer class | Covered mutation | Atomic attempt-set obligation |
| --- | --- | --- |
| Execution/finalization authorization | Admit, Expire, destination ApplyRevocation and action consumption | Commit destination authorization state/result and the successor attempt-set head together; issuer intent creation alone is not a destination mutation |
| Effect admission | BeginDeficitRemediation and capability creation | Commit attempt, capability, consumed execution authority and successor head together |
| Effect dispatch | DispatchDeficitRemediation, capability redemption and unique transmission claim | Commit redemption/claim, EffectDispatched and successor head before provider traffic |
| Effect reconciliation | provider query/evidence admission and CompleteDeficitRemediation | Commit evidence, reconciliation/finalization state, terminal attempt result and successor head together |
| Capability lifecycle | terminalization, expiry, revocation and cleanup not already owned above | Commit capability disposition, proof/result and successor head together |
| Attempt history lifecycle | checkpoint, compaction and archival replacement | Commit authenticated coverage/replacement evidence and successor head together; deletion alone is forbidden |

Every mutating command in the table creates immutable
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseRemediationAttemptSetMutationV1`
binding writer class/command/idempotency, predecessor and successor head
versions/digests, the canonically sorted changed row identities and old/new
digests, authorization/evidence/result identities and any eligibility
invalidation. Exact read-only replay returns the stored mutation/result and
does not advance again. The canonical order for every writer is
routing head→residual state head→remediation-attempt-set head→plan-bound
commit-attempt disposition→canonical-ID-sorted remediation attempt→capability/
provider evidence/authorization/reconciliation/checkpoint rows→result/audit/
outbox. A writer may omit unrelated rows but may never reverse the common
subsequence. Attempt mutation, covered auxiliary mutation, mutation record and
attempt-set-head advancement are one local transaction. Thus the narrower
routing-head→attempt order is never valid for Dispatch or another writer.

Each plan owns one
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitAttemptV1`
whose closed
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitEligibilityDispositionV1`
is a canonical tagged union:

- PreparingOpen;
- PreparingRevalidationRequired carrying mandatory invalidation ID, invalidated
  attempt-set root and required successor attempt-set root;
- CommitEligible;
- Superseded;
- Abandoned; or
- Consumed.

The durable disposition set contains all six states; missing/unknown tag or
missing payload is corruption, not PreparingOpen or abandonment. Begin/Replan
creates PreparingOpen. Export, import, RPC projection and restore preserve the
exact discriminant and mandatory payload; omission, truncation or inconsistent
invalidation/fence cross-proof makes the attempt unready and never selects a
fallback variant. Only
`MarkMigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitEligible`
may move PreparingOpen or PreparingRevalidationRequired→CommitEligible after
binding and rechecking the exact
lineage/begin result/version, current plan head/generation, bundle, Verified
publication receipt/state/version, final disposition receipts, pinned cost
profiles/evaluator artifact digests/readiness/distrust epochs and reservation
versions, plus every exact Sealed transfer state/receipt/mutation/fence version
and zero uncovered capacity deficit. It first locks the remediation-attempt-set
head and binds its exact complete commitment root. ExecutionAdmitted,
EffectDispatched or ExternalOutcomeUnknown, any live/redeemable broker
capability, or any uncheckpointed provider/reconciliation obligation is
nonterminal and makes MarkEligible no-write. Only
FailedDefinitelyNoEffect with either the atomic broker no-redemption/no-traffic
result or authenticated provider no-effect evidence, or
CompletedMappedContinuation with complete finalization/checkpoint history may
appear in the bound set. A preparing state→CommitEligible transition is itself
the admission fence:
all later Begin/Dispatch commands recheck the commit-attempt disposition and
refuse; exact terminal replay remains read-only.

Any later covered mutation other than exact read-only replay must still run,
including restrictive revocation, provider evidence, reconciliation,
checkpoint, compaction and archival work. When the plan-bound disposition is
CommitEligible, that writer atomically changes it to
PreparingRevalidationRequired with the exact invalidation ID, old bound root
and required successor root in the authoritative attempt row, advances the
attempt-set head and writes immutable
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitEligibilityInvalidationV1`
binding the old eligibility result/root, successor mutation/root, reason and
writer result plus durable
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitEligibilityRevalidationFenceV1`.
Authorization behavior is derived from the typed attempt state itself:
PreparingOpen alone admits new Begin/Dispatch and Stage/Verify, while
PreparingRevalidationRequired refuses them and permits exact receipt replay
plus restrictive writers and full MarkEligible revalidation. The revalidation
fence remains integrity evidence, not the authorization switch. A missing,
unjoined or corrupt invalidation/fence therefore cannot make the authoritative
tag decode as PreparingOpen; it makes the node/attempt unready. MarkEligible is
the only eligibility recovery: for PreparingRevalidationRequired it
authenticates the mandatory invalidation/fence, proves the current head equals
required_successor_root, repeats the complete original validation against that
root and may create a new CommitEligible result/version.
Final Commit and every writer serialize on the same rank; either Commit
consumes the unchanged eligible root first, or the writer invalidates it first
and Commit returns no-write until revalidation. Revocation and restrictive
policy processing are never delayed merely to preserve eligibility. Missing,
partial or unbound invalidation is corruption and cannot be treated as
PreparingOpen.

A positive covered deficit additionally
requires exact EffectiveCharge, PendingCommit DeficitSettlement and the
ResumableCommit remediation result. SealPending, a mismatched root/size/
ETag/version, a distrusted or unavailable evaluator or any uncovered deficit
denies eligibility. It returns
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitEligibilityResultV1`
or
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitEligibilityConflict`.
Missing, expired or currently revoked Commit authorization changes neither
preparing variant nor CommitEligible and never proves permanent commit
ineligibility.

`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitAuthorizationFenceV1`
binds attempt, plan generation/head, begin result, lineage version, bundle and
non-wrapping fence sequence. Commit checks it after the attempt row. Replan or
independently authorized Abandon atomically installs the fence and prevents
every current or future Commit grant bound to that old attempt from consumption;
grant expiry/revocation alone cannot install it.

Only
`ReplanMigrationImportRegistryHistoryCorruptionControlLineageCustodyRelease`
with
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseReplanPayloadV1`
and an exact Issued ReplanCustodyRelease grant may advance the plan head while
the lineage remains ReleasePending. It requires every old external transfer
outcome terminal: each reservation is already
ReleasedDefinitelyNeverTransferred, ReleasedAfterDestinationDeletion,
ConvertedToQuarantinedUnknownTransferMember or ConsumedByCustodyMember, with
the latter impossible for an unconsumed attempt;
no Unknown/Present/TransferPending outcome may pass. It also proves no old
Commit winner.

Canonical
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseReplanPreflightV1`
is derived by trusted code for the exact predecessor and proposed bundle. It
proves both the replacement transaction and its future final Commit fit the
selected backend's current atomic row/byte/lock/read/write/index/output/work/
time limits. Its aggregate accounting includes the complete new bundle and
capacity reservation plus all retained old plans, attempts, grants, fences,
terminal reservations/unknown-transfer members, receipts/chunks, evaluator
artifacts/dependencies/migrations/reassessments/deficits, seal attempts/
receipts, unknown-member resolution, budget-charge records, reconciliation,
verification and orphan-GC obligations under the lineage budget. Unknown,
stale, overflowing,
individually-only or unsupported proof is no-write.

Replan/final Commit use the complete combined rank: residual-custody routing
head→residual-custody state head→remediation-attempt-set head→authoritative
archive head→plan head→commit-attempt disposition→canonical-ID-sorted
remediation attempts→capability/provider-evidence/authorization/reconciliation/
checkpoint rows→publication receipt state→settlement journal head→
sorted custody-profile heads/evaluator distrust state→sorted custody ledgers→
sorted reservations/dependencies/external-transfer seal/deficit/unknown-
resolution/residual-obligation rows→Recovery parent ledger→current campaign
slot→sorted old campaign fences→control reserve→history obligation→corruption
fence→lineage→checkpoint→release authorization→lineage disposition→retention/
legal-hold/custody authority→budget/preflight/result/audit/outbox. In one
transaction it consumes the Replan grant and fresh preflight capacity
reservation, CASes an
active old attempt PreparingOpen/PreparingRevalidationRequired/
CommitEligible→Superseded or retains an already
Abandoned terminal, installs the old-attempt authorization fence, advances the
plan generation/head and bundle digest, creates the replacement PreparingOpen
attempt and all replacement TransferPending reservations, and writes
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseReplanResultV1`,
audit and outbox. No plan head becomes current unless its complete future
Commit allowance and retained-history/cleanup capacity are already reserved.
Reused old transfer/reservation IDs and recreation or second
release of any terminal reservation are forbidden by unique generation-bound
identities. Exact retry returns the stored result; changed predecessor,
lineage/begin version, old terminal evidence, new plan/profile/reservation,
bundle or idempotency returns
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseReplanConflict`.
Every old Commit grant and publication receipt is invalid for the new plan by
the fenced attempt/generation/bundle binding; the receipt becomes orphan-
admissible only through the disposition protocol below.

Only
`AbandonMigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitAttempt`
with
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitAttemptAbandonPayloadV1`
and an exact Issued AbandonCustodyRelease grant may move PreparingOpen,
PreparingRevalidationRequired or CommitEligible→Abandoned. It atomically
consumes the grant, installs the same
authorization fence and stores
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitAttemptAbandonResultV1`,
audit and outbox, or returns
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitAttemptAbandonConflict`.
Abandon does not refund a transfer reservation or reverse a Begin effect; it
only makes the attempt terminally commit-ineligible and enables later Replan
after all old external outcomes terminalize. Full AbortLineageRelease is not
selected because Begin may already have released control capacity or admitted
external effects that cannot be transactionally reversed without compensation.

Only
`BeginMigrationImportRegistryHistoryCorruptionControlLineageRelease` with
`MigrationImportRegistryHistoryCorruptionControlLineageReleaseBeginPayloadV1`
may move an
eligible Active, PermanentlyQuarantined or Rebuilt lineage to custody-safe
ReleasePending after locking and proving retention/classification/legal-hold
policy, terminal history disposition, no possible future history operation/
corruption episode, and a complete checkpoint. That checkpoint also binds the
complete bounded set of linked Quarantined/PermanentlyRetained migration
workspaces, each immutable OriginalTotal, Released value, remaining-leg root,
parent member, closed Delete/Transfer disposition plan, selected custody cost-
profile digest, destination ledger/version and derived maximum reservation.
An omitted, unbounded, incomparable or unproved linked workspace/plan makes the
transition no-write. It retires the
remaining lifetime-work ceiling without changing WorkSpent. This begin
transaction consumes an exact Issued BeginRelease authorization; the later
whole-member transaction separately consumes an exact Issued
CommitCustodyRelease authorization bound to the stored begin result.
The begin payload binds that authorization, expected lineage/version/
disposition, lineage checkpoint, exact Reserved pre-Begin admission charge/
candidate generation/original bucket, expected absent plan head, generation 1,
current settlement heads, sorted workspace/
fence set, every per-leg disposition plan/cost profile/custody-ledger expected
version/initial maximum/transfer hard maximum and bundle digest. In that same
local transaction Begin CASes the pre-Begin charge Reserved→
ActivatedIntoLineageBudget, CAS-creates the exact candidate winner mapping,
creates the immutable lineage budget with the transferred original amount/
settlement identity, charges the balance of the
preflighted Begin allowance, and atomically creates every required
CustodyCapacityReservationV1 and moves the
conservatively calculated maxima from custody Available to TransferPending;
none exists before the Begin result and no external transfer is authorized by
a losing or uncommitted attempt. It also creates plan generation 1, makes it
the plan head, creates its PreparingOpen commit attempt and CAS-creates residual-
custody routing generation 1 as LineageOwned with that exact lineage/plan head/
lineage budget, stable owner/idempotency, canonical-empty residual root,
aggregate reference NoneCanonicalEmpty and residual-state-head generation 1
over the empty set/None tag. It also creates remediation-attempt-set head
generation 1 with the canonical-empty attempt commitment. No aggregate row is
created. Absence is a creation precondition, never an implicit owner, aggregate
or attempt-set state. The stored result binds that exact plan head/generation/
attempt/routing/state-head/attempt-set genesis and complete sorted reservation
set. It
returns canonical
`MigrationImportRegistryHistoryCorruptionControlLineageReleaseBeginResultV1`
or
`MigrationImportRegistryHistoryCorruptionControlLineageReleaseBeginConflict`.
Exact retry returns the stored begin result, winner mapping, budget activation and reservation
set; changed authorization, pre-Begin charge/candidate/bucket, expected
version, checkpoint, heads, disposition plan, profile, ledger version, maximum,
bundle or idempotency conflicts without mutation. A crash cannot expose a plan
without the activation or consume the pre-Begin charge without the plan/result.
`ReleaseMigrationImportRegistryHistoryCorruptionControlLineage` is retained
only as a non-dispatchable command-family identifier for catalog continuity;
no API, worker or adapter may invoke it as a generic mutation.
`MigrationImportRegistryHistoryCorruptionControlReserveSettlementV1` settles
each physical-capacity leg exactly once; it never mutates the lifetime-work
budget. It is a domain-separated
instantiation of the existing unified authenticated settlement
journal/archive protocol, not a standalone decrement. Stable settlement and
per-leg identities bind the original reservation, physical dimension, source
bucket, exact quantity, release/checkpoint/custody trigger, archive/deletion
evidence and result.

Immutable profile-bound
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseBundleHardMaximumV1`
bounds the complete final transaction across ordinary reserve legs and every
linked workspace: workspace/fence/leg/row count, canonical bytes, distinct
locks, disposition plans/receipts, custody cost profiles, capacity ledgers,
pending reservations, members and reconciliation/orphan-cleanup obligations,
reads, writes, index effects, audit/outbox/result bytes, decode/hash/
verification work and backend execution time. Workspace retention consumes
lineage-scoped non-borrowable bundle units before it can enter
PermanentlyRetained. Before ReleasePending, one checked aggregate preflight
authenticates the complete sorted workspace/fence set and proves the bundle
fits both this profile and the selected backend's atomic transaction limits;
insufficient, unknown or overflowing capacity leaves the predecessor
authoritative and consumes no release authorization. Per-workspace bounds alone
are not accepted as proof of aggregate fit.

The local, non-wrapping
`MigrationImportRegistryHistoryCorruptionControlReserveSettlementJournalHeadV1`
binds predecessor/sequence, the canonical ordered settlement-row set,
transaction/result/audit identity and owner continuity; it never claims archive
availability. The begin-release local transaction follows
`MigrationImportRegistryHistoryLockRankV1`: residual-custody routing-head
genesis key, residual-state-head genesis key, remediation-attempt-set-head
genesis key, archive-replay head when applicable,
custody-release plan head, commit-attempt disposition, archive-publication
receipt state, settlement-journal head, every custody-cost-
profile head and archive/legal-hold custody-capacity ledger in ascending
canonical ID order, their reservation rows in ascending transfer-ID order,
Recovery parent-capacity ledger, the current parent/selector active-campaign
slot for serialization, every linked old campaign's stable Closed fence in
ascending canonical campaign-ID byte order, control
reserve, history obligation, corruption fence, control lineage, lineage
checkpoint, release authorization, lineage disposition, retention/legal-hold/
custody authority and terminal audit/result/outbox rows. The final release
transaction uses this identical combined rank; no linked workspace is acquired
after a later-ranked lineage/custody object, and duplicate campaign IDs acquire
one fence once. The begin transaction rechecks terminal obligation, fence
state, bundle maximum and parent equation. It atomically consumes the
BeginRelease authorization and moves
eligible ReservedUnoccupied units to Released while removing their exact child
encumbrance and crediting ParentAvailable under the parent/child transfer ID,
moves Occupied units to ReclaimPending without a parent credit, appends
immutable transfer/per-leg settlement rows, advances the journal head, marks
ReleasePending, and writes the canonical
pending `MigrationImportRegistryHistoryCorruptionControlLineageReleaseBeginResultV1`,
audit and outbox. A split ledger transfer, settlement append, journal advance,
parent credit, checkpoint, authorization consumption or lineage transition is
unrepresentable.

Authenticated sparse checkpoint/archive publication first admits one immutable
non-authoritative Staged intent; only its returned upload instruction may
upload immutable chunks, after which Verify authenticates visibility against
the same
`MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationReceiptV1`.
Canonical
`MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationStateV1`
is Staged, Verified, ConsumedByCommit, OrphanGcEligible or Collected. The
receipt binds publication identity, exact lineage/begin result/version, plan
head/generation/commit attempt, immutable object/chunk roots, proposed
successor archive head and predecessor, covered journal head, exact captured
hot rows/versions, deletion preconditions, bundle digest, verification key/
profile, proposed publisher/storage-adapter parameters and stable operation
idempotencies. Mutable lifecycle state and immutable receipt content are
separate rows. Upload evidence is canonically absent in Staged and is bound
only by the immutable Verify result; it never rewrites proposed receipt bytes.

Only the following typed commands own publication lifecycle transitions:

- `StageMigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublication`
  locks/rechecks the current plan head and requires its authoritative attempt
  tag to be PreparingOpen before any upload instruction or lifecycle-budget
  allocation, then creates a Staged
  publication intent binding proposed immutable roots/chunks with
  `MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationStageResultV1`
  or
  `MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationStageConflict`;
- `VerifyMigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublication`
  rechecks that same still-current PreparingOpen tag, authenticates durable
  chunk/root/key visibility and moves
  Staged→Verified
  with
  `MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationVerifyResultV1`
  or
  `MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationVerifyConflict`;
- `MarkMigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationOrphan`
  may move only Staged→OrphanGcEligible or Verified→OrphanGcEligible with
`MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationMarkOrphanResultV1`
  or
  `MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationMarkOrphanConflict`;
- `FinalizeMigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationGc`
  may move only OrphanGcEligible→Collected after authenticated exact chunk
  deletion with
  `MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationGcResultV1`
  or
  `MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationGcConflict`.

`MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationBudgetV1`
precharges bounded receipt/chunk-reference rows and bytes, upload/verification
work, state/result/audit/outbox writes, reconciliation attempts and orphan GC
storage/work before Stage. Unknown upload, verification or deletion outcome
retains the current state and its capacity. Each command commits state, stored
result, audit and outbox atomically; exact retry returns the stored result,
while changed receipt/root/head/coverage/key/budget/idempotency conflicts.
Stage or Verify against Superseded, Abandoned, Consumed, a non-current plan or
any missing attempt returns typed no-write
`MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchivePublicationAttemptClosed`
without upload instruction, verification, row/chunk allocation or budget
charge. Existing Staged/Verified receipts of a newly closed attempt remain
retained and may follow only bounded MarkOrphan/FinalizeGc.

Stage, Verify, MarkCommitEligible, Replan, Abandon, Commit and MarkOrphan use
the shared authoritative archive head when applicable, then always lock plan
head→commit-attempt disposition→receipt state in that order before their
state-specific CAS. MarkOrphan requires the
receipt's exact attempt to be Superseded or Abandoned, rechecks that no
committed head references any chunk and retention/key policy permits collection,
then CASes Staged/Verified→OrphanGcEligible. PreparingOpen,
PreparingRevalidationRequired or CommitEligible is never orphan-admissible:
no absent, expired or revoked Commit grant and no temporary lack of an operator
proves permanent ineligibility. Commit atomically
CASes only CommitEligible→Consumed and Verified→ConsumedByCommit with
archive-head installation and hot-row deletion. The shared attempt-row CAS
excludes Commit from Abandon/Replan and the receipt-state CAS excludes Commit
from MarkOrphan: Commit rejects both preparing variants, Superseded, Abandoned
and Consumed
attempts plus Staged, OrphanGcEligible and Collected receipts; MarkOrphan
rejects both preparing variants, CommitEligible and Consumed attempts; orphan
GC cannot touch
ConsumedByCommit chunks. Missing attempt state is corruption. FinalizeGc
re-locks head, plan head, attempt and receipt, rechecks terminal ineligibility
and non-reference, and records Collected only after authenticated deletion;
unknown GC keeps OrphanGcEligible. ConsumedByCommit and Collected are
irreversible.

Replay/admission readers ignore Staged, Verified, OrphanGcEligible and
Collected receipts; only the authoritative
`MigrationImportRegistryHistoryCorruptionControlReserveSettlementArchiveReplayHeadV1`
installed by Commit is replay authority. Publishers/storage adapters are
evidence-only. They may invoke Stage/Verify through their constrained ports,
but cannot write lifecycle rows directly, advance the authoritative archive
replay head, delete authoritative hot rows, consume release authority, credit
capacity or mutate lineage/workspace terminal state. Orphan garbage collection
is never replay authority.

Only
`CommitMigrationImportRegistryHistoryCorruptionControlLineageCustodyRelease`
with
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitPayloadV1`
may move ReleasePending→Released. The payload binds the stored begin result,
current plan head/generation, exact CommitEligible attempt identity/version,
absence of its authorization fence, Verified publication receipt and expected
state/version, expected authoritative
predecessor archive head, proposed successor archive head, expected journal
head, bundle digest and hard-maximum proof, current Issued
CommitCustodyRelease authorization bound to that attempt/plan/bundle, expected
lineage version/disposition, the
exact remediation-attempt-set head/version and canonical complete commitment
root proving every attempt/capability/effect/reconciliation obligation
terminal, the
complete sorted sets of per-workspace physical-disposition receipts, cost
profiles, evaluator-migration/reassessment/deficit-remediation heads,
EffectiveCharge/DeficitSettlement heads, exact Sealed transfer receipts/fences
and TransferPending base plus covered-deficit encumbrances, the complete sorted
terminal residual-member candidates with their remaining protected budgets/
authority/fence/provenance, proposed per-member obligation IDs and immutable
descriptor/transfer-result digests, membership root, aggregate
reference/budget/state generations, proposed residual-state-head root/
predecessor/generation and expected LineageOwned routing head/
generation plus With/WithoutResidual disposition, and stable idempotency. Under the
identical combined rank, the command reauthenticates publication/membership/
deletion evidence and every physical-disposition receipt/reservation/profile,
rechecks the unchanged complete attempt-set root and refuses any
ExecutionAdmitted/EffectDispatched/ExternalOutcomeUnknown or live capability/
reconciliation obligation, then rechecks every bound version, pinned evaluator artifact/readiness/distrust
epoch and current retention/legal-hold/custody
condition, and then in one local expected-version transaction CASes the attempt
CommitEligible→Consumed and publication Verified→ConsumedByCommit, installs
the proposed authoritative archive replay
head and deletes only the exact captured hot rows/versions. That same
indivisible transaction consumes the authorization once, consumes each
terminal disposition receipt, converts every selected TransferPending base and
covered deficit into one conservatively recomputed EffectiveCharge archive/
legal-hold custody member, CASes its DeficitSettlement to
ConvertedIntoCustodyMember, returns only proved base surplus and leaves no
emergency-deficit pending unit before its matching source-parent credit, moves matching
ReclaimPending units to Released, removes the exact child encumbrance, credits
ParentAvailable, appends immutable parent/child and final settlement rows,
advances the journal, and invokes each checkpoint-bound
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceCustodyReleaseSettlementV1`.
For each linked workspace this is one all-or-none whole-member transaction
component: every remaining complete leg becomes a domain-separated custody-
release disposition tombstone only after AuthenticatedDeleted or a matching
TransferredToCustodyLedger reservation-to-member conversion,
WorkspaceReleased becomes WorkspaceOriginalTotal, the exact workspace parent
member is removed and
ParentAvailable receives the identical single credit, the workspace becomes
CustodyReleased, and its custody-release checkpoint/result/audit/outbox
commits. An unresolved TransferPending/physical Unknown keeps the workspace
PermanentlyRetained or Quarantined and makes the whole commit no-write. A
terminal quarantined unknown-member is different: Commit may proceed only by
atomically transferring that member, its EffectiveCharge/DeficitSettlement,
namespace fence, authorization history and remaining protected work into the
member-scoped ResidualCustodyObligation set above; it returns no capacity. The generic lineage
settlement never duplicates that workspace credit. The lineage becomes
Released only when every linked workspace and ordinary control-reserve leg is
settled or transferred into that member-scoped residual-obligation set in this same final ranked
transaction, which then commits the final lineage release result,
canonical
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitResultV1`,
each residual transfer result when present, membership commitment/aggregate
reference/budget/state, residual-state-head advance/checkpoint obligation, the
routing-head CAS, exact completed disposition, audit and outbox;
otherwise all affected predecessor members remain
encumbered and ReleasePending remains resumable. The bounded workspace set and
all terminal writes were precharged before ReleasePending. Hot settlement state
cannot be deleted before verified publication or apart from authoritative-head
installation; head-without-deletion and deletion-without-head are
unrepresentable. Unknown local commit response reconciles the exact commit
identity: either the entire head/delete/authorization/attempt-disposition/settlement/
publication-state/base-reservation/deficit-settlement/member/credit/result
bundle exists or the
predecessor head, Verified receipt and all authoritative hot rows and source/
TransferPending base plus emergency/additional-provision deficit encumbrances
remain. The local journal head and staged/verified
receipt never imply authoritative archive availability. Restore selects the
greatest authenticated journal and committed archive heads, proves their
coverage relationship, exact settlement membership, every consumed physical-
disposition receipt, reservation/profile/member conversion and physical/
custody-ledger conservation, and retains ReclaimPending plus every unsettled
deficit encumbrance when
history or deletion proof is missing, forked, rolled back or uncertain.
CompletedWithResidualCustody restores only when every transfer result,
per-member obligation/state/budget-state/settlement, membership root, aggregate
reference/budget/state, continuous residual-state head/checkpoint at or beyond
the external high-watermark, routing head, member, authorization history,
deficit settlement, namespace fence and capacity provenance authenticate
independently of compacted plan rows.
CompletedWithoutResidualCustody restores only with ResidualOwned routing,
canonical-empty membership, explicit NoneCanonicalEmpty aggregate reference,
no aggregate rows and the continuous authenticated empty residual-state head
at or beyond its external high-watermark; absence or a SomeAggregate mismatch
is unready.
Split LineageOwned/ResidualOwned history, a sequence/inbox/authorization row
present under both owners, missing child or aggregate mismatch keeps the
larger member/charge fenced and the node unready. It
also proves ParentTotal = ParentAvailable + the
exact restored active-child and pending-successor encumbrance sets and every
parent/child forward/inverse transfer against settlement membership. Duplicate
membership returns the original release result without another release or
parent credit; unknown non-membership never authorizes settlement.

For each capacity domain restore also proves:
`CustodyTotal = CustodyAvailable + BaseTransferPending +
EmergencyReserveAvailable + CoveredDeficitPending + sum(EffectiveCharge of
permanent/unknown custody members)`. A DeficitSettlement moves one covered
unit from CoveredDeficitPending into exactly one member or, after independently
verified deletion, back to its authenticated origin; it cannot disappear,
remain stranded beside a committed member or be counted in both. Fork,
rollback, missing provenance or arithmetic overflow leaves the tenant/backend
unready with the larger encumbrance retained.

Exact retry of the commit command returns that stored final result. Changed
begin result, plan head/generation, attempt/disposition/fence, publication
receipt, predecessor/successor archive or journal
head, publication state/version, physical-disposition receipt, reservation,
cost profile/custody-ledger version, bundle digest, authorization, expected
lineage version, remediation-attempt-set head/root, residual-state head/root,
aggregate reference, custody evidence or idempotency returns
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseCommitConflict`
without mutation. Missing work/physical transfer records, either conservation
failure, WorkSpent decrease, premature physical release, reset counters,
duplicate or unavailable settlement, either settlement-head rollback,
checkpoint-before-release violation or recreated capacity fails restore/import
and keeps the destination unavailable/fenced.

`ResolveMigrationImportRegistryHistoryRecovery` follows the universal history
order.
It reauthenticates the retained descriptors and exact exhausted predecessor,
rechecks current retention/classification/legal-hold generations and evidence
floor, then consumes the exact action grant. Its closed transition matrix is:

- `RetryAppend` may reach only `Appended` or `ManualRecoveryPending`.
  Retryable interruption retains the consumed attempt and resumes only that
  attempt. Successor exhaustion commits typed
  `MigrationImportRegistryHistorySuccessorBudgetExhausted`, settles that
  successor, retains all recovery material and returns ManualRecoveryPending.
  Another successor requires a fresh RetryAppend authorization and remaining
  cumulative lineage capacity.
- `Waive` may reach only `WaivedFenced` and atomically commits
  `MigrationImportRegistryHistoryWaiverRecordV1`.
- `Abandon` may reach only `AbandonedWithEvidence` and atomically commits
  `MigrationImportRegistryHistoryAbandonmentRecordV1`.

RetryAppend authority can never create either waiver or abandonment terminal,
including on budget exhaustion. Moving from an exhausted retry to abandonment
therefore requires a fresh Abandon authorization. Both terminal records bind
the obligation/descriptors, action authorization and result, retention and
classification policy identity/generation/digest, legal-hold state/epoch,
records/compliance/legal approvals and SoD, required evidence-retention floor,
reason/change/incident authority, audit/outbox and commit-time policy receipt.
An active legal hold categorically rejects Waive or Abandon whenever its
evidence floor or custody effect would weaken the hold; no emergency flag,
retry authority or stale policy receipt overrides that denial.

`MigrationImportRegistryHistoryRecoveryResultV1` has a common authorization,
obligation, descriptor, evidence, audit and outbox envelope plus closed
`MigrationImportRegistryHistoryRecoveryResultPayloadV1`: `RetryAppend` alone
records predecessor/successor budgets, successor ordinal and archive-head or
typed exhaustion outcome; `Waive` alone records the canonical waiver and
custody-policy receipt; `Abandon` alone records the canonical abandonment and
custody-policy receipt. Fields belonging to other variants are canonically
absent. Unknown, mixed, action-inapplicable and noncanonical optional-field
encodings are rejected. Exact response-loss retry joins or returns that result;
changed action, descriptor, budget lineage, authority or idempotency returns
`MigrationImportRegistryHistoryRecoveryConflict` without mutation.
The payload variant tag is the sole result action discriminator. Any result
index column is derived from canonical result bytes, never independently
writable or hashed, and must match on every read or the row is corrupt.

Every terminal obligation is sealed into
`MigrationImportRegistryHistoryAppendCheckpointV1`, which binds its original
descriptor digest, final disposition/result/conflict, archive-head sequence or
canonical absence, budget/cleanup settlement, audit/outbox positions and
predecessor checkpoint. Candidate/history descriptors, staging reservations and
related cleanup cannot be deleted or settled until this checkpoint commits.
Crash after activation but before worker delivery therefore recovers Pending
with its activation-created cumulative lineage. Restore of every Pending or
`ManualRecoveryPending` obligation must recover the exact lineage row; manual
recovery additionally requires retained descriptors, exhausted/successor
budgets, authorization revocation inbox/sequence/tombstone lifecycle, recovery
result and archive-head predecessor before any worker or cleanup runs.
NoHistory/NotRequested remain explicit; cleanup racing append or recovery fails
closed. `WaivedFenced` retains the authenticated waiver and minimum policy
evidence through its canonical waiver record; `AbandonedWithEvidence` retains
its canonical abandonment record plus descriptors/results required by
classification, legal hold and retention policy. Neither terminal can be
decoded as an archive entry or retried under a new identity, and neither record
may be deleted below its commit-time evidence floor.
Archive failure or collision never rolls back, rewrites or makes ambiguous the
already committed domain activation result; operators see activation success
and its separate archive disposition.

Migrating the VIT-INV-062 schema itself never uses a migration candidate.
Cross-backend work reuses the exact independently authorized, budgeted, closed
`MigrationImportCoordinatorBootstrapV1` protocol from `0.29.0`, including the
active coordinator generation/fence, predecessor checkpoint, dormant local
successor verification, canonical result/conflict and response-loss recovery.
Imported source rows cannot seed the successor, and a backend unable to prove
every state, authorization, budget and atomic handoff requirement refuses the
coordinator-schema migration.
Import preserves every
authorization schema field without defaulting and admits the destination only
if it proves the same or stronger no-late-commit mechanism; otherwise imported
topology authority remains fenced and unready. Import calls the shared history
verifier before any worker: every obligation has a non-wrapping
Healthy/Fenced/ClearedAfterRestore fence lineage; candidate/barrier/activation
authorization retain their exact disposition/evidence/policy commitments; the
universal lock order is supported; and every clearance authorization,
revocation/tombstone, clearance-scope authorization generation/lifetime
counters/terminal disposition, proof budget, source-manifest lineage/genesis/
operational-active head/transition-candidate head/authenticated activation
records/transition states/durable publication attempt/completion reserve/
completion checkpoint and release/lease/fence/cursor/per-witness request-receipt identities/
external transition journal/disposition/proposal and active high-watermarks/
proposal-publication and activation receipts/abort tombstones/publication-
profile trust anchor/bootstrap/rotation/lineage/current head/compatibility/
revocation ratchet/checkpoint/external high-watermark and exact activation-bound profile/
policy-transition authorization tombstones, activation-created control lineage/
episode ordinals/hard maxima/capacity-state envelope/lifetime-work budget/
physical-capacity ledger/both conservation equations/kind-specific transfer
identities/nondecreasing WorkSpent and Released/active scope/disposition/
lock-rank version and acquisition proof/checkpoint/reserve settlement/journal
and archive replay heads/exact archive/deletion membership,
anchor-registry genesis and later registry
generation/predecessor/typed high-watermark plus atomic scope-rebinding result,
protected control reserve/profile/platform bound, authenticated collection receipt, durable
attempt/lease/fence/cursor/precharge/result, typed state join and parent rebuild/
bounded proposal/rejection-authorization/successor mapping is complete.
Missing/defaulted fence, scope, source-manifest head/activation/checkpoint/
external-journal/proposal-or-active-high-watermark/publication-attempt/
activation-or-abort receipt/publication-profile/destructive-authority state,
completion reserve, operational/candidate head, profile trust/compatibility/
ratchet/activation-fence port receipts/status/attempt-slot state, Recovery
parent-capacity ledger/parent-child transfers/backend storage-cost profile,
control reserve/profile/lineage/episode/typed-ledger-transfer/
both child and parent conservation/lock-rank/settlement-head-archive-deletion-membership state or
registry genesis/rebinding state; an
old bundle below a current required anchor; reset lifetime charge; field-wise
invalid join; double debit, split parent/child debit or credit, duplicate parent
credit, cross-ledger/dimension transfer, WorkSpent decrease,
bytes_processed/bytes_stored alias, copied source storage charge, premature Released capacity, lost/
recreated rebuild parent; duplicate successor; ambiguous
archive selection; or a backend unable to atomically consume clearance
authority refuses import and leaves the obligation fenced.
It then calls the shared replay-lifecycle verifier and admits issuance only
after the destination proves
the same writer-authoritative admission guard, exact replay-head/
optional-settlement-journal-head/key lock order,
head-change restart, canonical dual-unique key, monotonic cumulative attempt
accounting, typed contention distinction, fair scheduling, current-hot check
and unique replay claim, plus the same closed attempt lifecycle, single-active
join, takeover fence, terminal atomicity, capacity/reservation bounds and
checkpoint cleanup, atomically conserved original reservation sets, fixed lock
order and every exact-once checkpoint/deletion settlement leg, including
one unified settlement journal/archive namespace and atomic checkpoint bundle,
separate local journal and verified archive replay heads, both CAS boundaries
and their non-wrapping predecessor/sequence chains and authenticated coverage
relationship, archive-before-hot-row-delete, captured exact hot-row IDs/
versions/ranges, archive-head-H revalidation, archive-head-plus-hot-plus-journal
authority, exact settlement/trigger/bundle/result and attempt-checkpoint
linkage, exact archived retry/conflict behavior, no decrement from absent-
envelope non-membership, conservative unavailable-history charging for either
trigger, mixed checkpoint/deletion archives, exact sparse settled/remaining-leg
state, conservative original balances and bounded settlement proof/compaction
work; singular-head input is unsupported and quarantined before import
mutation, while no missing tuple field is defaulted;
otherwise
drain-action execution remains fenced. It also proves
the same-or-longer exact horizon, no-lower quotas/backpressure safety, complete
uncompacted hot results, an authenticated checkpoint/predecessor chain and
issuer manifests/dense watermark plus consumer sparse/eligible-dense proof,
usable membership/non-membership proofs, equivalent non-borrowable budget
classes/reserve and principal sub-limits, intact outstanding reservations and
original claim sets, settlement idempotency and consumer-terminal evidence,
complete request sequence/checkpoint/denial-history proof, canonical terminal
envelope/outcome/role semantics, structurally separate reconciliation evidence,
authenticated lane derivation and exact lane/class matching, separate
stage-one presentation commit and stage-two evidence consumption/mapping
recheck/request transaction, closed irreversible charge dispositions and
checkpointed original-terminal-kind preservation, atomic debit/evidence/
initial-disposition saturation semantics, separate presentation/request/admission semantics,
equal-or-stricter request/archive and manifest/chunk/
verification limits, and no sequence/key reuse. Missing archival payload may remain unavailable, but
that range is durably fail-closed and cannot be interpreted as unused. It then
calls the shared
canonical verifier with destination build scope and the actual predecessor
artifact; it never infers, upgrades, or trusts a law generation from mutable
payload content.

Verification: truncation/substitution/reorder, wrong tenant/key/version, duplicate
resume, blob mismatch, exhaustion, catalog or ancestor omission/substitution,
self-consistent untrusted manifest, unknown semantic ID, silent generation
upgrade, omitted/reset receipt/time/profile/continuity/tombstone field,
deadline-CAS mechanism downgrade, timeout-abandoned late commit, round-trip,
replay-horizon shortening, quota/budget reset, missing hot result, checkpoint
fork or rollback, accumulator/archive/key substitution, compaction-cursor
rewind, unavailable proof treated as absence, request- or issuance-sequence
reuse, lost/renumbered/recharged request identity, compacted denial
reevaluation, missing denial archive treated as new,
issuer-range loss/substitution, sparse-to-dense promotion, late gap acceptance,
split issuance state, timeout release, duplicate terminal decrement, caller-
limit loss, lineage revoke/supersede release without receipt-specific consumer
proof, current-key recomputation, issuer-forged/incomplete/open-outcome
terminal evidence, reconciliation passed to terminal settlement, terminal or
reconciliation result/outbox sequence or authentication-role rollback,
presentation/request/admission counter collapse,
oversized/deep/partial/cyclic range proof, or
budget-class/reserve weakening,
singular settlement input claiming local/archive/both/empty/complete meaning,
apparently complete supporting evidence, genesis inference, invented chains or
coverage, source mutation, destination authority mutation, refusal-response
retry side effects,
millions of bounded records, cumulative allocation/hash/signature/proof floods,
temporary/staging exhaustion, open-file/stream and concurrent-job saturation,
crash/cursor/reconnect/failover/adapter-retry counter reset, duplicate job or
changed-manifest reuse, Normal-to-Recovery cleanup starvation, unbounded
quarantine payload retention, budget-exceeded promotion or source mutation,
exhaustion/cancellation/cleanup versus activation, stale owner version or job
fence, missing/duplicate/reordered/substituted preparation receipt, incomplete
owner manifest, partial preparation, owner rejection, activation response
loss, concurrent activation, failover after preparation, prepared-state
restore, active-without-barrier/receipt/owner-generation corruption, and any
non-co-located activation fallback; active and terminal source VIT-INV-062
jobs, identical job/operation/authorization/candidate/barrier IDs, source jobs
targeting the destination, source/destination aliasing, cyclic self-import,
terminal-history promotion, archive response loss, coordinator-bootstrap
drain with a live job, checkpoint omission, dormant-successor verification
failure, handoff response loss, failover and restore before/after cutover,
history authentication/provenance/tenant/namespace/result/manifest
substitution, duplicate and conflicting append, sequence/predecessor fork,
bounded rows/bytes/work exhaustion, retry-limit exhaustion, append response
loss, retention/classification mismatch, protected-cleanup starvation and
post-activation archive failure; activation remains canonical success with a
separate exact archive disposition,
crash immediately before and after activation commit, missing append-worker
delivery, absent obligation, NoHistory/NotRequested substitution, cleanup
racing Pending append, restore with Pending obligations and cleanup before
terminal-obligation checkpoint,
proposal publication followed by authority expiry/revocation, local-head CAS
loss, crash or lost witness response; saturate completion capacity immediately
before attempt admission and after proposal publication and prove no external
send without the full reserve and no stranded terminal write. Verify status-query reconciliation,
externally witnessed Activated/Aborted/PermanentlyUnresolved terminalization,
separate proposal/active high-watermarks, no proposal-as-active inference and
no orphan cleanup before abort/supersession proof. Rotate, weaken, emergency-
distrust or substitute
the publication profile/source/quorum at every prepare/publish/local-activate/
external-activate boundary; omit/substitute the trust anchor, compatibility or
ratchet and prove final current-profile denial plus
LocalActivationCommitted→Aborted under TerminalizationOnly/EmergencyDistrust.
Race ActivateManifest/RotateProfile/EmergencyDistrust through the concrete
linearizable activation-fence port, fork/roll back its receipt history, replace
it with independent signatures, lose the root and exceed the one scoped
attempt slot; require one final winner, fail-closed reprovisioning and no
unbounded enumeration.
Restore every combination of operational-active and transition-candidate heads,
allowing only empty/equal/reachable non-authoritative candidate. Model lifetime-
work WorkAvailable→EpisodeWorkReserved→WorkSpent separately from physical
ReservedUnoccupied→Occupied→ReclaimPending→Released, including distinct
bytes_processed/bytes_stored. Prove both child conservation equations, kind-specific
exact-once transfer IDs, atomic scope/lineage state, no double charge, no
WorkSpent decrease, no cross-ledger/dimension movement, no physical release
before verified archive/deletion, overflow/underflow refusal and response-loss
replay. Recompute destination bytes_stored under the destination
backend/schema/index/artifact cost profile, never copied source counters. Fault
every parent debit/credit versus child allocation/release and require the
stable parent/child transfer plus parent equation, including completion
reserves. Record adapter acquisition traces for every path and reject deviation
from `MigrationImportRegistryHistoryLockRankV1`. Crash reserve settlement
before/after ReleasePending, row append, journal advance, archive verification,
exact deletion, Released/result/outbox; fork,
roll back or lose either settlement head and prove no capacity resurrection,
duplicate decrement or hot-state deletion before verified membership,
and cross-adapter conformance pass. Specifically crash after archive upload
before Commit, forge or rebind a Verified receipt, attempt publisher/adapter
head advance, lose the Commit response and interleave readers at every
head/delete boundary; readers see either the prior head plus all captured hot
rows or the complete committed successor, never a split. For every remaining
workspace leg exercise AuthenticatedDeleted, TransferredToCustodyLedger and
Unknown. Attempt transfer before/without/against a stale reservation; crash
after Begin reservation and at every external transfer/Commit/reconcile
boundary; expire/revoke Commit authority; and prove unknown transfer outcome
retains TransferPending until exact definitely-never-transferred or
authenticated destination-deletion evidence releases it. After either release,
prove the lineage remains safely ReleasePending and only an independently
authorized monotonic Replan can fence the old attempt/grants/receipts, consume
terminal evidence and create a new bundle, attempt and reservations. For
permanent Unknown, exhaust bounded reconciliation and prove independently
authorized quarantine converts the full EffectiveCharge into a permanent member,
fences namespace/transfer identity, never refunds on late evidence and permits
Replan only with entirely new capacity. Exercise ConfirmedPresent,
DeletionVerified and PermanentlyUnresolvable resolution under legal hold,
complete namespace absence, response loss and original-quarantine preservation;
prove only independently authorized exact deletion releases base/emergency
capacity and platform-wide unknown-member ceilings never reset. Race
Replan/Abandon/Commit and response loss on the shared attempt row, and prove
old reservation IDs are never recreated, released twice or accepted by the new
plan. At every Replan, omit/stale/overflow backend preflight, exceed atomic or
cumulative lineage limits and include retained old artifacts; prove no head
advance without both fresh future-Commit capacity and complete retained-history
allowance. Repeatedly replan to every budget boundary, restore/compact history,
and require BudgetExhaustedRetained without refund/reset, exact archived replay
and anti-reuse. Fault source/
destination generations, cost-profile lineage/digest, unit mapping,
compression/encryption/replication/index overhead, verified encoded size,
rational ceiling, overflow, backend atomic maximum, terminal receipt
idempotency and custody-ledger version/member arithmetic. Prove unlike source/
destination dimensions conserve through one transfer ID without requiring
numeric equality and unknown/incomparable mappings deny before external work.
Activate compatible successors while retaining pinned evaluators; attempt
incompatible/weakening activation with live predecessor reservations, omit
destructive authorization, drift CurrentHead between Begin and Commit and
restore with a superseded generation. Require the dependency drain/fence and
exact pinned evaluation without stranded transfers. Stream at, below and one
chunk above the reserved charge; race extension/transfer/response loss and
prove capacity extends atomically before bytes, no destination finalizes above
the current maximum, and failed extension retains the original pending charge.
Race chunk/extension/multipart completion/evaluator migration with
Open→SealPending→Sealed and seal reconciliation. Delay chunks and credentials,
retry provider completion after Sealed, substitute root/size/ETag/version and
lose every seal response; require immutable provider fencing, no post-seal
mutation, no guess from SealPending and no eligibility without the exact
Sealed receipt. Providers without hard write fencing refuse custody transfer.
Substitute evaluator binary/corpus digests, omit a pinned evaluator from node
readiness, roll upgrade/restore across artifact sets and emergency-distrust at
each chunk/extension/eligibility/Commit boundary. Require immediate denial and
independently authorized migration that never lowers the reservation or forgets
accepted bytes. Reassess corrected charge below, at and above the historical
plan maximum; never clamp, atomically debit the emergency reserve, fence
tenant/backend on uncovered or unrepresentable deficit and require independent
provision/delete/migrate remediation. An uncertain transfer enters reassessment
before permanent quarantine.
Race Stage/Verify/Commit/MarkOrphan/FinalizeGc with state CAS loss, exact and
changed retry, chunk deletion response loss and exhausted lifecycle budget;
ConsumedByCommit excludes GC, OrphanGcEligible/Collected excludes Commit and no
reader observes a collected committed chunk. Race Stage and Verify against
Replan, Abandon and Commit; terminal/non-current attempts return AttemptClosed
before upload, verification, artifact or budget allocation while existing
receipts remain collectable. Attempt MarkOrphan while PreparingOpen,
PreparingRevalidationRequired or CommitEligible and after a Commit grant is
missing, expired or revoked;
only Superseded/Abandoned passes, and Commit/Abandon/Replan/MarkOrphan share one
winner without a liveness loop. Unknown and every partial/stale/
mismatched receipt retain the predecessor without credit, while exact retry
joins one consumed receipt/tombstone, reservation/member conversion and balanced
custody-charge/source-credit result.
For authorization admission/revocation Apply, Stage/Verify, extension/
reconciliation/seal, evaluator migration/reassessment/remediation, unknown
quarantine/resolution, MarkEligible/Abandon/Replan and orphan/GC, fault every
budget-charge commit/response/checkpoint boundary. Require one stable original-
bucket settlement identity, pessimistic charge, protected Recovery allowance,
no exact-retry double charge and no settlement before authenticated terminal
checkpoint/archive. Exhaust the authorization table for all six release
actions and require the matching action-specific result.
Exhaust both deficit-remediation and retained-unknown-resolution authorization
families across all six states, pre-admission revocation, expiry/consumption
races, stale scoped sequences, response loss, restore and changed-material
replay; VerifyDeletion must release capacity only in the transaction consuming
one exact Issued row. Admit BeginRelease at every deployment/tenant pre-Begin
pool boundary; race competing grants, Begin, expiry, revocation, cleanup and
response loss. Prove exactly one candidate activates into the lineage budget,
the original bucket/amount transfers without gap or double charge, unknown
outcome retains capacity, and cleanup requires authenticated exact-candidate
non-reference plus an absent/different winner mapping.
Reassess above the historical maximum and exercise ResumableCommit,
VerifiedDeletionAndReplan, MigratedPlanReadyForReplan and
PermanentlyFencedRetained. Commit must move base
plus covered deficit into one EffectiveCharge member and one deficit
settlement, including after response loss/restore; no emergency unit may be
stranded, refunded, omitted or counted twice. During seal reconciliation,
accept SealPending→Open only with a SealDefinitelyNeverCompletedReceipt; delay
the old provider completion after cancellation and prove it is either
permanently rejected or local state never reopens.
Exhaust the four-row remediation action/result matrix. A failed, retryable or
Unknown provision/migrate/delete attempt retains its irrevocably admitted
execution authority/attempt, predecessor state and full charge and cannot
redispatch or select permanent retention. Race BeginDeficitRemediation against
expiry/revocation, then race DispatchDeficitRemediation against legal-hold/
policy activation, credential rotation, evaluator distrust, namespace-fence
change, routing transfer, worker takeover and broker capability redemption.
Prove Dispatch is the current-policy cut, two workers obtain one redemption,
pre-call drift produces FailedDefinitelyNoEffect with zero provider traffic,
and every post-dispatch crash becomes Unknown without returning to
ExecutionAdmitted. Lose every provider response and prove Complete reconciles
the same effect ID only; FailedDefinitelyNoEffect requires a fresh grant.
Run the formal provider-effect conformance suite across effect-ID scope,
single application-level transmission-claim creation/consumption,
in-claim transport retransmission, deduplication/query horizons,
partitions/timeouts, credential rotation, late duplicates, lease loss,
takeover and forged/stale definitely-no-effect evidence. Crash or return after
the claim may only query/reconcile and can never invoke the provider again.
Run VIT-INV-006 vectors proving only the winning trusted-executor transaction
receives one process-local permit, exact retry/status never returns it,
post-commit response loss cannot reconstruct it and neither durable claim nor
digest is accepted as bearer authority; an unsupported profile must refuse
before dispatch.
Exercise both finalization actions and policy/hold drift. Only the explicit
RetainPermanentlyFenced action may create the named permanently fenced member;
fault every base+deficit→member/settlement write and prove conservation.
Race MarkEligible and final Commit immediately before/after Begin, capability
redemption, EffectDispatched, lost response and Complete. Both are no-write for
every nonterminal attempt/capability/reconciliation obligation; CommitEligible
fences later Begin/Dispatch, and only one unchanged canonical complete
attempt-set root may Commit.
Exhaust the closed attempt-set writer table. Race eligibility and Commit
against execution/finalization Admit, Expire, destination
ApplyRevocation/consumption, provider evidence/reconciliation, capability
terminalization/cleanup and checkpoint/compaction/archive replacement. Each
mutation advances one head under the canonical rank and atomically invalidates
CommitEligible to PreparingRevalidationRequired; full MarkEligible revalidation
may then bind the successor root. Delete/omit/corrupt the invalidation and
fence evidence at every restore/read path and prove the authoritative tagged
state cannot decode, default or dispatch as PreparingOpen. Prove no restrictive
writer blocks, no mutation escapes the root, no stale eligible root commits and
no invalidation reopens Begin/Dispatch or Stage/Verify allocation.
Complete lineages with zero, one and the maximum residual unknown members.
Require WithoutResidual only at zero; otherwise atomically transfer each
member into its own obligation/budget, commit the exact sorted root/aggregate
budget/routing CAS and select WithResidual. Resolve children into mixed
outcomes; the immutable descriptor/transfer root never changes, while child
state/budget and aggregate state advance atomically under the defined lock
rank. Race sibling resolutions and prove no lost/double aggregate decrement;
no child closes/settles/compacts/releases a sibling or its slice.
After every child transition roll back/delete coordinated child state, budget
state, settlement and aggregate rows; the cumulative residual-state head and
greatest authenticated external high-watermark must detect every rollback.
At Begin and zero-survivor Commit require explicit NoneCanonicalEmpty
aggregate references and authenticated empty state heads with no aggregate
row; absence alone never passes.
Race final Commit against Admit, Expire, revocation Apply, Resolve, evidence,
checkpoint, GC and compaction at the routing CAS. CAS losers reroute exactly
once. Race competing Begin candidates and prove only the winner atomically
creates generation-1 LineageOwned routing genesis; Replan preserves it, absence
is never inferred, and missing/duplicate/rolled-back genesis or dual-owner
rows/sequences/inboxes/charges fails restore/readiness. After plan
compaction operate solely through the routed residual child/aggregate and
reject every other completed-lineage command. Race many pre-Begin candidates so one Begin wins while all
expired/revoked losers prove exact candidate non-reference and clean up; fault
winner mapping/CAS/settlement identity and prove no loser releases or aliases
the winning charge.

Exit criteria: successful import proves complete semantic and integrity parity.
`v0.30.0 implementation stop reached. Run pentest for this exact commit.`

## `0.30.1` — Durable Journal-Backed Work Queue

Status: planned.

Setup: define queue/topic identity, tenant scope, ordered/unordered semantics,
enqueue transaction, visibility lease/fencing, retry/backoff, dead-letter,
priority/fairness, payload references, cancellation, drain, quotas, and exact
mapping to the `0.18.2` consumer/timer/activity/poison atomic variants.
Queue delivery/acknowledgement is distinct from external-effect acceptance and
outcome. Preserve stable `EffectId`, request digest, attempt evidence,
idempotency/replay horizon, and each typed execution, remote-outcome,
resolution-evidence, operational-workflow, and compensation state across lease
expiry, redelivery, failover, and dead-letter movement. Preserve the immutable
`RemoteTargetConcurrencyProfile`, provider/account/resource, validator bytes/
kind/strength/provenance/observation time, provider capability/version, request
digest, idempotency key, and reviewed-exception identity across redelivery. A
worker cannot refresh the validator or reinterpret precondition failure or
response loss. Preserve the exact `RemoteMutationExceptionId`, owner generation,
scope/request digest, epochs, guard version, attempt identity/ceiling, and
receipt; redelivery cannot select or consume a different exception attempt.
Preserve `redeemed_at`, immutable `transmit_before`, effect/attempt, permitted
service audience, provider/account/request digest, admitted epochs, unique
transmission-start claim, exact worker instance, lease generation/fence, permit
digest, and claim status—but never reconstructable permit material. Redelivery
submits an immutable authenticated instruction to the trusted
`TransmissionExecutor`, which alone rechecks current fences, claims, owns the
provider socket, and consumes the process-local permit. Queue/RPC state cannot
carry, reconstruct, or authorize from that permit or digest; redelivery cannot
return a second permit, extend the deadline, or retry a claimed/possibly started
transmission. Preserve the immutable `ProviderExecutionProfile`, exact-claim-
bound scoped credential-handle operation, denied master-key/general-write
authority, executor trust-domain partition, egress policy, and residual-blast-
radius evidence across redelivery. Preserve the authoritative profile lineage,
exact active generation, profile/account/credential/broker-policy epochs,
profile activation admission/approval/digest/tombstone evidence, current
rotation state/local activation epoch/provider evidence/deadline, current
rotation owner/guard/identity/takeover/orphan/count encumbrance, current
credential-capability snapshot/epoch/freshness/validator and semantic evaluator/
language/result/evidence, reduced/quarantine/incident/first-use state,
evaluator-lineage/generation/admission/epoch/reevaluation state, quarantine
investigation/remediation/verification/resolution/new-generation/tombstones,
independent remediation profile/lineage/audit/epoch/cleanup-quota/manual-only
limitation,
credential-operation profile, and brokered-bearer TCB placement. Redelivery
cannot revive a suspended/revoked profile, rotated credential, stale handle, or
old broker policy, bypass a revocation tombstone, progress remote rotation, or
refresh/evaluate provider permissions, clear whole-credential quarantine, use a
nominally non-privileged action, or start a successor after unknown rotation;
it also cannot activate/revoke an evaluator, complete reevaluation, advance
quarantine resolution, revive pre-resolution work, or redeem remediation
authority;
queue payloads never contain bearer material.
Only the authoritative rotation and permission reconcilers may advance those
states. Preserve
the immutable authorization binding and freshness profile across queues; a
worker must record
the required current dispatch decision, authenticate as itself, and redeem the
bound `LiveSubjectAuthority`, `ApprovedExecutionGrant`, or
`ServicePrincipalAuthority`; it cannot inherit business authority from queue or
lease possession or impersonate an offline approver. Preserve every bounded
quota claim's `QuotaKind`, settlement policy, amount/unit, reservation state,
declared boundary, evidence-backed transition, and separate compensation claim
set. Partition reconciliation/security lanes by tenant and work class with
ceilings, global fair-share scheduling, starvation bounds, and emergency reserve.
Preserve the one-owner grant-lineage rule and immutable approval-receipt/outbox
causation across queue delivery. Preserve the co-located fenced redemption guard
and stable attempt-claim/receipt identity so dispatch advances only the effect
stream. Preserve `QuotaClaimSetId`, canonical digest, opaque pre-reserved token,
immutable ordered membership, transaction-domain placement, hierarchical
capacity-lease epoch/per-kind encumbrance/original-settlement identity, and set/
claim/transfer transition idempotency. Preserve stable capacity-transfer ID,
source/destination epochs, digest, sequence, state, acknowledgements, and
original claim/transfer lineage plus accounting owner, hierarchy root/parent
lease, period, work/recovery lane, capacity class, region, and source/
destination authorization through at-least-once queue delivery. Preserve
`QuotaCapacityPolicy` version/simulation/floor evidence and current local tenant/
principal/policy epoch requirements for every delayed transition. Preserve
one-parent policy lineage, parent epoch/high-watermark, exact deltas, independent
floor-set version, and conservative multi-parent prepared/finalized rollout
receipts. Preserve floor history/reduction authority and cross-command
separation, floor-profile ID/version/digest and durable fully typed admission
ratchet plus total overflow-checked key-set migration mapping, root manifest/
digest/membership epoch, complete canonical parent identities, total
conservation, one active rollout generation, atomic successor/cancellation/
supersession state, finalization receipt, and each parent's fresh active-
generation prepared-to-activated/blocked/reconciliation CAS evidence. Preserve
the single cancellation-recovery successor, actual-limit manifest, idempotent
receipts, deadline/escalation state, and no-independent-parent-release rule;
workers never reacquire individual quota members, release encumbrance on
capacity-lease expiry, or open a cross-partition transaction. Preserve and
atomically lock the complete
`DispatchAuthorityFenceSet`, required `DispatchTargetFence`, and canonical
composite acquisition order across redelivery/failover.

Goal: own an HA-capable durable queue profile without requiring a separate
message broker for correctness.

Deliverables: project-owned queue port, journal/outbox-backed PostgreSQL adapter,
memory fake, worker protocol, external-effect reconciliation scheduling and
manual-resolution queue, dispatch-authorization gate, quota-disposition
reconciler, execution-grant redemption/revocation handling, fair partitioned
control-plane lanes, grant-lineage issuance/successor process manager,
redemption-guard/attempt-claim handler, exact-token local quota-set and
hierarchical-capacity-lease/encumbrance-transfer handlers, authority-fence-set
validator, target-fence validator, capacity-transfer outbox/inbox process
manager and reconciler, remote-target concurrency validator and precondition-
outcome handler, remote-mutation-exception guard/attempt handler, capacity-
policy owner/parent-ledger/floor activation and conservative-rollout handler,
protected-floor governance/cross-command separation and root-manifest complete-
rollout handler, delayed-transfer authority gate, transmission-window/unique-
claimant/trusted-executor/instruction-only/provider-execution-profile handler,
profile/account/credential/broker epoch and credential-operation/bearer-broker
handler, profile-governance lifecycle/approval/tombstone handler, credential-
rotation process manager/evidence/deadline reconciler, credential-capability
snapshot/epoch/freshness validator, rotation guard/takeover/orphan/count-quota
handler, permission-evaluator/evidence/reduced/quarantine/incident handler,
evaluator-lineage/epoch/reevaluation validator, quarantine-resolution/new-
generation/tombstone validator, remediation-authority-denial validator,
floor-key/ratchet migration and active-generation successor/fresh post-
finalization parent-activation handler, canonical lock-order/deadlock-retry
implementation, capability report, and operational metrics.

Verification: enqueue/commit crashes, duplicate delivery, receipt/effect split,
stale ack/fence, lease loss, dead-letter/effect split, quota/effect split,
poison loops, starvation, cross-tenant routing, sensitive payload leakage,
provider acceptance with lost worker response, blind retry after idempotency-key
expiry, unknown-outcome dead-letter or quota-hold loss, stale authority after
enqueue/lease, expired initiating session with a valid scheduled grant, grant
replay/attempt exhaustion/revocation, approval/policy/approver/target-version
drift, approval/grant crash-reorder-duplicate, pre-issuance revocation,
successor fork, revocation/final-attempt race, crash after attempt claim before
provider I/O, duplicate/substituted attempt claim or receipt, target drift
during claim, consumed-attempt failover/restore, grant/effect two-stream
mutation, target substitution, offline-human impersonation, worker confused
deputy, remote validator/account/resource substitution, weak/strong or ABA
confusion, ignored/downgraded conditional write, silent refresh, precondition
failure retried, response loss treated as rejection, exception scope/guard/
attempt substitution, revocation/expiry/provider-capability/final-attempt race,
restore resurrection, long worker pause, revocation/expiry/target/provider-
capability change after receipt, transmission deadline/audience/request
substitution, wall-clock rollback, concurrent shared-credential workers,
claimant/claim/lease/permit substitution, claim-response loss, stale-worker
takeover, same-claim replay, pre/post-start-claim crash, expired/restored/
reconstructed permit, permit transport/logging/digest authorization, duplicate
instruction, executor failover/compromise, arbitrary unclaimed provider request,
master-key/general-write or out-of-broker bearer exposure, claim-bound secret-handle
substitution/reuse, cross-tenant executor compromise, unrestricted shared
credential, destination/TLS/DNS/redirect/general-proxy bypass, missing residual-
blast-radius evidence, stale/reused/substituted profile/account/credential/
broker epochs, emergency revocation, account suspension, credential rotation/
ABA, unauthorized/self-approved profile activation, semantic expansion, stale
activation fence/tombstone, emergency replacement, every rotation crash/
unknown/evidence/deadline/outage state, duplicate creation, eventual consistency/
continued old-key validity, restored dual redemption, permission/role/group/
cross-account drift, simultaneous rotation, unknown successor, timeout-then-
create, late callback, unauthorized takeover, orphan revocation loss, credential-
count exhaustion, callback reorder, stale polling, wrong policy revision,
stale/restored capability snapshot, semantic evaluator/version/budget failure,
non-privileged quarantine bypass, unsafe subset continuation, automatic widening,
break-glass promotion, evaluator activation/revoke/epoch/reevaluation change,
old evaluator output or incompatible worker, unsafe quarantine clear/resolution/
old-work revival, remediation authority in payload or worker, queue-driven rotation or permission refresh/evaluation,
stale queued instruction, restored handle, signing/mTLS key export, bearer
material outside the broker TCB or in queue/log/diagnostic/crash state, caller-
owned bearer claim/TLS/socket, missing memory canary, uncertain retransmission, mixed
quota-claim split,
overlapping-set deadlock/livelock, partial
reservation/recovery, token/digest/membership substitution, cross-partition set,
hierarchical lease over-allocation/reclamation/failover, failover before exact-
set consumption, concurrency lease held by remote uncertainty,
transmitted rate-token refund, cost settlement/write-off confusion, retained-
byte drift, duplicate refund, provider outage with exhausted tenant quota,
tenant/subject/session/delegation/policy/service-principal revocation racing
dispatch, missing/stale/substituted fence, lock-order inversion, unbounded or
identity-changing retry, capacity-lease expiry with retained bytes/unknown
liability/spent token, child loss, late settlement, duplicate encumbrance
transfer, transfer crash/duplicate/reorder/lost acknowledgement, source or
destination failover, stale epoch, conflicting transfer, forbidden free-at-
both-ends state, owner/root/parent/period/lane/class/region/authorization
substitution, recovery/emergency-to-business reclassification through transfer
or adjustment, existing-class rewrite, tenant-invoked capacity policy, reserve-
floor violation, policy owner/parent ambiguity, stale parent high-watermark,
concurrent allocation, delta/simulation/floor substitution, self-lowered floor,
floor reduction and spend by shared actor/approval lineage, stale operational
fence/obligation state, platform-minimum violation, omitted/aliased parent,
parent add/remove/reparent/generation race, stale root manifest/epoch, incorrect
conservation total, coordinator failover, wrong-manifest activation, partial
rollout/rollback/restore, allocation/reclamation/floor/obligation/incident/
tenant/principal/policy/parent drift between root finalization and activation,
stale prepared activation rather than blocked reconciliation, platform-floor
profile/epoch/digest/key substitution, omitted/duplicate key, lossy unit/period/
region/settlement mapping or overflow, stale/lower-floor startup, mixed-version/
downgrade/rollback/lower-default/restore ratchet weakening, concurrent successor
creation, partial activation rollback, delayed superseded preparation/
finalization/activation, active-generation substitution, blocked-parent recovery,
superseded-receipt restore, cancellation before/after each preparation, lost/
duplicate cancellation delivery, missing/duplicate recovery successor/receipt,
independent parent restore, recovery drift/deadline escalation, policy replay, stale
tenant/principal/policy epoch during activation/acknowledgement/reclaim, parent
reclaim racing failover,
target deletion/merge/migration/supersession/restore racing dispatch, stale
target projection, cross-shard target placement, missing/substituted target fence,
single-tenant reserve monopolization, global/per-tenant starvation, emergency-
reserve misuse, partition/failover, drain/restart, and model/conformance tests
pass.

Exit criteria: HA work dispatch has documented at-least-once delivery and
idempotent local-commit semantics, preserves the `0.18.2` external-effect
authorization, resolution, and quota contracts without collapsing their typed
dimensions, redeems durable grants without impersonation, preserves per-kind
settlement and single-stream grant ownership, claims attempts through a
co-located guard without advancing the grant stream, consumes exact immutable
quota sets without reacquisition or distributed transactions, conserves wider
capacity and per-kind encumbrances through fenced local leases, linearizes every
applicable authority and current-target change through the complete authority
and target fences, moves capacity with at-least-once messages and receipt-
idempotent conservative accounting without classification drift, preserves
remote validator semantics without treating them as a local fence, redeems
unconditional authority only through its co-located revocable attempt guard,
expires admitted transmission authority, rechecks current fences before a
bounded single-use start, returns non-persisted permit material exactly once to
one executor instance/lease generation that also owns the provider socket,
exchanges only immutable instructions/status across process boundaries, routes
duplicate instructions, ambiguous claims, executor failover, and uncertain
starts to reconciliation, and permits provider authentication only through the
exact claim-bound scoped credential/egress profile without cross-tenant reusable
authority; rechecks monotonic profile/account/credential/broker epochs, keeps
rotated/revoked handles non-redeemable after restore, and confines bearer
material to the broker/executor TCB; keeps existing capacity class-immutable, atomically
activates each one-parent future-allocation policy under independently governed
floors, authenticates the complete root manifest before multi-parent
finalization, then freshly CAS-revalidates every parent or leaves it
blocked/reconciling; enforces floor-policy cross-command separation and the
durable versioned, fully typed-key platform-floor ratchet across complete
overflow-checked migration/upgrade/rollback/restore; enforces one active root
generation and successor-only rollback so late/restored predecessors fail; and
uses one complete recovery successor after prepared cancellation, with
conservative parents, idempotent restore-safe receipts, and deadline escalation;
rechecks delayed-transition authority; retries composite deadlocks without
identity drift, keeps fair recovery available under hostile tenant exhaustion,
and has no process-local queue dependency.
`v0.30.1 implementation stop reached. Run pentest for this exact commit.`

## `0.30.2` — Cache Semantics And Hosted Adapter

Status: planned; hosted implementation is blocked until its exact client/TLS/
server profile and admission record are approved.

Setup: classify cacheable values, tenant/policy/version key material, TTL and
invalidation, revocation propagation, stampede control, size/entry quotas,
serialization, outage behavior, and authoritative fallback.

Goal: make caches disposable performance layers that cannot grant authority,
preserve erased data, or weaken read consistency.

Deliverables: cache semantic port, bounded memory adapter, optional hosted
adapter, invalidation protocol, capability probes, and conformance suite.

Verification: cross-tenant/policy-key collision, stale authorization, erasure/
retention leak, poisoning, stampede, eviction, outage, serialization ambiguity,
oversized values, and fallback-equivalence tests pass.

Exit criteria: disabling or losing a cache changes performance only and never
security or correctness. `v0.30.2 implementation stop reached. Run pentest for this exact commit.`
