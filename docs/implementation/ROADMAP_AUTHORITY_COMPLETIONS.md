# Roadmap Authority And Recovery Completions

Document status: normative implementation handoffs

This focused stop owns authority-bearing execution and recovery that is
deliberately separate from the declarative domain-retirement contract. It does
not weaken the lifecycle, drainage, history, disposition, or certification
obligations owned elsewhere.

## `0.30.29` — Domain Retirement Authority And Crash Recovery

Status: planned.
Setup: consume the `0.30.28` lifecycle and prospective contract; define typed
`DomainRetirementScopeV1` as exactly `TenantDomainData { deployment_id,
tenant_id, domain_id }` or `DeploymentDomain { deployment_id, domain_id,
membership_snapshot }`, never an optional/wildcard tenant. Define
`DomainRetirementProposalV1` with immutable plan digest, expected manifest and
contribution generations, expected retirement-state version, idempotency
identity, current authorization, separated proposer/approver/destructive
approver identities, and approval expiry. This stop executes only the exact
tenant child; deployment scope requires `0.51.5–0.51.15`.
Goal: execute and recover retirement transitions without stale authority,
partial commitment, silent command reopening, or data-loss acceptance becoming
completion authority.
Deliverables: closed scope, proposal/approval/plan codecs, expected-version admission,
authority and separation-of-duties checks, atomic state/audit/outbox commitment,
pre-fence cancellation, authorized quiescing abort/recovery, bounded resume
protocol, and typed `Blocked`/`EvidenceUnavailable` evidence.
Verification: domain/deployment/tenant, plan digest, manifest/contribution
generation, expected version, idempotency, principal, quorum, approval, or
expiry substitution; self-approval; duplicate/concurrent execution; crash and
response loss at every transition and audit/outbox boundary; cancellation after
fencing; unauthorized abort; resume that reopens fenced commands; stale work or
quarantine ignored; forced completion by accepting data loss; false authority-
loss/data-loss evidence; optional/wildcard tenant; deployment scope executed as
one child or cross-tenant transaction; and restore of an earlier state pass.
Exit criteria: every retry joins the same immutable plan and resumes only from
its durable fenced state; cancellation is possible only before fencing, later
recovery requires current separated authority, and completion records only an
exact `0.30.28` terminal. `RetiredVerified` alone is clean;
`RetiredWithIrrecoverableLoss`, `RetirementBlocked`, and `EvidenceUnavailable`
remain permanent non-clean outcomes in audit, support state, restore/import,
risk, and administration. Recording loss grants no deletion or hold-release
authority and erases no residual obligation.
`v0.30.29 implementation stop reached. Run pentest for this exact commit.`

## `0.51.5` — Deployment Tenant-Membership Retirement Cut

Status: planned.
Setup: consume the authoritative `0.51.1` tenant lifecycle/topology and
an authorized `DeploymentRetirementMembershipCutRequestV1` binding exact
deployment/domain; produce the membership snapshot required by the `0.30.29`
deployment scope. Reuse the sealed-generation, delivery-barrier, fenced-move,
durable-cursor, and reconciliation laws established for bounded campaigns
rather than treating a projection as membership authority.
Goal: freeze one authenticated, complete deployment tenant-membership cut for a
domain without a cross-tenant transaction or losing tenants created, migrated,
moved, closed, deleted, or discovered around that cut; release its broad
topology fences safely after protection transfers to an admitted campaign's
narrow domain guard or no campaign/handoff can depend on them.
Deliverables: `DeploymentTenantMembershipCutV1` identity/generation/digest,
bounded authenticated member chunks, source high-watermarks and final barrier,
creation/migration/move fence and handoff receipts, monotonic snapshot cursor,
late-member reconciliation, restore ratchet, and visible blocked-member report.
Define `Preparing → Sealed → BoundToCampaign → Finalized`, with distinct
terminal `Expired` and `Released` states and explicit `Blocked`/
`EvidenceUnavailable`; bind immutable expiry/non-reuse, one campaign maximum,
pre-reserved cleanup/finalization capacity, idempotent current-topology-checked
fence release, authenticated narrow-guard transfer receipt or proof of no
admission, handoff reconciliation, crash/restore-safe release cursor, audit,
and outbox evidence.
Verification: omitted/duplicate/substituted tenant, forged or stale digest,
projection-as-authority, cut versus tenant create/migrate/move/close/delete,
lost handoff, late discovery, incomplete barrier, cursor/generation rollback
after restore, cross-deployment/domain reuse, unbounded enumeration, hidden
blocked member, plan denial, cut expiry, failed admission, never-started or
abandoned campaign, evidence unavailable, release replay, stale topology at
release, cleanup-capacity exhaustion, admitted-campaign release without its
current narrow-guard transfer receipt, and release while an unresolved handoff
remains pass.
Exit criteria: the cut accounts for every authoritative tenant membership
through its authenticated high-watermarks, and every around-cut mutation is
either correctly included, explicitly post-cut with a fenced handoff, or a
visible reconciliation blocker. It grants no tenant retirement authority;
broad-fence release occurs exactly once only after protection transfers or all
dependencies close, final cut release waits for campaign dependencies to close,
and an expired/released cut can never become valid after restore.
`v0.51.5 implementation stop reached. Run pentest for this exact commit.`

