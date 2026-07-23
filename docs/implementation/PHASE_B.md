# Phase B — Journal And Projection Mechanics

Scope: `0.11.0–0.20.0`. Pure semantic contracts and project-owned in-memory
implementations establish ordering, replay, idempotency, and integrity.
Every atomic bundle advances at most one authoritative aggregate stream.
“Effects” in this phase means local durable events, receipts, audit facts,
outbox intents, quota consumption, integrity commitments, uniqueness claims,
and scheduler/inbox state only. Network/provider calls and other external side
effects never join the database transaction; they execute at least once from a
committed outbox/work intent and return results through a later consumer or
activity-result bundle. No bundle claims distributed exactly-once execution.
Each external-effect capability declares a stable `EffectId` and request
digest, provider idempotency-key scope and retention, status-query/
reconciliation support, retry safety and maximum replay horizon, compensation
support, privilege/non-compensability class, authorization-freshness profile,
and quota-consumption boundary. It never collapses these typed dimensions:

- `EffectExecutionState`: `Pending`, `Leased`, `Dispatched`, `AwaitingResult`,
  `OutcomeUnknown`, `Resolved`, or `Abandoned`;
- `RemoteOutcome`: `Succeeded`, `Rejected`, `DefinitelyNotAccepted`,
  `TerminalFailure`, or `Cancelled`, present only with admissible provider
  evidence;
- `ResolutionSource`: `DirectResponse`, `SignedCallback`, `ProviderQuery`,
  `IdempotentReplay`, or `OperatorAssessment`, bound to immutable resolution
  evidence and its verification strength;
- `EffectResolutionWorkflowState`: `NotRequired`, `Reconciling`, `Escalated`,
  `ManualReview`, or `Closed`; and
- `CompensationState`: `NotRequired`, `Eligible`, `Requested`, `InProgress`,
  `OutcomeUnknown`, `Completed`, or `Abandoned`, with a separate compensation
  effect identity and full external-effect record linked to, but never
  overwriting, the original effect.

Authorization is required when the command commits an effect intent. The intent
immutably binds tenant, initiating subject, delegation chain and version,
capability/action, exact target identity and version/digest, purpose, request
digest, policy decision/version, authentication assurance/expiry, and one typed
`EffectExecutionAuthority`:

- `LiveSubjectAuthority` requires the initiating human's current authenticated
  session, employment/subject status, delegation, and policy at dispatch;
- `ApprovedExecutionGrant` is an immutable integrity-bound grant created only by
  an authorized approval command. It binds tenant, grant and effect identity,
  exact request/target digest and target version, purpose, approver decision IDs
  and quorum, separation of duties, assurance at approval, not-before/expiry,
  permitted attempts, policy version, and revocation conditions; and
- `ServicePrincipalAuthority` binds a tenant service principal, exact capability
  scope, audience/proof identity, credential/assurance profile, policy version,
  and expiry for narrowly scoped automation.

The intent's typed freshness profile is either `CommitBound` or
`CommitAndDispatch`; there is no dispatch-only profile. The default is `CommitAndDispatch`.
`CommitBound` is permitted only for a reviewed immutable-target,
non-privileged, non-destructive, non-secret-bearing action whose semantics do
not depend on continuing authority. Privileged, destructive, secret-bearing,
containment, and compensation effects always use `CommitAndDispatch`.

A `CommitAndDispatch` worker authenticates as its own service identity and
independently redeems the selected execution authority immediately before
external I/O; it never impersonates an initiating or approving human.
`LiveSubjectAuthority` rechecks the live subject/session facts.
`ServicePrincipalAuthority` rechecks the current principal, credential/proof,
scope, and policy. `ApprovedExecutionGrant` validates its integrity receipt,
exact bindings, window, guard-backed remaining-attempt state, current tenant
state, and current policy compatibility without requiring an approver's login
session to remain alive. Session expiry alone does not revoke a grant. Explicit
revocation, tenant
suspension, grant expiry/attempt exhaustion, or effect/request/target-version
mismatch always denies redemption. Approver employment/eligibility loss or an
authorization-relevant policy-version change revokes an unredeemed grant unless
a new authorized revalidation command creates a successor grant.

Every grant lineage declares exactly one authoritative stream owner. When the
approval and grant are state of the same aggregate, approval completion and
grant issuance are consecutive events in that one stream. Otherwise the approval
transaction commits an immutable approval receipt and outbox issuance intent;
an idempotent process manager later creates or updates one dedicated
`ExecutionGrantLineage` stream. No lifecycle transition is split between the
approval and grant streams. The lineage binds a stable `GrantLineageId`, unique
generation `GrantId`, immutable approval-receipt identity/digest, predecessor,
and successor. A revocation command addressed to the stable lineage/generation
may initialize it as `RevokedBeforeIssuance`, so a delayed or reordered issuance
intent can never make it redeemable. Successor creation and predecessor
supersession occur in the same owner stream; the predecessor remains permanently
non-redeemable, and replay cannot fork or reuse a generation identity.

Grant redemption and attempt consumption use a `GrantRedemptionGuard`, a local
transactional authority like a uniqueness or quota claim, never a second
aggregate stream. The lineage-owner transaction creates and fences the guard at
issuance, revokes it with explicit revocation, and replaces it during atomic
successor supersession. The guard binds grant lineage/generation, immutable
approval receipt, effect/request/target/version, permitted-attempt ceiling,
revocation epoch, and guard version. The dispatch transaction advances only the
effect-owning aggregate while atomically compare-and-claiming one
`GrantAttemptClaimId`/ordinal from the co-located guard and recording the exact
single-use dispatch-authorization receipt/outbox intent. An idempotent retry
with the same claim identity and digest observes that receipt; a different or
substituted claim cannot reuse the attempt. Revocation and redemption serialize
on the guard: a revocation that wins denies the claim, while a committed claim
is retained as an admitted attempt, not an indefinitely valid permission to
transmit. Crash after claim/receipt commit does not consume another attempt, but
the committed outbox work remains subject to the bounded transmission-start
contract below.

The lineage owner, redemption guard, and effect work bundle must share one local
transaction domain even though only one aggregate stream advances in each
transaction. Capability negotiation rejects a grant/effect topology that cannot
provide that co-location; adapters may not atomically advance lineage and effect
streams or substitute a later best-effort projection. Lease ownership or worker
identity grants no business capability. A worker cannot substitute tenant,
subject, delegation, execution authority, capability, target, purpose, or
request bytes; any binding mismatch requires a new authorized effect intent.

Every `CommitAndDispatch` operation also carries a bounded, canonically ordered
`DispatchAuthorityFenceSet`. Its typed entries bind the applicable tenant,
human subject or service principal, session or credential/mapping, delegation,
role/group/relationship source, active-policy, and—when unconditional remote
mutation is selected—provider-capability monotonic enforcement epochs.
An authority-changing command increments its never-reused epoch atomically with
the event in its one owner stream. The dispatch transaction locks and validates
the required co-located epoch rows while committing the effect event,
authorization receipt/outbox, any grant attempt claim, and quota transitions;
the transaction still advances only the effect stream. If revocation/suspension/
disablement/logout/policy change wins the epoch race, dispatch denies before
provider I/O. If receipt admission commits first but the authority change wins
before `ClaimTransmissionStart`, transmission still denies. Only a start claim
that commits first establishes the later change as a race with a narrowly
bounded started attempt.

An external identity/session/credential source is never read remotely inside
the work transaction. A production profile must maintain an authoritative local
revocation epoch and fail closed when it cannot establish current local state.
A profile that offers only bounded-stale external facts must publish that bound
and remains unsupported for privileged `CommitAndDispatch` effects. Adapters may
not substitute an eventually consistent cache or projection for a required
fence row.

Every current-target dispatch also carries a typed `DispatchTargetFence`.
When the target is the effect-owning aggregate, the bundle's exact expected
stream version and target digest are the fence. When it is a different local
aggregate, that aggregate's owner maintains an authoritative co-located target-
fence row in the same transaction as every target event; dispatch locks and
validates that row without advancing the target stream. The fence binds tenant,
target kind and ID, expected version and digest, lifecycle state, and monotonic
deletion/supersession epoch. The target stream, target-fence row, and effect
bundle must be placeable in one local transaction domain. A capability whose
meaning requires current target state is unsupported when the target is remote,
cross-shard, or available only through a projection. Deletion, merge, migration,
supersession, and restore may never recreate or reuse an earlier target epoch.

Remote provider state never masquerades as a `DispatchTargetFence`. Every
remote-mutating capability instead declares one
`RemoteTargetConcurrencyProfile`: `NotApplicable`, `ConditionalMutation`,
`UnconditionalReviewed`, or `Unsupported`. `ConditionalMutation` immutably
binds provider and resource identity, tenant/account, validator kind and bytes
(for example ETag, generation, resource version, or revision), strong/weak
classification, provenance and observation time, admitted provider capability/
version, exact request digest, and idempotency key. The adapter transmits that
validator through the provider's admitted conditional-write mechanism. A
precondition failure becomes typed, evidence-backed
`RemoteOutcome::DefinitelyNotAccepted`; it is not a generic retry. A worker
cannot silently refresh the validator:
changed remote state requires a new authorized intent. Ignored, weakened, or
downgraded conditional behavior fails provider capability negotiation.
Privileged, destructive, and containment mutations require a strong conditional
profile unless `UnconditionalReviewed` names one exact
`RemoteMutationExceptionId`. A `RemoteMutationException` is first-class
revocable dispatch authority with exactly one authoritative owner stream. It
binds tenant, provider, account, resource, action and request digest, why the
conditional primitive is unavailable, risk owner, approver receipt identities,
quorum and separation of duties, policy version, authentication assurance,
compensating controls, not-before/expiry, permitted-attempt ceiling, revocation/
supersession epoch, and admitted provider-capability version. It cannot be
reused across resources, actions, requests, accounts, or provider profiles.

The exception owner creates, revokes, and supersedes a co-located
`RemoteMutationExceptionGuard`. Dispatch advances only the effect stream while
atomically validating time/scope/policy/provider-capability bindings and
compare-and-claiming one stable exception-attempt identity from that guard.
Revocation, expiry, supersession, and final-attempt consumption therefore
serialize with dispatch. The provider-capability owner updates a never-reused
local epoch with its registry event; it is a required authority-fence entry for
exception dispatch. If strong conditional support becomes admitted, the epoch
change invalidates the old exception. Retry reuses the committed attempt/
receipt, and restore cannot resurrect an expired, revoked, superseded, or
consumed exception. Worker, plugin, lease, or queue ownership cannot select
unconditional mode without the exact guarded exception.

Weak validators and delete/recreate-reusable validators cannot satisfy the
strong rule. Response loss after conditional transmission still follows
`OutcomeUnknown`, provider idempotency, query, and reconciliation rules; it is
never inferred to be a precondition failure.

Every `CommitAndDispatch` authorization receipt carries a bounded
`DispatchTransmissionWindow`. It binds `redeemed_at`, `transmit_before`, one
effect/attempt identity, permitted service audience, provider, account, request
digest, and the exact authority, target, exception, and provider-capability
versions plus provider-execution profile/account/credential/broker-policy
and credential-capability epochs admitted at redemption. `transmit_before` is
the earliest applicable
authority, grant, exception, target, or provider-capability validity bound,
further capped by a platform maximum admission-to-transmission interval. An
authority source that cannot provide an enforceable bound or co-located current
epoch is unsupported for privileged work.

Immediately before adapter I/O, the worker executes a local
`ClaimTransmissionStart` transition. It rechecks the current authority-fence
set, target fence, grant/exception guard state, and provider-capability epoch,
provider-execution profile/account/credential/broker-policy epochs, and current
credential-capability snapshot/epoch; validates authoritative transaction time
against `transmit_before`; and
atomically compare-and-swaps the exact receipt from `Admitted` to
`TransmissionStartClaimed`. The transition binds a globally unique
`TransmissionStartClaimId`, exact authenticated `WorkerInstanceId`, permitted
service audience, work-lease generation/fencing token, receipt/effect-attempt
identity, and permit digest. A shared service credential never identifies the
claimant. The claiming worker is the trusted `TransmissionExecutor` instance
that owns both this transition and the provider socket. An upstream queue worker
may submit only an immutable, authenticated `TransmissionInstruction`; in a
split deployment it never receives permit material over RPC, IPC, or a queue.
The executor rechecks, claims, and transmits in one process-local boundary. An
in-process worker may embed that boundary, but the same ownership rule applies.
`VIT-INV-006` is the canonical owner, placement, storage, and recovery record
for this start-claim authority.

Every executor runs under an immutable, versioned `ProviderExecutionProfile`
bound to the instruction, receipt, claim, and audit evidence. The executor has
no master-key-ring access and no general-purpose database-write capability.
Provider credentials remain behind tenant/provider/account-scoped opaque secret
handles. Credential issuance, redemption, signing, or token attachment requires
the exact successful claim and binds tenant, provider, account, action, receipt/
effect attempt, request digest, destination, and expiry. Provider-native
credentials are least privilege and short lived where supported.

Every admitted profile scope has exactly one authoritative
`ProviderExecutionProfileLineage`. Its generations are explicitly `Active`,
`Suspended`, `Superseded`, or `Revoked` under a never-reused monotonic
`ProviderExecutionProfileEpoch`. The same authoritative fence set carries the
provider-account lifecycle epoch, credential-lineage/version epoch, and secret-
broker policy epoch. `ClaimTransmissionStart` locks and rechecks all four current
epochs; the claim and secret handle bind their exact values. Secret-handle
redemption rechecks that the profile generation and provider account remain
active, the credential generation is current, and broker policy still permits
the exact operation. Backup, failover, rollback, and restore cannot decrease an
epoch or reactivate a suspended, superseded, or revoked profile, account,
credential, broker policy, or handle. Revocation that linearizes before handle
redemption denies transmission; redemption that linearizes first creates only
the already bounded admitted attempt and grants no later reuse.

Profile authority is created and changed only through typed
`ProposeProviderExecutionProfile`, `ApproveProviderExecutionProfile`,
`ActivateProviderExecutionProfile`, `SuspendProviderExecutionProfile`,
`RevokeProviderExecutionProfile`, and `SupersedeProviderExecutionProfile`
commands owned by the lineage. Every command requires a control-plane-only
capability. A proposal binds a signed implementation-admission record, exact
profile digest, risk owner, and semantic diff from its predecessor. Privileged
profiles require the frozen approval quorum and separation of duties. Any
expansion of credential scope, destinations, redirect behavior, executor trust
domain, or documented residual blast radius creates a new approval decision;
metadata-only classification cannot hide authority expansion. Activation locks
and rechecks current tenant, provider-account, policy, and approver fences plus
the generation's pre-activation revocation tombstone, then atomically changes
the lineage's active generation and never-reused profile epoch. Suspension,
revocation, and supersession fence delayed activation. Emergency revocation may
remove authority immediately but never grants authority to activate a
replacement.

Provider-side credential rotation is not described as one atomic transaction.
One authoritative `ProviderCredentialRotationState` progresses
`Proposed` → `NewCredentialProvisioning` → `NewCredentialVerified` →
`LocallyActivated` → `OldCredentialRevocationPending` → `Completed`, with
fail-closed `ProvisioningUnknown`, `RevocationUnknown`, `VerificationFailed`,
and `ManualInterventionRequired` states. Before local activation, authenticated
provider evidence must bind the new credential to the expected account and
principal and prove its effective permissions fit the admitted profile. Local
activation atomically increments the credential epoch and makes the predecessor
non-redeemable in Vitheim; provider revocation is claimed only after admissible
evidence confirms it. Lost creation or revocation responses become
`OutcomeUnknown` and enter query/reconciliation without blind retry. The old
credential identity and evidence remain until confirmed revocation. Every
profile defines bounded overlap and escalation deadlines. A provider that
supports only one credential uses an explicit outage/maintenance rotation
profile. Restore can never make two generations locally redeemable.

Every credential lineage has exactly one authoritative owner. A stable
`ProviderCredentialRotationId` and intended successor generation identify each
rotation. A co-located `ProviderCredentialRotationGuard` permits at most one
non-terminal rotation for that lineage; `ProvisioningUnknown` and
`RevocationUnknown` block ordinary successor rotation. Provisioning binds a
provider idempotency key and exact request digest. Local rotation-state
advancement and successor activation occur in one lineage-owner transaction,
without advancing a second authoritative aggregate stream; remote work remains
an outbox/reconciliation continuation.

A separately authorized `TakeOverProviderCredentialRotation` recovery command
must inventory authenticated provider credential state before it may resolve an
unknown rotation or admit a successor. Credentials that were created remotely
but cannot be safely associated with the intended rotation enter typed orphan
states: discovered, quarantined, revocation pending, revocation unknown,
confirmed revoked, or manual intervention required. Bounded orphan discovery,
quarantine, revocation, and escalation never make an orphan redeemable. Late
callbacks must match the still-current rotation generation, rotation ID,
provider idempotency key, and request digest. A typed
`ProviderCredentialCount` quota claim accounts for active, pending, and orphan
credentials against the provider limit; no capacity is released until
revocation is evidenced. Backup and restore preserve the guard, orphan state,
provider-count encumbrance, and late-callback fences. `VIT-INV-004` is the
canonical ownership and storage-capability record.

