# Roadmap Authority And Recovery Completions

Document status: normative implementation handoffs

This focused stop owns authority-bearing execution and recovery that is
deliberately separate from the declarative domain-retirement contract. It does
not weaken the lifecycle, drainage, history, disposition, or certification
obligations owned elsewhere.

## `0.30.29` — Domain Retirement Authority And Crash Recovery

Status: planned.
Setup: consume the `0.30.28` lifecycle and prospective contract; define typed
`DomainRetirementProposalV1` with an immutable plan digest, exact domain/
deployment/tenant scope, expected manifest and contribution generations,
expected retirement-state version, idempotency identity, current authorization,
separated proposer/approver/destructive approver identities, and approval expiry.
Goal: execute and recover retirement transitions without stale authority,
partial commitment, silent command reopening, or data-loss acceptance becoming
completion authority.
Deliverables: proposal/approval/plan codecs, expected-version admission,
authority and separation-of-duties checks, atomic state/audit/outbox commitment,
pre-fence cancellation, authorized quiescing abort/recovery, bounded resume
protocol, and typed `Blocked`/`EvidenceUnavailable` evidence.
Verification: domain/deployment/tenant, plan digest, manifest/contribution
generation, expected version, idempotency, principal, quorum, approval, or
expiry substitution; self-approval; duplicate/concurrent execution; crash and
response loss at every transition and audit/outbox boundary; cancellation after
fencing; unauthorized abort; resume that reopens fenced commands; stale work or
quarantine ignored; forced completion by accepting data loss; false authority-
loss/data-loss evidence; and restore of an earlier state pass.
Exit criteria: every retry joins the same immutable plan and resumes only from
its durable fenced state; cancellation is possible only before fencing, later
recovery requires current separated authority, and completion reaches `Retired`
only with truthful authority-loss and data-disposition evidence, including
explicit data-loss evidence where preservation proved impossible. Otherwise
the domain remains visibly `Blocked` or `EvidenceUnavailable`, with commands
still fenced and no fabricated success.
`v0.30.29 implementation stop reached. Run pentest for this exact commit.`

## `0.145.4` — Domain Retirement And Historical Compatibility Certification

Status: planned.
Setup: consume `0.30.28` retirement contracts, `0.30.29` authority/recovery
protocol and evidence, current domain/contribution generations, `0.145.3`
lifecycle/recovery evidence, installed-extension state, cross-domain
dependencies, outstanding durable work, retained event/snapshot/export/backup/
import history, deferrals, and product state.
Goal: destructively certify selected-profile domain/module/plugin retirement
and reinstall while preserving every retained historical obligation.
Deliverables: retirement/drain exercise corpus, dependency-closure and
outstanding-work report, proposal/approval/plan and command/effect-fence
evidence, data-disposition/legal-hold proof, codec/upcaster retention set,
historical read/restore/import matrix, reinstall/rollback-floor matrix, and
certification report.
Verification: stale or unauthorized retirement plan, crash-resume divergence,
command reopening, forced data-loss acceptance, false authority/data evidence,
late command/effect, undrained consumer/timer/activity/quarantine, dangling
cross-domain/external reference, retained event without decoder/upcaster,
premature data deletion, hold/export/erasure bypass, backup/restore/import
failure, plugin-uninstall data loss, `DomainId` reuse, unsafe reinstall/
downgrade, unresolved defer, false support, and late implementation pass.
Exit criteria: every selected retirement either completes with closed authority,
drained/disposed work, truthful data evidence, permanent ID tombstone, readable
retained history, and safe reinstall floor, or remains visibly blocked; the
certifier adds no missing retirement, authority, recovery, codec, lifecycle, or
reconciliation behavior.
`v0.145.4 implementation stop reached. Run pentest for this exact commit.`