## `0.51.6` — Deployment Retirement Plan Approval And Campaign Admission

Status: planned.
Setup: consume one current sealed `0.51.5` cut and `0.30.29`
`DomainRetirementProposalV1`; construct an immutable deployment retirement plan
binding exact cut ID/generation/digest, deployment/domain, manifest/contribution
generations, one canonical effective deployment-domain registered-surface
commitment, policy/expiry, budgets, and child-derivation rules, then obtain
current separated destructive approval over those exact bytes.
Goal: bridge membership evidence to retirement authority without letting the
cut or parent campaign mint unrestricted tenant-child permission.
Deliverables: `DeploymentDomainRetirementPlanV1` codec/digest and lineage,
proposal/approval/revocation/expiry records, one-shot plan-consumption guard,
atomic plan+cut adoption and parent-campaign admission with audit/outbox/result,
idempotent response-loss join, initial non-wrapping parent generation/cursor,
cumulative campaign-lineage budget ledger, reserved recovery/finalization
capacity, empty completed/fenced-child receipt commitment, and
`DerivedTenantRetirementAuthorizationV1` binding parent campaign ID/generation,
deployment/domain/tenant, membership
proof, plan/cut digests, child ordinal/idempotency identity, current authority,
and expiry. Admission installs a
`DeploymentDomainStructuralCommitmentV1` fence over the exact effective
manifest, contribution, and registered-surface entries for this deployment/
domain—not a catalog-wide write lock. Global successors are classified:
irrelevant entries may activate elsewhere; compatible non-expanding changes may
activate while this deployment remains pinned; a new surface applicable here is
denied for this deployment until verified permanent takeover; and any weakening
or guard bypass is rejected globally. A node or adapter unable to enforce the
active deployment-domain fence generation is unready.
Verification: cut-only start, plan bound to another cut, cut ID/generation/
digest substitution, approval before final cut reused after change, wrong
manifest/contribution generation, self/stale/expired/revoked approval, response
loss during consumption, two campaigns consuming one plan, cross-deployment/
domain plan replay, child absent from membership proof, child authorization
replayed across campaign/generation, and unrestricted parent-derived authority
pass; so do registered-surface generation omission/substitution, structural
activation for the pinned deployment, false irrelevant/non-expanding
classification, one campaign blocking unrelated catalog/deployment evolution,
and stale-node/adapter guard bypass.
Exit criteria: one approved immutable plan atomically consumes and binds one
sealed cut to exactly one admitted parent campaign or makes no admission;
retries return that durable result. The admitted parent may derive only exact
member authorizations under the approved template, and the cut alone grants no
retirement or child-dispatch authority. Its frozen structural commitment
remains authoritative for only that deployment/domain until `0.51.14`
transfers protection permanently.
`v0.51.6 implementation stop reached. Run pentest for this exact commit.`

## `0.51.7` — Deployment Retirement Plan Succession And Resume Authority

