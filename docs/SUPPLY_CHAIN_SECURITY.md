# Supply-Chain Security

## Current Dependency Baseline

Vitheim has no third-party Cargo dependencies. Workspace packages use exact
path requirements and are private. `scripts/check_workspace_policy.sh`,
`cargo deny`, `cargo audit`, Cargo metadata, the lockfile, and the SBOM provide
overlapping evidence so an external source cannot enter silently.

Development tools are not linked into Vitheim but remain trusted build inputs.
Their versions are pinned in CI and checked against official upstream sources
by `scripts/check_latest_tools.sh`.

## Dependency Admission

No external crate may be added under current policy. A future exception would
require explicit user approval and a document covering:

- why a first-party implementation is riskier or infeasible;
- maintainer history, current version, release cadence, and security process;
- complete direct and transitive license inventory;
- enabled and disabled features, `std`, native code, build scripts, proc
  macros, network access, unsafe code, and platform impact;
- narrow internal adapter API and replacement plan;
- source pin, lockfile, SBOM, advisory, and update process;
- test, fuzz, interoperability, and failure evidence;
- pentest scope and rollback plan.

Security-sensitive protocols such as TLS, identity, database wire formats, and
WASM runtimes must not be replaced by casual in-house implementations merely
to keep a dependency count low. If no acceptable implementation can be used
under policy, the related hosted feature remains unimplemented and fail closed.

## Build And Release Evidence

Every public artifact eventually requires locked inputs, compiler and tool
versions, dependency/license report, SBOM, source tag, checksums, build
provenance, reproducible-build comparison, threat-model delta, and exact-commit
pentest evidence. The current workflow validates metadata only and never
publishes a crate or product artifact.

## GitHub Actions

Actions are pinned by full commit SHA with a human-readable release comment.
Updates verify the tag against the upstream repository, review the changelog,
and retain least privilege. Untrusted pull-request code receives no secrets or
write token.