Every credential generation also owns a versioned
`ProviderCredentialCapabilitySnapshot`: exact provider/account/principal,
requested and observed effective permissions, role/group/trust-chain
provenance, provider policy identity/revision/strong validator, observation
time/source/maximum freshness, admitted profile and credential generation, and
a never-reused local `ProviderCredentialCapabilityEpoch`. This is distinct from
the provider-feature `provider-capability epoch`. A reconciler advances it from
authenticated provider events or bounded polling; dispatch never discovers
remote permissions inside its transaction.

Permission comparison uses a canonical `ProviderPermissionComparison` result:
`Equal`, `StrictSubset`, `StrictSuperset`, `Incomparable`, or `Unknown`; it is
never inferred from string-set inclusion. Every provider adapter supplies a
reviewed, versioned semantic evaluator and conformance corpus covering allow and
explicit deny, wildcard and exclusion/`NotAction`, resource/tag/time/network/
identity/session conditions, permission boundaries, organization policies,
role/group/trust chains, cross-account access, and provider inheritance.
Unsupported constructs, ambiguous conditions, evaluator failure, or exceeded
expansion/work/depth budgets return `Unknown` and fail closed. The snapshot also
binds the raw provider-policy evidence digest, normalized permission-AST digest,
evaluator implementation identity/version, provider policy language/version,
comparison result, and explanation-evidence digest. `VIT-INV-002` is the
canonical ownership and storage-capability record for this snapshot authority.

Evaluator code is authority-bearing. Each provider owns one authoritative
`ProviderPermissionEvaluatorLineage` whose generations are `Proposed`, `Active`,
`Suspended`, `Superseded`, or `Revoked`. A generation binds a signed
implementation-admission record, executable binary digest, conformance-corpus
digest, exact provider, and supported provider policy-language versions.
Activation, suspension, supersession, and ordinary or emergency revocation are
typed control-plane commands with the frozen quorum/separation rules. They atomically
advance a never-reused `ProviderPermissionEvaluatorEpoch`; every capability
snapshot and transmission-start fence binds the current epoch. An older
generation's snapshots immediately become `ReevaluationRequired`, not merely
stale at their former deadline. Credentials remain unusable until retained raw
evidence is evaluated under the current active generation and a new capability
epoch is committed. A node that cannot execute or validate the active evaluator,
binary digest, corpus digest, or policy-language version rejects startup or
readiness; mixed-version deployment cannot silently select an older evaluator.
Restore cannot roll back evaluator lineage or make superseded output current.
`VIT-INV-001` is the canonical ownership and storage-capability record.

Only `Equal` or `StrictSubset` can be admissible. `StrictSubset` enters a
distinct `CredentialCapabilityReduced` drift state; continuing an operation is
permitted only when the frozen profile explicitly supports safe-subset
continuation and the evaluator proves the exact requested operation remains
covered. `StrictSuperset`, `Incomparable`, or `Unknown` atomically advances the
capability epoch and places the entire credential in
`CredentialCapabilityQuarantined`. Quarantine invalidates every handle and
queued instruction and forbids every provider operation—not merely privileged
ones—until reconciliation or an independently approved replacement completes.
It emits a security incident binding the protected raw-evidence reference and
digest, evaluator identity/version, comparison/explanation, and affected
admitted or in-flight executions. Vitheim never widens a profile automatically
to match observed authority, and break-glass cannot convert a quarantined
credential into ordinary authority.

The quarantine fence serializes with handle redemption and first credential
use. If quarantine wins before signing, TLS client authentication, bearer
serialization, or another credential operation, even already claimed work is
denied. If credential use linearizes first, only that bounded in-flight attempt
may exist and its ambiguous completion follows `OutcomeUnknown`; no further
operation may start. Stale/unverifiable snapshots and policy-revision mismatch
fail every operation and enter bounded reconciliation. Every observed
permission, role, group, or trust-chain change advances the local epoch and
invalidates stale receipts; restore cannot revive an older snapshot or clear
quarantine.

Quarantine has an evidence-backed owner state machine:
`CredentialCapabilityQuarantined` → `Investigating` →
`RemediationPending` → (`ReplacementVerified` | `RevalidationVerified`) →
`Resolved`. The credential-capability lineage is its sole authority owner.
Progress binds the incident, cause, affected executions, remediation actions,
and an authorized resolver who is separated from every actor that widened the
provider policy. `ReplacementVerified` proves a newly admitted credential;
`RevalidationVerified` proves the retained credential using the current active
evaluator, fresh authenticated provider evidence with a strong policy revision,
`Equal` or explicitly safe `StrictSubset`, current profile/account/credential/
broker/evaluator epochs, and the provider's required repeated observations or
consistency barrier. Incident closure is downstream evidence and cannot clear
credential quarantine. `VIT-INV-003` is the canonical ownership and
storage-capability record.

Resolution atomically creates a new never-reused local capability generation
and permanently tombstones all pre-resolution handles, receipts, queued
instructions, and effect authorizations. Every resumed effect requires fresh
authorization against that generation. Generic administrator flags, snapshot
rollback, break-glass, incident closure alone, partial re-evaluation, and restore
cannot skip or reverse a state. A failed, ambiguous, inconsistent, or
insufficient observation remains quarantined and returns to bounded
investigation/reconciliation.

Credential recovery uses a separate
`ProviderCredentialRemediationAuthority`, never the quarantined credential. It
is an independently admitted administrative credential or provider recovery
channel scoped only to credential inventory, creation, disablement, and
revocation. It has its own execution profile, credential lineage, approvals,
audit trail, epochs, destination policy, security-cleanup quota, and bounded
provider-outcome reconciliation. It cannot perform tenant business operations,
be derived or delegated from a quarantined credential, or be redeemed outside
`ProviderCredentialRotationState`/`TakeOverProviderCredentialRotation`. Its
compromise cannot unlock, resolve, or widen the quarantined business credential.
Provider-count exhaustion does not erase accounting: remediation must revoke or
obtain provider-evidenced recovery capacity before creation. A supported-
provider profile declares its independent recovery channel and residual risk;
if none exists, the rotation enters `ManualInterventionRequired` without
break-glass reuse of the quarantined credential. `VIT-INV-005` is its canonical
authority record; the bootstrap and loss-recovery ceremony is completed at
`0.18.5`.

Credential operations use one explicit `ProviderCredentialOperationProfile`.
`NonExportableSigning`, `NonExportableMtls`, and equivalent HSM-backed profiles
keep private key material behind the broker and expose only the bounded signing
or TLS operation. `BrokeredBearerTransmission` applies to bearer tokens and API
keys: the hardened credential broker itself performs authorization-header
serialization, redirect handling, TLS, and the provider socket write, and is
therefore part of the `TransmissionExecutor` TCB. Bearer material may exist
briefly in that broker's hardened process memory, but never in upstream workers,
Wasm guests, general connector code, RPC/IPC, queues, logs, diagnostics, or
durable state. If the broker is a separate process, it—not its caller—executes
`ClaimTransmissionStart` and owns the socket. A provider that requires exporting
credentials into a general connector process is `Unsupported`.

The profile also binds per-provider destination/port allowlists, strict TLS
identity, DNS rebinding protection, redirect policy, and network enforcement;
there is no general HTTP proxy or arbitrary-socket capability. Executor pools
are partitioned by tenant/account or a documented bounded trust domain whenever
provider credentials cannot be scoped narrowly enough. A privileged provider
profile that requires one unrestricted credential shared across unrelated
tenants is unsupported. Where a provider cannot issue request-level credentials,
the admission record documents the residual account-level blast radius,
compensating isolation, monitoring, rotation, and revocation. A compromised
executor still cannot redeem a handle or authenticate an unclaimed/substituted
request.

The opaque permit type has a sealed constructor, implements neither `Clone` nor
serialization, is consumed by value by the provider-write operation, and
best-effort zeroizes its memory on drop under the `0.28.3` process-memory
assurance profile. It is returned exactly once inside the claiming executor;
durable state stores only its digest and claim status. The digest is audit and
reconciliation evidence, never sufficient authorization. Every later call,
including same-claim replay, returns status and never another usable permit.
Transferable cryptographic start capabilities are unsupported for `1.0.0`; any
future profile requires a separate implementation milestone and production
decision covering entropy, keyed authentication, channel/audience binding,
constant-time verification, zeroization, and durable replay prevention, while
honestly dropping the literal non-cloneable claim.

The permit carries only the remaining bounded start interval; the adapter
enforces it with a monotonic elapsed-time source and cannot write the first
provider-request byte after it expires. If trustworthy remaining time cannot be
established, the claim fails closed. If delivery of the one returned permit or
the claim response is ambiguous, the effect enters `OutcomeUnknown`. A
replacement worker or stale lease holder that observes
`TransmissionStartClaimed` must reconcile and cannot transmit. A revocation or
epoch change that wins before this transition denies transmission; a change
after it is ordered after a narrowly bounded started attempt.
Duplicate instruction RPC, executor failover, or loss of the executor response
after claim never moves permit material to another process: the caller receives
status/unknown disposition and reconciliation owns the outcome.

If transmission is definitely not started before the bound, the receipt becomes
`DefinitelyNotStarted`; its consumed grant/exception attempt is never restored,
and continuing work requires a fresh authorized intent or redemption attempt.
If a crash, failover, cancellation, or lost local evidence makes it uncertain
whether any request byte was transmitted after the start claim, the effect
enters `OutcomeUnknown` and ordinary queue retry is forbidden. Restore cannot
extend a deadline, reset `redeemed_at`, replay a start permit, or convert
uncertainty into a definitely-not-started result. Persisted state, backup, or
restore cannot reconstruct live permit material from its digest. Wall-clock
rollback cannot lengthen the interval.

Quota accounting is an independent collection of state machines. Each effect
owns a bounded `QuotaClaimSet`; each `QuotaClaim` has an opaque reservation ID,
typed amount/unit, `QuotaKind`, settlement policy, and admission/lease/dispatch/
transmission/storage boundary. `QuotaReservationState` distinguishes
`Reserved`, `Consumed`, `HeldPendingOutcome`, `RefundEligible`, `Refunded`, and
`Released`. Required kinds and semantics are:

- `ConcurrencyLease`: release when the fenced local lease ends, independent of
  remote outcome;
- `ConsumableOperation`: consume at its declared admission/dispatch boundary and
  refund only under its declared evidence-backed policy;
- `ProviderRateToken`: release before transmission but become non-refundable
  once transmission begins;
- `EstimatedLiability`: remain charged/held for an unknown provider outcome and
  reconcile to evidence-backed actual cost, including explicit overage rather
  than capping it to the estimate, or a distinct administrative write-off; and
- `RetainedBytes`: follow verified local allocation and deletion, not remote
  outcome.

Quota ledgers and claim sets are local transactional authorities
(`VIT-INV-007`), like inbox/
outbox receipts and uniqueness claims, not additional aggregate streams. A
`QuotaClaimSetId` and canonical digest bind the complete canonically ordered set
of normalized unique resource keys and claim descriptors. Reservation acquires
overlapping resource keys in that canonical order (or an adapter-proven
equivalent serialization rule), commits all claims or none, and returns an
opaque `QuotaClaimSetToken`. A work bundle validates and transitions that exact
reserved set; it never reacquires members independently or adds, removes, or
reorders claims. Refund, release, settlement, and write-off transitions are
idempotent against set identity/digest, claim identity, and transition identity.
Restore and reconciliation verify the whole set and quarantine corruption or
absence; they never reconstruct, expose, or settle a partial set.

Every claim in an atomic set resides in the same local transactional quota
partition as its work bundle. A wider global or regional limit is represented
by a fenced hierarchical `QuotaCapacityLease` allocated to that partition in a
separate transaction; local claim sets consume only the leased slice and never
contact a parent partition during the work transaction. Lease identity, scope,
epoch, amount, expiry/reclamation, and parent accounting are integrity bound,
and aggregate child allocations cannot exceed parent capacity. A claim set
cannot consume an expired or superseded epoch, and a parent cannot reallocate
returned/expired capacity until fencing proves the prior child epoch unusable.
It never opens a cross-shard or cross-region distributed transaction. The `1.0.0`
topology supports one authoritative write region per transaction domain with
fenced failover, not active/active authoritative writes across regions;
incompatible claim-set placement fails capability negotiation.

Each `QuotaCapacityLease` binds exactly one `QuotaKind`, unit, accounting
period, settlement policy, parent/child partition, and fencing epoch. Expiry
prevents new reservations but never releases spent or encumbered capacity.
Parent reclamation is limited to the proven unreserved and unencumbered
remainder. Existing retained-byte, unknown-liability, charged-operation, spent-
rate-token, and other outstanding claims remain charged under their original
kind/boundary until admissible settlement, verified deletion, authorized write-
off, or a fenced encumbrance transfer to a successor partition. The transfer is
not a distributed exactly-once transaction. A durable outbox/inbox process
manager drives `QuotaCapacityTransferState` through `ReservedAtParent`,
`InTransit`, `ActivatedAtChild`, `Returning`, and `Reclaimed`, with
`ReconciliationRequired` as a fail-closed operational state. Every allocation
or encumbrance move binds a stable `QuotaCapacityTransferId`, source and
destination partition/lease epochs, kind/unit/period/settlement policy, amount,
canonical digest, monotonic sequence, and original claim/encumbrance lineage.
It also binds the tenant or global accounting owner, hierarchy root and parent-
lease identity, work class/recovery lane, capacity class (`Business`,
`Reconciliation`, `SecurityCleanup`, or `Emergency`), residency/region scope,
and source/destination authorization-decision identities. Ordinary transfer may
change only the admitted partition/lease location and epoch; it cannot
reclassify any bound accounting field. Existing leases, reservations, claims,
and encumbrances never change capacity class. Every runtime class transition is
invalid; in particular `Emergency` → `Business`, `SecurityCleanup` → `Business`,
and `Reconciliation` → `Business` are forbidden regardless of caller privilege.
There is no cross-class adjustment command for existing capacity.

Future class allocation changes use a separately governed, versioned
`QuotaCapacityPolicy` command over only proven unallocated parent capacity. It
never rewrites an existing lease, reservation, claim, transfer, or encumbrance.
Each policy lineage has exactly one authoritative owner stream and is scoped to
exactly one parent-capacity authority. Activation is one local transaction that
locks the policy-lineage head, current authority fences, independently governed
`QuotaProtectedFloorSet`, and co-located parent-capacity ledger; validates the
base policy epoch, parent-capacity epoch/high-watermark, exact allocation
deltas, simulation digest, and floor-set version; appends the policy event;
compare-and-swaps the parent ledger; records audit evidence; and creates any
outbox intents. The floor set has its own authoritative owner stream and
distinct `ManageQuotaProtectedFloors` capability. Its append-only history uses
never-reused monotonic epochs and cannot be rewritten by rollback or restore.
Every change rechecks current tenant, hierarchy, incident/emergency, and policy
fences and simulates impact against outstanding reconciliation, security-
cleanup, incident, emergency, and other protected obligations. A selected
production profile defines a non-configurable `PlatformSafetyFloor`; configured
floors can never fall below it. The floor has a stable profile ID, version,
canonical digest, and a canonical set of exact minima. Every minimum and durable
`PlatformSafetyFloorAdmission` ratchet entry is keyed by
`PlatformSafetyFloorKey`: accounting owner and hierarchy root, `QuotaKind`,
canonical unit and scale, accounting-period semantics, capacity class, recovery/
work lane, region/residency scope, and settlement-policy version. Each exact key
has a never-reused admission epoch/high-watermark. The effective floor is the
strictest applicable compiled profile, durable admitted minimum, and mixed-
version cluster profile for that same key; incomparable keys are never combined.

A node advertising any floor below the durable admitted minimum fails startup
and cannot lead, allocate, activate, or reconcile quota work. Rolling upgrades
use the stricter old/new profile until a coordinated activation durably admits
the new profile on every eligible authority node. Raising a floor beyond
immediately unallocated capacity enters a governed migration that conservatively
withholds new business allocation and reclaims capacity without violating
existing protected obligations. Software downgrade, rollback, or a newer binary
with a lower default never releases capacity or lowers the durable ratchet.
Backup, restore, and failover preserve the profile digest and high-watermark.
Lowering the durable platform minimum is not an ordinary configuration or floor-
governance operation and requires a future explicit security-design milestone.
Every profile migration provides a canonical total, conservation-preserving,
overflow-checked mapping from every old key to the complete new key set before
activation. Missing/duplicate keys, lossy or rounded unit/scale conversion,
incompatible period or settlement semantics, quota-kind/lane confusion, or
region/residency scope change fails startup and migration rather than silently
reducing protection.

A floor reduction requires its own quorum, risk owner, approval lineage, and
separation of duties, distinct from `ActivateQuotaCapacityPolicy`. It records a
`FloorReductionReceipt` binding old/new floors, released capacity, simulation,
obligations, fences, and epoch. Any policy activation that consumes capacity
released by that reduction must bind the receipt and prove cross-command
separation: no actor, approver, risk-owner identity, or approval lineage may
both lower the floor and authorize spending the released capacity. Policy
activation cannot define, lower, or version the floor against which it is
evaluated.

Policy activation requires control-plane authority, separation of duties,
minimum reconciliation/security/emergency reserve floors, bounded impact
simulation, and current tenant/principal/policy authority fences. Tenant-
triggered work cannot invoke it; replay binds every version and digest.
Multi-parent changes are explicitly non-atomic process-manager rollouts of
independent one-parent policies. A `QuotaCapacityRolloutRoot` has one
authoritative hierarchy-root owner and freezes a canonical parent-membership
manifest/digest: root ID and membership epoch; exact unique parent IDs,
generations, regions, capacity classes, and accounting periods; and total per-
class conservation constraints. Duplicate aliases or ambiguous parent identity
deny preparation. Parent creation, removal, reparenting, generation change, or
reclassification increments the root membership epoch and invalidates every
older manifest.

