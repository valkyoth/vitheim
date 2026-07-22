# `1.0.0` — Serious Production Release

Status: planned; never reached by date or version count alone.

Setup: select an exact unchanged `v1.0.0-rc.N` commit and artifact set that has
passed every preceding gate, independent external pentest, clean retest,
reproducible build comparison, compatibility freeze, and operational exercise.

Goal: release the first production-supported Vitheim platform with claims no
broader than its evidence.

Deliverables:
- Stable API v1, event compatibility, plugin ABI v1, pack/export formats, and
  agent protocol with migration/support policy.
- Production ITSM, SecOps, assets/service graph, knowledge, risk/compliance,
  cases, workflow/policy, search, integrations, optional AI, and administration.
- Supported single-node/HA/regional profiles; backup, restore, rebuild, upgrade,
  rollback, health, quota, backpressure, incident, and DR runbooks.
- Signed source/artifacts/checksums, SBOM, provenance, licenses, compatibility
  evidence, pentest report, and complete release notes.

Verification:
- Full tenant/authorization matrix across API/UI/search/workflow/plugins/AI/
  exports/attachments/notifications/admin; every untrusted parser fuzzed.
- Independent crypto review, plugin escape and AI injection/tool-abuse suites,
  storage conformance, migration/restore/rebuild/workflow continuation tests.
- Reproducible builds, clean install/upgrade/rollback/failover, load/soak/chaos,
  secure defaults, accessibility, localization, and disaster-recovery exercises.

Exit criteria: no acceptance criterion is waived for schedule. Any candidate
code or artifact change creates a new RC and repeats affected review. After the
final exact commit and artifacts pass the final independent pentest, stop for
explicit maintainer authorization before creating `v1.0.0`; publishing crates
remains forbidden except for a separately approved SDK. `v1.0.0 implementation
stop reached. Run final pentest for this exact commit and artifact set.`

