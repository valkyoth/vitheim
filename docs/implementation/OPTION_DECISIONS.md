# Pre-Production Profile Freeze Decisions

Scope: `0.140.1–0.140.10`. These evidence-producing releases revalidate and
freeze production profiles from version-bound implementation-admission records
created at each first consuming milestone. They are never the first dependency,
protocol, backend, or runtime selection and cannot retroactively legitimize
unreviewed code. Phase O may certify only selected profiles; unselected profiles
remain unsupported at `1.0.0`.
Each decision must also resolve its `docs/AUTHORITY_REVIEWS.md` entry before
work begins. A decision that changes authority names the exact existing
`VIT-INV-*`/generation-qualified `VIT-LAW-*@gNN` contracts and any new law
generation; it cannot hide an
authority change inside a topology, dependency, or support-profile choice.

## `0.140.1` — Dependency, Cryptography, And KMS Decision

Status: planned.
Migration/import decision: freeze the permanent-quarantine revocation intent
preimage, target-scoped non-wrapping sequence, issuer/signing-key continuity,
covering time/uncertainty fields and exact shared logical/physical workspace
checkpoint digest, plus the first-terminal-wins authorization outcome wrapper.
A remote intent has no local effect, a valid terminal observation cannot enter
a retry loop and two different cuts cannot both satisfy activation.
Setup: inventory TLS, identity, database, WASM, crypto, timestamp, secret, and
KMS needs; compare audited implementations, maintenance, licenses, features,
unsafe/native code, replacement boundaries, and first-party risk.
Goal: freeze the production subset of previously admitted implementations and
resolve any remaining zero-dependency/production-security conflict explicitly.
Deliverables: revalidated admission-record inventory, approved production
dependency allowlist or blocked features, crypto/KMS/key-rotation/timestamp
profiles and adapter boundaries. Freeze the law-manifest trust profile here:
select exactly `CompiledCatalog` or `SignedCatalog` for each active runtime
artifact; a combined serialized profile is prohibited. Freeze the canonical
payload and envelope digest preimages, predecessor envelope digest, catalog
epoch, activation floor and explicit-successor semantics, exact product/
edition/compatibility scope, validity policy/window and maximum uncertainty,
signer/key ID, signature profile, trust-root
epoch, revocation/successor policy, dedicated platform-law roots, signer
quorum/separation, root rotation and compromise recovery, artifact binding, and
independently reviewed digest/signature implementations. Freeze the project-
owned runtime/CLI verifier and compiled expected-digest generation path. For
`BoundedWindow`, select the admitted `TrustedCatalogTime` source, platform
uncertainty ceiling, continuity/re-attestation rules, rollback and suspend
handling, and fail-closed behavior when time is unavailable. Mutable database/
configuration authority alone can neither add a tuple, activate a planning-
superset entry, nor replace a trust root. The timestamp profile must define authoritative
transaction time, persisted `redeemed_at`/`transmit_before`, monotonic
transmission-start enforcement, maximum admission-to-transmission intervals,
rollback/suspend behavior, and fail-closed handling when remaining time cannot
be trusted. Freeze the `1.0.0` decision that permit material remains a sealed,
consumed-by-value, best-effort-zeroized process-local value inside a trusted
executor that owns the provider socket. A transferable cryptographic permit is
unsupported; enabling one later requires a new milestone and independent design
review for entropy, authentication, channel/audience binding, constant-time
verification, zeroization, and durable replay prevention.
Freeze the workload-identity and receipt-integrity inputs used by catalog
rollout: canonical deployment/region/service-role/partition/placement IDs,
non-clonable workload identity, boot/continuity evidence, binary and semantic-
set digests, local fencing token, and domain-separated prepare/convergence/
revocation receipt digest. Select one closed
`WorkloadIdentityProofProfileV1`: `HardwareAttestedKey` requires a
non-exportable key and current measured-workload attestation;
`OrchestratorAttestedFencedLease` requires a key-bound short-lived identity,
one single-active lease/fence, simultaneous-use detection, and an online,
single-use `WorkloadLeaseActionClaim` for each operation in the closed
action-authority scope matrix. Freeze readiness separately as read-only use of
bounded reusable `OnlineWorkloadFreshnessProofV1`, including its maximum age,
topology challenge/receipt sequence/generation, catalog/identity/fence,
issued-at/expiry/uncertainty/signer bindings, local last-observed ratchets, and
fail-closed unavailable/stale/replayed result. Freeze dispatch/start fresh-
response or maximum-currentness-window rules. Freeze that local positive receipt/admission creation, topology
mutation, dispatch, and transmission start consume claims; authenticated
global/rollout owner-to-owner protocol and revocation/distrust/fence
application do not. Freeze its maximum claim lifetime,
action-digest/instance-key/continuity/lease-
generation/fence/sequence bindings, online CAS issuance, and zero offline
authority: after control-plane loss or fencing, exposure is limited to an
already claimed action until that fixed bound expires. Freeze
`WorkloadLeaseActionAuthorityPortV1`: the external issuer owns stable claim/
action IDs, lease generation and sequence uniqueness; exact request replay
returns the original claim; different action bytes reject. Freeze local
co-transactional `ConsumedWorkloadLeaseActionClaim`, typed issuance/outcome
uncertainty, no reissue before issuer/tombstone reconciliation, expiry,
revocation, failover, and externally evidenced backup/restore high-watermarks.
Freeze replay precedence: consult the tombstone first; an exact claim/action
digest returns the stored historical outcome even after later expiry or
revocation without repeating work or granting new authority; only absent
tombstones undergo current first-consumption checks; mismatches always reject.
Freeze issuer, subject,
audience, deployment/region/service-role/partition/placement binding, public-
key thumbprint, attestation policy/version, issuance/renewal/rotation/expiry/
revocation, clone detection, replacement, restore, and compromise recovery.
Freeze `CatalogReceiptAuthenticationV1` as an exhaustive enum:
`WorkloadSignedReceipt`, `AuthorityMacReceipt`, or
`AttestedChannelAdmissionReceipt`. The channel variant binds a unique verifier
challenge, channel exporter, peer identity/key/attestation, complete canonical
receipt bytes, signer/admission epochs and owner fences, and an atomic replay
tombstone; its durable admission record requires a signed/MACed checkpoint or
independent integrity anchor. An open “equivalent” profile, digest, transport
success, or ordinary database row never proves authenticity. Recovery
revalidates the selected exact variant, issuer, key, attestation, revocation,
lease/action claim, fences, challenge/tombstone, and integrity anchor.
Disk-held ordinary mTLS keys, disk-derived or cloneable bearer identity,
host/pod names, and unauthenticated receipt digests cannot support a production
local catalog owner.
The `AuthorityMacReceipt` choice is valid only when KMS/HSM policy grants the
named sender/domain/key epoch `GenerateMac` and every receiver `VerifyMac`
without generation/export/rotation authority. Freeze authenticated
`CatalogActivationAuthorizationReceipt` and
`CatalogGlobalActivationResultReceipt`, including rollout/manifest/catalog/
predecessor, expected/resulting global versions, outcome, distrust/revocation,
sender/key epochs, idempotency, and replay tombstones.
Freeze `TopologyMutationAuthorizationReceiptV1` separately from workload
authentication and select independent `VIT-INV-061` as its sole issuer;
VIT-INV-060 may only authenticate and consume. Freeze stable authorization
lineage/generation, mutation/manifest uniqueness, approval/quorum/SoD
ownership, idempotent issuance/typed unknown response, revocation/supersession/
expiry, independent break-glass recovery, restore high-watermarks/tombstones,
and issuer/topology credential separation. Select issuance-time linearization:
the issuer validates current principal/session/delegation/role/policy epochs and
change/incident/emergency/approval evidence, then creates one narrow immutable
grant with fixed `commit_before`; changes before issuance deny, while changes
after issuance block new grants but cannot retroactively revoke that exact
receipt before expiry. Lineage revocation or supersession therefore never
terminalizes that receipt or frees its outstanding capacity. Freeze a separate
receipt-revocation protocol: an authenticated
`TopologyAuthorizationReceiptRevocationIntentV1` binds the exact authorization
ID, issuance sequence, receipt digest, issuer lineage/fence, reason and
revocation epoch; VIT-INV-060 serializes it against consumption/expiry and
commits a receipt-specific tombstone/result/outbox locally. Only its
`TopologyAuthorizationConsumerTerminalReceiptV1`, or another independently
valid terminal proof, allows issuer settlement. VIT-INV-061 cannot manufacture
consumer terminal evidence, and response loss retains capacity. Freeze the authorization-time profile by reusing the
`TrustedCatalogTime` interval vocabulary through a separately domain-separated
`TrustedTopologyAuthorizationTime` capability. The authenticated receipt binds
`issued_at`, `commit_before`, `maximum_time_uncertainty_ns`, trusted-time
profile ID and epoch, issuer time-continuity ID, and mutation class. Issuance
fails closed when trusted time or continuity is unavailable, the reported
uncertainty exceeds the receipt or platform ceiling, or the requested interval
exceeds its class maximum. Freeze those inclusive maximum lifetimes:
`InitializeTopologyAuthorityHandoff` is five minutes,
`CommitTopologyAuthorityHandoff` is two minutes, every dynamic
join/leave/move/replace/service-role/split/merge successor is two minutes, and
break-glass is the lesser of its mutation-class maximum and sixty seconds.
These are protocol ceilings, not configurable defaults; changing one requires
a new law generation and security review.

Freeze the presentation-lane identity contract used before policy evaluation.
`TopologyAuthorizationPresentationLaneV1` is closed to `Normal`, `Recovery`,
and `BreakGlass` and derives only from the authenticated endpoint/audience plus
a versioned, fenced credential-or-authority profile. Recovery and break-glass
use separately provisioned identities and audiences; a body field, requested
class, principal label, untrusted routing header, or mutable service
configuration cannot promote a caller. Rotation/revocation advances the lane
mapping generation/fence, restore merges the greatest externally evidenced
state, and ambiguous or stale mapping denies. The storage/accounting decision
at `0.140.2` must enforce non-borrowable lane capacity and exact authorized-
class equality without changing this identity decision.
Select VIT-INV-061 as the sole authoritative mapping-lineage owner. Proposal,
activation, promotion, rotation, revocation and recovery use stable mapping
identity, monotonic generation/fence and credential-profile digest. Recovery or
break-glass promotion requires distinct requestor, approver and activator,
quorum/SoD, current policy/session and change-or-incident evidence; deployment
configuration is not promotion authority.