The root also owns a monotonic `ActiveRolloutGeneration`; exactly one rollout
generation may be active. Creating a successor atomically CAS-updates the root
and permanently supersedes its predecessor. Root cancellation before
finalization is a typed `CancelledBeforeFinalization` transition; supersession
after one or more parent activations is a distinct
`SupersededAfterPartialActivation` state with actual-parent-limit evidence.
Late preparation, finalization, or activation for a cancelled or superseded
generation fails closed.

Cancellation with no prepared parent may terminate the generation directly.
Once any parent has prepared, cancelling the old generation atomically creates
or selects exactly one root-owned `CancellationRecoveryGeneration` over the
complete unchanged manifest and the actual effective limit of every parent.
The cancelled generation is permanently non-active, and prepared parents retain
the conservative old/new intersection until that recovery successor activates
or an explicitly authorized later successor supersedes it. No parent
independently restores an old limit. Recovery preparation, activation, and
release recheck current ledger/high-watermark, floor ratchet/set, obligations,
root membership, active generation, and operational authority. Recovery
receipts are stable, idempotent, and restore-safe; late preparation from the
cancelled generation fails. A bounded operational deadline escalates every
cancelled/prepared parent that has not reached a terminal recovered or explicitly
owned reconciliation state.

Each manifest member first records an idempotent prepared receipt binding
rollout ID, manifest digest, exact parent identity/generation, old/new limits,
current parent epoch/high-watermark, floor profile and floor-set version,
protected-obligation digest, and authority fences, then applies the conservative
per-class intersection of old and new limits. Finalization compare-and-swaps the
root membership epoch and requires exactly one valid prepared receipt from every
canonical manifest member. Only then may the root owner record
`RolloutFinalized`; this is permission to attempt parent activation, not
authority to apply stale prepared values.

Each parent activation is a new local transaction that locks its `Prepared`
state; validates the finalized root generation and exact manifest digest;
validates that the rollout is still the root's `ActiveRolloutGeneration`;
revalidates the parent ledger epoch/high-watermark and proven unallocated
capacity; revalidates the current floor-set version, durable platform-floor
ratchet, and protected obligations; and rechecks current tenant, hierarchy,
incident/emergency, principal, and policy fences. It CAS-transitions
`Prepared` to `Activated` while applying only the current safe delta bounded by
the finalized target. Any drift leaves the conservative intersection in force
and records `ActivationBlocked` or `ReconciliationRequired`; it never applies
the stale delta. Coordinator failover cannot discover, omit, alias, or add
parents. Crash, cancellation, rollback, or blocked activation may reduce
availability but cannot transiently over-allocate. Rollback is a new monotonic
successor root rollout over the current canonical manifest and actual effective
limits of every parent, not independent parent rollback. It revalidates the
current parent, independently governed floor set, and durable platform-floor
ratchet. `ActivationBlocked` parents remain at the conservative intersection
until the active successor rollout or a newly authorized preparation resolves
them. Restore cannot reactivate a superseded generation.
The destination
acknowledgement principal must be authorized for that exact tenant, hierarchy,
parent lineage, lane, class, period, region, and destination epoch.
The parent reserves capacity before committing the outbox intent; the child
activates it idempotently with an inbox receipt. In-transit capacity is
unavailable at the parent. Return or reclamation requires an authenticated
acknowledgement plus proof that the old child epoch is fenced. Uncertain or
conflicting movement remains conservatively charged and enters reconciliation.
Double-entry conservation may temporarily charge both sides during recovery but
never permits the capacity to be free in both. Each local transition is exactly
once by stable receipt; message delivery is at least once. Failover cannot
recreate parent capacity while an old child encumbrance remains, and late
provider evidence settles the original claim and transfer lineage after lease
expiry or regional movement. Each parent-side reserve/send/reclaim transition
and child-side activate/return/acknowledge transition locks and rechecks its
current co-located tenant, source or destination principal, and
`QuotaCapacityPolicy` epochs. Historical authorization-decision IDs remain
evidence, never current authority. A suspended tenant, revoked policy/principal,
stale epoch, or failed reserve-floor check leaves capacity conservatively
charged and routes the transfer to reconciliation; it cannot fail open into
activation or reclaim.

All composite local transactions use one acquisition order: authoritative
stream head; authority-fence rows ordered by typed key; target-fence row;
remote-mutation-exception guard; grant redemption guard; quota-capacity lease
and quota resource keys in canonical order; uniqueness claims; then command/
inbox/timer/activity/attempt receipt rows. A transaction omits inapplicable
classes but never reorders them. Adapters retry only classified serialization/
deadlock failures, with a bounded policy and the same command/claim/transition
identities, input digests, expected versions, and fence epochs. Exhaustion is
visible and retryable by the caller/reconciler; retry never repeats provider I/O
or consumes a new exception/grant attempt or quota claim.

Only claims whose settlement policy depends on provider acceptance enter
`HeldPendingOutcome`; such a claim continues to count against its governed
limit. Pre-dispatch cancellation may release unconsumed claims, and admissible
`DefinitelyNotAccepted` evidence may make eligible claim kinds refundable
exactly once. Operator assessment cannot create refund eligibility.
Administrative write-off is a separately typed, authorized, audited adjustment
that never becomes provider evidence or rewrites `RemoteOutcome`. Compensation
uses a separate bounded claim set. Reconciliation and security-cleanup capacity
is partitioned by tenant and work class with per-tenant ceilings, global
fair-share scheduling, starvation bounds, and a strictly scoped audited
emergency reserve; tenant exhaustion cannot consume it, one tenant's unknown
outcomes cannot monopolize it, and it cannot admit new tenant business work.

Every capability sets a reconciliation deadline and escalation path. An
operator assessment may choose a safe local resolution or abandonment but
never creates a verified provider outcome. Unknown privileged or non-
compensable work is not blindly retried. Privileged resolution policy binds the
permitted principal kind, current authentication assurance, tenant/effect
scope, explicit resolution capability, reason, expiry, and required separation
of duties/quorum. Concurrent direct/callback/query evidence and manual
resolution use expected-version/fencing rules, retain both facts, and
deterministically reopen or supersede only the operational workflow; provider
evidence is never overwritten by an assessment.

## `0.11.0` — Semantic Event-Journal Interface

Status: planned.

Setup: define tenant-scoped stream kind/identity, expected version, atomic batch,
ordered range read, append receipt, one aggregate stream per transaction, and
explicit unsupported semantics. Cross-aggregate work uses versioned process-
manager decisions and transactional outbox messages, never multi-aggregate
mutation hidden behind the port.

Goal: make persistence requirements precise without generic CRUD.

Deliverables: project-owned `EventJournal` port, request/result types, contract
docs, and adapter conformance cases.

Verification: omitted tenant, empty/oversized batch, wrong expected version,
partial success, ordering ambiguity, and capability-negotiation tests pass.

Exit criteria: no compliant adapter can reinterpret atomicity or isolation.
`v0.11.0 implementation stop reached. Run pentest for this exact commit.`

## `0.12.0` — Deterministic In-Memory Journal

Status: planned.

Setup: choose bounded memory ownership, stream/partition indexing, failure
injection points, and deterministic allocation/exhaustion behavior.

Goal: provide the reference journal for tests and semantics.

Deliverables: in-memory adapter, state inspection fixture, injected failure
controls, and conformance-suite integration.

Verification: cross-stream/tenant isolation, stable ordering, bounded reads,
atomic rollback, restart snapshots, and randomized operation sequences pass.

Exit criteria: the adapter is a deterministic oracle, not a production claim.
`v0.12.0 implementation stop reached. Run pentest for this exact commit.`

## `0.13.0` — Expected-Version Concurrency

Status: planned.
<!-- vitheim-invariant VIT-INV-013 0.13.0 -->
<!-- vitheim-invariant VIT-INV-015 0.13.0 -->

Setup: define absent/exact/any version policy, conflict evidence, retry limits,
and command/idempotency interaction.

Goal: prevent lost updates and duplicated facts under concurrent writers.

Deliverables: compare-and-append semantics, conflict results, request-digest-bound
command receipts, race test harness, and stale-writer documentation. Normal
writes require `ExpectedVersion::Exact`; `Any` is restricted to authorized
recovery/import under an exclusive fenced lease.

Verification: two-writer interleavings, replayed commands, stale snapshots,
failed-retry nonmutation, and model-checked linearization cases pass.

Exit criteria: exactly one conflicting append wins with complete evidence.
`v0.13.0 implementation stop reached. Run pentest for this exact commit.`

## `0.14.0` — Snapshots And Validation

Status: planned.

Setup: define snapshot identity, stream/version binding, codec/schema version,
integrity metadata, size limits, original event-byte hash authority, pure
versioned upcasters, unknown-event quarantine, and rebuild fallback.

Goal: accelerate replay without letting snapshots become authority.

Deliverables: snapshot port/model, pure validation, memory adapter, golden
mixed-version event corpus, upcaster chain, and safe discard/rebuild behavior.

Verification: stale, future, forged, truncated, cross-stream/tenant, corrupted,
oversized, and schema-incompatible snapshots all fail safely.

Exit criteria: rejecting a snapshot always falls back to bounded event replay.
`v0.14.0 implementation stop reached. Run pentest for this exact commit.`

## `0.15.0` — Projection Engine And Checkpoints

Status: planned.

Setup: define projector identity/version, ordered input, atomic output/checkpoint,
rebuild namespace, consistency token, and poison policy.

Goal: create disposable read models without losing or duplicating facts.

Deliverables: projection runner, checkpoint port, memory read model, rebuild
command, and externally serializable consistency/read-your-write token plus
lag reporting.

Verification: duplicates, gaps, reorder, crash windows, corrupt checkpoints,
rebuild equivalence, tenant isolation, and bounded batch tests pass.

Exit criteria: projections can be erased and recreated exactly from authority.
`v0.15.0 implementation stop reached. Run pentest for this exact commit.`

## `0.15.1` — Security Audit Envelope And Durable Intent

Status: planned.
<!-- vitheim-invariant VIT-INV-014 0.15.1 -->

Setup: define canonical bounded security-audit facts and authoritative intents
before transactional mutation exists. Separate successful domain-event facts
from attempted/authorized/denied/rejected security actions; bind tenant, actor,
remote actor assertions, authentication assurance, purpose, policy/version,
resource/action/field class, command/request digest, result, correlation/
causation, time, classification, and idempotency. Define the mandatory-audit
action registry and safe metadata rules from `0.8.1`.

Goal: make required audit evidence part of the commit protocol rather than a
best-effort write to a later sink.

Deliverables: `SecurityAuditFact`, `SecurityAuditIntent`, audit/rejection receipt
models, canonical codec, redaction/classification rules, atomic commit contract,
memory authority, and fixtures for successful and denied operations.

Verification: missing/mismatched tenant/actor/policy/result, forged attribution,
duplicate rejection, command/audit digest mismatch, secret/payload injection,
classification downgrade, oversized facts, crash points, canonical round trips,
property tests, and fuzzing pass.

Exit criteria: every operation classified as mandatory-audit has a bounded
authoritative audit intent that can commit atomically with its outcome.
`v0.15.1 implementation stop reached. Run pentest for this exact commit.`

## `0.16.0` — Transactional Outbox Model

Status: planned.
<!-- vitheim-law VIT-LAW-001 0.16.0 -->
<!-- vitheim-invariant VIT-INV-016 0.16.0 -->
<!-- vitheim-invariant VIT-INV-019 0.16.0 -->
<!-- vitheim-invariant VIT-INV-021 0.16.0 -->
<!-- vitheim-invariant VIT-INV-022 0.16.0 -->
<!-- vitheim-invariant VIT-INV-023 0.16.0 -->

Setup: bind exact-version CAS, consecutive events, stream head, request-digest
receipt, authoritative `0.15.1` audit intent, outbox entries, integrity links,
authority-owned uniqueness indexes, destination, payload version, attempt
policy, stable external `EffectId`/request digest, and one database transaction.
Each effect intent records its capability declaration, initial
`EffectExecutionState::Pending`, empty remote outcome, resolution deadline, and
immutable authorization binding and freshness profile before dispatch. The
binding covers tenant, initiating subject, delegation chain/version, capability,
exact target identity/version/digest, purpose, request digest, policy decision/
version, authentication assurance/expiry, and selected
`EffectExecutionAuthority`. A remote-mutating intent additionally binds its
`RemoteTargetConcurrencyProfile`; conditional mode freezes provider/account/
resource, validator kind/bytes/strength/provenance/observation time, admitted
provider capability/version, request digest, and idempotency key.
`UnconditionalReviewed` additionally freezes the exact
`RemoteMutationExceptionId`, scope digest, owner generation, policy/provider-
capability epochs, and attempt ceiling; it is never an unguarded boolean.
Denied/rejected commands atomically
commit their idempotent outcome plus audit fact but no domain events, stream
advance, business outbox, or state effect.
Outbox routing contains protected references rather than pre-rendered sensitive
bodies and cannot copy fields forbidden by the `0.8.1` lifecycle.

Goal: prevent committed business facts from losing required asynchronous work
or mandatory audit evidence.

Deliverables: outbox semantic types/port, separate external-effect execution,
remote-outcome, resolution-source/evidence, operational-resolution, and
compensation types, command-commit unit including audit authority, atomic
memory implementation, dispatcher claim/ack protocol, outcome query/
reconciliation port, authorization-binding/freshness types, dispatch-
authorization and durable execution-grant receipt contracts, remote-target
concurrency descriptor/outcome contract, remote-mutation-exception reference/
scope binding, and failure fixtures.

Verification: fail before/during/after every event/receipt/audit/outbox write,
successful mutation without audit, denied mutation with domain events, duplicate
dispatch/audit, crash before ack, provider acceptance followed by lost response,
idempotency-key expiry/scope mismatch, execution state presented as remote
outcome, forged remote outcome, operator assessment presented as verified
provider evidence, forged resolution source, stale policy/delegation/
authentication binding, expired/replayed/substituted execution grant, offline-
human impersonation, target or request substitution, remote validator/account/
resource substitution, weak/strong confusion, ABA deletion/recreation, provider
conditional-capability downgrade, ignored conditional header, unsafe validator
refresh, precondition failure misclassified as retry, response loss misclassified
as non-acceptance, missing/substituted/reused unconditional-exception ID or scope,
lease-holder confused
deputy, poison payload, tenant routing, and rollback pass.

Exit criteria: no successful protected mutation exists without its authoritative
audit intent, no rejected mutation produces business state or effects, and
transport acknowledgement is never represented as a known provider outcome.
No effect can exist without a complete immutable commit-time authorization
binding, typed execution authority, and explicit freshness profile.
`v0.16.0 implementation stop reached. Run pentest for this exact commit.`

## `0.16.1` — Atomic Command Commit Bundle

Status: planned.
<!-- vitheim-law VIT-LAW-005 0.16.1 -->
<!-- vitheim-invariant VIT-INV-012 0.16.1 -->

Setup: freeze one project-owned `AtomicCommandCommitBundle` containing tenant
and aggregate stream, exact expected stream version, consecutive domain events,
command or rejection receipt, mandatory audit intent, business outbox entries,
integrity/commit digest, and authority-owned uniqueness claims. Define
successful, denied, rejected, and no-op variants without optional omission of
mandatory fields. Bind the canonical audit-intent and receipt digests into the
commitment. Quota reservation semantics are deliberately not frozen before
`0.18.1`; `0.18.2` adds the typed consumed reservation to the final work-commit
family.

Goal: give command handling one indivisible correctness contract rather than a
collection of individually transactional ports.

Deliverables: bounded bundle types and canonical codec, semantic validation,
atomic memory implementation, capability identifier/version, commit receipt,
failure-injection matrix, and denial-only integrity sequence. A denied or
rejected operation advances no domain stream, but its receipt and audit fact
enter a tenant-scoped hash-linked sequence with externally anchorable
checkpoints.

Verification: omit, duplicate, reorder, substitute, or cross-bind every bundle
component; fail before and after each persistence step; reuse uniqueness
claims; mismatch request/audit/receipt/commit digests; delete or splice denial
evidence; race exact-version writers; and verify rollback, recovery,
canonicalization, model, and property cases pass.

Exit criteria: an adapter can either commit the complete negotiated bundle
atomically or report the capability unsupported; it cannot claim success with
a weakened subset. Consumer, timer, activity, and poison transitions are not
claimed by this command variant. `v0.16.1 implementation stop reached. Run pentest for this exact commit.`

## `0.17.0` — Inbox And Idempotent Consumers

Status: planned.
<!-- vitheim-invariant VIT-INV-017 0.17.0 -->

Setup: define message identity, source/destination scope, receipt lifetime,
effect transaction boundary, duplicate response, and replay audit.

Goal: make at-least-once delivery safe without claiming global exactly-once.

Deliverables: inbox port, consumer wrapper, memory implementation, duplicate
receipt query, and recovery fixtures.

Verification: concurrent duplicates, crash windows, forged IDs, cross-tenant
receipts, expired/replayed messages, and atomic effect tests pass.
Expiry cannot re-enable non-idempotent work unless the upstream replay horizon
is independently bounded. The same command ID and digest returns the stored
outcome; the same ID with a different digest is a conflict without side effects.

