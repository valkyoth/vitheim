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
predecessor closure,
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
transition/outcome/recovery/P-M-F realization;
distributed-exactly-once capacity-transfer claim, unbounded or identity-changing
deadlock retry, and optional-performance fallback tests pass.

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
`VIT-LAW-004@g01`, `VIT-LAW-005@g04`, and `VIT-LAW-006@g01`; later Phase F
generations are not valid `0.22.0` conformance claims. Define
fault injection, concurrency
schedule, adversarial twin tenants with colliding local IDs, connection-session
state reuse, cleanup, administrator threat boundary, and evidence format.

Goal: make production-support claims depend on identical observable behavior.

Deliverables: reusable adapter harness, mandatory capability matrix, randomized
state machine, machine-readable declaration/enforcement/test/recovery/lifecycle
and law-generation coverage and conformance report; manifest/digest round-trip,
trusted-catalog round-trip/admission, ancestry enumeration, realization
dispatch, tamper, self-consistent-untrusted, noncanonical encoding,
semantic-drift, unknown-semantic, and future-generation fixtures;
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
revocation/final-attempt claim races, crash-before-provider retry, claim/receipt
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

Exit criteria: an adapter cannot claim support by skipping or weakening tests.
`v0.22.0 implementation stop reached. Run pentest for this exact commit.`

## `0.23.0` — SQLite Adapter

Status: planned; blocked until this milestone approves the exact SQLite driver,
bundling/native-code policy, maintenance, license, and file-encryption strategy.

Setup: document single-node limits, dedicated database-file-per-tenant strong
profile, shared-file evaluation-only profile, ownership, secure paths, journal
mode, transactions, busy handling, migrations, backup, cancellation, keys, and
the version-bound implementation-admission record.

Goal: support development, evaluation, tests, and documented single-node use.

Deliverables: semantic adapter, migration set, secure file setup, backup/restore
tooling, and capability profile.

Verification: injection, locking, crash rollback, symlink/permission attacks,
tenant isolation, interrupted migration, restore, and conformance pass.

Exit criteria: no HA claim and all single-node semantics are evidenced.
`v0.23.0 implementation stop reached. Run pentest for this exact commit.`

## `0.24.0` — PostgreSQL Reference Adapter

Status: planned; blocked until this milestone approves the exact PostgreSQL
driver, TLS stack/profile, pool, maintenance, license, and native-code policy.

Setup: define TLS/authentication, non-owner least-privilege role, composite keys/
foreign keys, `ENABLE` plus `FORCE ROW LEVEL SECURITY`, transaction-local tenant
binding with pool cleanup/startup probes, prepared queries, migrations, and cancellation.
Record the version-bound implementation admission before adapter code begins.

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
backup/restore, and observability. Startup fails capability negotiation if any
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
restore, and conformance pass.

Exit criteria: production claims match tested deployment profiles only.
`v0.24.0 implementation stop reached. Run pentest for this exact commit.`

## `0.25.0` — MySQL Adapter

Status: planned experimental; blocked until a concrete requirement and
implementation-admission record approve the exact driver/TLS profile.

Setup: prefer database-per-tenant strong isolation; otherwise require composite
tenant constraints, generated statements, least-privilege views/routines, and
explicitly weaker non-production classification; map isolation, locking,
encodings/collations, TLS/auth, migrations, and cancellation.

Goal: evaluate portable business correctness without making a `1.0.0`
production-support claim by default.

Deliverables: semantic adapter, migration/operation guide, capability profile,
and portability discrepancy register.

Verification: encoding/collation confusion, isolation anomalies, injection,
deadlock retry, rollback, tenant partition, restore, and conformance pass.

Exit criteria: no backend-specific behavior leaks into domain correctness.
`v0.25.0 implementation stop reached. Run pentest for this exact commit.`

## `0.26.0` — MongoDB Adapter

Status: planned experimental; blocked until a concrete requirement and
implementation-admission record approve the exact driver/TLS profile.

Setup: bind tenant into every document ID, unique index, shard key, session and
transaction; co-locate stream head/events/receipts/outbox for atomicity; define
write concern, migrations, retry semantics, and topology limits.

Goal: evaluate canonical event-journal behavior on a document backend without a
`1.0.0` production-support claim by default.

Deliverables: semantic adapter, collection/index definitions, capability profile,
backup/restore procedure, and divergence notes.

Verification: operator/query injection, partial transactions, retry duplication,
cross-tenant filters, failover, migration interruption, and conformance pass.

Exit criteria: document flexibility never weakens mandatory journal semantics.
`v0.26.0 implementation stop reached. Run pentest for this exact commit.`

## `0.27.0` — SurrealDB Adapter

Status: planned experimental; blocked until a concrete requirement and
implementation-admission record approve the exact client/TLS profile.

Setup: use strict tenant namespaces/databases, schema and record permissions,
least-privilege non-system application identity, transactions, graph features,
query parameters, migrations, capability probes, and version support.

Goal: evaluate graph capabilities as optimization without changing correctness
or claiming default `1.0.0` support.

Deliverables: semantic adapter, schema/migrations, capability profile, graph
optimization boundary, and operational guide.

Verification: namespace escape, query injection, unauthorized edges, transaction
failure, capability lies, backup/restore, and full conformance pass.

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
Treat every law-generation activation as a registered migration as well. It
must preserve the predecessor record, resolve the exact dependency delta only
after every added root is effective, persist the activation fence and contract
digests, enforce the conservative predecessor/successor intersection during
rolling deployment, and prevent rollback below the generation floor.
Persist the canonical predecessor and successor `LawGenerationManifestV1`
bytes/digests, verify both before each checkpoint or recovery transition, and
never synthesize a manifest from only the flattened latest law view. Preserve
and verify the active admission-catalog ID/epoch/digest/trust profile, every
tuple in both ancestry closures, and each closed semantic realization.
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
semantic/recovery lifecycle plus canonical manifest bytes and digests, explicit
trusted catalog metadata/full ancestry, closed semantic realizations, explicit
per-point negative-child realization,
and concrete `VIT-RCV-*` fields.

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
missing campaign membership journal/scan receipt/final barrier/mismatch state,
missing operation-profile discriminator, cancelled-prepared recovery receipt
loss/duplication, and restored independent-parent-release cases.

Exit criteria: interrupted migrations cannot leave unclassified partial state.
`v0.29.0 implementation stop reached. Run pentest for this exact commit.`

## `0.30.0` — Cross-Backend Export And Import

Status: planned.

Setup: freeze canonical export version, tenant scope, event/blob manifests,
integrity checkpoints, law-catalog identity/epoch/digest/trust profile and full
generation ancestry, encryption/signing ports, position mapping, and budgets.

Goal: migrate between backends without claiming direct database interchange.

Deliverables: streaming exporter/importer, preflight verifier, reconciliation
report, resumable checkpoints, source/destination mapping, and explicit
manifest/admission/semantic-realization closure. Import never infers, upgrades,
or trusts a law generation from mutable payload content.

Verification: truncation/substitution/reorder, wrong tenant/key/version, duplicate
resume, blob mismatch, exhaustion, catalog or ancestor omission/substitution,
self-consistent untrusted manifest, unknown semantic ID, silent generation
upgrade, round-trip, and cross-adapter conformance pass.

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
