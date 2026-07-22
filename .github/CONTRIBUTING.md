# Contributing To Vitheim

Vitheim is security-sensitive service-operations infrastructure. Contributions
must keep boundaries small, deterministic, documented, tested, and honest
about what is production-ready.

## License

Vitheim is licensed under the European Union Public Licence 1.2. By
contributing, you agree that your contribution is provided under that license.
A future separately scoped SDK may adopt MIT OR Apache-2.0 only after an
explicit repository licensing decision.

## Development Setup

Use the pinned toolchain from `rust-toolchain.toml`:

```bash
scripts/checks.sh
```

No Rust source file may exceed 500 lines. Split behavior into focused private
crates or modules before it reaches that limit.

## Security-Sensitive Changes

Treat tenant boundaries, authorization, event integrity, workflows, storage,
search, plugins, AI context, parsers, migrations, CI, release scripts, and
toolchain changes as high risk. Do not post exploitable security details in a
public issue; follow [`SECURITY.md`](../SECURITY.md).

Every behavior change needs tests at the narrowest layer and, when it crosses
boundaries, integration and adversarial tests. Parser or decoder changes also
require property and fuzz coverage before their release milestone exits.

## Dependency And Publication Policy

Third-party Cargo crates are currently forbidden. All workspace packages must
set `publish = false`; `cargo publish` is not part of any workflow. Do not add
registry or git dependencies, publication tokens, or release automation that
uploads crates.