Exit criteria: retries cannot repeat the local protected commit or hide
duplicates; possible remote duplication remains governed by the external-effect
outcome contract.
`v0.17.0 implementation stop reached. Run pentest for this exact commit.`

## `0.17.1` — Atomic Consumer Commit Bundle

Status: planned.

Setup: define `AtomicConsumerCommitBundle` with tenant/source/destination,
inbound message identity and payload digest, inbox receipt and stored duplicate
outcome, at most one authoritative aggregate stream and its exact expected
version, consecutive emitted domain events,
mandatory audit intent, business outbox entries, integrity/commit digest, and
authority-owned uniqueness claims. The inbox receipt, all emitted effects, and
their evidence share one database transaction; unsupported cross-aggregate
effects remain outbox-driven process-manager messages rather than hidden multi-
stream writes. Emitted effects are local durable effects only; external calls
consume the committed outbox later and their results arrive in a new bundle.

Goal: close the crash window between applying a consumer effect and recording
that its inbound message was consumed.

Deliverables: bounded consumer bundle and codec, semantic validation, atomic
memory implementation, duplicate-response behavior, capability version,
crash-point model, and inbox-plus-effect conformance fixtures.

Verification: crash or fail before/after each receipt/event/audit/outbox/
integrity/uniqueness component, redeliver concurrently, reuse message ID with a
different digest, mix tenant/source/destination, emit effects without a receipt,
store a receipt without effects, split multi-aggregate work, and verify exact
rollback, replay, model, and property cases pass. A harness that attempts a
network/provider call inside the transaction is rejected.

Exit criteria: a consumer either commits its receipt and complete emitted
effect bundle once or commits neither; redelivery returns the bound prior
outcome and cannot repeat the local protected commit. Remote execution may
still be duplicated and must use the stable effect identity and reconciliation
contract. `v0.17.1 implementation stop reached. Run pentest for this exact commit.`

## `0.18.0` — Leases, Timers, And Scheduler Primitives

Status: planned.
<!-- vitheim-invariant VIT-INV-018 0.18.0 -->

Setup: specify logical/host time boundary, lease token/fencing, renewal/expiry,
timer identity, retry/backoff limits, jitter injection, and quotas.

Goal: coordinate bounded background work without double ownership.

Deliverables: lease/scheduler ports, memory implementation, fencing tokens,
deterministic clock testkit, and poison escalation.

Verification: clock jumps, lease loss, stale holder, concurrent acquisition,
retry storms, overflow, cancellation, and model interleavings pass.

Exit criteria: expired or unfenced workers cannot commit protected work.
`v0.18.0 implementation stop reached. Run pentest for this exact commit.`

## `0.18.1` — Durable Quota Accounting

Status: planned.
<!-- vitheim-invariant VIT-INV-007 0.18.1 -->
<!-- vitheim-invariant VIT-INV-024 0.18.1 -->
<!-- vitheim-invariant VIT-INV-025 0.18.1 -->
<!-- vitheim-invariant VIT-INV-026 0.18.1 -->
<!-- vitheim-invariant VIT-INV-029 0.18.1 -->
<!-- vitheim-invariant VIT-INV-030 0.18.1 -->
<!-- vitheim-invariant VIT-INV-031 0.18.1 -->
<!-- vitheim-invariant VIT-INV-043 0.18.1 -->
<!-- vitheim-invariant VIT-INV-044 0.18.1 -->
<!-- vitheim-invariant VIT-INV-045 0.18.1 -->
<!-- vitheim-law VIT-LAW-002 0.18.1 -->
<!-- vitheim-law VIT-LAW-003 0.18.1 -->

Setup: define tenant/resource quota identity, opaque `QuotaReservationId`,
reservation digest, `QuotaClaimSetId`, opaque `QuotaClaimSetToken`, canonical
set digest/order, bounded `QuotaClaimSet`, `QuotaKind`, settlement policy, typed
amount/unit, `QuotaReservationState`, and per-claim admission/lease/dispatch/
transmission/storage boundary. Quota state is local transactional authority, not
an aggregate stream. Define all-or-none reservation, canonical deadlock-free
overlap acquisition, exact-set token consumption, immutable membership, atomic
consume/hold/refund/release/settle, concurrent-use leases, retry/idempotency
binding at set and claim level, fairness, reconciliation, overflow behavior, and
separately typed administrator adjustment/write-off evidence. Concurrency claims
release with the local lease;
provider rate tokens are non-refundable after transmission; consumable
operations follow declared evidence rules; estimated liabilities hold and
settle to actual cost/overage or audited write-off; retained-byte claims follow
verified local allocation/deletion. Only provider-dependent claim kinds use
`HeldPendingOutcome`. Compensation has a distinct bounded claim set.
Require every set and consuming work bundle to share one transactional quota
partition. Define hierarchical global/regional capacity leases, fencing,
allocation/reclamation, and parent-versus-child conservation so wider limits
are leased into local partitions before reservation rather than consulted
through a distributed transaction. Bind each lease to one quota kind/unit/
accounting period/settlement policy. Model unreserved remainder separately from
reserved, spent, and encumbered capacity; expiry stops admission but preserves
outstanding claims. Define the receipt-driven `QuotaCapacityTransferState`
process manager (`ReservedAtParent` → `InTransit` → `ActivatedAtChild` →
`Returning` → `Reclaimed`, or fail closed to `ReconciliationRequired`) for
allocation and encumbrance movement across partition loss, failover, and
regional movement. Bind stable transfer identity, source/destination epochs,
digest, sequence, original claim/encumbrance lineage, tenant/global accounting
owner, hierarchy root, parent lease, work class/recovery lane, capacity class,
period/settlement policy, residency/region, and source/destination authorization
decisions. Freeze those accounting bindings across every existing lease,
reservation, claim, transfer, and encumbrance; no runtime class transition or
adjustment exists. Define versioned `QuotaCapacityPolicy` changes for future
unallocated parent capacity only, with control-plane-only invocation, separation
of duties, current authority fences, minimum protected-class floors, bounded
impact simulation, replay binding, and monotonic policy epochs. Give each policy
lineage one owner stream and exactly one parent-capacity authority. Activation
atomically appends that lineage event, compare-and-swaps the co-located parent
ledger using its epoch/high-watermark, validates exact allocation deltas and the
simulation digest against an independently governed
`QuotaProtectedFloorSet` version, records audit evidence, and creates outbox
intents. The floor set has a distinct one-owner lineage,
`ManageQuotaProtectedFloors` capability, quorum/approval lifecycle, current
tenant/hierarchy/incident/emergency/policy fences, obligation-aware simulation,
append-only epochs, and a non-configurable versioned/digested platform-minimum
profile. Key every minimum and durable admission epoch/high-watermark by exact
accounting owner/root, quota kind, canonical unit/scale, period semantics, class/
lane, region/residency, and settlement-policy version. Nodes below that ratchet
reject startup; mixed-version operation uses the stricter same-key profile,
raising or changing its key set requires a total conservation-preserving,
overflow-checked migration, and downgrade/rollback cannot release capacity. A
reduction emits a `FloorReductionReceipt`; policy spending
newly released capacity binds it and proves actor/approver/risk-owner/approval-
lineage separation from the reduction.
Model multi-parent changes as process-manager rollouts of independent commands
under one root-owned `QuotaCapacityRolloutRoot` manifest. The canonical digest
binds membership epoch, every unique parent ID/generation/region/class/period,
total conservation constraints, and one monotonic `ActiveRolloutGeneration`.
Successor creation atomically supersedes the predecessor. Cancellation before
any preparation terminates directly. Cancellation after preparation atomically
creates one `CancellationRecoveryGeneration` over the complete manifest and
actual parent limits; no parent restores independently, prepared parents remain
conservative, recovery receipts are idempotent/restore-safe, and overdue recovery
escalates. Each parent prepares the conservative per-class intersection and a
receipt bound to rollout plus manifest. Finalization
CAS-validates the unchanged root epoch and exactly one receipt for every
manifest member. Finalization permits but does not authorize activation: each
parent locks `Prepared`, validates the finalized root generation/manifest, and
freshly CAS-rechecks its ledger epoch/high-watermark/unallocated capacity, floor
profile/set, protected obligations, and tenant/hierarchy/incident/emergency/
principal/policy fences. Drift records `ActivationBlocked` or
`ReconciliationRequired` under the conservative intersection instead of
applying stale limits.
Creation, removal, reparenting, generation change, or aliases cannot be omitted
or discovered by the coordinator. Parent activation also rechecks the currently
active root generation. Rollback is a complete successor root rollout over the
current manifest and actual parent limits, never an independent parent version
or epoch reuse. Cancellation before finalization and supersession after partial
activation are distinct typed states; late superseded messages and restored
receipts fail closed. Recovery transitions recheck current ledger, floors,
obligations, manifest, active generation, and operational authority. Require exact-destination-hierarchy
authorization for acknowledgement and current local tenant/principal/policy
epoch checks at every delayed transition. Require parent reserve before outbox,
idempotent child inbox activation, conservative in-transit
charging, authenticated acknowledgement plus old-epoch fencing before reclaim,
and double-entry conservation that may temporarily overcharge but never frees
capacity in both partitions. Local receipt transitions are exactly once;
delivery is at least once and late settlement retains original transfer lineage.
Partition reconciliation/security-cleanup capacity by tenant/work class with
ceilings, global fair-share/starvation bounds, and a strictly scoped emergency
reserve. The bounded claim-set representation is finalized into work bundles
only at `0.18.2`, after these semantics exist.

Goal: make resource limits durable correctness controls rather than process-local
counters.

Deliverables: project-owned quota ledger/reservation port and per-kind state
machines, canonical claim-set codec/digest/token and ordering law, all-or-none
reservation protocol, bounded claim-set/amount/unit types, capability settlement
policies, exact-set evidence-bound refund/release/actual-cost settlement
commands, distinct administrative adjustment/write-off command, whole-set
restore/quarantine rules, transaction-domain placement contract, hierarchical
capacity-lease state machine/conservation model, per-kind encumbrance ledger,
capacity-transfer ID/codec/state machine, allocation/encumbrance outbox and inbox
commands/receipts, authenticated acknowledgement and old-epoch-fence proof,
immutable accounting-hierarchy/classification binding, structural no-
reclassification matrix, versioned unallocated-parent `QuotaCapacityPolicy`
lineage/state machine, parent-ledger CAS and high-watermark contract,
independently governed protected-floor owner/history/capability, floor-reduction
receipt/cross-command separation guard, platform-safety-floor and obligation-
simulation contract, platform-floor profile/admission/ratchet and governed-
migration state machine plus `PlatformSafetyFloorKey` codec and total key-set
mapping law, multi-parent hierarchy-root manifest/epoch/conservation/
`ActiveRolloutGeneration` codec and conservative-rollout process manager with
cancelled/superseded/prepared/finalized/activation-blocked/reconciliation
receipts, `CancellationRecoveryGeneration`, idempotent recovery receipts and
deadline escalation, successor rollback, and local activation CAS,
delayed-transition authority-fence contract, double-entry
conservation oracle, late-settlement lineage mapping, partitioned fair control-
plane capacity, deterministic memory adapter, recovery reconciler, leak/
escalation monitor, and contention model.

Verification: concurrent oversubscription, crash after reserve/use/refund,
duplicate retry and refund, cancel/dispatch/refund races, indefinite held-
reservation leak and escalation, concurrency release while provider outcome is
unknown, rate-token refund after transmission, estimated-to-actual settlement,
underestimated-cost overage, retained-byte deletion accounting, mixed multi-
claim atomicity, concurrent overlapping sets, reversed-order deadlock/livelock,
partial-reservation crash, immutable-membership add/remove/reorder substitution,
token/digest mismatch, claim-set bound overflow, duplicate set/claim settlement,
partial/corrupt set restore and reconciliation, cross-partition set rejection,
parent/child capacity over-allocation, stale/expired lease epoch, lease
reclamation race, expiry with retained bytes, unknown liabilities, charged
operations, and spent provider-rate tokens, child-partition loss, late provider
settlement against an expired/transferred lease, duplicate encumbrance transfer,
every crash point and message duplicate/reorder, lost acknowledgement, source
or destination failover, stale source/destination epoch, conflicting transfer,
in-transit uncertainty, double-entry recovery overcharge and forbidden free-at-
both-sides state, parent reclamation racing failover, failover allocation
duplication, cross-tenant/global-owner, hierarchy-root, parent-lease, accounting-
period, work-class/recovery-lane, capacity-class, residency/region, destination-
authorization, and acknowledgement-principal substitution; emergency/security-
cleanup-to-business reclassification; cross-class movement through ordinary
transfer or adjustment; existing-lease/claim/encumbrance class rewrite; tenant-
invoked policy change; stale tenant/source/destination-principal/policy epoch at
reserve, activate, return, acknowledge, or reclaim; tenant suspension or policy
revocation during delivery; reserve-floor violation; policy/simulation replay;
two policies for one parent; non-co-located policy owner/parent ledger; stale
base-policy or parent-capacity epoch/high-watermark; concurrent allocation;
exact-delta or simulation substitution; policy lowering its own floor; floor-
set update racing activation; crash after any activation component; partial
multi-parent rollout; omitted parent; concurrent parent add/remove/reparent/
generation change; duplicate/aliased parent identity; stale root manifest or
membership epoch; incorrect per-class total; missing/forged/stale prepared or
finalization receipt; parent epoch change before finalization; coordinator
failover; parent activation under a different manifest; allocation, reclamation,
floor increase, new protected obligation/incident, tenant suspension, principal
revocation, policy supersession, or parent failover after root finalization but
before activation; stale prepared ledger/floor/obligation/fence state; floor
reduction followed by policy activation from the same actor, approver, risk
owner, or approval lineage; floor capability/approval substitution; stale
tenant/hierarchy/incident/emergency/policy fence; outstanding protected
obligation; platform-minimum violation; profile ID/version/digest substitution;
node startup below the admitted minimum; mixed-version rolling upgrade,
downgrade/rollback to a lower compiled floor, conflicting floor profiles,
higher-floor capacity migration, lower software default, backup/restore of the
floor ratchet; accounting-owner/root/quota-kind/unit/scale/period/class/lane/
region/residency/settlement-policy key substitution, omitted or duplicate key,
lossy/rounded conversion, arithmetic overflow, daily-versus-hourly period,
region relocation, incomplete key-set migration; concurrent floor changes;
floor-history rollback/restore;
rollback epoch reuse; restore of an old policy, parent ledger, floor set, or
rollout step; concurrent root rollout creation, cancellation/finalization race,
cancel before any preparation; cancel after each preparation point; lose or
duplicate cancellation/recovery delivery; leave cancelled prepared parents
past the escalation deadline; independently restore an old parent limit; drift
parent ledger/floor/obligations/authority during recovery;
partial activation followed by rollback, delayed predecessor preparation/
finalization/activation after successor creation, active-generation
substitution, blocked-parent recovery, coordinator failover during supersession,
restore of superseded receipts; late evidence against original claim/transfer lineage; accidental
cross-shard/cross-region transaction, incompatible active/active write topology,
provider-outage exhaustion, one-tenant reconciliation monopolization, tenant
attempts to consume emergency reserve, global/per-tenant starvation, lease loss,
integer overflow, forged refund/provider evidence, write-off misrepresented as
provider refund, cross-tenant accounting, separate compensation accounting, and
reconciliation tests pass.

Exit criteria: admitted work cannot exceed a durable quota through concurrency
or retry; every claim kind settles at its documented boundary without treating
all unknown outcomes alike; administrative adjustment remains visibly distinct
from provider evidence; all-or-none exact-set linearization is deterministic,
deadlock-free, recoverable only as a whole, and local to one transactional quota
partition; wider limits conserve capacity through fenced hierarchical leases
without distributed work transactions or reclaiming live encumbrances; late
evidence and receipt-idempotent, at-least-once-delivered transfer processing
preserve the original per-kind charge and never make capacity free at both
ends or change owner, hierarchy, period, lane, capacity class, residency, or
authorization lineage. Existing capacity can never change class; only future
unallocated parent capacity may be resized by a fenced, simulated, separation-
of-duties policy change. Each one-parent lineage atomically changes its co-
located parent ledger under the independently governed current floor set. Multi-
parent rollout authenticates a complete root-owned membership manifest and can
under-allocate but cannot omit a parent or transiently over-allocate. Root
finalization never authorizes stale parent state: every parent activation
freshly CAS-revalidates its ledger, floor ratchet/set, obligations, root
generation/manifest and currently active rollout generation, and operational
authority or remains conservatively blocked/reconciling. Rollback and
supersession are complete successor root rollouts over actual parent limits;
late or restored predecessor messages cannot reactivate them. Cancellation
before preparation terminates directly; cancellation after any preparation
creates one complete recovery successor, keeps every prepared parent
conservative, forbids independent restoration, uses idempotent restore-safe
receipts and current-authority rechecks, and escalates overdue recovery. Floor
reduction has separate authority, append-only
history, current operational fences, obligation simulation, a durable versioned
platform-minimum ratchet keyed by the full accounting/kind/unit/period/class/
lane/region/settlement scope, and cross-command separation from spending
released capacity. Mixed-version deployment, key-set migration, rollback, and
restore cannot compare incompatible capacity, lower that ratchet, or release
capacity. Every delayed transfer transition rechecks current
local authority; and
exhausted or abusive tenants cannot block fair bounded reconciliation or
security cleanup.
`v0.18.1 implementation stop reached. Run pentest for this exact commit.`

