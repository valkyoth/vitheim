# Phase O — Production Hardening

Scope: `0.141.0–0.150.0`. Claims require operational evidence, not schedule.

## `0.141.0` — Single-Node Production Packaging
Status: planned. Setup: supported OS/arch, packages/images, users/paths,
permissions, secure defaults, upgrades, compiled
`PlatformSafetyFloorProfile` identity/version/digest, and durable admitted
fully typed `PlatformSafetyFloorKey` high-watermarks plus total key-migration
evidence, and durable never-reused provider profile/account/credential/broker-
policy epochs, profile approval/activation/tombstone state, credential-rotation
lineage owner/guard/idempotency/takeover/orphan/count/provider-evidence/deadline
state, and credential-capability snapshots/local epochs/raw and normalized
digests/evaluator and policy-language versions/comparison/quarantine provenance.
Persist the evaluator lineage/generation, signed binary/corpus admission,
provider/language compatibility, never-reused epoch and reevaluation state;
quarantine investigation/remediation/verification/resolution, fresh capability
generation and old-work tombstones; and the independent remediation profile/
credential lineage/audit/epoch/cleanup quota or manual-only limitation.
Persist the `0.18.4` evaluator-job generations, tenant/provider/account queue
partitions, durable cursors, attempts, leases, priority, freshness/refetch,
fair-share/provider-rate/cleanup-lane accounting, and escalation; also persist
the atomic invalidation-campaign root, authoritative snapshot-generation index,
cutoff/shard manifest, page cursors, materialization/disposition counts,
completeness proof, successor tombstones, and stuck state. Persist the
`0.18.5` remediation ceremony manifest, channel/KMS bindings, quorum receipts,
compromise/loss/recovery epoch, expiry, exercise evidence, and manual-only
limitation. Package a declaration-derived report proving every applicable stable
invariant ID has exactly one ownership/lifecycle row and resolved enforcement,
storage capability, test, recovery, and owner-fence contracts, including
supersession/mixed-version/migration/rollback behavior.
Goal: hardened repeatable single-node install.
Deliverables: signed packages, startup floor-profile compatibility gate,
active-evaluator binary/corpus/language compatibility gate, governed higher-
floor and key-set migration/drain tooling, and runbook.
Verification: clean
install, permissions, rootless/non-root, secrets, restart, rolling upgrade,
downgrade/rollback to a lower compiled floor, lower-default release, conflicting
profile, missing/duplicate/incompatible key, unit/scale/period/kind/lane/region/
settlement-policy substitution, lossy/overflowing/interrupted floor migration,
profile/account/credential/broker epoch rollback, revoked-generation/rotated-
handle restore, unauthorized/stale profile activation, lost tombstone/rotation
evidence/deadline, restored dual redemption, stale/restored capability snapshot,
evaluator admission/epoch rollback or incompatible binary startup, partial
reevaluation, queued old-output use, lost/duplicated evaluator job or cursor,
missing/split campaign root, index/cutoff/page/count/completeness corruption,
premature or predecessor campaign completion, tenant starvation/cleanup-lane
borrowing, cleared quarantine/old-work revival,
remediation-lineage merge, self-approved/circular recovery, lost channel/KMS/
quorum/exercise state, stale recovery epoch, or lost manual-only limitation,
credential-operation-profile mismatch,
and restore pass. Exit criteria: the
documented profile is operable securely and no package change can start below or
lower the durable admitted platform-floor ratchet. `v0.141.0 implementation stop
reached. Run pentest for this exact commit.`

## `0.142.0` — Split Service Deployments
Status: planned. Setup: API/worker/ingest/index and
`TransmissionExecutor` identities, mTLS/authz, network policy, discovery,
version compatibility, and the immutable authenticated
`TransmissionInstruction`/status protocol. The executor owns both
`ClaimTransmissionStart` and the provider socket; permit material remains a
sealed process-local value and never appears in RPC, IPC, queues, service logs,
or caller memory. It runs under an immutable `ProviderExecutionProfile`, has no
master-key ring or general database writes, redeems only exact claim/request/
tenant/provider/account/action/destination-bound opaque secret handles, and is
confined by allowlisted egress, TLS identity, DNS-rebinding/redirect policy, and
a tenant/account or documented bounded-trust-domain pool. Its authoritative
profile lineage and profile/account/credential/broker-policy epochs are checked
at claim/redemption and cannot roll back on restore. The profile-governance
owner validates typed signed/digest-bound approvals, semantic expansions,
current fences, and tombstones. The rotation process manager is the sole
credential-lineage owner and owns its co-located guard, stable provisioning
idempotency, provider inventory/takeover, orphan quarantine/revocation,
credential-count quota, create/verify/revoke evidence, unknown reconciliation,
local activation, and deadlines. The permission observer owns capability
snapshots/local epochs and the reviewed versioned semantic evaluator/corpus;
the executor only rechecks fresh state and never discovers provider IAM remotely.
Superset, incomparable, and unknown comparisons quarantine the entire credential.
The control plane alone owns evaluator lineage/epoch activation/revocation and
reevaluation, quarantine investigation/resolution/new-generation tombstones,
and the separate cleanup-only remediation credential lineage. Executors reject
readiness when they cannot validate the active evaluator and never receive
remediation authority.
Signing/mTLS/HSM profiles
are non-exportable. For bearer/API keys, the hardened credential broker is the
`TransmissionExecutor`: it owns authorization serialization, redirects, TLS,
start claim, and socket. Bearer bytes may briefly exist there, but never in
caller/general connector, RPC/queue, durable, log, diagnostic, or crash state.
A separate broker process, not its caller, performs claim and write. Goal: optional
process separation without inventing a
transferable start capability. Deliverables: deploy manifests, executor
placement/isolation profile, instruction codec/authentication and duplicate
handling, scoped-credential broker, egress policy, pool-partition and residual-
blast-radius evidence, profile-lineage/epoch guard, credential-
operation/TCB profile, bearer-memory canaries, profile lifecycle/approval/
tombstone routing, rotation reconciler/evidence/deadline ownership, capability-
snapshot observer/freshness ownership, status/reconciliation protocol, no-
permit-transport evidence, evaluator/quarantine/remediation owner-routing and
readiness evidence, and service runbook. Verification: service/executor
impersonation, confused deputy,
network bypass, instruction replay/substitution, duplicate RPC, claim-response
loss, executor failover/stale process/compromise, socket/claim ownership split,
permit or digest authorization leakage, version skew, partial outage, and
rotation pass; include arbitrary unclaimed socket use, secret-handle/account
substitution, cross-tenant credential reuse, unrestricted shared-credential
rejection, and allowlist/TLS/DNS/redirect/general-proxy bypass. Include
emergency revocation, account suspension, credential rotation/ABA,
unauthorized/self-approved activation, hidden expansion, stale fence/tombstone,
every rotation crash/unknown/evidence/deadline/outage state, restored dual
redemption, permission/role/group/trust drift, callback reorder, stale polling,
wrong policy revision, stale/restored snapshot, remote discovery in executor,
evaluator activation/revocation/epoch/reevaluation routing or skew, incompatible
executor readiness, unsafe quarantine clear/old-work revival, remediation
authority in executor or business path,
stale instruction/restored handle, epoch rollback, signing/mTLS key export,
bearer escape, caller-owned claim/socket, and HTTP/TLS/redirect/log/diagnostic/
crash memory-canary failure. Exit criteria:
split mode preserves modular semantics, moves only
instructions/status across services, and routes every ambiguous claimed start
to reconciliation; executor compromise remains bounded to the admitted provider
execution profile.
`v0.142.0 implementation stop reached. Run pentest for this exact commit.`

