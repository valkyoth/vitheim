# Implementation Work Packages And Model Bindings

Status: normative implementation-entry policy

## ImplementationWorkPackageV1

Before a stop enters `Implementing`, it must have one
`ImplementationWorkPackageV1` file under
`docs/implementation/work_packages/`. The package is a strict line-oriented
`key=value` record so project-owned shell tooling can validate it without a
third-party parser.

Required keys are:

- `schema`, `stop_id`, `package_generation`, and `status`;
- `authority_owner` and `primary_transition_or_boundary`;
- `crates_and_files`, `schema_migration`, and `external_boundary`;
- `prerequisites` and `excluded_neighbor_scope`;
- `verification_owners`, `rollback_or_refusal`, and `pentest_question`; and
- `independently_shippable_units`.

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
`crates_and_files` value as that stop's executable-owner reference. Updating a
package therefore updates the generated closure and makes stale planning-owner
claims detectable.

## ExecutableModelBindingV1

`docs/implementation/critical_model_stops_v1.txt` is the closed initial list of
critical state-machine stops. Each has exactly one row in
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

The critical list grows when a milestone introduces a new authority-bearing
state machine. Removing a stop or marking a critical transition noncritical
requires an explicit security review and successor record; it cannot be done
merely to satisfy the checker.

`scripts/check_implementation_work_packages.sh` validates both schemas,
required package coverage, closed critical-model coverage, exact stop
existence, uniqueness, planned-owner honesty, and stable identifier shapes.