## `0.18.2` — Atomic Timer, Activity, And Work Commit Family

Status: planned.
<!-- vitheim-invariant VIT-INV-001 0.18.2 -->
<!-- vitheim-invariant VIT-INV-002 0.18.2 -->
<!-- vitheim-invariant VIT-INV-003 0.18.2 -->
<!-- vitheim-invariant VIT-INV-004 0.18.2 -->
<!-- vitheim-invariant VIT-INV-005 0.18.2 -->
<!-- vitheim-invariant VIT-INV-006 0.18.2 -->
<!-- vitheim-invariant VIT-INV-053 0.18.2 -->
<!-- vitheim-invariant VIT-INV-054 0.18.2 -->
<!-- vitheim-invariant VIT-INV-055 0.18.2 -->
<!-- vitheim-law VIT-LAW-006 0.18.2 -->
<!-- vitheim-invariant VIT-INV-020 0.18.2 -->
<!-- vitheim-invariant VIT-INV-028 0.18.2 -->

Setup: finalize a discriminated `AtomicWorkCommitBundle` family for command
(`0.16.1`), consumer (`0.17.1`), scheduled timer, workflow activity completion,
and poison/dead-letter transitions. Every applicable variant binds tenant,
work/message/timer/activity identity and input digest, current fencing token,
at most one authoritative aggregate stream and its exact expected version,
events, command/inbox/timer/activity receipt,
mandatory audit intent, outbox, integrity commitment, uniqueness claims, and
the exact pre-reserved `0.18.1` quota claim-set token/digest and applicable per-
claim transitions. Quota records remain co-transactional local authority, not
additional aggregate streams; a bundle never reacquires set members. Every
dispatch variant binds and atomically validates its bounded
`DispatchAuthorityFenceSet` and, where current target state matters, its typed
`DispatchTargetFence`. A same-aggregate target uses the bundle expected version
and digest; a different local target uses the authoritative target-fence row
updated beside target events. Remote, cross-shard, or projection-only current-
target semantics fail capability negotiation. Every variant uses the platform-
wide stream-head, authority-fence, target-fence, remote-mutation-exception-
guard, grant-guard, quota-key, uniqueness-claim, then receipt acquisition order
and bounded identity-preserving deadlock retry policy. Cross-aggregate
continuation is an outbox-driven process-manager decision. Timer
dispatch atomically records
the due/fenced dispatch transition and its outbox work intent; timer or remote
work completion is a separate later activity-result/consumer transition that
atomically records its own result receipt and local effects. Fence validation
and poison/dead-letter movement occur with their respective local effects.
Finalize the generic external-effect state transitions, attempt evidence, status
queries, typed remote outcomes, resolution evidence/source, reconciliation
workflow, deadlines/escalation, late-evidence conflict handling, privileged-
resolver authorization, and authorized/manual resolution commands. A resolution
command changes operational state; without admissible provider evidence it
cannot manufacture or replace `RemoteOutcome`.
Finalize the separate remote-target concurrency contract: local target-fence
validation remains unavailable for provider-owned state, while a
`ConditionalMutation` dispatch must send the exact immutable strong validator
through the admitted provider mechanism. A typed precondition failure records
evidence-backed `RemoteOutcome::DefinitelyNotAccepted` and does not refresh or
retry. Any changed
validator creates a new authorized intent. `UnconditionalReviewed` is available
only with the exact one-owner `RemoteMutationException` and its co-located
guard. The dispatch bundle validates scope/time/policy/provider-capability
epochs and atomically compare-and-claims a stable exception attempt without
advancing the exception stream. Revocation, expiry, supersession, provider-
capability change, and final-attempt use serialize on the guard; retry reuses
the receipt. Unsupported, downgraded, ignored, or weak conditional semantics
deny privileged/destructive/containment dispatch. Ambiguous post-transmission
loss remains `OutcomeUnknown`.
Finalize authorization freshness, execution-authority redemption, and quota
disposition in the same state family. Intent creation always requires commit-
time authorization. For a `CommitAndDispatch` capability, dispatch atomically
validates the immutable authorization/request/target bindings and redeems
`LiveSubjectAuthority`, `ApprovedExecutionGrant`, or
`ServicePrincipalAuthority` under its exact current rules before recording a
single-use fenced dispatch-authorization receipt. A failed redemption records
denial/cancellation and performs no remote call. Each claim transition occurs
atomically at its own declared boundary; remote unknown outcomes hold only the
provider-dependent claim kinds. Refund/release/actual-cost settlement requires
the exact eligible evidence and an idempotent ledger transition. Compensation
binds its own authorization decision, effect identity, and bounded claim set.
The receipt also records the exact `DispatchTransmissionWindow`, including
`redeemed_at`, derived `transmit_before`, effect/attempt, permitted service
audience, provider/account/request digest, and admitted authority/target/
exception/provider-capability versions plus profile/account/credential/broker-
policy and credential-capability epochs. Immediately before adapter I/O, a
separate local `ClaimTransmissionStart` transition rechecks current fences and
guards, uses authoritative transaction time, and CAS-binds one globally unique
`TransmissionStartClaimId` to the exact authenticated worker instance, work-
lease generation/fencing token, receipt/effect attempt, permitted service
audience, and permit digest. Opaque permit material is returned only on the
successful first claim inside the trusted `TransmissionExecutor` that also owns
the provider socket, and is never persisted or transported across RPC/IPC/
queues; same-claim replay returns status. Upstream workers submit immutable
authenticated instructions only. The executor's bound
`ProviderExecutionProfile` denies master-key/general database authority, uses
tenant/provider/account-scoped opaque secret handles, binds credential
redemption to the exact claim/tenant/account/action/request/destination, and
enforces provider destination/TLS/DNS/redirect policy without a general proxy.
The profile's one authoritative lineage supplies the exact active generation,
never-reused profile epoch, provider-account lifecycle epoch, credential-
lineage/version epoch, and broker-policy epoch. The start claim and handle
redemption lock/recheck them; profile/account suspension or revocation, atomic
local credential-generation activation, and broker-policy change make stale
instructions/handles
non-redeemable. Revocation before redemption denies, while redemption first
admits only the existing bounded attempt. Restore cannot roll back any epoch.
Profile proposal, approval, activation, suspension, revocation, and supersession
are separate typed control-plane commands. Signed implementation admission,
exact digest, semantic expansion classification, risk ownership, quorum/
separation of duties, current activation fences, and a pre-activation revocation
tombstone guard every active-generation/epoch update; emergency revocation
cannot activate a replacement.
Remote credential rotation runs through typed provisioning, verification,
local-activation, old-revocation-pending, completion, unknown, and intervention
states. Only local activation is atomic: it advances the credential epoch and
permanently disables predecessor redemption. Provider creation/revocation
response loss reconciles as unknown, old identity/evidence remains until
confirmed revocation, overlap has a deadline, and single-credential providers
use an explicit maintenance profile.
Each credential lineage owns a co-located single-non-terminal-rotation guard,
stable rotation ID, intended successor generation, provisioning idempotency key/
request digest, provider-count quota encumbrance, and typed orphan-credential
state. Unknown rotations block ordinary successors. An authorized takeover
inventories provider credentials; late callbacks must match the current
generation and digest; orphan discovery/quarantine/revocation is bounded and
never makes an orphan redeemable. Local state advancement and successor
activation use one lineage-owner transaction, not two aggregate streams.
The current versioned `ProviderCredentialCapabilitySnapshot` and monotonic local
capability epoch bind observed effective permissions, role/group/trust
provenance, provider policy validator, freshness, profile, and credential
generation. A separate reconciler updates it; every credential operation fails
closed on stale, unverifiable, semantically unknown, or policy-revision-
mismatched state without remote discovery in the dispatch transaction.
Its reviewed versioned provider evaluator returns exactly `Equal`,
`StrictSubset`, `StrictSuperset`, `Incomparable`, or `Unknown`, and binds raw-
evidence/normalized-AST/evaluator/policy-language/result/explanation digests and
versions. Its authoritative `ProviderPermissionEvaluatorLineage`, signed binary/
corpus admission, current generation, and never-reused evaluator epoch govern
activation and emergency revocation. Older results become
`ReevaluationRequired`; nodes unable to validate the active evaluator reject
startup. Only equal or an explicitly admitted safe subset can operate.
Superset, incomparable, or unknown quarantines the whole credential, advances
the capability epoch, invalidates all handles/queued work, emits a security
incident, and cannot be bypassed by automatic profile widening or break-glass.
Its owned investigation/remediation/replacement-or-revalidation/resolution
state machine accepts only current-evaluator, strong-revision, current-epoch,
consistency-barrier, separated-resolver evidence, then creates a new capability
generation without reviving prior work. Rotation/takeover may recover through
only an independently admitted, cleanup-only
`ProviderCredentialRemediationAuthority`; absent such a provider path, it
requires manual intervention rather than quarantined-credential reuse.
The admitted `ProviderCredentialOperationProfile` is non-exportable signing/
mTLS/HSM operation, brokered bearer transmission, or unsupported. For bearer/
API-key work, the hardened broker is part of the executor TCB and owns header
serialization, redirects, TLS, claim, and socket; bearer bytes may exist only
briefly in that hardened process and never cross into upstream/general connector
memory or durable/diagnostic surfaces.
Pools partition credentials by tenant/account or documented bounded trust
domain; unrestricted cross-tenant privileged credentials are unsupported and
any unavoidable provider account-level residual blast radius is explicit. The
sealed permit is non-`Clone`, non-
serializable, consumed by value, best-effort zeroized on drop, and its stored
digest grants no authority. Ambiguous permit delivery or claim response,
duplicate instruction RPC, executor failover, and every replacement worker that
observes a claimed receipt enter reconciliation without transmission. Expiry
before a definite first byte produces
`DefinitelyNotStarted` and requires fresh authority; uncertainty after the
claim produces `OutcomeUnknown`, never ordinary redelivery. The permit cannot
survive clock rollback, restore, worker change, or failover as reusable
authority.
Grant issuance, revalidation/supersession, explicit revocation, redemption, and
attempt consumption are distinct audited commands/transitions; only an
authorized approval command can issue or supersede a grant, and a timer/queue/
worker can only redeem it. Freeze the authoritative ownership rule: an inline
grant shares the approval aggregate stream, while a dedicated grant uses one
`ExecutionGrantLineage` stream created from the immutable approval receipt by an
idempotent outbox/process manager. Pre-issuance revocation creates a terminal
non-redeemable lineage/generation, and successor creation atomically supersedes
its predecessor in that same owner stream. Freeze redemption separately:
`GrantRedemptionGuard` is co-transactional local authority created/fenced by the
lineage-owner transaction and compare-and-claimed by the dispatch bundle. The
dispatch transaction advances only the effect stream, atomically consumes one
bound `GrantAttemptClaimId`, and records its fenced receipt/outbox intent;
revocation versus claim linearizes on the guard. Grant lineage, guard, and
effect work bundle must share a local transaction domain.

Goal: prevent retries, lease loss, or crashes from separating asynchronous work
completion evidence from the effects it emits.

Deliverables: versioned discriminated bundle model and canonical codec, shared
validation laws, atomic memory implementation, capability negotiation profile,
timer/activity/poison receipt types, dead-letter evidence, and deterministic
failure/interleaving harness; distinct execution/outcome/evidence/workflow
codecs and state machines; reconciliation scheduler/escalation contract; and
privileged-resolution policy facts; authorization-binding/freshness descriptors,
execution-authority/grant codecs, issuance/revalidation/revocation commands,
ownership/lineage/approval-receipt and pre-issuance-revocation contracts,
redemption-guard/attempt-claim codec and state machine, redemption receipts,
dispatch-authority-fence-set codec/epoch rules, canonical composite acquisition
order and deadlock-retry contract, `DispatchTargetFence` codec/owner-update/
placement contract, remote-target concurrency profile/validator codec/provider-
capability contract and typed precondition outcome, remote-mutation-exception
owner/approval/scope/epoch codec, guard/attempt/receipt state machine, provider-
capability authority-fence entry, transaction-domain placement/capability
contract, dispatch-transmission-window/receipt/start-claim/permit state machine,
claimant/worker-instance/lease-generation binding, at-most-once permit-return
and ambiguous-delivery contract, `TransmissionInstruction`/
`TransmissionExecutor` ownership boundary, sealed consumed-by-value permit and
zeroization contract, explicit no-transferable-capability production profile,
`ProviderExecutionProfile` codec/admission rules, claim-bound opaque credential-
handle redemption, executor database/key denial, scoped pool and residual-blast-
radius model, authoritative profile lineage/generation and profile/account/
credential/broker-policy epoch guards, typed profile-governance commands,
signed admission/digest/semantic-diff/approval/tombstone state,
`ProviderCredentialRotationState` with provider-evidence reconciliation,
bounded overlap/deadline and local activation/restore ratchet, authoritative
credential-lineage owner and `ProviderCredentialRotationGuard`, stable rotation
ID/successor generation/idempotency key/request digest, takeover command,
credential-orphan state/reconciler, and provider-credential-count quota claim,
`ProviderCredentialCapabilitySnapshot` plus local epoch/freshness/reconciler
contract, reviewed versioned permission evaluator/canonical comparison/AST and
evidence bindings, authoritative evaluator lineage/generation/epoch and signed
binary/corpus admission, reevaluation/startup gate, reduced-drift/quarantine
investigation/remediation/verification/resolution state machine, separated
resolver and consistency-barrier evidence, permanent pre-resolution tombstones,
independent cleanup-only credential-remediation authority/profile/lineage/audit/
quota contract, incident and credential-use linearization contract,
`ProviderCredentialOperationProfile` codec with non-exportable signing/
mTLS and brokered-bearer TCB placement, destination/TLS/DNS/redirect/no-general-
proxy egress contract,
authoritative-time and monotonic-start enforcement contract, and
exact-token bounded per-kind quota-disposition/refund/settlement/
capacity-transfer, one-parent capacity-policy, protected-floor governance, and
root-manifest rollout codecs/state machines. Phase G workflow workers later
specialize the activity payload
without weakening this commit boundary. The contract
states at-least-once external execution explicitly and makes no distributed
exactly-once claim. It distinguishes local commit/delivery success, provider
outcome, how that outcome became known, and operational disposition.