Freeze `TopologyAuthorizationConsumerTerminalReceiptV1` as a canonical
authenticated envelope binding deployment; VIT-INV-060 partition/generation/
fence; authorization ID and issuance sequence; receipt digest; canonical
optional revocation-intent digest; closed terminal outcome; consumer result
version/sequence and tombstone digest; applicable deadline/trusted-time
evidence; sender identity; signing/MAC key epoch and authentication profile;
stable message/idempotency ID; and transactional outbox sequence. The only
outcomes are `RevokedBeforeConsumption`, `AlreadyConsumed`, `Expired`,
`DefinitelyNotCommitted`, and `PermanentlyUnresolved`. Freeze
`TopologyAuthorizationConsumerDispositionV1` as the closed union
`Terminal(TopologyAuthorizationConsumerTerminalOutcomeV1)` or
`Reconciling(TopologyAuthorizationConsumerReconciliationEvidenceV1)`.
Reconciliation emits a separate
`TopologyAuthorizationConsumerReconciliationReceiptV1`; it may later advance
to a terminal receipt under a greater result/outbox sequence, but is not a
terminal outcome or admissible settlement argument.
`SettleTopologyAuthorizationOutstandingReservation` accepts only
`TopologyAuthorizationConsumerTerminalReceiptV1`, making release from
reconciliation evidence unrepresentable at the port boundary. Select sender-only
authentication for VIT-INV-060 and verify-only credentials for VIT-INV-061.
Unknown outcomes, omitted/defaulted fields, conflicting replay, sequence
rollback, noncanonical optional intent, or issuer-generated evidence retain the
reservation.
The consumer maintains its own last trusted lower-bound/profile-epoch/
continuity ratchet and permanent expired-receipt tombstone. It may enter the
topology CAS only when a fresh conservative `[earliest, latest]` interval,
including admitted commit slack, proves `latest < commit_before`, uncertainty
is within both ceilings, and continuity/profile evidence is current. This
proof is executed through `DeadlineConditionalTopologyCasV1`, not by a client-
side precheck. The selected backend must enforce the predicate at its
authoritative commit linearization point or provide a hard no-late-commit
fence; a process pause, client timeout, cancel request, or connection loss
cannot leave a transaction able to commit after the deadline. A time
rollback, NTP step that widens uncertainty, suspend/resume without accounted
continuity, snapshot restore, failover discontinuity, issuer/consumer
disagreement, or inability to prove the CAS committed before expiry blocks or
reconciles without retrying the receipt; reconciliation may hide a pre-expiry
commit but must prove an absent transaction cannot later commit. Restore merges the greatest externally
retained/local time ratchet before use and never extends a deadline. Freeze
profile discrimination: orchestrator receipt
requires action-claim fields and canonical-none hardware fields; hardware
receipt requires current hardware proof and canonical-none claim fields.
VIT-INV-060 atomically consumes only the authenticated receipt, applicable
workload proof, local tombstones, topology CAS, and fence outbox; no distributed
transaction or commit-time external-epoch atomicity is claimed. Record the
residual risk explicitly: compromised credentials that already obtained a
receipt retain only that exact grant for at most the frozen class lifetime
(sixty seconds for break-glass), subject to trusted-time proof and single
consumption; compromise response prevents every later issuance.
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
Freeze its `0.18.5` root-of-trust profile separately: first-admission evidence,
required requestor/approver/executor/risk-owner separation and quorum, whether
two independently administered provider recovery channels exist, KMS/secret/
identity failure-domain independence, offline/manual recovery that does not
authenticate through the authority being recovered, compromise/loss epoch
ratchet, expiry and availability monitoring, and recovery-exercise cadence and
evidence. Automatic recovery support requires both admitted independent
channels; otherwise the provider profile is manual-only. No profile may
self-approve, self-remediate, or describe two names for one shared dependency
as independence.
Freeze `ProviderCredentialOperationProfile`:
non-exportable signing/mTLS/HSM exposes operations only; brokered bearer/API-key
transmission places authorization serialization, redirects, TLS, start claim,
and socket inside the hardened broker/executor TCB; provider-required export to
a general connector is unsupported. State explicitly that bearer bytes may
briefly exist in that hardened broker memory and define its zeroization,
allocator/TLS-library, diagnostics, crash/core-dump, and swap limitations.
Freeze the authentication and canonical-preimage profile for
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainAuthorizationV1`.
It binds deployment/tenant/action/predecessor/successor/diff/derived coverage/
policy/change-or-incident/requestor/approvers/activator/quorum/SoD; exact
`not_before`/`issued_at`/`expires_at`, maximum uncertainty, trusted-time
profile/epoch, issuer continuity, signer/key identity and epoch, authentication
profile; and nonce/idempotency. It is single-action, non-portable, and
digest-linked into activation. Freeze exact-retry versus conflicting-replay
authentication so an identical post-commit retry can recover the canonical
result without granting new authority. Canonical-none fields exist only where
the action contract explicitly permits them; unknown versions deny.
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
Also prove a self-consistent forged manifest/catalog, stale catalog, signer/root
substitution, rollback past catalog or generation floors, and artifact/catalog
scope mismatch fail closed.
Freeze the `MigrationImportActivationAuthorizationV1` authentication suite,
independent issuer and verifier-only capability distribution, key identity/
epoch and rotation rules, trusted-time source/profile/epoch, maximum
uncertainty, issuer continuity ratchet, nonce/idempotency rules, bounded
lifetime and archived consumption-tombstone authentication. Freeze owner
preparation receipt authentication so VIT-INV-062 can verify but cannot mint
any owner's receipt. Freeze `MigrationImportActivationRevocationIntentV1`
authentication, signed outbox and local inbox receipts, intent/result
idempotency, exact target-authorization lifetime binding and
`MigrationImportActivationRevocationSequenceKeyV1` scope over issuer
identity/continuity, tenant/deployment, authorization identity/digest and
candidate digest. Freeze `AdmitMigrationImportActivationAuthorization` as the
only Absent-to-Issued path. Only a local same-row commit is effective:
revocation creates RevokedBeforeAdmission when absent or RevokedUnused when
Issued, and later authorization admission must join the former. Key/sequence
rollback, unrelated-target sequence suppression, continuity substitution,
cross-candidate reuse, registry forgery, authorization/revocation reorder or
loss, intent expiry before target expiry, ambiguous admission/revocation/
expiry/consume CAS and response loss after any terminal commit must fail closed
or reproduce the exact committed result.
Freeze the same authentication, trusted-time and rollback-resistant ratchets for
`MigrationImportCoordinatorBootstrapAuthorizationV1`. It binds stable bootstrap
and idempotency IDs, predecessor/successor coordinator generations and fences,
schemas, code/semantic/law/checkpoint digests, change or incident authority,
requestor/approvers/activator, quorum/SoD and validity window. Freeze distinct
action/authentication domains for begin-drain, fresh checkpoint/verification-
bound handoff and cancellation; no grant is reusable for another action. Each
uses destination-local Absent/RevokedBeforeAdmission/Issued/Consumed/
ExpiredUnused/RevokedUnused same-row ordering. Begin is consumed when the drain
installs; final handoff consumes its fresh grant; cancellation consumes its own
grant. Freeze one
`MigrationImportCoordinatorBootstrapAuthorizationRevocationIntentV1`
authentication domain with action discrimination, exact authorization digest,
issuer continuity, target-covering lifetime, nonce/idempotency and a
non-wrapping sequence scoped per bootstrap/action/authorization. Its
destination apply authenticates the inbox and atomically commits the tombstone,
required bootstrap terminalization and result; remote emission has no effect.
Freeze `MigrationImportRegistryHistoryRecoveryAuthorizationV1` independently
from activation/bootstrap authority. Freeze its closed action-tagged request
and result payloads: RetryAppend alone carries predecessor/successor-budget
material, Waive alone carries waiver policy/custody material and Abandon alone
carries abandonment policy/custody material; other-action fields are
canonically absent. Freeze the union tag as the only authoritative action in
authorization and result; revocation derives action from exact authorization
bytes/digest, and any storage index is derived/read-verified. Freeze the total
Absent/RevokedBeforeAdmission/Issued/Consumed/ExpiredUnused/RevokedUnused table
and one closed admission/expiry/revocation/recovery/NotAdmitted/Fenced outcome. Explicit
expiry operates only on stored Issued grants; expiry/consumption on Absent is
typed no-write NotAdmitted and admission alone may authenticate expired input.
Freeze
`MigrationImportRegistryHistoryRecoveryAuthorizationOperationConflictV1` as
the only public conflict envelope, with Authorization, Revocation, Recovery
variants carrying only the existing typed changed-material conflicts.
`Fenced(MigrationImportRegistryHistoryCorruptionResultV1)` belongs to the
outcome enum because it is observed state, not conflict. Admission may precede RevokedUnused or
ExpiredUnused; consumption, expiry and revocation race for one first terminal
winner. After a CAS loss every operation rereads and reapplies the total table.
Different valid operation kinds against the same exact authorization are not
changed material; only changed authorization identity, target bytes/digest,
scope or canonical idempotency material conflicts.
Freeze the independent clearance authorization authentication/time profile,
its target-covering revocation intent and exact-obligation/fence-generation
sequence scope. Select the independently authenticated anchor-collection
profile and destination-ratcheted anchor-registry issuer/key/continuity/time
profile. The registry profile fixes a non-empty required anchor-class set and
per-class minimum quorum across signed checkpoints, externally retained head
commitments and witnesses; every required class must be satisfied, so open
“and/or” selection is unsupported. No local database row or clearance role
alone may nominate the set or assert restoration completeness.
Freeze the independently governed anchor-source-manifest authentication and
policy-transition profile: exact source/class identities, quorum/nonresponse,
collection time/uncertainty, key continuity and non-wrapping manifest lineage.
Freeze one independently authorized generation-zero initialization, stable
tenant/deployment lineage identity and
Prepared→ProposalPublishedVerified→LocalActivationCommitted→Active lifecycle
with Aborted/PermanentlyUnresolved terminals. Freeze stable governed
publication-profile lineage/current head: exact witnesses/sources/classes,
minimum quorum, authentication/key continuity, codecs, time and reconciliation
bounds. Freeze its concrete non-recursive trust anchor, root-key/quorum/domain
genesis, old-root/new-root rotation proof, external profile high-watermark and
explicit bootstrap/prepare/activate/abort/checkpoint/publish/restore operations.
Bind its identity/generation/digest in every transition preimage. Freeze no
offline or break-glass in-place root recovery through `1.0.0`: loss or
suspected full compromise permanently fences that deployment identity and
requires controlled reprovisioning under a new identity. Any future offline
recovery quorum requires a new reviewed law generation and may not be inferred.
An authenticated local safety-stop may force unready/fenced state and audit
only; it cannot rotate, clear, activate or transfer authority.
Freeze independently rooted
`MigrationImportRegistryHistoryDeploymentIdentityRetirementV1`, its retirement-
authority port, sole Retire command and Pending/Retired/EvidenceUnavailable
state machine. That authority can only safety-fence and terminalize retirement;
it cannot rotate, activate, terminalize a manifest, move custody or transfer
authority. Retired binds final heads/high-watermarks, governance and terminal
statuses, root, incident, custody and trusted time. EvidenceUnavailable permits
only separately provisioned empty bootstrap under a genuinely new identity and
permanently quarantines old custody. Missing retirement blocks old-custody
movement, not empty bootstrap. Replacement may cite retirement as provenance
but inherits no profile/fence/slot/ratchet/high-watermark/authorization/
idempotency state.
Freeze the additional single-use
`MigrationImportRegistryHistoryDeploymentIdentityRetirementAuthorizationV1`
decision before `1.0.0`: its six-state admission/revocation/expiry/consumption
lifecycle, independent issuer versus destination-local admitter, complete
identity/root/head/fence/incident/reason/time/quorum/SoD/nonce/idempotency
preimage and exact retry/conflict table are mandatory. Genesis-created
`MigrationImportRegistryHistoryDeploymentRetirementFenceV1` is Operational,
RetirementPending or Retired; absence fails closed and every admission,
readiness, dispatch, external-send start and commit rechecks it. The Pending
transaction consumes the grant and admits the complete non-borrowable
retirement completion reserve atomically. No deployment/storage profile that
cannot provide those transactions is selected for `1.0.0`.
Profiles are tenant/deployment scoped and never shared across tenants. One
`MigrationImportRegistryHistoryCorruptionClearanceAnchorSourceManifestCheckpointPublicationProfileAttemptSlotV1`
Empty-or-one slot bounds the only nonterminal attempt; a second
attempt denies or exact-joins, so succession performs no unbounded enumeration.
Its exact tenant/deployment/profile-generation/version/attempt digest is
CAS-cleared only by the matching authenticated terminal checkpoint; restore
rejects an Empty slot contradicted by retained nonterminal external evidence.
Every successor classifies that optional predecessor-bound attempt as
MayActivateExisting, TerminalizationOnly or EmergencyDistrust and advances a
monotonic profile/key/witness revocation ratchet. Final external activation
must recheck the current profile head, compatibility decision and ratchet.
Profile transition, distrust and manifest activation share one externally
durable governance-root CAS activation fence; the winning sequence determines
whether activation may commit or the candidate must terminalize, including
after response loss. Freeze
`MigrationImportRegistryHistoryManifestGovernanceActivationFencePortV1`: domain-
separated tenant/deployment/profile-lineage key, expected sequence/predecessor,
closed ActivateManifest/AbortManifest/SealPermanentlyUnresolved/RotateProfile/
EmergencyDistrust/RetireDeploymentIdentity operation kind/digest, one atomic winner, authenticated receipt/status
lookup, stable request identity, unknown-outcome reconciliation, non-wrapping
finality/fork/rollback detection, quorum-intersection or consensus assumption,
rotation verification and typed unavailable history. Independent witness
signatures are not a CAS implementation. Request identity permanently binds
one digest; CAS and status reads are linearizable, final winner/loser results
are immutable, sequence `n + 1` requires durably readable final `n`, and
compaction retains authenticated request-result membership or refuses.
Manifest-terminal requests also bind the exact transition/proposal key and
expected ProposedPublished disposition; the same CAS installs one immutable
Activated/Aborted/PermanentlyUnresolved terminal receipt/status. Journal and
high-watermarks are projections of that sequence, never separate writers.
RetireDeploymentIdentity is authenticated only by the independent retirement
authority; local Pending/request/outbox commits before the external call, and
the status-reconciled winner permanently closes the old deployment key without
publication-root authority or a distributed transaction.
Race all three terminal meanings, including abort before local activation, and
prove no accepted history contains two.
TerminalizationOnly and EmergencyDistrust permit status/abort/unresolved
terminalization but force LocalActivationCommitted to Aborted without changing
the operational head; they never accept old-profile activation evidence.
Persist the activation-fence sequence, expected predecessor, winning action and
profile/ratchet digests as rollback-sensitive security state.
Select separate proposal-publication and active-manifest high-watermarks,
durable per-witness request/receipt reconciliation, externally published
activation receipts after local CAS and authenticated abort/supersession
tombstones. Freeze separate operational-active and transition-candidate local
heads: only the former must equal externally Activated evidence; the latter may
name one reachable non-authoritative descendant. Every attempt reserves its
complete non-borrowable witness/reconciliation/terminal-result/audit/outbox/
checkpoint capacity before the first external send. PermanentlyUnresolved requires an authenticated external terminal
seal; timeout, retry exhaustion and witness absence only retain fenced
reconciliation state. A proposal never claims activation. Restore below the active
high-watermark or without the selected Active entry's bound profile/receipt/
key/witness proof is typed
`ManifestHistoryUnavailableOrRolledBack` and unready; a local database alone
cannot establish the latest head. A greater unresolved proposal blocks only
that candidate, descendants and cleanup while the last proved Active
predecessor remains operational. Raw-generation, fork, gap or reorder selection
is unsupported. NonWeakening profile successors use the independent
profile owner; Weakening consumes the same complete destructive protocol with
exact predecessor/successor profile bytes. Initialization and any weakening use the
complete destination-local six-state admission/pre-admission revocation/Issued
revocation/expiry/consumption protocol with exact bytes, time, key, quorum/SoD,
tombstone, result, audit and outbox. Ordinary rotation can only preserve or
strengthen the active profile.
Freeze the exact-target revocation intents for both source-manifest weakening
and permanent rebuild rejection with revocation issuer identity/continuity,
signer identity, key identity/epoch, authentication profile, issued-at,
not-before, target-covering expiry/not-after, maximum uncertainty and
trusted-time profile/epoch, closed reason, nonce, distinct revocation
idempotency, exact-authorization-scoped sequence, destination inbox/
tombstone/result transaction and late-consumed result behavior; remote emission
is not revocation and expiry winning remains expiry.
Revocation/expiry before begin or handoff consumption atomically
terminalizes safely, clears any drain, preserves evidence and advances the
predecessor fence. Replay, competing-successor substitution, cancellation-
authority substitution, stale generation or changed canonical material returns
the stored per-action result or typed conflict without mutation.
Exit criteria: Phase O has one approved, replaceable crypto/key profile.
`v0.140.1 implementation stop reached. Run pentest for this exact commit.`

## `0.140.2` — Tenant And Storage Topology Decision

Status: planned.
Migration/import decision: freeze all four parent aggregate/membership rows,
workspace parent transfer/inverse transactions, exact-cut checkpoint, bounded
cleanup against the old stable Closed fence, settlement checkpoint and
quarantine revocation inbox/tombstone/result. Also freeze immutable workspace
OriginalTotal, monotonic Released, exact per-leg settlement, cleanup admission
lane/contention budget/backlog/hard-maximum rows and their atomic scheduler
transactions. An adapter lacking any atomic bundle refuses the feature.
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
the business credential. Map remediation bootstrap/recovery ceremony,
channel/KMS bindings, quorum receipts, compromise/loss/recovery epochs, exercise
evidence, and offline/manual state. Map durable evaluator re-evaluation job
generation, tenant/provider/account queue, cursors, leases, provider-rate and
fair-share counters, priority, cleanup lane, freshness/refetch state, and
escalation. Map the complete `VIT-INV-062 MigrationImportJobAuthorityState`:
operation-key claim, `MigrationImportWorkBudgetV1` job/budget/reservations/
cursor/staging, closed lifecycle, lease/fence, candidate/tombstone,
authorization admission/consumption, pre/post-admission revocation, barrier
head/sequence/predecessor/result, active coordinator generation/fence, inert
history obligation/archive head/disposition/budget/result/checkpoint,
coordinator-bootstrap identity/lifecycle/begin-handoff-cancel authorization/
budget/checkpoint/successor-receipt/handoff/result, quarantine and cleanup
rows into one destination-local
transaction domain,
with source access read-only and final domain authority still owned by existing
invariant owners under `VIT-LAW-009`. Freeze exact maximum operation and principal/tenant/
deployment values for encoded/decoded bytes, allocation/decode/hash/signature/
proof work, manifests/records/blobs/chunks, temporary/staged bytes and rows,
open files and streams, checkpoints/resumes/reconnects/adapter retries,
conservative elapsed time, cleanup/reconciliation backlog and concurrent jobs.
Freeze immutable budget-profile ID/generation/epoch/digest, canonical operation-
key uniqueness, worst-case quantum precharge, staging/verification/result/
rollback/quarantine reservations and a non-borrowable Recovery cleanup reserve.
Storage unable to atomically persist counters/reservations with cursor and job
lifecycle refuses migration/import rather than relying on process memory.
Freeze the production activation choice: only the co-located
`MigrationImportActivationBarrierV1` profile is supported through `1.0.0`.
Persist the closed job lifecycle, candidate and candidate tombstone, canonical
trusted-code-derived `MigrationImportOwnerManifestV1`, dormant owner
generations, owner-authenticated preparation receipts, independently issued
`MigrationImportActivationAuthorizationV1`, its closed
RevokedBeforeAdmission/Issued/Consumed/ExpiredUnused/RevokedUnused lifecycle,
time/key/continuity ratchets, barrier sequence/predecessor/result and cleanup
linkage.
The manifest derivation freezes source/destination schema manifests,
migration-plan digest, the admitted destination VIT-LAW-009 tuple/manifest and
authenticated dependency closure, and contributor algorithm/version. This is
the only owner universe: no independent `InvariantCatalogV1` storage, signer or
activation lineage is selected, and importer input cannot add, remove or select
an owner. Type VIT-INV-062 as the sole live destination coordinator and all
other applicable dependencies as importable domain contributors. Coordinator
state remains outside the staged root and has no imported dormant generation.
VIT-INV-062 and domain owners receive verification-only activation authority
and the registry cannot forge an owner receipt. Persist the authenticated
revocation-intent inbox, exact-authorization sequence key, target lifetime,
exact retry/conflict result and pre/post-admission tombstone with the
authorization row. Every VIT-INV-062 mutation first locks and rechecks the
deployment-retirement fence, then the active coordinator generation/fence.
Admission, activation, revocation and
expiry therefore use the fixed deployment-retirement-fence→active-coordinator-generation→job→candidate/barrier→authorization
lock prefix; storage unable to atomically
create RevokedBeforeAdmission or CAS one terminal on that row refuses the
profile. Persist the live coordinator exclusion, typed source-history archive
namespace and identity-conflict index. Nonterminal source jobs never enter
staging. Terminal history binds stable identity/idempotency, authenticated
provenance and scope, original terminal result, export/import manifests,
archive namespace, retention/classification, sequence and predecessor; append
starts only after activation and has a bounded work/row/byte budget plus
protected cleanup reserve. Pending/ManualRecoveryPending/
NoHistory/NotRequested/Appended/ConflictFenced/RejectedFenced/WaivedFenced/
AbandonedWithEvidence archive disposition and canonical result/conflict remain
separate from the irreversible activation result. Budget exhaustion retains
bounded descriptors and reservations in nonterminal ManualRecoveryPending.
Activation storage atomically commits Pending, its per-attempt reservation and
zero-counter immutable cumulative lineage with hard-maximum profile identity/
version/digest, ceilings and ordinal zero. NoHistory/NotRequested instead commit
distinct canonical evidence. `NoHistory` is a cryptographic zero-eligibility
proof bound to the source manifest and eligibility algorithm. `NotRequested`
commits
`MigrationImportRegistryHistoryNotRequestedRecordV1`, binding the source
manifest and eligible history digest/count, current retention/classification
policy IDs, generations and digests, legal-hold state/epoch, evidence floor,
provenance, compliance/legal approval SoD and the activation result/audit/
outbox linkage. Activation locks and rechecks those custody inputs; an active
hold rejects `NotRequested` whenever declining archival would weaken custody.
Initial append locks cumulative lineage before attempt budget and co-charges
both; missing lineage for either nonterminal state is corruption and cannot be
synthesized by an adapter.
Persist
`MigrationImportRegistryHistoryCorruptionFenceV1` and its closed
`MigrationImportRegistryHistoryCorruptionFenceStateV1` for the exact history
obligation. Activation atomically creates Healthy generation zero; Fenced and
ClearedAfterRestore are explicit higher-generation transitions, and absence/
rollback/wraparound denies. All history operations use the fixed universal
fence-before-lineage/budget order and skip only inapplicable positions without
reordering:
deployment-retirement-fence→active-coordinator-generation→job→candidate/barrier→authorization→ordered-domain-owner→control-settlement-archive-head→control-settlement-journal-head→recovery-capacity-parent-ledger→backend-storage-cost-active-recost-campaign-slot→backend-storage-cost-recost-campaign-fence→corruption-control-reserve→history-obligation→corruption-fence→corruption-control-lineage→corruption-control-lineage-checkpoint→lineage-disposition→recovery-authorization→clearance-anchor-source-manifest-head→clearance-anchor-source-manifest-authorization→corruption-clearance-anchor-registry→corruption-clearance-scope→corruption-clearance-authorization→corruption-clearance-attempt→corruption-rebuild→corruption-rebuild-rejection-authorization→archive-head→history/idempotency→recovery-lineage-budget→attempt/successor-budget→retention/legal-hold→audit/result/outbox.
`FenceMigrationImportRegistryHistoryCorruption` atomically records
the observation, evidence, reason, generation, detector identity, canonical
`MigrationImportRegistryHistoryCorruptionResultV1`, audit and outbox. The fence
blocks append, recovery and cleanup for only that obligation. It clears solely
through an independently authorized
`RestoreMigrationImportRegistryHistoryAtomicBundle` that proves and commits
the exact activation bundle plus every complete post-activation charge,
result, archive-head and checkpoint through every mandatory class/quorum in the
current destination-ratcheted registry in the same transaction, returning
`MigrationImportRegistryHistoryCorruptionClearanceResultV1`; ordinary editing,
inferred counters or partial reconstruction cannot clear it, and unprovable
lineage leaves the fence permanent. Storage exposes
`MigrationImportRegistryHistoryCorruptionConflict` for changed fence or
restoration material.
Persist the complete
`MigrationImportRegistryHistoryCorruptionClearanceAuthorizationV1` row beside
its independent admission/revocation/expiry/consumption lifecycle, exact-target
sequence, tombstones/results and immutable proof-work budget. Persist the pre-
activation anchor source-manifest lineage/genesis/separate operational-active
and transition-candidate heads/activation records/policy-transition
authorization lifecycle and activation-created generation-zero registry;
absence/default/lazy initialization denies. Persist the complete publication-
profile trust-anchor/bootstrap/rotation/transition/revocation-ratchet/
activation-fence port/request/receipt/status/one-attempt-slot/compatibility/
high-watermark rows, durable publication-attempt completion
reserve and checkpoint/release state, later non-wrapping registry, typed high-
watermarks and independently
authenticated full-manifest collection receipt. Registry advance atomically
rebinds an Open scope; a live grant/attempt terminalizes AnchorSetStale with
charges preserved and authorization generation advanced, while terminal scopes
never change. Persist the activation-created non-borrowable corruption-control
reserve, authenticated capacity-profile binding and immutable platform bound;
trusted code alone derives the scope maximum and ordinary saturation cannot
block fencing or bounded terminalization. Fencing creates one
obligation/fence-generation clearance scope with sole active authorization,
non-wrapping authorization generation, immutable lifetime hard maximum,
cumulative precharges and Open/PermanentlyUnprovable/Cleared/RebuildActivated
disposition. Replacement after expiry/revocation/stale/per-grant exhaustion
uses only remaining lifetime capacity; EvidenceWait retains the slot and
terminal scope dispositions reject admission.
Persist the capacity-state envelope as two non-interchangeable ledgers.
Lifetime work conserves WorkAvailable/EpisodeWorkReserved/
TerminalizationWorkReserved/nondecreasing WorkSpent for proof, retry, hash,
signature, bytes_processed and time. Physical capacity conserves
ReservedUnoccupied/Occupied/ReclaimPending/Released for rows, bytes_stored,
audit, outbox and checkpoint/archive resources; only verified archive plus
exact deletion may release occupied capacity. Stable kind-specific transfer
IDs, both conservation equations and present parent-pool encumbrance restore
exactly. Freeze signed/versioned
`MigrationImportRegistryHistoryBackendStorageCostProfileV1` binding backend
family/version, schema/index generation, artifact/encoding kind, fixed
overhead, canonical rational expansion numerator/denominator, rounding/
allocation unit and measurement semantics. Wide checked ceiling arithmetic and
backend/profile boundary/golden vectors define `bytes_stored`; import
recomputes it from canonical artifacts and never copies source counters.
Runtime disk-pressure guards are separate and may only fence earlier.
Freeze independently rooted cost-profile lineage/current head, Proposed/
Active/Superseded/Rejected transition, activation record, predecessor-linked
checkpoint and external high-watermark. Trusted classification compares exact
cost functions analytically over the complete artifact-kind/size domain using
the closed-form rounded-affine algorithm. Freeze maximum profile entries,
artifact kinds, canonical size, allocation unit, rational numerator/
denominator, proof bytes/nodes and classifier work. It may inspect only bounded
algebraic crossings/residue classes. Freeze the three outcomes
ValidNonWeakening, ValidWeakening and InvalidOrUnverifiable. Only a semantically
valid, completely proved lower charge is ValidWeakening and may consume the
destructive authorization lifecycle. Unsupported/unknown artifacts or
functions, overflow, exceeded format/proof/work bounds, malformed proof or
classifier-budget exhaustion are InvalidOrUnverifiable terminal no-write;
authority cannot override them.
Golden vectors alone are insufficient, while property vectors must match
exhaustive evaluation over small bounded domains.

Every affected child is handled by one epoch-cut
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignV1`.
Freeze one parent/selector-owned
`MigrationImportRegistryHistoryBackendStorageCostProfileActiveRecostCampaignSlotV1`
with None-to-campaign start CAS, exact-retry join, changed-material conflict and
`MigrationImportRegistryHistoryBackendStorageCostProfileRecostCampaignTerminalCheckpointV1`-
only reuse. The checkpoint binds terminal campaign+Closed fence, accounting
roots/balances, consumed authority/result, workspace/cleanup disposition,
audit/outbox positions and slot-release identity; slot clearing co-commits or
later verifies it exactly. Fenced retains the slot. This structurally prevents
overlapping successors, ambiguous same-rank fences and multiple pending
profiles. Freeze the fixed pre-cut snapshot, parent-ledger campaign epoch/fence,
bounded post-cut allocation/release log and high-watermark, dual-profile
admission, complete-delta preflight, atomic parent RecostPending reservation,
stable child transfer and inverse-transfer IDs, separate active-cost and
campaign/profile-bound pending-successor charges, lease/cursor/cumulative
budget/retry ceiling and protected terminalization reserve.
Every parent allocation/release locks the slot and campaign fence after the
parent ledger.

