# Pre-Production Profile Freeze Decisions

Scope: `0.140.1–0.140.10`. These evidence-producing releases revalidate and
freeze production profiles from version-bound implementation-admission records
created at each first consuming milestone. They are never the first dependency,
protocol, backend, or runtime selection and cannot retroactively legitimize
unreviewed code. Phase O may certify only selected profiles; unselected profiles
remain unsupported at `1.0.0`.

## `0.140.1` — Dependency, Cryptography, And KMS Decision

Status: planned.
Setup: inventory TLS, identity, database, WASM, crypto, timestamp, secret, and
KMS needs; compare audited implementations, maintenance, licenses, features,
unsafe/native code, replacement boundaries, and first-party risk.
Goal: freeze the production subset of previously admitted implementations and
resolve any remaining zero-dependency/production-security conflict explicitly.
Deliverables: revalidated admission-record inventory, approved production
dependency allowlist or blocked features, crypto/KMS/key-rotation/timestamp
profiles and adapter boundaries. The timestamp profile must define authoritative
transaction time, persisted `redeemed_at`/`transmit_before`, monotonic
transmission-start enforcement, maximum admission-to-transmission intervals,
rollback/suspend behavior, and fail-closed handling when remaining time cannot
be trusted. Freeze the `1.0.0` decision that permit material remains a sealed,
consumed-by-value, best-effort-zeroized process-local value inside a trusted
executor that owns the provider socket. A transferable cryptographic permit is
unsupported; enabling one later requires a new milestone and independent design
review for entropy, authentication, channel/audience binding, constant-time
verification, zeroization, and durable replay prevention.
Freeze the credential-operation mechanism used by every
`ProviderExecutionProfile`: external KMS/secret services retain master keys;
upstream and general executor components receive only opaque tenant/provider/
account/action/request/destination/claim-bound handles. The admitted broker
operation uses the least-privilege, shortest-lived provider credential
supported. Any provider that requires an unrestricted credential
shared across unrelated tenants is unsupported for `1.0.0`; no first-party
cryptography may be improvised to hide that limitation.
Freeze the profile/account/credential/broker-policy epoch mechanism. Freeze the
remote `ProviderCredentialRotationState`, admissible provider identity/
permission/revocation evidence, atomic local successor activation, unknown-
response reconciliation, bounded overlap/escalation, single-credential outage
profile, and restore ratchet. Freeze exactly one credential-lineage owner and
co-located non-terminal rotation guard, stable rotation ID/successor generation,
provider idempotency key/request digest, unknown-state successor block,
authorized provider-inventory takeover, orphan quarantine/revocation states and
late-callback fences, and typed provider-credential-count quota accounting.
Freeze the independent `ProviderCredentialRemediationAuthority` profile for
each provider: separately admitted administrative credential or recovery
channel, inventory/create/disable/revoke-only scope, separate lineage/approval/
audit/epochs/egress/security-cleanup quota, rotation/takeover-only redemption,
and no derivation from quarantine or business-operation authority. If the
provider has no independent path, freeze an explicit manual-intervention-only
limitation and outage consequence.
Freeze `ProviderCredentialOperationProfile`:
non-exportable signing/mTLS/HSM exposes operations only; brokered bearer/API-key
transmission places authorization serialization, redirects, TLS, start claim,
and socket inside the hardened broker/executor TCB; provider-required export to
a general connector is unsupported. State explicitly that bearer bytes may
briefly exist in that hardened broker memory and define its zeroization,
allocator/TLS-library, diagnostics, crash/core-dump, and swap limitations.
Verification: independent supply-chain and cryptographic design review proves
N0/N1 remain isolated and no protocol is improvised to avoid dependencies;
deadline extension, wall-clock rollback, host suspend, restore, and monotonic-
clock failure cannot make an expired dispatch permit usable; cloning,
serialization, IPC/RPC/queue/log/core-dump exposure, digest authorization, or an
unreviewed transferable-capability profile fails the decision.
Review handle substitution, cross-tenant redemption, credential lifetime and
scope inflation, master-key exposure, and provider-account confusion against
the exact admitted KMS implementation; include epoch rollback/ABA/restore,
every rotation crash/unknown/evidence/deadline state, duplicate creation,
simultaneous rotation, timeout-then-provider-create, late callback, takeover,
orphan revocation loss, credential-count exhaustion, eventual consistency,
sole-credential quarantine, remediation credential compromise, derivation or
circular authority, business-operation use, provider/account/tenant
substitution, remediation response loss/outage/count exhaustion, unsupported
automatic recovery, old-key continued validity, private-key export, bearer TCB escape, and HTTP/TLS/
redirect/diagnostic/crash memory canaries.
Exit criteria: Phase O has one approved, replaceable crypto/key profile.
`v0.140.1 implementation stop reached. Run pentest for this exact commit.`

## `0.140.2` — Tenant And Storage Topology Decision

