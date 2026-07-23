# Phase N — Complete Product Experience

Scope: `0.131.0–0.140.0`. UI actions are commands or policy-filtered reads.

## `0.131.0` — Unified Shell And Command Palette
Status: planned. Setup: action registry, discovery policy, keyboard model, context, confirmation. Goal: one safe navigation/action shell. Deliverables: shell and palette. Verification: unauthorized discovery/execution, stale context, shortcut spoofing, injection, accessibility pass. Exit criteria: discovery never grants authority. `v0.131.0 implementation stop reached. Run pentest for this exact commit.`

## `0.132.0` — Role-Specific Workspaces
Status: planned. Setup: declarative panels/queues/actions, `0.55.0` RBAC role
policy, field redaction, saved state, and tenant/user defaults. Goal: focused
operational views. Deliverables: workspace definitions/rendering and
role-template mappings. Verification: field/count/action leakage, layout-
inferred privilege, role change, cache state, tenant switching, accessibility
pass. Exit criteria: workspace visibility equals current read/action policy and
never grants the role it visually represents. `v0.132.0 implementation stop
reached. Run pentest for this exact commit.`

## `0.132.1` — Composable Interface Blocks And Dashboard Layouts

Status: planned.

Setup: define versioned safe blocks for lists, queues, cards, metrics, charts,
timelines, graphs, forms, record details, actions, navigation, filters, text,
and status; typed input/output slots; admitted API queries/actions; responsive
grid constraints; refresh/cancellation; data/field classifications; budgets;
accessibility; provenance; tenant/team/role/user ownership; sharing; versioning;
draft/preview/review/publish/rollback; and migration. Arbitrary browser scripts,
raw queries, HTML, database access, and hidden API endpoints are forbidden.

Goal: let organizations build and rearrange interfaces like governed Lego
blocks without creating a parallel application or authorization system.

Deliverables: UI composition IR/schema, block registry and compiler, drag/drop
layout builder, preview simulator, signed/versioned dashboard aggregate,
responsive renderer, configuration-as-code format, reusable templates, and
safe custom-block extension contract tied to the plugin capability system.

Verification: malicious/deep/oversized layouts, unauthorized block/action/data
source, hidden field/count inference, stored XSS/CSS/URL injection, drag/drop
state corruption, stale RBAC/policy, shared-dashboard takeover, tenant/cache
leakage, refresh/query storms, block/plugin substitution, rollback/migration,
keyboard/screen-reader/mobile behavior, and fuzz/property tests pass.

Exit criteria: users may freely compose admitted blocks, but rendered data and
available actions never exceed current API, RBAC/ABAC, field, purpose, budget,
and accessibility rules. `v0.132.1 implementation stop reached. Run pentest for this exact commit.`

## `0.132.2` — Organization-Scale Information Architecture Profiles

Status: planned.

Setup: define navigation/workspace profiles independent of domain schemas:
`Unified Operations` for smaller organizations that want tickets, requests,
incidents, alerts, vulnerabilities, and assets in one bounded page; `Separated
Operations` for larger organizations with dedicated service-desk, incident,
SecOps, vulnerability, asset, change, and administration areas; and governed
custom profiles. Define role defaults, landing routes, deep links, shared
filters, cross-module pivots, profile inheritance, migration, and fallbacks.

Goal: support radically different operating models without forking the product,
duplicating data, or changing command/read/authorization semantics.

Deliverables: built-in small-company and enterprise profile packs, profile
compiler, tenant/team/role selection rules, migration/diff preview, navigation
and workspace templates, cross-profile deep-link contract, and admin guidance.

Verification: module hiding mistaken for denial, hidden-route access, privilege
through profile selection, profile/role mismatch, stale saved links, cross-
module filter leakage, duplicate actions, oversized unified page, mobile/
accessibility regressions, migration rollback, and identical API/RBAC
differential scenarios across profiles pass.

Exit criteria: the same authorized operation has identical domain and policy
semantics whether shown on one unified page, a dedicated module page, or a
tenant-composed workspace. `v0.132.2 implementation stop reached. Run pentest for this exact commit.`

## `0.133.0` — Schema And Form Builder
Status: planned. Setup: safe widgets, schema constraints, preview, versioning, approval, migration. Goal: governed custom applications. Deliverables: builder/compiler and diff/review. Verification: malicious schema, stored UI injection, hidden required fields, recursion/size, unauthorized activation pass. Exit criteria: builder emits only validated declarative artifacts. `v0.133.0 implementation stop reached. Run pentest for this exact commit.`

## `0.134.0` — Workflow And Policy Builder
Status: planned. Setup: canonical IR, simulation, explanation, diff, signing, separation of duties. Goal: reviewable automation/policy authoring. Deliverables: editors and activation flow. Verification: hidden behavior, generated escalation, simulation drift, signature substitution, bombs pass. Exit criteria: activation binds reviewed artifacts. `v0.134.0 implementation stop reached. Run pentest for this exact commit.`

## `0.135.0` — Dashboards And Report Builder
Status: planned. Setup: bounded query/report plans, aggregates, scheduling, export policy, quotas. Goal: safe operational reporting. Deliverables: builder, renderer, scheduler. Verification: expensive queries, unauthorized aggregates/counts, formula/export injection, tenant/cache leakage pass. Exit criteria: reports reveal no more than source reads. `v0.135.0 implementation stop reached. Run pentest for this exact commit.`