## `0.142.1` — Production Telemetry Exporters And Graceful Drain

Status: planned; each exporter is blocked until its protocol/client/TLS,
maintenance, license, and admission record is approved.

Setup: define tenant-safe structured log fields, classifications/redaction,
bounded metric labels, trace propagation, audit separation, lag/saturation/
quota/readiness signals, exporter identity, buffering/drop/backpressure policy,
failure isolation, shutdown drain, and secret prohibition.
Implement only exporter/collector profiles conforming to the established
`0.20.2` instrumentation schemas and failure semantics; this milestone cannot
invent incompatible per-service telemetry conventions.

Goal: connect the already-instrumented platform to production collectors and
gracefully drain without leaking tenant data or changing correctness.

Deliverables: metrics, traces, and structured-log ports/adapters; redaction and
cardinality gates; readiness/drain protocol; fake collectors; operator dashboards
and failure runbook.

Verification: cross-tenant/secret label leaks, high-cardinality exhaustion,
trace spoofing, log injection, exporter outage/backpressure, disk/buffer fill,
recursive telemetry, shutdown loss, readiness lies, and failover tests pass.

Exit criteria: every selected production profile exposes bounded operational
signals and has an explicit telemetry-loss policy. `v0.142.1 implementation stop
reached. Run pentest for this exact commit.`

