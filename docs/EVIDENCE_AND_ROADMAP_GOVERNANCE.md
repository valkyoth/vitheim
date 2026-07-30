# Evidence And Roadmap Governance

Status: normative planning and release-governance policy

## Current Evidence Boundary

Vitheim is currently an implemented `0.1.0` repository/N0 scaffold whose
release status is reopened. The private `no_std` foundation crates, workspace
policies, CI configuration and local checks are executable evidence for that
limited scope. The command/event kernel, tenant model, journal, adapters,
product domains, policy engine, workflow runtime, plugin host, federation and
AI capabilities are specified plans until their own versioned implementation
and evidence gates pass.

Planning detail is never implementation evidence. A type name, state machine,
test requirement, authority row, release-table entry or option decision proves
only that a requirement is specified. README, API, UI, release notes, support
matrices and operator output must not describe a specified or conditional
capability as available.

## Evidence Vocabulary

Every version and externally visible capability uses one of these evidence
states independently of its planning status:

| Evidence state | Meaning |
| --- | --- |
| `Specified` | Normative contract exists, but no complete executable owner and passing evidence set exists |
| `Implementing` | Code is under construction; support and compatibility claims remain forbidden |
| `Implemented` | Executable owner and required local tests exist for the exact versioned scope |
| `Conditional` | Implementation exists, but support depends on an exact backend, provider, topology, protocol or deployment profile whose conformance evidence is named |
| `Supported` | The exact implementation/profile passed every required release, security, compatibility and operational gate |
| `Unsupported` | The capability/profile is intentionally refused or excluded; absence must be explicit and fail closed |

`Implemented` does not imply `Supported`. `Conditional` without a selected,
passing profile is operationally unsupported. A capability can move forward
only through immutable evidence references; rollback, missing evidence or a
failed freshness/retest requirement moves readiness to a more restrictive
state without rewriting its history.

Each exact release stop records:

- source commit and candidate tree;
- implemented crate/binary owners and N0/N1/H dependency graph;
- invariant/law/profile versions and exact supported scope;
- positive, negative, boundary, property/model, fuzz, crash, restore,
  migration, tenant-pair and conformance evidence required by the change;
- toolchain, dependency, SBOM, artifact and provenance digests;
- pentest report for that exact commit and its remediation/retest lineage; and
- explicit `Supported`, `Conditional` and `Unsupported` claims.

Documentation-only completion is impossible. If a stop has no executable owner
or its required evidence is unavailable, the stop remains `Specified`,
`Implementing` or `Conditional` and cannot be tagged.

## Canonical Roadmap Cardinality

The roadmap contains exactly **425 independently pentestable release stops**:

`424 pre-production minor stops + 1 production stop = 425`.

This is the architectural/evidence superset, not a serial mandate that all 424
pre-production capabilities become Supported before `1.0.0`. The
[Implementation Convergence Plan](IMPLEMENTATION_CONVERGENCE_PLAN.md) selects
the mandatory core and integration increments. Production consumes that
profile's complete transitive dependency/evidence closure plus any optional
profile explicitly selected for the candidate. Unselected entries remain
discoverably non-shipping and cannot satisfy or broaden a core claim.

Every planned pre-production stop is one `0.N.0` release in the contiguous
`0.1.0–0.424.0` sequence. Patch versions are unplanned corrective maintenance,
not capability containers. See
[Release Granularity Standard](RELEASE_GRANULARITY_STANDARD.md).

`scripts/check_implementation_plan.sh` is the current machine-checked stop
manifest: it requires every contiguous pre-production minor release plus
`1.0.0` and 425 exact-commit pentest markers. Reopened `0.1.0` must replace that
embedded sequence with, or generate it from, one canonical machine-readable
roadmap manifest. The README, release plan, release notes, phase index,
authority-review coverage and checker expectations must be generated or
verified from the same manifest. A count mismatch is a release blocker.

The exact production selection is
[`SelectedProfileManifestV1`](SELECTED_PROFILE_MANIFEST.md) generation 1,
materialized as `docs/selected_profile_manifest_v1.txt`. Its 425 rows bind
selection state, predecessor closure, independently operable delivery slice,
executable-owner state, required profiles, retests, skip/successor behavior and
support boundary. A `specified:` owner is not implementation evidence.
`0.398.0` revalidates this established closure and may narrow support; it cannot
invent a production selection at the end of the program.

