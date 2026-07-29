# Product And Production Scope Splits

Scope: focused companion stops for overloaded workflow, option-decision, and
production-hardening families. Each stop inherits its parent family ledger but
implements or freezes only its named slice.

## `0.70.1` — Workflow Worker Takeover And Recovery
Status: planned.
Setup: start from the worker lease/fence slice in `0.70.0`; freeze takeover, checkpoint, history, timer, activity, and orphan rules.
Goal: recover one workflow worker safely after crash, lease loss, or partition.
Deliverables: takeover CAS, durable checkpoint, orphan scanner, reconciliation outcomes, and bounded recovery lane.
Verification: crash at every transition, stale worker, response loss, duplicate timer/activity, partition, failover, and restore pass.
Exit criteria: exactly one fenced worker continues each workflow history. `v0.70.1 implementation stop reached. Run pentest for this exact commit.`

## `0.70.2` — Workflow HA Cross-Domain Integration Certification
Status: planned.
Setup: combine `0.70.0–0.70.1` with real policy, queue, notification, paging, and domain adapters.
Goal: prove HA workflow behavior without allowing workflow code to become domain or effect authority.
Deliverables: cross-domain conformance pack, fake-versus-real differential tests, load/fairness evidence, and support matrix.
Verification: revoke policy, fail queues/providers, reorder callbacks, restore checkpoints, exhaust tenants, and compare every adapter.
Exit criteria: integrations preserve workflow and domain authority boundaries under HA. `v0.70.2 implementation stop reached. Run pentest for this exact commit.`

## `0.140.12` — Transport Security And Trusted-Time Freeze Decision
Status: planned.
Setup: review first-use admissions for TLS, certificate validation, DNS/redirect policy, timestamping, and trusted-time profiles.
Goal: freeze exact production transport and trusted-time combinations.
Deliverables: protocol/version/cipher profile, certificate and name rules, time/uncertainty source, rotation, failure, and unsupported matrix.
Verification: downgrade, invalid chain/name, stale root, redirect/DNS substitution, rollback, suspend, skew, and expiry races pass review.
Exit criteria: Phase O has one exact fail-closed transport/time profile. `v0.140.12 implementation stop reached. Run pentest for this exact commit.`

## `0.140.13` — KMS, Secret, And Key-Lifecycle Freeze Decision
Status: planned.
Setup: review admitted KMS/secret providers, envelope formats, key purposes, epochs, custody, backup, recovery, and destruction.
Goal: freeze one replaceable production key and secret lifecycle.
Deliverables: provider/profile matrix, key hierarchy, rotation/distrust, outage, restore, erasure, and manual-recovery decisions.
Verification: cross-purpose/key/tenant substitution, stale epoch, provider outage, rollback, lost root, partial destruction, and recovery abuse pass.
Exit criteria: missing lifecycle evidence keeps the provider unsupported. `v0.140.13 implementation stop reached. Run pentest for this exact commit.`

## `0.140.14` — Dependency, Toolchain, And Build-Evidence Freeze Decision
Status: planned.
Setup: review every admitted implementation, Rust/tool pins, source/license, action, builder, SBOM, provenance, and maintenance owner.
Goal: freeze the exact production build and supply-chain inputs independently of cryptographic selection.
Deliverables: admitted-input manifest, replacement/upgrade policy, reproducibility profile, evidence digests, and unsupported sources.
Verification: source/action/tool substitution, stale SBOM, unreviewed feature, license drift, irreproducibility, and maintainer-loss scenarios pass.
Exit criteria: every production input is exact, maintained, replaceable, and evidence-bound. `v0.140.14 implementation stop reached. Run pentest for this exact commit.`

## `0.140.15` — Tenant Isolation Storage Freeze Decision
Status: planned.
Setup: start from the default support matrix in `0.140.2`; review tenant keys, RLS, database roles, pools, caches, blobs, indexes, and backups.
Goal: freeze exact isolation mechanisms for each selected storage profile.
Deliverables: isolation matrix, privileged-role limits, session reset rules, topology constraints, and unsupported combinations.
Verification: twin-tenant collision, owner/superuser bypass, pool leakage, key omission, backup/restore, and operator abuse pass.
Exit criteria: every selected profile proves structural and behavioral tenant isolation. `v0.140.15 implementation stop reached. Run pentest for this exact commit.`