## `0.143.0` — HA Leases, Failover, And Partitions
Status: planned. Setup: quorum/authority, fencing, health, failover, partition
policy, reconciliation, every `0.18.2` atomic work variant, delayed-effect
authorization freshness/bindings, typed execution-authority redemption, bounded
multi-kind quota claim settlement/exact-set linearization, one-owner grant
lineages, co-located redemption guards, local quota partitions/hierarchical
capacity leases/per-kind encumbrances, complete dispatch-authority fence sets,
typed target fences, receipt-idempotent at-least-once capacity-transfer process
management with immutable accounting classification, remote-target concurrency
profiles and exception guards, class-immutable existing capacity, versioned
one-parent capacity-policy atomic activation, protected-floor governance,
durable platform-floor profile ratchet, hierarchy-root complete-manifest rollout
with fresh local post-finalization activation, delayed-transition authority
rechecks, bounded dispatch-transmission windows with unique executor/lease
claimants and instruction-only split boundaries, immutable provider-execution
profiles with revocable lineage/epoch-scoped credential and egress authority,
governed profile activation/tombstones, serialized rotation guard/takeover/
orphan/count reconciliation, credential-capability snapshot/epoch semantic-
evaluator freshness and whole-credential quarantine,
evaluator-lineage/epoch/reevaluation fencing, quarantine-resolution/new-
generation/tombstone ownership, independent remediation credential-lineage/
cleanup-quota isolation or manual-only state, bounded evaluator job/cursor/
fairness/provider-rate/cleanup-lane scheduling, remediation bootstrap/recovery
quorum/channel/KMS/epoch/exercise state, atomic evaluator campaign/index/cutoff/
cursor/materialization/completeness/stuck-state ownership, declaration-derived
invariant owner/lifecycle/contract/fence placement,
explicit credential-operation/
bearer-broker TCB profiles, monotonic active root
rollout generation with permanent successor supersession, complete-successor
rollback, prepared-cancellation recovery successor, and fully typed floor-key migration,
canonical composite acquisition/retry, and fair partitioned control-plane
capacity.
Goal: prevent split-brain effects. Deliverables: HA orchestration, work-variant
fault matrix, dispatch/grant-lineage/redemption-guard/authority-fence evidence,
exact-set/capacity-lease/encumbrance/transfer quota evidence, target-fence
evidence, remote conditional-mutation evidence, composite-lock/retry evidence,
exception-guard/attempt evidence, transmission-window/current-fence start-claim/
claimant/trusted-executor/no-permit-transport/uncertainty evidence, capacity-
policy owner/parent/floor-governance/ratchet/root-manifest/fresh-activation/
active-generation/successor/typed-key-migration/current-authority evidence,
provider-execution-profile/credential/egress/pool-partition evidence,
profile/account/credential/broker epoch/rotation and credential-operation/
bearer-memory evidence, profile-governance/approval/tombstone evidence, rotation-
state/guard/idempotency/takeover/orphan/count/provider-evidence/unknown/deadline
evidence, credential-capability snapshot/epoch/evaluator/corpus/comparison/
freshness/quarantine/reconciler evidence, evaluator lineage/admission/epoch/
reevaluation/startup evidence, quarantine resolution/current-evidence/resolver/
consistency/new-generation/tombstone evidence, remediation profile/credential-
lineage/audit/epoch/cleanup-quota/manual-limit evidence, cancellation-recovery/deadline
evidence,
fair-capacity evidence, and runbooks.
Verification: partitions, clock skew, stale leader/fence,
receipt/effect/quota/dead-letter splits, duplicate command/consumer/timer/
activity work, timer dispatch/result separation, multi-aggregate/remote-call
transaction rejection, provider acceptance plus lost response, unknown-outcome
reconciliation deadline/escalation, distinct execution/outcome/evidence/manual/
compensation state, direct/callback/query evidence racing manual resolution,
forbidden blind privileged/non-compensable retry, authority or target change
across commit/lease/dispatch, stale/forged dispatch receipt, confused deputy,
offline-approver impersonation, valid grant after session expiry, grant replay/
attempt exhaustion/revocation, approval-to-grant crash/reorder/duplicate,
pre-issuance revocation, successor fork, revocation/final-attempt claim race,
crash after attempt claim before provider I/O, duplicate/substituted claim/
receipt, effect/target drift, consumed-attempt failover/restore, grant/effect
two-stream mutation, approver/policy/target-version drift, mixed quota-claim
split, overlapping-set deadlock/livelock, partial set reserve/restore, token/
digest/membership substitution, cross-partition set, hierarchical capacity-
lease over-allocation/reclamation/failover, rejected active/active authoritative
write, failover before exact-set consumption, concurrency/rate/liability/
retained-byte settlement
confusion, write-off presented as provider evidence, duplicate refund,
compensation claim reuse, exhausted tenant quota during recovery, capacity-lease
expiry with retained bytes/unknown liability/charged operation/spent rate token,
child loss, late settlement, duplicate transfer, parent
reclamation racing failover, every transfer crash/duplicate/reorder/lost-
acknowledgement/source-destination-failover/stale-epoch/conflict point,
forbidden free-at-both-ends capacity, target deletion/merge/migration/
supersession/restore racing dispatch, stale target projection, cross-shard
target placement, remote validator/account/resource substitution, weak/strong
and ABA confusion, provider downgrade/ignored conditional, unsafe refresh,
precondition failure retry, response-loss misclassification, transfer owner/
root/parent/period/lane/class/region/authorization substitution, emergency/
security-cleanup/reconciliation-to-business reclassification through transfer
or adjustment, exception scope/request substitution, revocation/expiry/provider-
capability/final-attempt race, missing guard, restore resurrection, existing-
class rewrite, long pause after admission, authority/target/provider-capability
change before start claim, deadline/audience/request substitution, clock
rollback, concurrent shared-credential workers, claim/worker/lease/permit
substitution, claim-response loss, stale-worker takeover, same-claim replay,
pre/post-claim crash, permit replay/restore/reconstruction, uncertain
retransmission, duplicate instruction RPC, permit IPC/queue/log/core-dump
exposure, digest authorization, executor failover/stale process/compromise,
socket/claim ownership split,
arbitrary unclaimed provider socket use, master-key/general-write or out-of-
broker bearer access, scoped-handle/account substitution, cross-tenant credential
reuse, unrestricted shared credential, egress/TLS/DNS/redirect/general-proxy
bypass, profile/account/credential/broker epoch substitution/rollback,
emergency revocation, account suspension, rotation/ABA, stale instruction/
restored handle, unauthorized/self-approved profile activation, semantic
expansion, stale approver/account/policy fence, tombstone bypass, emergency
replacement, every rotation crash/unknown/evidence/deadline/outage state,
duplicate creation, eventual consistency/continued old-key validity, restored
dual redemption, permission expansion/reduction, role/group/cross-account drift,
callback reorder, stale polling, wrong policy revision, stale/restored snapshot,
evaluator activation/revocation/epoch/reevaluation split brain, mixed
incompatible node, partial reevaluation, quarantine double resolution/
weak-consistency evidence/old-work revival, remediation lineage merge/
derivation/business use/substitution/compromise/outage/response loss/count
exhaustion/no-path automation, remote permission discovery in dispatch, signing/mTLS/HSM export, bearer escape
or caller-owned claim/socket, HTTP/TLS/redirect/log/diagnostic/crash memory-
canary failure,
tenant-invoked capacity policy, ambiguous owner/parent, non-co-located or non-
atomic activation, concurrent allocation/stale high-watermark, delta/
simulation/floor substitution, self-lowered floor, partial rollout/rollback/
restore, floor-reduction/spend actor or approval-lineage reuse, stale
incident/emergency/obligation fences, platform-minimum violation, omitted/
aliased parent, parent add/remove/reparent/generation race, stale root manifest/
epoch, conservation mismatch, coordinator failover, wrong-manifest activation,
allocation/reclamation/floor increase/new protected obligation or incident/
tenant suspension/principal revocation/policy supersession/parent failover
between root finalization and activation, stale prepared activation instead of
blocked reconciliation, floor-profile ID/version/digest/admission-epoch
substitution, stale/lower-floor startup, mixed-version/downgrade/rollback/lower-
default/restore ratchet weakening, reserve-floor/policy replay,
concurrent successor creation, partial-activation rollback, late superseded
preparation/finalization/activation, active-generation substitution,
cancellation/supersession confusion, blocked-parent recovery, superseded
restore, typed floor-key omission/alias/substitution, unit/scale/period/kind/
lane/region/settlement-policy confusion, lossy/overflowing key migration,
cancel after each preparation, lost cancellation delivery, missing/duplicate
recovery successor/receipt, independent parent restore, parent drift during
recovery, missed recovery escalation,
stale tenant/principal/policy authority during transfer, tenant/subject/session/
delegation/policy/principal
revocation racing dispatch, missing/substituted/reordered authority fences,
epoch rollback/reuse, stale external authority, composite lock-order inversion,
bounded-retry exhaustion/identity drift, one-tenant capacity monopolization,
emergency-reserve misuse, failover/failback, and chaos/soak pass. Exit criteria:
split brain and stale workers reject every state-
changing variant; failover cannot bypass authority redemption, impersonate an
offline human, fork a grant lineage, resurrect a consumed attempt, advance grant
and effect streams together, erase or conflate quota claims, consume a partial/
mutated/cross-partition set, overdraw or falsely reclaim a capacity lease, lose
an encumbrance, expose capacity at both transfer ends, bypass an authority or
target fence, weaken remote conditional mutation, reclassify transferred
capacity, use a stale/unfenced unconditional exception, rewrite existing class,
bypass a transmission deadline/current-fence start claim, retry an uncertain
start, return/reconstruct a permit for a second worker or lease generation,
bypass trusted executor claim-plus-socket ownership or move permit authority
across a service boundary, escape its provider execution profile, redeem
unclaimed or cross-tenant credentials, or obtain arbitrary egress, bypass
profile/account/credential/broker revocation/rotation epochs, export key or
bearer material outside its admitted operation/TCB profile, bypass signed typed
profile governance/tombstones, misclassify provider rotation outcomes, or use a
stale/unadmitted credential-capability snapshot,
policy ownership/atomic parent activation/
floor governance/platform-floor ratchet/root-manifest completeness/fresh post-
finalization parent revalidation/conservative rollout/current transfer
authority/active-generation successor/prepared-cancellation-recovery semantics/
total typed-key migration,
duplicate through deadlock retry, duplicate a refund, or starve fair
bounded recovery.
`v0.143.0 implementation stop reached. Run pentest for this exact commit.`

