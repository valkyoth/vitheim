# Security Policy

Vitheim is security-sensitive service-operations infrastructure. Treat tenant
boundaries, authorization, command and event envelopes, storage semantics,
workflow execution, search, plugins, AI context, parsers, CI, release scripts,
and future dependency updates as high risk until independently reviewed.

## Supported Versions

Vitheim has not reached a supported production release. No `0.x` version is
approved for production use unless its release notes say otherwise.

## Reporting A Vulnerability

Do not open a public issue containing exploitable details. Use GitHub's private
security-advisory flow for `valkyoth/vitheim`. If that channel is unavailable,
contact the repository owner privately and disclose only enough information to
establish a secure communication channel.

Include affected commit or version, impact, prerequisites, reproduction steps,
and any suggested remediation. Do not include real tenant data, credentials,
secrets, or evidence gathered without authorization.

## Routine Checks

Run these regularly and before releases:

```bash
scripts/checks.sh
scripts/check_latest_tools.sh
scripts/generate-sbom.sh --check
cargo deny check
cargo audit
```

GitHub CodeQL default setup must be enabled in repository settings. Vitheim
must not add an advanced CodeQL workflow while default setup is active. See
[GitHub Security Settings](docs/github-security-settings.md).

## Release Gate

Every release requires a threat-model delta, changed-code review, passing test
and policy gates, an SBOM, and a version-matched pentest report with
`Status: PASS`. The report must name the exact reviewed commit. A tag may be
created only after `scripts/validate-release-readiness.sh vX.Y.Z` passes.

Known findings must be remediated or documented with a time-bounded acceptance
owned by a named risk owner. Critical or high findings block release.

## Dependency Policy

Vitheim currently permits no third-party Cargo crates. All manifests use
private workspace paths and `publish = false`. Introducing an external crate
requires an explicit future policy decision, an architecture boundary,
maintenance and license review, feature and `std` analysis, security evidence,
and a documented reason that first-party implementation would be less safe.

