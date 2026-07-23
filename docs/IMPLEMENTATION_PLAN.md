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

## Universal Verification And Exit

Release-specific verification is additive to `scripts/checks.sh`, supported-
target checks, tool freshness, SBOM and license review, CI, CodeQL default
setup, docs/release-note review, threat-model and unsafe/dependency deltas,
authorization and tenant-isolation matrices, changed-parser fuzzing, changed-
invariant property tests, and migration/restore evidence where applicable.
Every milestone that adds an authority-bearing interface must register its
tenant, subject, action, resource, fields, purpose, obligations, audit behavior,
and negative cases in the `0.58.0–0.60.0` conformance registry before exit.

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
