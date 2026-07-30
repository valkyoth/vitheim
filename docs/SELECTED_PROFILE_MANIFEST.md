# Selected Production Profile Manifest

Status: normative implementation-selection and closure policy

`docs/selected_profile_manifest_v1.txt` is the canonical
`SelectedProfileManifestV1` for `VITHEIM-PRODUCTION-V1` generation 1. It turns
the 425-stop planning superset into an exact, machine-checked production
selection before foundation implementation proceeds.

Every exact stop has one row containing:

- `Mandatory`, `OptionalSelected`, `Deferred`, or `Unsupported`;
- its selected-closure predecessor;
- convergence increment and independently operable delivery slice;
- capability and current executable-owner reference;
- integration and final retest owners;
- required storage, identity, and runtime profiles;
- the successor rule after a skipped version;
- its support-claim boundary; and
- dependency direction plus the selection reason.

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
must remain outward-only. Once a higher selected minor is implemented, any
later implementation of a skipped lower minor receives a new successor minor;
the old row remains immutable evidence of what was not selected.

The two delivery slices are operational checkpoints, not competing product
truth:

- `core-service-operations` proves the service-management path; and
- `security-asset-operations` proves SecOps, asset/service, graph, discovery,
  and correlation paths.

The combined production-v1 claim requires both slices plus all
`production-common` rows. A checkpoint may produce operational feedback but
cannot be labelled Vitheim `1.0.0` or silently omit the other selected slice.

`scripts/check_selected_profile_manifest.sh` regenerates the manifest from the
canonical implementation headings, verifies exact cardinality, computes the
selected predecessor closure, rejects cycles through non-increasing
predecessors, prevents selected-to-deferred dependencies, enforces outward-only
optional code, and preserves PostgreSQL-first plus advanced-retirement refusal.