## `0.144.0` — Regional Placement And Residency
Status: planned. Setup: tenant authoritative region, one authoritative write
region per transaction domain, allowed read/DR replicas, fenced failover,
policy labels, failover approval, encryption/keys, and every `0.51.2`
registered surface including external copies. Active/active authoritative
multi-region writes are unsupported for `1.0.0`. Goal: enforce data residency
without implying distributed work transactions. Deliverables: placement engine,
transaction-domain map, incompatible-capability rejection, zero-unmapped-
surface report, and regional runbook.
Verification: cross-region write/read/cache/backup/log/vector/measurement/
plugin/AI/federation leakage, active/active write request, grant guard/effect or
authority-fence/effect or target-owner/fence/effect or quota-set/work split
across regions, remote/projection-only current-target request, stale failover
fence, remote provider/account/resource/region substitution, conditional-
capability downgrade, duplicated/conflicting capacity transfer, transfer
residency/region reclassification, lost acknowledgement, stale source/
destination or provider-capability/policy epoch, exception-guard split across
regions, dispatch-receipt/start-claim split across regions, transmission
deadline extended during failover, worker-instance/lease-claim identity collision
across regions, policy-lineage/parent-ledger/floor split, root manifest that
omits a regional parent or uses stale membership, unsafe partial multi-parent
rollout, unregistered surface, failover bypass, and policy changes pass.
Exit criteria: placement violations, unsupported active/active writes, or
incomplete surface mapping fail closed.
`v0.144.0 implementation stop reached. Run pentest for this exact commit.`