## `0.140.16` — Storage Transaction And Co-location Freeze Decision
Status: planned.
Setup: review every atomic bundle, lock rank, CAS, commit-deadline, receipt, audit, outbox, and owner co-location requirement.
Goal: freeze which transactions each production backend can prove atomically.
Deliverables: operation-to-transaction matrix, capability probes, refusal rules, lock traces, and backend-specific conformance references.
Verification: destroy each component, race every lock/CAS, pause around commit, fail over, and attempt non-co-located activation.
Exit criteria: a backend supports an operation atomically or refuses it. `v0.140.16 implementation stop reached. Run pentest for this exact commit.`

## `0.140.17` — Storage Migration And Import Freeze Decision
Status: planned.
Setup: review schema migration, cross-backend import, staging, owner preparation, activation, rollback, quarantine, and cleanup evidence.
Goal: freeze exact supported upgrade and backend-conversion paths.
Deliverables: source/destination matrix, version floors, operation limits, runbooks, rollback/refusal states, and evidence requirements.
Verification: partial execution, changed candidate, old writer, response loss, failover, rollback, quarantine, and cleanup starvation pass.
Exit criteria: every supported path has a bounded tested transition and conservative failure state. `v0.140.17 implementation stop reached. Run pentest for this exact commit.`

## `0.140.18` — Storage Backup, Restore, And Recovery Freeze Decision
Status: planned.
Setup: review backup/checkpoint formats, law/profile bindings, key custody, restore ratchets, external anchors, missing history, and readiness.
Goal: freeze recovery behavior separately from normal storage operation.
Deliverables: backup/restore matrix, integrity/authenticity rules, profile reprobe, rollback floors, unavailable-history outcomes, and RPO/RTO claims.
Verification: partial/stale backup, wrong key/profile/catalog, lost anchor, rollback, corrupt archive, and cross-backend restore pass.
Exit criteria: recovery cannot mint authority or readiness from incomplete evidence. `v0.140.18 implementation stop reached. Run pentest for this exact commit.`

## `0.140.19` — Experimental Backend Promotion Decision
Status: planned.
Setup: review MySQL, MongoDB, and SurrealDB evidence independently of SQLite and PostgreSQL defaults.
Goal: decide whether any experimental backend earns an exact production profile.
Deliverables: per-backend promote/defer decision, capability/conformance deltas, operational ownership, limitations, and retest evidence.
Verification: compare the complete destructive, tenant, migration, restore, HA, load, and pentest corpus without waivers.
Exit criteria: each backend is independently promoted with exact scope or remains experimental. `v0.140.19 implementation stop reached. Run pentest for this exact commit.`

## `0.140.20` — Final Storage Support And Refusal Matrix
Status: planned.
Setup: consolidate `0.140.2` and `0.140.15–0.140.19` without widening any decision.
Goal: publish one machine-checkable production storage truth.
Deliverables: exact supported/conditional/experimental/unsupported matrix, evidence links, installer/API discovery data, and no-fallback rules.
Verification: differential checks compare docs, API, UI, installer, runtime probes, migration, restore, and operator output.
Exit criteria: every storage claim resolves to one exact passing profile or explicit refusal. `v0.140.20 implementation stop reached. Run pentest for this exact commit.`

## `0.140.21` — HA And Failover Profile Freeze Decision
Status: planned.
Setup: start from deployment shapes selected in `0.140.6`; review quorum, lease/fence, leader, queue, cache, session, worker, and database failover.
Goal: freeze exact HA topologies and failure assumptions.
Deliverables: node/service topology, quorum/fencing rules, failover state, split-brain refusal, operational roles, and SLOs.
Verification: partitions, stale leader, delayed receipt, dual worker, quorum loss, clock shift, key outage, and failback pass review.
Exit criteria: each HA claim maps to one independently testable topology. `v0.140.21 implementation stop reached. Run pentest for this exact commit.`

