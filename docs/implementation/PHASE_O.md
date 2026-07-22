# Phase O — Production Hardening

Scope: `0.141.0–0.150.0`. Claims require operational evidence, not schedule.

## `0.141.0` — Single-Node Production Packaging
Status: planned. Setup: supported OS/arch, packages/images, users/paths, permissions, secure defaults, upgrades. Goal: hardened repeatable single-node install. Deliverables: signed packages and runbook. Verification: clean install, permissions, rootless/non-root, secrets, restart, upgrade/rollback pass. Exit criteria: documented profile is operable securely. `v0.141.0 implementation stop reached. Run pentest for this exact commit.`

## `0.142.0` — Split Service Deployments
Status: planned. Setup: API/worker/ingest/index identities, mTLS/authz, network policy, discovery, version compatibility. Goal: optional process separation. Deliverables: deploy manifests and service protocol evidence. Verification: service impersonation, confused deputy, network bypass, skew, partial outage, rotation pass. Exit criteria: split mode preserves modular semantics. `v0.142.0 implementation stop reached. Run pentest for this exact commit.`

## `0.143.0` — HA Leases, Failover, And Partitions
Status: planned. Setup: quorum/authority, fencing, health, failover, partition policy, reconciliation. Goal: prevent split-brain effects. Deliverables: HA orchestration and runbooks. Verification: partitions, clock skew, stale leader, duplicate work, failover/failback, chaos/soak pass. Exit criteria: split brain rejects writes. `v0.143.0 implementation stop reached. Run pentest for this exact commit.`

## `0.144.0` — Regional Placement And Residency
Status: planned. Setup: tenant authoritative region, allowed replicas, policy labels, failover approval, encryption/keys. Goal: enforce data residency. Deliverables: placement engine and regional runbook. Verification: cross-region write/read/cache/backup/log leakage, failover bypass, policy changes pass. Exit criteria: placement violations fail closed. `v0.144.0 implementation stop reached. Run pentest for this exact commit.`

## `0.145.0` — Backup, Restore, And Disaster Recovery
Status: planned. Setup: RPO/RTO profiles, DB/blob/key/config consistency, encryption, immutability, drills. Goal: verified recoverability. Deliverables: backup/restore tools and DR evidence. Verification: substitution, partial/stale backup, lost key, point-in-time restore, integrity/rebuild/workflow continuation pass. Exit criteria: claimed RPO/RTO is demonstrated. `v0.145.0 implementation stop reached. Run pentest for this exact commit.`

## `0.146.0` — Performance, Load, Soak, And Chaos Certification
Status: planned. Setup: representative workloads, SLOs, quotas, baselines, failure scenarios, evidence retention. Goal: prove bounded behavior under stress. Deliverables: harnesses and signed reports. Verification: noisy tenants, queue/index/plugin/report exhaustion, leaks, cascading failures, long soak/chaos pass. Exit criteria: regressions and unsafe saturation block release. `v0.146.0 implementation stop reached. Run pentest for this exact commit.`

## `0.147.0` — Final Security And Supply-Chain Hardening
Status: planned. Setup: complete threat model, dependency/tool/action inventory, reproducibility, keys, provenance, secret scanning. Goal: close build/runtime supply-chain paths. Deliverables: audits, SBOM/provenance, reproducible artifacts, hardening guide. Verification: compromised builder/dependency/action/key scenarios, artifact substitution, unsafe delta pass. Exit criteria: every trusted input is pinned/accounted. `v0.147.0 implementation stop reached. Run pentest for this exact commit.`

## `0.148.0` — Compatibility Freeze
Status: planned. Setup: freeze API/event/workflow/policy/plugin/pack/export/agent versions and support windows. Goal: remove version ambiguity before RC. Deliverables: compatibility matrices, migration suites, deprecation rules. Verification: downgrade/skew/unknown versions, rolling upgrades, old data/plugins/agents, rollback pass. Exit criteria: supported combinations are exact. `v0.148.0 implementation stop reached. Run pentest for this exact commit.`

## `0.149.0` — External Pentest Remediation Candidate
Status: planned. Setup: freeze scope/artifacts/environment and engage independent testers across all trust boundaries. Goal: remediate complete attack paths. Deliverables: findings, fixes, regression tests, clean retest evidence. Verification: external pentest plus tenant/auth/plugin/AI/storage/operations/supply-chain regression pass. Exit criteria: all critical/high findings are fixed and retested. `v0.149.0 implementation stop reached. Run pentest for this exact commit.`

## `0.150.0` — Final Production-Readiness Candidate
Status: planned. Setup: candidate from remediated freeze; exact install/upgrade/restore/rollback/failover artifacts and evidence. Goal: final pre-RC readiness proof. Deliverables: complete candidate bundle, runbooks, acceptance report. Verification: clean install, rolling upgrade, restore, rollback, failover, load, compatibility, evidence reproducibility pass. Exit criteria: no known blocking gap remains. `v0.150.0 implementation stop reached. Run pentest for this exact commit.`