Freeze the three-case release matrix. Before whole-delta reservation a pre-cut
release settles only active charge, appends a tombstone and is subtracted by
the bounded preflight fold without successor credit. After reservation but
before application it decreases RecostPending and credits the parent. After
application, or for a post-cut child, it decreases pending successor and
credits the parent. The reservation transaction binds a specific authenticated
folded-log high-watermark, preventing release between aggregate calculation and
reservation.

Freeze the campaign/mutation-fence product. Preflighting/RecostPending/Applying
pair with Open, Complete with Finalizing and terminals with Closed. Fenced
preserves prior campaign plus Open/Finalizing; Fenced+Open denies allocations
but permits only evidence-complete protected releases, while Fenced+Finalizing
denies mutation. Prior Preflighting recovery returns to Preflighting, prior
RecostPending/Applying to Applying and prior Complete to Complete after bounded
checkpoint revalidation. It advances lease/fence generation while preserving
cursors, work, folds and reservations; recovery never completes remaining
preflight in one transaction. Abort folds admitted release then closes the
fence; Closed never reopens. Activation/abort/quarantine share one terminal CAS.
Freeze separately typed Start, Apply, Finalize, Activate, Abort and Recover
commands/results/conflicts.

Permanent quarantine requires a distinct six-state one-shot authorization
binding exact evidence, retained-capacity upper bound, workspace disposition,
successor rejection/predecessor preservation, current policy/hold/time/quorum/
SoD/nonce/idempotency. Independent issuer, local admitter and consuming
operator are separated from campaign/recovery/work roles. Only the dedicated
command consumes Issued authority and atomically commits
PermanentlyQuarantined+Closed, conservative encumbrance, rejected successor,
quarantined workspace, terminal checkpoint, slot release, audit/outbox or none.
Remote revocation is an issuer-signed intent with a target-scoped,
non-wrapping sequence, exact authorization digest, issuer/key continuity,
covering time window, uncertainty/profile, reason, nonce and idempotency. Only
the separately typed destination ApplyRevocation command verifies it and
atomically stores its inbox/tombstone/result while moving Absent to
RevokedBeforeAdmission or Issued to RevokedUnused. Freeze the total terminal
table and closed outcome wrapper: a valid revocation against Consumed returns
the stored quarantine result; against ExpiredUnused it returns the stored
expiry result; and either revoked state returns the stored revocation result.
CAS losers reread and reapply the table. Exact replays join; only changed
target/digest/scope/sequence/idempotency conflicts, and one target sequence
cannot suppress another authorization.
Missing or contradictory evidence cannot mint a refund; retry exhaustion alone
remains recoverable Fenced state.

Fold the open post-cut log continuously with a durable cursor and cumulative
authenticated checkpoint. Open to Finalizing fixes the high-watermark only
when the remaining tail fits hard entry/byte/work maxima; the exclusive
interval folds that bounded tail. Activation verifies only constant-sized
roots, counters, versions and checkpoint links. Every application transfer
atomically decreases campaign RecostPending and increases the child's pending-
successor aggregate by the same amount. Activation requires RecostPending zero.
It also requires a durable physical migration-workspace reservation covering
shadow data/index, WAL/journal amplification, verification, rollback/cleanup,
worker/I/O and failover terminalization, plus a completed checkpoint proving
the successor built/verified at the same exact closed logical/physical cut and
predecessor writers fenced. The checkpoint binds campaign/epoch, selector/
profile digests, fixed-snapshot root, closed post-cut high-watermark/fold root,
equal physical high-watermark, source/successor roots/counts, writer-fence
generation, reservation/cursor/result and verification profile. Catch-up may
run while Open but Verified requires Complete+Finalizing, a closed logical
high-watermark and exact physical catch-up; the Finalizing admission bound
covers both logical and physical tails. Freeze Reserved,
Building, Catchup, Verified, ActivatedCleanupPending, AbortCleanupPending,
CleanupReconciling, Cleaned, Quarantined, PermanentlyRetained and
CustodyReleased workspace states; copy/catch-up cursor and physical
mutation high-watermark; exact source capacity ledger/aggregate ceiling;
bounded build/synchronize/verify/cleanup/reconcile/quarantine/permanently-
retain/custody-release/settle commands; and
exact-once per-leg release only after authenticated deletion. Freeze immutable
WorkspaceOriginalTotal, monotonic WorkspaceReleased and the equations
`original = reserved-unoccupied + building-occupied + cleanup-pending +
quarantined + permanently-retained + released` and
`parent-member = original - released`. Settlement of each complete immutable
leg atomically moves its exact live bucket to Released and decrements the
parent member/credits ParentAvailable identically; partial legs and total
rewrites are forbidden. Reused migration staging must implement this exact
lifecycle. Workspace state is campaign-owned and locked only within parent-
ledger→active-slot→campaign-fence ranks; no separate workspace lock or mutation
path exists.
After terminal slot clearing, cleanup takes the current slot only as a bounded
rank-serialization lock and then the old campaign's stable Closed fence. It may
run when the slot is None or names a new campaign, cannot mutate that slot,
selector/profile or newer campaign, and releases the shared row between hard-
bounded quanta. Freeze
`MigrationImportRegistryHistoryBackendStorageCostProfileMigrationWorkspaceSettlementCheckpointV1`
to bind deletion, old terminal checkpoint, reservation/state, parent inverse
credit, result, audit/outbox and predecessor linkage.
Freeze a co-located terminal-cleanup admission lane, durable non-resettable
contention budget, backlog record and hard maximum. After a bounded number of
foreground slot grants, one cleanup quantum must win; a finite protected
release burst cannot reset the cleanup turn. Soft thresholds backpressure
campaign start/finalization, and activation cannot add ActivatedCleanupPending
beyond reserved count/row/byte/encumbrance/work/backlog maxima. No backend lock-
fairness assumption is accepted.
Freeze DeletionOutcomeUnknown as a non-release result that enters bounded,
durably budgeted CleanupReconciling from either ActivatedCleanupPending or
AbortCleanupPending. Freeze closed Activated/Aborted CleanupOrigin and
origin-discriminated terminal reference; reconciliation may resume only the
matching pending state and retention binds the exact activation/abort result.
Workspace reservation precharges a
non-borrowable permanent-retention escalation/terminalization slot. Only a
complete six-state admitted/expired/destination-revoked/first-terminal SoD
retention authorization can move exhausted reconciliation to
PermanentlyRetained, transfer its exact live legs into a hard-bounded retention
pool and remove it from the active cleanup lane; Released and ParentAvailable
do not change, and activation/abort remains immutable. Late evidence cannot
reopen cleanup or refund. Freeze a distinct whole-member custody-release
settlement/checkpoint: after retention/legal-hold/custody/no-future-dependency
proof, every remaining leg supplies one closed physical disposition.
AuthenticatedDeleted binds exact storage generation/root and verified terminal
deletion. Every planned TransferredToCustodyLedger leg makes Begin atomically
move a governed conservative maximum Available→TransferPending before external
work. A versioned custody cost profile maps unlike source/destination
generations and units with compression/encryption/replication/index overhead,
verified encoded size and checked rational ceilings. Commit converts the exact
reservation into the conservatively calculated custody member before exact
source credit; the linked quantities need not be numerically identical.
Unknown retains PermanentlyRetained or Quarantined and the pending charge.
Typed reconciliation releases only on definitely-never-transferred or
authenticated destination deletion. A terminally released reservation does
not return the lineage to its predecessor. Select an independently authorized
Replan operation: every plan has a stable identity, monotonic generation/head,
generation-bound bundle, reservation set and commit attempt. Begin creates
generation 1. Replan requires all old external outcomes terminal, proves no
Commit winner, atomically fences and supersedes the old attempt/grants/receipts,
advances the plan head and creates new reservations plus a PreparingOpen
attempt.
An independently authorized Abandon only fences an attempt and permits later
Replan; it never refunds capacity or reverses Begin. Reject full Abort through
`1.0.0`, because already released local control capacity and admitted external
effects cannot be exactly rolled back without unsafe compensation.
Every Replan must repeat, not inherit, aggregate feasibility through a trusted
CustodyReleaseReplanPreflight. It proves both replacement and future Commit
fit current backend atomic limits, and reserves the new bundle plus retained
old-plan/receipt/reservation/evaluator/reconciliation/GC obligations under the
complete combined profile/ledger/reservation lock rank. Grant consumption,
preflight capacity, plan-head CAS and replacement reservations are one
transaction or none becomes current.

Select permanent conservative terminalization over indefinite Unknown.
After bounded reconciliation exhaustion, independently authorized
QuarantineUnknownTransfer converts the entire TransferPending maximum into a
permanent unknown-transfer custody member without refund, fences the transfer
identity and destination namespace, retains evidence/hold policy and removes
its evaluator dependency at the fixed charge. Later evidence is append-only,
not automatic refund. Replan uses entirely new capacity and identities.
Freeze a separately authorized retained-unknown resolution family:
RetainedUnknown may become ConfirmedPresent, DeletionVerified or
PermanentlyUnresolvable. Confirmation first covers evaluator deficit and
converts without reducing charge. Deletion requires authenticated absence of
every object/version/multipart operation under the fenced namespace and exact
base/emergency-capacity settlement; active or uncertain legal hold denies.
Every result retains the immutable quarantine decision. Deployment/tenant hard
count, base-charge, deficit, evidence and resolution-work ceilings supplement
the per-lineage budget.

Freeze an immutable plan-lineage cumulative budget over generations, attempts,
grants, fences, rows/bytes, transfers, terminal reservations/members,
receipts/orphan GC, evaluator dependencies, reconciliation/verification and
time. No policy/grant/backend/restart/restore raises or resets it. Exhaustion
cannot destroy a still-possible Commit; after an already terminal attempt it
enters non-refunding BudgetExhaustedRetained. Compact old generations only
behind authenticated checkpoint/archive coverage that preserves exact replay,
conflict, counters and anti-reuse evidence.
Wire that budget into every destination authorization Admit/revocation Apply,
Stage/Verify, extension/reconciliation/seal, evaluator reassessment/migration/
remediation, unknown quarantine/resolution, MarkEligible/Abandon/Replan and
orphan/GC transaction. Each stable charge binds original bucket,
pessimistic amount, protected Recovery/ordinary class, terminal disposition
and checkpoint/archive settlement. Exact retry joins without another charge;
issuer-only intent creation cannot spend destination capacity.

Reuse the existing governed backend-storage cost-profile lineage rather than
creating another mutable owner. Every custody reservation pins its exact
Active generation/digest/evaluator and creates a dependency; superseded
evaluators remain available until all dependencies terminalize. Compatible
nonweakening successors may activate for new work while old dependencies
drain. Incompatible or weakening successors are fenced until zero live
predecessor dependencies, and weakening consumes the existing destructive
authorization. The transfer adapter enforces a streaming charge limit derived
from the current reservation. It accepts an additional bounded chunk only
after an atomic extension reserves more capacity under the pinned profile and
within the plan hard maximum; failed extension forbids further bytes/finalize
and leaves the original pending charge for verified cleanup.
Freeze Open→SealPending→Sealed external transfer state. Open alone accepts
chunks/extensions/multipart work and every mutation advances a version that
invalidates older final evidence. SealPending binds exact size/root/object/
ETag/version and admits no write; unknown provider outcome reconciles without
guessing. Sealed carries an authenticated immutable-version/stale-writer fence,
admits no append/overwrite/finalize/extension and is required by MarkEligible.
Providers lacking an equivalent hard fence are unsupported.
Seal reconciliation may reopen only from an authenticated
SealDefinitelyNeverCompleted receipt proving the old provider operation is
permanently incapable of later success. Current absence, timeout or accepted
cancellation is insufficient; without that guarantee SealPending remains
closed. A reopened attempt uses a newer provider fence and never reuses the old
token or multipart generation.
Bindings include cryptographic evaluator binary/algorithm/ABI and conformance-
corpus digests. Authenticated node readiness must cover every pinned evaluator
through startup, rolling upgrade, failover and restore. Independently rooted
emergency distrust immediately blocks chunks, extension, eligibility and
Commit. Independently authorized evaluator migration atomically fences old use,
reserves any positive delta and never reduces the original/current maximum or
forgets accepted bytes; uncertain external effects use permanent quarantine.
Evaluator distrust also triggers trusted reassessment. Corrected charge is
never clamped to the plan maximum; positive deficit atomically debits a
non-borrowable deployment/tenant emergency reserve or records uncovered
liability and fences readiness. Unknown reassesses before quarantine. Separate
authorization alone may provision more capacity, verify exact deletion or
migrate to sufficient capacity, always preserving reassessment/distrust/
quarantine history and legal-hold denial.

Freeze final covered-deficit conservation. EffectiveCharge is checked base
reservation plus the exact covered deficit, even above the historical maximum.
Commit atomically converts both components into one member and one deficit
settlement; unknown response/restore retains both components or observes the
whole conversion. Remediation-authorized evaluator migration may exceed the
old maximum only when the exact delta is already covered and no external byte/
root changes. Its result explicitly selects resumable Commit, verified
deletion followed by Replan, or permanent fenced retention.

Freeze complete non-reusable destructive authorization for deficit remediation
and unknown-transfer resolution. Each has independent issuer/destination
roles, six-state authorization, Admit/Expire, scoped issuer Revoke,
destination Apply/inbox/tombstone, closed outcome/NotAdmitted/conflict and the
first-terminal table. VerifyDeletion consumes one exact Issued destination row
in the capacity transaction and always rechecks quorum/SoD/legal hold.

Resolve Begin budget bootstrapping with a bounded pre-Begin admission pool,
not a dormant lineage object. BeginRelease Admit reserves a stable candidate
charge under deployment/tenant hard ceilings and protected terminalization
capacity. The one winning Begin atomically transfers its original bucket,
amount and settlement identity into the new lineage budget. Expired/revoked
non-winners clean up only after proof no Begin result or effect exists; unknown
outcome retains the charge.

Freeze a total deficit-remediation action/result matrix. Provisioning can only
resume Commit; verified deletion can only require Replan; migration produces a
distinct migrated-plan-ready-for-Replan continuation; permanent fenced
retention requires its own authorized action. Failed, retryable or Unknown
work retains the predecessor, charge and irrevocably admitted attempt without
a reusable grant. Begin consumes execution authority before dispatch; Complete
reconciles only that effect and definite no-effect requires a fresh grant.
Dispatch, not Begin, is the legal/policy cut: a broker locks routing/state-
head/attempt-set/attempt state, rechecks current hold/retention/policy/
distrust/namespace/provider-credential epochs, atomically redeems one non-
exportable capability and moves
ExecutionAdmitted→EffectDispatched before any provider call. Workers never
receive credentials; pre-call drift closes without traffic, while post-CAS
uncertainty is Unknown and never reopens.
Require a governed provider-effect conformance profile and passing result for
destructive dispatch. It freezes effect-ID scope, idempotency and claim/dedup/
query horizons, query consistency, credential rotation/fencing, late
duplicates, timeouts/partitions, takeover and authenticated definitely-no-
effect evidence. Select one application-level transmission claim, not bounded
application resends. Dispatch persists and consumes the unique claim before
traffic; only transport retransmission inside that uninterrupted invocation is
allowed. Return, timeout uncertainty, crash, lease loss or takeover enters
Unknown and permits authenticated query/reconciliation only, even while the
provider deduplication horizon remains open. Make the specialized claim a
domain realization of VIT-INV-006 `TransmissionStartClaimState`: only the
winning trusted-executor transaction receives one unreconstructable process-
local permit; exact retry returns status without another permit; post-commit
response loss cannot reconstruct it; and durable claim/digest/status is never
bearer authority.
Deletion release and permanent retention consume a separate complete
finalization authorization. Only explicit
retention creates the named permanently fenced custody member and atomically
settles the full EffectiveCharge into it.

Replace ambiguous Completed lineage-budget semantics with
CompletedWithoutResidualCustody and CompletedWithResidualCustody. Final Commit
transfers every surviving terminal unknown member, its remaining protected
work, authorization history, deficit settlement, namespace fence and capacity
provenance into its own independently restorable residual obligation/budget
slice under an exact sorted membership root and aggregate terminalization
budget. The root hashes only immutable obligation descriptors and transfer
results; mutable child disposition, remaining child budget and aggregate
counters use separate predecessor-linked CAS rows and atomic settlement/
checkpoint updates under routing→aggregate→child→authorization lock order.
Mixed child outcomes are independent. Later resolution/revocation/evidence/
checkpoint/GC charges that child/aggregate;
the completed lineage admits replay/proof maintenance only.

Add one cumulative predecessor-linked residual-state head over the immutable
membership root, every child state/budget-state, latest child settlement/
checkpoint, aggregate reference/state and integrity epochs. Child settlement
advances it atomically. Signed checkpoints publish an external high-watermark;
restore below or discontinuous with that anchor is unready, so coordinated
rollback of otherwise consistent child and aggregate rows cannot pass.

Make pre-Begin cleanup candidate-scoped. A durable winner mapping binds the
activated candidate. Losing cleanup proves no artifact references its exact
generation/charge, rechecks an absent or different-winner head, requires
terminal authorization and CASes only its CleanupPending row. Activation and
cleanup settlement identities are domain-separated, so a losing candidate can
never release the winner.

Freeze a generationed LineageOwned/ResidualOwned routing head as the final-
Commit ownership linearization point. Destination Admit, Expire, revocation
Apply, Resolve, evidence append, checkpoint and GC lock it before selecting
the charge/row owner. Final Commit CASes it with child/root/budget transfer and
completed disposition; losers reread/reroute once. Issuer intent is evidence-
only, and restore rejects any authorization sequence/inbox/charge under both
owners. The exact winning custody-release Begin atomically creates generation
1 LineageOwned with the new plan head/lineage budget and canonical-empty root;
absence is never LineageOwned. Replan preserves/version-checks the head and
final Commit is its only owner transition.