## `0.136.0` — Request Portal And Generic Cases
Status: planned. Setup: external identity, enumeration resistance, public forms, case types, uploads, messaging. Goal: safe requester and custom-case experience. Deliverables: portal and case aggregate. Verification: account/case enumeration, cross-user/tenant access, spam, upload abuse, XSS/CSRF pass. Exit criteria: external users see only explicit portal projections. `v0.136.0 implementation stop reached. Run pentest for this exact commit.`

## `0.137.0` — Configuration-As-Code And Signed Changes
Status: planned. Setup: canonical bundles, provenance/signatures, plan/diff, policy, approval, staged apply/rollback. Goal: auditable reproducible configuration. Deliverables: compiler, planner, apply engine. Verification: substitution, stale plan, unauthorized activation, partial apply, rollback, secret inclusion pass. Exit criteria: applied config equals reviewed digest. `v0.137.0 implementation stop reached. Run pentest for this exact commit.`

## `0.138.0` — External API v1 Candidate
Status: planned. Setup: define an external API codec distinct from internal event
encoding, resource/field schemas, exact expected-version/ETag behavior,
idempotency, authenticated signed pagination cursors, request decompression and
streaming limits, cancellation, consistency/read-your-write tokens, errors,
quotas, and compatibility. Goal: freeze a bounded external contract without
coupling it to event storage. Deliverables: API v1 candidate, schema/codec,
compatibility golden corpus, and conformance client. Verification: mass
assignment, IDOR, cursor forgery/replay, decompression bombs, streaming overflow,
stale ETag, cancellation races, consistency-token confusion, version downgrade,
and differential tests pass. Exit criteria: the external API has one documented
encoding and no internal event representation leaks. `v0.138.0 implementation
stop reached. Run pentest for this exact commit.`

## `0.138.1` — Private SDK Candidate

Status: planned; private and `publish = false`.

Setup: derive typed clients from the `0.138.0` contract; define language/runtime
scope, compatibility, retries/idempotency, ETags, cursors, cancellation, error
mapping, redaction, test fakes, version support, licensing candidate, and
artifact provenance without enabling a registry path.

Goal: test whether an SDK can faithfully represent API v1 before any publication
decision.

Deliverables: private SDK candidate(s), generated/manual-code provenance,
contract-test harness, compatibility matrix, and support-cost evidence.

Verification: generated-code substitution, secret logging, retry duplication,
cursor/ETag misuse, cancellation loss, version skew, malicious server responses,
package tamper, and API differential tests pass.

Exit criteria: SDK candidates remain private and publication stays impossible
until `0.140.7`. `v0.138.1 implementation stop reached. Run pentest for this exact commit.`

## `0.138.2` — Import Staging And Validation

Status: planned.

Setup: define external import codec/profile, authenticated source, staging
namespace, schema/version validation, quotas, decompression/streaming limits,
referential checks, conflict plan, dry run, approval, cancellation, resume, and
atomic promotion through normal commands.

Goal: accept bulk external data without bypassing domain, policy, audit, or
event-evolution rules.

Deliverables: staging service/port, validator, reviewable import plan, quarantine,
resumable execution, reconciliation report, and cleanup proof.

Verification: parser/decompression bombs, forged source, cross-tenant references,
mass assignment, stale plan, duplicate resume, partial promotion, cancellation,
erased-data resurrection, unknown schema, and rollback tests pass.

Exit criteria: imported data becomes authoritative only through reviewed normal
commands. `v0.138.2 implementation stop reached. Run pentest for this exact commit.`

## `0.138.3` — Export Policy Snapshots And Manifests

Status: planned.

Setup: define export purpose/scope, immutable policy/subject/field snapshot,
consistency token, streaming format/version, quotas, cancellation, encryption,
signing, retention/expiry, delivery, derived-artifact lineage, and revocation.

Goal: produce bounded attributable exports without authorization drift or hidden
copies.

Deliverables: export aggregate/process, policy snapshot, signed manifest,
streaming encoder, delivery receipt, deletion/disposition proof, and verifier.

Verification: policy change during export, hidden field/count, cross-tenant
mix-up, formula/content injection, truncation/substitution, cursor/token replay,
cancel/resume races, expired delivery, derived-copy erasure, and manifest tests pass.

Exit criteria: every export is bound to the exact authorized snapshot and has a
verifiable lifecycle. `v0.138.3 implementation stop reached. Run pentest for this exact commit.`

## `0.139.0` — Accessibility, Localization, And Mobile Layouts
Status: planned. Setup: WCAG target, keyboard/screen-reader matrix, locale/message provenance, bidi/time/number rules, responsive breakpoints. Goal: inclusive consistent UI. Deliverables: localization/accessibility infrastructure and audits. Verification: localization injection, bidi spoofing, client-state leakage, keyboard/screen-reader/browser matrix pass. Exit criteria: core workflows are fully operable without pointer/one locale. `v0.139.0 implementation stop reached. Run pentest for this exact commit.`

## `0.140.0` — Operator And Tenant Administration Console
Status: planned. Setup: separate platform/tenant/support roles, impersonation controls, dangerous confirmations, audit, recovery. Goal: complete administration without hidden DB access. Deliverables: consoles and runbooks. Verification: privilege crossing, tenant takeover, unsafe bulk change, support abuse, secret exposure, recovery pass. Exit criteria: every admin action is a governed command. `v0.140.0 implementation stop reached. Run pentest for this exact commit.`
