# Implementation Work Packages And Model Bindings

Status: normative implementation-entry policy

## ImplementationWorkPackageV1

Before a stop enters `Implementing`, it must have one
`ImplementationWorkPackageV1` file under
`docs/implementation/work_packages/`. The package is a strict line-oriented
`key=value` record so project-owned shell tooling can validate it without a
third-party parser.

`docs/implementation/executable_test_inventory_v1.txt` is the corresponding
`ExecutableTestInventoryV1`. Each implemented test ID resolves to one exact
workspace symbol and one executable project-owned script runner. The runner
must list the exact stable ID through `--list-test-ids` and execute only that
registration through `--run-test-id ID`; it may wrap Cargo test or nextest,
but an unchecked Cargo target string is not a registration. `registered`
permits implementation work; `implemented` additionally requires an
`ExecutableTestEvidenceV1` row binding passed result, source and runner
digests, exact Rust toolchain, candidate commit, and evidence artifact/digest.
A planned identifier belongs in a work package or model binding with a
`planned:` marker, not in this inventory.
`docs/implementation/executable_symbol_inventory_v1.txt` likewise binds each
implemented model or persistence owner reference to an existing Rust source
file and declared symbol. A plausible-looking `crate::module::symbol` string
without that checked registration is not implementation evidence.

Required keys are:

- `schema`, `stop_id`, `package_generation`, and `status`;
- `authority_owner` and `primary_transition_or_boundary`;
- `crates_and_files`, `schema_migration`, and `external_boundary`;
- `prerequisites` and `excluded_neighbor_scope`;
- `verification_owners`, `rollback_or_refusal`, and `pentest_question`; and
- `independently_shippable_units`;
- `critical_model` plus a reviewed `critical_model_rationale`;
- `changed_path_allowlist` and `admission_base_commit`; and
- stable `test_ids`.

Authority, primary boundary, schema/migration, and external-boundary fields are
single-valued. `none` is a value, not omission. A package with two
independently shippable units fails admission and must become two minor
releases. The checker cannot infer architecture from prose; the recorded
single-unit assertion is therefore reviewed beside the exact crate/file diff,
schema delta, rollback path, and pentest question at implementation entry.

The first required package is `0.2.0`, because `0.1.0` is the reopened
repository-governance baseline and `0.2.0` is the next product implementation
stop. Later packages are added immediately before their stop starts. Any stop
whose plan status is `implementing`, `implemented`, `awaiting pentest`, or
`ready to tag` without a package is rejected.
The selected-profile generator consumes each package's status and
`crates_and_files` value as that stop's executable-owner reference and consumes
its exact comma-separated `prerequisites` as `PackageExact` dependency edges.
The independently generated `declared_minimum_dependencies` remain visible.
PackageExact must be their superset unless every removed edge has one approved
`DependencySupersessionV1` security record. Updating a package therefore
cannot silently erase reviewed architecture.

At `planned`, a package may use `planned:` test IDs and the sentinel
`not-set-until-implementing`. Before `implementing`, it freezes an existing
base commit, exact relative path roots/globs, and registered executable test
IDs. The checker compares the stop's graph edges, verifies path roots, and, for
an active implementation package, rejects changed paths outside the allowlist.
After `implementing`, every package test must be implemented with immutable
evidence. Registered runners are resolved, list-checked, and executed by the
implementation gate.
Conceptual cohesion and excluded-neighbor absence remain explicit review
questions; the checker does not pretend text proves them.

For the current `0.2.0` handoff, the state transitions are deliberately
separate:

1. `planned` preserves the three `planned:VIT-TST-ID-*` intentions and the
   unset admission-base sentinel; it authorizes no code claim.
2. Entry to `implementing` freezes an existing base commit, keeps the package's
   one-unit/path/prerequisite boundary, registers exact source owners and
   project-owned test runners, and changes the Phase A and package statuses
   together.
3. Entry to `implemented` requires the admitted source plus passing positive,
   negative, and fuzz/property coverage, with immutable test-evidence rows for
   the exact candidate.
4. `awaiting pentest` and `ready to tag` remain unavailable until the exact
   implementation commit has its scoped security assessment and every finding
   is resolved or explicitly blocking.

The next stop does not receive an implementation package merely because
`0.2.0` is compiling. It waits for this sequence to close, which keeps the
small-pass and exact-commit security boundaries real.

## ExecutableModelBindingV1

`docs/implementation/critical_model_stops_v1.txt` is the reviewed minimum set
of already identified critical state-machine stops. It is not called complete
merely because all its rows have bindings. Each has exactly one row in
`docs/implementation/executable_model_bindings_v1.txt` containing:

- a stable model and stop ID;
- stable state/transition and invariant IDs;
- Rust owner symbols and persistence owner;
- positive, negative, model, fault, and restore test IDs; and
- binding status.

A `planned:` Rust owner is honest only while the stop is planned. The
implementation-status commit must replace it with exact stable Rust symbols
and make the registered tests executable. An adapter correspondence claim must
reference the same transitions and fault/restore IDs; prose similarity is not
correspondence evidence.

Every work package must decide `critical_model=true|false`. Aggregate,
lifecycle, lease/fence, custody, policy, external-effect, or other
authority-bearing work defaults to `true`; `false` requires a concrete reviewed
rationale. A true package must already exist in the critical registry and
binding file. Removing a stop or marking a critical transition noncritical
requires an explicit security review and successor record; it cannot be done
merely to satisfy the checker.

`scripts/check_implementation_work_packages.sh` and
`scripts/check_executable_test_inventory.sh` validate the package, model,
symbol, test-registration, and test-evidence schemas, required package
coverage, reviewed critical-model coverage, exact stop
existence, uniqueness, control-ID existence, transition/test-ID uniqueness,
planned-owner honesty, package criticality, exact dependency agreement, path
roots/allowlists, stable identifier shapes, source-file/symbol registration,
runner existence/executability/listing, actual test execution, and immutable
evidence bindings. Implemented symbol and test evidence becomes mandatory when
a binding leaves `planned`.