Verification: independently omit or split every variant component; crash
between timer fire/completion, activity effect/receipt, inbox/dead-letter
transition, fence check/commit, and quota-claim transition/effect; replay stale
fencing tokens; attempt a second aggregate stream or remote call in one bundle;
lose a response after provider acceptance; expire a provider idempotency key;
return conflicting status queries; attempt blind retry of unknown privileged or
non-compensable work; race direct response/signed callback/provider query
against manual assessment and deadline escalation; attempt unauthorized or
self-approved privileged resolution; receive late provider evidence after
abandonment; revoke policy/delegation/employment/tenant authority between
commit, lease, authority redemption, authorization receipt, and dispatch; expire
a session/logout epoch; disable a human, service principal, credential, or
external mapping; suspend a tenant; revoke a delegation; activate or roll back
policy; change a role/group/relationship fact while dispatch locks the complete
fence set; omit/substitute/reorder a fence entry; reuse an epoch after rollback;
use a bounded-stale external source for privileged dispatch; deadlock composite
transactions at every adjacent acquisition class; race target deletion, merge,
migration, lifecycle change, or supersession against dispatch; substitute a
stale target projection; place a different-aggregate target cross-shard; restore
an old target version/deletion epoch; verify target-change-versus-dispatch
linearization for both same-aggregate and target-fence-row cases; substitute
remote provider/account/resource or validator bytes/kind/provenance; confuse
weak and strong validators; delete/recreate a resource with an ABA validator;
use a stale validator; downgrade or ignore conditional writes; silently refresh
after precondition failure; retry that failure without a new intent; treat
response loss as non-acceptance; use unconditional semantics without the exact
reviewed exception; substitute exception tenant/provider/account/resource/
action/request, reason, owner/approver/quorum, policy/assurance, compensating
controls, time window, provider-capability version, or epoch; race exception
revocation/expiry/supersession or provider capability gain against dispatch;
concurrently claim the final exception attempt; restore a revoked/expired/
superseded/consumed exception; let a worker/plugin choose unconditional mode
without the exact guard; retry beyond the bound or
with changed command/claim/digest/fence identity; expire an interactive human
session while valid scheduled grant work proceeds; depart an approver; drift policy
or approval version; replay/exhaust/revoke a grant immediately before dispatch;
crash/reorder/duplicate approval-to-grant issuance; race revocation before
delayed issuance; duplicate/fork a grant identity; create a successor without
atomically superseding its predecessor; substitute approval receipt, target, or
request bytes; race revocation against an attempt claim; concurrently redeem the
final attempt; crash after attempt claim/receipt but before provider I/O;
duplicate or substitute attempt claim/receipt; drift the effect or target
version during claim; restore/fail over a consumed attempt; try to advance grant
and effect streams atomically; place lineage/guard/effect outside one transaction
domain; pause a worker past `transmit_before`; revoke authority, suspend the
tenant, expire a grant/exception, change target/provider capability, or fail over
after admission but before transmission claim; substitute worker/service
audience, provider/account/request digest, effect attempt, deadline, or admitted
epochs; roll wall time backward; restore or replay an old start permit; crash
before versus after the start claim; prove no first byte before expiry; lose
the claim response or one-time permit delivery; race duplicate workers using
shared service credentials; substitute worker instance, lease generation/
fencing token, claim ID, receipt, effect attempt, or permit digest; replay the
same claim; let a stale/replacement worker transmit from
`TransmissionStartClaimed`; reconstruct permit material from persisted or
restored state; send a permit over RPC, IPC, queue, log, diagnostic, crash dump,
or connector memory; duplicate an immutable instruction; fail over or compromise
the executor; let an upstream worker or split connector claim or hold permit
authority; treat the stored digest as authority; violate sealed construction,
non-`Clone`/non-serialization, consumed-by-value, or zeroize-on-drop properties;
issue an arbitrary unclaimed provider request; give the executor master-key or
general database-write access; expose bearer/API-key material outside the
hardened broker TCB or through durable/diagnostic/general connector memory;
substitute tenant/provider/account/action/request/destination in a secret handle;
reuse a handle across claims; bypass the destination/port allowlist, TLS identity,
DNS-rebinding/redirect policy, or no-general-proxy rule; compromise one executor
and reach another tenant/account trust domain; admit one unrestricted privileged
credential across unrelated tenants; omit or understate unavoidable provider
blast radius; omit/substitute/reuse the profile lineage, generation, profile
epoch, provider-account lifecycle epoch, credential-lineage/version epoch, or
broker-policy epoch; propose/approve/activate a profile without the control-
plane capability, signed admission record, exact digest, risk owner, required
quorum/separation, semantic expansion review, current tenant/account/policy/
approver fences, or tombstone recheck; race approval/activation against
revocation; use emergency revocation to activate a replacement; emergency-
revoke or suspend a profile/account after
instruction creation; rotate a secret before redemption; perform credential
ABA; crash at every remote rotation state; duplicate credential creation; lose
a provisioning or revocation response; observe provider eventual consistency or
continued old-key validity; exceed overlap/deadline; rotate a one-credential
provider without its outage profile; restore two locally redeemable generations;
start simultaneous rotations; bypass or restore the non-terminal rotation guard;
substitute rotation ID, successor generation, idempotency key, or request digest;
let unknown provisioning/revocation admit an ordinary successor; time out after
provider-side creation; deliver a late creation callback; take over without an
authorized provider inventory; create or replay an orphan handle; lose an orphan
revocation response; exhaust or undercount the provider credential-count limit;
advance local activation and rotation state through two owner streams;
expand/reduce permissions out of band; change role/group/cross-account trust;
reorder authenticated callbacks; observe provider IAM eventual consistency; use
stale polling or restored capability
snapshots; omit/substitute/reuse the credential-capability epoch; accept a stale,
unverifiable, broader, insufficient, or wrong-policy-revision snapshot; compare
policy strings; confuse allow/deny, wildcard/`NotAction`, resource/tag/time/
network/identity/session conditions, permission boundaries, organization policy,
role/group/cross-account trust, or inheritance; downgrade/substitute the
evaluator or policy-language version; exceed a complexity budget without
`Unknown`; mismatch raw-policy/normalized-AST/result/explanation evidence;
activate an evaluator without signed binary/corpus admission or supported
language binding; reuse/roll back its epoch; run mixed nodes unable to validate
the active evaluator; discover an evaluator security bug; change semantics or
corpus; emergency-revoke during queued/claimed work; retain an old-generation
snapshot until its ordinary freshness deadline; partially re-evaluate or restore
an older accepted result;
continue on `StrictSuperset`, `Incomparable`, or `Unknown`; use a non-privileged
action through a quarantined credential; widen the profile automatically; use
break-glass as ordinary quarantine bypass; continue `StrictSubset` without its
explicit profile or exact-operation proof; race quarantine against queued,
claimed, or first-credential-use work; replay a handle or restore quarantine;
clear quarantine through an administrator flag, snapshot rollback, break-glass,
or incident closure; resolve with a stale evaluator, weak/missing policy
revision, old epoch, unseparated resolver, single observation before the
provider consistency barrier, partial/inconsistent evidence, or no remediation
receipt; revive a pre-resolution handle/receipt/queue item/effect authorization;
reuse the old capability generation after same-credential revalidation;
quarantine the sole business credential; derive remediation authority from it;
use remediation authority for tenant business work or outside rotation/takeover;
substitute remediation provider/account/tenant/profile/lineage; compromise the
remediation credential; exhaust credential-count quota; lose a remediation
provider response; encounter provider outage or circular recovery authority;
claim automated recovery where the provider has no independent path;
discover
remote permission inside the dispatch transaction; redeem a stale queued
instruction or restored handle; race revocation/
rotation/policy change against redemption; export private key material from a
signing/mTLS/HSM profile; serialize a bearer header or own its TLS/socket outside
the hardened broker; let a separate broker caller claim transmission; leak
bearer material through HTTP/TLS/redirect diagnostics or crash paths; admit a
provider requiring credential export into a general connector;
lose evidence of whether a first byte was written; retransmit an uncertain
attempt;
reuse consumed authority after `DefinitelyNotStarted`; use worker identity as
business authority; split or partially restore a mixed quota claim set; reserve
overlapping sets concurrently in opposite input order; deadlock/livelock; crash
after partial reservation; add/remove/reorder a
claim after digest; consume by reacquiring members; place one set across quota
partitions; exceed or duplicate a hierarchical capacity lease; attempt a cross-
shard/region work transaction; replay a set/claim transition; crash at every
capacity-transfer transition; duplicate/reorder allocation, activation, return,
and acknowledgement delivery; lose an acknowledgement; fail over source or
destination; present a stale epoch or conflicting transfer; attempt reclaim
without authenticated acknowledgement and old-epoch fence proof; make capacity
free at both ends; substitute accounting owner, hierarchy root, parent lease,
period, work/recovery lane, capacity class, residency/region, source/destination
authorization, or acknowledgement principal; reclassify emergency/security-
cleanup/reconciliation capacity as business capacity through transfer or
adjustment; rewrite an existing capacity class; invoke capacity policy from
tenant work; violate a protected reserve floor; replay policy/simulation;
activate a policy without its one owner stream or co-located parent ledger;
race parent allocation or independent floor update; substitute base policy/
parent high-watermark/deltas/simulation/floor version; lower a floor through the
policy under review; transiently over-allocate during partial multi-parent
rollout; omit or alias a manifest parent; race parent add/remove/reparent/
generation change; substitute root membership epoch, parent identity/region/
class/period, conservation total, manifest digest, prepared receipt, or
finalization receipt; substitute or race `ActiveRolloutGeneration`; concurrently
create successors; cancel before finalization; partially activate then roll back;
deliver predecessor preparation/finalization/activation after supersession;
recover a blocked parent under stale authority; fail over during supersession;
restore a superseded receipt; activate a parent under another manifest; lower a floor
and spend it with the same actor/approver/risk owner/approval lineage; substitute
floor capability or approval; ignore incident/emergency/obligation fences or
platform minimum; allocate/reclaim/change a floor or obligation, open an
incident, suspend the tenant, revoke a principal, supersede policy, or fail over
a parent between preparation, root finalization, and activation; apply stale
prepared values instead of blocking; substitute platform-floor profile ID/
version/digest or typed floor key/admission epoch/high-watermark; substitute
accounting owner/root, quota kind, unit/scale, period, class/lane, region/
residency, or settlement-policy version; omit/duplicate a key; round, overflow,
or lossily convert a unit; confuse daily/hourly periods; relocate region scope
without a total mapping; start a stale/lower-floor node; weaken the effective
floor during a mixed-version upgrade,
downgrade, rollback, lower-default release, or restore; roll back floor history;
reuse an epoch on rollback; restore a stale rollout or floor ratchet;
activate/acknowledge/reclaim after tenant suspension, principal revocation, or
policy-epoch change; settle late evidence without original transfer lineage;
release concurrency based on remote uncertainty;
refund a transmitted rate token; duplicate or forge a refund/provider
settlement; disguise administrative write-off as provider evidence; leak an
unknown-outcome liability; expire/reclaim a capacity lease while retained bytes,
unknown liability, spent rate tokens, or charged operations remain; lose a child
partition; settle late evidence against the original encumbrance; duplicate or
race an encumbrance transfer with parent reclamation/failover; monopolize
reconciliation capacity with one tenant; redeliver poison work; race
cancellation/lease loss; and run rollback, recovery, model, state-machine, and
property tests.

Exit criteria: every supported asynchronous effect uses one negotiated atomic
variant, stale/unfenced work cannot commit, and adapters unable to preserve a
variant report it unsupported. Every external outcome is terminally known,
durably unknown and reconciling, or operationally abandoned/assigned for
authorized manual resolution rather than inferred from delivery state. A
manual conclusion remains visibly assessed and cannot become verified provider
truth. Every dispatch obeys its declared freshness profile, typed execution
authority, and exact immutable binding without impersonating an offline human.
Every grant lineage has one authoritative owner stream; cross-aggregate issuance
uses immutable approval receipt plus outbox/process-manager continuation,
pre-issuance revocation wins, and superseded generations never become redeemable.
Every redemption attempt linearizes through the co-located fenced guard while
the bundle advances only the effect stream; claim/receipt retry is idempotent,
revocation cannot lose to stale guard state, and restore cannot resurrect a
consumed attempt.
No admitted receipt remains transmissible indefinitely: a current-fence start
claim must win before the immutable deadline, the adapter must begin within its
bounded monotonic permit, and exactly one worker instance/lease generation may
receive that non-persisted permit once inside the executor that owns the provider
socket. Upstream and split-service callers exchange immutable instructions and
status only; no supported production boundary serializes or transfers a permit,
and its stored digest is never authority. The executor has no master-key/general
database authority; every provider credential operation is an opaque, exact-
claim-bound, tenant/provider/account/action/request/destination-scoped handle
under least-privilege credential and deny-by-default egress policy. Its
authoritative profile/account/credential/broker-policy epochs are current at
claim and redemption. They are independent roots: `VIT-INV-028` owns only the
execution-profile lineage, while `VIT-INV-053`, `VIT-INV-054`, and
`VIT-INV-055` respectively own provider-account, provider-credential, and
broker-policy epochs. No combined epoch or profile update may advance or stand
in for the others. Profile activation is a separately approved, signed,
digest-bound, semantic-diff-classified control-plane mutation with current
fences and a revocation tombstone. Rotation is an evidence-driven asynchronous
provider process; only local successor activation is atomic and makes the
predecessor non-redeemable, while unknown creation/revocation outcomes reconcile
to a deadline. Its single-lineage rotation guard prevents concurrent or ordinary
post-unknown successors; takeover inventories provider state, orphan credentials
remain quarantined and quota-counted, and late callbacks are fenced. The current
credential-capability snapshot/epoch proves fresh, semantically evaluated
permissions without remote discovery in dispatch. Only equal or an explicitly
admitted proven-safe subset may operate; superset, incomparable, or unknown
quarantines the whole credential, invalidates all pending authority, emits a
security incident, and cannot be widened or break-glass promoted. Evaluator
generations are themselves governed signed authority: activation/revocation
advances an epoch, immediately requires re-evaluation under the current binary/
corpus/language contract, and rejects incompatible nodes. Quarantine clears only
through its owned evidence-backed investigation/remediation/verified-resolution
state machine, which creates a new capability generation and never revives old
work. Credential repair uses only an independent cleanup-scoped remediation
credential/channel through rotation/takeover; without one, recovery is manual.
Restore
cannot resurrect any of this authority. Non-exportable key profiles expose only
operations; bearer transmission is performed entirely by the hardened broker/
executor TCB,
where bearer bytes may exist briefly but cannot escape to upstream, plugin,
queue, log, diagnostic, or durable surfaces. Unscopable
cross-tenant privileged profiles are unsupported and unavoidable residual blast
radius is explicit. Claim-response ambiguity, duplicate instruction delivery,
executor failover, replacement workers, and uncertain start reconcile as
`OutcomeUnknown` without ordinary retry; definitely unstarted work requires
fresh authority.

`VIT-LAW-006` registers the end-to-end transmission-start boundary rather than
letting these checks remain a prose list. `VIT-INV-006` coordinates only the
unique start claim. The dispatch-fence receipt and all applicable underlying
tenant/principal/session/authenticator/workload/delegation/role-assignment/
role-definition/group/relationship/policy epochs; grant/redemption or exception
guard; target fence; provider profile, account, credential, and broker-policy
epochs; capability/evaluator/quarantine state; lease/fence and exact claimant;
immutable transmission deadline and authoritative time; and quota transmission
boundary remain owned by their independent roots. The executor locks or
freshly validates the complete applicable dependency set immediately before
provider I/O. Missing, stale, unknown, differently scoped, or unrestorable
contributors produce `TransmissionStartUnproven`. Once a start may have
occurred, absence must be proven from claim plus provider evidence; otherwise
the result is non-retriable `OutcomeUnknown`, never a blind resend.

Every applicable authority change linearizes against dispatch through the
complete co-located monotonic fence set; unsupported external staleness cannot
authorize privileged effects. Every current-target dispatch also linearizes
against the authoritative target version, digest, lifecycle, and deletion/
supersession epoch without advancing a second stream; unsupported placement or
projection-only freshness fails closed. Composite acquisition and bounded retry
preserve one-stream atomicity without deadlock-driven duplication or identity
drift.
Remote mutation either uses the exact admitted conditional validator, an exact
guarded, revocable, attempt-bounded reviewed unconditional exception, or is
unsupported; local target fencing is never implied. The exception has one owner
stream, dispatch advances only the effect stream, and revocation, expiry,
supersession, provider-capability change, and attempt consumption cannot lose to
stale guard state. Precondition failure cannot trigger silent refresh, and
response loss cannot be rewritten as non-acceptance.
Every bounded quota claim settles by kind at its declared boundary; refunds are
evidence-bound and exactly once, write-offs remain distinct, compensation is
accounted separately, and each exact immutable set reserves all-or-none,
linearizes without an extra aggregate stream inside one quota partition, and
restores/reconciles only as a whole. Hierarchical leases conserve wider capacity
and preserve per-kind encumbrances through expiry, failover, transfer, and late
settlement without a cross-partition work transaction. Transfer delivery is
explicitly at least once, local state transitions are receipt-idempotent, and
conservative double-entry accounting never exposes capacity at both ends. Fair
partitioned recovery capacity cannot be monopolized, borrowed for tenant
business work, activated under another owner/parent/period/region/lane, or
reclassified by transfer or adjustment. Existing capacity is class-immutable;
future unallocated-parent policy changes are control-plane-only, fenced,
simulated, separation-of-duties approved, and reserve-floor preserving. Every
policy lineage owns one parent and atomically updates its co-located ledger
under a separately governed floor version. Multi-parent rollout proves a
complete unchanged root manifest and one active root generation before
finalization and every parent activation. Supersession and rollback are complete
successor root rollouts; late or restored predecessor work fails closed. Floor
reductions have separate cross-command authority and cannot bypass operational
fences, protected obligations, or the durable versioned, fully scope-keyed
platform-floor ratchet. Key-set migration is total, conservation-preserving, and
overflow checked. Finalization only
permits an activation attempt: every parent freshly CAS-revalidates its ledger,
floor, obligations, root generation/manifest, and current authority or remains
under the conservative intersection as blocked/reconciling. Upgrade, downgrade,
rollback, failover, and restore cannot lower the admitted platform minimum or
release capacity. Delayed transfer transitions recheck current local authority
and fail conservatively.
`v0.18.2 implementation stop reached. Run pentest for this exact commit.`

## `0.18.3` — Machine-Checkable Invariant Ownership Registry

Status: planned.
<!-- vitheim-invariant VIT-INV-057 0.18.3 -->
<!-- vitheim-invariant VIT-INV-058 0.18.3 -->
<!-- vitheim-law VIT-LAW-007 0.18.3 -->

Setup: adopt `docs/INVARIANT_OWNERSHIP.md` as the canonical registry for every
authority-bearing invariant and formally backfill all authority declared from
`0.1.0` through `0.18.2`, including structural tenant scope, tenant-bound event
authority, schema/event-schema activation, sensitive-payload lifecycle, pure
aggregate state, one-stream bundles, expected-version heads, audit intent, command
receipts, outbox/inbox atomicity, lease fencing, execution-grant lineage and
redemption, dispatch authority/target fences, remote-mutation exceptions, quota
claims/capacity leases/transfers/policies/protected floors/platform admission/
rollout roots, provider execution profiles, and the remaining provider controls.
Each introducing milestone carries a machine-readable declaration marker. Each
stable `VIT-INV-NNN` row names exactly one
owning stream or state machine, its owner-maintained transactional guard or
authority row, first milestone, local transaction-domain placement, every
enforcement point, required semantic storage capabilities, positive/negative/
model/fault tests, and restore/migration obligations. Phase prose may explain a
rule but cannot create an alternate owner. An owner change is a governed
migration with old/new fencing and rollback rejection, never an editorial
rename. Seed the evaluator lineage, capability snapshot, quarantine lineage,
rotation guard, execution profile, remediation authority, transmission-start
guard, quota claim/lease/transfer/policy/floor/rollout authorities, reevaluation
scheduler, remediation-recovery ceremony, and evaluator invalidation-campaign
entries.

