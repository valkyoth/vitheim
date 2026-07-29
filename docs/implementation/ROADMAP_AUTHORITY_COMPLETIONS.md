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
tenant child; deployment scope requires `0.51.5–0.51.11`.
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
generations, registered-surface registry generation/digest, policy/expiry,
budgets, and child-derivation rules, then obtain current separated destructive
approval over those exact bytes.
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
and expiry. Admission installs a frozen structural-commitment fence: applicable
domain manifest, contribution, and registered-surface generations cannot
advance until verified permanent-guard takeover. A proposal that changes that
commitment is rejected/deferred, and a node or adapter unable to enforce the
active fence generation is unready.
Verification: cut-only start, plan bound to another cut, cut ID/generation/
digest substitution, approval before final cut reused after change, wrong
manifest/contribution generation, self/stale/expired/revoked approval, response
loss during consumption, two campaigns consuming one plan, cross-deployment/
domain plan replay, child absent from membership proof, child authorization
replayed across campaign/generation, and unrestricted parent-derived authority
pass; so do registered-surface generation omission/substitution, structural
activation during the freeze, and stale-node/adapter guard bypass.
Exit criteria: one approved immutable plan atomically consumes and binds one
sealed cut to exactly one admitted parent campaign or makes no admission;
retries return that durable result. The admitted parent may derive only exact
member authorizations under the approved template, and the cut alone grants no
retirement or child-dispatch authority. Its frozen structural commitment
remains authoritative until `0.51.11` transfers protection permanently.
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
ReadyForPermanentGuard`, with `Paused` and `Blocked`.
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
Deliver `CampaignRetirementCoverageManifestV1` only when every snapshot member
has exactly one tenant-isolated terminal
child receipt whose result is `RetiredVerified`; every post-cut tenant has
either an exact child whose result is `RetiredVerified` or
`NeverPresentVerified(PostCutDomainAbsenceReceiptV1)` coverage evidence; every
journal entry is folded through the final topology high-watermark; the current
protection root and frozen structural commitment are bound; and no blocker,
loss, unresolved, quarantined, or evidence-unavailable disposition exists.
`NeverPresentVerified` is campaign coverage evidence, never a new `0.30.28`
data-retirement terminal. Non-clean outcomes remain explicit per tenant and in
the parent aggregate. New child dispatch always requires a current derived
authorization from the active plan generation; pause/revocation/succession
never rewrites completed evidence.
Exit criteria: one immutable mixed verified-retirement/never-present coverage
manifest reaches `ReadyForPermanentGuard`, or the parent remains visibly
non-clean/blocked. This stop never claims final clean completion before
`0.51.11` transfers permanent protection.
`v0.51.10 implementation stop reached. Run pentest for this exact commit.`

## `0.51.11` — Permanent Domain Guard Takeover And Campaign Completion

Status: planned.
Setup: consume the current `0.51.9` plan/protection-root pair, `0.51.8` active
campaign guard and final folded post-cut barrier, `0.51.10`
`CampaignRetirementCoverageManifestV1` in `ReadyForPermanentGuard`, current
topology/domain registry generations, frozen structural commitment, and the
separately authorized reinstall lifecycle.
Goal: make clean campaign completion finite under continuous tenant creation by
atomically transferring future provisioning denial from the campaign guard to
permanent authoritative deployment-domain state.
Deliverables: monotonic
`DomainGuardActive → PermanentGuardInstalling → PermanentGuardActive →
CampaignGuardReleased → CampaignCompleted` protocol. The installation
linearization atomically binds deployment/domain/campaign/cut, final topology
high-watermark, frozen manifest/contribution/surface generations, exact
coverage manifest and current protection root; installs a durable
`(DeploymentId, DomainId)` provisioning denial/tombstone in the authoritative
topology/domain registry; and records responsibility through the final
high-watermark to the campaign and every later mutation to the permanent guard.
A durable `PermanentDomainGuardTransferReceiptV1` precedes campaign-guard
release. Final `DeploymentDomainRetirementManifestV1` atomically binds the
coverage manifest and transfer receipt before the parent becomes `Completed`,
with current-generation CAS, stale-node readiness fencing, audit/outbox/result,
response-loss join, and restore/import/movement enforcement. Only the separately
authorized reinstall lifecycle may supersede the permanent denial; ordinary
feature enablement, manifest activation, successor planning, or administration
cannot.
Verification: final-high-watermark/campaign/cut/domain/deployment/manifest/
surface/coverage-manifest/protection-root substitution, install versus tenant
create/move/enable, response loss, restore between install/release/completion,
campaign-guard early release, completion without or before the transfer receipt,
missing/forged receipt, stale node or adapter, import/restore guard loss,
ordinary re-enable, successor-plan bypass, structural activation during
takeover, clean completion over any blocker/loss/unresolved/quarantined/
evidence-unavailable disposition, and reinstall without distinct current
authority pass.
Exit criteria: exactly one permanent guard is authoritative before the campaign
guard releases once and the parent completes; final clean status requires the
exact verified coverage manifest plus permanent transfer receipt, responsibility
has no temporal gap or overlap ambiguity, later topology mutations remain denied
across restore/import/stale nodes, and only the separately certified reinstall
lifecycle can replace the tombstone.
`v0.51.11 implementation stop reached. Run pentest for this exact commit.`

## `0.145.4` — Domain Retirement And Historical Compatibility Certification

Status: planned.
Setup: consume `0.30.28` retirement contracts, `0.30.29` authority/recovery
protocol and evidence, the applicable `0.51.5–0.51.11` deployment cut lifecycle,
approved exact-plan admission/succession, narrow-guard/topology handoff,
protection-root integration, permanent-guard takeover, and campaign execution,
current domain/contribution generations, `0.145.3`
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
permanent-guard transfer receipt, cut-release cursor and dependency proof,
campaign pause/revocation/resume, mixed clean-coverage predicate, fairness and
terminal-manifest evidence,
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
completion with blocked/unresolved child or unfolded handoff, campaign cursor rollback,
large-tenant fairness starvation, loss terminal presented as clean, late work,
dangling reference, codec loss, premature deletion, hold/export/erasure bypass,
restore/import
failure, uninstall loss, ID reuse, unsafe downgrade, unresolved defer, false
support, and late implementation pass.
Exit criteria: every selected retirement either completes with closed authority,
drained/disposed work, truthful per-dimension and per-tenant evidence, permanent
ID tombstone, readable retained history, and safe reinstall floor, or retains
its exact non-clean/blocking result; the certifier adds no missing retirement,
campaign, authority, recovery, codec, lifecycle, or reconciliation behavior.
`v0.145.4 implementation stop reached. Run pentest for this exact commit.`