Represent aggregate state explicitly with a closed NoneCanonicalEmpty/
SomeAggregate tag. Winning Begin creates None plus an authenticated empty
residual-state head and no aggregate row. Zero-survivor final Commit advances
the empty head/routing with None; a nonempty Commit uses Some with exact
aggregate budget/state digests. Row absence never means empty.

Freeze a complete remediation-attempt-set head/root covering every effect,
capability/redemption, provider profile, reconciliation budget and execution/
finalization history. MarkEligible and Commit refuse ExecutionAdmitted,
EffectDispatched, ExternalOutcomeUnknown, live capability or pending
reconciliation. CommitEligible fences later Begin/Dispatch and final Commit
rechecks the identical complete root; effect work is never transferred through
an implicit “remediation heads” collection.

Freeze a closed attempt-set writer matrix: execution/finalization
authorization Admit/Expire/destination-Apply/consume; Begin; Dispatch; provider
reconciliation and Complete; capability lifecycle; provider-evidence
admission; and attempt checkpoint/compaction/archive. Every mutation follows
routing→residual-state→counter-capacity-state→attempt-set→capacity-archive-
high-watermark→capacity-archive-publication→capacity-archive-replay-head→
commit-attempt/remediation-attempt→capability/evidence/authorization→result
order and
atomically consumes one class-specific immutable writer charge with capacity-
state CAS, covered mutation, mutation record and successor head. Exact retry
returns the charge/result, CAS losers consume nothing, and Replan/compaction/
restore/migration preserve all consumption. No direct attempt writer or
narrower Dispatch lock sequence exists; a writer may omit an unrelated absent
publication/replay head only after locking/reading the stable high-watermark
guard and may never reverse the common subsequence.

If any covered writer races a CommitEligible plan, let the security-relevant
writer proceed and atomically invalidate
CommitEligible→PreparingRevalidationRequired with mandatory
non-wrapping revalidation epoch/sequence, original invalidation and eligibility
result/root, previous required root, required current root, latest mutation and
cumulative commitment. Retain the
revalidation fence as integrity evidence, but derive authorization behavior
from the tagged attempt state itself. PreparingOpen alone admits new
Begin/Dispatch or Stage/Verify/artifact work.

Every further covered mutation while already Required must append an immutable
CommitEligibilityRevalidationAdvance, CAS the exact prior payload and advance
the previous/current roots, mutation ID, sequence and cumulative commitment.
Concurrent losers reread/reapply; response-loss replay returns the stored
advance. Checkpoints may cover only continuous authenticated prefixes and
retain the terminal commitment/root without resetting the clock. MarkEligible
must verify the original invalidation plus full chain, or a checkpointed prefix
plus uncovered suffix, and repeat its full validation against the locked final
root; final Commit may never accept a stale result.

Use fixed `u128` attempt-set-head and revalidation epoch/sequence domains.
Begin/Replan preflight must create a RevalidationCounterCapacityProof from
server-derived, overflow-checked maximum lifetime counts for every
authorization, evidence, reconciliation, checkpoint, compaction, rollover,
response-loss and terminalization writer. It must prove both domains retain
worst-case terminal ordinary values no greater than `u128::MAX - 1`, leaving
`u128::MAX` reserved exclusively for an absorbing CounterExhaustionFence.
Insufficient, unbounded or overflowed proof rejects
before plan installation or external work. Correctly admitted work therefore
cannot exhaust either counter.

Make a lineage-wide RevalidationCounterCapacityState the sole count owner. It
binds proof/version, plan/lineage, a closed writer-class enum, per-class
admitted/consumed/remaining counts, total head writes, advance/rollover
subcounts, per-domain sentinel reservations, current counter tuple and
predecessor-linked non-wrapping state version. The closed enum includes Replan,
and head/state/subset equations bind every charge. Every head writer consumes exactly one typed
RevalidationCounterWriterCharge in the same transaction as capacity-state CAS,
covered mutation, head, result, audit and outbox. Class+command/idempotency is
unique: exact retry/response loss returns the old charge/result, changed
material conflicts and CAS losers charge nothing. Replan carries consumption
and retained obligations forward without increasing totals; authenticated
compaction/restore/migration preserve charge replay and all count/head
equations.

Do not let the broad plan-lineage checkpoint stand in for capacity-charge
history. Freeze a dedicated RevalidationCounterCapacityCheckpoint whose
predecessor chain binds capacity state/proof, every class/total/advance/
rollover/sentinel equation, current counters, and a domain-separated exact-set
commitment over charge ID/class/command/idempotency/request, before/after state,
mutation/head and result identities. It also binds the exact captured hot rows,
bounded chunks, result lookup and publication/key/encoding epochs. A dedicated
predecessor-linked CapacityArchiveReplayHead selects the greatest verified
published checkpoint. That head plus uncovered hot charges is the only
authoritative lookup: identical material returns the archived result, changed
material conflicts, and exact nonmembership under the locked head plus hot
absence is genuinely unseen. Missing archive/key/chunk/proof/result returns
typed historical-state-unavailable without charging or advancing; an older
readable checkpoint is never substituted.

Give this archive its own immutable chunk manifest, proof budget, durable
verification cursor and five-state publication receipt: Staged, Verified,
ConsumedByCommit, OrphanGcEligible or Collected. Only typed Stage, Verify,
Commit, MarkOrphan and FinalizeGc commands mutate it. Proof budgets bound bytes,
entries, chunks, depth, allocation, decoding, hashing, continuations, work and
time; verification reconciliation and orphan cleanup use non-borrowable
Recovery capacity. Verified may CAS only to ConsumedByCommit or, after proof
the candidate cannot win, OrphanGcEligible. GC rechecks replay/high-watermark
non-reference and records Collected only after authenticated exact deletion.
Publishers/storage adapters remain evidence-only and cannot declare Verified,
install heads or mutate lifecycle rows.

Before final local CAS, require an independently witnessed monotonic
CapacityArchiveHighWatermark binding the exact proposed checkpoint/replay-head,
publication/manifest, epochs, covered/successor capacity state, history charge,
mutation/result preimages and deletion set through an acyclic
CapacityArchiveWitnessProposalV1. The proposal excludes the future signature/
receipt and Reconcile/Commit result digests. The authority signs its
domain-separated canonical digest; the receipt binds proposal+signature, the
Reconcile result binds proposal+receipt, and Commit binds proposal+receipt+
Reconcile result. A generated schema-reference/hash-dependency graph must be
acyclic and reject signature inclusion, ambiguous encoding and cross-epoch
substitution. Prepare first consumes its admitted charge
and advances generation `g` from Unprepared to PreparePending under the
canonical locks. It persists a non-bearer submission claim and returns one
process-local unreconstructable submission permit; every retry, crash,
uncertainty and takeover is query-only and can never resubmit. Only after the
Prepare transaction commits may that permit submit for the same PreparePending
generation; no other state/generation can submit. The adapter never mutates state: every
immediate, delayed, queried or replayed outcome enters exclusively through
Reconcile. One stable disposition ID owns one terminal disposition charge/
state/mutation/head/result, while the subsequent archive Commit has its own
distinct charge. Exact retry rejoins; changed receipt/predecessor/publication/
manifest/successor/profile material conflicts. Timeout/absence is read-only
and stays fenced. Begin/Replan also reserves a non-borrowable Recovery
HighWatermarkReconciliationBudget with hard call/byte/work/elapsed/concurrency
bounds and durable trusted-time backoff. Query IDs derive from guard generation
plus the already bounded query-admission writer-charge sequence, so no new
counter/sentinel exists. Each query admission is legal only in PreparePending
and atomically consumes its own class charge/budget/head plus an immutable
terminalization reservation covering its future writer charge/head advance,
result/audit/outbox bytes/work and concurrency settlement. Failure to reserve
is no-write. It records Admitted→PermitIssued and returns one process-local
unreconstructable permit; replay returns no permit. Reconcile records
InvocationReturned→ResponseImported with a closed WitnessedReceipt/
DefinitelyNotWitnessedReceipt/Unknown/TransportFailure/DeadlineExceeded
outcome, consumes that attempt's non-releasable/non-reassignable
terminalization reservation and performs exact-once concurrency settlement.
Only authenticated positive/permanently-sealed negative evidence co-advances the
witness disposition; other outcomes durably close the attempt without doing
so. Deadline/backoff binds trusted-time profile, uncertainty, continuity and
epoch; rollback never replenishes elapsed capacity. Exhaustion
fences all further traffic without inferring definitely-not-witnessed. A
witnessed candidate cannot be orphaned: crash recovery exact-
completes the deterministic successor or stays unready. Finalization locks
routing→residual-state→capacity-state→attempt-set→capacity-archive-high-
watermark→publication→capacity-archive-replay-head and atomically consumes one
history-lifecycle charge, advances capacity/head, CASes Verified to
ConsumedByCommit, installs the witnessed replay head, deletes exact captured
predecessor charges, writes immutable Committed(`g`) and installs
Unprepared(`g + 1`) bound to the new replay head/watermark. Authenticated
negative status alone cannot roll. PreparePending first enters
AbortDrainPending with one non-bearer seal claim; the external
SealCapacityArchiveWitnessProposalDefinitelyUnwitnessed expected-predecessor/
proposal CAS permanently tombstones and rejects late submission. Only its
independently discoverable receipt, all query attempts terminal, every
reservation/concurrency settlement consumed and no positive receipt allow
Reconcile to tombstone `g` and open `g + 1`. Positive evidence after the signed
seal fences authority equivocation. Replay installation, deletion and guard rollover are one
transaction; terminal generations remain for retry/conflict. Its charge remains hot. Restore reads
the independent greatest watermark before local heads; a locally consistent
older snapshot is never authoritative.

The core witnessed path owns three independent hot history-lifecycle charges
and head advances: Prepare, terminal disposition Reconcile and ArchiveFinalize
Commit. Checkpoint coverage excludes all three and every later query-admission
and terminalization charge. Every query owns both; if its authenticated
terminalization is the disposition Reconcile, the two meanings co-commit under
one charge. The exact equation is `3 + 2q - e`, with `e ∈ {0, 1}`. Timeout/
absence creates no disposition charge but must terminalize its attempt and
settle concurrency before another query. Exactly `q` terminalization
reservations must be created and consumed; cancellation, worker loss, Replan
and restore cannot release or move them.

Require a governed current passing witness conformance profile before Prepare.
It binds tenant/lineage authority identity, expected-predecessor CAS, non-
equivocation, signature/signer/key epoch, rotation/distrust, authenticated
definitely-not-witnessed proposal-seal semantics, durable rejection of every
late submission, independently discoverable seal receipts, read-after-write
durability, failover and positive-after-seal equivocation fencing.
Unsupported/stale profiles deny before the local fence or external traffic.

Use one universal routing→residual→capacity→attempt-set→high-watermark→
publication→replay-head order. Begin creates Unprepared generation zero; only
Commit or a fully drained, permanently sealed, definitely-unwitnessed abort
terminalizes a generation and installs the next Unprepared guard. An ordinary
negative status is never rollover authority. Every ordinary writer must
lock/read the current generation and deny PreparePending/AbortDrainPending/
Witnessed before
omitting unrelated publication/replay rows; archive writers take all applicable
rows in order. Backend acquisition traces require the common prefix through
the guard for ordinary writers and the complete high-watermark→publication→
replay-head suffix for archive writers. Any acquired subset preserves relative
rank, and no omitted earlier-ranked row may be acquired later.

Include canonical capacity-checkpoint and replay-head `u128` sequences in the
capacity proof/state as one pair and include the non-wrapping guard generation
plus every admitted Commit/abort rollover. Query IDs use the bounded writer
sequence rather than a counter. The archive sequences start equal and advance together exactly
once only for the successful capacity-archive Commit charge named
ArchiveFinalize; FinalizeGc never qualifies and proposed/orphan attempts use
stable IDs without consuming a canonical value. Prove current plus every
remaining ArchiveFinalize charge is at most `u128::MAX - 1` and reserve one
atomic `(u128::MAX, u128::MAX)` pair sentinel. One-sided sentinel use is
corruption and restore never synthesizes its mate. This is preferred over
adapter-defined verification/witness semantics, callback mutation, separate
sentinels, dense/probabilistic membership, unbounded verify work, split
deletion, local-only rollback selection, sequence gaps, readable-old-head
fallback or a self-covering compaction charge.

At unexpected last-ordinary state, install the sentinel fence instead of the
triggering mutation, permanently unready all Begin/Dispatch/Stage/Verify/
MarkEligible/Commit/Replan paths and return the stored fence result on retry.
Never invent a RevalidationAdvance, cumulative commitment or successor head.
An imported/restored owner that already used the sentinel without its
authenticated fence is corrupt and remains unready. Missing, reordered,
duplicated, forked or rolled-back evidence makes revalidation unready and can
never decode/default to PreparingOpen. This is preferred over blocking
correctly admitted revocation/evidence/checkpoint work, overwriting the
original invalidation, an adjacent-row authorization switch, a partial refresh
path or an unrepresentable post-exhaustion promise.

Freeze one durable plan-bound commit attempt with PreparingOpen,
PreparingRevalidationRequired, CommitEligible, Superseded, Abandoned and
Consumed. MarkCommitEligible alone moves either preparing variant after
rechecking the exact plan, begin/version, verified publication,
dispositions, profiles and reservations. Commit, Replan and Abandon race on
that row; Commit consumes CommitEligible. MarkOrphan accepts only Superseded or
Abandoned and races under the same ordered attempt/receipt locks. Missing,
expired or revoked Commit authority never establishes permanent ineligibility.
Missing attempt state is corruption. One transaction consumes all disposition receipts,
settles every remaining leg, advances Released to OriginalTotal,
removes/credits the identical parent member and records CustodyReleased plus
per-leg disposition tombstones, custody transfers, result/audit/outbox. The
broader lineage release cannot perform an independent workspace credit.
Freeze separate six-state action-bound BeginRelease, ReplanCustodyRelease,
AbandonCustodyRelease, QuarantineUnknownTransfer,
MigrateDistrustedEvaluatorReservation and CommitCustodyRelease
lineage authorization grants; custody/hold evidence alone is not command
authority. Freeze explicit
`BeginMigrationImportRegistryHistoryCorruptionControlLineageRelease` and
`CommitMigrationImportRegistryHistoryCorruptionControlLineageCustodyRelease`
commands with separate payload/result/conflict types. Commit binds the stored
begin result, verified non-authoritative publication receipt, expected
predecessor/proposed archive heads, journal head, disposition receipts,
cost profiles/reservations, bundle/authorization, expected lineage version and
idempotency. Archive publishers and storage adapters may stage/upload/verify
evidence only; they
cannot advance the authoritative archive head, delete authoritative rows,
credit capacity or mutate lineage/workspace terminals. Commit alone
CAS-installs that head and deletes exactly the captured hot rows in the same
local transaction as every disposition, custody-ledger transfer, settlement
and result. Freeze command-owned publication state Staged→Verified→
ConsumedByCommit or Staged/Verified→OrphanGcEligible→Collected. Stage, Verify,
MarkOrphan and FinalizeGc have stored result/conflict types and precharged
lifecycle/GC budgets. Stage admits before upload and Verify rechecks only the
current PreparingOpen attempt; closed/non-current attempts return typed no-write
AttemptClosed without upload, verification or budget allocation. Stage,
Verify, MarkEligible, Replan, Abandon, Commit and MarkOrphan serialize after
archive head on plan-head→attempt→receipt-state; Commit atomically consumes
only Verified, orphan admission rechecks
non-reference and collected receipts never revive. Non-consumed receipts are
ignored by readers. The generic Release name is non-dispatchable.
All release transactions use one archive-replay-head→custody-release-plan-head→
commit-attempt-disposition→publication-state→settlement-
journal-head→sorted-custody-cost-profile-heads→sorted-custody-capacity-ledgers/
reservations→parent-ledger→current-slot→linked-old-fences-in-canonical-ID-order→control-
reserve→obligation→corruption-fence→lineage→checkpoint→release-authorization→
lineage-disposition→custody-authority→terminal-outputs rank. Freeze
`MigrationImportRegistryHistoryCorruptionControlLineageCustodyReleaseBundleHardMaximumV1`
over the aggregate ordinary-leg plus linked-workspace receipt/custody-ledger/
cost-profile/reservation/reconciliation/GC row/byte/lock/read/write/index/
output/work/time transaction. Preflight must prove the complete bundle fits the
selected backend before ReleasePending; individual workspace limits are
insufficient.
For permanent-retention and lineage-release grants, freeze issuer-side Revoke
commands that atomically allocate a target/action-scoped monotonic sequence and
store one signed-intent result or changed-material conflict without destination
mutation. Destination Apply alone writes inbox/tombstone/state. Freeze the
complete shared Absent/RevokedBeforeAdmission/Issued/Consumed/ExpiredUnused/
RevokedUnused operation table: absent expiry/consumption are typed no-write
NotAdmitted; late admission joins pre-admission revocation; first terminal
observations return their stored action/expiry/revocation result; stale/lower
sequence and changed material conflict. The Issued consumption cell says
“matching action-specific result” and conformance exhausts all six release
actions.

