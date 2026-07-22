# Phase N — Complete Product Experience

Scope: `0.131.0–0.140.0`. UI actions are commands or policy-filtered reads.

## `0.131.0` — Unified Shell And Command Palette
Status: planned. Setup: action registry, discovery policy, keyboard model, context, confirmation. Goal: one safe navigation/action shell. Deliverables: shell and palette. Verification: unauthorized discovery/execution, stale context, shortcut spoofing, injection, accessibility pass. Exit criteria: discovery never grants authority. `v0.131.0 implementation stop reached. Run pentest for this exact commit.`

## `0.132.0` — Role-Specific Workspaces
Status: planned. Setup: declarative panels/queues/actions, role policy, field redaction, saved state. Goal: focused operational views. Deliverables: workspace definitions/rendering. Verification: field/count/action leakage, role change, cache state, tenant switching, accessibility pass. Exit criteria: workspace visibility equals read policy. `v0.132.0 implementation stop reached. Run pentest for this exact commit.`

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

## `0.138.0` — Stable API, SDKs, Import, And Export
Status: planned. Setup: API v1/versioning, pagination/idempotency, schemas, quotas, compatibility, SDK licensing decision. Goal: stable supported integration surface. Deliverables: API v1, private SDK candidates, bounded import/export. Verification: mass assignment, IDOR, parser bombs, export bypass, compatibility/differential tests pass. Exit criteria: only explicitly approved SDK crates may change publication policy. `v0.138.0 implementation stop reached. Run pentest for this exact commit.`

## `0.139.0` — Accessibility, Localization, And Mobile Layouts
Status: planned. Setup: WCAG target, keyboard/screen-reader matrix, locale/message provenance, bidi/time/number rules, responsive breakpoints. Goal: inclusive consistent UI. Deliverables: localization/accessibility infrastructure and audits. Verification: localization injection, bidi spoofing, client-state leakage, keyboard/screen-reader/browser matrix pass. Exit criteria: core workflows are fully operable without pointer/one locale. `v0.139.0 implementation stop reached. Run pentest for this exact commit.`

## `0.140.0` — Operator And Tenant Administration Console
Status: planned. Setup: separate platform/tenant/support roles, impersonation controls, dangerous confirmations, audit, recovery. Goal: complete administration without hidden DB access. Deliverables: consoles and runbooks. Verification: privilege crossing, tenant takeover, unsafe bulk change, support abuse, secret exposure, recovery pass. Exit criteria: every admin action is a governed command. `v0.140.0 implementation stop reached. Run pentest for this exact commit.`