## `0.140.22` — Regional Placement And Disaster-Recovery Freeze Decision
Status: planned.
Setup: review residency, authoritative region, replicas, backups, exports, evidence, failover, failback, and active/active non-goals.
Goal: freeze regional and DR profiles separately from ordinary HA.
Deliverables: placement classes, data-flow map, RPO/RTO, recovery authority, legal constraints, and unsupported active/active writes.
Verification: region loss, residency conflict, stale replica, key/identity outage, incomplete restore, failback, and erasure/hold cases pass.
Exit criteria: regional claims are evidence-bounded and unsupported writes fail closed. `v0.140.22 implementation stop reached. Run pentest for this exact commit.`

## `0.140.23` — Operational Authority And Recovery Profile Decision
Status: planned.
Setup: review installer/operator, deployment, backup, restore, failover, emergency, break-glass, and recovery role separation.
Goal: freeze who may perform each production operation and how authority is recovered.
Deliverables: role/SoD matrix, approval/quorum, credential profile, audit/evidence, revocation, manual fallback, and exercise schedule.
Verification: self-approval, stale grant, role collapse, unavailable identity/KMS, replay, response loss, restore, and insider-abuse review pass.
Exit criteria: no production operation depends on ambiguous or circular authority. `v0.140.23 implementation stop reached. Run pentest for this exact commit.`

## `0.140.24` — Witness Replacement Bootstrap Freeze Decision
Status: planned.
Setup: start from authority retirement selected in `0.140.11`; review fresh identity/lineage, offline root ceremony, receipt import, and successor uniqueness.
Goal: freeze a non-TOFU, single-successor replacement bootstrap.
Deliverables: genesis preimage, signer/importer roles, bootstrap reserve, candidate lifecycle, namespace separation, and rejection outcomes.
Verification: signer in transaction, stale/reused receipt, competing successor, old namespace reuse, partial bootstrap, and rollback pass review.
Exit criteria: one funded pending replacement can be created without reviving old authority. `v0.140.24 implementation stop reached. Run pentest for this exact commit.`

## `0.140.25` — Witness Capacity Transfer And Quarantine Freeze Decision
Status: planned.
Setup: review source/destination reservations, mappings, inherited baseline, deficits, quarantined members, witnesses, and settlement.
Goal: freeze conservative cross-lineage capacity disposition.
Deliverables: transfer equations, one-to-one/quarantine rules, authorization/SoD, response-loss outcomes, and permanent retention policy.
Verification: double-live member, missing side, fabricated credit, sibling settlement, partial witness, deficit, and restore pass review.
Exit criteria: replacement cannot gain more usable capacity than independently proven transfer. `v0.140.25 implementation stop reached. Run pentest for this exact commit.`

## `0.140.26` — Witness Checkpoint, Replay, And Operationalization Freeze Decision
Status: planned.
Setup: review pointer witness, fence dominance, checkpoint/archive formats, replay, restore, evidence maintenance, and unavailable history.
Goal: freeze the only path from pending replacement to operational authority.
Deliverables: pointer/reconciliation profile, checkpoint trust, archive SLO, recovery budgets, restore ratchets, and incident runbook.
Verification: stale/forked pointer, missing history, forged seal, anchor loss, restore rollback, repeated equivocation, and evidence starvation pass.
Exit criteria: operationalization requires complete witnessed and replayable recovery evidence. `v0.140.26 implementation stop reached. Run pentest for this exact commit.`

## `0.141.1` — Production Startup Compatibility Gates
Status: planned.
Setup: start from package/install layout in `0.141.0`; freeze schema, law catalog, profile, binary, key, and evaluator compatibility floors.
Goal: make an installed node refuse incompatible or untrusted state before serving.
Deliverables: startup verifier, typed refusal results, migration-required states, operator diagnostics, and evidence report.
Verification: older/newer schema, wrong catalog/profile/key, stale evaluator, partial migration, rollback, and restore cases pass.
Exit criteria: readiness requires every selected compatibility floor. `v0.141.1 implementation stop reached. Run pentest for this exact commit.`

