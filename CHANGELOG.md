# Changelog

All notable Vitheim changes are documented here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and releases use
[Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

### Added

- Initialized the dependency-free Rust workspace and security baseline.
- Added private `no_std` foundation crates and the `vitheim` facade.
- Added architecture, implementation, release, security, and tooling policy.
- Expanded every planned milestone from `0.1.0` through `0.150.0` and `1.0.0`
  into a version-specific implementation handoff with mechanically checked
  setup, goal, deliverables, verification, and pentest exit criteria.
- Incorporated the roadmap gap review by reopening `0.1.0`, moving structural
  tenant and release-evidence controls earlier, splitting WebAuthn review, and
  adding pre-production option-decision releases before Phase O.
- Incorporated the second roadmap review with first-consumer technology
  admission, early sensitive-payload and security-audit architecture, explicit
  hosted HA adapters, corrected cross-phase integration gates, separated API/
  SDK/import/export milestones, and explicit production-profile freeze decisions.
- Expanded the product roadmap with an API-first UI crate boundary, governed
  composable dashboards and organization-scale layouts, deeper RBAC,
  organization federation/shared spaces/managed-service delegation, a signed
  plugin storefront with Microsoft and Tenable connector packs, complete
  vulnerability management, and evidence-bound cross-domain graph correlation.
- Closed the next roadmap review by making mandatory audit crash-atomic,
  establishing early telemetry semantics, hardening generic cases and
  federation protocol evidence, assigning every intended interchange/semantic
  search adapter, and adding typed on-call, paging, notification, SLO,
  service-health, and status-communication capabilities.
- Incorporated the latest gap review with atomic command commit semantics,
  shared early provenance/four-clock primitives, in-process secret handling,
  workload authentication, production customer-measurement/paging/status paths,
  enforced threat-intelligence markings, a conditional concrete CMDB connector,
  and separately governed embedding generation. Narrowed syslog to authenticated
  alert-bearing input and made SCIM direction, STIX publication, SIEM/detection,
  and CMDB support explicit pre-production decisions.
- Closed the final architectural gap review with atomic consumer and fenced
  timer/activity/poison commit variants, authoritative measurement rollups, a
  mandatory tenant data-surface lifecycle registry, an external-issuer OAuth
  resource-server profile, strict no-plaintext-credentials-in-Wasm enforcement,
  and a governed external identity-link lifecycle.
- Refined the closed architecture without adding scope: atomic work is
  single-aggregate and local-only with distinct at-least-once dispatch/results;
  privileged workload tokens are sender constrained; external-copy disposition
  evidence carries honest proof strength; and raw measurements cannot expire
  until rollup authority is externally checkpointed and restore verified.
- Strengthened the closed roadmap without new versions: mandatory deletion now
  outranks unavailable rollup-preservation proof; remote effects have durable
  ambiguous-outcome and reconciliation semantics; and the tenant-surface
  registry has an inward descriptor, explicit backfill, and prospective gate.
- Removed the undeclared ripgrep dependency from repository verification so
  GitHub-hosted runners use portable `grep`/`git grep` policy, plan, link, SBOM,
  release-readiness, and tool-freshness checks.
- Refined the closed roadmap without new versions by separating external-effect
  lifecycle/provider truth/resolution/manual/compensation models, independently
  disposing every rollup-derived surface, and restoring mechanically checked
  Phase G network-call/crash-point verification.
- Closed the delayed-effect control gaps without adding versions: restored the
  complete compensation milestone, bound effect intents to commit-time and
  risk-based current dispatch authorization, and tied quota hold/refund/
  compensation semantics plus protected recovery capacity to the typed
  external-effect lifecycle through HA and production acceptance.
- Added local and GitHub verification gates without a crate publication path.
