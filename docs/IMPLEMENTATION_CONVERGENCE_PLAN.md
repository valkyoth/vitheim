# Vitheim Implementation Convergence Plan

Status: normative execution overlay for the 425-stop architectural roadmap.

This document converts the consolidated implementation audit into a finite
delivery strategy. It does not add release stops, weaken an invariant, or make
an unimplemented capability Supported. The detailed roadmap remains the
requirements and evidence catalog; this plan determines which capabilities
form the selected production path, in what integration order they are proven,
and which planning-only or optional profiles may remain unimplemented.

## Non-Negotiable Decisions

1. The owner-mandated repository-wide prohibition on third-party Cargo code
   remains in force. N0, N1, and Hosted crates remain dependency-free until a
   separate explicit owner decision changes policy. An implementation-admission
   record is not an exception.
2. No TLS, cryptographic, database, identity, MIME, Wasm, UI, or observability
   protocol is improvised to evade that prohibition. If a safe project-owned
   implementation cannot be evidenced, the affected Hosted capability and
   production claim are blocked or Unsupported.
3. The 425 exact stops are a planning/evidence superset, not a requirement to
   implement every optional profile serially before `1.0.0`.
4. A capability becomes Supported only at its own exact stop with its complete
   transitive prerequisites and exact-commit pentest. Early spikes, integration
   branches, fakes, or prototypes grant no support claim.
5. A skipped or deferred lower-numbered stop is never implemented later under
   its old release identity. Future implementation requires a new successor
   version and preserves the old Unsupported/Specified evidence.
6. No further gap-analysis finding creates a release number unless it proves a
   genuinely independent missing authority owner or production-critical
   implementation boundary. Acceptance details go into the existing owner.
7. Confirmation-only reviews close without roadmap expansion. Once an admitted
   package exists, concrete implementation, model, adapter, failure-injection,
   recovery, or pentest evidence is the source for corrective scope. A split is
   justified only when that evidence proves a separately shippable owner,
   prerequisite, migration, rollback/refusal, or pentest boundary.
8. Every review is reconciled against the actual current commit and workspace,
   not the revision or file inventory asserted by the review. Findings from a
   stale snapshot must reproduce on the current tree before they can alter a
   version, dependency, evidence state, or support boundary.

## Consolidated Finding Dispositions

