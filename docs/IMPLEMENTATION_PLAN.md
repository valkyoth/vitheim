# Vitheim Implementation Plan

Status: complete planning baseline from `0.1.0` through `1.0.0`

This index turns the [release ladder](RELEASE_PLAN.md) into implementation
handoffs. Every milestone has its own status, setup, goal, deliverables,
verification, and exact-commit pentest stop. A milestone may be split before
implementation if one review pass becomes too broad; later work may never be
pulled into an earlier tag merely for convenience.

## Universal Setup

Every version begins from a clean `main` after the previous version's permanent
pentest report and tag. Before code changes, update the latest stable Rust and
verification tools, review current official specifications and practices,
define crate/layer boundaries and input budgets, draft threat-model and attack-
surface deltas, write tests first where practical, and create draft release
notes and pentest scope.

All crates remain private, dependency direction points inward, Rust files stay
under 500 lines, and third-party Cargo code remains forbidden unless a separate
explicit policy decision changes that rule. Unavailable safe hosted technology
blocks its milestone rather than causing an improvised protocol implementation.
Before the first line of any hosted adapter or protocol implementation, that
milestone must approve a version-bound implementation-admission record covering
the exact dependency/runtime, maintenance, license, unsafe/native code, protocol
profile, trust boundary, replacement port, and rejection alternatives. The
`0.140.x` decisions revalidate and freeze production support from those records;
they are never the first technology selection.
Every user-facing capability is API-first: API contract/application/transport
crates remain separate from UI composition/rendering crates, and the first-
party UI has no privileged command, repository, or database path.
Optional federation, AI, vendor-connector, plugin-storefront, and semantic-index
crates depend inward on stable ports. The kernel and first-party domains must
build, test, and operate without any optional product family.
Vitheim operational telemetry and customer-service measurements are distinct
planes. All fact-bearing domains reuse the shared N1 provenance, correction,
confidence, and four-clock vocabulary rather than creating local substitutes.
Semantic index storage and embedding generation are independently replaceable
and independently admitted.
Before `0.51.2`, every milestone that creates or changes tenant-bearing durable,
cached, indexed, backed-up, or external-copy state must supply the neutral
`0.8.1` lifecycle descriptor and inventory fixture without depending outward on
Phase F. `0.51.2` backfills and validates every earlier surface; its generated
`TenantDataSurface` compile/registration gate then applies prospectively to
`0.51.2` and every later milestone. This lifecycle registry remains separate
from authority-interface registration. Every asynchronous state effect must use
the applicable `0.18.2` command/consumer/timer/activity/poison atomic variant;
best-effort receipts are forbidden. Each bundle advances no more than one
authoritative aggregate stream and includes only local durable effects;
provider/network work begins from committed intent and returns in a later
bundle under explicitly at-least-once semantics. Each external-effect
capability follows the `0.16.0–0.18.2` contract with distinct execution state,
remote outcome, resolution source/evidence, operational-resolution workflow,
and compensation state. Manual assessment never becomes verified provider
truth; unknown privileged or non-compensable work is never retried blindly.
Authorization is mandatory at effect-intent commit and binds tenant, initiator,
delegation, capability, target, purpose, request, policy, and assurance. Every
capability declares `CommitBound` or `CommitAndDispatch`, with dispatch recheck
as the default; only reviewed immutable low-risk effects may be commit-bound,
while privileged, destructive, secret-bearing, containment, and compensation
effects require a current fenced,
single-use dispatch decision. Authority, target, or request changes deny the
old dispatch rather than being substituted by a worker.
Each capability declares its quota admission/dispatch consumption boundary.
Unknown outcomes remain durably charged/held; only pre-dispatch cancellation or
admissible definitely-not-accepted evidence permits exactly one refund/release.
Operator assessment cannot fabricate that evidence, compensation is separately
accounted, and strictly scoped control-plane reserve capacity protects
reconciliation/security cleanup from tenant exhaustion without admitting new
tenant work.
External-copy lifecycle evidence uses the typed `0.51.2` strength model and may
never promote an attestation, unconfirmed request, or unverifiable disclosed
plaintext to local deletion proof or controlled-key erasure. Rollup-substitution
expiry requires its full authority proof, but a controlling mandatory erasure,
maximum-retention, or closure deletion obligation takes precedence; any
resulting loss of historical authority is recorded immutably and exposed as
unknown/unavailable. Raw data, rollups, manifests, derived results, caches/
projections, exports, and linkable checkpoint metadata each receive their own
disposition decision; only independently permitted non-authoritative data and
allowed non-sensitive tombstone/authority-loss evidence may remain.

