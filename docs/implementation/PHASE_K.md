# Phase K — Compliance And Risk

Scope: `0.301.0–0.310.0`. Frameworks are signed versioned data, not hard-coded
authority. Packs describe requirements and mappings; they never silently grant
permissions, accept risk, waive controls, or execute remediation. After pack
simulation, `0.311.0–0.312.0` add the separately scoped privacy-case and
fulfilment domains.

## `0.301.0` — Signed Framework-Pack Format

Status: planned.
Setup: define canonical manifest/content digests, stable pack and content IDs,
schema/semantic versions, source and licensing metadata, signer trust roots,
signer rotation/distrust, compatibility, pack dependencies, expiry, revocation,
supersession, and downgrade floors.
Goal: make portable framework content authentic, reviewable, and replaceable.
Deliverables: bounded pack model and codec, signature/verification port,
dependency resolver, trust and rotation registry, quarantine, compatibility
report, and activation candidate.
Verification: manifest/content substitution, dependency omission/cycle,
signature/key-lineage downgrade, revoked/expired signer, ambiguous encoding,
license removal, decompression/graph bombs, and parser fuzz pass.
Exit criteria: only a complete, licensed, compatible pack under a current
trusted signer can become an activation candidate; verification is not activation.
`v0.301.0 implementation stop reached. Run pentest for this exact commit.`

## `0.302.0` — Requirement And Control Graph

Status: planned.
Setup: define typed requirement, objective, control, control implementation,
owner, system/service scope, mapping and dependency edges; source/version,
cardinality, temporal validity, correction, applicability predicates, inherited
scope, and bounded traversal.
Goal: provide one framework-neutral compliance graph without erasing each
framework's meaning or creating generic mutable records.
Deliverables: graph aggregates and port, mapping provenance, applicability
evaluator interface, explanation paths, overlay hooks, and rebuild projection.
Verification: malicious cycle/path explosion, wrong-type mapping, hidden
obligation, duplicate/conflicting mappings, scope inheritance leak, correction
rewrite, tenant confusion, and deterministic rebuild pass.
Exit criteria: every requirement/control relationship retains exact source,
version, scope, applicability, and correction history.
`v0.302.0 implementation stop reached. Run pentest for this exact commit.`

## `0.303.0` — Evidence Requirements And Lineage

Status: planned.
Setup: define required evidence type/subject/period/freshness/quality, approved
collector and method, continuous versus point-in-time cadence, digest, custody,
transformation, redaction, retention, access, source confidence, invalidation,
and third-party provenance.
Goal: make control satisfaction a reproducible evidence decision rather than a
checkbox or uploaded-file assertion.
Deliverables: evidence-requirement and assessment aggregates, lineage graph,
continuous-control observation port, admissibility evaluator, gaps, and
redacted evidence export view.
Verification: evidence forgery/reuse, subject/period substitution, detached
provenance, stale continuous signal, collector downgrade, redaction leak,
custody break, cross-tenant access, and rebuild differential pass.
Exit criteria: every satisfaction or failure cites the exact admissibility
rule, evidence set, assessment time, policy version, and unresolved gaps.
`v0.303.0 implementation stop reached. Run pentest for this exact commit.`

## `0.304.0` — NIST CSF Pack

Status: planned.
Setup: pin the authoritative NIST CSF version/source and retrieval digest,
licensing/attribution, functions/categories/subcategories, implementation
examples, organizational profiles, tiers if selected, mappings, applicability,
pack dependencies, and signer.
Goal: provide reviewed version-specific NIST CSF planning and assessment content.
Deliverables: signed pack, source provenance, mapping rationale, applicability
fixtures, overlay examples, change log, and expected conflict corpus.
Verification: source drift, category/mapping omission, false normative status,
activation/downgrade, overlay conflict, unsupported-version, and pack rebuild pass.
Exit criteria: Vitheim claims only the exact reviewed source and mappings and
does not present implementation examples or custom mappings as NIST authority.
`v0.304.0 implementation stop reached. Run pentest for this exact commit.`

## `0.305.0` — DORA Pack

Status: planned.
Setup: pin authoritative legal text/version and provenance; define entity,
service and jurisdiction applicability inputs, effective dates, obligations,
deadlines, evidence, reporting links, dependency/overlay semantics, legal
review ownership, licensing, and signing.
Goal: support governed DORA assessment without silently making legal conclusions.
Deliverables: signed pack, applicability questionnaire/evaluator, mandatory-
evidence matrix, interpretation notes, conflict fixtures, and update runbook.
Verification: entity/jurisdiction/date substitution, applicability fail-open,
mandatory-evidence bypass, stale interpretation, downgrade, conflicting overlay,
source drift, and unauthorized legal-note change pass.
Exit criteria: every DORA result states its inputs, source version, reviewed
interpretation, uncertainty, and evidence; Vitheim does not supply legal advice.
`v0.305.0 implementation stop reached. Run pentest for this exact commit.`