## `0.145.0` — Backup, Restore, And Disaster Recovery
Status: planned. Setup: RPO/RTO profiles and consistent DB/blob/key/config/
retention-hold set, envelope encryption, immutability, rotation/revocation,
crypto-erasure consequences, external checkpoint anchors and drills. Goal:
verified recoverability. Deliverables: backup/restore tools and DR evidence.
Verification: substitution, partial/stale backup, lost/rotated key, held/erased
data, point-in-time restore, every `0.18.2` atomic work variant and denial-only
audit-chain integrity, external anchors, registered tenant-surface disposition,
typed external-copy evidence-strength honesty, measurement rollup manifests,
rollup checkpoint inclusion and substitution-expiry gates, mandatory deletion
during unavailable proof, independent rollup/manifest/result/cache/export/
linkable-checkpoint disposition, non-sensitive tombstone and historical
authority-loss records, complete grant-lineage owner/successor/tombstone
restoration, redemption-guard version/revocation/consumed-attempt and matching
claim/receipt restoration, every monotonic authority epoch and bound fence-set
receipt, every target-fence version/digest/lifecycle/deletion/supersession epoch,
every remote-target profile, validator provenance/strength, provider capability/
version and monotonic epoch, request/idempotency binding, exception owner/scope/
approval/time/attempt/revocation/supersession state, guard version/claims/
receipts, reviewed exception, dispatch `redeemed_at`/`transmit_before`, admitted
bindings/epochs, claim ID, worker instance, lease generation/fence, permit
digest, immutable instruction/executor identity, and status—but no live permit
material or transferable capability,
admitted `ProviderExecutionProfile` identity/version/digest, pool trust domain,
opaque scoped-handle metadata and claim/request/account/action/destination/
expiry redemption receipt—but no plaintext credential or master key—plus
network allowlist/TLS/DNS/redirect policy, authoritative profile lineage/
generation and never-reused profile/account/credential/broker-policy epochs,
credential-operation profile and bearer-broker TCB declaration—but no bearer
material—plus profile proposals/approvals/signed admission/digest/semantic diff/
activation fences/tombstones, rotation lineage owner/guard/stable ID/intended
successor/provisioning idempotency/takeover/provider inventory/orphan and
credential-count state/provider evidence/unknown outcome/overlap and escalation
deadlines/local activation/revocation receipts, and credential-capability
snapshots/local epochs/raw-policy and normalized-AST digests/evaluator identity
and version/policy language and version/canonical comparison and explanation/
observation provenance/freshness/provider-policy validators/quarantine incidents,
evaluator lineage/generation/signed binary-and-corpus admission/provider-
language compatibility/epoch/reevaluation state, quarantine investigation/
remediation/replacement-or-revalidation/resolution/current-evidence/resolver/
consistency/new-capability-generation/pre-resolution-tombstone state,
independent remediation profile/credential-lineage/approval/audit/epoch/egress/
cleanup-quota/manual-only limitation, evaluator re-evaluation job generations/
queue partitions/cursors/attempts/leases/freshness/priority/fairness/provider-
rate/cleanup-lane/escalation, invalidation-campaign root/snapshot index/cutoff/
shard-page cursors/materialization-disposition counts/completeness proof/
successor tombstones/stuck state, remediation ceremony/channel/KMS/quorum/
compromise-loss-recovery epoch/expiry/exercise evidence, and the complete
declaration-derived stable-invariant ownership/lifecycle/contract/fence and
monotonic-state manifest,
whole quota claim-set digest/member restoration with partial-set
quarantine, hierarchical capacity-lease epoch/allocation/unreserved-remainder/
per-kind encumbrance/transfer state/receipt/acknowledgement/original-claim-and-
transfer-lineage plus accounting owner/root/parent/period/lane/class/region/
authorization restoration, capacity-policy version/simulation/protected floors,
one-parent lineage/parent epoch/high-watermark/exact deltas/independent floor-
set owner/history/reduction receipts/cross-command separation, platform-floor
profile ID/version/digest and fully typed key/admission epoch/high-watermark
with total key-migration evidence, root
manifest/digest/membership epoch/complete parent set/conservation
totals, active rollout generation, predecessor/successor lineage, typed
cancellation/supersession state, multi-parent prepared/finalized/activated/
blocked/reconciliation receipts, cancellation-recovery generation/actual-limit
manifest/idempotent receipt/deadline/escalation state, and local activation
evidence, delayed-transition authority epochs, rebuild/
workflow continuation pass.
Exit criteria: claimed RPO/RTO is demonstrated; recovery neither retains data
past a controlling mandatory deletion obligation nor promotes an unverified
rollup to authority; grant revocation/supersession cannot be resurrected; quota
sets are restored/reconciled only as complete verified units; consumed attempts
cannot be resurrected and authority epochs cannot roll back to pre-revocation
values; target epochs cannot roll back to pre-deletion or pre-supersession
values; parent capacity is not recreated while an encumbrance survives;
uncertain transfers stay conservatively charged, and a restored transfer can
never make capacity free in both partitions or change classification. Recovery
cannot refresh a remote validator, promote weak to strong, or invent a reviewed
unconditional exception; cannot resurrect an exception attempt, reclassify
existing capacity, extend/replay a transmission window or classify an uncertain
start as unsent, reconstruct, transport, or return permit authority from a
stored claim/digest,
recover an unscoped credential, master-key/general-write authority, or broader
egress than the restored provider execution profile; roll back a profile/
account/credential/broker epoch; resurrect a revoked profile, rotated credential,
or stale handle; lose profile approval/tombstone evidence; restore two locally
redeemable credential generations; regress an unknown/pending rotation, create
a second non-terminal guard, erase stable idempotency/takeover/orphan/count
state, release quota before confirmed revocation, or erase old-credential
identity/provider evidence/deadlines; restore a stale, broader, wrong-revision,
unverifiable, evaluator-downgraded, or semantically unknown credential-capability
snapshot/epoch; clear whole-credential quarantine or revive any queued/claimed/
apparently non-privileged handle for it; roll back evaluator lineage/epoch,
accept an unvalidated binary/corpus/language version, make old output current,
lose `ReevaluationRequired`, partially advance or generically clear quarantine,
erase resolver/strong-revision/consistency/remediation evidence, reuse the old
capability generation, revive pre-resolution authority, merge remediation and
business credential lineages, restore remediation business scope, lose cleanup
quota, or invent an independent recovery path; recover
bearer material outside the hardened broker TCB,
roll back a policy lineage/parent high-watermark/floor history/root manifest/
membership epoch/active rollout generation/supersession/parent-activation
receipt, reactivate a superseded generation, treat partial activation as
cancellation, independently release a cancelled prepared parent, lose/duplicate
a recovery successor or receipt, omit current recovery revalidation/deadline
state, accept an incomplete/lossy/overflowing typed-key migration, erase cross-command
separation evidence, lower/omit the durable platform-floor ratchet, start a
restored node below it, activate stale prepared parent state, or authorize a
delayed transition from historical decisions alone; and every related surface
has its own disposition proof.
`v0.145.0 implementation stop reached. Run pentest for this exact commit.`