Status: planned.
Setup: consume one admitted `0.51.6` campaign/plan/cut lineage, its durable
cursor, possibly empty completed/already-fenced child receipt commitments,
cumulative budgets, reserved recovery capacity, current revocation/expiry
state, and separated approval rules.
Goal: renew or narrowly amend authority for the same campaign without creating
a second campaign, rebinding the membership cut, replaying completed children,
resetting budgets, or leaving two plan generations able to dispatch.
Deliverables: monotonic non-wrapping `plan_generation`, predecessor-plan digest
and current-head CAS, bounded concurrent proposal set, immutable campaign ID,
cut ID/generation/digest, deployment/domain, membership scope, cursor, completed
child receipts, and recovery reservations. Define an explicit allowed-delta
matrix for authority renewal, expiry extension, and narrowly controlled budget
change; any increase requires distinct separated approval and remains within a
platform-capped cumulative campaign-lineage budget that never resets. Atomically
install one approved successor, fence/tombstone its predecessor and competing
proposals, rotate the derived-child authorization generation, commit audit/
outbox/result, consume that successor proposal once without reopening the
initial plan-consumption guard, and make response-loss retries join the
installed result.
Already-fenced children may use reserved recovery/finalization capacity after
revocation, but may acquire no new destructive scope; only the current plan
generation may authorize new dispatch.
Manifest, contribution, registered-surface, cut, membership, campaign, receipt,
cursor, and guard scope are never allowed deltas. Once `0.51.8` begins guard
installation, successor installation remains fail-closed until `0.51.9` adds
the joint protection-root CAS.
Verification: concurrent/conflicting successors, stale predecessor digest/head
CAS, response loss before or after installation, restore to an older head,
changed campaign/cut/deployment/domain/membership, cursor or completed-receipt
rollback, completed-child replay, predecessor authorization after supersession,
two live dispatch generations, expiry or authority widening disguised as
renewal, unapproved budget increase, budget reset/wrap, recovery-reserve
reallocation, and already-fenced recovery acquiring new scope pass.
Successor activation over any existing guard/journal state without the
`0.51.9` joint CAS also fails.
Exit criteria: the campaign has exactly one current dispatch-authorizing plan
generation and a permanent predecessor tombstone chain; succession preserves
its identity, cut, membership, cursor, receipts, encumbrances, and cumulative
consumption, while retries and restore cannot fork, revive, widen, or recharge
the lineage.
`v0.51.7 implementation stop reached. Run pentest for this exact commit.`

## `0.51.8` — Post-Cut Domain Guard And Topology Handoff

Status: planned.
Setup: consume one admitted `0.51.6` campaign/cut, authoritative `0.51.1`
tenant topology generations, the `0.51.2` tenant-data-surface registry, current
domain manifest/contribution generations, every in-flight around-cut topology
handoff, and the cut's reserved release capacity.
Goal: replace campaign-long deployment-wide topology fencing with a narrower
domain-specific availability guard and authenticated post-cut handoffs, allowing
unrelated tenant creation and movement while the retiring domain cannot gain
new scope.
Deliverables: a monotonic transfer protocol
`BroadTopologyFenced → DomainGuardInstalling → DomainGuardActive →
BroadFenceReleased`, with blocked/evidence-unavailable states, durable transfer
identity/generation/cursor, current-topology CAS, and audit/outbox/result.
Atomically installing the current guard and transfer receipt is the protection
linearization point; broad-fence release is idempotent cleanup and cannot
precede it. There is no unguarded state, and response loss or restore joins the
same transfer. The active guard denies enabling the retiring domain for newly
created or moved-in tenants while unrelated provisioning/movement proceeds.
Define `PostCutDomainAbsenceReceiptV1` binding deployment/tenant, creation-or-move
topology generation, domain manifest/contribution generations, cut/campaign/
issuing-plan generation/digest, frozen registered-surface commitment, proof over
every applicable registered surface that no domain data, commands, projections,
jobs, attachments, or effects became available, the current policy decision,
and durable audit evidence. Each
post-cut or moved-in tenant receives exactly one authenticated absence receipt
or exact tenant-retirement child handoff. A bounded post-cut handoff journal,
high-watermark, fold cursor, final barrier, and guard-to-permanent-domain-
retirement handoff make completion finite even under continuous tenant creation.
Verification: informal projection used as absence authority, omitted or forged
surface proof, tenant/deployment/topology/manifest/contribution/cut/campaign/
plan substitution, domain enabled before receipt, moved-in tenant with neither
receipt nor child handoff, duplicate/conflicting disposition, transfer response
loss, stale topology CAS, concurrent create/move/close/delete, blocked campaign
holding the broad fence, release before guard activation or in-flight handoff
disposition, restore between guard installation and broad release, guard
rollback/removal, cursor/high-watermark rollback, and never-ending admission
after the final barrier pass.
Exit criteria: every in-flight topology mutation has one authenticated
disposition, the narrow guard is durably current before the broad fence releases
once, unrelated topology work continues during a blocked/paused campaign, and
each post-cut tenant is covered by an exact child handoff or authoritative
absence receipt until permanent domain retirement takes over.
`v0.51.8 implementation stop reached. Run pentest for this exact commit.`

## `0.51.9` — Campaign Protection Root And Successor Integration

