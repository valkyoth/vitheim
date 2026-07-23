# Vitheim Implementation Plan

Status: complete planning baseline from `0.1.0` through `1.0.0`

This index turns the [release ladder](RELEASE_PLAN.md) into implementation
handoffs. Every milestone has its own status, setup, goal, deliverables,
verification, and exact-commit pentest stop. A milestone may be split before
implementation if one review pass becomes too broad; later work may never be
pulled into an earlier tag merely for convenience.

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
`0.140.x` decisions revalidate and freeze production support from those records;
they are never the first technology selection.
Every user-facing capability is API-first: API contract/application/transport
crates remain separate from UI composition/rendering crates, and the first-
party UI has no privileged command, repository, or database path.
Optional federation, AI, vendor-connector, plugin-storefront, and semantic-index
crates depend inward on stable ports. The kernel and first-party domains must
build, test, and operate without any optional product family.
Vitheim operational telemetry and customer-service measurements are distinct
planes. All fact-bearing domains reuse the shared N1 provenance, correction,
confidence, and four-clock vocabulary rather than creating local substitutes.
Semantic index storage and embedding generation are independently replaceable
and independently admitted.
Authority-bearing invariants are indexed by stable IDs in
[Invariant Ownership Registry](INVARIANT_OWNERSHIP.md). From `0.18.3` onward,
every invariant must register exactly one owner, its owner-maintained guard,
transaction placement, enforcement points, semantic storage requirements,
positive/negative/model/fault tests, and restore/migration obligations before
its milestone may exit. Phase prose supplies context but cannot establish a
second owner.
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

At each implementation stop: do not tag, publish, or begin the next milestone.
Pentest the exact commit, fix every blocking finding, rerun all gates, obtain a
permanent `Status: PASS` report, and run the versioned readiness gate. Patch
versions contain corrections only and follow the same process.

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
- [Pre-Production Option Decisions (`0.140.1–0.140.10`)](implementation/OPTION_DECISIONS.md)
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