| Finding | Disposition |
| --- | --- |
| G-01 Hosted dependency contradiction | Retain the owner-selected no-third-party policy. Execute `0.38.0` as a time-bounded feasibility/no-go owner, not a mandate to reimplement mature TLS, cryptography, PostgreSQL, OIDC, or hostile-input stacks. Missing safe dependency-free technology immediately marks the capability Unsupported and blocks later Hosted implementation plus the `0.398.0` production gate. |
| G-02 425-stop serial production path | Replace serial-all-stops interpretation with the selected mandatory-profile dependency closure and the capability increments below. Optional/deferred stops do not block the selected core claim. |
| G-03 logical Phase C/retirement monolith | Enforce the authority decomposition below. Dynamic built-in-domain retirement/reinstall is not in the default v1 profile; tenant deletion and safe plugin uninstall remain separate mandatory lifecycles. |
| G-04 oversized milestone prose | Treat phase ledgers as context only. Before code, each owner extracts a focused protocol package and executable model. No coordinator may absorb child state machines merely to avoid another file or crate. |
| G-05 late persistent authenticated slice | Preserve numeric ownership. `0.119.0–0.121.0` provide a PostgreSQL-backed transport/domain test slice with static identity facts only. The first production-authenticated incident proof occurs after `0.225.0`, consumes rather than duplicates every earlier owner, and cannot back-promote the test slice. |
| G-06 premature five-store/migration scope | PostgreSQL is the reference production backend; SQLite is a bounded local/single-node profile. MySQL, MongoDB, SurrealDB, and online arbitrary-backend migration remain experimental/deferred unless separately promoted by evidence. |
| G-07 late technology choices | The Increment 0 dossier and bounded spikes complete before affected Hosted API, schema, or adapter contracts freeze. Final `0.371.0–0.398.0` decisions revalidate; they do not make the first selection. |
| G-08 prose-only protocols | Retain `0.44.0` and `0.56.0`; every critical later state machine must register an executable finite model and adapter correspondence before its own exit. |
| G-09 qualitative performance/recovery | Every implemented deployment profile carries a versioned quantitative workload envelope from the first vertical slice onward. “Bounded” without numeric values is not passing evidence. |
| G-10 unclear first topology/TCB/UI stack | Increment 0 freezes the first single-node process/TCB boundaries and the exact HTTP/TLS/identity/UI technology disposition. HA remains a later extension of an operated profile. |
| G-11 broad product boundary | The v1 capability contract and explicit non-goals below govern API, UI, installer, documentation, and connector claims. |
| G-12 placeholder foundation types | Existing `0.2.0` and `0.3.0` are hard gates before envelopes, durable schemas, or tenant-bearing authority code. |
| G-13 selected closure remained prose | Make `SelectedProfileManifestV1` an exact 425-row machine-checked artifact owned by reopened `0.1.0`; use zero-or-more capability edges, graph-wide cycle/selection validation, claim-specific closures and work-package exact refinement rather than calling a previous-mandatory serial chain a transitive dependency graph. Generation 2 is the current non-weakening successor. |
| G-14 small-pass/model admission remained prose | Add `ImplementationWorkPackageV1`, the concrete `0.2.0` package, a reviewed minimum critical-model set, `ExecutableModelBindingV1`, and project-owned validation before implementation begins. Every entering package decides criticality with rationale; a list is never called complete merely because its existing rows have bindings. |
| G-15 PostgreSQL/SQLite order contradicted the selected profile | Assign PostgreSQL to `0.57.0` and bounded SQLite to `0.58.0`; keep PostgreSQL mandatory and SQLite separately selected. |
| G-16 mandatory retirement certification consumed refused implementations | Keep the advanced `0.100.0–0.101.0` and `0.156.0–0.210.0` program Unsupported. Redefine default `0.414.0` as refusal, installed/disabled-state, retained-history, tenant-deletion/plugin-uninstall separation and no-exposed-retirement-path certification. A future selected successor owns destructive retirement certification. |
| G-17 delivery and optional-profile closure were ambiguous | Give rows explicit `required_for_claims`, allow multiple delivery slices, share search/knowledge `0.286.0–0.300.0` across both checkpoints, place `0.102.0–0.118.0` in service foundations, and make `0.424.0`/`1.0.0` depend on all promoted optional profiles. |
| G-18 package/model checking was predominantly syntactic | Require exact package prerequisites, path roots/allowlists, base commit, test IDs and criticality rationale; validate graph agreement, registered control IDs, unique transition/test IDs, and resolvable owners once implementation begins. Reviewer judgment remains required for conceptual cohesion. |
| G-19 stale companion-version report | The companion file is absent and stays absent. Do not recreate a second version authority from a stale untracked-file observation. |
| G-20 PackageExact could silently weaken the reviewed minimum | Preserve `declared_minimum_dependencies` independently beside effective package edges. PackageExact is a superset unless an approved `DependencySupersessionV1` binds the removed edge, affected controls, replacement, reviewer, digest and tests. |
| G-21 acyclic dependencies could point to future implementation stops | Retain graph-wide cycle detection and also reject every same-version or numerically later prerequisite. Later integration is a retest owner or successor stop, never time-travel in an earlier work package. |
| G-22 registered tests were syntactic rather than executable | Resolve every test through the symbol inventory and an executable project-owned list/run script. `ExecutableTestEvidenceV1` binds implemented source, runner, toolchain, candidate commit, result and evidence digests, and the implementation gate runs the registered test. |
| G-23 repeated stale companion-file report | The reported path is absent in the reviewed workspace. Preserve that absence and the one canonical contiguous-minor authority; no deletion or new version is needed. |

## Current Execution Handoff

The planning-control baseline remains owned by reopened `0.1.0`; passing those
checks proves roadmap integrity, not future product implementation. The sole
next admitted product package is `0.2.0`. It remains `planned` until one entry
commit freezes its admission base, exact path boundary, PackageExact
prerequisites, source-symbol owners, and registered executable test IDs.