Final activation is one atomic authority/accounting/selector transaction. It
rechecks retirement fence, active slot, campaign/profile heads, classifier
proof, fold/complete/workspace checkpoints and selector; consumes the still-
Issued destructive grant for ValidWeakening or current ordinary-owner result
for ValidNonWeakening; moves Proposed/Active/Superseded and Complete/Activated/
Closed; reclassifies pending charges; records stable result/audit/outbox; and
releases the slot only through its terminal checkpoint. A backend without these
single-campaign, bounded fold, durable workspace and exact recovery/activation
semantics is unsupported through `1.0.0`.
Persist co-located
`MigrationImportRegistryHistoryRecoveryCapacityParentLedgerV1`, its exact
active-child, campaign-RecostPending, pending-successor and workspace
encumbrance sets and stable parent/child transfer rows. Workspace reservation
uses its own stable parent transfer to atomically debit ParentAvailable and
create the exact workspace member; authenticated cleanup uses the inverse
transfer and settlement checkpoint to remove that member and credit the
identical per-leg amount. Its remaining parent member is always derived from
immutable OriginalTotal minus monotonic Released. Allocation atomically debits parent and
reserves child; release atomically releases child and credits parent under one
identity, preserving ParentTotal = ParentAvailable + active child +
campaign RecostPending + pending-successor + workspace encumbrances. Each campaign
application atomically moves an equal amount from campaign RecostPending to
pending successor; inverse transfers and activation reclassification preserve
that same total. Apply the same protocol to publication completion reserves; a
backend without parent/child transactionality refuses. One logical operation
deterministically owns one transfer identity and immutable before/after
versions, balances, membership and result; timeout cannot mint a replacement.
Restore verifies both sides from one snapshot and never repairs divergence by
choosing a side or guessing a compensating credit. Freeze
per-kind atomic aggregate counters, exact membership/commitment and predecessor-
linked checkpoints. Parent verification has VerificationPending/Ready/Fenced,
stable monotonic cursor, cumulative work budget and protected capacity.
Restore gates the affected partition and streams bounded fixed-checkpoint
chunks; crash resumes without free rescans, child churn waits, and only complete
membership/aggregate/transfer/equation proof becomes Ready. Unavailable
history, mismatch, churn or exhaustion fences; unbounded startup scans are
unsupported. Freeze
`MigrationImportRegistryHistoryRecoveryCapacityParentVerificationReservationV1`
as a checkpoint-creation prerequisite. Its checked derivation covers the
complete authenticated snapshot from child count/encoded bytes, commitment
depth/chunks, per-entry decode/hash/proof maxima, adapter scan overhead and
terminal result/audit/outbox/recovery. The reservation is encumbered before a
checkpoint becomes a restorable head; smaller restore quanta spend that one
non-recreatable reservation. Insufficient or unbounded derivation leaves the
predecessor authoritative, so every valid maximum-sized admitted checkpoint
can finish verification. Freeze
`MigrationImportRegistryHistoryLockRankV1` as the sole adapter
rank mapping: the deployment-retirement fence is first, active coordinator
generation is next, and the active re-cost slot then campaign fence follow
their parent ledger.
Persist acquisition-trace conformance evidence. Release locks
and rechecks archive/journal settlement heads, parent ledger, current slot,
canonical-ID-sorted linked old campaign fences, reserve, obligation, corruption
fence, lineage, checkpoint, action-bound release authorization, lineage
disposition, custody authority and outputs in that order; it cannot mark Released while any physical
leg remains ReclaimPending, the aggregate bundle is over limit or the exact
parent credit is absent.
Permanent-quarantine workspace and unresolved campaign capacity stays an
entire authenticated parent encumbrance: no campaign-level proof may release
an apparent excess, reopen the campaign, admit the rejected successor or
change terminal disposition. Only the broader custody-safe parent release may
atomically settle the whole member after proving no future operation depends
on any quarantined byte; for every linked workspace that same transaction must
close its ledger through CustodyReleased, or retain the fully encumbered
predecessor.
Persist one unique durable clearance attempt per admitted scope generation with
lifecycle, lease/fencing token, cursor, precharged counters and result, plus the
normative authorization/scope table. Restore consumes Issued authority and
sets scope Cleared in the same transaction as ClearedAfterRestore. Freeze typed
state algebra: comparable consumed-work G-counters use checked maximum,
ceilings equal exactly, remaining is derived, causal heads select one containing
chain, and balances/reservations use one consistent snapshot.
Persist one predecessor/fence-generation-keyed parent rebuild record with
Open/Activated/PermanentlyRejected state, bounded proposal attempts, independent
permanent-rejection authority and its complete destination-local admission/
revocation/expiry/consumption lifecycle, one activated successor and disjoint namespace
selection. Invalid/stale/unauthorized proposals are no-write. A stale bundle,
invalid join, exhausted/recreated scope or mapping ambiguity refuses.
An independently admitted
`MigrationImportRegistryHistoryRecoveryAuthorizationV1` permits one exact
RetryAppend, Waive or Abandon action;
`ResolveMigrationImportRegistryHistoryRecovery` enforces RetryAppend to
Appended/ManualRecoveryPending only, Waive to WaivedFenced only and Abandon to
AbandonedWithEvidence only. Successor exhaustion returns typed
`MigrationImportRegistryHistorySuccessorBudgetExhausted` and requires a fresh
authorization for any next action. One cumulative obligation-lineage budget
bounds all initial/successor work, elapsed time, attempts, bytes and successor
count. Its initial ceilings fit
`MigrationImportRegistryHistoryRecoveryPlatformHardMaximumV1`; no amendment or
increase operation exists through `1.0.0`, and every adapter preserves counters
and ceilings exactly or refuses. Authorization and result storage use one
authoritative union tag, with derived action indexes verified on read.
Revocation targets exact authorization bytes without a second action field.
The authorization row stores the total six-state lifecycle plus one canonical
operation-outcome representation; Issued-only expiry and absent NotAdmitted
cannot create guessed tombstones. All authorization operations return the
closed
`MigrationImportRegistryHistoryRecoveryAuthorizationOperationConflictV1`
envelope and implement the frozen CAS-loser reread/reapply and first-terminal-
Candidate, barrier and activation-authorization rows persist the exact
Pending/NoHistory/NotRequested tag, its variant-specific
budget/lineage/proof/custody digest and retention/classification/legal-hold
epochs; changed material requires fresh activation authority.
Canonical waiver/abandonment records bind current policy, legal-hold,
compliance/legal approval and evidence-floor receipts.
Activation atomically creates Pending plus zero-counter cumulative lineage or
distinct NoHistory zero-eligibility proof/NotRequested custody record; absence is invalid and
cleanup waits for the terminal append checkpoint. Coordinator-schema succession
requires stable bootstrap identity, closed lifecycle, separate pre-admission-
revocable begin/handoff/cancel authorizations, bounded work/reservations,
predecessor-owned typed checkpoint, owner-authenticated dormant-successor
verification receipt, canonical per-action result/conflict and atomic
generation/fence handoff. Candidate final
counters include a pessimistically precharged complete preparation/activation/
result/recovery quantum, and `AdmissionPrepared` requires the atomically stored
complete unique receipt set. Job, barrier and every
affected domain-owner activation guard must fit one local transaction with fixed
deployment-retirement-fence→active-coordinator-generation→job→candidate/barrier→authorization→ordered-domain-owner→control-settlement-archive-head→control-settlement-journal-head→recovery-capacity-parent-ledger→backend-storage-cost-active-recost-campaign-slot→backend-storage-cost-recost-campaign-fence→corruption-control-reserve→history-obligation→corruption-fence→corruption-control-lineage→corruption-control-lineage-checkpoint→lineage-disposition→recovery-authorization→clearance-anchor-source-manifest-head→clearance-anchor-source-manifest-authorization→corruption-clearance-anchor-registry→corruption-clearance-scope→corruption-clearance-authorization→corruption-clearance-attempt→corruption-rebuild→corruption-rebuild-rejection-authorization→archive-head→history/idempotency→recovery-lineage-budget→attempt/successor-budget→retention/legal-hold→audit/result/outbox
locking and
expected-version CAS. Storage must prove atomic all-domain-owner activation with the
authorization consumption/tombstone and job result, or refuse before
migration/import reads or stages authority.
All three bootstrap grants use the one action-discriminated
`MigrationImportCoordinatorBootstrapAuthorizationRevocationIntentV1` protocol.
Freeze its exact-authorization/action sequence key, target-covering lifetime,
issuer continuity, destination inbox/apply transaction, permanent tombstone,
bootstrap terminalization, result/conflict and restore semantics. Remote
emission is never effect, and no adapter may implement grant-specific
revocation outside
`ApplyMigrationImportCoordinatorBootstrapAuthorizationRevocation`.
Cross-database, cross-region and external-selector activation are unsupported;
admitting one later requires a separately owned invariant/composite law and
reviewed milestone because the selector would become authority.
Produce a complete stable-invariant-ID coverage matrix from
`docs/INVARIANT_OWNERSHIP.md`; a selected storage profile missing an applicable
`VIT-CAP-*` capability is unsupported rather than waived. Coverage begins from
all phase and production declarations and resolves every ownership/lifecycle
row, declared composite `VIT-LAW-*` plus its dependency/recovery versions and
lifecycle, explicit semantic per-point `VIT-ENF-*`/negative-child contract,
`VIT-RCV-*` recovery field, and `VIT-FEN-*` owner-transfer fence. Freeze
acyclic, version-ordered symmetric supersession, mixed-version behavior,
migration contract, and rollback floor for every selected invariant; zero
unregistered or prose-only authority is permitted.
Resolve every selected law generation from `docs/LAW_GENERATIONS.md`, including
its historically effective dependency set, coordinator, semantics, activation
fence, migration/recovery contracts, conservative rolling-version
intersection, rollback floor, canonical `LawGenerationManifestV1` bytes, and
content digest. Reject a topology that supports only the
latest flattened law view or admits an invariant before its effective version.
Persist the exact admission-catalog ID, epoch, digest, trust profile, and full
`g01..gNN` ancestry separately from mutable manifest rows. Map exhaustive
semantic realizations and their transition/outcome/recovery/P/N/M/F evidence.
Reject any topology where database administration can admit a new tuple,
where restore can select an untrusted catalog, or where only a terminal
generation is retained.
Map the one global `VIT-INV-057` owner, expected-version activation row, and
predecessor/successor/revocation/emergency-distrust lineage. Separately map
every `VIT-INV-058` local `CatalogAdmissionRatchetRow`, including catalog
epoch/digest, distrust epoch, trusted-time lower bound/continuity identity, and
expiry tombstone, under the exact placement-generation key and workload/boot/
binary/semantic/fence bindings. Map `VIT-INV-059` separately: rollout root,
immutable topology/placement manifest, closed state, outbox/inbox, prepare/
activation/convergence/revocation receipts, irreversible
`ActivationAuthorized`, canonical authorization receipt and atomically paired
outbox intent, authenticated global-result receipt, both replay tombstones,
pinned active generation, external claim issuance evidence, co-transactional
local consumption tombstones/outcomes/uncertainty, deadlines, escalation, and
reconciliation. Reserve a fourth independent deployment topology-control
partition for `VIT-INV-060`: closed
`Uninitialized`/`DormantInitialized`/`Committed` handoff
state, exact artifact/rollout/manifest/local-admission binding, expected-version
current-generation row, canonical membership manifest/digest, monotonic member
placement generations, predecessor fences, permanent tombstones, and
transactional fence outbox. Map the complete canonical
`TopologyMutationAuthorizationReceiptV1` bytes/digest and VIT-INV-061 issuer
mutation/time/profile/continuity fields/high-watermarks separately from the
VIT-INV-060 consumer lower-bound/profile-epoch/continuity ratchet, consumed and
expired receipt tombstones, applicable workload claim, topology CAS, member
fences/tombstones, and fence outbox. Select the exact
`DeadlineConditionalTopologyCasV1` mechanism for SQLite single-node and
PostgreSQL HA: only an authoritative commit-time predicate or proven hard no-
late-commit fence qualifies. The entire successful bundle is one local
transaction; denial persists only its typed ratchet/expiry evidence. Client
clocks/timeouts, statement timestamps, best-effort cancellation, and
post-commit timestamps do not qualify. If either default backend cannot prove
the capability, that deployment profile remains blocked rather than changing
the authorization linearization point. MySQL, MongoDB, and SurrealDB may claim
dynamic topology only after the same conformance proof; otherwise their
capability report must reject it. The same decision freezes
`TopologyAuthorizationReplayLifecycleV1`: exact per-deployment and issuer/class
successful-admission-rate and outstanding-authorization limits, plus canonical
principal-or-authority/class limits, the minimum exact-outcome replay horizon, maximum hot-
row/byte and compaction-backlog limits, checkpoint cadence, archival
availability objective, alert thresholds, and fail-closed saturation behavior.
Separately freeze two bounded pre-allocation layers.
`TopologyAuthorizationIngressWorkBudgetV1` operates before durable authenticated
state and caps deployment/listener request bytes, concurrent handshakes,
signature/MAC work, canonical decode bytes/allocation/depth/work and failures;
a transport-source dimension is additive only when the source is trustworthy,
and caller-controlled data is never the sole budget key. Its
`TopologyAuthorizationIngressLaneV1` uses independently provisioned,
non-borrowable normal/recovery/break-glass listeners, accept/file-descriptor
quotas, cryptographic workers, decode memory/CPU, executor queues and connection
pools under one aggregate safety ceiling. Only server-controlled listener/TLS
trust configuration and upstream network policy route pre-authentication work;
the route grants no authorization.
`TopologyAuthorizationPresentationRateBudgetV1` is charged before protected
idempotency lookup but after authentication and canonicalization for every
authenticated canonical presentation, including
exact retry, replay, concurrent duplicate, conflict, and denial. It creates no
logical request, reservation, or authority and is never refunded. Saturation
returns transient `TopologyAuthorizationPresentationRateLimited` without
reading, replacing, or manufacturing an immutable request outcome.
Freeze the closed `TopologyAuthorizationPresentationLaneV1` as `Normal`,
`Recovery`, or `BreakGlass`. The lane derives only from an authenticated
endpoint/audience plus a versioned, fenced credential-or-authority profile;
body fields, requested class, principal labels and untrusted routing metadata
cannot select it. Recovery and break-glass use separately provisioned
identities/audiences and non-borrowable presentation/request capacity. Missing,
revoked, stale, ambiguous or restored-old mapping state denies. After full
policy evaluation, `TopologyAuthorizationBudgetClass` must exactly match the
authenticated lane or `TopologyAuthorizationPresentationLaneMismatch` rejects
without request/admission/outstanding allocation.
`TopologyAuthorizationRequestRateBudgetV1` is charged exactly once for the
first-seen canonical request ID/digest and is bound to its
`TopologyAuthorizationRequestSequence`. A first-seen successful issuance
therefore charges presentation, request, admission, and outstanding capacity;
a first-seen denial charges presentation and request only.
Freeze a monotonic `TopologyAuthorizationRequestSequence` for every first-seen
authenticated canonical request. Exact retries charge presentation rate again
but reuse the sequence, request-rate charge, and original outcome; only
successful allocation additionally receives `AuthorizationIssuanceSequence`.
Concurrent identical presentations each charge presentation rate, serialize on
the canonical key, and create exactly one request-rate charge, sequence, and
outcome. Changed-digest reuse charges presentation rate and rejects the
conflict without a second request-rate charge. Select
`TopologyAuthorizationRequestReplayCheckpointV1` as an authenticated
predecessor-linked commitment over request sequence/range, request ID/digest,
principal/authority, class, request-rate charge, typed outcome, successful issuance
link, archive profile, counters, algorithm/schema and key epoch. Checkpoint
precedes denied-row deletion. Within the frozen horizon replay is exact; after
compaction a request remains historical and returns archived denial or
`TopologyAuthorizationHistoricalStateUnavailable`, never current-policy
reevaluation. Freeze denial rows/bytes, checkpoint backlog, archive proof bytes/
depth/work, decode allocation, jobs and compaction-latency ceilings with fail-
closed saturation.
Use this dedicated VIT-INV-061 lifecycle rather than the generic VIT-INV-015
command receipt: topology request identity, request-rate charging, denial outcome,
and the optional link to authorization issuance must share one local owner and
transaction. Reusing a cross-domain receipt abstraction must not obscure those
fields or imply a second owner.
Select an explicit two-stage transaction boundary. Stage one,
`ChargeTopologyAuthorizationPresentation`, commits the non-refundable debit and
unique internal `TopologyAuthorizationPresentationChargeV1` before protected
lookup. Its `TopologyAuthorizationPresentationChargeId` binds canonical request
ID/digest, caller/authority, ingress/presentation lanes, mapping identity/
generation/fence/profile digest, budget epoch, charge sequence and owner/boot
continuity. The evidence is non-exportable, single-use and grants no authority.
Stage two, `ConsumeTopologyAuthorizationPresentationCharge`, consumes it,
rechecks the current owner mapping, and performs idempotency lookup plus any
first-seen request/denial/issuance writes. Mapping change returns
`TopologyAuthorizationPresentationLaneChanged` before logical request
allocation and never refunds stage one. A crash between stages leaves an
orphan spent charge and retry needs a new charge; fenced-continuity evidence is
unusable. Freeze
`TopologyAuthorizationPresentationChargeDispositionV1` as exactly
`ChargedAwaitingStageTwo`, `Consumed`, `MappingChanged`,
`ControlledAbortAbandoned`, `ContinuityFencedOrphaned`, or
`CheckpointedCompacted`. Only awaiting is nonterminal; it may transition to one
of the four irreversible terminal kinds, and checkpointed compaction preserves
that original kind plus its result/evidence commitment. Timeout/age cannot
choose a disposition. Stage one atomically commits debit, complete evidence,
charge sequence, and awaiting disposition; charge-ledger row/byte/backlog
saturation fails with no partial state before lookup. Bound and checkpoint
terminal charge evidence before compaction.
Freeze `TopologyAuthorizationPresentationChargeLedgerCapacityV1` as a storage
and maintenance contract keyed by the authenticated presentation lane.
`Normal`, `Recovery`, and `BreakGlass` have independent non-borrowable hot-row,
encoded-byte, `ChargedAwaitingStageTwo`, checkpoint-backlog, checkpoint/archive
I/O, and compaction-worker ceilings below one aggregate disk/work ceiling.
Every stage-one admission reserves sufficient capacity in its own lane for
terminalization and checkpointing. Normal saturation therefore rejects only
Normal stage one, break-glass saturation cannot block Recovery, and idle
emergency capacity is never loaned to create Normal cleanup obligations.
Select only storage profiles that can prove these properties; all others
refuse VIT-CAP-061.
Freeze VIT-INV-061 as the sole owner of the immutable
`TopologyAuthorizationPresentationChargeLedgerCapacityProfileV1` lineage.
The profile binds stable ID, monotonic generation/epoch, canonical digest,
predecessor, closed activation state, expected-version CAS, per-lane limits and
reserves, aggregate ceilings, and authenticated physical disk/I/O/worker
provisioning evidence. Freeze `Proposed`, `PendingDrain`, `Active`,
`Superseded`, and `Rejected` as the only states and forbid in-place mutation.
The predecessor remains active while a successor is proposed or pending drain.
Freeze a complete typed profile-diff classifier: every reduction of a lane
limit, reserve, aggregate ceiling, storage/I/O allowance, or worker allowance
must follow `Proposed` -> `PendingDrain` -> `Active`; only a successor proven
equal-or-increasing in every canonical field may activate directly from
`Proposed`. Comparisons use overflow-safe typed units. Unknown or omitted
fields, incomparable profiles, and mixed schema versions classify as
reductions. Activation is one expected-version transaction that makes the
permitted proposed or pending-drain successor active and the predecessor
superseded. Rejected and superseded are terminal; no state returns to proposal
or active.
Reducing either emergency lane or changing aggregate ceilings requires current
change-or-incident authority with separated requestor, approver, and activator
roles plus quorum. A shrink activates only when every successor lane limit
covers current usage, awaiting charges, terminalization reservations,
checkpoint backlog, maintenance obligations, and protected reserve; otherwise
it remains pending or rejects. Existing obligations never move lanes, and
capacity is never transferred between lanes. An increase requires evidence
that the selected adapter has physically provisioned the additional disk, I/O,
and worker capacity, reauthenticated at activation. Old generations and
downgrade writers deny.

Freeze
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainAuthorizationV1`
for every Normal, Recovery, BreakGlass, and aggregate PendingDrain transition.
Treat fence installation as an effective denial-capable reduction, not
preparation. Bind deployment/tenant, action kind, exact predecessor/successor
IDs/generations/digests, typed-diff digest, derived lanes/aggregates, policy
epoch, change/incident authority, requestor/approvers/activator/quorum/
separation proof, expiry, nonce, and idempotency ID. One authorization permits
one exact begin-drain, activation, rejection, or controlled-abandonment action
and is not portable or reusable as authority. Freeze the closed
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainAuthorizationConsumptionV1`
lifecycle as `Issued`, `Consumed { action_id, request_digest, result_digest }`,
`ExpiredUnused`, or `RevokedUnused`, with canonical
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainActionResultV1`
and typed
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainAuthorizationConflict`.
Consumption/tombstone/result/profile-or-fence mutation/event/audit/outbox is one
transaction. Same action/idempotency plus identical canonical request returns
the original result with no new side effect; different bytes/digest conflicts;
consumed, expired-unused, and revoked-unused authority can never authorize
another action.