Before a selected stop enters implementation, its checked
[`ImplementationWorkPackageV1`](IMPLEMENTATION_WORK_PACKAGES.md) and applicable
`ExecutableModelBindingV1` must be complete. These records make entry
admission, scope splitting and model ownership auditable without promoting
planned code to an implemented evidence state.

Owner policy requires a pentest whenever an exact stop is implemented/tagged.
The audit recommendation to weaken that per-stop requirement is not adopted.
Scope and depth remain proportional to the change, but no implemented stop may
silently relabel a review, scan or regression run as the required pentest.
A deferred/Unsupported stop has no passing pentest and grants no capability.

## First-Implementation And Production-Profile Law

An exact protocol, dependency, cryptographic primitive, database, identity
provider, scanner, runtime, object store, KMS, connector or external authority
is admitted at its first consuming milestone. Its admission record binds the
normative snapshot, options/features, source/license, implementation version,
trust boundary, known-answer and negative corpus, fuzz/interoperability
evidence, replacement boundary, maintenance owner and unsupported
combinations. `0.371.0–0.398.0` revalidate and freeze already evidenced
choices; they cannot be the first selection or retroactively legitimize code.

The current no-third-party-Cargo rule remains binding. The audit proposal to
relax it for hosted code is not authorization. If a safe TLS, cryptographic,
identity, database, Wasm or other hosted implementation cannot be delivered
under current policy, that capability remains `Unsupported` until the owner
approves a separate explicit policy change with its security and licensing
review. A milestone implementation-admission record inventories and evaluates a
candidate; it is never that policy change and never grants a scoped exception.
If policy changes in the future, N0/N1 remain dependency-free, Hosted admits
only exact allowlisted dependencies behind project-owned ports, and no
third-party type may cross an inward-facing API.

The selected `1.0.0` core is the ITSM/SecOps/asset/workflow profile defined by
the convergence plan. Its storage and extension set is intentionally narrow:

- in-memory semantics, SQLite single-node and PostgreSQL HA may become default
  storage profiles;
- MySQL, MongoDB and SurrealDB remain experimental unless their exact profiles
  independently pass and a pre-production decision promotes them;
- optional AI, federation, semantic search and vendor connectors remain
  disabled unless separately selected and evidenced; and
- support claims name exact protocol, provider, topology and platform
  profiles—never “all databases,” “all providers,” or generic compatibility.

No experimental milestone or test is removed. An unpromoted implementation
continues to receive its planned conformance, compatibility and pentest work
without entering the default production support matrix.

## Executable Protocol Specifications

Large phase files are roadmap ledgers, not implementation modules. Before a
protocol receives executable code, its implementing stop extracts a focused
normative package organized by stable protocol/invariant owner. Each package
must name:

- semantic types and canonical codec;
- closed state machine and typed outcomes;
- sole owner, authority and separation-of-duties boundaries;
- transaction, lock-rank and external-effect cuts;
- budgets, failure behavior and unsupported states;
- retry, reconciliation, checkpoint, archive, restore and migration model;
- conformance manifest and positive/negative/model/fuzz/crash corpus; and
- links to the governing version, invariants, laws, threats and decisions.

New normative protocol files should remain below 500 physical lines and split
by responsibility before approaching 400 lines. Splitting cannot create
multiple authorities or duplicate normative prose. The invariant/law registry
introduced at `0.25.0` owns the generated cross-reference index and rejects an
implemented protocol with missing, duplicated or contradictory owners,
states, transactions, recovery paths or conformance manifests.

This extraction is incremental. Existing planning detail remains authoritative
until its implementing milestone produces the focused package and verifies
semantic equivalence; wholesale deletion or summarization of earlier controls
is forbidden.

## Requirement Ownership

Invariant and law registries cover authority-bearing guarantees but do not own
every functional, operational, migration, support, or integration requirement.
`0.36.0` therefore introduces a separate stable `VIT-REQ-*` registry and
bidirectional checker. Each entry binds one immutable description and source,
exactly one primary implementation stop, predecessors, producing/consuming
crates, schema/migration owner, primary test/conformance owner, later
integration/retest stops, and planned/implemented/superseded/deferred lifecycle.

`0.45.0` backfills Phases A/B; `0.90.0` backfills Phase C; and
`0.91.0–0.93.0` backfill Phases D through production before Phase D begins.
Every later introducing stop registers new requirements before exit. Generated
views prove source-to-registry and registry-to-source coverage, one primary
owner, valid predecessors/crates/tests, and live integration/retest ownership.
A cumulative ledger heading is context, not ownership; a requirement entry is
coordination metadata, not an authority source and cannot override a
`VIT-INV-*` or `VIT-LAW-*` owner.

