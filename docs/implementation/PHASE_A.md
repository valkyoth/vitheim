# Phase A — Pure Foundation

Scope: `0.1.0–0.10.0`. N0/N1 only except the final demonstration CLI. No I/O,
ambient clock/randomness, external Cargo code, or production claims enter the
domain crates.

## `0.1.0` — Repository And Security Baseline

Status: implementation reopened by security review; pentest not run.

Setup: initialize EUPL-1.2 workspace policy, Rust/tool pins, private manifests,
CI, CodeQL-default guidance, threat model, SBOM, and release evidence layout.

Goal: make Vitheim buildable, auditable, portable, and fail closed against
third-party Cargo sources or crate publication.

Deliverables:
- Private `no_std` facade plus ID, time, error, and budget foundation crates.
- Local/CI gates for code, docs, dependencies, line limits, SBOM, and releases.
- Strict numeric SemVer parsing; normalized semantic SBOM comparison; release
  evidence cryptographically binding candidate tree, toolchain, SBOM, and any
  artifacts through a signed detached attestation or constrained evidence-only
  child commit whose reviewed parent and allowed tree delta are verified.

Verification: run all gates and core target checks; prove Cargo metadata has
only workspace paths and both publication and incomplete readiness are denied.
Negative tests reject arbitrary 40-hex reviewed commits, self-referential or
wrong-parent reports, malformed/prerelease-incompatible inputs, stale SBOM
versions/licenses/relationships, changed candidate trees, and changed artifacts.

Exit criteria: baseline claims match evidence and no release gate is bypassed.
`v0.1.0 implementation stop reached. Run pentest for this exact commit.`

## `0.2.0` — Typed IDs, Time, And Stable Errors

Status: planned.

Setup: freeze identifier domains, canonical text/byte forms, forbidden values,
timestamp units, arithmetic rules, and non-sensitive error taxonomy.

Goal: prevent identifier confusion and remove ambient time/error details from
deterministic decisions.

Deliverables:
- Non-interchangeable tenant, record, stream, command, event, and actor IDs.
- Checked durations/timestamps, injected time facts, and stable error codes.
- Validated nonzero `TenantId`; tenant-scoped authority IDs; explicit N0/N1/H
  crate metadata and checked dependency DAG forbidding allocator use in N0,
  inward violations, build scripts, proc macros, FFI, and thick facades unless
  a versioned exception is reviewed.

Verification: round-trip, malformed/canonical form, compile-fail domain mix-up,
zero/min/max/overflow, crate-layer negative fixtures, redaction, property, and
parser fuzz tests pass.

Exit criteria: no core API creates IDs randomly, reads time, or leaks host
errors. `v0.2.0 implementation stop reached. Run pentest for this exact commit.`

## `0.3.0` — Budgets And Fixed-Capacity Values

Status: planned.

Setup: define byte, item, depth, allocation, and total-work limits plus atomic
failure behavior for every fixed-capacity mutation.

Goal: make cumulative hostile-input exhaustion impossible before parsers grow.

Deliverables:
- Non-copyable shared consumption sessions with checked accounting.
- Fixed-capacity byte, text, and list types with explicit exhaustion errors.

Verification: exact/one-over/cumulative/nested/overflow/rollback sequences,
property models, fuzz operations, and Miri checks prove budgets cannot reset.

Exit criteria: exhaustion never wraps, panics, or exposes partial trusted
output. `v0.3.0 implementation stop reached. Run pentest for this exact commit.`

## `0.4.0` — Canonical Dynamic Value Model

Status: planned.

Setup: specify every value variant, canonical ordering, decimal representation,
object-key uniqueness, recursion policy, and shared-budget construction.

Goal: represent custom data deterministically without executable validation.

Deliverables:
- Bounded scalar, text, bytes, temporal, ID, reference, list, and object values.
- Separate untrusted builders and validated canonical values.

Verification: variant ordering, numeric edges, duplicate keys, Unicode byte
limits, recursive generators, nesting bombs, and deterministic equality pass.

Exit criteria: equivalent values have one meaning and all construction remains
bounded. `v0.4.0 implementation stop reached. Run pentest for this exact commit.`

## `0.5.0` — Schemas And Field Constraints

Status: planned.

Setup: define schema/field identity, compatibility classes, validation order,
constraint composition, recursion limits, migration non-goals, field-level data
classification, retention class, secrecy, indexing/export eligibility, and
erasability before any schema can become durable.

Goal: validate versioned custom records without scripts or host access.

Deliverables:
- Field kinds, requiredness, ranges, lengths, cardinality, and references.
- Schema self-validation and deterministic compatibility reports.
- Mandatory lifecycle metadata whose compatibility rules cannot silently make a
  sensitive field public, permanent, searchable, or non-erasable.

Verification: missing/extra/wrong fields, contradictory constraints, duplicate
IDs, recursive schema bombs, deterministic diagnostics, and properties pass.