Select authenticated sparse replay archiving; permanently retaining every
authorization and result is rejected because it violates bounded storage and
maintenance guarantees. Freeze
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainAuthorizationReplayCheckpointV1`
and
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainAuthorizationReplayArchiveV1`
with stable action/idempotency ID, canonical request and authorization digests,
terminal lifecycle state, complete action result or authenticated archive
reference, action/profile/tenant/deployment/policy bindings, predecessor
checkpoint, encoding/key epoch, and archive commitment. Sparse membership
returns the historical result or conflict; non-membership is an authenticated
exact-set proof and is never inferred from a dense watermark over arbitrary
IDs. Missing history returns
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainHistoricalStateUnavailable`
without execution.

Freeze one authoritative cumulative
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainAuthorizationReplayHeadV1`
per tenant/deployment scope with non-wrapping sequence, predecessor-head
digest, cumulative sparse root, scope, expected-version CAS, encoding/key
epoch, publication identity and covered hot-row version. Non-membership is
verified only against the greatest committed head plus current hot rows under
the same head/scope version; individual archives, checkpoints, stale heads and
head roots alone are insufficient.

Freeze
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayArchivePublicationV1`
as `Staged` -> `Verified` -> `CommittedHead` -> `HotRowsDeleted` ->
`OrphanGcEligible`. Upload immutable content-addressed chunks before the local
database commit. Staged/verified/orphan artifacts are non-authoritative and
readers ignore them. After content, key, durable visibility, budget and covered
row verification, one local expected-version transaction installs the
cumulative head and deletes exactly the covered hot rows; committed-head and
deletion are never separately visible. Unknown upload/visibility/verification
retains hot rows. Unknown local-commit response re-reads the exact
transaction/head and finds either the complete bundle or unchanged hot state.
Orphan cleanup requires proof that no committed head references the chunks or
that a later cumulative head preserves equivalent entries/results. Coalescing
creates a successor cumulative head. No database/object-store distributed
transaction is assumed.

Freeze
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionGuardV1`.
Read authoritative head `H`; fetch and bounded-verify its archive proof outside
the database transaction; then begin one local write transaction, lock/re-read
the authoritative head and exact action/idempotency key in the declared order,
and require exact equality with `H`. A mismatch returns
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayHeadChanged`
without a write and restarts proof verification. Under those same locks, check
the hot row. Only proof non-membership for unchanged `H` plus exact hot-row
absence may insert the unique replay row and atomically commit consumption,
result, mutation, event, audit and outbox.

Authority-bearing head/key/hot reads must be writer-authoritative and
linearizable. Asynchronous replicas, followers, caches, changing/weak
snapshots, or isolation profiles unable to preserve the head/key predicate
cannot authorize execution. Compaction and first execution use head-first then
canonical-key/covered-row locking. Freeze the exact supported isolation/
locking clauses per selected backend; otherwise it refuses VIT-CAP-061.

Freeze
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayKeyV1 {
tenant_id, deployment_id, action_kind, action_id, idempotency_id }` with
versioned canonical encoding. `action_id` and `idempotency_id` are independently
unique within tenant/deployment scope through separate unique constraints;
`action_kind` is bound but does not create another namespace. Exact retry
requires both IDs, kind and request digest to match the same row. Reuse of
either ID with any changed counterpart is historical conflict.

Freeze durable
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayRestartBudgetV1`
per logical admission attempt. It has finite automatic-head-change restarts and
cumulative proof bytes, decode allocation, verification work, conservative
elapsed-time and observed-head-advance limits. Head change, failover, crash,
cursor recreation, process restart and adapter retry preserve monotonic
accounting. Exhaustion returns
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionContended`
without authority consumption or execution; missing/unverifiable history
remains historical-state-unavailable. Freeze finite authenticated-admission/
compaction scheduling quanta and bounded yield/backoff. Unauthenticated callers
cannot reserve yield; Recovery keeps protected non-borrowable capacity; neither
side may starve the other or endanger replay permanence.

Freeze
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptV1`
with closed `Active`, `RestartPending`, `Succeeded`, `HistoricalConflict`,
`HistoricalUnavailable`, `Contended`, and `ExpiredNoExecution` states. Only
Active and RestartPending are nonterminal and may alternate; every terminal is
irreversible. At most one nonterminal attempt exists per canonical replay key.
Identical key/request joins it without allocating another budget; changed
digest or key material conflicts.

The attempt owns the restart budget and binds stable attempt ID, key/digest,
lane/class/principal, counters/deadline, owner workload identity, boot/
continuity ID, lease generation, fencing token and expected-version CAS.
Takeover advances lease/fence and preserves all counters/deadline; stale owners
cannot continue. Cancellation or connection loss changes no authority.
Succeeded commits with the replay row/action bundle; no-write terminals cannot
later succeed.

Freeze
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptCapacityV1`
with finite active/terminal rows and bytes, queues, per-principal attempts,
concurrent takeover/work, terminalization backlog and cleanup-worker limits per
applicable lane/deployment. Reserve terminalization/cleanup capacity before
attempt admission and keep Recovery capacity non-borrowable. Cleanup requires a
committed predecessor-linked
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptCheckpointV1`
binding terminal state/final counters/fence/capacity release and authenticated
result/replay-row or no-write audit link; it never removes replay-critical
state.

Freeze
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptCapacityLedgerV1`
and versioned reservation set. Creation atomically locks replay head -> optional
settlement journal head -> key/attempt -> attempt-capacity -> profile/fence/
domain rows,
rechecks head/profile, reserves original active/terminal/terminalization/
checkpoint/cleanup/deletion buckets, inserts the one nonterminal attempt and
commits all-or-none.
Identical joins persist no waiter and allocate no row, budget or reservation;
polling/connection resources remain separately bounded.

Every transition uses that order and locks the settlement journal head between
replay head and key when settlement state is touched. The separate settlement
archive replay head belongs only to publication and authoritative historical
lookup. Success rechecks Active, key/
digest, owner/boot, lease/fence/CAS, deadline, cumulative budget, authoritative head
and profile/fence/domain authority before co-committing success, replay/result,
domain/audit/outbox and active-to-terminal transfer. No-write terminalization
atomically performs the same original-bucket transfer. Profile/policy changes,
migration and restore cannot recompute existing quantities.

Freeze
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptCapacitySettlementId`
and
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptCapacitySettlementV1`
with one immutable record per reservation set and leg, binding original bucket/
quantity, trigger identity, transaction and result digest. Checkpoint
commit settles terminalization/checkpoint-backlog work but retains envelope
row/byte and cleanup/deletion reservations. Physical envelope deletion settles
those remaining legs exactly once; checkpoint occupancy remains in the archive
ledger. Duplicate/reordered/unknown responses replay or reconcile the stable
settlement result and cannot decrement twice.