At `0.37.0`, source discovery becomes prospective. Every in-scope normative
block has an adjacent `<!-- vitheim-requirement VIT-REQ-NNNN -->` marker or a
stable structured-manifest origin; the registry records that immutable anchor,
canonical text digest, primary owner, integration/retest owners, and symmetric
supersession lineage. Mutable line numbers are diagnostic only. The checker
scans designated normative sources for requirement-bearing MUST, never, only,
invariant, verification, and exit-condition blocks and rejects missing,
duplicate, stale, or conflicting bindings. Templates, quotations, and examples
need bounded typed exceptions rather than an unchecked ignore list.

## Domain Manifests And Surface Contributions

`0.95.0` introduces a small `DomainManifest`, keyed by dedicated stable
`DomainId`, owning crate/layer, one-or-more requirement links, classifications,
exact aggregate/stream, command, event, compatibility/upcaster-owner,
application-read, and applicable projector/process-manager references, and
typed extension references. These resolve to the authoritative event and
consumer registries rather than copying definitions. A domain is not a
requirement, and the manifest is an index rather than another universal
metadata authority. `0.98.0` separately checks command emission, event
ownership/evolution, consumer declarations, and generation compatibility for
current applicable owners, then installs the same prospective exit gate for
every later domain rather than declaring future coverage.

`0.96.0` defines the reference envelope and kind catalog. Each reference binds
an authoritative registry/profile, entry ID, schema version, generation/digest,
compatibility, dependencies, supersession, and rollback floor. One complete
compatible metadata generation is admitted atomically. First-party compiled
catalog membership, deployment-profile selection, tenant feature availability,
and signed plugin installation are distinct scopes. Metadata admission never
enables a tenant feature, installs a plugin, grants a license, or authorizes
access; runtime availability remains separately filtered by tenant, policy,
entitlement, license, and installation state. Each `ContributionKindId` also
declares its authoritative registry, lifecycle binding, certification owner,
generated-test obligations, and canonical/schema, fuzz, resource-budget,
concurrency/replay, evidence, migration, failure/recovery and timing/count/
metadata-leakage dimensions.
An omitted dimension fails closed; inapplicability requires a typed reviewed
`NotApplicable` disposition. Unknown kinds, missing obligations, namespace
collisions, dependency/recovery cycles, mixed-version disagreement, downgrade,
partial admission, and plugin attempts to grant authority fail closed. A
reference never grants authorization, exposes a command, or overrides policy
or lifecycle semantics.