Status: planned.
Setup: consume the `0.51.7` plan head/ancestor/tombstone protocol and `0.51.8`
domain guard, transfer receipt, post-cut journal, absence/child-handoff receipt
accumulator, high-watermarks, fold cursor, final barrier, topology blockers, and
frozen structural commitment.
Goal: permit safe successor installation after guard activation without
rolling back protection state, invalidating historical coverage receipts, or
racing an append/handoff.
Deliverables: canonical `CampaignProtectionStateRootV1` binding campaign/cut,
active guard identity/generation/state, transfer receipt, post-cut journal head,
receipt-accumulator root/count, high-watermarks/fold cursor/final barrier,
topology blockers, permanent-handoff state, and exact frozen manifest/
contribution/registered-surface generations. Every successor installation CASes
both the current plan head and protection root, atomically installs the new plan
head and successor protection root, and permanently fences the predecessor.
Absence and child-handoff receipts bind their issuing plan generation; they
remain valid without reissue only when that generation is an authenticated
ancestor of the current plan and the immutable campaign/cut/tenant/topology/
structural scope matches. Receipt appends and successor installation serialize
through the same root, with durable audit/outbox/result and response-loss join.
Verification: succession racing absence receipt or child-handoff append, stale
plan or protection root, old-plan receipt after valid succession, forged/
nonancestor issuing plan, receipt/barrier/high-watermark/fold-cursor rollback,
omitted blocker/active guard/transfer receipt, frozen-generation substitution,
dual current roots, response loss, and restore of predecessor/root pass.
Exit criteria: there is one authenticated plan/protection-root pair; no
successor can omit or rewind guard, journal, receipt, barrier, topology, blocker,
or structural state, while correctly scoped ancestor-issued coverage evidence
remains valid and immutable.
`v0.51.9 implementation stop reached. Run pentest for this exact commit.`

## `0.51.10` — Deployment-Wide Domain Retirement Reconciliation

Status: planned.
Setup: consume one admitted `0.51.6` parent/plan/cut, `0.51.7` plan-succession
and resume authority, `0.51.8` narrow guard/post-cut handoff protocol, the
`0.51.9` current plan/protection-root pair, the derived-child authorization
template, `0.30.29` exact tenant-child authority/recovery, `0.30.28` evidence
dimensions and terminals, tenant-specific legal-hold/disposition policy, and
durable quota/fairness/recovery-capacity contracts.
Goal: retire one domain across a deployment through isolated tenant children
without wildcard authority, shared mutable child state, or a cross-tenant
transaction.
Deliverables: durable parent campaign with monotonic generation/cursor, bounded
batch/concurrency/storage/work budgets, protected recovery lane and fairness,
one idempotent child identity/result receipt per member, tenant-specific hold/
disposition decision, late-member reconciliation, terminal result manifest,
blocked-member report, and restore/restart protocol. Consume the
`Planned → Admitted` admission edge from `0.51.6`, then define
`Admitted → GuardReady → Dispatching → Reconciling →
ReadyForPermanentGuardClean | PendingResidualObligationHandoff |
BlockedNonterminal`, with `Paused` before terminal aggregation.
True cancellation exists only before the first child fence. Thereafter cancel
pauses/blocks, completed children never roll back, revocation stops new
dispatch, resume requires current parent authority or the installed current
`0.51.7` successor, and paused state retains cut, guard, budgets, receipts, and
blockers.
Verification: tenant omitted from membership, tenant created/moved across the
cut, tenant close/delete without explicit result, post-cut tenant lacking an
exact child or authoritative absence receipt, guard bypass, child request/
result or derived authorization substituted across tenants, child outside
membership, authorization replay across campaign/plan generation, superseded/
revoked/expired parent dispatch, duplicate or replayed completed child,
cross-tenant transaction/shared state, cancellation after first child fence,
implicit rollback of a completed child, pause losing cut/guard/budget/receipt/
blocker state, unauthorized resume, abandoned nonterminal child releasing the
guard or final cut fences, completion with missing/blocked/unresolved child or
unfolded post-cut handoff, cursor/generation rollback, crash/reorder/retry,
one-large-tenant starvation, recovery-capacity borrowing, fabricated
`RetiredVerified` for a never-present tenant, unbounded retention, and
loss-as-clean pass.
Deliver `CampaignRetirementTerminalManifestV1` only after every snapshot and
post-cut disposition is terminal, every journal entry is folded through the
final topology high-watermark, and the current protection root/effective
structural commitment are bound. Classify it `Clean` only when every cut member
is `RetiredVerified`, every post-cut tenant is `RetiredVerified` or
`NeverPresentVerified(PostCutDomainAbsenceReceiptV1)`, and no non-clean
disposition exists. `NeverPresentVerified` is coverage evidence, never a new
`0.30.28` terminal. A manifest containing `RetiredWithIrrecoverableLoss`,
terminal `RetirementBlocked`, or `EvidenceUnavailable` is truthfully
`NonClean` and enters `PendingResidualObligationHandoff`; actually nonterminal,
unowned, quarantined, or still-reconciling work enters `BlockedNonterminal`.
New child dispatch always requires current derived authorization; pause,
revocation, and succession never rewrite terminal evidence.
Exit criteria: one immutable complete terminal manifest reaches
`ReadyForPermanentGuardClean` or `PendingResidualObligationHandoff`; anything
nonterminal or without an owner remains visibly blocked. Neither branch claims
final completion before its later permanent-guard path.
`v0.51.10 implementation stop reached. Run pentest for this exact commit.`