## `0.146.0` — Performance, Load, Soak, And Chaos Certification
Status: planned. Setup: representative workloads, SLOs, durable `0.18.1` quota
profiles, separate Vitheim-telemetry and customer-measurement capacity models,
paging/status provider limits, bounded claim-set sizes, every `QuotaKind` and
settlement boundary, per-kind hold/refund/release/settle/write-off semantics,
separate compensation accounting, tenant/work-class partitioned reconciliation/
security-cleanup capacity, single-partition claim-set placement, hierarchical
capacity-lease allocation/expiry/reclamation/fencing, global fair share,
per-kind encumbrance/transfer/late settlement, canonical composite lock order
and bounded deadlock retry, target-fence contention, remote-target conditional-
provider profiles and exception-guard contention, immutable transfer
classification, transmission-window/start-claim/permit contention, one-parent
policy activation, protected-floor governance/platform-floor ratchet, and
complete-root-manifest/fresh-parent-activation rollout contention, delayed-
transition authority epochs, active-root-generation successor contention,
fully typed floor-key migration, provider-execution-profile scoped-credential/
pool/egress and profile/account/credential/broker-epoch contention, credential-
profile-governance activation/revocation contention, credential-rotation
guard/idempotency/takeover/orphan/count/process/evidence/deadline contention,
capability-observer semantic-evaluator/event/poll/freshness/quarantine contention,
evaluator-lineage activation/revocation/reevaluation contention, quarantine-
resolution consistency-barrier/new-generation contention, remediation
credential-lineage/cleanup-quota/sole-key-recovery contention,
tenant/provider/account evaluator-queue fairness, provider-rate and
non-borrowable cleanup-lane contention, repeated evaluator-generation
replacement, remediation ceremony quorum/channel/KMS/recovery-epoch and
exercise contention, evaluator campaign root/enumeration/materialization/
completeness contention, invariant declaration/owner/lifecycle/contract/fence
coverage,
starvation bounds,
emergency reserve, baselines, failure scenarios, and evidence retention. Goal:
prove bounded behavior under stress.
Deliverables: multi-claim quota-lifecycle/load/fault harnesses, per-kind
settlement and exact-set linearization oracles, partition/fairness/reserve
monitors, hierarchical-capacity-lease conservation and per-kind encumbrance-
transfer oracles, composite-lock/retry contention harness, target-change-versus-
dispatch and remote-conditional-mutation harnesses, transfer-classification
and exception-guard harnesses, transmission-pause/deadline/clock/uncertainty
harness with duplicate claimants/lease takeover/claim-response loss, split-
executor duplicate-instruction/no-permit-transport/failover harness, policy
owner/parent/floor-governance/ratchet/root-manifest/fresh-activation oracle,
active-generation/successor/typed-key migration oracle, provider credential-
scope/epoch/operation-profile and egress-isolation harness, bearer HTTP/TLS/
redirect/diagnostic/crash memory-canary harness, cancellation-recovery/
deadline oracle, profile-governance/semantic-diff/tombstone race harness,
rotation crash/unknown/evidence/guard/orphan/count/eventual-consistency oracle,
provider-permission semantic-evaluator/corpus/drift/capability-snapshot/
whole-credential-quarantine observer oracle, evaluator-upgrade/mass-reevaluation
campaign enumeration/completeness and partitioned fair-scheduler/fresh-evidence
oracle, quarantine-resolution/no-
old-work-revival oracle, independent-remediation bootstrap/simultaneous-loss/
compromise/channel/KMS/outage/manual-limit/exercise oracle, invariant-registry
coverage oracle,
leak/escalation evidence, and signed reports. Verification: atomic
bounded claim sets across every work bundle, concurrent overlapping-set
canonical acquisition, deadlock/livelock freedom, partial-reservation crash and
failover, immutable token/digest/membership, whole-set restore/reconciliation,
single-partition placement, parent/child lease conservation, lease churn/
expiry/reclamation, failover duplication, cross-shard/region rejection,
expiry with retained bytes/unknown liability/charged operation/spent token,
child loss, late evidence, duplicate transfer, reclamation/failover races,
lost acknowledgements, transfer message reorder, source/destination failover,
stale epochs, conflicting transfers, conservative double-entry recovery,
owner/root/parent/period/lane/class/region/authorization substitution, recovery/
emergency-to-business reclassification, remote validator/account/resource
substitution, weak/strong/ABA confusion, conditional downgrade/ignore, silent
refresh, precondition and response-loss outcome confusion,
exception revocation/expiry/provider-capability/final-attempt races, guard
omission/restore resurrection, protected-class adjustment, existing-class
rewrite, transmission deadline and current-fence start-claim races, long pause,
clock rollback, concurrent shared-credential workers, claim/worker/lease/permit
substitution, claim-response loss, takeover, permit restore/replay/
reconstruction/transport, digest authorization, duplicate instruction, executor
failover/compromise, arbitrary unclaimed provider socket use, secret-handle/
account/cross-tenant substitution, unrestricted shared credentials, egress/TLS/
DNS/redirect/general-proxy bypass, profile/account/credential/broker epoch
rollback/race, emergency revocation, account suspension, rotation/ABA, stale/
restored handle, unauthorized/self-approved profile activation, hidden
expansion, stale activation fence/tombstone, emergency replacement, every
rotation crash/unknown/evidence/deadline/outage state, duplicate creation,
eventual consistency/continued old-key validity, restored dual redemption,
permission/role/group/cross-account drift, callback reorder, stale polling,
wrong policy revision, stale/restored snapshot, remote discovery in dispatch,
evaluator security-fix/semantic/corpus activation, emergency revocation, epoch
rollback, mixed incompatible nodes, partial/mass reevaluation under load,
generic or inconsistent quarantine resolution, missing consistency barrier/
resolver separation, old-work revival, sole-key quarantine, remediation
compromise/derivation/business use/circularity/substitution/outage/response
loss/count exhaustion/no-path automation,
signing/mTLS key export, bearer TCB escape/caller-owned claim/
socket/memory-canary failure, uncertain retransmission, tenant-invoked capacity policy,
owner/parent ambiguity, concurrent allocation, stale high-watermark, self-
lowered floor, floor-reduction/spend approval reuse, stale operational fences/
obligations, platform-minimum violation, omitted/aliased parent, membership
race, stale manifest/root epoch, conservation mismatch, coordinator failover,
wrong-manifest activation, post-finalization allocation/reclamation/floor/
obligation/incident/tenant/principal/policy/parent drift, stale activation
instead of blocked reconciliation, floor-profile/ratchet substitution, lower-
floor startup, mixed-version/downgrade/rollback/restore weakening, partial
rollout/rollback/restore, floor/simulation replay, stale activation/
acknowledgement authority,
concurrent successor creation, late superseded messages, superseded restore,
cancellation/supersession confusion, typed-key omission/substitution, unit/
scale/period/kind/lane/region/settlement-policy confusion, lossy/overflowing
key migration, cancellation after each preparation, lost/duplicate cancellation
or recovery receipt, missing/duplicate recovery successor, independent parent
restore, recovery drift/deadline escalation,
composite lock-order contention, retry exhaustion/identity preservation,
concurrency release independent of remote outcome,
consumable-operation evidence rules, non-refundable transmitted rate tokens,
unknown estimated liability and actual-cost/overage reconciliation, retained-
byte allocation/deletion, duplicate/forged refunds, administrative write-off
separation, indefinite provider-dependent holds, cancellation/dispatch/
transmission/provider-evidence races, compensation accounting, provider-outage
tenant exhaustion, one-tenant unknown-outcome floods, per-tenant/global
starvation, emergency-reserve borrowing, noisy tenants, observation late-
arrival/authoritative-rollup recalculation/downsampling,
paging/status retry/reconciliation, queue/index/embedding/plugin/report
exhaustion, leaks, cascading failures, and long soak/chaos pass. Exit criteria:
regressions, cross-kind settlement, partial/mutated/cross-partition set
acceptance, capacity-lease over-allocation, deadlock/livelock, unbounded quota
liability, lost/duplicated encumbrance, capacity free at both transfer ends,
capacity reclassification, target-fence or remote-conditional race failure,
stale/unfenced exception use, existing-class rewrite, protected-floor/policy or
transmission-window/start-claim bypass, uncertain-start retry, non-atomic policy
activation, duplicate/reconstructed permit authority, floor-governance/cross-
command separation/platform-floor ratchet/root-manifest completeness/fresh
parent activation bypass, permit transport or claim/socket split, unsafe partial
rollout, active-generation/successor or total typed-key-migration bypass,
provider credential/egress scope or epoch escape, bearer TCB/memory escape,
profile-governance/tombstone bypass, rotation-state/guard/orphan/count/evidence/
deadline corruption, credential-capability evaluator/drift/freshness/whole-
credential-quarantine/resolution/new-generation/tombstone bypass, evaluator-
lineage/reevaluation/startup bypass, remediation-authority isolation/manual-
limit bypass, prepared-cancellation recovery bypass, delayed-authority bypass, retry-driven
duplicate work, unfair or
blocked recovery, and unsafe saturation block release.
`v0.146.0
implementation stop reached. Run pentest for this exact commit.`