Status: planned.
Setup: compare dedicated/shared tenancy for SQLite, PostgreSQL forced RLS,
MySQL database-per-tenant/composite enforcement, MongoDB partitioning, and
SurrealDB namespace/permission profiles against the same conformance suite.
Map local transaction domains for aggregate streams, redemption guards, effect
work bundles, dispatch-authority fence rows, quota partitions, and hierarchical
capacity leases. Map remote-mutation-exception owners/guards/provider-capability
epochs and transmission-window/start-claim rows. Map profile-governance lineage/
proposal/approval/admission/digest/diff/tombstone
rows and atomic activation placement, credential-rotation state/provider-
evidence/unknown/deadline/local-activation rows, credential-lineage/rotation-
guard/idempotency/digest/takeover/orphan/count-encumbrance rows, credential-
capability snapshot/epoch/freshness/validator/reconciler/raw-policy/normalized-
AST/evaluator/language/comparison/explanation/reduced/quarantine/incident rows.
Map the evaluator lineage/generation state, signed binary/corpus admission,
provider/language compatibility, monotonic evaluator epoch, reevaluation
requirements, and startup/readiness gate. Map the credential-capability owner,
investigation/remediation/replacement-or-revalidation/resolution transitions,
strong-revision/consistency/resolver-separation evidence, new capability
generation, permanent pre-resolution tombstones, and incident linkage. Map the
independent remediation profile/credential lineage/approval/audit/epochs/egress/
security-cleanup quota and rotation/takeover redemption guard separately from
the business credential.
Map capacity-policy lineage owner/
one-parent ledger/high-watermark, protected-floor history/reduction/separation/
platform-floor profile/admission/ratchet rows, hierarchy-root manifest/
membership/conservation/rollout rows, prepared-to-activated/blocked parent CAS,
monotonic `ActiveRolloutGeneration`, cancellation/supersession state, successor
root lineage, cancellation-recovery generation/actual-limit manifest/idempotent
receipt/deadline state, fully typed `PlatformSafetyFloorKey` rows and total key-migration
evidence, and current-transition-authority rows. Map target
owners and authoritative `DispatchTargetFence` rows
with the effect bundle, including same-aggregate expected-version handling.
Reject any profile that needs remote, cross-shard, or projection-only current-
target semantics or a cross-shard/region distributed work transaction. Compare
capacity-transfer outbox/inbox placement and receipt semantics without accepting
a distributed exactly-once delivery claim.
Goal: freeze exact production storage, tenant-isolation, and local transaction-
domain profiles from tested adapters; default candidates are SQLite single-node
and PostgreSQL HA.
Deliverables: supported/rejected profile matrix, capability probes, application
and administrator threat boundaries, transaction-domain/co-location map,
active/active rejection evidence, migration and portability consequences.
Verification: twin-tenant collision, superuser/non-owner, pooling-state,
constraint, non-co-located grant guard/effect bundle, cross-partition claim set,
missing/non-co-located authority fence, stale/duplicated capacity lease,
missing/non-co-located target fence, target owner/fence/effect split, remote or
projection-only current target, distributed-exactly-once transfer claim,
non-co-located exception guard/effect/epoch, mutable existing-class schema,
non-co-located receipt/start-claim state, audience-only claimant, duplicate or
persisted/reconstructable start permit, missing worker-instance/lease-fence/
claim/permit binding, permit transport or digest authorization,
non-co-located profile lineage/activation/tombstone, unsigned or stale approval,
rotation owner/state/evidence/deadline split, non-atomic local activation,
missing/non-co-located rotation guard, two non-terminal rotations, lost orphan/
count encumbrance, capability snapshot/epoch/quarantine/claim split, cleared
quarantine on restore, evaluator lineage/epoch/reevaluation split, old evaluator
output surviving activation/revocation, incompatible-node startup, partial
quarantine transition or old-work tombstone loss, generic/incident-only clear,
missing strong revision/consistency barrier/resolver separation, remediation
lineage merged with business credentials or quota, stale observer state or
dispatch-time remote discovery,
ambiguous or multi-parent policy owner, non-co-located policy stream/parent
ledger/floor row, non-atomic activation, shared floor/policy authority, missing
operational fences/platform minimum/cross-command separation, incomplete or
coordinator-discovered parent set, missing root manifest/epoch/conservation,
root finalization used as stale parent authority, missing fresh local activation
CAS/blocked state, lower-floor node or lost ratchet during upgrade/restore,
unsafe partial rollout, multiple active generations, late superseded message,
restore resurrection, prepared cancellation without one complete recovery
successor, independent parent restore, duplicated/lost recovery receipt, missing
current-state/authority recovery check or deadline escalation, incomplete/lossy/overflowing safety-floor key migration,
unit/period/kind/lane/region/settlement-policy substitution, missing transition epoch,
advertised active/active authoritative writes, backup/export, and fail-closed
capability evidence is reviewed.
Exit criteria: weaker isolation, unavailable co-location, and any topology that
requires a distributed work transaction are rejected, not relabeled supported.
`v0.140.2 implementation stop reached. Run pentest for this exact commit.`

## `0.140.3` — Identity And Session Profile Decision