Reuse the existing authenticated sparse archive/publication machinery under a
domain-separated settlement namespace. Freeze
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptCapacitySettlementCheckpointV1`,
settlement archive entry,
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptCapacitySettlementJournalHeadV1`
and
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayAdmissionAttemptCapacitySettlementArchiveReplayHeadV1`.
The database-local journal head binds a non-wrapping sequence/predecessor,
canonical ordered settlement/hot-row-set digest and version, every reservation-
set/leg/settlement ID and trigger, transaction/result/audit identity and owner
continuity; it never claims archive availability.

Freeze one unified journal/archive protocol for all checkpoint and deletion
settlement legs. Checkpoint settlement locks replay head -> settlement journal
head -> key/attempt -> capacity -> profile/fence/domain, validates the terminal
attempt and unsettled checkpoint legs, decrements only their original
terminalization/backlog buckets, writes immutable per-leg settlements, advances
the journal over the ordered bundle, and writes the attempt checkpoint, audit
and canonical result atomically. Physical deletion uses the same order and
protocol for its separate envelope/cleanup/deletion legs and atomically commits
envelope removal, original-bucket decrements, immutable per-leg rows, journal
advance, audit and result. Checkpoint occupancy remains charged.

Exact duplicate after hot-row deletion returns the archived result without
decrement. Changed settlement/reservation-set ID, leg, bucket/quantity, trigger
or result returns typed settlement conflict.

The archive replay head is the greatest authenticated, verified, published
cumulative root and advances only after chunk upload and verification.
Compaction captures exact hot-row IDs and version/range. Its final transaction
locks archive replay head -> settlement journal head -> exact covered hot rows,
rechecks the captured version and journal continuity, then atomically
CAS-installs the archive replay head and deletes only those rows through
Staged -> Verified -> CommittedHead -> HotRowsDeleted. Later rows remain hot.
Archive chunks may mix checkpoint and deletion legs; exact identity, trigger
kind and per-leg tombstones survive publication and coalescing.
Authoritative lookup is verified archive replay head plus current hot-row
version plus journal-head continuity. A proof for archive head H must re-read
or lock H before use. Archive non-membership never authorizes another decrement
when the envelope is absent. Coalescing preserves exact sparse IDs and
settled-leg tombstones. Missing, forked, rolled-back or unverifiable history
returns typed settlement-historical-state-unavailable and retains the
conservative original checkpoint or deletion charge.

Freeze settlement row/byte/checkpoint/archive/proof/backlog/worker bounds and
protected Recovery reservations. Recovery and migration preserve greatest
local settlement journal head, greatest verified archive replay head, both
predecessor chains and their proved relationship, root/key/publication state,
exact hot-row IDs/versions/ranges, cursor, settled-leg tombstones and original-
bucket balances, attempt-checkpoint linkage and the exact remaining unsettled
legs. Adapters must expose both distinct CAS boundaries and one unified
checkpoint/deletion settlement namespace or refuse `VIT-CAP-061`. Dense high-
watermark inference over arbitrary settlement IDs is forbidden.
Decision verification loses checkpoint responses, retries checkpoint settlement
before and after compaction, races it with snapshot/publication, publishes mixed
checkpoint/deletion archives, substitutes trigger/leg identity, restores or
migrates between checkpoint and deletion settlement, and removes checkpoint
history; outcomes are one exact result or a conservatively retained charge.

Freeze
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayProofBudgetV1`
and
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainReplayVerificationCursor`
with maximum encoded bytes, entries, chunks, proof depth, decode allocation,
verification work and concurrent jobs. Checkpoint/archive commitment,
high-watermarks/cursor, committed-head CAS/publication evidence and exact hot
deletion are one local database transaction after immutable upload and durable
archive verification. Archive/key/chunk loss, outage, budget exhaustion or
incomplete proof fails closed. Reserve bounded archive, verification, and
backlog capacity from Recovery maintenance resources; saturation backpressures
new drain authorization.

Recheck current policy/authority/approval, conservative trusted-time interval,
expiry, diff/coverage, and predecessor version before consumption. Ratchet
local time/profile, issuer continuity, signer/key epoch, consumption/result,
and replay state so failover, restore, suspend, clock rollback, or key rotation
cannot revive authority. Activation uses its own currently valid single-action
authorization, binds the installed begin-drain authorization and consumption
digests, and rechecks current policy/authority/approval/predecessor/fence.
Historical begin-drain authority must have been valid when consumed but need
not remain unexpired after a long drain. Revocation while draining leaves the
fence in force and requires fresh activation authority or separately
authorized rejection. Rejection/abandonment is separately action-authorized
and audited.
Unauthorized, expired, replayed, self-approved, cross-tenant, or substituted
requests write no successor/fence/event/outbox state.

Freeze `TopologyAuthorizationPresentationChargeLedgerCapacityDrainFenceV1`.
Entering `PendingDrain` atomically binds the active predecessor ID/generation/
digest, pending successor generation/digest, affected lanes, reduced aggregate
dimensions, install sequence, expected version, and owner continuity into one
durable fence. The owner derives `affected_lanes` from the canonical typed
profile diff; callers never supply it. A shared aggregate reduction fences
every lane capable of consuming that disk, I/O, worker, row, byte, backlog, or
maintenance dimension. Permit only one
nonterminal successor/fence per active predecessor. Every stage-one admission
locks the fence and must fit both active and applicable successor limits,
including every lane-specific and aggregate limit after its prospective
lifecycle reservation. Admission and activation lock the same lane and
aggregate capacity rows in one fixed order; otherwise typed
`TopologyAuthorizationPresentationChargeLedgerCapacityDraining` rejects before
debit/evidence creation. Existing obligations retain their lane reservations
and completion path. Activation atomically rechecks the fence, usage,
reservations, backlog, maintenance, provisioning evidence and predecessor.
Authorized rejection or controlled abandonment moves the successor to
`Rejected` and clears the exact fence under expected-version CAS. Missing,
stale, competing, worker-cleared or unauthenticated restored fence state denies.
Normal/BreakGlass drains cannot affect Recovery resources.

Fence lifecycle helpers are not public or independently callable commands.
Freeze `TopologyAuthorizationPresentationChargeLedgerCapacityDrainFenceInstalled`
as an event emitted only by the atomic PendingDrain transition and
`TopologyAuthorizationPresentationChargeLedgerCapacityDrainFenceConsumed` as
an event emitted only by atomic activation or authorized rejection. Direct
install/clear invocation is unrepresentable and older/malformed attempts deny.

Freeze
`TopologyAuthorizationPresentationChargeLedgerCapacityProfileActivationRecordV1`
as the canonical activation truth. Bind non-wrapping activation sequence and
predecessor activation digest; old/new profile identities, generations,
digests and states; expected/committed aggregate versions; transition class/
diff digest; exact fence identity/digest/consumption sequence or canonical-none;
provisioning and policy/change/incident/drain-authorization digests; owner
partition/continuity/fence; transaction identity/journal position; encoding
version; and integrity/checkpoint binding. Activation record, active head,
supersession, activation, optional fence consumption/event, audit, idempotent
result, and outbox commit atomically. Sequences never wrap/reuse and exhaustion
denies.

Freeze predecessor-linked authenticated
`TopologyAuthorizationPresentationChargeLedgerCapacityProfileActivationCheckpointV1`
before record deletion. It preserves the complete activation head and active/
pending/fence tuple; drain-authorization consumption/result high-watermarks;
canonical authorization/validation-evidence digests; trusted-time profile,
epoch, and validation interval; signer/key epochs and authentication profile;
and replay tombstones. Restore rejects gaps, forks, reorder, duplicates,
active-row disagreement, absent checkpoints and rolled-back external
time/key/consumption/result/activation high-watermarks. It additionally
preserves the sparse checkpoint/archive root, complete result or authenticated
reference, predecessor checkpoint, proof-budget profile, verification cursor,
encoding/key epoch, availability evidence, authoritative cumulative head
sequence/predecessor/root/scope/version, publication identity/state, covered-
row deletion evidence and membership/non-membership semantics against the
greatest committed head plus current hot rows. A digest, individual checkpoint,
stale head, or high-watermark cannot reconstruct a result or declare an
arbitrary ID unseen; response loss after hot deletion resolves only to the
archived result, historical conflict, or typed historical-state-unavailable.

Freeze recovery as
`TopologyAuthorizationPresentationChargeLedgerCapacityRecoveryStateV1`:
the active profile selected from the greatest authenticated committed
activation record, optional pending successor, optional exact drain fence,
lineage-generation high-watermark, activation-sequence high-watermark, and
cumulative replay-head/publication-state high-watermarks, plus the greatest
local settlement journal head, greatest verified settlement archive replay
head, both non-wrapping predecessor/sequence chains and their authenticated
coverage relationship, archive root/key/publication/cursor, exact covered and
current hot-row IDs/versions/ranges, settlement IDs/trigger kinds/ordered
bundle digests/results, attempt-checkpoint linkage, exact checkpoint/deletion
settled-leg tombstones, remaining unsettled legs and conservative original-
bucket balances. Missing or defaulted members fail recovery admission; a
singular-head snapshot is unsupported because no Vitheim release admitted that
schema. It is quarantined before authority mutation and cannot initialize or
migrate either head; only a new empty deployment initializes both canonical
genesis heads.
Recover proposed and rejected higher generations as history, never activation;
apply active and pending constraints jointly. Recompute the affected lanes and
reduced aggregate dimensions and authenticate them against the fence.
Multiple active profiles, pending/fence half-state, contradictory activation
records, unreachable predecessors, or rolled-back high-watermarks deny. Then
reconstruct usage/reservations. Never merge maximum numeric
ceilings across backups or peers; an older larger profile is not authority
after a newer downsizing profile.
Freeze the canonical principal/authority budget key and anti-identity-splitting
rule; every caller sub-limit is additive to, never a replacement for, deployment
and issuer/class ceilings. Freeze a closed `Normal`/`Recovery`/`BreakGlass` budget
class with independent rate and outstanding counters, a small per-deployment
non-borrowable break-glass reserve, and a non-borrowable recovery-processing
lane. Freeze exact reserve/counter sizes and ceilings. Neither normal nor break-
glass may borrow from the other, and emergency issuance never bypasses trusted
time, quorum/SoD, canonical receipt, single consumption, deadline CAS, replay
proof, or archive/checkpoint ambiguity. Select one project-owned, versioned canonical
authenticated-set/checkpoint construction and key-rotation profile. Every
issuance freezes one local atomic VIT-INV-061 transaction for quota validation,
all layered counter mutations, outstanding reservation, monotonic sequence,
canonical receipt, request-digest-bound idempotent result, and issuance outbox.
Freeze `OutstandingReserved` -> `OutstandingReleased` as an exactly-once
issuer-owned settlement keyed by stable settlement ID and authenticated terminal
evidence. `TopologyAuthorizationOutstandingReservation` embeds immutable
`TopologyAuthorizationOriginalQuotaClaimSetV1`: deployment, issuer/class,
principal/authority key, budget epochs, class/reserve source, unit and
quantities. Settlement releases those original outstanding buckets atomically
and never recomputes current policy keys; rate charges remain spent.
Client timeout/cancellation/disconnect, unknown response, retry, replay,
compaction, lineage revocation/supersession, or unauthenticated/issuer-created
consumer observation never releases capacity. Release requires consumer-
authenticated consumption, definitely-not-committed, permanently-unresolved or
receipt-specific-revocation evidence, or conservative trusted expiry beyond
`commit_before`; duplicate/reordered terminal evidence never decrements twice.
Checkpoint installation and the applicable
issuer-dense or proven consumer-eligible watermark advance precede hot
deletion; exact replay after the horizon requires authenticated archive
evidence; and missing proof blocks the affected issuance key/range rather than
making it unused. Freeze storage accounting for hot results, checkpoints,
archives, proof indexes, outstanding grants, and compaction backlog. A backend
that cannot prove bounded growth and anti-replay preservation refuses
VIT-CAP-060/061. The issuer checkpoint may use a dense allocated-sequence
watermark. The consumer
defaults to a sparse terminal-state commitment and may advance dense
`ConsumerCompactionEligibleThrough` only with a complete authenticated
`TopologyAuthorizationIssuedRangeManifestV1`, conservative proof that the
exact replay horizon elapsed and every `commit_before` passed, and terminal or
permanently-unresolved state for every locally known member. Freeze the
manifest's deployment/issuer/fence/key/range/ordered sequence/receipt digest/
deadline/uncertainty/predecessor/authentication fields. It is evidence, not
cross-owner authority. Any gap, unavailable manifest, or failed time proof
keeps the consumer sparse. Freeze `TopologyAuthorizationIssuedRangeManifestV1`
as a bounded root plus predecessor-linked
`TopologyAuthorizationIssuedRangeChunkV1`: exact maximum root/chunk encoded
bytes, entries and chunks per manifest, entries per chunk, canonical decode
allocations, verification work per step/job, proof depth, roots/chunks per job,
durable verification-cursor schema, and
root/chunk/ordinal/subrange/entry-count/chunk-count/terminal-marker bindings.
Oversize or over-budget input rejects before entry allocation; partial,
truncated, cyclic, reordered, duplicated, overlapping, substituted, or mixed-
profile chains remain sparse. The global, rollout, topology, and local update
domains cannot share an authority row. Discovery/orchestrator state is
non-authoritative.
Planning-superset storage is non-authoritative and physically/logically
distinguishable from active catalogs. No storage topology may make active trust
reconstructible from the database after compiled/signed provenance is lost or
allow backup rollback to extend bounded validity.
Map the evaluator invalidation-campaign root in the same transaction domain as
evaluator epoch activation/revocation. Separately map the canonical capability-
owner source/topology manifest, monotonic outbox sequences/cutoff high-
watermarks, exact destination receipts, source lifecycle fencing, and
`MembershipDeliveryBlocked`; then map authoritative append-only membership
shard journals/generations/high-watermarks, source-first fenced credential
moves, the canonical sealed membership manifest, one fenced scan/receipt per
shard, final membership barrier, idempotent
materialization/dispositions, capability-owner mismatch reconciliation,
successor tombstones, and stuck state. Search and projections are never
completeness authority.
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
active/active rejection evidence, declaration-derived invariant/contract/
lifecycle coverage, evaluator-campaign placement/completeness profile, migration
and portability consequences, plus the selected admission-catalog persistence/
refresh model and ancestry/semantic-realization coverage matrix.
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
output surviving activation/revocation, split epoch/campaign root, projection-
authoritative discovery, missing source manifest/partition/sequence/high-
watermark/inbox receipt/topology lineage/delivery barrier or membership journal/
generation/manifest/scan/receipt/barrier/disposition/reconciliation state,
premature source retirement, unfenced cross-shard move, predecessor campaign
reuse, incompatible-node
startup, partial
quarantine transition or old-work tombstone loss, generic/incident-only clear,
missing strong revision/consistency barrier/resolver separation, remediation
lineage merged with business credentials or quota, stale observer state or
dispatch-time remote discovery,
unregistered invariant declaration/owner/lifecycle/law, unresolved per-point
enforcement/negative/capability/recovery/fence ID, cyclic or non-increasing
supersession, unsafe mixed-version owner transfer, invalid status semantics,
missing migration contract or rollback floor,
missing/untrusted catalog tuple, catalog rollback, signer/root substitution,
omitted ancestor or semantic realization, unknown semantic ID,
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
capability evidence is reviewed. Also inject every `0.22.0` lock/time/CAS/
commit/timeout/response-loss/failover pause into each selected backend and
reject omitted receipt/time fields, ratchet or tombstone reset, mechanism
downgrade, uncertain-late commit, non-lossy migration failure, and downgrade
writer admission. Also saturate rate/outstanding/hot/backlog limits; race
issuance and old replay against checkpointing, coalescing, hot deletion,
archive outage, key rotation, backup, restore, migration, and backend failover;
prove no covered key becomes absent/reusable, exact outcomes remain guaranteed
for the frozen horizon, unavailable historical evidence fails closed, and
steady-state storage stays within the admitted model.
Exercise sparse consumer histories and late first presentation, forged/
incomplete/overlapping issuer manifests, deadline/horizon boundaries, and
permanently-unresolved seals. Exhaust normal capacity and prove one valid
reserved break-glass issuance; flood break-glass and prove its ceiling,
non-borrowing, and zero delay to revocation/recovery. Archive/checkpoint outage
or compaction saturation never becomes an anti-replay exemption. Crash between
every issuance write and prove all-or-nothing state; preserve reservations over
timeouts, lineage revocation and supersession. Reject issuer-forged consumer
terminal evidence; settle only consumer-authenticated terminal outcomes or
conservative expiry, exactly once under duplicate/reorder and consumption/
revocation/expiry races. Change policy/principal keys and budget epochs before
settlement and prove the original claim set releases all-or-none. Prove every
pre-authentication ingress byte/concurrency/cryptographic/canonical-decode
limit. Attack lane selection with normal credentials at emergency endpoints,
body-class claims, wrong audience/profile/mapping generation and revoked or
restored-old mappings. Rotate lane credentials and fail over between every
mapping transition. Flood many normal principals without spending emergency
capacity; flood break-glass without delaying recovery; prove class/lane
mismatch creates no request/admission/outstanding state. Simultaneously exhaust
normal accept queues/file descriptors, TLS/signature workers, decode memory/
CPU, executor queues and pools; prove reserved recovery/break-glass ingress
survives, break-glass cannot starve recovery, aggregate ceilings hold and the
ingress route grants no authority. Race mapping SoD activation, rotation and
revocation between stage-one and stage-two commits. Crash before/after each
adapter commit; prove the debit/evidence precedes lookup, orphan charges remain
spent, retries obtain new IDs, old continuity cannot reuse evidence, changed
mapping denies before request allocation, and the second-stage request/outcome/
issuance bundle stays atomic. Exhaust the charge ledger before stage one and
prove debit/evidence/initial disposition are all absent. Exercise the complete
disposition transition table; reject unknown states, cross-terminal changes,
terminal rollback, timeout-derived abandonment and compaction that loses the
original terminal kind/result link. Prove every
presentation consumes presentation-rate capacity and every first-seen
authenticated canonical denial consumes one bounded request-rate charge but no
admission token/reservation/authorization issuance sequence/receipt/outbox;
it does atomically receive one request sequence/caller/class/outcome binding.
Flood exact replays, race concurrent identical presentations, lose a successful
response, retry while admission is saturated, and reuse an ID with a changed
digest; prove per-presentation charging, exactly-once request charging, exact
outcome reuse, and conflict rejection.
Crash request checkpoint-before-delete, retry after policy change, lose archive
proof, and saturate every denial storage/proof-work limit; the request never
becomes fresh. Omit/substitute every consumer terminal-envelope or
reconciliation-evidence field, outcome, result/outbox sequence and auth role;
unknown outcomes, reconciliation evidence, issuer-signed evidence and rollback
retain capacity. Prove the terminal settlement port cannot accept a
reconciliation receipt. Successful first-seen issuance consumes committed
presentation-charge evidence plus request, admission, and outstanding capacity.
Exhaust one caller sub-limit while other callers and aggregate ceilings remain
correct. Fuzz declared lengths/counts, decode allocation, work, depth, chunk
chain/root bindings and verification-cursor recovery without unbounded CPU or
memory.
For migration/import, exceed every exact operation and aggregate limit with
millions of small valid records, cryptographic/proof floods, temporary/staging
pressure, cursor recreation, reconnect/failover/adapter retry and concurrent
tenant jobs. Prove monotonic counter survival, precharge-before-work, stable
duplicate-job reconciliation, changed-manifest conflict, fenced destination,
unchanged source, bounded digest-only quarantine and Recovery cleanup progress.
Race every terminal disposition, job takeover, owner-version change and cleanup
at each activation lock; omit, duplicate, reorder or substitute owner-manifest
members and receipts; test partial preparation, one-owner rejection, concurrent
activation, response loss, failover after prepare and prepared-state restore.
Atomic activation must expose every domain owner plus the barrier/result or none.
For history control state, race manifest genesis/operational-active/transition-
candidate-head CAS and every
destructive-grant transition. Persist governed profile lineage/head, full
Prepared/proposal/local-CAS/Active/abort/unresolved lifecycle, durable
publication attempts/completion reserves, witness requests/receipts, journal
membership, trust-anchor/profile compatibility/revocation ratchet and both
external high-watermarks plus activation-fence port receipts/status and the
one-attempt slot. Restore operational_active_head equal to externally
Activated membership while transition_candidate_head may be canonically empty,
equal or one reachable proposed/unresolved descendant; fence only that
candidate and descendants. Persist separate lifetime-work and physical-
capacity ledgers with kind-specific transfer IDs, destination storage-cost
profile, Recovery parent ledger/double-entry transfers, child and parent
conservation proofs and settlement journal/archive exact membership. Reject missing/reset/recreated/
duplicated, double-charged, dimension-moved, WorkSpent-decreased,
bytes-processed/bytes-stored aliasing, copied source storage charge, split or
duplicate parent credit, premature physical release, proposal-as-
active or operational-head rollback. Record adapter lock acquisition traces and
reject any rank inversion or settlement omission of obligation/fence/checkpoint/
custody participants. Advance registry against no grant, a live attempt and each
terminal scope and require one atomic rebinding result. Saturate normal rows,
bytes, audit and outbox for Pending, NoHistory and NotRequested, then reduce the
capacity profile; the admitted non-borrowable reserve still permits fencing and
bounded terminalization without changing its trusted-derived scope maximum.
Missing barrier/receipt/owner state fails closed, and every topology outside
the selected co-located profile is rejected before staging.
Exit criteria: weaker isolation, unavailable co-location, and any topology that
requires a distributed work transaction are rejected, not relabeled supported.
`v0.140.2 implementation stop reached. Run pentest for this exact commit.`

## `0.140.3` — Identity And Session Profile Decision

Status: planned.
Migration/import decision: freeze distinct permanent-quarantine issuer,
destination admitter, revocation applier and consuming operator identities,
plus campaign owner/recovery authorizer, workspace worker/settler and parent
allocator/verifier. Cleanup identity for an old campaign cannot act as the
current selector, slot or new campaign; foreground workers cannot bypass or
reset a cleanup turn, contention budget or backlog threshold.
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
Also freeze the identity and authorization contributors for
`MigrationImportActivationAuthorizationV1`: requestor, approvers, activator,
quorum/SoD, policy/change/incident authority, exact tenant/deployment scope and
the independent issuer role. The importer, migration runner, VIT-INV-062 owner
and affected domain-owner credentials cannot satisfy the issuer role or
self-approve. Freeze a distinct authorization-admission service identity and
the predecessor/successor coordinator-bootstrap requestor, approver and
activator separation, plus an independent bootstrap-authorization issuer and
distinct begin, handoff and cancellation authority/admission identities.
Freeze separate history-recovery requestor, approver, operator and issuer/
admitter identities; no activation, bootstrap, archive worker or affected
domain owner can unilaterally enlarge the successor budget, waive or abandon.
Freeze independent compliance/legal approval SoD for choosing
`NotRequested`, and independent corruption-restoration requestor, approver,
operator and clearance-authorization issuer/admitter identities. The actor that detected or fenced
lineage corruption, the activation/import actor, archive worker and affected
domain owner cannot alone authorize, admit or execute restoration. Ordinary
history-recovery authority is not clearance authority, and no clearance role
may collect/admit the anchor registry or provide its required independent
quorum. Anchor-registry issuer/admitter, collection-receipt signers and
clearance decision quorum remain separated. Anchor-source-manifest bootstrap/
successor owner, policy-transition issuer/admitter/revoker and weakening
approvers are independent from those roles. Transition preparation, checkpoint
proposal publication/status query, local head CAS, external activation and
external abort are separate capabilities. Profile succession/weakening is
separate from all of them; trust-anchor bootstrap/rotation, profile prepare/
activate/abort/checkpoint/high-watermark/restore, compatibility classification
and emergency-distrust ratcheting have explicit independent roles. No actor may
select its witness mode, compatibility result or self-witness its prepared/
local head. Completion-reserve admission/settlement is independent from
publication workers. Control-lineage
episode admission, permanent quarantine/rebuild decision and custody-safe
release, local settlement-journal mutation and archive publication are separate
from detector, scope worker and ordinary capacity roles; no actor may
replenish/reset either ledger, alias processed/stored bytes, infer an abort,
release ReclaimPending capacity, delete an unresolved proposal or
release its own reserve. Freeze
distinct clearance-scope admission owner, attempt worker/takeover identity,
successor-rebuild requestor/approver/operator and permanent-rejection issuer/
admitter/revoker roles; none may self-authorize, occupy multiple scope generations,
permanently reject from candidate failure or choose a competing successor.
Neither coordinator, a migration actor nor an
affected domain owner may issue, admit, approve, activate or cancel its own
handoff; every role and validity recheck is bound to the exact active
coordinator generation. Revocation and principal/session/policy changes before
admission deny; a correctly admitted authorization remains usable only for its
exact candidate and immutable validity window until atomically consumed,
expired or locally revoked. Issuer withdrawal is effective only after an
authenticated `MigrationImportActivationRevocationIntentV1` commits either
RevokedBeforeAdmission or Issued-to-RevokedUnused under the exact-target
sequence key. Remote emission or transport acknowledgement alone does not
revoke; delayed authorization joins an existing tombstone and a late intent
after Consumed returns the activation result without reversal. The same
remote-effect rule applies to the action-discriminated bootstrap revocation
inbox, with sequence scope including the exact bootstrap action/grant, and to
history-recovery revocation, scoped to exact obligation/authorization; its
action is derived only from the referenced canonical authorization bytes.
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
Migration/import decision: retain workspace parent transfers, exact-cut proof,
old Closed fence, deletion/settlement checkpoint and quarantine grant plus
revocation tombstones/results. Retain immutable OriginalTotal, monotonic
Released, exact leg tombstones and cleanup lane/contention/backlog history.
Erasure cannot drop the fourth parent member, roll back release, invent
credit/cut, revive authority, starve terminal cleanup or partially refund
quarantine.
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
Classify topology-authorization hot outcomes and archives separately from the
minimal anti-replay checkpoint. Exact historical payload follows its applicable
retention/hold/erasure decision; the checkpoint retains only the least non-
sensitive lineage/sequence/key commitments and counters necessary to ensure an
erased or unavailable record can never regain authority. Erasure may change an
old replay outside the guaranteed exact-outcome horizon from exact outcome to
`TopologyAuthorizationHistoricalStateUnavailable`, but never to absent,
reissuable, or consumable. Sensitive fields and plaintext receipt payloads are
forbidden in the long-lived accumulator/checkpoint.
Apply that rule independently to the denial-request checkpoint. Retain only
domain-separated request sequence, keyed request/principal/class digests,
attempt-charge and typed-outcome commitments, successful issuance link, archive
profile and predecessor/key evidence needed to prevent reevaluation. Plaintext
request, principal, approval and denial details remain in horizon-bound hot/
archive records under their own disposition. Erasure can yield typed
historical-state-unavailable, never a fresh request.
Apply the same minimization to issuer range manifests: retain only sequence,
receipt digest, deadline/uncertainty, lineage/fence/key and predecessor evidence
needed for consumer gap proof; principal, approval, incident and receipt
plaintext remain outside the long-lived manifest. Chunk roots, ordinals,
subranges, counts, verification cursor, and resource-budget evidence reveal no
caller identity and cannot become a secondary activity log.
Classify drain authorizations, rejection/abandonment audit evidence, activation
records, and activation checkpoints independently. A long-lived activation
checkpoint retains only the least non-sensitive predecessor/head/sequence/
integrity and active/pending/fence commitments needed to prevent rollback;
detailed actor/approval/change/incident fields remain in policy-governed audit/
archive records. Deletion cannot make authorization reusable, erase required
SoD evidence inside its guaranteed audit horizon, break the activation chain,
or turn prior active state into unknown authority.
Retain the `0.140.2` replay-admission/compaction scheduler contract as
security-relevant lifecycle state: finite per-scope quanta, bounded
caller-independent yield/backoff, protected non-borrowable Recovery capacity,
and a rule that admission cannot pin compaction past replay-permanence bounds.
Unauthenticated callers retain no durable scheduler reservation. Retention,
erasure or tenant closure cannot delete live logical-attempt restart counters
or deadlines and thereby grant a fresh budget; closure instead fences the
attempt and preserves only the minimal non-sensitive exhaustion/authority-loss
commitment required to prevent replay.
Classify terminal replay-admission attempts separately from replay rows and
authorization tombstones. Freeze the minimal terminal envelope and its result/
replay-row or no-write audit/checkpoint link, maximum retention and cleanup
eligibility. Cleanup requires a committed predecessor-linked attempt checkpoint
and removes only the envelope after terminal meaning/capacity counters remain
recoverable. It cannot erase replay-critical state or turn an irreversible
terminal into a fresh attempt.
Freeze separate retention/settlement legs: checkpoint commit may settle
terminalization and checkpoint-backlog work but cannot release a still-present
terminal envelope or its cleanup/deletion reservation. Physical envelope
deletion settles those remaining original legs; checkpoint occupancy stays
charged to the checkpoint/archive lifecycle. Privacy deletion cannot collapse
these legs or remove their stable settlement record before the replay-retention
contract permits it.
Freeze history-recovery retention independently from activation and ordinary
staging. ManualRecoveryPending retains the bounded authenticated descriptors,
exhausted/successor/cumulative budget lineage, reservations, authorization/
revocation/attempt/result and archive-head predecessor needed to resume or prove
disposition. WaivedFenced retains its canonical waiver record and minimum
policy evidence; AbandonedWithEvidence retains its canonical abandonment
record, classification/legal-hold-required descriptors and terminal result.
`NotRequested` retains its source-manifest and eligible-history commitment,
policy/classification generations and digests, legal-hold decision, evidence
floor, approval SoD, provenance and activation/audit/outbox linkage under the
same custody precedence as waiver and abandonment; it is never the weak form
of `NoHistory`. A corruption-fenced obligation retains the fence, observations,
evidence and every available activation/charge/result/head/checkpoint fragment
plus every fence generation, clearance authorization/tombstone/result, proof-
budget charge, anchor-registry generation/predecessor/high-watermarks,
source-manifest lineage/genesis/operational-active and transition-candidate
heads/activation records/transition-authority tombstones plus governed profile
trust anchor/bootstrap/rotation/lineage/head/compatibility/revocation ratchet/
activation-fence port receipts/status/one-attempt slot/checkpoint/high-watermark,
publication attempts/completion reserves/
completion checkpoints/per-witness requests-receipts, external journal/
dispositions, proposal/active high-watermarks and proposal/activation/abort
receipts, activation-created registry genesis/rebinding result,
protected control reserve/profile/platform bound and obligation-wide control
lineage/episode ordinals/lifetime-work and physical-capacity ledgers/backend
storage-cost profile/Recovery parent ledger/parent-child transfers/kind-
specific transfer identities/conservation/nondecreasing WorkSpent and Released
counters/disposition/release checkpoint/
exact-once reserve settlements/local journal and archive heads/membership, collection receipt,
clearance scope/generation/lifetime counters/
terminal tombstone, clearance attempt/cursor/counters/result and externally
retained anchor commitment until exact atomic restoration clears it; ordinary
erasure or cleanup cannot weaken or clear the fence. A successor-generation
rebuild retains its parent, proposal attempts, permanent-rejection authority,
unique activated-successor mapping, old permanent fence, disjoint archive-
namespace relationship and minimal anchor/authority evidence under the same
custody precedence.
Commit rechecks policy identity/generation/digest, legal-hold state/epoch,
records/compliance/legal approval SoD and evidence floor. Active hold denies
any NotRequested choice, waiver or abandonment that weakens custody, without
emergency override.
Erasure may minimize payload only under the precedence matrix and cannot turn
either state into absent, archived, retryable under a new identity or eligible
for cleanup before the terminal checkpoint. It cannot remove external-
profile/lifecycle/high-watermark comparison evidence, make a proposal or lower
local manifest appear current, infer abort for cleanup, reset a fence episode,
erase consumption, replenish remaining control capacity or permit a second
settlement of an original reserve leg.
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
Migration/import decision: failover and restore resume the exact workspace
parent member/transfer, logical+physical cut, old cleanup fence, settlement
checkpoint, original/released/leg history, cleanup turn/contention/backlog and
revocation sequence/inbox/first-terminal result. They never infer or reset a
credit, cut, revocation, terminal outcome, release counter, cleanup turn or slot
relationship.
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
lineage/approval/audit/quota owner, remediation bootstrap/recovery ceremony and
independent channel/KMS recovery epoch, and their HA/failover behavior. Freeze
the evaluator re-evaluation scheduler topology: tenant/provider/account
partitions, stable job generations and durable cursors, global/per-tenant
fairness and starvation bounds, provider-rate claims, bounded concurrency/retry,
non-borrowable cleanup capacity, privileged/near-term priority, fresh-evidence
fetch, successor cancellation, and failover/RPO/RTO. Freeze the crash-atomic
evaluator-epoch-plus-invalidation-campaign-root placement; authoritative
capability-owner source/topology manifest, outbox sequences/high-watermarks,
exact destination receipts and delivery-blocked RPO; membership-journal shards/
generations/high-watermarks; source-first credential move fencing; manifest and
one scan receipt per shard; final barrier; concurrent lifecycle dispositions;
capability-owner mismatch proof; predecessor/successor fencing; stuck
escalation; and campaign RPO/RTO.
Reject projection/search authority and any HA design needing a fleet-wide
atomic freeze.
The HA profile also resolves every declaration-derived invariant owner,
transaction domain, stable contract ID, lifecycle/supersession fence, mixed-
version rule, recovery field, and rollback floor. Only local credential
activation is atomic; remote create/revoke is explicitly asynchronous.
For topology authorization, preserve the exact `0.140.1` class ceilings and
authenticated issued-at/deadline/uncertainty/time-profile/issuer-continuity
fields across every service and region. Freeze independent issuer and consumer
trusted-time adapters, maximum commit slack, local lower-bound/profile-epoch/
continuity ratchets, externally retained high-watermarks, and expired-receipt
tombstones. Issuer or consumer failover, NTP steps, suspend/resume, snapshot
restore, and cross-region disagreement may deny or shorten a receipt but never
extend it; an expiry-versus-topology-CAS race must produce either one proven
pre-expiry commit or a non-retryable reconciliation state.
Preserve canonical drain replay keys, both independent unique constraints and
claims, logical-attempt identity/counters/deadline, contention versus
unavailable-history disposition, scheduler quanta and protected Recovery
classification across failover, restore and region movement. A new process,
connection, cursor, adapter retry or promoted writer resumes monotonic
accounting; it cannot allocate a fresh restart budget or reinterpret either
unique namespace.
Preserve attempt lifecycle, single-nonterminal-key index, request-join binding,
owner workload/boot/continuity, lease generation, fencing token, CAS, capacity
reservations/backlogs and terminal checkpoint/link state. Failover/takeover
must advance the fence and retain counters/deadline; two owners, stale-owner
progress, no-write-terminal reversal and cleanup without complete linkage deny.
Also preserve every reservation-set ID, original profile/lane/class/principal
bucket and quantity, current balance/transfer, settlement ID/leg/trigger/result
record and lock-order version. Recovery reconciles unknown commits by stable
settlement identity; it never replays a decrement speculatively or derives an
old bucket from the current capacity profile.
The frozen recovery codec carries the greatest local settlement journal head
and greatest verified archive replay head; both non-wrapping predecessor/
sequence chains and their authenticated coverage relationship; root/key/
publication/cursor; exact covered and current hot-row IDs/versions/ranges;
settlement IDs, trigger kinds, ordered bundle digests and results; attempt-
checkpoint linkage; exact checkpoint/deletion settled-leg tombstones; remaining
unsettled legs; and conservative original-bucket balances. Omitting or
defaulting either head, linkage, trigger, settled-leg, remaining-leg or balance
fails decoding and admission. Singular-head input is never accepted: no
Vitheim release admitted that schema, `0.29.0` defines no split migration, and
preflight quarantines it before authority mutation while retaining conservative
capacity and an unready destination. A future genuine compatibility need
requires a separately versioned source-specific decision and security review.
Preserve every VIT-INV-062 `MigrationImportWorkBudgetV1` identity/profile/counter,
operation-key uniqueness claim, cursor, reservation, lease/fence, typed
exhaustion result and cleanup/quarantine disposition across failover, restore
and region movement. A promoted writer cannot reset cumulative work, allocate
a second nonterminal job for the same material, reinterpret exhaustion as fresh
work, borrow Recovery cleanup capacity or promote staged authority.
Preserve `MigrationImportJobLifecycleV1`, candidate/tombstone, trusted manifest
derivation inputs/output including the admitted VIT-LAW-009 tuple/manifest/
dependency closure, dormant generations, receipt authentication/key/
continuity/replay identity, activation-barrier sequence/predecessor/result,
complete activation-authorization bytes and closed consumption/tombstone/
time/key/continuity state, authorization admission, RevokedBeforeAdmission,
revocation intent/inbox/exact-target sequence/target lifetime/tombstone/result/
outbox, live coordinator state/exclusion, inert terminal-history archive,
identity-conflict indexes, active coordinator generation/fence, terminal-history
archive head/disposition/budget/ManualRecoveryPending descriptors/recovery
authorization/revocation inbox/sequence/tombstone/cumulative and successor
budgets/platform-hard-maximum/no-amendment rule/activation-created zero lineage
or distinct NoHistory zero-eligibility proof/NotRequested custody record/
atomic initial co-charge/sole-tag request and result/derived action indexes/
Issued-only expiry/closed outcomes including Fenced/three-variant operation-
conflict wrapper and
CAS-loser reread/first-terminal-winner semantics/attempt/
waiver-or-abandonment record/checkpoint/activation-created non-wrapping
Healthy/Fenced/ClearedAfterRestore corruption-fence state, universal lock
order, evidence/result, clearance authorization lifecycle/revocation/tombstone/
proof budget/source-manifest lineage/genesis/operational-active and transition-
candidate heads/activation records/transition-authority tombstones/profile
trust-anchor/bootstrap/rotation/compatibility/revocation-ratchet/checkpoint/
activation-fence-port-receipts-status-attempt-slot/external high-watermark/
publication completion-reserve lifecycle/activation-
created anchor-registry genesis/registry/scope-rebinding result/control reserve-
profile-platform bound, lifetime-work budget, physical-capacity ledger, backend
storage-cost profile, Recovery parent ledger/double-entry transfers, typed
transfers, lock-rank version, settlement/reclaim state and
collection receipt/clearance scope authorization-generation/
lifetime counters/terminal tombstone/attempt lease-fence-cursor-counters-result/
typed state join, atomic restoration bundle and clearance, parent rebuild/
bounded proposals/complete permanent-rejection authority lifecycle/unique successor/archive
selection,
candidate/barrier/activation-authorization history-disposition commitments,
coordinator-bootstrap stable identity/
lifecycle/begin-handoff-cancel authorizations and pre-admission tombstones/
shared action-revocation inbox/sequence/target lifetime/result/budget/checkpoint/
successor receipt/handoff/per-action results,
co-location proof and cleanup linkage as one
VIT-INV-062/VIT-LAW-009 HA/restore unit. Failover cannot turn prepared into
active, replay a terminal candidate or authorization, accept a partial or
importer-selected receipt set or pseudo invariant catalog, forge an owner
receipt, admit delayed authority over a pre-admission tombstone, let another
authorization's sequence suppress revocation, import/merge source coordinator
state, resume a source job, promote inert history, roll back a bootstrap
handoff, permit predecessor-started work to commit after handoff, make archive
failure alter activation, infer bootstrap revocation from remote emission, lose
a Pending or ManualRecoveryPending obligation, infer recovery revocation from
remote emission, lazily create missing lineage, split initial attempt/cumulative
charges, reset or increase cumulative recovery counters, create an expiry
tombstone from Absent, encode an adapter-specific outcome, accept a derived
action mismatch, admit mixed/noncanonical recovery action fields, let RetryAppend abandon,
substitute the recovery budget/policy/hold epoch, forge a NotRequested,
waiver or abandonment custody decision, equate NotRequested with NoHistory,
treat absence as NoHistory/NotRequested, widen a corruption fence beyond its
exact obligation, treat absent fence as Healthy, invert fence and budget locks,
bypass it during append/recovery/cleanup, clear it without a consumed exact
authorization or with partial/stale/unanchored/inferred lineage, downgrade/
omit a source manifest or required anchor, lazily create registry genesis,
fork/gap/reorder or raw-select its manifest head/activation record, infer
manifest initialization/weakening or permanent rejection from a remote grant/
revocation, bypass either complete destructive-authority table, advance the
registry without atomic Open-scope rebinding/stale-grant terminalization, lose
the corruption-control reserve, let ordinary saturation block fence/scope/
terminal result, reduce an existing reservation with its capacity profile or
accept a detector/adapter scope maximum, weaken source/quorum/nonresponse/time/
continuity without authority, admit two
live grants for one scope, reset fence-lifetime charges, replace EvidenceWait,
run competing workers, field-wise join ceilings/remaining/balances or forked
heads, roll back a registry/high-watermark, let invalid proposal consume the
parent, infer permanent rejection, exceed proposal bounds, create two
successors or select both old/new histories as current, substitute an
authorized history disposition, classify
Fenced as conflict, misclassify a different valid operation as
changed material, skip reread after CAS loss, clean before terminal checkpoint, or
replace the selected local transaction with a
remote selector.
Preserve the `0.140.2` atomic issuance bundle, layered deployment/issuer/
`TopologyAuthorizationIngressWorkBudgetV1`, non-borrowable ingress-lane
resource partitions/global ceiling, stage-one presentation-charge evidence/
sequence/closed irreversible disposition/result link/continuity/checkpoint and
atomic saturation semantics, per-lane charge-ledger rows/bytes/awaiting/
backlog/checkpoint/archive-I/O/compaction-worker reservations and aggregate
disk/work ceilings, capacity-profile lineage/generation/digest/state/
activation/provisioning evidence, typed reduction classification, activation
record/sequence/checkpoint/high-watermark, drain-authorization digest/replay
state and drain obligations, exact lane-scoped/
aggregate-derived drain-fence state and atomic lifecycle events, authenticated presentation-lane
endpoint/audience/credential-profile mappings and their generation/fence/
revocation high-watermarks and sole-owner/SoD state,
principal presentation-rate/request-rate/admission/outstanding counters,
immutable original quota claim
sets/budget epochs/reserve sources, request and authorization sequences,
denial-request and issuance checkpoint chains/high-watermarks/backlogs/proof-
work budgets, receipt-revocation intents, canonical consumer terminal receipt
envelopes/outcomes/result/outbox sequences, separate reconciliation evidence/
receipts, authentication roles, outstanding
reservation/terminal settlement ledger, bounded range roots/chunks/resource
profile, and durable verification cursor as one failover domain per issuer.
RPO may conservatively retain a reservation, denial, or repeat bounded
verification, but cannot expose a partial issuance, renumber/recharge a retry,
reevaluate compacted denial history, treat missing denial proof as new, release from
timeout or lineage revocation/supersession, accept issuer-created terminal
evidence, pass reconciliation evidence to terminal settlement, lose/default a
terminal-envelope or reconciliation field, roll
back result/outbox sequence or authentication role, recompute current bucket
keys, decrement twice, accept caller-selected/stale/ambiguous lane or lane/class
mismatch, borrow ingress or presentation emergency capacity, merge the two
stage commits, refund/reuse/forge a charge, skip the commit-time mapping
recheck, accept fenced-continuity evidence, merge presentation/request/
admission semantics, widen a
caller/class ceiling, or reset byte/entry/decode/
work/depth accounting. Cross-region range evidence remains non-authoritative
until the complete authenticated chain verifies.
It resolves `VIT-LAW-006` end to end on every failover path: no node may claim
transmission start unless it can recheck the exact independent authority,
target, provider, capability, lease/claimant, time, and quota roots, while
ambiguous starts remain `OutcomeUnknown`.
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
Every profile maps each effective composite-law generation to its local proof
coordinator, dependency placement, activation fence, recovery contract, and
typed failure state, and persists/verifies its canonical manifest digest across
upgrade, failover, and restore. In particular, transmission start distinguishes
`DefinitelyNotStarted`, `OutcomeUnknown`, and `StartClaimedReconciling`; only
the first permits an ordinary retry.
Freeze catalog distribution and refresh as a fenced control-plane operation:
`VIT-INV-060` alone advances current topology and member placement generations
through expected-version successor activation, canonical manifests, fences, and
tombstones. The rollout root consumes its authenticated current-topology
receipt, CAS-claims one monotonic `ActiveRolloutGeneration` per catalog lineage,
seals one topology/placement manifest, and gathers exact authenticated identity/
capability/semantic/fence-bound prepare receipts. It then atomically enters
irreversible `ActivationAuthorized`, persists the authorization receipt and
outbox, and pins that generation. The global owner authenticates that receipt,
serializes activation versus revocation through CAS, and returns an
authenticated result receipt that the rollout verifies before transition; each
independent local owner invokes the
shared verifier and emits authenticated convergence; the rollout root finalizes
from durable receipts. A digest alone is not receipt authentication.
Exactly one rollout generation is current and nonterminal. Pre-authorization
supersession atomically tombstones the loser as `Superseded`; an authorized
generation remains pinned while the global result is reconciled, and
post-activation rollouts must complete or be revoked. Late losing receipts and
authorization are permanently rejected, and delayed authorization cannot
bypass a revocation tombstone.
Failover, rollback, isolated-node startup, restore, and mixed-version operation
reject stale, revoked, unknown, partial, scope-mismatched, time-untrusted, or
database-invented catalogs. RPO/RTO
evidence states how the active catalog ID/epoch/digest is recovered without
granting the backup medium signing authority.
The HA profile names the single global lineage owner, single rollout-root
owner, single independent `VIT-INV-060` topology-generation owner, separate
local-ratchet transactions, expected-version activation, topology successor
commands/fences/tombstones, authenticated prepare/convergence acknowledgements, deadline
escalation, partial-rollout/unreachable-placement readiness, replacement/
region-move fencing, revocation/emergency-distrust priority, maximum tolerated
staleness, trusted-time continuity after suspend/failover, and behavior when
signer/root/validity/time evidence is unavailable. `AllRequired` remains the
default. Selecting `FencedQuorum` requires proof that unprepared placements are
durably fenced before global activation. A node never
continues dispatch or transmission start merely because its planned-superset
tuple or mutable cached envelope remains self-consistent.
It also names the selected `WorkloadIdentityProofProfileV1`, attestation/key/
lease issuer and failover domain, renewal/rotation/revocation and simultaneous-
use response, plus receipt-authenticator key/epoch recovery. Failover cannot
turn an exported mTLS key, stale lease, digest, or replayed channel transcript
into workload or receipt authority.
The HA matrix races authorization commit with abandon/supersede/revoke,
response loss, delayed delivery, and coordinator/global-owner failover. It also
proves online action-claim expiry and zero offline authority for the
orchestrator profile and revalidates every closed receipt variant plus its
durable integrity anchor.
It loses claim issuance and consumption responses independently, rejects
different-digest stable-ID reuse, blocks reissue while either typed uncertainty
state exists, restores the greatest issuer/local tombstone high-watermarks, and
proves receiver-only MAC verifiers cannot forge either cross-owner receipt.
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
invalidation-campaign root/membership-journal/generation/high-watermark/fenced-
move/shard-scan/receipt/final-barrier/materialization/disposition/
reconciliation/successor/stuck profile,
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
epoch/campaign-root split, membership-intent/journal/high-watermark/manifest/
scan/receipt/barrier/job omission, concurrent credential disposition or move
loss, projection-authoritative or false completion, stuck/predecessor campaign
reuse, incompatible-node readiness, partial resolution/old-work revival, missing strong
revision/consistency/resolver separation, remediation credential/profile/tenant
substitution, circularity/business use, sole-key outage/response loss/count
exhaustion, false automatic recovery without an independent provider path,
missing invariant declaration/owner/lifecycle/contract resolution, asymmetric
supersession, owner-fence loss, unsafe mixed-version transfer, rollback below
floor, incomplete recovery manifest, omitted settlement recovery head/linkage/
trigger/settled-leg/remaining-leg/balance, any singular-head admission or
upgrade, invented predecessor/coverage history,
reopened checkpoint leg or pre-settled deletion leg,
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
tenant/global starvation, emergency-reserve borrowing, split issuance bundle,
timeout/lineage-revoke/lineage-supersede/forged/duplicate terminal settlement,
original-claim loss or current-key recomputation, consumer-terminal signer
confusion, presentation/request/admission counter collapse,
reconciliation-to-terminal type confusion, caller-budget-key substitution,
range chunk truncation/cycle/substitution, verification-work/depth/cursor
rollback, degraded dependencies,
restore, capacity, and incident operations.
For migration/import corruption control, the HA profile additionally freezes
governed publication-profile succession, durable per-witness publication/status
reconciliation, completion reserve, proposal/local-CAS/external-terminal
ordering, profile trust/compatibility/distrust, operational/candidate heads,
activation-fence port/receipts/status and one-attempt slot, separate
proposal/active high-watermarks, lifetime-work/physical-capacity transfers and
equations, backend cost profile, Recovery parent ledger/double-entry equation,
shared lock rank, permanent-quarantine/rebuild/
ReleasePending/Released dispositions and separate settlement journal/archive
heads. Crash/failover/restore tests cover saturation before/after publication,
profile rotation or EmergencyDistrust after local CAS, losing CAS and response
loss, competing Activate/Rotate/Distrust CAS, root loss/compromise,
attempt-slot collision, activation/abort receipt loss, witness/key outage, head conflation,
WorkAvailable→EpisodeWorkReserved→WorkSpent, ReservedUnoccupied→Occupied→
ReclaimPending→Released, parent debit/credit response loss, storage-cost
profile drift/source-counter copy, bytes aliasing, lock inversion/participant omission,
and backup between journal, archive verification, exact deletion and final
release. Every case fails closed without guessed lifecycle, stranded
terminalization, reset work, premature release, capacity resurrection or
duplicate settlement.
Exit criteria: every `1.0.0` deployment claim maps to a Phase O test profile;
all ten option-decision authority reviews are resolved and no proposed
authority candidate can enter Phase O.
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
