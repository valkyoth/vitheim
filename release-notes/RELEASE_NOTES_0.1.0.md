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
- Added detailed implementation handoffs for all 160 planned milestones and a
  completeness check that prevents missing version plans or pentest stops.
- Enforced the 500-line Rust source limit and no-third-party baseline.

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