## Universal Verification And Exit

Release-specific verification is additive to `scripts/checks.sh`, supported-
target checks, tool freshness, SBOM and license review, CI, CodeQL default
setup, docs/release-note review, threat-model and unsafe/dependency deltas,
authorization and tenant-isolation matrices, changed-parser fuzzing, changed-
invariant property tests, and migration/restore evidence where applicable.
`0.58.0–0.60.0` backfill every authority-bearing interface implemented through
Phase F. Every later milestone that adds one must register its tenant, subject,
action, resource, fields, purpose, obligations, audit behavior, and negative
cases in that conformance registry before exit. External effects additionally
register intent-commit and dispatch enforcement points, immutable bindings,
freshness profile, quota boundary, refund evidence, and compensation/recovery
capacity behavior.

At each implementation stop: do not tag, publish, or begin the next milestone.
Pentest the exact commit, fix every blocking finding, rerun all gates, obtain a
permanent `Status: PASS` report, and run the versioned readiness gate. Patch
versions contain corrections only and follow the same process.

## Phase Documents

- [Phase A — Pure Foundation (`0.1.0–0.10.0`)](implementation/PHASE_A.md)
- [Phase B — Journal And Projections (`0.11.0–0.20.0`)](implementation/PHASE_B.md)
- [Phase C — Storage Portability (`0.21.0–0.30.0`)](implementation/PHASE_C.md)
- [Phase D — Universal Work (`0.31.0–0.40.0`)](implementation/PHASE_D.md)
- [Phase E — IT Service Management (`0.41.0–0.50.0`)](implementation/PHASE_E.md)
- [Phase F — Identity, Tenancy, And Policy (`0.51.0–0.60.0`)](implementation/PHASE_F.md)
- [Phase G — Durable Workflows (`0.61.0–0.70.0`)](implementation/PHASE_G.md)
- [Phase H — Security Operations (`0.71.0–0.80.0`)](implementation/PHASE_H.md)
- [Phase I — Assets And Services (`0.81.0–0.90.0`)](implementation/PHASE_I.md)
- [Phase J — Search And Knowledge (`0.91.0–0.100.0`)](implementation/PHASE_J.md)
- [Phase K — Compliance And Risk (`0.101.0–0.110.0`)](implementation/PHASE_K.md)
- [Phase L — WASM And Integrations (`0.111.0–0.120.0`)](implementation/PHASE_L.md)
- [Organization Federation (`0.120.1–0.120.5`)](implementation/FEDERATION.md)
- [Phase M — Optional AI (`0.121.0–0.130.0`)](implementation/PHASE_M.md)
- [Phase N — Product Experience (`0.131.0–0.140.0`)](implementation/PHASE_N.md)
- [Pre-Production Option Decisions (`0.140.1–0.140.10`)](implementation/OPTION_DECISIONS.md)
- [Phase O — Production Hardening (`0.141.0–0.150.0`)](implementation/PHASE_O.md)
- [`1.0.0` — Production Acceptance](implementation/PRODUCTION_1_0.md)

The integration decisions and sequencing changes resulting from the roadmap
review are tracked in [Roadmap Gap Dispositions](ROADMAP_GAP_DISPOSITIONS.md).

## First-Ten Crate Graph

```text
vitheim facade
├── vitheim-id, vitheim-time, vitheim-error
├── vitheim-budget, vitheim-fixed
├── vitheim-value, vitheim-schema, vitheim-codec
├── vitheim-context, vitheim-command, vitheim-event
├── vitheim-aggregate, vitheim-incident
└── vitheim-cli (hosted in-memory demonstration only)
```

N0 crates use neither `std` nor an allocator. N1 may use explicit `alloc` but
not OS facilities. Hosted crates expose project-owned interfaces and never leak
runtime, database, protocol, plugin-host, or UI implementation types inward.