The `0.2.0` implementation then stays inside `crates/vitheim-id` and its
admitted documentation/evidence paths. Before the package becomes
`implemented`, every registered test must execute through its exact-ID runner
and carry candidate-, source-, runner-, toolchain-, result-, and
artifact-digest evidence. The exact implementation commit then receives the
version-specific pentest; only after its findings close may the next selected
stop receive a work package.

This handoff adds no version. `0.38.0` still owns the first bounded Hosted
feasibility/no-go decision, while `0.398.0` still owns final selected Hosted
profile revalidation. Neither decision may be pulled into `0.2.0`, assumed by
earlier code, or bypassed because planning checks pass.

## Selected Production-v1 Capability Contract

Vitheim v1 is a service-operations platform with event-sourced domain
authority. The selected core market promise includes ITSM, SecOps,
assets/services, bounded workflow, and their policy-safe correlation.

The mandatory core profile contains:

- N0/N1 typed identities, checked time, stable errors, cumulative budgets,
  canonical codec/envelopes, pure aggregate decision/evolution, and the event
  kernel;
- PostgreSQL multi-user storage as the reference production profile;
- HTTP/TLS API, external OIDC resource/client integration, sessions, tenant
  lifecycle, RBAC/ABAC, field obligations/redaction, and immutable audit;
- incidents, requests/catalog, problems/known errors, changes, releases, tasks,
  approvals, assignment, attachments/quarantine, SLA, notifications,
  knowledge, and lexical search;
- assets/services, one admitted discovery profile, bitemporal provenance and
  reconciliation, service/relationship graph and bounded impact analysis;
- selected alert and vulnerability ingestion, normalization, deduplication/
  suppression without evidence deletion, security incidents, remediation,
  forensic custody, and policy-safe cross-domain correlation;
- basic durable workflow with sequential steps, human task, timer, activity,
  bounded retry, and compensation;
- deterministic export/integrity verification, backup/restore, upgrade,
  observability, operator administration, and a minimal service-desk UI that is
  an ordinary API client.

SQLite is a separately evidenced bounded single-node/local profile. It is not
an HA or hostile-host isolation claim.

The following are optional or post-v1 unless independently selected and fully
evidenced:

- MySQL, MongoDB, and SurrealDB;
- online arbitrary cross-backend migration;
- SAML, SCIM, semantic/vector search, federation, and AI;
- Wasm storefront/vendor packs and effectful plugin connectors;
- extended supplier, procurement, capacity, demand, and continuity modules;
- multiple discovery/provider families beyond the selected reference profiles;
- dynamic built-in-domain retirement/reinstall.

Optional capability code may depend inward on stable ports. The kernel and
mandatory first-party domains never depend on it.

The exact selection, capability edges, dependency state, delivery slices,
claim requirements, required runtime profiles, successor-after-skip rule, and
support boundary for every stop are in
[Selected Production Profile Manifest](SELECTED_PROFILE_MANIFEST.md) and the
generated `docs/selected_profile_manifest_v1.txt`. This manifest is required
before `0.2.0`. Reviewed architectural edges begin as an independently retained
`DeclaredMinimum`; each entering work package supplies `PackageExact` as a
non-weakening refinement. Removing a minimum requires a separate approved
dependency-supersession security record. Every dependency must be numerically
earlier than its owner stop. No production claim passes until every row in its
graph closure is package-exact, implemented and evidenced. `0.398.0`
revalidates and may narrow claims, but does not create the first selection.

## Explicit Product Boundaries

The selected v1 is not:

- a general log lake or full SIEM query/detection engine;
- an EDR, RMM, MDM, or arbitrary remote-shell product;
- an OAuth/OIDC authorization server;
- a secrets manager, KMS, general database, message broker, or object store;
- a substitute for provider-side transactional guarantees;
- an autonomous AI agent;
- an active/active multi-region authoritative-write system.

Connectors ingest or invoke only exact admitted operations. “Automation,”
“agent,” “correlation,” or “integration” wording cannot widen these boundaries.

## Capability Increments

These increments are integration and work-planning overlays, not new release
numbers. They may exercise future owner implementations in bounded spike or
integration branches, but mainline support and release evidence remain owned by
the existing exact stop.

### Increment 0 — Feasibility And First Deployment Dossier

Complete before affected Hosted contracts freeze:

- execute the `0.38.0` dependency-free feasibility matrix;
- disposition exact PostgreSQL and SQLite access, HTTP client/server and TLS,
  OIDC/JWK/JWT and WebAuthn, cryptography/randomness, MIME/content handling,
  Wasm Component runtime, browser/UI build, KMS, and observability needs as
  safely project-owned or Unsupported;
- define the first single-node topology and TCB: API/UI server, worker,
  PostgreSQL, blob/quarantine boundary, external identity issuer, and operator
  boundary; split a process only for a documented trust/failure/scale reason;
- define the first HA successor topology without claiming it;
- record version/platform/license/maintenance/unsafe/native-code evidence and
  supported Rust target spikes;
- freeze the mandatory core profile and explicit non-goals above.

Failure is a useful outcome: it blocks unsafe implementation and makes the
Hosted production claim unavailable under current policy.

### Increment 1 — Pure Foundation

Complete the existing Phase A owners without expanding them:

- non-interchangeable nonzero tenant/domain IDs;
- checked time/duration and stable kernel errors;
- cumulative non-resetting allocation/work budgets;
- canonical bounded values/schema/codec;
- typed command/event envelopes and pure decide/evolve;
- in-memory incident proof.

Fuzz, property, finite-model, and compile-fail tests must demonstrate
determinism, boundedness, tenant typing, and invalid-ID rejection.

### Increment 2 — Service Foundations

Implement `0.102.0–0.118.0` as the reusable service foundation: typed work
components, tasks, attachment quarantine, assignment, SLA/SLO, approval,
on-call, paging and notification behavior. These are product/application
authorities, not generic operational-kernel internals. Each aggregate or
lifecycle has its own model binding and cannot become a universal ticket table.

### Increment 3 — Persistent Incident Transport Test Slice

After PostgreSQL `0.57.0`, `0.119.0–0.121.0` prove the first persistent
incident transport/domain slice with static, deterministic identity and policy
facts. This is deliberately not a production authentication proof:

```text
static tenant/subject/policy facts
  -> CreateIncident typed command
  -> pure incident decision
  -> PostgreSQL expected-version atomic work bundle
  -> event + result + audit + outbox
  -> disposable incident projection
  -> policy-shaped HTTP read and minimal UI
  -> projection deletion/rebuild
```

All Phase D/E Hosted paths before `0.225.0` remain contracts, fakes, or this
test slice. They cannot be deployed with the fake identity profile, described
as production authenticated, or used to claim session/revocation correctness.

### Increment 4 — Production-Authenticated Incident Proof

After the exact tenant, subject, session/OIDC, RBAC/ABAC, policy-lifecycle,
redaction, and authorization-conformance owners through `0.225.0` exist, prove
the smallest real cross-phase path:

```text
OIDC-authenticated user
  -> tenant-scoped policy and authorized-field plan
  -> CreateIncident typed command
  -> pure incident decision
  -> PostgreSQL expected-version atomic work bundle
  -> event + result + audit + outbox
  -> disposable incident projection
  -> authorized HTTP read and minimal UI
  -> projection deletion/rebuild
```

The `0.225.0` conformance campaign consumes, rather than duplicates, the
existing journal, model, PostgreSQL, policy, API/UI, incident, tenant/subject/
session/OIDC, audit, and projection owners. It includes exact retry,
changed-material conflict, stale writer, crash at each bundle component,
notification fake, tenant-ID collision, policy and session revocation,
backup/restore, and upgrade. A real notification provider is added only after
its transmission profile is admitted.

No five-backend abstraction, broad domain suite, or production authentication
claim may substitute for this proof. Missing product behavior fails `0.225.0`
and returns to its existing owner or a new successor minor; the conformance
commit cannot implement it. Passing evidence cannot retroactively promote
`0.119.0`.

### Increment 5 — Operational Kernel

Add scheduler/timer/lease/fence/queue behavior, basic workflow, quotas and
measured fairness, external effect intent/dispatch/reconciliation, externally
anchored integrity checkpoints, observability, failure injection, replay,
restore, and rolling upgrade. Each authority uses a separate model and local
owner transaction.

### Increment 6 — Core Service Management

