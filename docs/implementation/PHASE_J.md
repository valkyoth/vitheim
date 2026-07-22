# Phase J — Search And Knowledge

Scope: `0.91.0–0.100.0`. Search is disposable and never an authorization oracle.

## `0.91.0` — Canonical Query AST
Status: planned. Setup: typed fields/operators, sorts, pagination, temporal/graph clauses, complexity budget. Goal: database-independent safe queries. Deliverables: AST, validator, canonical codec. Verification: malformed/type-confused queries, nesting/work bombs, unstable sort, fuzz/property pass. Exit criteria: invalid/expensive queries fail before adapters. `v0.91.0 implementation stop reached. Run pentest for this exact commit.`

## `0.92.0` — Search Projection Pipeline
Status: planned. Setup: document schema/version, event offsets, deletes, rebuild, policy labels, checkpoints. Goal: reliable disposable indexing. Deliverables: index projection port and memory engine. Verification: missing/duplicate/reordered updates, stale delete/policy, crash/rebuild, tenant pass. Exit criteria: index rebuild equals authoritative visibility. `v0.92.0 implementation stop reached. Run pentest for this exact commit.`

## `0.93.0` — Lexical Full-Text Search
Status: planned. Setup: tokenizer/version, bounded document/query, ranking, snippets, cancellation. Goal: replaceable lexical search. Deliverables: lexical adapter and explain trace. Verification: query injection, pathological tokens, oversized docs, Unicode, ranking determinism, fuzz/load pass. Exit criteria: parser and execution are bounded. `v0.93.0 implementation stop reached. Run pentest for this exact commit.`

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

## `0.99.0` — Knowledge Articles And Runbooks
Status: planned. Setup: draft/review/publish, audience, safe content, versions, expiry, feedback, provenance. Goal: governed reusable knowledge. Deliverables: knowledge aggregate, renderer, contextual suggestions. Verification: stored injection, publication bypass, poisoning, hidden linkage, stale article, search parity pass. Exit criteria: trusted content has approval/version evidence. `v0.99.0 implementation stop reached. Run pentest for this exact commit.`

## `0.100.0` — Unified Search Conformance Suite
Status: planned. Setup: enumerate API/read/search/export visibility across identities, fields, history, graph, and lag. Goal: prove authorization equivalence. Deliverables: generated corpus, differential harness, coverage report. Verification: all engines, rebuilds, revocations, tenants, counts/snippets/facets pass. Exit criteria: no search surface lacks a negative authorization case. `v0.100.0 implementation stop reached. Run pentest for this exact commit.`