## `0.51.11` — Non-Clean Residual Retirement Obligation Handoff

Status: planned.
Setup: consume a `0.51.10` `NonClean`
`CampaignRetirementTerminalManifestV1`, exact tenant/domain surface ownership,
custody/hold/history/evidence/residual-work state, required tenant retirement
fences, and pre-reserved obligation-transfer/finalization capacity.
Goal: give every permanent non-clean consequence a durable successor owner so
campaign infrastructure can later close without erasing loss, custody, holds,
history obligations, evidence uncertainty, residual work, or required tenant
fences.
Deliverables: one idempotent `ResidualRetirementObligationV1` per exact tenant/
dimension/owner binding deployment/domain/campaign/cut, terminal child or
coverage receipt, terminal classification, data custody, legal hold,
codec/upcaster/history compatibility, evidence state, residual work, current
responsible owner, retained tenant fence, budgets, generation, and audit
lineage. Define a durable parent process manager
`HandoffPreparing → HandoffDispatching → HandoffReconciling →
HandoffComplete`, never one cross-tenant transaction. Preparation commits an
immutable `ResidualRetirementObligationManifestV1` root/count, deterministic
tenant-local obligation/handoff identities, bounded cursor/batch/concurrency/
work/storage budgets, protected recovery capacity, fairness, and parent
audit/outbox. Each tenant partition atomically commits its obligation,
owner-acceptance decision, retained fence, local receipt and outbox; the parent
deduplicates inbox delivery and folds authenticated receipts into a monotonic
accumulator. A final parent CAS enters `ReadyForPermanentGuardNonClean` only
when every expected receipt is present and verified. Response-loss retries join
existing local/parent results; partial handoff releases no campaign resource.
This protocol never changes a terminal result, relabels loss as clean, releases
required tenant-specific fences, or converts unknown custody/evidence into
proof.
Verification: omitted/duplicate obligation, tenant/dimension/result/owner/fence/
hold/custody/history/evidence/budget substitution, owner rejection or expiry,
partial owner acceptance, tenant database/region outage, response loss,
duplicate/reordered delivery, cross-tenant receipt substitution, parent inbox
replay, restore during receipt folding, cursor/root/count rollback, one tenant
starving the remainder, shared mutable cross-tenant obligation, premature
campaign resource release, false clean classification, loss-to-verified
relabeling, and actual nonterminal/unowned work entering ready state pass.
Exit criteria: every non-clean terminal dimension is immutably represented and
has exactly one tenant-local owner-acceptance receipt under the complete parent
manifest/accumulator before the final ready CAS; required tenant fences and
residual obligations remain until their own independently verified terminals.
`v0.51.11 implementation stop reached. Run pentest for this exact commit.`

## `0.51.12` — Residual Retirement Obligation Lineage Evolution

Status: planned.
Setup: consume one complete `0.51.11`
`ResidualRetirementObligationManifestV1`, its tenant-local acceptance receipts,
current obligation owners/fences, and the authorization/recovery policies for
evidence, hold, custody, history, and residual-work transitions.
Goal: let legitimate residual evidence and work evolve without changing the
original obligation universe, invalidating final campaign eligibility, or
allowing reinstall to accept an unrelated/rolled-back residual root.
Deliverables: immutable `ResidualRetirementMembershipRootV1` binding lineage
identity, complete obligation identities, tenant/dimension ownership, original
terminal classifications and manifest count; plus predecessor-linked
`ResidualRetirementStateHeadV1` binding each member's current tenant-local
generation/state/owner/fence and an authenticated transition-receipt
accumulator. Authorized evidence arrival, hold changes, custody disposition,
history-compatibility updates, owner handoff, fence changes, and residual-work
progress/terminalization commit tenant-locally with stable transition identity,
expected local generation, audit/outbox/result, and response-loss join. A
bounded parent process manager deduplicates/folds those receipts and advances
one non-wrapping state head by predecessor CAS; membership and original
classification never mutate. Restore/import preserve the lineage and every
head/tombstone. A newly discovered obligation outside membership invalidates
reinstall readiness and requires separately certified corrective ownership; it
cannot be appended silently.
Verification: membership/root/count/classification mutation, obligation
addition/removal/reuse, stale/forked predecessor, tenant/state/owner/fence/
evidence/hold/custody/history/work substitution, unauthorized transition,
cross-tenant receipt replay, duplicate/reordered delivery, response loss,
partial tenant outage, parent fold starvation, state-head rollback/wrap,
restore/import fork, stale index, and missing obligation treated as eligible
pass.
Exit criteria: one immutable membership root and one authenticated current
predecessor-linked state head describe the residual lineage; legitimate
evolution preserves eligibility identity while every fork, rollback, membership
change, or unowned discovery fails closed.
`v0.51.12 implementation stop reached. Run pentest for this exact commit.`