## `0.147.0` — Final Security And Supply-Chain Hardening
Status: planned. Setup: complete threat model, dependency/tool/action inventory,
semantic SBOM, reproducibility, full key generation/storage/use/rotation/revocation/
recovery/destruction lifecycle, `0.28.3` in-process memory assurance, crash/
core-dump/swap profile, sealed transmission-permit construction/consumption/drop
assurance, executor isolation, provenance and secret scanning. Goal: close build
and runtime supply-chain paths. Deliverables: audits, candidate-tree/artifact-
bound signed evidence, SBOM/provenance, reproducible artifacts, permit-memory/
diagnostic exposure report, executor credential-operation/egress isolation and
residual-blast-radius report, bearer-broker memory lifetime/zeroization/
allocator/TLS-library/redirect/diagnostic/crash/core-dump/swap assurance report,
profile-governance/semantic-diff/approval/tombstone audit, credential-rotation
lineage-owner/guard/idempotency/takeover/orphan/count/provider-evidence/unknown-
state/overlap/deadline assurance report, provider-IAM semantic-evaluator/corpus/
capability-observation/freshness/drift/quarantine assurance report,
permission-evaluator lineage/signed-binary/corpus/epoch/upgrade/revocation/
reevaluation/startup assurance report, quarantine-resolution evidence/
separation/consistency/new-generation/tombstone assurance report, independent
remediation credential/profile/lineage/audit/egress/cleanup-quota/manual-limit
assurance report,
and hardening guide.
Verification: compromised builder/dependency/action/key, secret canaries across
diagnostics/plugins/crash paths, stale or name-only SBOM, wrong pentest parent/
tree/artifact, permit clone/serialization/log/core-dump/swap canaries, failed
zeroization, executor compromise, substitution, and unsafe delta pass.
Include master-key/general-write and out-of-broker bearer canaries, arbitrary
unclaimed socket use, handle/account/cross-tenant substitution, and
allowlist/TLS/DNS/redirect/general-proxy bypass; profile/account/credential/
broker epoch rollback/ABA/restore; signing/mTLS/HSM export; bearer-header/TLS/
redirect/log/diagnostic/crash/core-dump/swap exposure; and caller-owned claim or
socket. Include unauthorized/self-approved activation, hidden semantic
expansion, stale fences/tombstones, rotation crash/unknown/evidence/deadline/
single-key-outage/guard/idempotency/takeover/orphan/count cases, and semantic
wildcard/deny/resource/condition/boundary/inheritance, evaluator downgrade or
budget exhaustion, unsafe subset admission, quarantine bypass, and forged/stale/
broader/wrong-revision capability snapshots or authenticated-event/poll reorder.
Include evaluator supply-chain substitution, unsigned binary/corpus, epoch
rollback, emergency-revocation lag, partial reevaluation, unsafe quarantine
clear or old-work revival, resolver collusion, and remediation credential
compromise/derivation/business use/circularity/substitution.
Exit criteria: every trusted input is pinned/accounted. `v0.147.0 implementation stop reached. Run pentest for this exact commit.`