Give every row stable `VIT-ENF-*`, `VIT-CAP-*`, `VIT-TST-*`, and `VIT-RCV-*`
contract IDs. Keep one-owner `VIT-INV-*` roots distinct from cross-owner
`VIT-LAW-*` security laws. Each law has an introducing `vitheim-law`
declaration and lifecycle row. It names one proof coordinator without
transferring contributor ownership, resolves every contributing root, lists
local linearization points, defines a typed fail-closed state, and supplies an
end-to-end recovery proof. Dependency-set and recovery-proof versions, proof
fences, mixed-version behavior, migration, rollback floor, and acyclic
supersession make contributor or linearization changes explicit. Bind every
enforcement point to an explicit append-stable child pair and semantic
description—`VIT-ENF-NNN-X` to `VIT-TST-NNN-N-X`—so reordering prose cannot
silently redefine a contract and an umbrella negative test cannot conceal an
untested check.

Adopt `docs/LAW_GENERATIONS.md` as the canonical historical law record. Every
generation binds one effective milestone and predecessor to its actual proof
coordinator, dependency additions/removals, canonical linearization/failure/
recovery semantics, conservative mixed-version intersection, activation fence,
migration contract, rollback floor, dependency-set contract, and recovery-proof
contract. The current law table is a resolved latest view, never a retroactive
definition. A dependency cannot appear before its invariant lifecycle is
effective, and activation fails closed when any node or storage profile cannot
validate the generation intersection. For `VIT-LAW-006`, record the distinct
start outcomes: failed pre-claim validation/CAS is `DefinitelyNotStarted`;
ambiguous claim or permit delivery is `OutcomeUnknown`; a committed claim enters
`StartClaimedReconciling`. The last two require reconciliation and never
authorize ordinary retransmission.

Implement the `no_std`/N1 `LawGenerationManifestV1` and canonical codec defined
by `docs/LAW_GENERATION_MANIFEST.md`. It contains the resolved dependency set,
semantic-contract ID and complete resolved semantics, coordinator, effective
version/predecessor, mixed-version rule, activation fence, migration/rollback,
dependency/recovery contracts, and content digest. The planning checker
recomputes the domain-separated length-prefixed SHA-256 digest; runtime
implementation is blocked until its exact digest implementation passes the
`0.18.3` admission review. In-memory persistence, export, restore, and golden
fixtures verify canonical byte/digest stability. The latest ownership view must
normalize to the latest resolved semantics and manifest digest.

Treat `docs/LAW_MANIFEST_ADMISSIONS.md` only as a planning superset. Implement
the milestone-scoped `LawManifestAdmissionSetV1` payload and envelope from
`docs/LAW_ACTIVE_CATALOGS.md`; the initial active catalog activates at
`0.18.3`, contains complete effective ancestry, excludes every future tuple,
and remains applicable until its explicit `0.18.4` successor is activated.
There is no maximum-version field. The checker enumerates every implementation
milestone from `0.18.3` through `1.0.0` and proves that the greatest
not-greater activation floor selects exactly one planned catalog.

`VIT-INV-057` gives `PlatformLawCatalogLineage` exactly one authority owner.
Typed `ProposeLawCatalog`, `ActivateLawCatalog`, `SupersedeLawCatalog`,
`RevokeLawCatalog`, and `EmergencyDistrustLawCatalog` commands/events govern
the active epoch/digest, predecessor/successor/revocation state, expected-
version activation CAS in the dedicated global partition only. Independent
`VIT-INV-058` `CatalogAdmissionRatchetRow` owners govern each local node or
enforcement partition. Typed `AdmitLawCatalogLocally` and
`ObserveTrustedCatalogTime` transitions advance the local catalog
epoch/digest, distrust epoch, last trusted lower bound, continuity identity,
and expiry tombstone. Neither owner may update the other's row.
`VIT-LAW-007` connects both owners to the platform safety-floor, dispatch-
receipt, and transmission-start roots. Startup, restore, migration, failover,
import, readiness, law activation, dispatch, and transmission start bind and
recheck the global authority and its independently admitted local proof.
Recovery obtains global trust only from compiled artifact provenance or a
separately authenticated dedicated platform-law signature root, then merges
the greatest local ratchets; database content can never reconstruct trust.
The first reviewed `CompiledCatalog` and `VIT-LAW-007@g01` realization seed the
global and local rows from artifact provenance; only successors use the newly
established lineage, avoiding self-admission from mutable state.

Each active envelope serializes exactly `CompiledCatalog` or `SignedCatalog`
and content-binds payload/predecessor digests, epoch, activation floor,
exact product/edition/compatibility scope, validity policy and times, maximum
time uncertainty, signer/key/signature profile, trust-root epoch, revocation
policy, and successor policy. A combined profile or profile-inapplicable field
is invalid. `BoundedWindow` uses admitted `TrustedCatalogTime` intervals:
earliest must be at or after not-before, latest strictly before not-after, and
reported uncertainty no greater than both envelope and platform ceilings.
Clock rollback, lost continuity, unaccounted suspend, excessive uncertainty,
unavailable time, or a restore below the last observation fails closed and
cannot extend an expired catalog. `NoExpiry` uses exact `none` time fields.

Implement one project-owned `no_std` `LawCatalogVerifierV1` core and call it
from runtime startup/restore/import/admission and the hosted
`vitheim-law-catalog-verify` release CLI. It canonically decodes binary
artifacts, recomputes both digests, verifies complete tuple ancestry, compares
the predecessor's actual recomputed envelope digest, enforces profile-specific
fields, verifies the compiled expected digest or signed signature/root, and
matches exact build scope. Once an activation milestone leaves planned status,
the repository gate invokes this tool; arbitrary text containing expected field
names cannot satisfy it. Every law-effective milestone creates the next
immutable catalog in the checked schedule.
Checkpoint and backup binding is completed at `0.19.0` and `0.145.0`; exact
profile, time source, and maximum uncertainty are frozen before production at
`0.140.1`, separate global/local storage at `0.140.2`, and HA distribution,
revocation propagation, time loss, and recovery at `0.140.6`.

Implement the closed `LawSemanticId` enum and exhaustive
`LawSemanticRealization` dispatch table from
`docs/LAW_SEMANTIC_REALIZATIONS.md`. Canonical semantics remain human review
evidence, never a prose interpreter, string-reflection command source, or
plugin extension point. Each semantic ID resolves to compiled Rust
transitions, typed outcomes, recovery logic, and its exact positive/negative/
model/fault contracts; unknown, unsupported, or manifest-mismatched IDs fail startup and
restore. In particular, every `VIT-LAW-006` realization preserves
`DefinitelyNotStarted`, `OutcomeUnknown`, and `StartClaimedReconciling` as
distinct typed states. Each row has P/N/M/F contracts. The realization gate is
the later of its effective milestone and `0.18.3`; as soon as that gate leaves
planned status, CI requires the Rust transition/recovery files, closed enum and
dispatch-table entry, typed symbols, and every concrete test ID to exist.

Generation one supplies dependencies and complete semantics. A later
generation requires at least one real addition, removal, coordinator change, or
semantic change. `none` additions are valid for a removal-only,
coordinator-only, or semantics-only generation; an unchanged generation with no
other delta fails. Every legitimate delta still advances generation-qualified
semantic/dependency/recovery contracts, manifest digest, activation fence,
migration, and rollback evidence.
Generation one cannot remove dependencies; every resolved generation has at
least two distinct roots and includes its coordinator; additions and removals
are disjoint; and a claimed dependency delta must alter the final set. Canonical
source validation rejects leading-zero/malformed generation or contract
versions, noncanonical SemVer, tabs, carriage returns, non-ASCII/Unicode
normalization alternatives, embedded Markdown pipes, control characters, and
noncanonical cell whitespace before digest calculation.

Adopt `docs/AUTHORITY_REVIEWS.md` as the complete post-bootstrap milestone
review registry. Every milestone after `0.18.3`, including option decisions and
`1.0.0`, has exactly one disposition: exact new declarations, exact existing
roots/laws extended, reviewed `none`, or a stable conservative proposal. A
proposal is planning evidence only and must resolve before that milestone
starts. CI reads the milestone’s own `Status:` field and rejects a proposal as
soon as status no longer contains `planned`; activation and authority
resolution occur in the same commit. Law extensions name
`VIT-LAW-NNN@gNN`, and the checker deterministically requires the latest
generation effective at that milestone. The reference asserts the complete
`g01..gNN` ancestry: evidence enumerates each manifest digest, trusted catalog
tuple, semantic realization, and P/N/M/F contract rather than checking only the
terminal row. CI derives the milestone set from all
implementation documents, rejects
missing/duplicate/orphan reviews, and requires a `declares` disposition to match
the declaration markers exactly.

The checker scans every implementation document, including
`PRODUCTION_1_0.md` and future phases, validates declaration-to-row and row-to-
declaration coverage rather than a static count, verifies the introducing
version, and requires each referenced contract class. Implementation milestones
later bind those identifiers to real enforcement sites, storage profile
capability claims, test modules/conformance cases, and generated recovery-
manifest fields. Add a machine-readable lifecycle companion row for status,
symmetric
`supersedes`/`superseded_by`, effective version, `VIT-FEN-*` old/new owner fence,
mixed-version behavior, migration contract, and rollback floor. `none` is
explicit initial state; it cannot hide an owner transfer. The graph must be
acyclic, successor versions strictly increase, successor rollback floors cannot
precede predecessor activation, a row naming a successor is `superseded`, and
`retired` means terminal without a successor.

Goal: turn distributed architectural laws into one executable ownership and
storage contract before adapters implement them.

Deliverables: stable invariant/law/declaration/enforcement/capability/test/
recovery/fence ID namespaces, complete authority-root backfill including
independently updated local-floor, transfer-side, dispatch-authority, and
campaign-shard roots, normative ownership/composite-law/lifecycle matrices,
explicit per-enforcement negative-child mappings, dependency-free bidirectional
checker across all implementation documents, phase-document
declarations, owner-transfer/supersession procedure, storage-capability
cross-check contract, test-contract realization index, and generated restore/
migration monotonic-state manifest contract; canonical law-manifest schema,
codec/API contract, semantic IDs, content digests, strict canonical parser,
golden fixtures, planning-superset validator, owned milestone-scoped active
catalog lineage, separate local admission/time ratchets, complete envelope
codecs, compiled/signed admission ports, shared runtime/CLI cryptographic
verifier, gap-free activation-floor schedule, catalog lifecycle, exhaustive
semantic-realization table, and digest/admission-verifying in-memory
persistence. The checker rejects unregistered
declarations or rows, duplicate IDs, mismatched introduction versions, absent
or alternative authoritative owners, guards without an owner-maintained update
path, empty transaction placement, enforcement points without stable contracts
and negative tests, prose-only or missing semantic capability IDs, absent
positive/negative/model/fault contracts, recovery obligations without stable
manifest IDs, unknown/asymmetric/cyclic/non-increasing or rollback-unsafe
supersession, inconsistent active/superseded/retired semantics, missing owner-
transfer fences, unsafe mixed-version behavior, and lifecycle migration/
rollback omissions. It also rejects undeclared or lifecycle-incomplete laws,
incomplete composite-law dependencies/proof fields, law graph/version/rollback
violations, and enforcement points without explicit matching negative children
or valid active/retired status. It also rejects noncontiguous law generations,
future dependencies, incorrect predecessors, contract/generation mismatches,
latest-view drift, incomplete typed semantics, unsafe mixed-version
intersections, digest mismatch, current semantic drift, no-op generation, and
rollback below activation while accepting valid removal-only and semantics-only
generations. It also rejects generation-one removal, overlapping or no-effect
dependency deltas, coordinator absence, fewer than two resolved roots,
malformed canonical fields, self-consistent-but-untrusted manifests, catalog
tamper/rollback, planning-superset use at runtime, future tuple activation,
combined profiles, unsigned envelope-field mutation, missing/separated global
or local active-catalog owner, milestone coverage gap/overlap, text-only
artifact evidence, scope mismatch, unverified predecessor/digest/signature,
untrusted or rollback-prone bounded-window time, unknown semantic realizations,
and ancestry omission. Later
milestones must declare and
register new invariants and the corresponding law generation in the same
commit. The authority-review checker rejects any post-`0.18.3` milestone
without exactly one resolved or explicitly proposed disposition.
It rejects unresolved proposals for any non-planned milestone, bare or unknown
law references, stale generations, and future-generation conformance claims.

Verification: delete a declaration, ownership row, or lifecycle row in every
direction; duplicate an ID; mismatch the introducing version; name two owners;
omit a guard update path, transaction domain, stable enforcement/capability/
test/recovery ID, negative test, model/fault case, restore duty, or migration
duty; add an enforcement point without its negative case; advertise a storage
profile without a referenced capability; leave a test ID without a concrete
case after its implementation milestone; transfer an owner without a stable
fence, symmetric acyclic and version-ordered supersession, safe mixed-version
rule, migration contract, or rollback floor; mark active/superseded/retired
state inconsistently; remove a contributor or coordinator from a composite law;
add a later-phase or production declaration without rows; add a dependency to a
law generation before that invariant is effective; mutate a historical
generation, predecessor, coordinator, semantic contract, activation fence,
migration, rollback, dependency, recovery, canonical manifest field, or digest
without detection; mutate latest law semantics without advancing the manifest;
add a no-op generation; prove valid removal-only and semantics-only generations
pass; remove a generation-one root; overlap additions and removals; leave fewer
than two roots or remove the coordinator; claim a neutral dependency delta; use
`01`, `v01`, noncanonical SemVer, a tab, carriage return, non-ASCII
normalization alternative, embedded pipe, or irregular cell spaces; recompute
a modified manifest digest while leaving it absent from the trusted catalog;
forge, roll back, truncate, or substitute a catalog; omit one ancestor tuple or
semantic realization; trust the planning superset directly; place a reviewed
future tuple in the `0.18.3` active catalog; omit or mutate any payload/envelope
scope, validity, signer, root-epoch, revocation, successor, or predecessor field;
serialize a combined profile; race activation/supersession/revocation/emergency
distrust; let global and local catalog state share an authority row; leave
`0.19.0`, `0.30.2`, or any milestone without exactly one applicable catalog;
submit field-shaped text instead of canonical bytes; alter either digest,
tuple ancestry, actual predecessor, compiled digest, signature/root, or build
scope; admit a bounded window with excessive uncertainty, unavailable time,
clock rollback, lost suspend continuity, or restored older observation; restore
below a local catalog/distrust/time high-watermark; fail to propagate revocation
to an unreachable or partially rolled-out node; add an unknown semantic ID;
remove a typed transition/outcome, recovery path, or P/N/M/F contract; mark a
realization gate implemented while its file, enum/dispatch entry, symbol, or
test ID is missing; change a planned proposed
milestone to implementing/implemented without
resolving it; cite a bare, stale, or future generation; omit or
duplicate a later milestone authority review; misclassify declarations as
`none`/`extends`/`proposed`; omit an epoch,
cursor, tombstone, quota state, or recovery fact from the generated manifest;
and prove the repository gate fails each mutation. Review phase declaration
markers systematically so the backfill cannot be reduced to a favored subset.

Exit criteria: every authority-bearing invariant declared through `0.18.5` has
one machine-checked ownership row, one lifecycle row, and resolvable stable
contract IDs; every composite law has a contiguous historically accurate
content-bound manifest chain and every later milestone has exactly one authority
disposition; declaration/review coverage is derived rather than counted
manually; no unresolved proposal survives a milestone status transition; no
phase, adapter, test suite, restore, migration, mixed-version deployment, or
owner transfer can silently omit the invariant, select a second owner, or lose
required monotonic state. Every manifest is self-consistent, effective,
realized, cryptographically verified by the shared core, and trusted by the one
global lineage plus distinct local admission owners; every implementation
milestone has exactly one applicable activation-floor catalog; every shipped
semantic ID resolves exhaustively to code/recovery/P-N-M-F tests; every
generation claim proves its admitted predecessor closure; bounded validity
cannot be extended by time failure or restore; and future planning tuples
remain inert.
`v0.18.3 implementation stop reached. Run pentest for this exact commit.`

## `0.18.4` — Bounded Evaluator Re-evaluation Scheduler

Status: planned.
<!-- vitheim-invariant VIT-INV-008 0.18.4 -->
<!-- vitheim-invariant VIT-INV-027 0.18.4 -->
<!-- vitheim-invariant VIT-INV-046 0.18.4 -->
<!-- vitheim-invariant VIT-INV-047 0.18.4 -->
<!-- vitheim-invariant VIT-INV-056 0.18.4 -->
<!-- vitheim-law VIT-LAW-004 0.18.4 -->

Catalog checkpoint: generate `VIT-LAWCAT-ACTIVE-e002-v1` with the shared Rust
verifier, bind its predecessor to the first artifact's recomputed envelope
digest, and activate it through the separate global and local owners. Exercise
partial rollout, an unreachable node, stale local catalog/distrust/time
ratchets, activation followed by revocation, revocation propagation after
reconnection, and failover/restore at each boundary. A node lacking the second
local admission proof remains unready for affected dispatch and transmission
start; it cannot infer admission from its platform version.

Setup: implement `VIT-INV-008` on the `0.18.0–0.18.2` lease, quota, fence, and
atomic-work contracts. Evaluator activation, supersession, suspension, ordinary
revocation, or emergency revocation creates stable, idempotent jobs partitioned
by tenant, provider, and provider account. Each job binds credential-capability
lineage, old and required evaluator generations/epochs, snapshot generation,
raw-evidence digest and freshness deadline, priority class, retry budget, and a
never-reused job generation. Its durable state is `Pending`,
`FetchingFreshEvidence`, `Evaluating`, `BlockedOnProvider`, `Completed`, or
`Escalated`. Durable partition cursors, leases, fencing, checkpoints, poison
handling, and successor tombstones make crash, failover, repeated evaluator
replacement, and replay deterministic.

