# Foundation And Storage Scope Splits

Scope: focused companion stops for overloaded Phase B and Phase C families.
Each stop inherits its parent family ledger but implements only its named slice.

## `0.18.6` — Quota Claim And Reservation Admission
Status: planned.
Setup: freeze quota kinds, claim-set bounds, epochs, reservation identity, and admission lock order.
Goal: reserve every applicable capacity kind atomically before protected work.
Deliverables: bounded `QuotaClaimSet`, durable claim ledger, atomic reserve/deny results, and idempotent joins.
Verification: omit, duplicate, overflow, race, retry, and cross-tenant every claim and reservation component.
Exit criteria: admission creates one complete reservation set or no mutation. `v0.18.6 implementation stop reached. Run pentest for this exact commit.`

## `0.18.7` — Quota Settlement, Reconciliation, And Recovery
Status: planned.
Setup: start from passing `0.18.6`; freeze terminal outcomes, refund/write-off evidence, and recovery reserve.
Goal: conserve admitted quota through completion, ambiguity, crash, and restore.
Deliverables: settlement ledger, evidence-bound credit rules, unknown-outcome retention, reconciliation, and recovery testkit.
Verification: response loss, duplicate settlement, partial credit, underflow, stale epoch, failover, restore, and starvation cases pass.
Exit criteria: every reservation has exactly one conservative terminal disposition. `v0.18.7 implementation stop reached. Run pentest for this exact commit.`

## `0.18.8` — Atomic Command And Consumer Bundle Realizations
Status: planned.
Setup: freeze the discriminated bundle schema and the already proven command/consumer semantic ports.
Goal: make command and inbox-consumer commits indivisible without broadening transaction scope.
Deliverables: command and consumer variants, canonical codecs, one-stream/local-effect limits, and adapter contract fixtures.
Verification: independently destroy receipt, audit, event, inbox, result, quota, and outbox components and prove all-or-none behavior.
Exit criteria: both variants negotiate atomic support or return unsupported. `v0.18.8 implementation stop reached. Run pentest for this exact commit.`

## `0.18.9` — Atomic Timer And Activity Bundle Realizations
Status: planned.
Setup: start from `0.18.8`; bind lease/fence, timer/activity identity, scheduled time, attempt, and result.
Goal: prevent lease loss or retry from splitting timer/activity state from emitted local work.
Deliverables: timer-fire and activity-result variants, canonical outcomes, retry joins, and fence-aware commit contracts.
Verification: expiration, takeover, duplicate delivery, crash at every component, clock fact substitution, and response loss pass.
Exit criteria: one winner commits the timer/activity transition and local effects. `v0.18.9 implementation stop reached. Run pentest for this exact commit.`

## `0.18.10` — Poison Work And Atomic-Bundle Adapter Certification
Status: planned.
Setup: freeze poison/dead-letter semantics and the complete bundle capability matrix from `0.18.8–0.18.9`.
Goal: close the final bundle variant and certify destructive failure behavior.
Deliverables: poison-work variant, quarantine/result model, shared destructive adapter corpus, and explicit refusal records.
Verification: omit each discriminant/component, inject partial commits and corrupt retries, and compare every admitted adapter.
Exit criteria: no adapter can claim a partial bundle or skip a destructive case. `v0.18.10 implementation stop reached. Run pentest for this exact commit.`

## `0.18.11` — Invariant Ownership And Lifecycle Registry
Status: planned.
Setup: start from stable declaration IDs/parser in `0.18.3`; freeze owner, transaction, enforcement, lifecycle, and supersession fields.
Goal: prove every declared invariant has exactly one current owner and an acyclic history.
Deliverables: ownership/lifecycle schemas, generated coverage index, duplicate/gap detector, and negative fixtures.
Verification: remove, duplicate, fork, reorder, or asymmetrically supersede every field and declaration.
Exit criteria: ownership and lifecycle coverage are bidirectional and complete. `v0.18.11 implementation stop reached. Run pentest for this exact commit.`

## `0.18.12` — Composite Law Generations And Admission Manifests
Status: planned.
Setup: start from `0.18.11`; freeze generation ancestry, dependency timing, canonical bytes/digest, and independent trust admission.
Goal: separate law content integrity from authority to activate it.
Deliverables: generation, manifest, admission-set, ancestry-closure, rollback-floor, and mixed-version contracts.
Verification: future tuple, missing ancestor, forged catalog, digest-only trust, rollback, and owner-merging cases fail closed.
Exit criteria: only an independently admitted complete generation closure is usable. `v0.18.12 implementation stop reached. Run pentest for this exact commit.`