## `0.148.0` — Compatibility Freeze
Status: planned. Setup: freeze API/event/workflow/policy/plugin/pack/export/agent
versions and support windows, immutable event-schema registry, complete pure
upcaster chains, original-byte hash authority, unknown-event quarantine, and the
platform-floor profile compatibility/admission matrix including full
`PlatformSafetyFloorKey` schemas/migrations, `ActiveRolloutGeneration` and
successor-state compatibility, and `ProviderExecutionProfile` protocol/
credential/egress compatibility including lineage/generation/epoch guards,
credential-operation discriminator and bearer-broker TCB placement, plus
profile lifecycle command/approval/admission/diff/tombstone compatibility,
rotation-state/guard/idempotency/takeover/orphan/count/evidence/deadline/outage
compatibility, capability-snapshot/local-epoch/raw-and-normalized-digest/
evaluator-version/result/freshness/validator/quarantine compatibility,
evaluator-lineage/generation/admission/epoch/reevaluation/startup compatibility,
quarantine-resolution/new-generation/tombstone/evidence compatibility,
remediation-profile/credential-lineage/audit/epoch/quota/manual-limit
compatibility, plus cancellation-recovery
generation/receipt compatibility.
Goal: remove version ambiguity before RC. Deliverables: compatibility matrices,
golden mixed-version event corpus, migration/rebuild suites, and deprecation
rules. Verification: downgrade/skew/unknown versions, upcaster determinism,
original-byte mutation, rolling upgrades, old data/plugins/agents, stricter
mixed-version floor selection, stale/lower-floor node rejection, lower-default
release, interrupted higher-floor or typed-key migration, unit/period/kind/
lane/region/settlement-policy substitution, mixed rollout generations, late
superseded messages, provider-profile/handle-protocol skew, and rollback/restore
ratchet pass; include profile/account/credential/broker epoch skew/rollback,
profile-command/approval/tombstone skew, rotation state/guard/idempotency/
takeover/orphan/count/evidence/deadline skew, capability-snapshot/epoch/evaluator/
canonical-result/freshness/provider-validator/quarantine skew, evaluator-
lineage/admission/epoch/reevaluation/startup skew, quarantine transition/
resolution/tombstone skew, remediation profile/lineage/quota/manual-limit skew, operation-profile
confusion, bearer TCB drift, cancellation-recovery successor/
receipt/deadline skew, and independent-parent-release rejection.
Exit criteria: supported combinations are exact and no compatible version path
can lower the durable platform floor, reactivate a superseded rollout, or
broaden executor credential/network authority.
`v0.148.0 implementation stop reached. Run pentest for this exact commit.`

## `0.149.0` — External Pentest Remediation Candidate
Status: planned. Setup: freeze scope/artifacts/environment and engage independent
testers across all trust boundaries, including provider-profile governance,
serialized remote credential rotation/takeover/orphan cleanup/count quotas,
provider permission evaluator governance/reevaluation, evidence-backed whole-
credential quarantine resolution, independent remediation authority, and
the credential broker/executor TCB. Goal: remediate complete attack paths.
Deliverables: findings, fixes, regression tests, and clean retest evidence.
Verification: external pentest plus tenant/auth/plugin/AI/storage/operations/
supply-chain regression passes; test unauthorized or semantically expanded
profile activation, tombstone bypass, rotation guard/idempotency/takeover/orphan/
count/unknown/evidence/deadline abuse, restored dual redemption, semantic
evaluator downgrade/budget/construct confusion, unsafe subset admission, whole-
credential quarantine bypass, evaluator activation/revocation/epoch/startup
bypass, unsafe clear/old-work revival, remediation escalation/circularity/no-
path automation, and forged/stale/broader capability snapshots.
Exit criteria: all critical/high findings are fixed and retested.
`v0.149.0 implementation stop reached. Run pentest for this exact commit.`

## `0.150.0` — Final Production-Readiness Candidate
Status: planned. Setup: candidate from remediated freeze; exact install/upgrade/
restore/rollback/failover artifacts and evidence, selected trusted-executor
deployment and provider execution profiles, active rollout generation/
successor/cancellation-recovery state, monotonic profile/account/credential/
broker-policy epochs and selected credential-operation/bearer-broker TCB
profiles, profile-governance approvals/tombstones, credential-rotation lineage/
guard/idempotency/takeover/orphan/count/provider-evidence/deadline state,
credential-capability snapshots/epochs/evaluator/comparison/freshness/
quarantine state, evaluator lineage/admission/epoch/reevaluation state,
quarantine investigation/remediation/verification/resolution/new-generation/
tombstone state, independent remediation profile/credential-lineage/audit/
cleanup-quota/manual-only state, and durable fully typed floor-profile ratchet state. Goal:
final pre-RC readiness
proof. Deliverables: complete candidate bundle, runbooks, acceptance report,
no-permit-transport proof, fresh-parent-activation evidence, and floor-ratchet
compatibility evidence including total typed-key migrations and successor
rollbacks. Verification: clean install, split executor, scoped credential and
egress isolation, arbitrary unclaimed socket and cross-tenant handle rejection, duplicate
profile/account/credential/broker epoch revocation/rotation/restore checks,
profile lifecycle authorization/semantic expansion/activation-tombstone checks,
every rotation crash/unknown/evidence/overlap/deadline/outage/restore/guard/
idempotency/takeover/orphan/count check, out-of-band provider wildcard/deny/
resource/condition/boundary/inheritance/role/group/trust semantic evaluator/
event/poll/snapshot/quarantine check,
evaluator signed-binary/corpus activation/revocation/epoch/reevaluation/startup
check, quarantine current-evidence/consistency/resolver/new-generation/no-
revival check, remediation independence/business-denial/outage/response-loss/
count-exhaustion/manual-limit check,
signing/mTLS non-exportability and bearer HTTP/TLS/redirect/diagnostic/crash
memory canaries,
instruction/response loss/failover, rolling upgrade, higher-floor migration,
lower-floor downgrade rejection, restore, rollback, parent-state drift after
root finalization, concurrent successor, late superseded messages, typed-key
substitution/migration failure, cancellation after every preparation point,
lost recovery delivery, coordinator failover, parent drift, restore of cancelled
prepared state, load, compatibility, and evidence
reproducibility pass. Exit criteria:
no known blocking gap remains.
`v0.150.0 implementation stop reached. Run pentest for this exact commit.`