Status: planned.
Setup: compare exact OIDC conformance profiles/providers, WebAuthn level and
attestation/counter policy, session stores, recovery, logout, and the `0.52.1`
machine-to-machine profiles. Review `private_key_jwt`/mTLS choice, workload
token lifetime/audience/proof, exact sender-constraint profile, privileged
workload requirements, any restricted-bearer action matrix, external issuer/
key rotation and revocation, replay-cache limitations, authentication-assurance
expiry/freshness at interactive dispatch, assurance captured when an approval
creates `ApprovedExecutionGrant`, current service-principal proof at automation
dispatch, and the separate local-agent enrollment profile. Freeze the rule that
a worker authenticates as itself and never impersonates an offline approver;
normal approver-session expiry does not invalidate a valid grant, while the
grant's exact current revocation/revalidation rules remain mandatory. Confirm
that privileged dispatch uses co-located authoritative local subject/principal,
session/credential/mapping revocation epochs; any external-only bounded-
staleness profile is classified and unsupported for privileged
`CommitAndDispatch` effects. Also confirm that Vitheim remains an OAuth resource
server, stores no client private credentials, exposes no token
endpoint, and keeps personal access tokens/static API keys disabled.
For each selected live-subject and service-principal profile, freeze the exact
expiry/assurance/current-epoch inputs that constrain
`DispatchTransmissionWindow`; a profile that cannot supply an enforceable
validity bound and authoritative local recheck is unsupported for privileged
transmission.
Freeze an authenticated `WorkerInstanceId` profile distinct from shared service
credentials. It must be unique per runtime instance/boot, bind the work-lease
generation and fencing token, and become unusable on replacement, restart, or
credential remapping; audience validation alone cannot identify a transmission
claimant.
Goal: revalidate and freeze production authentication profiles independently of authorization.
Deliverables: selected issuer/discovery/PKCE/token/session/logout rules,
WebAuthn RP/origin/challenge/credential rules, selected workload-auth profile,
external-issuer trust and mapping rules, separate agent-enrollment rules,
sender-constrained privileged profile, any lower-assurance restricted-bearer
profile, explicit no-authorization-server/PAT/API-key/token-exchange
disposition, live-subject/service-principal/grant assurance mapping, local
revocation-epoch/staleness profile, transmission-deadline inputs/current-start-
claim mapping, worker-instance/lease-fence identity profile, and unsupported
combinations. Any
future Vitheim OAuth authorization server
requires a new implementation milestone and cannot be selected here.
Verification: protocol conformance, mix-up/replay/fixation/recovery, false
sender constraint, proof/token substitution, bearer privilege escalation,
first-use stolen bearer behavior, effect dispatch after credential/session/
assurance expiry or revocation, valid scheduled grant after approver-session
expiry, authority-epoch change racing dispatch, stale/substituted epoch,
bounded-stale external authority used for privileged work, offline-human
impersonation, grant assurance substitution, authority expiry or revocation
after receipt but before start claim, concurrent replicas sharing credentials,
worker-instance collision/remap, stale lease generation, takeover/restart, key
rotation, enumeration, and degraded-provider behavior are independently
reviewed.
Exit criteria: production auth never falls back to the `0.40.0` test profile.
`v0.140.3 implementation stop reached. Run pentest for this exact commit.`

## `0.140.4` — Plugin Runtime And Isolation Decision

