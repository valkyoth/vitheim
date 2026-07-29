# Vitheim 0.1.0

Release date: Unreleased
Status: Draft

## Goal

Establish a buildable, auditable, dependency-free repository and security
baseline. This is not a production release.

## Changes

- Pinned Rust 1.97.1 with Rust 2024 edition and resolver 3.
- Added private `no_std` foundation crates and a private facade.
- Added repository policy, CI, documentation, release, and pentest gates.
- Added detailed implementation handoffs for 346 exact release stops: 150
  base `0.x.0` stops, 195 companion stops, and the `1.0.0` production stop.
- Added focused roadmap stops for executable state-machine models, early policy
  and redaction contracts, broader service management, policy-filtered
  subscriptions, pre-SecOps topology, cloud/ephemeral asset kinds, privacy
  requests, inbound service-desk mail, and signed security-audit export.
- Expanded the compliance/risk phase with concrete pack dependencies and
  overlays, signer rotation, applicability, continuous-control evidence,
  exception precedence, redaction/export, rebuild, and conflict simulation.
- Added stable functional/operational requirement ownership with phased
  exhaustive backfills, producing/consuming crate and schema/test/retest owners.
- Split customer, supplier, procurement, continuity, and first-party asset-kind
  work into independently implementable and pentestable companion stops.
- Added explicit authorization, workflow/notification, search/history,
  workspace/admin, API/SDK/subscription, import/export/configuration,
  cross-surface differential, and lifecycle/recovery integration ownership.
- Added early opaque service/asset/agreement references and a conditional
  representative cloud-native discovery profile with an explicit
  manual/generic-import-only fallback.
- Clarified that an implementation-admission record never grants a third-party
  dependency exception; the repository-wide prohibition remains binding.
- Added a whole-roadmap scope audit and small-loop rule, splitting 18
  overloaded families into 65 independently implementable and pentestable
  companion stops without deleting their cumulative security context.
- Added evidence-state and canonical-roadmap governance so specified,
  implemented, conditional, supported, and unsupported claims cannot be
  conflated, and count drift blocks release.
- Enforced the 500-line Rust source limit and no-third-party baseline.
- Made repository verification portable to GitHub-hosted runners without an
  undeclared ripgrep installation.

## Security

- Threat-model delta: initial trust boundaries and non-goals established.
- Attack-surface delta: source repository and CI only; no networked runtime.
- Pentest report: `security/pentest/v0.1.0.md`

## Verification

- `scripts/checks.sh`
- `scripts/generate-sbom.sh --check`
- `scripts/release_0_1_gate.sh` after the pentest report passes

## Compatibility And Migration

None. All APIs are pre-production.

## Known Limitations

- No hosted runtime, persistence, API, workflow, or application capability.
- The pentest report is not yet complete; release is blocked until it passes.