Discovery is the composite `VIT-LAW-004`, coordinated by `VIT-INV-027`, not an
unbounded activation loop or a projection. The evaluator lifecycle transaction
atomically advances the evaluator epoch and creates one durable
`EvaluatorInvalidationCampaignRoot` binding the old/new evaluator generations
and epochs, activation/revocation command and admission digests, and the
membership-generation request. The root is never the owner of membership or
scan progress.

`VIT-INV-046` is the authoritative, versioned membership authority. Each shard
has an append-only membership journal, never-reused generation, stable
credential lineage, source tombstones, destination lineage, and a sealable
high-watermark. A credential-capability owner transaction atomically emits its
membership mutation intent with the capability change; idempotent shard intake
must durably consume that intent before it can be omitted from a campaign.
Search, cached inventory, and ordinary projections may accelerate reads but
never prove enumeration completeness. Cross-partition moves use a fenced
source-first protocol: the source remains campaign-eligible until its tombstone,
destination lineage, and handoff receipt are durable. No fictitious cross-shard
transaction or provider-wide freeze is required.

`VIT-INV-056` closes the source-to-membership delivery gap. A campaign binds a
canonical manifest of every capability-owner source partition and its topology
generation. Each source assigns monotonic outbox sequence numbers to atomic
membership intents and seals a campaign high-watermark. `VIT-INV-017`
destination inbox receipts acknowledge the exact source partition, sequence,
intent digest, and membership-shard generation; `VIT-INV-016` source state
retains the intent until that receipt is authoritative. The delivery barrier
proves every sequence through every source high-watermark was received or
explicitly superseded by a lineage-bound successor. Source creation, split,
merge, move, and retirement update a fenced topology lineage: predecessor
partitions remain in the manifest until successor coverage and handoff receipts
are complete. Missing, stuck, digest-conflicting, or topologically ambiguous
delivery enters visible `MembershipDeliveryBlocked`; a membership shard cannot
declare the missing source absent. Capability-owner mismatch reconciliation is
an independent backstop over the canonical source manifest, not the sole
discovery mechanism.

Campaign creation obtains a canonical manifest of membership shards and their
sealed generations/high-watermarks. `VIT-INV-047` owns one fenced scan state per
campaign/shard. It advances a durable journal cursor, records one job or typed
terminal disposition for every eligible lineage/generation, and emits exactly
one completion receipt bound to campaign, shard, membership generation,
high-watermark, counts, and disposition digest. Credentials created after a
shard high-watermark bind the active evaluator before use. Delete, quarantine,
rotation, regeneration, and move outcomes remain explicit; obsolete work never
satisfies a successor generation.

The campaign root may enter `Complete` only after the source delivery barrier
proves every source sequence through the cutoff, it has exactly one valid
receipt for every membership-manifest shard, a final membership barrier proves
all delivered mutation intents were journaled or explicitly post-cutoff, and
authoritative capability-owner reconciliation finds zero
unexplained evaluator-epoch mismatch. Reconciliation remains continuous so a
late journal mutation or inconsistency reopens/escalates the proof rather than
hiding behind terminal counts. Other states are visibly `Enumerating`,
`Materializing`, `Reconciling`, `Superseded`, or `StuckEscalated`. Repeated
replacement atomically creates a successor campaign and tombstones the
predecessor; predecessor manifests, receipts, and counts never prove the new
epoch.

Queued or running work never authorizes use of the old evaluator output:
`ReevaluationRequired` remains a credential-use fence until the current job
commits a complete snapshot and new capability epoch. Evidence older than its
declared freshness bound must be re-fetched through authenticated provider
reconciliation; a retained digest alone cannot refresh it. Scheduling uses
bounded global concurrency, per-provider rate claims, retry and elapsed-time
budgets, global fair share, per-tenant ceilings, and starvation bounds. A
non-borrowable security-cleanup lane protects emergency revocation and
quarantine recovery. Within admissible fairness, privileged credentials and
near-term scheduled work receive priority; one tenant or provider outage cannot
consume the fleet. A newer evaluator generation permanently supersedes stale
pending or in-flight job generations and schedules current work exactly once.

Goal: preserve fail-closed evaluator replacement without allowing a broad
security update to become an unbounded fleet-wide surge or starvation event.

Deliverables: campaign-root and composite-law contracts; canonical capability-
owner source-partition/topology manifest; monotonic source outbox sequences and
sealed high-watermarks; exact-sequence/digest destination receipts; source
creation/split/merge/move/retirement protocol; visible delivery-blocked state;
authoritative
membership-journal/shard-generation/high-watermark interfaces; atomic
capability-change-plus-membership-intent; fenced source-first move protocol;
canonical sealed shard manifest; per-shard scan state, cursor, disposition, and
single-receipt codecs; final membership barrier; atomic evaluator-epoch-plus-
campaign-root transition; capability-owner mismatch reconciler; explicit
projection non-authority tests; stuck-campaign monitor; bounded job/state
codecs; stable identity and successor rules; partitioned durable queue and
cursor port; memory implementation; fair scheduler and priority policy;
provider-rate and cleanup-lane quota integration; evidence-freshness/refetch
contract; lease/fence/retry/escalation model; backlog and expiry monitoring;
operator controls that cannot bypass `ReevaluationRequired`; and deterministic
scheduling/model testkit.

Verification: emergency revocation across millions of credentials; crash between
evaluator epoch advancement and campaign creation; crash or failover before,
during, and after capability mutation intent, source outbox append, source
high-watermark seal, destination receipt, topology change, delivery barrier,
membership intake, generation seal, every journal page, job/disposition
materialization, scan receipt, final membership barrier, and root completion;
stuck or disappeared source intent; missing source partition; sequence gap,
digest substitution, premature source retirement, split/merge/move ambiguity;
projection or search-index omission; omitted,
duplicated, reordered, aliased, or cross-generation shard/receipt; high-
watermark or manifest substitution; unfenced and interrupted cross-shard moves;
credentials created, moved, deleted, quarantined, rotated, or regenerated
during enumeration; lost/late/duplicate mutation intent; job bound to the wrong
campaign or credential generation; premature terminal counts or receipts;
missing-credential and late-mutation reconciliation;
successor campaign racing predecessor enumeration/completion; stuck-campaign
visibility and recovery; provider
outage, rate limit, and eventual consistency; one hostile or oversized tenant;
privileged versus ordinary priority; near-term scheduled work; global and
per-tenant starvation; cleanup-lane exhaustion or business borrowing; repeated
replacement while jobs are pending/fetching/evaluating; stale retained evidence;
duplicate enqueue/dequeue/completion; crash after every transition; lease loss,
worker takeover, queue-partition failover, cursor rollback, backup/restore,
poison escalation, and mixed-version nodes pass without old-output use,
unbounded concurrency, duplicate capability advancement, or lost work.

Exit criteria: evaluator invalidation atomically establishes both the fail-
closed epoch and a durable campaign root; the canonical source manifest and
delivery barrier prove every source sequence through its cutoff before
authoritative journals—not projections—produce a sealed membership-shard
manifest, exactly one receipt per shard, and a final barrier with zero
unexplained capability-owner mismatch. The terminal
manifest accounts for every affected lineage/generation through materialized
work or an explicit terminal disposition. All credentials progress through
bounded, durable, fair,
restart-safe re-evaluation or visible escalation under the current generation,
and no crash, partition move, late mutation, or index defect can permanently
omit work.
`v0.18.4 implementation stop reached. Run pentest for this exact commit.`

## `0.18.5` — Remediation Authority Bootstrap And Recovery

Status: planned.
<!-- vitheim-invariant VIT-INV-009 0.18.5 -->

Setup: complete `VIT-INV-005` and `VIT-INV-009` with a root-of-trust ceremony
that never depends on the credential being provisioned or recovered. The first
`ProviderCredentialRemediationAuthority` is admitted from authenticated
provider-administrator evidence, an exact cleanup-only profile, signed
implementation admission, current provider/account facts, independently
recorded risk ownership, and separated quorum approval. Its lineage uses
`Uninitialized`, `CeremonyPending`, `Active`, `Rotating`, `Compromised`, `Lost`,
`RecoveryPending`, `Recovered`, `ManualInterventionRequired`, and terminal
superseded/revoked states with a never-reused recovery epoch.

Automatic production recovery requires two independently administered recovery
channels where the provider can supply them, separated operators/approvers, and
storage/KMS/identity failure domains independent from ordinary business
credentials where practical. Rotation and recovery require quorum and
separation of requestor, approvers, executor, and risk owner. Offline/manual
recovery uses provider-native administrator or support ceremony that does not
authenticate through the lost authority. A remediation credential cannot
self-approve, rotate itself alone, declare its own compromise resolved, recover
itself through its own secret/KMS path, or use business credentials as a hidden
fallback. Providers without an independent channel remain explicitly
manual-only; availability consequences are accepted before support is enabled.
Expiry, channel health, KMS reachability, administrator availability, and
exercise age are monitored without exposing secrets. Periodic recovery
exercises create evidence, rotate test material safely, and cannot be reported
successful from a paper review alone.

Goal: make cleanup authority initially trustworthy, continuously available, and
recoverable after loss or compromise without a circular or self-approved root.

Deliverables: bootstrap/recovery state machine and codecs, signed ceremony
manifest, provider evidence-strength profile, quorum/separation policy,
independent-channel and KMS-domain declarations, offline/manual runbook,
rotation/compromise/loss commands, expiry/availability/exercise monitors,
exercise receipts and overdue escalation, restore/migration ratchet, memory
implementation, and provider-without-independent-channel limitation template.

Verification: first bootstrap with forged, stale, or partial provider evidence;
self-approval and self-remediation; shared administrator, KMS, secret store, or
identity failure domain disguised as independence; simultaneous loss of
business and remediation credentials; remediation compromise during rotation;
circular recovery dependency; provider-administrator loss; one or both recovery
channels unavailable; KMS outage; expired authority; provider support delay;
duplicate or conflicting ceremonies; crash at every transition; stale backup,
rollback, import, and migration; false exercise success; and manual-only
provider behavior all fail closed or reach bounded visible escalation.

Exit criteria: each supported provider has either a tested, quorum-controlled,
non-circular recovery root with the required independent channels or an
explicitly accepted manual-only limitation; no authority can approve or recover
its own compromise. `v0.18.5 implementation stop reached. Run pentest for this exact commit.`

## `0.19.0` — Integrity Chains And Signed-Checkpoint Interface

Status: planned; blocked until this milestone approves an implementation-
admission record for every hash, signing, KMS, and timestamp implementation.

Setup: bind tenant, partition, stream, sequence, event/schema IDs, payload digest,
the `0.18.2` work-variant/audit-intent/receipt/commit digests, predecessor, and
key ID, plus active law-catalog ID, epoch, payload/envelope digests, exact
profile, activation floor, predecessor digest, exact scope, validity window and
maximum uncertainty, signer/root epoch, revocation/successor policy, global
lineage receipt, and independent local catalog/distrust/time ratchets. The
checkpoint verifier invokes the same canonical `LawCatalogVerifierV1` used at
runtime and records its typed result; textual field presence is not evidence.
Define
domain-stream and denial-only audit sequences, partition Merkle
commitments, external signed anchors, checkpoint cadence, rotation, independent
timestamp option, and limits.

Goal: make event deletion, replacement, and reordering detectable.

Deliverables: integrity-link model, crypto-provider interface only, partition
commitment, externally retained checkpoint format, cross-signed rotation,
verification report, corruption locator, catalog-bound checkpoint/restore
report, and the signed admission record binding the reviewed
implementation/profile versions.

Verification: deletion of an entire stream or denial sequence, removal of an
audit intent or receipt while leaving domain events intact, reorder/substitution/
splice, wrong stream/tenant/key, anchor loss, rotation, timestamp semantics,
truncated chain, recovery verification, digest collision fixture, and bounded
verify pass; catalog substitution, rollback, missing ancestry tuple, future
tuple, envelope-field mutation, profile ambiguity, and a self-consistent
untrusted manifest are rejected even when event hashes remain valid.

Exit criteria: tamper evidence is deterministic without inventing cryptography.
`v0.19.0 implementation stop reached. Run pentest for this exact commit.`

## `0.20.0` — Replay, Verification, And Rebuild CLI

Status: planned.

Setup: define read-only defaults, explicit repair authorization, scope selectors,
resource budgets, resumable progress, report format, and secret redaction.

Goal: safely diagnose journals and rebuild projections operationally.

Deliverables: hosted CLI, stream/integrity verification, projection rebuild,
dry-run repair plan, and signed evidence output.

Verification: corrupt/huge streams, interruption/resume, wrong tenant, unsafe
repair attempts, report injection, rebuild equivalence, and operator UX pass.

Exit criteria: verification cannot mutate state and repair never runs implicitly.
`v0.20.0 implementation stop reached. Run pentest for this exact commit.`

## `0.20.1` — Security Audit Projection, Access Receipts, And Journal

Status: planned.

Setup: project authoritative `0.15.1` intents into a separately queryable,
integrity-anchored audit journal; cover command rejection, authorization denial,
sensitive reads/searches/exports/downloads, administration, plugin calls, AI
context, and federation. For protected reads/downloads, durably record the
authorization receipt before releasing bytes. Streaming operations record
start, bounded progress/byte counts, completion or abortion. Define redaction,
retention, access/export, rebuild, lag, and explicit outage classes.

Goal: provide complete security investigation evidence without making the
separate audit projection the sole authority or pretending denials are domain events.

Deliverables: audit projector/journal port, access-release guard, streaming audit
lifecycle, memory journal, query/export policy, integrity/retention hooks,
rebuild/lag verifier, and operation-class outage matrix.

Verification: domain rejection produces no domain event/outbox effect while one
deduplicated authoritative fact remains; crash after command commit rebuilds the
audit journal; crash before read receipt releases no protected bytes; stream
abort/completion and byte counts reconcile. Audit outage fails closed for
mandatory-audit operations, while explicitly non-mandatory health/static
operations follow their documented policy. Spoofing, log injection, secret
leakage, cross-tenant reads, replay, truncation, retention, and anchors pass.

Exit criteria: every mandatory security action is durably auditable or fails
closed. Audit evidence never changes the aggregate decision, but required audit
authority is a prerequisite for committing or releasing the protected outcome. `v0.20.1
implementation stop reached. Run pentest for this exact commit.`

## `0.20.2` — Hosted Telemetry Semantics And Instrumentation Contract

Status: planned.

Setup: define correlation/causation and validated trace-context propagation,
tenant/data classification, redaction, bounded metric label vocabulary and
cardinality, monotonic counters/histograms, lag/saturation/retry/quota/queue/
projection measurements, health/liveness/readiness, clock semantics, sampling,
buffer/drop/backpressure, and failure isolation. Secrets, sensitive payloads,
raw user IDs, attacker-controlled strings, and unbounded resource identifiers
are prohibited from labels/log fields.

Goal: establish instrumentation conventions before hosted adapters, workers,
connectors, plugins, federation, and product services proliferate.

Deliverables: project-owned telemetry event/metric/trace/health ports, schema
registry, redaction/cardinality gates, no-op and bounded-memory collectors,
fake clock/context, instrumentation conformance suite, and adapter checklist.

Verification: tenant/secret/payload leaks, label cardinality explosion, trace
spoofing/cycles, correlation confusion, clock jumps, recursive telemetry,
buffer exhaustion, exporter backpressure simulation, dropped-signal accounting,
readiness lies, and telemetry-disabled semantic equivalence pass.

Exit criteria: every later hosted milestone instruments the same bounded
tenant-safe contract, and telemetry failure cannot grant authority or corrupt
domain correctness. `v0.20.2 implementation stop reached. Run pentest for this exact commit.`

## `0.20.3` — Shared Provenance And Temporal-Fact Primitives

Status: planned.

Setup: define reusable N1 `SourceRef`, `ObservationId`, `ProvenanceRef`,
source-observed time with clock quality/uncertainty, business-valid interval,
journal-recorded time, projection-checkpoint time, `CorrectionOf`,
`Supersedes`, and confidence assertions bound to an exact trust-policy version.
Define unknown, conflicting, late, and corrected facts without collapsing the
four clocks or overwriting original assertions.

Goal: establish one provenance and temporal vocabulary before service
measurements, alerts, evidence, vulnerabilities, assets, and service health
develop incompatible local models.

Deliverables: focused `no_std`/N1 fact-model crate, bounded canonical types,
interval and ordering operators, correction/supersession laws, confidence
explanation model, golden cross-domain fixtures, and compile-time dependency
rules requiring later fact-bearing domains to reuse these primitives.

Verification: identity/source confusion, clock collapse, invalid or uncertain
intervals, destructive correction, supersession cycles, late/out-of-order
facts, confidence inflation, policy-version mismatch, projection lag, canonical
round trips, property tests, and cross-domain differential fixtures pass.

Exit criteria: later domains may add typed fact payloads and domain rules, but
cannot redefine provenance identities, correction semantics, confidence
authority, or the four-clock model.
`v0.20.3 implementation stop reached. Run pentest for this exact commit.`