Status: planned.
Setup: compare Component Model runtimes, supported WIT/WASI level, process or
container isolation, host metering, egress proxy, update, sandbox operations,
catalog/storefront trust, publisher admission, offline mirrors, rollout, and
the invariant that plaintext credentials never enter Wasm guest memory. Freeze
the broker profile that enforces immutable effect bindings, mandatory current
dispatch authorization for high-risk capabilities, service-principal or exact
approved-grant redemption, bounded typed quota claim sets and settlement, and
denial of plugin access to control-plane emergency reserve. Freeze provider-
mutation profiles: admitted strong conditional mechanisms and validator
semantics, explicit unsupported cases, and narrowly reviewed unconditional
exceptions. Freeze unconditional exceptions as one-owner, revocable, scoped,
expiring, attempt-bounded authority with co-located guards and provider-
capability epochs. A plugin cannot refresh a validator, weaken a profile,
represent provider concurrency as a local target fence, select an exception
without its guard, invoke capacity policy, or reclassify existing capacity.
Freeze the host-owned bounded transmission window, current-fence start claim,
unique worker-instance/lease-bound claim, at-most-once non-persisted monotonic
start permit, and ambiguous-claim/uncertain-start reconciliation boundary;
guest code cannot control their claimant, clock, deadline, state, permit, or
retry classification. Freeze the supported split boundary: the host
`TransmissionExecutor` owns both claim and provider socket, guest/broker traffic
contains only immutable authenticated instruction/status, and no permit or
authorizing digest crosses guest/RPC/IPC/queue memory.
Freeze an immutable, versioned `ProviderExecutionProfile` for each supported
connector: exact tenant/provider/account/action/destination and claim-bound
secret operation, no master-key or general database-write authority,
least-privilege/short-lived credentials, deny-by-default allowlisted egress with
TLS identity and DNS/redirect enforcement, and tenant/account or documented
bounded-trust-domain executor pools. Reject general HTTP proxy behavior and
unrestricted credentials shared across unrelated tenants; publish the residual
compromise radius for every admitted provider profile.
Freeze its one authoritative lineage, generation states, monotonic profile/
account/credential/broker-policy epochs and revocation-before/after-redemption
ordering. Freeze typed proposal/approval/activation/suspension/revocation/
supersession commands, their control-plane capability, signed exact-digest
implementation admission, semantic expansion classifier, risk owner, quorum/
separation, current activation fences, revocation tombstone, and emergency-
revocation/no-replacement rule. Freeze the asynchronous rotation state machine,
provider evidence, atomic local activation, unknown reconciliation, overlap/
deadline, outage profile, one-lineage rotation guard/identity/idempotency,
authorized inventory takeover, orphan/count-quota recovery, late-callback
fences, and restore behavior. Freeze the exact
`ProviderCredentialCapabilitySnapshot`, monotonic local epoch, authenticated
event/polling reconciler, freshness policy, provider-policy validator, and
fail-closed drift rules. Freeze reviewed versioned provider permission
evaluators and corpora, canonical equal/subset/superset/incomparable/unknown
result, raw-policy/normalized-AST/evaluator/policy-language/comparison/
explanation bindings, and complexity budgets. Freeze whole-credential
quarantine/incident/first-use fencing for superset/incomparable/unknown; forbid
automatic widening and break-glass promotion. Freeze whether any explicit
safe-subset profile is supported; otherwise `StrictSubset` also denies. Freeze
the authoritative evaluator lineage/generation states, signed binary/corpus
admission, provider/language compatibility, never-reused epoch, emergency
revocation, immediate `ReevaluationRequired`, and incompatible-node startup
gate. Freeze the owned quarantine investigation/remediation/replacement-or-
revalidation/resolution machine, strong revision/consistency barrier/current
epochs/separated resolver evidence, fresh capability generation, and permanent
old-work tombstones. Freeze remediation authority as host-only, non-composable,
rotation/takeover-only, independently credentialed, audited, and cleanup-quota
bounded; a plugin cannot invoke it. Freeze non-exportable signing/
mTLS/HSM operations and brokered-bearer transmission separately. For bearer/
API-key profiles, the hardened broker joins the executor TCB and owns header
serialization, redirects, TLS, claim, and socket; temporary bearer bytes are
confined by HTTP/TLS/redirect/diagnostic/crash memory canaries.
Goal: revalidate and freeze a bounded plugin profile with defense in depth.
Deliverables: runtime/version pin, disabled default imports, worker identity,
OS limits, egress/DNS/TLS policy, capability-handle, catalog/storefront trust,
host-brokered authenticated HTTP/signing/token/certificate operations,
publisher/mirror, permission-diff, connector-support, effect-dispatch gate,
grant/service-principal redemption, quota-claim/recovery-reserve isolation,
remote-target conditional-write/precondition-outcome gate, remote-mutation-
exception guard/attempt gate, dispatch-transmission claimant/trusted-executor/
one-time-permit/no-transport gate, provider-execution-profile/credential/egress/
pool-partition gate, residual-blast-radius record, and upgrade decisions.
Include profile-lineage/epoch/rotation/restore gate, credential-operation
profile and brokered-bearer TCB/memory-assurance record. Include profile-
governance command/approval/tombstone gates, rotation-state/evidence/deadline
record, lineage/guard/takeover/orphan/count-quota record, and credential-
capability evaluator lineage/admission/epoch/reevaluation/startup gate,
snapshot/epoch/reduced/quarantine-resolution/new-generation/tombstone/incident
contract, and independent remediation profile/lineage/approval/audit/quota
contract.
Verification: sandbox escape, metering bypass, host-call amplification, DNS
rebinding, redirect, cross-plugin/tenant, guest-memory secret canaries, broker
confused-deputy/target substitution, stale dispatch authority, quota/refund/
cross-kind settlement/reserve abuse, grant replay/impersonation, and cancellation
evidence is reviewed; include provider/account/resource/validator substitution,
weak/strong and ABA confusion, ignored/downgraded conditional writes, silent
refresh, response-loss ambiguity, exception scope/reuse, revocation/expiry/
provider-capability/final-attempt race, guard omission/restore, capacity-policy
access, protected-class conversion, delayed guest execution, deadline/permit
substitution, shared-credential duplicate hosts, claim-response loss, lease
takeover, persisted permit, clock rollback, permit replay/restore, and uncertain
retransmit; include permit IPC/RPC/queue/log exposure, digest authorization,
duplicate instruction, executor failover/compromise, and socket/claim ownership
split; include arbitrary unclaimed socket use, secret-handle/account
substitution, cross-tenant credential reuse, unrestricted shared credentials,
and allowlist/TLS/DNS/redirect/general-proxy bypass.
Include profile/account/credential/broker epoch substitution/rollback, emergency
revocation, account suspension, credential ABA, stale/restored handles, signing/
mTLS/HSM export, bearer escape/caller-owned claim or socket, and memory-canary
failure. Include unauthorized/self-approved profile activation, hidden semantic
expansion, stale activation fences, delayed activation after revocation,
emergency replacement activation, every rotation crash/unknown response,
duplicate creation, eventual consistency/continued old-key validity, overlap/
deadline/outage-profile failure, permission expansion/reduction, role/group/
cross-account trust drift, callback reorder, stale polling, policy-revision
mismatch, and restored capability snapshot.
Include simultaneous rotations, unknown-state successor, rotation identity/
idempotency/digest substitution, timeout-then-create, late callback, unauthorized
takeover, orphan replay/revocation loss, credential-count exhaustion, wildcard/
`NotAction`, explicit deny, conditional resource/tag/time/network/identity/
session semantics, boundaries/organization policy/inheritance, evaluator
downgrade and complexity exhaustion, raw/AST/result/explanation mismatch,
non-privileged quarantined use, safe-subset without explicit support, claimed-
work quarantine race, automatic widening, and break-glass promotion.
Include unsigned/wrong-binary/corpus evaluator activation, epoch rollback,
security-fix/semantic/corpus upgrade, mixed incompatible nodes, emergency
revocation, partial reevaluation, generic or incident-only quarantine clear,
weak/stale/inconsistent resolution evidence, missing resolver separation,
old-work revival, remediation capability exposure to guest code, derivation
from quarantine, business-operation use, circular dependency, sole-key
quarantine, outage/response loss, and no-independent-path automation.
Exit criteria: cryptography is not claimed to enforce resource isolation.
`v0.140.4 implementation stop reached. Run pentest for this exact commit.`

