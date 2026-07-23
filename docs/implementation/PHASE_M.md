# Phase M — Optional AI Capabilities

Scope: `0.121.0–0.130.0`. AI is untrusted advice with no implicit authority.

## `0.121.0` — Provider-Neutral AI Interface
Status: planned. Setup: model/provider identity, purpose, bounded input/output,
cancellation, failure and provenance; the broker has no DB credentials, command-
dispatcher dependency, mutation endpoint identity, or repository objects and
uses only immutable permission-aware context packs. Goal: replaceable inference.
Deliverables: provider/retrieval ports and fake provider. Verification:
impersonation, authority wiring, fallback, timeout, malformed output and budgets
pass. Exit criteria: no domain API depends on a provider type. `v0.121.0 implementation stop reached. Run pentest for this exact commit.`

## `0.122.0` — Classification, Redaction, And Residency Gateway
Status: planned. Setup: data classes, allowed purpose/provider/region, field redaction, retention, audit. Goal: policy-gate every model request. Deliverables: broker gateway and decision record. Verification: hidden-field/region leak, encoding bypass, derived data, logging, fallback pass. Exit criteria: denied data never reaches providers. `v0.122.0 implementation stop reached. Run pentest for this exact commit.`

## `0.123.0` — Model, Prompt, And Purpose Registry
Status: planned. Setup: immutable versions/digests, approval, compatibility, rollback, expiry. Goal: prevent hidden model/prompt changes. Deliverables: registry aggregate and activation flow. Verification: substitution, downgrade, unapproved purpose, stale model, rollback/audit pass. Exit criteria: inference cites exact approved versions. `v0.123.0 implementation stop reached. Run pentest for this exact commit.`

## `0.124.0` — Timeline And Record Summarization
Status: planned. Setup: taint all retrieved content, use broker-issued opaque
citation IDs resolved server-side, reapply current policy before rendering,
record context versions/redaction/prompt/output digests, uncertainty and bounded
schema. Goal: cited advisory summaries. Deliverables: summarizer and reviewer UI.
Verification: prompt injection, fabricated/inaccessible/mismatched citations,
cross-tenant recall, truncation and unsafe rendering pass. Exit criteria:
summaries never become record facts automatically. `v0.124.0 implementation stop reached. Run pentest for this exact commit.`

## `0.125.0` — Similarity And Duplicate Suggestions
Status: planned; production enablement requires a passing `0.98.1` adapter or
remains unavailable. Setup: tenant/policy filters before retrieval, exact hosted
capability, model/index versions, confidence, feedback, and no lexical-to-
semantic policy fallback. Goal: advisory duplicate discovery. Deliverables:
candidate service and explanations. Verification: cross-tenant similarity,
poisoning, hidden candidate, adversarial text, stale deletion, adapter outage/
disable pass. Exit criteria: users independently confirm links and production
similarity cannot activate without hosted isolation evidence. `v0.125.0
implementation stop reached. Run pentest for this exact commit.`

## `0.126.0` — Triage And Next-Action Suggestions
Status: planned. Setup: allowed suggestions, evidence/citations, confidence, policy constraints, reviewer decision. Goal: useful triage without authority. Deliverables: structured suggestions and feedback. Verification: manipulated assignment, unsafe containment, injection, missing evidence, bias/evaluation regression pass. Exit criteria: suggestions cannot execute. `v0.126.0 implementation stop reached. Run pentest for this exact commit.`

## `0.127.0` — Natural-Language Query Compiler
Status: planned. Setup: compile only to bounded query AST, user-visible plan, authorization after compile, no raw query. Goal: safe language search. Deliverables: compiler, validator, confirmation UI. Verification: generated policy bypass, query bombs, injection, ambiguity, hidden-field request pass. Exit criteria: AST gate controls all execution. `v0.127.0 implementation stop reached. Run pentest for this exact commit.`

## `0.128.0` — Restricted Command Proposals
Status: planned. Setup: proposal types cannot implement command interfaces;
allowlisted schemas, current real-ID resolution/state/expected version,
independent current policy, human identity/action, expiry and idempotency. Goal:
structured non-executing action proposals. Deliverables: proposal aggregate and
review flow where the human action creates a fresh ordinary command.
Verification: forged IDs, capability escalation, AI-selected approver, approval
bypass, replay and injection pass. Exit criteria: AI cannot approve or submit
its proposal. `v0.128.0 implementation stop reached. Run pentest for this exact commit.`

## `0.129.0` — Evaluation, Provenance, And Feedback
Status: planned. Setup: immutable datasets, access, metrics, baseline, reviewer identity, drift thresholds. Goal: measurable quality/safety gates. Deliverables: evaluation runner and provenance reports. Verification: dataset/score tamper, leakage, hidden model drift, feedback poisoning, reproducibility pass. Exit criteria: regressions block activation. `v0.129.0 implementation stop reached. Run pentest for this exact commit.`

## `0.130.0` — AI Governance And NIST AI RMF Pack
Status: planned. Setup: approved uses, owners, risks, controls, evidence,
monitoring, incident/disable process, and mandatory `0.58.0` authority/tenant/
audit registry entries for retrieval, context, inference, citation, evaluation,
feedback, and proposals. Goal: govern optional AI lifecycle. Deliverables:
signed governance pack, authorization cases, and dashboards. Verification:
unregistered interface/model/purpose, missing evidence, autonomous-mode attempt,
disable/revoke pass. Exit criteria: AI remains optional, policy controlled, and
fully represented in the conformance registry. `v0.130.0 implementation stop
reached. Run pentest for this exact commit.`
