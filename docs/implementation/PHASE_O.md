# Phase O — Production Hardening

Scope: `0.141.0–0.150.0`. Claims require operational evidence, not schedule.

## `0.141.0` — Single-Node Production Packaging
Status: planned. Setup: supported OS/arch, packages/images, users/paths, permissions, secure defaults, upgrades. Goal: hardened repeatable single-node install. Deliverables: signed packages and runbook. Verification: clean install, permissions, rootless/non-root, secrets, restart, upgrade/rollback pass. Exit criteria: documented profile is operable securely. `v0.141.0 implementation stop reached. Run pentest for this exact commit.`

## `0.142.0` — Split Service Deployments
Status: planned. Setup: API/worker/ingest/index identities, mTLS/authz, network policy, discovery, version compatibility. Goal: optional process separation. Deliverables: deploy manifests and service protocol evidence. Verification: service impersonation, confused deputy, network bypass, skew, partial outage, rotation pass. Exit criteria: split mode preserves modular semantics. `v0.142.0 implementation stop reached. Run pentest for this exact commit.`

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
policy, reconciliation, and every `0.18.2` atomic work variant. Goal: prevent
split-brain effects. Deliverables: HA orchestration, work-variant fault matrix,
and runbooks. Verification: partitions, clock skew, stale leader/fence,
receipt/effect/quota/dead-letter splits, duplicate command/consumer/timer/
activity work, timer dispatch/result separation, multi-aggregate/remote-call
transaction rejection, provider acceptance plus lost response, unknown-outcome
reconciliation deadline/escalation, distinct execution/outcome/evidence/manual/
compensation state, direct/callback/query evidence racing manual resolution,
forbidden blind privileged/non-compensable retry, failover/failback, and chaos/
soak pass. Exit criteria: split
brain and stale workers reject every state-changing variant. `v0.143.0
implementation stop reached. Run pentest for this exact commit.`

## `0.144.0` — Regional Placement And Residency
Status: planned. Setup: tenant authoritative region, allowed replicas, policy
labels, failover approval, encryption/keys, and every `0.51.2` registered
surface including external copies. Goal: enforce data residency. Deliverables:
placement engine, zero-unmapped-surface report, and regional runbook.
Verification: cross-region write/read/cache/backup/log/vector/measurement/
plugin/AI/federation leakage, unregistered surface, failover bypass, and policy
changes pass. Exit criteria: placement violations or incomplete surface mapping
fail closed. `v0.144.0 implementation stop reached. Run pentest for this exact commit.`

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
authority-loss records, rebuild/workflow continuation pass.
Exit criteria: claimed RPO/RTO is demonstrated; recovery neither retains data
past a controlling mandatory deletion obligation nor promotes an unverified
rollup to authority, and every related surface has its own disposition proof.
`v0.145.0 implementation stop reached. Run pentest for this exact commit.`

## `0.146.0` — Performance, Load, Soak, And Chaos Certification
Status: planned. Setup: representative workloads, SLOs, durable `0.18.1` quota
profiles, separate Vitheim-telemetry and customer-measurement capacity models,
paging/status provider limits, fairness and reconciliation, baselines, failure
scenarios, and evidence retention. Goal: prove bounded behavior under stress.
Deliverables: harnesses and signed reports. Verification: atomic quota
reservation/refund/work-bundle consumption, noisy tenants, observation late-
arrival/authoritative-rollup recalculation/downsampling,
paging/status retry/reconciliation, queue/index/embedding/plugin/report
exhaustion, leaks, cascading failures, and long soak/chaos pass. Exit criteria:
regressions and unsafe saturation block release. `v0.146.0
implementation stop reached. Run pentest for this exact commit.`

## `0.147.0` — Final Security And Supply-Chain Hardening
Status: planned. Setup: complete threat model, dependency/tool/action inventory,
semantic SBOM, reproducibility, full key generation/storage/use/rotation/revocation/
recovery/destruction lifecycle, `0.28.3` in-process memory assurance, crash/
core-dump/swap profile, provenance and secret scanning. Goal: close build and
runtime supply-chain paths. Deliverables: audits, candidate-tree/artifact-bound
signed evidence, SBOM/provenance, reproducible artifacts, hardening guide.
Verification: compromised builder/dependency/action/key, secret canaries across
diagnostics/plugins/crash paths, stale or name-only SBOM, wrong pentest parent/
tree/artifact, substitution and unsafe delta pass.
Exit criteria: every trusted input is pinned/accounted. `v0.147.0 implementation stop reached. Run pentest for this exact commit.`

## `0.148.0` — Compatibility Freeze
Status: planned. Setup: freeze API/event/workflow/policy/plugin/pack/export/agent
versions and support windows, immutable event-schema registry, complete pure
upcaster chains, original-byte hash authority, and unknown-event quarantine.
Goal: remove version ambiguity before RC. Deliverables: compatibility matrices,
golden mixed-version event corpus, migration/rebuild suites, and deprecation
rules. Verification: downgrade/skew/unknown versions, upcaster determinism,
original-byte mutation, rolling upgrades, old data/plugins/agents, rollback pass.
Exit criteria: supported combinations are exact. `v0.148.0 implementation stop
reached. Run pentest for this exact commit.`

## `0.149.0` — External Pentest Remediation Candidate
Status: planned. Setup: freeze scope/artifacts/environment and engage independent testers across all trust boundaries. Goal: remediate complete attack paths. Deliverables: findings, fixes, regression tests, clean retest evidence. Verification: external pentest plus tenant/auth/plugin/AI/storage/operations/supply-chain regression pass. Exit criteria: all critical/high findings are fixed and retested. `v0.149.0 implementation stop reached. Run pentest for this exact commit.`

## `0.150.0` — Final Production-Readiness Candidate
Status: planned. Setup: candidate from remediated freeze; exact install/upgrade/restore/rollback/failover artifacts and evidence. Goal: final pre-RC readiness proof. Deliverables: complete candidate bundle, runbooks, acceptance report. Verification: clean install, rolling upgrade, restore, rollback, failover, load, compatibility, evidence reproducibility pass. Exit criteria: no known blocking gap remains. `v0.150.0 implementation stop reached. Run pentest for this exact commit.`
