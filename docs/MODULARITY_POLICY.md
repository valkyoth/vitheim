# Modularity Policy

## Hard Limits

- No Rust source file may exceed 500 physical lines.
- A file approaching 400 lines triggers a split review before feature work.
- Modules split by responsibility, trust boundary, invariant, or protocol—not
  merely into arbitrary numbered fragments.
- Every Cargo package is private with `publish = false`.
- Inner crates are `#![no_std]`; allocator use must be explicit and documented.
- No cyclic crate dependencies and no dependency from an inner layer to a
  hosted layer.
- Facades contain re-exports and small policy glue, not full implementations.

`scripts/check_workspace_policy.sh` enforces the current source line limit,
`no_std` library policy, publication policy, and absence of registry/git Cargo
sources.

## Adding A Crate

A new crate requires a release-plan owner, a single responsibility, a declared
N0/N1/H layer, public API scope, threat-model delta, dependency direction,
test strategy, and documentation. Crates are not created merely to reserve a
name.

Hosted crates may use `std` only when their responsibility is intrinsically
hosted. Their interfaces accept and return project-owned types and traits so
runtime, database, protocol, and UI implementations remain replaceable.

## Testing Boundary

Each crate owns unit tests for its invariants. Cross-crate behavior uses
integration or conformance tests. Adapters must pass one shared semantic
testkit; duplicating weaker backend-specific assertions is insufficient.