## `0.18.13` — Law Semantic Realizations And Generated Conformance
Status: planned.
Setup: start from admitted laws in `0.18.12`; bind each semantic ID to compiled transitions, outcomes, recovery, and tests.
Goal: eliminate prose-interpreted or unrealized active law behavior.
Deliverables: semantic-realization registry, active-catalog builder/verifier, P/N/M/F bindings, and generated recovery/fence index.
Verification: unknown semantic IDs, text-only fallbacks, incomplete catalogs, stale realization, and storage/restore drift are rejected.
Exit criteria: every active tuple has one executable realization and complete evidence links. `v0.18.13 implementation stop reached. Run pentest for this exact commit.`

## `0.21.1` — Static Storage Capability Admission
Status: planned.
Setup: freeze the capability vocabulary/report schema from `0.21.0` and exact semantic requirements per adapter profile.
Goal: reject missing, contradictory, or unreviewed static capability claims before startup.
Deliverables: typed declarations, profile IDs, admission records, unsupported reasons, and compile-time consistency checks.
Verification: false, duplicate, omitted, future, downgraded, and cross-profile claims fail.
Exit criteria: every compiled adapter has one exact admitted or unsupported profile. `v0.21.1 implementation stop reached. Run pentest for this exact commit.`

## `0.21.2` — Runtime Capability Probes And Startup Fence
Status: planned.
Setup: start from `0.21.1`; specify side-effect-safe probes and trusted observation boundaries.
Goal: prove deployed storage actually provides every statically admitted capability.
Deliverables: probe port, canonical results, startup readiness fence, bounded retries, and operator diagnostics.
Verification: lying adapter, stale result, partial probe, timeout, permission drift, and probe-to-use race cases pass.
Exit criteria: unavailable or unproven mandatory capability prevents readiness. `v0.21.2 implementation stop reached. Run pentest for this exact commit.`

## `0.21.3` — Capability Lineage, Upgrade, And Downgrade
Status: planned.
Setup: freeze profile predecessor, generation, activation, rollback floor, and mixed-version intersection.
Goal: prevent upgrades or rolling nodes from silently changing storage semantics.
Deliverables: profile lineage, activation record, compatibility intersection, downgrade refusal, and migration hooks.
Verification: ABA, skipped generation, mixed-node mismatch, stale activation, rollback, and feature removal pass.
Exit criteria: one monotonic evidenced capability generation governs each deployment. `v0.21.3 implementation stop reached. Run pentest for this exact commit.`

## `0.21.4` — Capability Recovery, Restore, And Import
Status: planned.
Setup: start from `0.21.3`; bind backups/imports to profile generation, probes, law catalog, and rollback floor.
Goal: stop restore or backend conversion from manufacturing capability.
Deliverables: recovery manifest fields, restore/import admission, reprobe requirement, and conservative mismatch outcomes.
Verification: missing profile, older-larger claim, foreign backend, stale probe, lost admission, and partial restore fail closed.
Exit criteria: recovery resumes only after exact profile trust and live probes pass. `v0.21.4 implementation stop reached. Run pentest for this exact commit.`

## `0.21.5` — Capability Refusal And Differential Conformance
Status: planned.
Setup: assemble every admitted, conditional, experimental, and unsupported profile from `0.21.1–0.21.4`.
Goal: make capability refusal observable and identical across API, worker, migration, restore, and operator paths.
Deliverables: refusal taxonomy, differential harness, support-report generator, and no-fallback tests.
Verification: exercise every unsupported combination through every entry point and compare exact outcomes.
Exit criteria: no path silently weakens or relabels a refused capability. `v0.21.5 implementation stop reached. Run pentest for this exact commit.`

## `0.22.1` — Atomicity Destruction And Crash Testkit
Status: planned.
Setup: freeze the reusable harness/fixture contract in `0.22.0` and enumerate every atomic bundle component.
Goal: prove all-or-none semantics under partial write, crash, cancellation, and retry.
Deliverables: deterministic fault injection, component-deletion matrix, crash oracle, and replay checker.
Verification: destroy each component before/during/after commit for every supported bundle variant.
Exit criteria: partial authority or partial observable success is unreachable. `v0.22.1 implementation stop reached. Run pentest for this exact commit.`