## `0.306.0` — ITIL Practice Packs

Status: planned.
Setup: define exact licensed content boundary, version and attribution;
practice-to-Vitheim mapping, optional organization overlay, dependency,
precedence, applicability, workflow/configuration references, and activation.
Goal: support configurable ITIL-aligned practices without hard-coding one
organization's process or misrepresenting licensed guidance.
Deliverables: reviewed signed packs, overlay schema, precedence explanations,
workflow linkage descriptors, sample organization profiles, and conflict corpus.
Verification: licensing omission, source-content leakage, unsafe override,
dependency/order ambiguity, workflow semantic conflict, downgrade, hidden
mandatory mapping, and activation/rollback pass.
Exit criteria: base, licensed, and organization-authored content remain visibly
distinct and no claim exceeds the reviewed licensed material.
`v0.306.0 implementation stop reached. Run pentest for this exact commit.`

## `0.307.0` — Licensed And Custom Standards Importer

Status: planned.
Setup: define isolated staging, source/owner/license declaration, pack schema,
signature, content and graph quotas, mapping proposal, namespace allocation,
review roles, conflict report, rejection, and retention.
Goal: onboard authorized standards and custom control sets without allowing
uploaded content to become executable policy or active obligations.
Deliverables: bounded importer/validator, quarantine workspace, proposed
mapping set, license/provenance manifest, review/approval workflow, and
deterministic canonical pack builder.
Verification: malicious content/schema, namespace collision, mapping escalation,
formula/graph/parser bomb, license absence/substitution, forged signer, hidden
dependency, duplicate import, and approval race pass.
Exit criteria: import creates only a quarantined candidate; activation requires
separate current authority over the exact reviewed digest and conflict result.
`v0.307.0 implementation stop reached. Run pentest for this exact commit.`

## `0.308.0` — Risk, Treatment, And Exception Workflows

Status: planned.
Setup: define risk statement, source and affected scope, owner, likelihood/
impact methodology, inherent/residual score, assumptions, controls, treatment,
acceptance authority, exception/waiver precedence, approvals, review cadence,
expiry, revocation, supersession, and evidence.
Goal: make risk and exception decisions explicit, bounded, and accountable.
Deliverables: risk/treatment/exception aggregates, deterministic scoring
interface, approval workflows, review calendar, policy attributes, and history.
This milestone is the exclusive authority for accepted risks, treatments,
exceptions, and waivers. Supplier assessments from `0.150.0` contribute only
typed evidence, findings, or inert `RiskProposal` values; they cannot create or
mutate an accepted risk decision.
Verification: self-acceptance, score/method substitution, broad/immortal
exception, waiver-precedence bypass, stale owner/control/evidence, hidden
decision, proposal-as-acceptance, parallel supplier exception, approval reuse,
expiry/revocation race, and tenant leak pass.
Exit criteria: accepted residual risk and every exception name exact scope,
method, evidence, authority, precedence, expiry, and next review.
`v0.308.0 implementation stop reached. Run pentest for this exact commit.`

## `0.309.0` — Control Testing, Findings, And Reports

Status: planned.
Setup: define control/test plan/version, population and sample selection,
executor independence, procedure, schedule, continuous observations, evidence,
result, deviation/finding, remediation linkage, reviewer, report audience,
redaction, correction, and rerun.
Goal: produce evidence-backed assurance without hiding negative or superseded results.
Deliverables: test execution and finding aggregates, sampling manifest,
continuous-control evaluator adapter, review workflow, bounded reports/exports,
and result lineage.
Verification: plan/procedure/sample/result substitution, falsified execution,
self-review, selective rerun, negative-result deletion, stale continuous data,
unauthorized report/count inference, export redaction, and rebuild pass.
Exit criteria: every result and report can be rebuilt from the exact plan,
sample, executor, evidence, corrections, review, and policy snapshot.
`v0.309.0 implementation stop reached. Run pentest for this exact commit.`

## `0.310.0` — Pack Impact And Conflict Simulator

Status: planned.
Setup: define current/candidate pack set, dependency and organization overlays,
explicit precedence classes, applicability inputs, signer/key changes, added/
removed/changed requirements, evidence consequences, exception conflicts,
runtime evaluator versions, bounded simulation, and activation digest.
Goal: explain semantic and operational consequences before pack activation.
Deliverables: deterministic simulator, dependency/overlay resolver, conflict
and impact report, applicability differential, evidence-gap plan, approval
binding, rollback floor, and post-activation correspondence check.
Verification: precedence ambiguity, signer rotation/downgrade, hidden removed
obligation, overlay/exception conflict, applicability drift, graph/work bomb,
stale input, simulation/runtime differential, and rollback pass.
Exit criteria: activation binds the exact candidate, inputs, resolver/evaluator
versions, impact report, approval, and safe rollback floor; unresolved
conflicts cannot activate.
`v0.310.0 implementation stop reached. Run pentest for this exact commit.`
