# Phase M — Optional AI Capabilities

Scope: `0.121.0–0.130.0`. AI is untrusted advice with no implicit authority.

## `0.121.0` — Provider-Neutral AI Interface
Status: planned. Setup: model/provider identity, request purpose, bounded input/output, cancellation, failure, provenance. Goal: replaceable inference. Deliverables: provider port and fake test provider. Verification: impersonation, fallback, timeout, malformed output, budget pass. Exit criteria: no domain API depends on a provider type. `v0.121.0 implementation stop reached. Run pentest for this exact commit.`

## `0.122.0` — Classification, Redaction, And Residency Gateway
Status: planned. Setup: data classes, allowed purpose/provider/region, field redaction, retention, audit. Goal: policy-gate every model request. Deliverables: broker gateway and decision record. Verification: hidden-field/region leak, encoding bypass, derived data, logging, fallback pass. Exit criteria: denied data never reaches providers. `v0.122.0 implementation stop reached. Run pentest for this exact commit.`

## `0.123.0` — Model, Prompt, And Purpose Registry
Status: planned. Setup: immutable versions/digests, approval, compatibility, rollback, expiry. Goal: prevent hidden model/prompt changes. Deliverables: registry aggregate and activation flow. Verification: substitution, downgrade, unapproved purpose, stale model, rollback/audit pass. Exit criteria: inference cites exact approved versions. `v0.123.0 implementation stop reached. Run pentest for this exact commit.`

## `0.124.0` — Timeline And Record Summarization
Status: planned. Setup: permission-filtered context, taint boundaries, citations, uncertainty, output schema. Goal: cited advisory summaries. Deliverables: summarizer and reviewer UI. Verification: prompt injection, fabricated/hidden citations, cross-tenant recall, truncation, unsafe rendering pass. Exit criteria: summaries never become record facts automatically. `v0.124.0 implementation stop reached. Run pentest for this exact commit.`

## `0.125.0` — Similarity And Duplicate Suggestions
Status: planned. Setup: tenant/policy filters before retrieval, model/index versions, confidence, feedback. Goal: advisory duplicate discovery. Deliverables: candidate service and explanations. Verification: cross-tenant similarity, poisoning, hidden candidate, adversarial text, stale deletion pass. Exit criteria: users independently confirm links. `v0.125.0 implementation stop reached. Run pentest for this exact commit.`

## `0.126.0` — Triage And Next-Action Suggestions
Status: planned. Setup: allowed suggestions, evidence/citations, confidence, policy constraints, reviewer decision. Goal: useful triage without authority. Deliverables: structured suggestions and feedback. Verification: manipulated assignment, unsafe containment, injection, missing evidence, bias/evaluation regression pass. Exit criteria: suggestions cannot execute. `v0.126.0 implementation stop reached. Run pentest for this exact commit.`

## `0.127.0` — Natural-Language Query Compiler
Status: planned. Setup: compile only to bounded query AST, user-visible plan, authorization after compile, no raw query. Goal: safe language search. Deliverables: compiler, validator, confirmation UI. Verification: generated policy bypass, query bombs, injection, ambiguity, hidden-field request pass. Exit criteria: AST gate controls all execution. `v0.127.0 implementation stop reached. Run pentest for this exact commit.`

## `0.128.0` — Restricted Command Proposals
Status: planned. Setup: allowlisted schemas, real ID resolution, independent policy, human approval, expiry/idempotency. Goal: structured non-executing action proposals. Deliverables: proposal aggregate and review flow. Verification: forged IDs, capability escalation, approval bypass, replay, prompt injection pass. Exit criteria: AI cannot approve or submit its proposal. `v0.128.0 implementation stop reached. Run pentest for this exact commit.`

## `0.129.0` — Evaluation, Provenance, And Feedback
Status: planned. Setup: immutable datasets, access, metrics, baseline, reviewer identity, drift thresholds. Goal: measurable quality/safety gates. Deliverables: evaluation runner and provenance reports. Verification: dataset/score tamper, leakage, hidden model drift, feedback poisoning, reproducibility pass. Exit criteria: regressions block activation. `v0.129.0 implementation stop reached. Run pentest for this exact commit.`

## `0.130.0` — AI Governance And NIST AI RMF Pack
Status: planned. Setup: approved uses, owners, risks, controls, evidence, monitoring, incident/disable process. Goal: govern optional AI lifecycle. Deliverables: signed governance pack and dashboards. Verification: unregistered model/purpose, missing evidence, autonomous-mode attempt, disable/revoke pass. Exit criteria: AI remains optional and policy controlled. `v0.130.0 implementation stop reached. Run pentest for this exact commit.`