## `0.51.13` — Permanent Guard Takeover Authorization

Status: planned.
Setup: consume a current `0.51.9` plan/protection-root pair, a `0.51.10`
terminal manifest in `ReadyForPermanentGuardClean` or a `0.51.11`
residual manifest plus `0.51.12` membership/current-state pair in
`ReadyForPermanentGuardNonClean`, the target
`DeploymentDomainGuardSlotVersionV1`, proposed permanent-guard bytes, campaign
final topology high-watermark, broader registry evidence, expected campaign
state/version, authority-key generation, and separated destructive approval
policy.
Goal: authorize the exact final safety transition with bytes that did not exist
at initial plan admission, without letting an expired, revoked, or predecessor
plan implicitly install permanent topology state.
Deliverables: one-shot `PermanentDomainGuardTakeoverAuthorizationV1` binding
deployment/domain/campaign/cut, current plan generation and protection root,
terminal-manifest digest/classification, residual-obligation root (including
canonical empty root), residual membership root/current state head, target
guard-slot version, final topology high-watermark, permanent-guard digest,
broader registry evidence, expected state/version, issuer/key generation,
approver quorum/separation, expiry, and idempotency identity. Define issue,
revoke, expire,
rotate/distrust, consume, result, audit, and response-loss semantics; only
`0.51.14` may consume it atomically with guard installation. Plan authority
revocation or expiry before takeover requires this fresh independent approval;
authorization by a predecessor plan generation is invalid. Unrelated tenant
creation/movement or broader registry generation advance does not invalidate
authorization; only mutations capable of enabling this domain in this
deployment serialize through the target guard slot. Broader generations remain
evidence, never the expected-version CAS target.
Verification: approval/manifest/root/registry/guard/state/classification/
residual-root/idempotency substitution, self-approval, stale predecessor plan,
issue before terminal readiness, plan revocation/expiry before or after
readiness, takeover authorization revocation/expiry, authority-key rotation/
distrust, guard-slot substitution, unrelated continuous tenant churn,
enable-capable target mutation, response loss, restore rollback, duplicate
consumption, and replay across deployment/domain/campaign pass.
Exit criteria: exactly one current separated authorization covers every byte
and expected state consumed by permanent takeover, or the campaign remains
guarded and visibly blocked; no admission-time or stale plan authority fills
the gap.
`v0.51.13 implementation stop reached. Run pentest for this exact commit.`

## `0.51.14` — Permanent Guard Takeover And Campaign Completion

