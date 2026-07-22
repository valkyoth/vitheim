# Vitheim Implementation Plan

Status: repository-ready plan for the first ten releases

This plan turns the initial architecture into reviewable implementation stops.
The [Release Plan](RELEASE_PLAN.md) carries the complete product sequence to
`1.0.0`. Add patch versions or split a milestone whenever one pass is no
longer small enough to understand, test, and pentest.

## Permanent Setup

Every release starts from a clean `main`, the latest stable Rust pin, current
verification tools, passing CI and CodeQL default setup, no unresolved finding,
and an updated threat-model delta. Crates are created only for the active
release. Rust files remain at most 500 lines and packages remain private.

Before implementation:

1. Confirm official specifications and current Rust practices.
2. Define public types, invariants, budgets, and explicit non-goals.
3. Write acceptance, rejection, boundary, and abuse cases.
4. Assign crate layer N0, N1, or H and verify inward-only dependencies.
5. Update release notes and pentest scope as draft evidence.

Every implementation stop runs `scripts/checks.sh`, supported-target checks,
SBOM validation, tool freshness, CI, CodeQL, documentation review, and the
version-specific verification. Then stop without tagging and request a pentest
of the exact commit. Findings are fixed, all gates rerun, and the permanent
report records `PASS` before the readiness gate may permit a tag.

## Cargo Feature And Dependency Graph Through `0.10.0`

```text
vitheim (facade, N0/N1, default features empty)
├── vitheim-id (N0)
├── vitheim-time (N0)
├── vitheim-error (N0)
├── vitheim-budget (N0)
├── vitheim-fixed (N0, from 0.3.0)
├── vitheim-value (N1, from 0.4.0)
├── vitheim-schema (N1, from 0.5.0)
├── vitheim-codec (N0/N1, from 0.6.0)
├── vitheim-context (N1, from 0.7.0)
├── vitheim-command (N1, from 0.7.0)
├── vitheim-event (N1, from 0.8.0)
├── vitheim-aggregate (N1, from 0.9.0)
└── vitheim-incident (N1, from 0.10.0)

vitheim-cli (H, from 0.10.0)
└── project-owned crates above; in-memory state only
```

All features are empty by default. A future `alloc` feature is explicit on N1
crates; it must not imply `std`. No external dependency, build dependency, dev
dependency, procedural macro, native library, git source, or registry source is
permitted through these releases. Tests use only Rust and workspace code.

## Planned Public API Boundaries

The exact spelling may change during its assigned release, but responsibility
must not drift:

- `vitheim-id`: typed opaque tenant, record, command, event, correlation,
  causation, stream, and actor identifiers with canonical bytes and strict
  parsing; no randomness source.
- `vitheim-time`: timestamps, non-negative durations, logical positions, and
  injected `Clock` facts; no ambient clock.
- `vitheim-error`: stable category/code pairs without secrets or host errors.
- `vitheim-budget` and `vitheim-fixed`: validated limits, shared consumption
  sessions, fixed-capacity bytes/text/lists, and fail-closed exhaustion.
- `vitheim-value`: canonical bounded values and deterministic ordering.
- `vitheim-schema`: field/type identifiers, constraints, versions, and pure
  validation; no executable scripts.
- `vitheim-codec`: canonical bounded encode/decode with exact consumption and
  version domain separation.
- `vitheim-context`: tenant, actor, authentication facts, correlation,
  requested time, and policy reference; no authorization decision by itself.
- `vitheim-command`: immutable command envelopes with idempotency and expected
  stream version.
- `vitheim-event`: immutable event envelopes with causality and schema version.
- `vitheim-aggregate`: pure `decide`/`evolve` and bounded event batches.
- `vitheim-incident`: minimal incident state, create and assign commands, and
  corresponding events for the in-memory vertical slice.

## `0.1.0` — Repository And Security Baseline

Status: implementation; pentest not run

### Goal

Make Vitheim buildable, auditable, private, portable at the pure-core layer,
and incapable of silently publishing or importing third-party Cargo code.

### Deliverables

- Rust 1.97.1 pin, workspace lints, EUPL-1.2 license, and private manifests.
- N0 facade and initial ID, time, error, and budget representation crates.
- CI, Codeowners, funding, templates, Dependabot, cargo-deny/audit, SBOM, and
  metadata-only release workflow adapted from the reference projects.