## `0.22.2` — Twin-Tenant And Authorization Storage Testkit
Status: planned.
Setup: start from `0.22.1`; freeze tenant-pair fixtures, principals, policies, cache/index/blob keys, and privileged database roles.
Goal: prove storage isolation structurally and behaviorally before real adapters.
Deliverables: twin-tenant generators, collision corpus, forced-privilege cases, and cross-surface leak oracle.
Verification: swap every tenant/principal/resource/key field and exercise owner, non-owner, pooled, and restored sessions.
Exit criteria: cross-tenant rows, facts, errors, timing shortcuts, or authority are never observable. `v0.22.2 implementation stop reached. Run pentest for this exact commit.`

## `0.22.3` — HA, Migration, Restore, And Capability Test Matrix
Status: planned.
Setup: combine `0.22.1–0.22.2` with capability lineage and recovery contracts from `0.21.x`.
Goal: certify equivalent behavior across failover, rolling upgrade, migration, import, and restore.
Deliverables: shared scenario matrix, profile differential runner, unsupported oracle, and evidence manifest.
Verification: partitions, stale leader, version skew, rollback, missing history, changed profile, and restore races pass.
Exit criteria: adapters run the complete matrix or refuse the claimed profile. `v0.22.3 implementation stop reached. Run pentest for this exact commit.`

## `0.29.1` — Resumable Migration Execution And Checkpoints
Status: planned.
Setup: freeze immutable registry/plan output from `0.29.0`, work quanta, cursors, counters, and checkpoint identity.
Goal: execute one migration plan resumably without hidden progress or resettable budgets.
Deliverables: bounded executor, durable cursor, cumulative counters, exact retry join, and progress evidence.
Verification: crash, duplicate runner, counter overflow, cursor rollback, lease loss, and response loss pass.
Exit criteria: execution resumes the same plan at one authenticated checkpoint. `v0.29.1 implementation stop reached. Run pentest for this exact commit.`

## `0.29.2` — Migration Admission, Fencing, And Lock Order
Status: planned.
Setup: start from `0.29.1`; freeze authorization, active-job uniqueness, source/destination fences, and global lock rank.
Goal: prevent concurrent writers, stale jobs, or lock inversion from changing migration meaning.
Deliverables: admission lifecycle, job/tenant/deployment fences, writer matrix, lock trace, and conflict results.
Verification: concurrent create/takeover, stale authorization, live writer, deadlock, ABA, and cross-target substitution pass.
Exit criteria: one admitted job owns each migration cut and every writer observes its fence. `v0.29.2 implementation stop reached. Run pentest for this exact commit.`

## `0.29.3` — Migration Candidate Verification And Activation
Status: planned.
Setup: freeze candidate manifest, domain-owner preparation receipts, barrier, verification cut, and activation authorization.
Goal: activate only a complete, same-cut, independently verified candidate.
Deliverables: candidate lifecycle, ordered owner preparation, barrier/result, activation CAS, audit, and outbox.
Verification: omit/reorder/substitute owner receipts, race authorization, change candidate, and lose response at activation.
Exit criteria: all owners and the activation result become visible in one local commit or none do. `v0.29.3 implementation stop reached. Run pentest for this exact commit.`

## `0.29.4` — Migration Failure, Rollback, And Reconciliation
Status: planned.
Setup: start from `0.29.3`; classify definitely-not-started, resumable, activated, unknown, fenced, and manual-recovery states.
Goal: make every interruption conservative without inventing rollback or retry authority.
Deliverables: closed recovery state machine, reconciliation ports, rollback evidence, takeover, and runbook.
Verification: crash and response loss at every state, stale restore, partial rollback, late activation, and repeated recovery pass.
Exit criteria: every failed/unknown path has one bounded safe continuation or remains fenced. `v0.29.4 implementation stop reached. Run pentest for this exact commit.`

## `0.29.5` — Migration History, Disposition, And Cleanup
Status: planned.
Setup: freeze immutable plan/result history, archive/checkpoint roots, retention/hold, cleanup capacity, and terminal dispositions.
Goal: preserve audit and replay proof while safely releasing staged resources.
Deliverables: history obligation, archive/checkpoint lifecycle, disposition receipts, protected cleanup lane, and GC proof.
Verification: missing archive, hold conflict, premature deletion, cleanup starvation, duplicate release, and restore pass.
Exit criteria: history and capacity settle exactly once without erasing authority evidence. `v0.29.5 implementation stop reached. Run pentest for this exact commit.`