Deliver the mandatory ITSM set through real policy, storage, workflow, API, and
notification paths. Shared work-item values and read composition never become a
universal mutable aggregate, repository, patch command, or nullable mega-table.

### Increment 7 — Assets, SecOps, And Correlation

Deliver the mandatory asset/service/SecOps profile with one real discovery and
selected ingestion profiles. Graph and search remain disposable projections;
raw facts/evidence remain immutable or governed erasable references;
reconciliation is a pure pinned-input decision.

Search and knowledge `0.286.0–0.300.0` are a shared projection/application
closure used by both operable checkpoints, not security-only functionality.

### Increment 8 — Independent Optional Profiles

Pure Wasm components precede effectful connector profiles. Builders, extended
business modules, semantic search, federation, AI, additional databases, and
vendor packs remain separately selectable and cannot become kernel
dependencies.

### Increment 9 — Production Qualification

Operate and harden the same selected minimum profile through packaging,
startup/upgrade compatibility, HA fencing/failover, backup/restore/DR/failback,
load/soak/fairness/rebuild/chaos, external security assessment/remediation, and
the final support/refusal matrix. Phase O verifies decisions already made; it
does not discover the first viable topology.

## Independently Operable Delivery Checkpoints

The combined `VITHEIM-PRODUCTION-V1` promise still requires service operations
and security/asset operations. To obtain feedback without weakening that
promise, the selected manifest labels two independently operated evidence
slices:

1. `core-service-operations`: kernel, PostgreSQL, identity/policy, core ITSM,
   workflow basics, attachments, notifications, knowledge/search, and its
   API/UI paths.
2. `security-asset-operations`: SecOps, vulnerability, custody, assets,
   services, selected discovery, bitemporal graph, impact, and correlation.

Each checkpoint has its own workload envelope, backup/restore exercise,
operational runbook, support boundary, and exact selected-stop evidence. The
second composes with the first through typed APIs and facts. Neither checkpoint
alone is Vitheim `1.0.0`; production requires both plus the common
qualification closure.

## Authority Decomposition

The following owners remain separate even in one deployable:

1. migration job owns migration progress only;
2. import staging owns untrusted candidate bytes and validation only;
3. activation owns local cutover CAS and exact domain-owner receipts;
4. integrity owns event/checkpoint continuity;
5. evidence custody owns retention, hold, archive, and deletion evidence;
6. capacity/quota owns reservations and settlement;
7. external witness owns append-only observations and equivocation state;
8. corruption recovery owns quarantine and recovery authorization;
9. tenant/domain retirement coordinates typed child outcomes but never embeds
   child internal state machines.

Interactions are immutable typed requests and authenticated receipts folded
idempotently into one local owner. A combined transaction contains only the
minimal guard rows needed to linearize that owner's action. Shared lock-order
documentation does not create a shared authority or justify a mega-state
machine.

For the default v1 profile, built-in domain schemas remain installed and may be
disabled. Dynamic built-in-domain retirement/reinstall and its advanced
`0.156.0–0.210.0` profile remain Unsupported. Tenant deletion still follows its
mandatory lifecycle. Plugin uninstall removes an installation but does not
claim domain/data retirement.

For the default v1 storage profile, migration means versioned in-place
PostgreSQL schema/data upgrade plus staged canonical export/import. Online
arbitrary-backend migration remains Unsupported.

## Cross-Cutting Acceptance Rules

- Tenant scope is structural in every ID, port request, durable key, uniqueness/
  foreign relationship, inbox/outbox, cache/index/blob/queue key, canonical
  preimage, pooled-session context, backup, restore, log, metric, and operator
  path. Generated/validated storage descriptors are the primary schema defense;
  handwritten predicates are not.
- PostgreSQL RLS/roles are defense in depth. SQLite truthfully refuses hostile
  process/filesystem-administrator isolation.
- Atomic command/consumer bundles commit result, events, audit, quota, and
  outbox together with expected-version/idempotency checks. An incapable
  backend refuses.
- Privileged-storage tamper evidence requires an independently retained
  checkpoint anchor. Without it, the claim is local corruption detection only.
- Lifecycle commands are narrow legal transitions. Assignment cannot mint
  roles, delegation, visibility, or eligibility; current epochs fence queued
  work.