## `0.140.5` — Privacy, Retention, Evidence, And Residency Decision

Status: planned.
Setup: classify records, metadata, evidence blobs, audit, backups, indexes,
legal holds, erasure duties, residency, and conflicting jurisdictional rules;
review the complete `0.51.2` tenant data-surface registry including customer
measurements/rollups, paging/status receipts, vectors/embeddings, plugin state,
AI artifacts, federation projections, and connector checkpoints. Freeze an
explicit precedence matrix distinguishing legal hold, mandatory erasure,
maximum retention, tenant closure, contractual preservation, and discretionary
rollup-substitution expiry; preservation of historical SLO authority cannot
override mandatory deletion. Independently decide disposition for raw
observations, rollup payloads, source manifests, derived SLO/error-budget
results, projections/caches, exports, and linkable checkpoint metadata; no
related surface inherits another surface's permission to survive.
Goal: freeze production data-lifecycle profiles before packaging.
Deliverables: normative retention-precedence matrix, preservation/disposition,
mandatory-deletion-with-authority-loss procedure, crypto-erasure, key ownership,
deletion verification, backup expiry, residency matrices, and a zero-missing-
surface registry report with typed external-copy evidence strengths and
closure-policy results; include a related-surface disposition matrix, per-
surface evidence, and allowed non-sensitive tombstone/authority-loss schema.
Verification: hold-versus-erasure conflicts, derived copies, restored backups,
indexes/caches/exports/external copies, authoritative measurement rollups,
evidence custody, false equivalence between local proof/provider attestation/
unconfirmed request/unverifiable plaintext, missing rollup proof during
mandatory deletion, unlawful retention for availability reporting, tenant
closure, rollup retention inherited from raw disposition, omitted manifest/
result/cache/export/checkpoint-metadata decision, sensitive tombstone, partial
derived cleanup, and cross-region scenarios pass review.
Exit criteria: no production data class or tenant-bearing surface lacks an
owner, lifecycle, typed disposition state, and policy result; accepted residual
uncertainty remains explicit and is never described as verified erasure.
Mandatory deletion proceeds even when doing so makes historical results
unknown, with independently evaluated disposition evidence for every related
surface and immutable non-sensitive evidence of the precedence decision and
authority loss.
`v0.140.5 implementation stop reached. Run pentest for this exact commit.`

## `0.140.6` — Deployment, HA, And Recovery Profile Decision

