# Phase J — Search And Knowledge

Scope: `0.91.0–0.100.0`. Search is disposable and never an authorization oracle.

## `0.91.0` — Canonical Query AST
Status: planned. Setup: typed fields/operators, sorts, pagination, temporal/graph clauses, complexity budget. Goal: database-independent safe queries. Deliverables: AST, validator, canonical codec. Verification: malformed/type-confused queries, nesting/work bombs, unstable sort, fuzz/property pass. Exit criteria: invalid/expensive queries fail before adapters. `v0.91.0 implementation stop reached. Run pentest for this exact commit.`

## `0.92.0` — Search Projection Pipeline
Status: planned. Setup: document schema/version, event offsets, deletes, rebuild, policy labels, checkpoints. Goal: reliable disposable indexing. Deliverables: index projection port and memory engine. Verification: missing/duplicate/reordered updates, stale delete/policy, crash/rebuild, tenant pass. Exit criteria: index rebuild equals authoritative visibility. `v0.92.0 implementation stop reached. Run pentest for this exact commit.`

## `0.93.0` — Lexical Full-Text Search
Status: planned. Setup: tokenizer/version, bounded document/query, ranking,
snippets, cancellation, and memory reference implementation. Goal: define
replaceable lexical semantics before a hosted engine. Deliverables: lexical port,
memory reference adapter, golden corpus, and explain trace. Verification: query
injection, pathological tokens, oversized docs, Unicode, ranking determinism,
fuzz/load pass. Exit criteria: parser and execution are bounded and portable.
`v0.93.0 implementation stop reached. Run pentest for this exact commit.`

## `0.93.1` — PostgreSQL Full-Text Search Adapter

Status: planned; blocked until this milestone extends the `0.24.0` admission
record for exact PostgreSQL full-text/tokenization capabilities.

Setup: map the `0.93.0` lexical port to pinned PostgreSQL configuration,
language/tokenizer versions, generated parameterized statements, tenant
partitioning, policy labels, ranking/pagination, cancellation, rebuild, quotas,
and capability probes.

Goal: own one production search backend for the default HA profile without
requiring a separate search cluster.

Deliverables: PostgreSQL lexical/index adapter, migrations, capability report,
golden differential corpus, rebuild tooling, and operator guide.

Verification: query/operator injection, tenant/policy leakage, tokenizer drift,
ranking/pagination instability, stale delete/revocation, cancellation, index
corruption, rebuild, failover, and memory-versus-hosted differential tests pass.

Exit criteria: the default HA profile has a tested production search backend;
other engines remain unsupported until separately admitted. `v0.93.1
implementation stop reached. Run pentest for this exact commit.`

## `0.94.0` — Facets, Queues, And Saved Views
Status: planned. Setup: count visibility, view owner/sharing, parameters, pagination, quotas. Goal: reusable operational discovery. Deliverables: facets/view aggregates and APIs. Verification: unauthorized counts, shared-view leakage, parameter injection, stale policy, expensive facets pass. Exit criteria: aggregates disclose no more than records. `v0.94.0 implementation stop reached. Run pentest for this exact commit.`

## `0.95.0` — Permission-Aware Indexing
Status: planned. Setup: document/field labels, query-time checks, revocation propagation, cache keys, snippets. Goal: policy-equivalent search. Deliverables: visibility filters and reindex/revocation protocol. Verification: field/snippet/cache/count leaks, lag windows, role change, tenant pairs pass. Exit criteria: denied data never appears in result metadata. `v0.95.0 implementation stop reached. Run pentest for this exact commit.`

## `0.96.0` — Temporal And History Search
Status: planned. Setup: valid/recorded time filters, event access, retention, historical redaction, bounds. Goal: safe history discovery. Deliverables: temporal query operators/index projections. Verification: historical access bypass, deleted/expired inference, interval edges, huge ranges pass. Exit criteria: historical search honors policy at query time. `v0.96.0 implementation stop reached. Run pentest for this exact commit.`

## `0.97.0` — Relationship And Impact Search
Status: planned. Setup: path grammar, allowed edges, authorization, depth/work, ranking, explanation. Goal: searchable service/evidence graph. Deliverables: graph search port/planner. Verification: path disclosure, cycles, unauthorized intermediate nodes, explosion, ranking manipulation pass. Exit criteria: results include policy-safe path proof. `v0.97.0 implementation stop reached. Run pentest for this exact commit.`

## `0.98.0` — Semantic-Index Interface
Status: planned. Setup: embedding provider boundary, model/version, residency, redaction, tenant partitions, deletion. Goal: optional replaceable similarity search. Deliverables: vector port and provenance model. Verification: cross-tenant similarity, embedding leakage, poisoning, stale deletion, provider failure pass. Exit criteria: lexical/product correctness never depends on vectors. `v0.98.0 implementation stop reached. Run pentest for this exact commit.`

## `0.98.1` — Hosted Semantic-Index Adapter And Isolation

Status: planned only if semantic similarity is intended for a production
profile; otherwise it is explicitly unavailable at `0.140.8`. Blocked until an
exact vector engine/extension, client/TLS stack, storage format, maintenance,
license, unsafe/native code, and operational profile are admitted.

Setup: bind tenant/purpose/data-class partitions, document/chunk and embedding
IDs, source/policy/model/version/dimension/distance metric, pre-filter and
post-verification rules, candidate/overfetch/work limits, encryption, ingestion
checkpoints, updates/deletion/retention/erasure, re-embedding migration, rebuild,
backup/restore, cancellation, quotas, and degraded/disabled behavior.

Goal: own one replaceable production semantic-index implementation without
allowing similarity infrastructure to become an authorization oracle or
mandatory product dependency.

Deliverables: admitted hosted adapter, capability probes, policy-filter plan,
tenant/model namespaces, deletion verifier, migration/rebuild tooling, memory-
versus-hosted differential corpus, load harness, and operator runbook.

Verification: cross-tenant/purpose/model recall, hidden candidate/count leakage,
filter-after-retrieval bypass, embedding inversion/exfiltration, poisoned vector,
dimension/metric confusion, stale policy/deletion, erasure/retention failure,
re-embedding split state, backup/restore, outage/fallback, query exhaustion,
side-channel, and differential/load tests pass.

Exit criteria: every enabled semantic result is tenant/purpose/policy safe and
rebuildable for a pinned model/index profile; without this evidence, production
similarity remains disabled. `v0.98.1 implementation stop reached. Run pentest for this exact commit.`

## `0.99.0` — Knowledge Articles And Runbooks
Status: planned. Setup: draft/review/publish, audience, safe content, versions, expiry, feedback, provenance. Goal: governed reusable knowledge. Deliverables: knowledge aggregate, renderer, contextual suggestions. Verification: stored injection, publication bypass, poisoning, hidden linkage, stale article, search parity pass. Exit criteria: trusted content has approval/version evidence. `v0.99.0 implementation stop reached. Run pentest for this exact commit.`

## `0.100.0` — Unified Search Conformance Suite
Status: planned. Setup: register every search interface in the `0.58.0`
authority/tenant registry and enumerate API/read/search/export visibility across
identities, fields, history, graph, lag, and Phase E/H fake-port contracts. Goal:
prove authorization equivalence and replace earlier fakes with real integration.
Deliverables: generated corpus, differential harness, ITSM/SecOps integration
retests, and coverage report. Verification: all engines, rebuilds, revocations,
tenants, counts/snippets/facets, and fake-versus-real contracts pass.
Exit criteria: no search surface lacks a negative authorization case. `v0.100.0
implementation stop reached. Run pentest for this exact commit.`