- Architecture, threat model, security controls, publication, supply-chain,
  implementation, release, and toolchain documents.
- Local gates for formatting, linting, tests, docs, links, size, `no_std`,
  Cargo sources, publication, advisory, license, and release evidence.

### Verification

- Full local check and SBOM generation/check.
- Cargo metadata contains only the five private workspace packages.
- Linux, Windows, FreeBSD, macOS, Android, and iOS core target checks.
- Negative release-readiness test rejects `Status: NOT RUN`.
- Review CI permissions, action SHAs, ignored secrets, and publication absence.

### Exit Criteria

All deliverables and verification pass, docs describe only current capability,
and no Rust file exceeds 500 lines. `v0.1.0 implementation stop reached. Run
pentest for this exact commit.`

## `0.2.0` — Typed IDs, Time, And Stable Errors

Status: planned

### Goal

Prevent identity-domain confusion and provide deterministic time/error facts.

### Deliverables

- Domain-specific non-interchangeable ID newtypes over canonical 128-bit data.
- Strict fixed-format parsing/formatting with zero/forbidden-value policy.
- Checked durations/timestamp arithmetic and injected clock contract.
- Stable error category, code, and safe diagnostic context rules.

### Verification

- Round-trip, malformed length/alphabet/canonical form, domain-confusion
  compile-fail, zero, min/max time, and overflow tests.
- Property tests over canonical byte and text round trips.
- Fuzz targets for identifier parsing before any untrusted boundary uses it.

### Exit Criteria

No API creates randomness or reads time, IDs cannot cross domains implicitly,
and all parsing is exact and bounded. `v0.2.0 implementation stop reached. Run
pentest for this exact commit.`

## `0.3.0` — Budgets And Fixed-Capacity Values

Status: planned

### Goal

Make bounded resource consumption reusable before complex parsers exist.

### Deliverables

- Validated byte, item, depth, allocation, and total-work limits.
- Non-copyable shared budget session preventing reset through sub-parsers.
- Fixed-capacity byte, text, and list storage with explicit errors.
- Checked accounting and all-or-nothing mutation contracts.

### Verification

- Exact-boundary, one-over, cumulative sibling, nesting, overflow, rollback,
  and session-reuse tests.
- Model/property tests prove consumption never increases remaining budget.
- Miri checks for fixed storage and fuzzing of operation sequences.

### Exit Criteria

All resource accounting fails closed without panic, wrap, partial output, or
budget reset. `v0.3.0 implementation stop reached. Run pentest for this exact
commit.`

## `0.4.0` — Canonical Dynamic Value Model

Status: planned

### Goal

Represent custom data deterministically without arbitrary executable behavior.

### Deliverables

- Null, boolean, signed/unsigned integer, decimal, text, bytes, timestamp,
  duration, identifier, list, object, and reference values.
- Bounded construction tied to shared budget sessions.
- Deterministic equality, ordering, field ordering, and depth rules.
- Separation of validated values from untrusted construction inputs.

### Verification

- Variant and cross-variant ordering, min/max numeric, duplicate field,
  nesting, cumulative budget, Unicode-byte, and canonical object tests.
- Recursive property/fuzz generators constrained by independent test budgets.

### Exit Criteria

Equivalent logical values have one canonical in-memory meaning and malicious
nesting cannot escape budgets. `v0.4.0 implementation stop reached. Run
pentest for this exact commit.`

## `0.5.0` — Schemas And Field Constraints

Status: planned

### Goal

Validate versioned record shapes without scripts or host access.

### Deliverables

- Stable record-type, schema, and field IDs plus schema versions.
- Required/optional fields, value kinds, length/range/cardinality/reference
  constraints, and deterministic validation reports.
- Schema construction validation for duplicates, recursion, and contradictions.
- Evolution compatibility classification without automatic migration.

### Verification

- Missing/extra/wrong-type, boundary, conflicting, duplicate, recursive,
  schema-bomb, and deterministic error-order tests.
- Property tests compare accepted values with every declared constraint.

### Exit Criteria

Invalid schemas cannot be activated and validation performs no I/O or code
execution. `v0.5.0 implementation stop reached. Run pentest for this exact
commit.`

## `0.6.0` — Deterministic Bounded Codec

Status: planned

### Goal

Encode internal stable envelopes canonically and decode hostile bytes safely.

### Deliverables