Status: planned.
Setup: compare modular all-in-one, split services, single-node, HA, regional,
orchestrator, package/image, authoritative-region, and recovery choices. Every
profile must preserve the single-use dispatch-authorization gate, current
policy/identity/delegation/tenant/target reads, typed execution-authority
redemption, exactly one authoritative stream per grant lineage, bounded multi-
kind quota transition atomicity with quota state as co-transactional local
authority rather than another aggregate, and tenant/work-class partitioned fair
reconciliation/security-cleanup capacity with a scoped emergency reserve;
redemption uses a co-located fenced `GrantRedemptionGuard` so dispatch advances
only the effect stream. Dispatch also locks a bounded complete
`DispatchAuthorityFenceSet` of applicable monotonic local epochs. Every quota
set is local to its work transaction.
Unconditional remote mutation co-locates its one-owner exception guard, effect
bundle, and provider-capability/policy epochs. Every admitted receipt persists
an immutable deadline and co-located start-claim state; workers recheck current
fences before one exact worker instance/lease generation receives non-persisted
permit material once inside a trusted executor that also owns the provider
socket. Other services exchange immutable authenticated instructions/status
only; ambiguous/duplicate instruction, executor failover, and uncertain starts
reconcile without ordinary retry. Every trusted executor runs under the exact
immutable `ProviderExecutionProfile`, has no master-key ring or general database
writes, redeems only claim/request/account/action/destination-bound opaque
secret handles, and is confined by deny-by-default egress/TLS/DNS/redirect
policy and a documented bounded pool trust domain. Its authoritative lineage
and profile/account/credential/broker-policy epochs are co-located with the
claim guard and cannot roll back on restore. Freeze the profile-governance
lineage owner, approval/tombstone transaction placement, rotation process-
manager owner, provider-evidence store/reconciler, capability-snapshot observer/
freshness owner, credential-lineage/rotation-guard/takeover/orphan/count-quota
owner, permission-evaluator lineage/generation/admission/epoch/reevaluation
owner, capability-quarantine investigation/remediation/verification/resolution/
new-generation/tombstone owner, and independent remediation-profile/credential-
lineage/approval/audit/quota owner, and their HA/failover behavior. Only local credential
activation is atomic; remote create/revoke is explicitly asynchronous.
Signing/mTLS/HSM is non-exportable;
bearer/API-key serialization, redirects, TLS, claim, and socket reside together
in the hardened broker/executor TCB. Existing capacity class is immutable. Each
future-allocation policy lineage owns exactly one parent and atomically changes
its co-located ledger under an independently governed floor set. Floor reduction has separate
cross-command authority, operational fences, obligation simulation, and a
durable versioned/digested platform-floor admission ratchet. Nodes below the
ratchet reject startup, mixed versions use the stricter profile, and rollback/
restore/lower defaults cannot release capacity. Multi-parent rollout finalizes
only against a complete unchanged hierarchy-root manifest and uses conservative
intermediate limits; finalization only permits activation, after which each
parent freshly CAS-revalidates its prepared state, ledger, floor, obligations,
root manifest, and current operational fences or stays blocked/reconciling;
exactly one monotonic `ActiveRolloutGeneration` exists per root. A successor
atomically and permanently supersedes the prior generation; rollback is itself
a complete successor rollout over current actual limits, and late messages or
restore cannot reactivate a superseded generation. Cancellation before any
preparation terminates directly; after preparation it atomically creates one
complete recovery successor over the manifest and actual limits. Parents remain
conservative, never restore independently, and recover through current-state/
authority checks, idempotent restore-safe receipts, and deadline escalation.
The floor ratchet is keyed
by the complete `PlatformSafetyFloorKey`; key-set changes require total,
overflow-checked, non-lossy migration before startup.
Every delayed transfer step rechecks current local authority.
Global/regional limits allocate fenced hierarchical capacity leases into local
partitions while retaining per-kind encumbrances after lease expiry. Every
composite transaction uses the canonical acquisition order and bounded
identity-preserving deadlock retry. Topology may tune capacity and consistency
implementation but may
not omit these controls or introduce a distributed work transaction. The
`1.0.0` profile supports one authoritative write region per transaction domain
with fenced failover; active/active authoritative multi-region writes are
explicitly unsupported.
Goal: select the exact profiles Phase O must certify.
Deliverables: support matrix, trust/network boundaries, fencing/quorum model,
dispatch-authorization consistency/failure model, quota consumption/refund
and per-kind settlement mapping, canonical all-or-none claim-set reservation/
exact-token consumption profile, grant ownership plus inline/dedicated issuance/
revocation/successor behavior, redemption-guard placement/claim/receipt model,
authority-fence source/update/co-location/staleness profile, canonical composite
lock order/deadlock-retry policy, target-fence owner/update/co-location/
lifecycle/deletion/supersession profile,
transmission-window derivation, authoritative-time/start-claim placement,
claim/worker-instance/lease-fence/audience/provider/request binding, one-time
non-persisted monotonic permit, and ambiguous-claim/uncertain-start
reconciliation profile, trusted executor claim-plus-socket placement, immutable
instruction/status service protocol, sealed consumed-by-value/no-transport
permit profile,
provider-execution-profile identity/version/digest, secret-operation binding,
credential lifetime/privilege, executor-pool trust partition, network allowlist/
TLS/DNS/redirect policy, authoritative lineage/generation and profile/account/
credential/broker epochs, profile lifecycle command/capability/signed-admission/
semantic-diff/approval/tombstone model, rotation state/evidence/unknown/overlap/
deadline/outage and atomic-local-activation profile, credential-capability
snapshot/epoch/event-or-poll/freshness/revision profile, rotation guard/
idempotency/takeover/orphan/count-quota profile, semantic evaluator/AST/evidence/
complexity/evaluator-lineage/admission/epoch/reevaluation/startup profile,
reduced/quarantine-resolution/consistency/resolver/new-generation/tombstone/
incident profile, independent remediation authority/profile/lineage/audit/
cleanup-quota or manual-only recovery profile, restore ordering,
credential-operation profile and bearer-broker TCB/memory boundary, and
documented residual compromise radius,
remote-target concurrency profile with exact provider/version, validator
strength/ABA properties, conditional request mapping, precondition outcome,
idempotency/query/reconciliation behavior, and reviewed unconditional-exception
owner/scope/approval/time/attempt/epoch/guard topology,
quota partition map and hierarchical capacity-lease allocation/reclamation/
per-kind encumbrance/transfer/late-settlement conservation profile, including
stable transfer ID, source/destination epochs, outbox/inbox receipts,
authenticated acknowledgement, old-epoch fence proof, conservative double-
entry recovery, original lineage, immutable accounting owner/hierarchy root/
parent lease/period/work or recovery lane/capacity class/residency/region, and
source/destination authorization decisions, structural no-reclassification
matrix, one-parent capacity-policy owner, co-located parent epoch/high-watermark,
independent floor-set owner/history/reduction/cross-command separation/platform
floor profile ID/version/digest/fully typed durable admission ratchet and total
key-migration proof, exact deltas/simulation/approval, hierarchy-root canonical
parent manifest/membership
epoch/conservation constraints, conservative multi-parent rollout, fresh local
post-finalization activation CAS and blocked/reconciliation state, one active
rollout generation with permanent successor supersession and complete-successor
rollback semantics, cancellation-recovery successor/actual-limit/idempotent-
receipt/deadline profile, and delayed-
transition current-authority rechecks,
active/active rejection/capability behavior, per-tenant/
global fair-share and starvation policy, emergency-reserve sizing/isolation,
RPO/RTO, upgrade/rollback, observability, and operator responsibility decisions.
Verification: failure-mode analysis covers partitions, split brain, key/service
loss, policy/delegation revocation during dispatch, stale/forged dispatch
receipts, grant replay/offline-human impersonation, duplicate refunds, cross-
kind settlement, approval/grant crash-reorder-revocation/successor races,
revocation/final-attempt claim race, crash-after-claim recovery, claim/receipt
substitution, consumed-attempt restore, grant/effect two-stream mutation,
tenant/subject/session/delegation/policy/principal revocation races, incomplete
or stale fence sets, epoch reuse, external-staleness misuse, composite lock-
order inversion and retry identity drift/exhaustion,
overlapping-set deadlock/livelock, partial reservation/restore, token/digest/
membership substitution, cross-partition claim sets, hierarchical lease
over-allocation, expiry with persistent per-kind encumbrance, child loss, late
settlement, every transfer crash/duplicate/reorder/lost-ack/source-destination-
failover/stale-epoch/conflict point, forbidden free-at-both-ends state, target
deletion/merge/migration/supersession/restore race, stale projection, cross-
shard target placement, missing/non-co-located target fence, reclamation/
failover race, remote validator/account/resource substitution, weak/strong/ABA
confusion, ignored or downgraded conditional writes, unsafe refresh,
precondition/response-loss misclassification, exception scope/request
substitution, revocation/expiry/provider-capability/final-attempt race, missing
guard, restore resurrection, long pause after receipt, authority/capability
change before start claim, deadline/audience/request substitution, clock
rollback, shared-credential duplicate workers, claim/worker/lease/permit
substitution, claim-response loss, stale-worker takeover, restored/reconstructed
permit, permit transport/logging or digest authorization, duplicate instruction,
executor failover/compromise, arbitrary unclaimed provider socket use,
secret-handle/account substitution, cross-tenant credential reuse, unrestricted
shared credential, egress/TLS/DNS/redirect/general-proxy bypass, uncertain
retransmission, profile/account/credential/broker epoch rollback, emergency
revocation, account suspension, credential ABA, stale/restored handle, signing/
mTLS key export, bearer escape/caller-owned claim/socket/memory-canary failure,
unauthorized/self-approved profile activation, hidden expansion, stale
activation fences, delayed activation after tombstone, emergency replacement,
every rotation crash/unknown/evidence/deadline state, duplicate creation,
eventual consistency/continued old-key validity, restored dual redemption,
permission/role/group/cross-account drift, callback reorder, stale polling,
policy-revision mismatch, restored snapshot, remote discovery in dispatch,
simultaneous rotation, unknown successor, late callback, orphan/count exhaustion,
evaluator semantic/downgrade/budget failure, quarantined non-privileged or
claimed work, safe-subset policy bypass, automatic widening, break-glass
promotion, evaluator activation/revocation/epoch/reevaluation split brain,
incompatible-node readiness, partial resolution/old-work revival, missing strong
revision/consistency/resolver separation, remediation credential/profile/tenant
substitution, circularity/business use, sole-key outage/response loss/count
exhaustion, false automatic recovery without an independent provider path,
transfer owner/root/
parent/period/lane/class/region/authorization substitution, emergency/security-cleanup-to-
business conversion through adjustment, existing-class rewrite, tenant-invoked
capacity policy, ambiguous policy owner/parent, non-atomic activation,
concurrent allocation/stale high-watermark, policy-lowered floor, protected-
floor/simulation replay, floor-reduction/spend approval reuse, operational-
fence/obligation/platform-minimum bypass, omitted/aliased parent, membership
change race, stale manifest/root epoch, conservation mismatch, coordinator
failover, wrong-manifest activation, stale
post-finalization parent state after allocation/reclamation/floor/obligation/
incident/tenant/principal/policy/failover change, missing blocked/reconciliation
state, floor-profile/ratchet substitution, lower-floor startup, mixed-version/
downgrade/rollback/lower-default/restore weakening, partial rollout/rollback/
restore, concurrent successor creation, late superseded preparation/
finalization/activation, superseded restore, cancellation/supersession
confusion, missing/aliased/incompatible typed floor key, unit/scale/period/kind/
lane/region/settlement-policy substitution, lossy or overflowing key migration,
prepared cancellation without a complete recovery successor, independent
parent restore, lost/duplicate recovery receipt, parent drift without current
revalidation, missing recovery deadline escalation,
stale transfer-transition tenant/principal/policy authority,
incompatible active/active topology,
provider-outage tenant exhaustion, one-tenant unknown-outcome floods, per-
tenant/global starvation, emergency-reserve borrowing, degraded dependencies,
restore, capacity, and incident operations.
Exit criteria: every `1.0.0` deployment claim maps to a Phase O test profile.
`v0.140.6 implementation stop reached. Run pentest for this exact commit.`