## `0.141.2` — Production Topology Bootstrap And Handoff
Status: planned.
Setup: freeze singleton bootstrap, dynamic topology initialization, authorization receipt, local owner admission, and handoff CAS.
Goal: transition from compiled singleton to one dynamic topology owner without dual authority.
Deliverables: bootstrap tool, topology manifest, authorization/admission lifecycle, handoff receipt, fences, and rollback refusal.
Verification: concurrent bootstrap, stale receipt, missing local owner, partial convergence, response loss, restore, and downgrade pass.
Exit criteria: exactly one topology generation becomes authoritative. `v0.141.2 implementation stop reached. Run pentest for this exact commit.`

## `0.141.3` — Production Authorization Replay And Rate Budgets
Status: planned.
Setup: freeze ingress partitions, presentation/request/admission/outstanding budgets, replay identity, checkpoints, and archives.
Goal: bound authorization abuse while preserving exact historical outcomes.
Deliverables: layered rate ledgers, two-stage presentation charge, denial/issuance replay, checkpoint/archive, and unavailable-history denial.
Verification: flood each pre/post-auth resource, replay, changed digest, crash, compaction race, archive loss, failover, and restore.
Exit criteria: no replay bypasses cost or becomes new authority after history loss. `v0.141.3 implementation stop reached. Run pentest for this exact commit.`

## `0.141.4` — Production Capacity Profiles, Drains, And Runbooks
Status: planned.
Setup: freeze lane capacity lineages, physical provisioning evidence, shrink classification, drain fence, authorization, replay, and maintenance reserves.
Goal: operate capacity changes without cancelling obligations or starving recovery.
Deliverables: profile/drain lifecycles, activation/rejection, settlement, protected workers, metrics, alerts, and runbook.
Verification: shrink under load, final admission race, stale fence, rollback, failover, restore, replay, and cleanup starvation pass.
Exit criteria: every installed capacity change conserves obligations and remains recoverable. `v0.141.4 implementation stop reached. Run pentest for this exact commit.`

## `0.143.1` — Storage And Control-Plane Failover Certification
Status: planned.
Setup: start from lease/fence HA model in `0.143.0`; enumerate database, queue, cache, session, topology, catalog, and authorization owners.
Goal: certify each stateful owner through leader loss and failover independently.
Deliverables: owner-specific failover harnesses, continuity ratchets, readiness gates, failback rules, and evidence reports.
Verification: crash/partition each owner at every transition, stale leader, delayed write, response loss, restore, and failback pass.
Exit criteria: no owner can become dual, stale, or silently unavailable. `v0.143.1 implementation stop reached. Run pentest for this exact commit.`

## `0.143.2` — Service Partition And Recovery Certification
Status: planned.
Setup: combine `0.143.0–0.143.1` across API, workers, ingest, index, agents, providers, and operator paths.
Goal: prove bounded degraded behavior and recovery without distributed-transaction assumptions.
Deliverables: partition matrix, degraded-mode contract, reconciliation jobs, protected recovery capacity, and incident runbook.
Verification: isolate every service pair, reorder/duplicate messages, exhaust queues, rotate credentials, restore, and heal partitions.
Exit criteria: every partition yields an explicit safe state and convergent recovery path. `v0.143.2 implementation stop reached. Run pentest for this exact commit.`

## `0.145.1` — Restore Verification And Readiness
Status: planned.
Setup: start from backup format/custody in `0.145.0`; freeze restore identity, integrity, keys, profiles, laws, epochs, history, and reprobes.
Goal: restore one candidate without granting readiness from incomplete or stale evidence.
Deliverables: restore planner/executor, verification manifest, rollback floors, quarantine, reprobe, and readiness report.
Verification: partial/corrupt backup, wrong key/profile/catalog, missing history, stale epoch, changed topology, and repeated restore pass.
Exit criteria: restored state is verified and fenced until every authority owner is ready. `v0.145.1 implementation stop reached. Run pentest for this exact commit.`