## `0.30.3` — Streaming Export And Custody
Status: planned.
Setup: start from the canonical manifest/preflight slice in `0.30.0`; freeze chunking, ordering, classification, encryption, and custody.
Goal: export one tenant-scoped semantic snapshot without unbounded memory or plaintext leakage.
Deliverables: bounded stream exporter, chunk manifest, custody receipts, cancellation state, and deterministic resume token.
Verification: truncate, reorder, duplicate, substitute tenant/key/chunk, exhaust budgets, cancel, and crash.
Exit criteria: exported bytes are complete, bounded, classified, and manifest-bound. `v0.30.3 implementation stop reached. Run pentest for this exact commit.`

## `0.30.4` — Staged Import And Quarantine
Status: planned.
Setup: freeze import identity, source manifest, decode budgets, staged namespace, quarantine, and no-live-authority rule.
Goal: validate hostile cross-backend input without making it operational.
Deliverables: staged importer, canonical validation, digest-only quarantine, cumulative counters, and typed exhaustion.
Verification: malformed, oversized, cyclic, duplicate, foreign-tenant, unknown-law, and partial-stage cases pass.
Exit criteria: invalid or incomplete input remains inert and bounded. `v0.30.4 implementation stop reached. Run pentest for this exact commit.`

## `0.30.5` — Import Owner Preparation And Candidate Barrier
Status: planned.
Setup: start from `0.30.4`; freeze owner manifest, contributor order, preparation receipts, and barrier identity.
Goal: prove every authoritative owner accepts the same staged candidate.
Deliverables: preparation port, ordered receipt set, candidate barrier, rejection result, and response-loss lookup.
Verification: omit, duplicate, reorder, forge, stale, or cross-candidate every owner and receipt.
Exit criteria: a candidate reaches prepared only with one complete authenticated owner set. `v0.30.5 implementation stop reached. Run pentest for this exact commit.`

## `0.30.6` — Import Activation Authorization And Cutover
Status: planned.
Setup: freeze independent authorization issuance/admission, revocation, expiry, activation cut, and dormant-generation fence.
Goal: make one destination-local transaction the only imported-authority activation.
Deliverables: authorization lifecycle, activation CAS, owner writes, audit/outbox, tombstones, and exact retry result.
Verification: revoke/expire/race, partial owner write, stale candidate, response loss, competing activation, and restore pass.
Exit criteria: all selected owners activate together or the candidate remains inert. `v0.30.6 implementation stop reached. Run pentest for this exact commit.`

## `0.30.7` — Imported History And Disposition
Status: planned.
Setup: freeze Pending/NoHistory/NotRequested history states, provenance, retention, legal hold, and archive namespace.
Goal: represent imported history honestly without fabricating completeness or deletion proof.
Deliverables: history state machine, zero-eligibility proof, custody record, append protocol, and disposition receipts.
Verification: missing source, false empty, partial append, hold conflict, evidence downgrade, and response loss pass.
Exit criteria: history is complete, explicitly absent by proof, explicitly not requested, or blocked. `v0.30.7 implementation stop reached. Run pentest for this exact commit.`

## `0.30.8` — Import Recovery Capacity And Budget Conservation
Status: planned.
Setup: freeze parent/child capacity members, original totals, reservations, transfers, deficits, and protected Recovery lane.
Goal: fund every import/recovery obligation without reset, double credit, or starvation.
Deliverables: capacity ledger, atomic parent-child transfers, settlement IDs, deficit states, and bounded recovery scheduler.
Verification: overflow, partial transfer, retry, sibling credit, deficit, shrink, failover, restore, and starvation pass.
Exit criteria: original capacity equals live obligations plus settled releases at every state. `v0.30.8 implementation stop reached. Run pentest for this exact commit.`

## `0.30.9` — Corruption Detection And Authority Fence
Status: planned.
Setup: freeze corruption observations, evidence strength, lineage, fence, incident, and independent authorization roles.
Goal: stop corrupted imported state from remaining or becoming authoritative.
Deliverables: observation registry, corruption fence, immutable evidence bundle, readiness denial, and audit workflow.
Verification: forged/suppressed/late contradiction, stale observer, evidence loss, race with activation, and restore pass.
Exit criteria: a qualifying contradiction atomically installs an absorbing authority fence. `v0.30.9 implementation stop reached. Run pentest for this exact commit.`