## `0.140.7` — API, SDK, And Publication Decision

Status: planned.
Setup: inventory external API/ABI consumers, compatibility duration, SDK scope,
registry ownership, signing/provenance, licensing, and recovery obligations.
Goal: decide whether any SDK is stable and publishable at `1.0.0`.
Deliverables: API support policy and one of: no public SDK, private SDK, or a
separately scoped MIT OR Apache-2.0 SDK allowlist with release controls.
Verification: mass-assignment/auth/version tests and registry takeover/token/
provenance/license review cover every selected publication path.
Exit criteria: all platform crates remain `publish = false`; only an explicitly
named SDK exception may change. `v0.140.7 implementation stop reached. Run pentest for this exact commit.`

## `0.140.8` — AI Production Enablement Decision

Status: planned.
Setup: compare disabled, advisory-only, and provider/model-specific profiles by
purpose, tenant, classification, residency, retention, evaluation, contracts,
and passing `0.98.1` hosted semantic-index plus `0.98.2` embedding-generator
evidence where similarity is enabled.
Goal: decide whether AI is disabled or supported in a bounded `1.0.0` profile.
Deliverables: approved purposes/providers/models, no-fallback rules, broker
identity/network isolation, evaluation thresholds, monitoring, and kill switch.
Verification: prompt injection, retrieval/citation leakage, provider drift,
cache/index partition, semantic adapter deletion/rebuild/outage, proposal non-
execution, disable, and incident exercises pass.
Exit criteria: absence of sufficient evidence selects disabled-by-default.
`v0.140.8 implementation stop reached. Run pentest for this exact commit.`