`0.99.0` extends the prospective ownership gate across durable asynchronous
contracts only after the full `0.30.0–0.32.0` realization family: effect kind
versus execution identity, message/consumer and timer/activity kinds, poison/
dead-letter policy, replay authorization, quarantine/disposition, retry horizon,
terminal/manual resolution, result/reconciliation, and compensation owners.
`0.100.0` gives every domain an introduction-time retirement lifecycle with
permanent `DomainId` tombstone, command/effect fencing, dependency/work drainage,
data disposition, historical codec/upcaster preservation, reinstall floors,
orthogonal authority/work/data/history evidence, and distinct verified/loss/
blocking terminals. Only `RetiredVerified` is clean. `0.101.0` defines a closed
tenant-versus-deployment scope but executes only exact tenant children with
immutable proposal authority, generation/version checks, separation of duties,
atomic audit/outbox commitment, cancellation and crash recovery. Once `0.152.0`
owns tenant lifecycle/topology, `0.156.0` freezes and safely releases an
authenticated membership cut, `0.157.0` atomically consumes separately approved
exact-cut authority into one admitted parent, `0.158.0` governs successor-plan
lineage and resume authority, `0.159.0` transfers broad topology fencing to a
narrow guard with authenticated post-cut absence/child handoffs, `0.160.0`
jointly roots protection state and successor CAS, `0.161.0` aggregates clean/
non-clean terminals, `0.162.0–0.164.0` own tenant-local residual handoff,
lineage and delivery cuts, `0.165.0` owns mutation classification/emergency
invalidation, `0.166.0–0.169.0` authorize/complete takeover, fund retained
candidate controls, and reconcile barrier release; `0.170.0–0.171.0` own
archival cleanup and independently verified retained namespaces; and
`0.172.0–0.210.0` evaluate reinstall, serialize activation against abort,
redeem source-partition permits, fund every successor-restriction bridge,
reconcile and supersede partial admission, decide and conditionally implement
permanent-unknown quarantine recovery, actively enforce the maximal unknown
restriction over a generated complete operation universe, consume replacement
eligibility into one finite cumulative-budget evaluation lineage whose
exhaustion is permanent, evaluate/admit lowering under separate
non-substitutable authority, create one proof-bound fresh successor from an
exact top-or-lowered tag, carry lowered bridges through closed branch-
consistent partition receipts/roots, the shared lifecycle CAS and funded
ownership without duplication, use distinct guard-slot/candidate/successor
generations for commit-fresh tagged initial/replacement final activation
without double consumption, with every mismatch entering the sole typed shared-
lifecycle revalidation edge and no independent Blocked authority,
supersede the guard, reconcile both reinstall release families, and make the
old top survive until a destination-admitted fully bridged fresh guard CAS plus
expected-version absorbing members, an exact heterogeneous per-member version-
vector commitment, coalesced/saturated pending observations with reserved
terminal capacity, and zero-pending authenticated released-or-funded-retained
predecessor reconciliation, then derive each member budget from governed
policy and worst-case funding, batch-construct and seal immutable member,
transition and retry-ledger geneses, bind the root through a bounded guard CAS,
certify without retroactive mutation, keep source/destination effects local
and parent folds transactional, apply exact saturation arithmetic, constrain
saturated recovery to retry-only authority with a separately versioned
non-resetting ledger, source-fence the complete distributed predecessor
inventory, commit one parent effect intent, locally consume one
activation-bound authorization from one intent-scoped expected-version
issuance scope plus immutable entries while atomically consuming its lifetime-
budget reservation and outbox, and reconcile every contradictory physical
effect under funded conservation, immediately enforce restrictive safety
through any prepared cut, close the complete authorization/delivery universe
and unused reservation legs before terminality, require ABA-resistant physical
status or explicit profile refusal, own unauthorized post-closure effects as
independently funded create-or-join incidents and abandon or replan a no-effect
intent only with a complete delivery closure, fresh predecessor-linked
identities, stable lifetime reservations and explicit fail-closed exhaustion,
replace status-authority continuity only through a fenced predecessor/successor
handoff, charge one prepaid non-wrapping attempt head before each transmission,
admit only worst-case seal bundles that the active backend can publish
through one bounded final CAS, install remote status fences/admission/
activation through authenticated local receipts, recover post-fence failure
only through one fresh bounded successor or permanent refusal, reuse the
canonical transmission-start law and make its live/unknown claim cut block
closure, and keep staged seal work in one codec-pinned cumulative lineage.
Dispatch admission also requires contiguous transitions from genesis;
none uses a wildcard tenant or cross-tenant transaction. Plugin uninstall and
feature disablement
never imply data retirement. `0.414.0` destructively certifies all of these
implementations and cannot first add teardown, campaign, or recovery behavior.

Typed extensions appear only after their vocabulary exists. `0.154.0–0.155.0`
reference and immediately certify the authoritative `TenantDataSurface`
registry; `0.228.0–0.229.0` own
authorization extension/backfill/certification; `0.243.0–0.244.0` workflow and
notification; `0.299.0–0.300.0` search/history; `0.353.0–0.354.0` workspace;
and `0.364.0–0.367.0` external API and transfer/configuration. Later domains
register prospectively, while `0.336.0–0.338.0` certify their applicable
authorization, automation, and search references from current manifest
generations, exact authoritative IDs, deferrals, and product state. `0.369.0`
generates differentials jointly from requirements, manifests/contributions,
and authorization interfaces by iterating every active contribution kind and
its declared dimensions rather than a fixed surface list. `0.413.0` consumes the same model for destructive
full-suite lifecycle/recovery certification and cannot create a reference or handler.

`0.97.0` makes a defer an explicit lifecycle record with implementation
milestone, prerequisite, responsible crate, retest owner, product-state effect,
review/expiry, and closure evidence. No Supported capability, RC, or `1.0.0`
profile can retain an unresolved required defer. Deferral is valid only while a
surface is absent and unimplemented; an existing event schema, tenant-bearing
store, exposed route/read/action, derived surface, emitted effect, or accepted
message must immediately register its structural owner and applicable policy,
lifecycle, deletion/rebuild, and reconciliation behavior regardless of support
wording. Generated checks reject
dangling or disagreeing references and cover attachments/blobs, audit/evidence,
subscriptions/changefeeds, reports/analytics/counts, telemetry, federation/
external replicas, caches, queues, inbox/outbox, and every other tenant-bearing
or derived surface through their authoritative IDs.