- Policy produces an authorized read/field/traversal plan before sensitive
  selection. Notifications reauthorize at delivery or consume one narrow
  immutable disclosure grant.
- Graph traversal authorizes node, edge, intermediate node, field, and purpose
  before inclusion and bounds depth/nodes/edges/paths/time/work.
- Asset/SecOps reconciliation never mutates raw source facts. Absence,
  suppression, deduplication, confidence, scanner output, and remediation
  evidence retain their distinct meanings.
- Evidence custody preserves provenance, parent digests, uncertain/conflicting
  clocks, access/copy/transform/export/hold/disposition history, and truthful
  Complete/Incomplete/Unavailable/IntegrityFailed states.
- Attachment “clean” is a versioned scanner observation. Current authorization,
  verdict freshness, extraction budgets, safe origin/content disposition, and
  sandboxed rendering remain mandatory.
- Wasm fuel does not replace host-call, memory, instance, output, log,
  concurrency, time, destination, secret-handle, cancellation, and OS/process
  isolation controls.
- AI stays optional, advisory, proposal-only, and dependency-isolated from
  repositories, adapters, dispatch, workflow effects, secrets, and admin ports.
- Declarative registries name identity/owner/schema/dependencies/evidence only;
  executable transition semantics remain code-owned by the current feature.

## Quantitative Workload Envelope

Every Supported deployment profile publishes a versioned
`MinimumProfileWorkloadEnvelopeV1` derived from reproducible benchmarks. It
contains conservative numeric maxima and refusal behavior for:

- command/event/payload/batch and attachment/archive expansion sizes;
- aggregate replay/snapshot work and projection/search/graph rebuild time;
- p50/p95/p99 command and read latency plus sustained/burst command, outbox, and
  inbox rates;
- tenants, subjects, roles, relationships, workflows, timers, alerts, assets,
  graph edges, search documents, and concurrent operations;
- per-tenant/worker CPU, memory, disk, connection, queue, and recovery reserves;
- projection/search/graph lag and provider-outage backlog drain;
- backup duration, restore duration, RPO, RTO, and integrity-check duration;
- Wasm fuel/host-call/memory/instance/output/time limits where enabled;
- AI context/output/token/concurrency limits where enabled.

The first vertical slice publishes an initial single-node envelope. Later
profiles may strengthen or expand it only with new evidence. Requests outside a
profile are refused before allocation or partial writes.

## Existing Late-Protocol Corrections

The consolidated review items are acceptance changes in existing owners:

1. `0.205.0`/`0.209.0` use one atomic Open/Sealed transmission-claim admission
   cut; sealing cannot race claim creation.
2. `0.207.0` reports a successor operational only after its local activation
   has committed and an authenticated applied receipt is folded.
3. `0.208.0` requires authenticated local and Vitheim permanent fencing of a
   failed successor before a replacement can claim single-issuer continuity.
4. `0.210.0` gives preparation exhaustion a non-resetting explicit terminal/
   recovery outcome; ordinary retry cannot manufacture another lineage.

They do not create more versions. If dynamic domain/status retirement is not
selected for v1, the entire advanced profile remains Unsupported together.

## Stopping Rule

This planning pass is complete when:

- the selected profile and increments govern `1.0.0` evidence;
- no dependency, topology, or product claim bypasses Increment 0;
- Phase C/retirement coordinators satisfy the authority split;
- every critical implemented protocol has a focused package and executable
  model;
- `SelectedProfileManifestV1` remains exact, closed, acyclic, and consistent
  with numerically ordered, non-weakening PackageExact prerequisites and
  claim-specific closures;
- every entering stop has a validated `ImplementationWorkPackageV1`, and every
  critical stop has an `ExecutableModelBindingV1`; every implemented test
  resolves, executes and binds exact immutable evidence;
- numeric workload envelopes begin with the first vertical slice;
- optional and out-of-scope capabilities are discoverably refused; and
- the four late-protocol corrections are enforced by their existing owners.

Future findings belong in roadmap planning only when they expose a missing
authority owner, impossible dependency/order, structural tenant/domain bypass,
false production claim, or unrecoverable safety/liveness contradiction.
Ordinary defects, race cases, fields, and negative tests belong to the owning
design/code review and test suite.
