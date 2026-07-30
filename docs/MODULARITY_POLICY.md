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

## Deployment Shape

The default architecture is a modular monolith: one deployable may compose
independent domain, application, API, projection, and adapter crates without
collapsing their types, authorities, transactions, or dependency direction.
API, worker, ingest, indexer, agent, and CLI processes split only at an
evidenced trust, scaling, failure, availability, or operational boundary. A
process split never creates a distributed transaction or a shared universal
record model.

Optional AI, federation, vendor connectors, plugin storefront, and semantic
index families depend inward on stable ports. The kernel and first-party
domains build and operate without them. UI crates consume the public API
contract and have no domain, repository, dispatcher, or database dependency.

## Protocol Specification Packages

Phase files remain version ledgers. Before implementation begins, the consuming
milestone extracts its protocol into focused normative files organized by
stable invariant/protocol owner. The package separately names semantic types
and codec, closed state machine, authority, transaction/lock order, budgets,
recovery/migration, and conformance corpus. New normative protocol files follow
the same 500-line hard limit and 400-line split review as code.

The invariant/law registry owns a generated index from milestone to focused
package and rejects missing, duplicated, or contradictory owners. Extraction
is incremental and must prove semantic equivalence; it cannot delete or weaken
the detailed source ledger. See
[Evidence And Roadmap Governance](EVIDENCE_AND_ROADMAP_GOVERNANCE.md).

Migration progress, untrusted import staging, activation/cutover, integrity,
evidence custody, capacity/quota, external witness observation, corruption
recovery, and retirement coordination are separate authority families. One
deployable may compose them, but no aggregate, state enum, repository, or
process manager may absorb their internal states. Coordinators persist only
their own expected-version progress plus immutable child request/receipt
references. Cross-owner response loss is reconciled through authenticated
status, never a cross-store transaction or copied child authority.

The 425 roadmap IDs are not permission to build a 425-step serial monolith.
The selected execution/profile overlay is
[Implementation Convergence Plan](IMPLEMENTATION_CONVERGENCE_PLAN.md).

## Testing Boundary

Each crate owns unit tests for its invariants. Cross-crate behavior uses
integration or conformance tests. Adapters must pass one shared semantic
testkit; duplicating weaker backend-specific assertions is insufficient.

Release sizing follows the
[Implementation Scope Audit](IMPLEMENTATION_SCOPE_AUDIT.md): one exact stop
owns one primary authority/adapter/profile and one coherent evidence set.
Crate modularity does not make a multi-authority release small; independently
shippable slices receive independent versions and pentests.
