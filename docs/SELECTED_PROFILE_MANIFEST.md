# Selected Production Profile Manifest

Status: normative implementation-selection and closure policy

`docs/selected_profile_manifest_v1.txt` is the canonical
`SelectedProfileManifestV1` for `VITHEIM-PRODUCTION-V1` generation 2. It turns
the 425-stop planning superset into a machine-checked production selection and
versioned capability-dependency graph before foundation implementation
proceeds.

Generation 2 succeeds the generation-1 selected graph without changing any
stop's selection or product scope. It adds independently retained minimum
edges and non-weakening refinement/order enforcement. Generation 1 remains
historical evidence and cannot be used for new implementation admission.

Every exact stop has one row containing:

- `Mandatory`, `OptionalSelected`, `Deferred`, or `Unsupported`;
- zero or more independently generated `declared_minimum_dependencies`;
- the effective `capability_dependencies` and their `DeclaredMinimum` or
  `PackageExact` state;
- convergence increment, one or more independently operable delivery slices,
  and exact claims that require the row;
- capability and current executable-owner reference;
- integration and final retest owners;
- required storage, identity, and runtime profiles;
- the successor rule after a skipped version;
- its support-claim boundary; and
- dependency direction plus the selection reason.

`DeclaredMinimum` edges are independently generated reviewed architectural
prerequisites available before implementation entry; they are not falsely
called package-exact. `ImplementationWorkPackageV1` supplies the effective,
comma-separated `PackageExact` set without replacing the recorded minimum.
Every minimum edge must remain exact. Removing one requires an approved
`DependencySupersessionV1` record naming the edge, reason, affected
requirement/invariant/model IDs, replacement owner, security reviewer,
generation/digest, and negative/integration evidence. Editing a package alone
cannot weaken the graph. A stop cannot enter implementation until its exact
edge set is selected, numerically earlier, acyclic, and agrees with the
package. Production cannot pass while any selected row remains
`DeclaredMinimum`.

`specified:` owners are planning references, not executable evidence. A
validated work package replaces that default with its normalized status and
exact crate/file ownership; the generated row therefore advances with the
implementation-entry record instead of being edited by hand. Before a selected
stop becomes Implemented, its work package and manifest row must name the
actual crate and stable code owner. Before any profile becomes Supported, every
transitive selected row must be Implemented, carry its immutable evidence
references, and pass its own exact-commit pentest. `1.0.0` cannot inherit
support from a `specified:` or `planned:` owner.

Deferred and Unsupported rows are outside the default production closure and
must remain outward-only. Selected rows may not depend on them. Once a higher
selected minor is implemented, any
later implementation of a skipped lower minor receives a new successor minor;
the old row remains immutable evidence of what was not selected.

The two delivery slices are operational checkpoints, not competing product
truth. `required_for_claims` defines their exact closure:

- `core-service-operations` proves the service-management path;
- `security-asset-operations` proves SecOps, asset/service, graph, discovery,
  and correlation paths; and
- search and knowledge rows `0.286.0–0.300.0` are shared by both rather than
  being assigned only to security operations.

The combined production-v1 claim requires both slices plus all
`production-common` rows. A checkpoint may produce operational feedback but
cannot be labelled Vitheim `1.0.0` or silently omit the other selected slice.

`OptionalSelected` rows explicitly name every claim that requires them.
`0.277.0`, for example, depends on the selected `0.267.0` kind pack and both
are required by the security/asset checkpoint and combined production claim.
`0.424.0` and `1.0.0` depend on all four promoted optional profiles; a label
alone cannot bypass their implementation and evidence.

`scripts/check_selected_profile_manifest.sh` regenerates the manifest from the
canonical implementation headings and work packages, verifies exact
cardinality, resolves every multi-edge dependency, performs graph-wide cycle
detection, rejects same-version/future prerequisites, prevents
selected-to-deferred dependencies, checks optional promotion and claim
closure, enforces outward-only optional code, proves PackageExact is a
non-weakening refinement or has an approved supersession, compares package
prerequisites, and preserves PostgreSQL-first plus advanced-retirement refusal.
