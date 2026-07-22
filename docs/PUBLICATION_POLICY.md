# Publication And Licensing Policy

## Current Rule

No Vitheim package may be published to crates.io or another registry. Every
package manifest must contain `publish = false`. CI and release workflows may
validate metadata and artifacts, but must contain no registry token and invoke
no publication command.

Internal packages use exact workspace path versions so a build never resolves
an identically named registry package. `Cargo.lock`, Cargo metadata, the SBOM,
and source-policy checks must contain no registry or git package source.

## Future SDK Exception

Only a separately reviewed public SDK may become publishable. That decision
requires:

- a stable consumer use case and compatibility promise;
- a deliberately small API without internal storage/runtime types;
- security and abuse-case review;
- an independent package and release plan;
- explicit approval to use `MIT OR Apache-2.0`;
- registry ownership, provenance, signing, and recovery procedures;
- an exact allowlist change limited to the SDK packages.

The exception never implicitly relicenses Vitheim's EUPL-1.2 platform crates.