Exit criteria: invalid or ambiguous schemas cannot activate. `v0.5.0
implementation stop reached. Run pentest for this exact commit.`

## `0.6.0` — Deterministic Bounded Codec

Status: planned.

Setup: specify canonical type/version tags, lengths, integers, collection order,
exact consumption, unknown-version handling, and decoder budgets.

Goal: safely persist and exchange stable internal envelopes.

Deliverables:
- Allocation-aware canonical encode/decode traits and structural error codes.
- Known-answer corpus and forward-compatibility rejection rules.

Verification: round trips, every-byte truncation, non-minimal/trailing/unknown
input, deep nesting, differential decoding, fuzzing, and regression seeds pass.

Exit criteria: each admitted value has one encoding and malformed bytes cannot
cause partial acceptance. `v0.6.0 implementation stop reached. Run pentest for this exact commit.`

## `0.7.0` — Context And Command Envelope

Status: planned.

Setup: enumerate mandatory tenant, actor, authentication, target, version,
idempotency, time, client, correlation, causation, and policy facts.

Goal: bind every requested mutation to complete security context.

Deliverables:
- Typestated decision context and immutable versioned command envelope.
- Canonical codec integration and redacted diagnostics.
- Immutable `TenantScope` embedded in every authority-bearing target and port
  request; there is no tenantless overload or bare-record return path.

Verification: missing/mismatched tenant, spoofed actor, duplicate key, wrong
target/version, oversized payload, compile-fail builder, and codec tests pass.

Exit criteria: incomplete or ambiguous commands are unrepresentable.
`v0.7.0 implementation stop reached. Run pentest for this exact commit.`

## `0.8.0` — Event Envelope

Status: planned.

Setup: define event authority, stream/partition ordering, valid/recorded times,
causality, immutable schema identity/version, integrity predecessor, metadata
budgets, and a strict ban on sensitive values in searchable/integrity metadata.

Goal: represent immutable attributable facts without accepting caller forgery.

Deliverables:
- Event envelope and accepted-event construction boundary.
- Immutable event-schema registry, canonical representation, compatibility
  policy, and unknown-schema quarantine contract.

Verification: tenant/stream mismatch, invalid positions/times, missing causality,
metadata exhaustion, tamper, ordering properties, and round trips pass.

Exit criteria: facts are immutable, attributable, ordered, and tenant-bound.
`v0.8.0 implementation stop reached. Run pentest for this exact commit.`

## `0.8.1` — Sensitive Payload Lifecycle

Status: planned.

Setup: separate immutable event metadata from encrypted or externally erasable
sensitive payloads; define classification, retention, tombstone, crypto-erasure,
payload-key destruction, original plaintext/ciphertext hashes, legal holds, and
rebuild behavior without erased plaintext.

Goal: make privacy and erasure structural before event schemas become permanent.

Deliverables: sensitive-payload reference/value model, classification enforcement,
erasable store port with memory fake, tombstone proof, and redacted rebuild
placeholder. Idempotency records, integrity links, outbox routing metadata,
telemetry labels, and search keys may contain only explicitly safe references.

Verification: classification downgrade, plaintext in metadata/log/index/receipt,
hash substitution, held-data erasure, key destruction, double erasure, missing
payload replay, and rebuild-after-erasure tests pass.

Exit criteria: erasure can remove recoverable plaintext without rewriting event
authority or hiding that a classified payload existed. `v0.8.1 implementation
stop reached. Run pentest for this exact commit.`

## `0.9.0` — Pure Aggregate Framework

Status: planned.

Setup: define pure decide/evolve contracts, rejection semantics, state version,
event-batch bounds, replay limits, and corruption behavior.

Goal: standardize deterministic state change before persistence exists.

Deliverables:
- Aggregate traits, bounded event batches, and replay driver.
- Reusable determinism/state-machine testkit.

Verification: decide-twice, prefix replay, invalid sequences, version mismatch,
rejection-no-mutation, exhaustion, model, and fuzz sequence tests pass.

Exit criteria: equal inputs yield equal outputs and replay is bounded.
`v0.9.0 implementation stop reached. Run pentest for this exact commit.`

## `0.10.0` — In-Memory Incident Vertical Slice

Status: planned.

Setup: constrain the incident model to create/assign, explicit authorization
facts, in-memory journal/projection/audit, and a non-production CLI.

Goal: prove command-to-event-to-projection-to-replay flow end to end.

Deliverables:
- Minimal incident aggregate, dispatcher, memory journal, projection, and audit.
- Bounded demo CLI plus projection teardown/rebuild fixtures.

Verification: unauthorized/wrong-tenant/stale/duplicate commands, corrupt replay,
rebuild equivalence, exhaustion, golden scenarios, and sequence fuzzing pass.
Twin tenants deliberately reuse local IDs to prove scope is structural.

Exit criteria: the vertical slice is deterministic and truthfully in-memory.
`v0.10.0 implementation stop reached. Run pentest for this exact commit.`
