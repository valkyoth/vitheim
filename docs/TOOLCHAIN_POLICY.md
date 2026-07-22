# Toolchain Policy

Vitheim tracks the latest stable Rust release, including stable patch releases.
The repository currently pins Rust `1.97.1` because the official patch fixes a
compiler miscompilation in `1.97.0`.

## Update Procedure

At least weekly and before every release:

1. Run `scripts/check_latest_tools.sh` with network access.
2. Confirm the latest stable Rust announcement on the official Rust site.
3. Check current registry versions of `cargo-deny`, `cargo-audit`, and
   `cargo-sbom`.
4. Check the latest GitHub Checkout release and pin its full commit SHA.
5. Update the toolchain, CI pins, documentation, lockfile, and changelog in one
   reviewable change.
6. Run the full local gate and every supported-target check.
7. Record compiler behavior changes and required code remediation.

Normal CI remains reproducible and does not make live freshness queries.
Release gates must fail closed if the networked freshness check is stale or
unavailable; a release waits rather than guessing.

## Cargo Crates

No third-party Cargo dependency is currently allowed, so there are no library
versions to refresh. If this policy changes, every dependency must be pinned
through `Cargo.lock`, use minimal features, remain behind a project-owned
adapter, and receive recurring latest-version, maintenance, license,
advisory, and transitive-feature review.