## `0.140.9` — Interchange Profile Freeze Decision

Status: planned.
Setup: inventory implemented and requested identity, vulnerability, SBOM,
threat-intelligence, logging, webhook, discovery, and document interchange
profiles plus their exact specification versions, extensions, codecs, vendor
connector profiles (including selected Microsoft Defender/Sentinel, Tenable,
and any `0.86.1` CMDB API), licenses, trust and update models. Explicitly decide
inbound versus outbound SCIM, threat-intelligence ingestion versus STIX/TAXII
publication, and whether raw log management or detection-rule authoring/testing
remains outside the product boundary.
Goal: freeze an explicit support/defer matrix rather than implying generic
standards compatibility. This milestone cannot implement a missing profile.
Deliverables: supported/deferred/rejected matrix for directional SCIM/SAML,
CVSS/VEX, SPDX/CycloneDX, STIX/TAXII ingestion/publication, authenticated
alert-bearing syslog/security webhooks, raw-log/SIEM detection features, CMDB
discovery, and any shipped profile; conformance corpora, version policy,
admission records, implementing-milestone references, and truthful
compatibility wording. Every profile without complete earlier implementation
and pentest evidence is explicitly deferred. The default `1.0.0` boundary
defers general raw-log storage/query, detection-rule authoring/execution,
outbound STIX/TAXII publication, the unselected SCIM direction, and an
unimplemented CMDB connector.
Verification: namespace/version/extension confusion, parser differentials,
downgrade, signature/source spoofing, round trips, lossiness, bombs, tenant/
policy/marking mapping, directional-role confusion, high-volume capacity
assumptions, and source-drift review pass for every selected profile.
Exit criteria: `1.0.0` names only exact independently evidenced interchange
profiles; generic family claims are forbidden. `v0.140.9 implementation stop
reached. Run pentest for this exact commit.`

## `0.140.10` — Federation Production Enablement Decision

Status: planned.
Setup: review `0.120.1–0.120.5` evidence for disabled, bilateral shared-space,
federated work exchange, and managed-service profiles; exact protocol/API/
schema versions; trust/transport; legal/controller-processor responsibilities;
residency/retention; scale; support; incident; revocation; and interoperability.
Goal: decide which, if any, federation capabilities are safe production claims.
Deliverables: enabled/disabled profile matrix, peer eligibility and trust
requirements, protocol/version pins, permitted resource/action/data classes,
deployment/network profile, joint-operations responsibilities, kill switch,
and explicit unsupported combinations.
Verification: independent cross-organization architecture review and pentest
cover malicious/compromised peers, transitive trust, tenant/RBAC/field leakage,
partitions/replay, protocol downgrade, provider delegation abuse, revocation,
offboarding, restore, erasure/hold/residency conflict, and incident exercises.
Exit criteria: federation remains disabled by default; only exact profiles with
complete bilateral evidence may enter Phase O and `1.0.0` support claims.
`v0.140.10 implementation stop reached. Run pentest for this exact commit.`