Status: planned.
Setup: consume the current `0.51.9` plan/protection-root pair, `0.51.8` active
campaign guard/final barrier, a clean `0.51.10` terminal manifest or non-clean
`0.51.11`/`0.51.12` residual membership/current-state pair, one current
`0.51.13` exact takeover authorization, the target
`DeploymentDomainGuardSlotVersionV1`, campaign final topology high-watermark,
broader registry evidence, the effective deployment-domain structural
commitment, reinstall/rollback floor, historical compatibility set, and
non-borrowable terminalization/cleanup reserves.
Goal: make clean or truthfully non-clean campaign completion finite by
transferring future provisioning denial to permanent authoritative state,
retaining residual owners/fences, and then releasing campaign-only resources.
Deliverables:
`ReadyForPermanentGuardClean | ReadyForPermanentGuardNonClean →
PermanentGuardInstalling → PermanentGuardActive →
{ CampaignGuardReleased +
(CampaignCompletedClean | CampaignCompletedNonClean) }`,
where the braced guard-release acknowledgement and parent terminal transition
are one local atomic edge. Guard installation
atomically consumes the exact `0.51.13` authorization; binds deployment/domain/
campaign/cut, final topology high-watermark, effective structural commitment,
terminal manifest, residual membership/current-state evidence, current
protection root and target guard-slot version; installs the durable
`(DeploymentId, DomainId)` denial/tombstone; advances only that local slot; and
commits `PermanentDomainGuardTransferReceiptV1`. Unrelated topology/registry
churn after the final high-watermark cannot starve it; only target mutations
capable of enabling the domain serialize on the slot.
Split execution capacity from a non-borrowable terminalization reserve and a
separate pre-reserved cleanup lane. Execution capacity may release after the
permanent receipt; terminalization capacity remains encumbered through one
local atomic transaction committing final
`DeploymentDomainRetirementManifestV1`, `CampaignCompletedClean | NonClean`,
`ReinstallEligibilityV1`, result/audit/outbox, campaign-guard release
acknowledgement, and mandatory cleanup schedule/checkpoint. Only after that
transaction is durable may terminalization capacity release. Cross-owner/
remote physical cleanup continues from an orthogonal durable `CleanupPending`
state under the cleanup lane; crash, retry, or quota pressure cannot strand it.
Cut/structural pin/campaign-only resources release through that checkpointed
cleanup, while residual obligation resources and tenant-specific fences remain
with successor owners. Final `DeploymentDomainRetirementManifestV1` preserves `Clean` or `NonClean`
classification exactly and binds terminal/residual/transfer evidence; later
cleanup progress cannot relabel it.
Eligibility binds `CampaignCompleted*`, final manifest, permanent-guard
generation/receipt, immutable residual membership root/lineage identity
(canonical empty for clean), completion-time residual state head as evidence,
reinstall/rollback floor, historical compatibility set, and immutable cleanup
lineage identity/completion-time checkpoint; it is structural eligibility only,
never reinstall authority.
Verification: clean/non-clean substitution, takeover authority revocation/
expiry/response loss before versus after atomic consumption, install versus
target create/move/enable, continuous unrelated tenant/topology/registry churn,
guard or cut early release, execution/terminalization/cleanup reserve confusion,
borrowed or prematurely released terminalization capacity, crash/quota
exhaustion between permanent receipt and terminal transaction, missing cleanup
schedule/checkpoint, cleanup starvation, campaign resource leak, residual
owner/fence release, completion without transfer receipt, stale node/adapter,
restore/import guard loss, false clean claim, structural-pin release before
permanent guard, missing/early eligibility token, and final transaction
response loss pass.
Exit criteria: one permanent guard and classified final manifest are durable
with parent terminal state, eligibility, result/audit/outbox, guard-release
acknowledgement and cleanup checkpoint before terminalization reserve releases;
non-clean obligations/fences survive, remote cleanup cannot be starved, no
protection gap exists, and eligibility appears only in that atomic completion.
`v0.51.14 implementation stop reached. Run pentest for this exact commit.`

## `0.51.15` — Reinstall Eligibility And Guard Supersession Admission

Status: planned.
Setup: consume one current `0.51.14` `ReinstallEligibilityV1`, final deployment
retirement manifest, permanent-guard generation/transfer receipt,
`0.51.12` immutable residual membership root/lineage and authenticated current
state head, reinstall/rollback floor, historical compatibility set, cleanup
lineage with current `CampaignCleanupComplete` receipt/checkpoint, and a
separately approved reinstall proposal from the `0.30.28` lifecycle.
Goal: prevent reinstall from removing permanent protection before final campaign
commitment or bypassing retained non-clean obligations, history, or rollback
floors.
Deliverables: one-shot reinstall-admission guard and CAS over exact
`CampaignCompletedClean | CampaignCompletedNonClean`, final manifest digest,
permanent-guard generation/receipt, immutable residual membership root/lineage,
authenticated current `ResidualRetirementStateHeadV1`, cleanup lineage/current
complete receipt/checkpoint, reinstall floor, history set, proposal/approval/
expiry, target generation, and idempotency identity. Eligibility remains
structurally valid across legitimate predecessor-linked residual evolution
because it binds membership/lineage, not a permanently frozen state head.
Admission locks and CASes the current head,
re-evaluates every current obligation/fence/custody/hold/history/evidence/work
state against the reinstall plan, and proves its authenticated ancestry from
the completion-time head. It also proves cleanup completion descends from the
eligibility-bound cleanup lineage/checkpoint, so delayed cleanup cannot delete
reinstalled state. It atomically consumes eligibility and approval,
supersedes the permanent guard only through the reinstall state machine,
preserves/transfers every compatible residual obligation and tenant fence or
remains blocked, and commits audit/outbox/result with response-loss join.
Ordinary feature enablement or administration cannot mint eligibility or
supersede the guard.
Verification: reinstall racing permanent installation, campaign-guard release,
final completion or eligibility creation; stale/replayed eligibility; final
manifest, guard, receipt, membership root/lineage/current state head, cleanup
lineage/complete receipt/checkpoint, floor, history, proposal, authority or
target substitution; cleanup-pending reinstall or forged cleanup ancestry;
legitimate state evolution, stale/forked/rolled-back head, unauthenticated
different root, membership mutation, incomplete current-state re-evaluation,
non-clean obligation erasure, fence loss, response loss, restore rollback,
duplicate admission, and ordinary re-enable pass.
Exit criteria: reinstall begins exactly once only from a final campaign state
and exact current guard/residual-lineage/head/cleanup/history/floor tuple under
separate current authority after every current obligation is re-evaluated, or
the permanent denial and all obligations remain unchanged.
`v0.51.15 implementation stop reached. Run pentest for this exact commit.`

