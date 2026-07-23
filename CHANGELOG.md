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
- Refined delayed execution without adding versions: scheduled work now redeems
  typed live-subject, immutable approval-grant, or scoped service-principal
  authority without impersonating offline humans; quota accounting now uses
  bounded multi-kind claims with distinct concurrency/rate/cost/storage
  settlement and fairly partitioned recovery capacity.
- Closed the final transaction-model ambiguities without adding versions:
  execution-grant lineages now have one explicit authoritative owner with
  outbox-driven dedicated issuance and revocation-safe successors, while quota
  claim sets reserve all-or-none under canonical ordering and transition or
  recover only through their exact immutable token/digest.
- Closed the remaining redemption/topology ambiguity without adding versions:
  grant attempts now linearize through a co-located fenced local guard while
  dispatch advances only the effect stream; quota sets stay in one local
  partition and wider limits use conserved hierarchical capacity leases.
  `1.0.0` explicitly rejects active/active authoritative multi-region writes.
- Closed the remaining dispatch and lease-lifecycle races without new versions:
  every authority source now supplies a monotonic local dispatch fence; expired
  hierarchical quota leases retain per-kind encumbrances through settlement or
  fenced transfer; and composite transactions share one canonical lock
  order with bounded identity-preserving deadlock retry.
- Closed the target-state and cross-partition transfer gaps without new
  versions: current-target dispatch now locks a typed co-transactional fence
  covering lifecycle and deletion/supersession epochs, while quota capacity
  moves through an explicit outbox/inbox state machine with receipt-idempotent
  local transitions, at-least-once delivery, authenticated reclaim, conservative
  double-entry accounting, and original claim/transfer lineage.
- Closed the provider-concurrency and transfer-reclassification gaps without new
  versions: remote mutations now bind an admitted conditional-write profile and
  immutable validator without pretending to be locally fenced, while capacity
  transfer freezes its complete accounting hierarchy, lane, class, residency,
  and authorization lineage.
- Closed the remaining unconditional-mutation and capacity-class escape hatches
  without new versions: reviewed unconditional mutations now redeem a one-owner,
  revocable, attempt-bounded guarded exception, while existing capacity classes
  are immutable and only future unallocated parent capacity can be resized by a
  fenced, simulated, separation-of-duties policy that preserves protected floors.
- Bounded the interval between dispatch authorization and provider transmission:
  admitted receipts now expire, recheck current fences at a single-use start
  claim, bind the exact worker/provider/request attempt, and treat an uncertain
  start as `OutcomeUnknown` instead of retryable work.
- Gave every capacity-policy lineage one parent and one atomic activation
  boundary over its co-located ledger and independently governed floor set;
  multi-parent rollout now remains conservatively under-allocated until each
  parent transition is durably acknowledged.
- Bound every transmission-start claim to one globally unique claim, exact
  worker instance and lease generation/fence; non-persisted permit material is
  returned once, while ambiguous delivery, duplicate workers, or takeover route
  to reconciliation.
- Made multi-parent capacity rollout depend on a hierarchy-root-owned canonical
  membership manifest, unchanged root epoch, complete prepared-receipt set, and
  total per-class conservation before finalization.
- Added independent protected-floor governance with a separate capability and
  approval lineage, operational-state fences, obligation simulation, platform
  minima, append-only history, and cross-command separation from policies that
  spend released capacity.
- Made root rollout finalization permission-only: every parent must freshly
  CAS-revalidate its ledger, unallocated capacity, floors, obligations, manifest,
  and current operational authority or remain conservatively blocked/reconciling.
- Located non-persisted start permits inside a trusted transmission executor
  that owns both claim and provider socket; split services exchange immutable
  instructions/status only, and transferable permit profiles remain unsupported.
- Versioned and durably ratcheted platform safety floors so stale/lower nodes,
  mixed-version rollout, downgrade, rollback, lower defaults, failover, and
  restore cannot silently release protected capacity.
- Added local and GitHub verification gates without a crate publication path.