## `0.30.10` — Corruption Rebuild And Clearance
Status: planned.
Setup: start from `0.30.9`; freeze rebuild candidate, rejection authority, clearance proof, scope generation, and successor uniqueness.
Goal: rebuild through a fresh verified candidate without clearing evidence or self-authorizing recovery.
Deliverables: rebuild workflow, independent clearance authorization, proof budgets, candidate mapping, and terminal results.
Verification: self-clear, stale proof, incomplete rebuild, competing successor, response loss, and repeat corruption pass.
Exit criteria: only one independently authorized, fully verified successor can restore readiness. `v0.30.10 implementation stop reached. Run pentest for this exact commit.`

## `0.30.11` — Backend Storage-Cost Profile And Re-cost
Status: planned.
Setup: freeze storage-cost classifier, active profile, successor, campaign slot/fence, provisioning evidence, and destructive weakening rules.
Goal: change backend cost assumptions without underfunding existing obligations.
Deliverables: profile lineage, re-cost campaign, workspace reservations, drain, activation/rejection, and settlement equations.
Verification: shrink, concurrent campaign, classifier drift, missing provisioning, crash, cleanup, rollback, and restore pass.
Exit criteria: profile activation preserves every obligation and exact capacity conservation. `v0.30.11 implementation stop reached. Run pentest for this exact commit.`

## `0.30.12` — Witness Observation And Equivocation Fence
Status: planned.
Setup: freeze witness proposal/receipts, observation registry, completeness frontier, pointer anchor, and evidence-maintenance budget.
Goal: detect contradictory signed outcomes and permanently fence the old authority lineage.
Deliverables: observation protocol, two-receipt evidence bundle, fence anchor, absorbing states, and bounded archive path.
Verification: suppression, reordering, fork, stale pointer, forged negative evidence, second equivocation, and restore pass.
Exit criteria: contradictory authenticated evidence can never be cleared or selected away. `v0.30.12 implementation stop reached. Run pentest for this exact commit.`

## `0.30.13` — Witness Replacement Bootstrap And Transfer
Status: planned.
Setup: start from `0.30.12`; freeze fresh identity/lineage genesis, offline root ceremony, single successor, mapping, and capacity transfer.
Goal: bootstrap one non-operational replacement without reusing old authority namespaces.
Deliverables: signed genesis receipt import, replacement head, source/outbox-destination/inbox transfer, quarantine, and conservation proofs.
Verification: competing bootstrap, signer I/O, stale receipt, partial transfer, double-live capacity, pointer takeover, and rollback pass.
Exit criteria: one funded pending replacement exists and the old lineage remains absorbing. `v0.30.13 implementation stop reached. Run pentest for this exact commit.`

## `0.30.14` — Witness Operationalization, Checkpoint, And Replay
Status: planned.
Setup: freeze independent pointer witness, signed operationalization, exact-set checkpoint/archive, replay, restore, and unavailable-history outcomes.
Goal: make the replacement operational only after external witness and durable recovery proof.
Deliverables: pointer reconciliation, checkpoint publication, replay verifier, archive lookup, restore ratchets, and terminal conflicts.
Verification: missing/forked history, stale witness, partial checkpoint, archive loss, failover, restore, and repeat replacement pass.
Exit criteria: operational status requires witnessed pointer continuity and complete recovery evidence. `v0.30.14 implementation stop reached. Run pentest for this exact commit.`

## `0.30.15` — Durable Queue Claims, Scheduling, And Backpressure
Status: planned.
Setup: start from the semantic queue port/record in `0.30.1`; freeze claim, lease/fence, priority, fairness, rate, and capacity.
Goal: schedule durable local work without granting policy or provider authority.
Deliverables: queue claim lifecycle, bounded partitions, protected recovery lane, backpressure, retry timing, and status API.
Verification: duplicate claim, lease loss, starvation, priority abuse, saturation, cancellation, and cross-tenant cases pass.
Exit criteria: one fenced claimant owns each delivery and queues remain non-authoritative. `v0.30.15 implementation stop reached. Run pentest for this exact commit.`

## `0.30.16` — Durable Queue Recovery And Conformance
Status: planned.
Setup: freeze checkpoint, takeover, poison, archival, failover, restore, and semantic differential rules for `0.30.1/0.30.15`.
Goal: prove queue behavior survives crash and backend change without duplicate local commits or revived work.
Deliverables: recovery scanner, poison workflow, checkpoint/archive, restore manifest, and shared conformance corpus.
Verification: crash every transition, response loss, stale takeover, corrupt record, missing history, migration, and restore pass.
Exit criteria: queue recovery preserves exact disposition and never evaluates or revives authority. `v0.30.16 implementation stop reached. Run pentest for this exact commit.`