## `0.145.4` — Domain Retirement And Historical Compatibility Certification

Status: planned.
Setup: consume `0.30.28` retirement contracts, `0.30.29` authority/recovery
protocol and evidence, the applicable `0.51.5–0.51.15` deployment cut lifecycle,
approved exact-plan admission/succession, narrow-guard/topology handoff,
protection-root integration, clean/non-clean terminal aggregation, residual-
obligation lineage evolution, exact slot-scoped takeover authority,
terminalization/cleanup reserves, and final-state reinstall admission, current
domain/contribution generations, `0.145.3`
lifecycle/recovery evidence,
installed-extension state, cross-domain dependencies, outstanding durable work,
retained event/snapshot/export/backup/import history, deferrals, and product state.
Goal: destructively certify selected-profile domain/module/plugin retirement
and reinstall while preserving every retained historical obligation.
Deliverables: retirement/drain exercise corpus, dependency-closure and
outstanding-work report, proposal/approval/plan and command/effect-fence
evidence, exact plan/cut consumption, successor lineage and derived-child
authorization evidence, broad-to-narrow fence-transfer receipt, authoritative
post-cut absence/child-handoff journal, joint plan/protection-root lineage,
terminal classification, residual-obligation ownership root, exact takeover
authorization, immutable residual membership/current state lineage,
tenant-local handoff receipts, permanent-guard slot/transfer receipt, classified
final manifest, terminalization/cleanup reserve/checkpoint, reinstall
eligibility/admission evidence, cut-release cursor and dependency proof,
campaign pause/revocation/resume, fairness and terminal-manifest evidence,
data-disposition/legal-hold proof, codec/upcaster retention set, historical
read/restore/import matrix, reinstall/rollback-floor matrix, and certification report.
Verification: stale or unauthorized retirement plan, crash-resume divergence,
command reopening, forced data-loss acceptance, false authority/data evidence,
cut-only start, plan/cut ID/generation/digest mismatch, pre-final-cut approval,
one-shot plan double consumption, concurrent/forked successor, predecessor
dispatch, successor identity/cut/membership/cursor/receipt substitution, budget
reset, parent/child cross-campaign replay, revoked/expired dispatch, broad-fence
release before narrow-guard transfer, cut release with live dependency,
expired-cut restore, tenant omitted from membership, create/move/close/delete
across cut, forged/omitted post-cut absence or child handoff, stale joint
protection root, ancestor-receipt invalidation, receipt/barrier/blocker rollback,
guard rollback, permanent-guard early release or reinstall bypass, manifest/
surface drift, stale-node enforcement bypass, fabricated retirement for absent
tenant, cross-tenant child-result substitution, invalid cancel/pause/resume,
non-clean terminal infrastructure deadlock, omitted/rescoped residual obligation,
cross-tenant obligation transaction, tenant handoff outage/replay/starvation,
unowned custody/hold/history/evidence/work, residual membership mutation or
state-head fork/rollback, stale/forged takeover authorization, unrelated
topology churn starvation, takeover after authority/key revocation,
terminalization-reserve early release, missing cleanup checkpoint, cleanup-
pending reinstall, completion with blocked/unresolved child or unfolded
handoff, campaign cursor rollback,
large-tenant fairness starvation, loss terminal presented as clean, late work,
dangling reference, early/stale reinstall eligibility, reinstall race or
residual/floor/history bypass, codec loss, premature deletion,
hold/export/erasure bypass, restore/import
failure, uninstall loss, ID reuse, unsafe downgrade, unresolved defer, false
support, and late implementation pass.
Exit criteria: every selected retirement either completes with closed authority,
drained/disposed work, truthful per-dimension and per-tenant evidence, permanent
ID tombstone, readable retained history, and safe reinstall floor, or retains
its exact non-clean/blocking result; the certifier adds no missing retirement,
campaign, authority, recovery, codec, lifecycle, or reconciliation behavior.
`v0.145.4 implementation stop reached. Run pentest for this exact commit.`