## `0.145.2` — Disaster Recovery, Failback, Retention, And Erasure
Status: planned.
Setup: combine backup and restore with region loss, RPO/RTO, legal hold, retention, erasure, external copies, and failback.
Goal: exercise the full destructive DR lifecycle without overstating deletion or continuity.
Deliverables: DR/failback runbooks, timed exercise, disposition evidence, external-copy states, authority-loss outcomes, and report.
Verification: destroy primary region, lose provider/key/archive, conflict hold/erasure, miss RPO, fail back, and repeat recovery.
Exit criteria: claimed RPO/RTO and disposition strength are demonstrated exactly. `v0.145.2 implementation stop reached. Run pentest for this exact commit.`

## `0.146.1` — Soak, Fairness, And Capacity Certification
Status: planned.
Setup: start from load harness/ceilings in `0.146.0`; freeze tenant mixes, durations, queues, quotas, recovery reserves, and leak thresholds.
Goal: prove sustained bounded operation and fair progress at supported capacity.
Deliverables: soak profiles, fairness oracle, resource-leak checks, backlog convergence, capacity evidence, and tuning record.
Verification: hostile/noisy tenants, maximum objects, long workflows, provider slowdown, cleanup backlog, and recovery demand pass.
Exit criteria: supported loads remain bounded, fair, observable, and recoverable. `v0.146.1 implementation stop reached. Run pentest for this exact commit.`

## `0.146.2` — Chaos And Recovery-Capacity Certification
Status: planned.
Setup: combine passing load/soak profiles with controlled process, network, disk, clock, key, identity, and provider faults.
Goal: prove safety and recovery progress under compound failures.
Deliverables: chaos campaign, invariant oracle, protected-lane evidence, reconciliation timing, residual-risk report, and runbooks.
Verification: inject single and compound faults at every irreversible transition under load and repeat after restore/failover.
Exit criteria: no fault breaks authority, conservation, isolation, or bounded recovery. `v0.146.2 implementation stop reached. Run pentest for this exact commit.`

## `0.149.1` — Authority, Identity, And Tenant Pentest Remediation
Status: planned.
Setup: take only independently reported authority, authentication, authorization, tenant, session, and confused-deputy findings from `0.149.0`.
Goal: remediate one security-control family without mixing storage or integration changes.
Deliverables: fixes, regression/property/fuzz tests, threat/control updates, evidence, and focused external retest.
Verification: rerun affected matrices plus cross-tenant, revocation, replay, SoD, break-glass, and restore cases.
Exit criteria: this finding family has zero unresolved critical/high issues. `v0.149.1 implementation stop reached. Run pentest for this exact commit.`

## `0.149.2` — Storage, Migration, Recovery, And Availability Pentest Remediation
Status: planned.
Setup: take only storage, atomicity, migration/import, backup/restore, HA, capacity, and exhaustion findings after `0.149.1`.
Goal: remediate persistence and recovery findings with one coherent destructive corpus.
Deliverables: fixes, adapter differentials, migration/restore/chaos regressions, evidence, and focused external retest.
Verification: destroy affected components, race transitions, exhaust budgets, fail over, restore, and verify conservation/tenant isolation.
Exit criteria: this finding family has zero unresolved critical/high issues. `v0.149.2 implementation stop reached. Run pentest for this exact commit.`

## `0.149.3` — Plugin, API, Federation, AI, And Final Pentest Retest
Status: planned.
Setup: take remaining API/UI, plugin, connector, agent, federation, AI, export, and supply-chain findings after `0.149.2`.
Goal: remediate external-boundary findings and perform one unchanged-candidate final retest.
Deliverables: fixes, sandbox/injection/protocol regressions, capability/support updates, complete finding ledger, and external retest report.
Verification: escape, SSRF/egress, secret leakage, prompt/tool abuse, peer compromise, parser fuzz, downgrade, and evidence-substitution cases pass.
Exit criteria: the unchanged remediation candidate has zero unresolved critical/high findings. `v0.149.3 implementation stop reached. Run pentest for this exact commit.`