- Versioned type/domain tags, canonical integer/length forms, exact-consumption
  decode, deterministic maps, and bounded recursion.
- Borrowed decode where safe and caller-provided output where practical.
- Stable structural error codes without echoing attacker-controlled payloads.
- Forward-compatibility and unknown-version rejection rules.

### Verification

- Known-answer vectors, canonical round trips, truncation at every byte,
  non-minimal encoding, unknown tag/version, trailing byte, deep nesting,
  allocation/work exhaustion, and differential encode/decode tests.
- Dedicated fuzz targets and committed minimal regression corpus.

### Exit Criteria

Every admitted value has one encoding; no malformed input causes panic,
unbounded work, partial trusted output, or ambiguous acceptance. `v0.6.0
implementation stop reached. Run pentest for this exact commit.`

## `0.7.0` — Context And Command Envelope

Status: planned

### Goal

Bind every requested state change to tenant, actor, causality, time,
idempotency, and expected version before business logic receives it.

### Deliverables

- Decision context with tenant, actor, authentication facts, requested time,
  correlation, client, and policy snapshot references.
- Command envelope with type/schema version, command ID, target, expected
  version, idempotency key, and bounded payload.
- Construction typestate preventing omitted tenant or actor.
- Canonical codec integration and redacted debug policy.

### Verification

- Missing/mismatched tenant, actor spoofing, duplicate IDs/keys, wrong target,
  version confusion, oversized payload, redaction, and codec round-trip tests.
- Compile-fail tests for incomplete construction.

### Exit Criteria

No command can exist without mandatory security context and its bytes bind all
security-relevant fields. `v0.7.0 implementation stop reached. Run pentest for
this exact commit.`

## `0.8.0` — Event Envelope

Status: planned

### Goal

Represent immutable, ordered, tenant-bound facts with explicit causality.

### Deliverables

- Event ID/type/schema version, tenant, stream, stream/partition positions,
  valid/recorded times, actor, command, correlation, causation, policy,
  workflow, integrity predecessor, payload, and bounded metadata.
- Construction API available only to accepted decision/journal boundaries.
- Canonical encoding and stable schema-version policy.

### Verification

- Tenant/stream mismatch, position and timestamp boundary, missing causality,
  schema confusion, metadata exhaustion, tamper, and round-trip tests.
- Property tests for deterministic event ordering and identity binding.

### Exit Criteria

Events are immutable after construction, every fact is attributable, and
untrusted callers cannot forge an accepted-event token. `v0.8.0 implementation
stop reached. Run pentest for this exact commit.`

## `0.9.0` — Pure Aggregate Framework

Status: planned

### Goal

Standardize deterministic state decisions and replay without persistence.

### Deliverables

- Aggregate trait with pure `decide` and `evolve` operations.
- Bounded non-empty event batches, rejection type, and state version.
- Replay driver with explicit maximum events/work and corruption diagnostics.
- Testkit for determinism, illegal transition, and replay equivalence.

### Verification

- Decide-twice equivalence, replay-prefix, batch-boundary, version mismatch,
  invalid event sequence, rejection-no-mutation, and exhaustion tests.
- State-machine/model tests and fuzzed command/event sequences.

### Exit Criteria

Equal state, command, and context yield equal output; rejection never mutates
state; replay is bounded. `v0.9.0 implementation stop reached. Run pentest for
this exact commit.`

## `0.10.0` — In-Memory Incident Vertical Slice

Status: planned

### Goal

Prove the complete pure flow from authorized command facts through event,
replay, projection, and audit output before any database or HTTP work.

### Deliverables

- Minimal incident create and assign aggregate with explicit lifecycle rules.
- In-memory command dispatcher, event journal, projection, and audit evidence.
- Local CLI accepting only bounded test/demo input; no network and no durable
  production claim.
- Projection teardown/rebuild and deterministic scenario fixtures.

### Verification

- Create, duplicate, assign, unauthorized actor, wrong tenant, stale version,
  replay, projection rebuild, corrupt sequence, exhaustion, and audit tests.
- End-to-end golden scenario and fuzzed bounded command sequences.
- Platform host runs plus pure-core target matrix.

### Exit Criteria

The first vertical slice is deterministic, tenant-bound, authorized from
explicit facts, replayable, and truthfully documented as in-memory only.
`v0.10.0 implementation stop reached. Run pentest for this exact commit.`

