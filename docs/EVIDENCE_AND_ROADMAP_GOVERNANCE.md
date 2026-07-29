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

The roadmap contains exactly **364 independently pentestable release stops**:

`150 base 0.x.0 stops + 213 companion stops + 1 production stop = 364`.

The public `.0` skeleton still contains 151 base stops when `1.0.0` is
included. “151 base stops” and “364 exact release stops” describe different
views and must always be qualified. The phrases “151 phases,” “225
milestones,” “228 exact stops,” and the superseded “229 exact stops” are not
valid current repository descriptions.

`scripts/check_implementation_plan.sh` is the current machine-checked stop
manifest: it enumerates every companion version, requires every base version,
and requires 364 exact-commit pentest markers. Reopened `0.1.0` must replace
that embedded list with, or generate it from, one canonical machine-readable
roadmap manifest. The README, release plan, release notes, phase index,
authority-review coverage and checker expectations must be generated or
verified from the same manifest. A count mismatch is a release blocker.

Owner policy requires a pentest at every exact stop. The audit recommendation
to reduce that requirement is not adopted. Scope and depth remain proportional
to the change, but no stop may silently relabel a review, scan or regression
run as the required pentest.

## First-Implementation And Production-Profile Law

An exact protocol, dependency, cryptographic primitive, database, identity
provider, scanner, runtime, object store, KMS, connector or external authority
is admitted at its first consuming milestone. Its admission record binds the
normative snapshot, options/features, source/license, implementation version,
trust boundary, known-answer and negative corpus, fuzz/interoperability
evidence, replacement boundary, maintenance owner and unsupported
combinations. `0.140.1–0.140.28` revalidate and freeze already evidenced
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

The default `1.0.0` candidate set is intentionally narrow:

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
introduced at `0.18.3` owns the generated cross-reference index and rejects an
implemented protocol with missing, duplicated or contradictory owners,
states, transactions, recovery paths or conformance manifests.

This extraction is incremental. Existing planning detail remains authoritative
until its implementing milestone produces the focused package and verifies
semantic equivalence; wholesale deletion or summarization of earlier controls
is forbidden.

## Requirement Ownership

Invariant and law registries cover authority-bearing guarantees but do not own
every functional, operational, migration, support, or integration requirement.
`0.18.14` therefore introduces a separate stable `VIT-REQ-*` registry and
bidirectional checker. Each entry binds one immutable description and source,
exactly one primary implementation stop, predecessors, producing/consuming
crates, schema/migration owner, primary test/conformance owner, later
integration/retest stops, and planned/implemented/superseded/deferred lifecycle.

`0.20.5` backfills Phases A/B; `0.30.18` backfills Phase C; and
`0.30.19–0.30.21` backfill Phases D through production before Phase D begins.
Every later introducing stop registers new requirements before exit. Generated
views prove source-to-registry and registry-to-source coverage, one primary
owner, valid predecessors/crates/tests, and live integration/retest ownership.
A cumulative ledger heading is context, not ownership; a requirement entry is
coordination metadata, not an authority source and cannot override a
`VIT-INV-*` or `VIT-LAW-*` owner.

At `0.18.15`, source discovery becomes prospective. Every in-scope normative
block has an adjacent `<!-- vitheim-requirement VIT-REQ-NNNN -->` marker or a
stable structured-manifest origin; the registry records that immutable anchor,
canonical text digest, primary owner, integration/retest owners, and symmetric
supersession lineage. Mutable line numbers are diagnostic only. The checker
scans designated normative sources for requirement-bearing MUST, never, only,
invariant, verification, and exit-condition blocks and rejects missing,
duplicate, stale, or conflicting bindings. Templates, quotations, and examples
need bounded typed exceptions rather than an unchecked ignore list.

## Domain Manifests And Surface Contributions

`0.30.23` introduces a small `DomainManifest`, keyed by dedicated stable
`DomainId`, owning crate/layer, one-or-more requirement links, classifications,
application command/read schema IDs, and typed extension references. A domain
is not a requirement, and the manifest is an index rather than another
universal metadata authority.

`0.30.24` defines the reference envelope and kind catalog. Each reference binds
an authoritative registry/profile, entry ID, schema version, generation/digest,
compatibility, dependencies, supersession, and rollback floor. One complete
compatible generation activates atomically. Unknown kinds, namespace
collisions, dependency/recovery cycles, mixed-version disagreement, downgrade,
partial activation, and plugin attempts to grant authority fail closed. A
reference never grants authorization, exposes a command, or overrides policy or
lifecycle semantics.

Typed extensions appear only after their vocabulary exists. `0.51.3` references
the authoritative `TenantDataSurface` registry; `0.60.3–0.60.4` own
authorization extension/backfill/certification; `0.70.4–0.70.5` workflow and
notification; `0.100.1–0.100.2` search/history; `0.132.3–0.132.4` workspace;
and `0.138.4–0.138.7` external API and transfer/configuration. Later domains
register prospectively, while `0.120.8–0.120.10` certify their applicable
authorization, automation, and search references. `0.145.3` certifies lifecycle
and recovery references and cannot create one.

`0.30.25` makes a defer an explicit lifecycle record with implementation
milestone, prerequisite, responsible crate, retest owner, product-state effect,
review/expiry, and closure evidence. No Supported capability, RC, or `1.0.0`
profile can retain an unresolved required defer. Generated checks reject
dangling or disagreeing references and cover attachments/blobs, audit/evidence,
subscriptions/changefeeds, reports/analytics/counts, telemetry, federation/
external replicas, caches, queues, inbox/outbox, and every other tenant-bearing
or derived surface through their authoritative IDs.
