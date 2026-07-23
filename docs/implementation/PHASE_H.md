# Phase H — Alerts And Security Operations

Scope: `0.71.0–0.80.0`. Sources authenticate; parsing and correlation remain bounded and explainable.

## `0.71.0` — Authenticated Alert Ingestion
Status: planned. Setup: source identities, signatures/tokens, replay windows, schemas, quotas, tenant routing. Goal: trustworthy bounded intake. Deliverables: ingest protocol/port and receipts. Verification: spoof/replay/flood, wrong tenant, key rotation, malformed framing, backpressure pass. Exit criteria: unauthenticated alerts never enter authority. `v0.71.0 implementation stop reached. Run pentest for this exact commit.`

## `0.71.1` — Syslog And Security-Webhook Ingestion Profiles

Status: planned only for exact production profiles; unimplemented syslog/
webhook schema families are deferred at `0.140.9`. Network/TLS/parser
implementations require version-bound admission.

Setup: pin only authenticated, pre-filtered, alert-bearing syslog transports/
framing/message profiles and named security-webhook schemas; source/device
identity, mTLS/signature/token, facility/severity, hostname/app/proc/message
IDs, structured data, timestamps/clock quality, webhook event IDs, content
type/encoding, replay windows, ordering, acknowledgement, quotas, tenant
routing, bounded raw-evidence retention, and `0.20.3` provenance. General-
purpose raw log collection, indexing, querying, detection-rule execution, and
unauthenticated UDP alert authority are explicit non-goals for `1.0.0`.

Goal: accept common security telemetry through narrow authenticated profiles
without treating arbitrary text/JSON or source severity as trusted authority.

Deliverables: authenticated syslog listener and webhook receiver ports/adapters,
bounded framing/codecs, source registry, alert-bearing schema mapping packs,
raw evidence links with bounded retention, receipts, quarantine/rejection
handling for untrusted inputs, conformance corpora, and deployment guidance.

Verification: source/tenant spoofing, delimiter/length confusion, truncation,
Unicode/control/log injection, timestamp/severity manipulation, signature/token
replay, compression/JSON bombs, schema smuggling, connection floods,
backpressure/drop accounting, malformed corpus, and fuzzing pass.

Exit criteria: every authoritative alert names an authenticated source and
exact alert-bearing profile/schema. Unauthenticated UDP and arbitrary raw
syslog are rejected or quarantined as non-authoritative bounded evidence and
cannot create alerts. Supporting raw log management or detection rules requires
a separately designed high-volume SIEM architecture and milestone.
`v0.71.1 implementation stop reached. Run pentest for this exact commit.`

## `0.71.2` — STIX And TAXII Threat-Intelligence Profiles

Status: planned only for intended exact STIX/TAXII production profiles;
otherwise deferred at `0.140.9`. HTTP/TLS/JSON and signature implementations
require admission before code begins.

Setup: pin specification versions, TAXII server/API-root/collection identity,
authentication, discovery, pagination/time filters, object IDs/types/versions,
created/modified/revoked times, markings, confidence, relationships, sightings,
indicator patterns, source trust, manifests/checkpoints, retry/backoff,
deletion/revocation, raw object retention, and tenant/purpose policy.

Goal: ingest threat intelligence as untrusted provenance-aware facts without
granting indicators automatic correlation or containment authority. TAXII/STIX
publication is not implemented by this milestone.

Deliverables: TAXII client/source adapter, bounded STIX codec/validator, marking
and relationship mapping, collection checkpoint state, quarantine, immutable
raw-to-derived provenance, conformance corpus, operator runbook, and explicit
publication non-claim.

Verification: server/collection/tenant confusion, object-ID/version collision,
marking bypass, malicious relationship graph/pattern, revoked-object reuse,
pagination/checkpoint rollback, duplicate/reordered updates, source-confidence
inflation, JSON/decompression bombs, SSRF/auth leak, rate storms, and fuzz pass.

Exit criteria: threat-intelligence facts retain exact source, version, marking,
confidence, and revocation state and cannot trigger privileged actions directly.
`v0.71.2 implementation stop reached. Run pentest for this exact commit.`

## `0.71.3` — Threat-Intelligence Marking Enforcement

Status: planned.

Setup: map admitted STIX object and granular markings into Vitheim data classes,
audiences, purposes, handling obligations, derivative/combination rules,
retention, and export/federation prohibitions. Define conservative behavior for
unknown, conflicting, downgraded, revoked, or unsupported markings and preserve
marking lineage through normalization and derived facts.

Goal: ensure ingested threat-intelligence restrictions remain enforceable after
the object leaves the TAXII adapter.

Deliverables: versioned marking-policy compiler and evaluator, provenance-bound
obligations, propagation adapters for search/snippets/counts, graph/correlation
paths, federation/shared spaces, exports/reports, notifications, plugins, and
AI context packs; explanation traces; migration/reindex hooks; and cross-surface
conformance matrix.

Verification: marking strip/downgrade, granular-object mismatch, derived-data
laundering, conflicting markings, unauthorized graph intermediate/count/snippet,
federation audience expansion, export/plugin/notification leak, AI retrieval,
cache/index lag, revocation/reindex, and policy-version differential tests pass.

Exit criteria: every surfaced or derived threat-intelligence fact carries
effective marking obligations, and unknown/conflicting markings fail closed
across every registered read or egress surface. `v0.71.3 implementation stop
reached. Run pentest for this exact commit.`

## `0.72.0` — Alert Normalization
Status: planned. Setup: immutable raw evidence, canonical derived alert fields,
versioned mappings, limits, and unknown-field policy. Goal: normalize without
mutating source bytes or losing provenance. Deliverables: mapper/compiler,
normalized model, and raw-to-derived digest links. Verification: parser confusion,
smuggling, coercion, raw mutation, oversized/deep input, mapping version, fuzz
pass. Exit criteria: normalized facts remain traceable. `v0.72.0 implementation stop reached. Run pentest for this exact commit.`

## `0.73.0` — Deduplication Engine
Status: planned. Setup: identity keys, windows, collision handling, immutable
membership assertions, versioning, and budgets. Goal: reduce repeats without
merging or deleting raw evidence. Deliverables: deterministic grouping engine
and explanation. Verification: collision abuse, boundary windows, order
permutations, evidence mutation/loss, cross-tenant keys, properties pass. Exit criteria: every grouping is explainable/reversible. `v0.73.0 implementation stop reached. Run pentest for this exact commit.`

## `0.74.0` — Suppression And Maintenance Windows
Status: planned. Setup: authority, scope, reason, schedule, expiry, caps,
visibility, override, and immutable underlying alert evidence. Goal: controlled
display/routing reduction without source mutation. Deliverables: suppression
aggregate/evaluator and audit. Verification: overbroad/immortal suppression,
evidence deletion, timezone abuse, self-approval, hidden active rules, bypass
pass. Exit criteria: suppressed alerts remain evidenced. `v0.74.0 implementation stop reached. Run pentest for this exact commit.`

## `0.75.0` — Topology And Temporal Correlation
Status: planned. Setup: define a minimal topology-fact port with deterministic
fake, admitted edges, time windows, confidence, scoring, traversal/work limits,
and explanation; do not claim the Phase I service graph. Goal: group related
alerts safely against a replaceable topology contract. Deliverables: pure
correlation planner/engine and fake topology corpus. Verification: poisoning,
graph cycles, hidden-node inference, order dependence, exhaustion, differential
fixtures pass; real graph integration is repeated at `0.88.0`. Exit criteria:
correlations cite bounded evidence and no later graph capability is assumed.
`v0.75.0 implementation stop reached. Run pentest for this exact commit.`

## `0.76.0` — Alert-To-Incident Orchestration
Status: planned. Setup: creation/link thresholds, policy, rate limits, idempotency, feedback-loop guards. Goal: automate cases without flooding or unauthorized links. Deliverables: orchestration workflow and audit trace. Verification: storms, duplicate creation, malicious linking, suppressed alerts, races, rollback pass. Exit criteria: every incident/link has policy evidence. `v0.76.0 implementation stop reached. Run pentest for this exact commit.`

## `0.77.0` — Security-Incident Domain
Status: planned. Setup: classification, containment authority, evidence visibility, roles, lifecycle, regulatory flags. Goal: typed response cases. Deliverables: aggregate, activities, workspace projections. Verification: containment escalation, evidence leaks, role takeover, closure bypass, tenant/replay pass. Exit criteria: sensitive actions require explicit capability. `v0.77.0 implementation stop reached. Run pentest for this exact commit.`

## `0.78.0` — Vulnerability Findings And Remediation
Status: planned. Setup: scanner/source identity, asset evidence, scoring versions, dedup, acceptance, remediation. Goal: trustworthy vulnerability cases. Deliverables: finding/remediation aggregates and importer. Verification: spoofing, score tamper, stale findings, cross-asset/tenant links, false closure, parser fuzz pass. Exit criteria: risk changes retain source and authority. `v0.78.0 implementation stop reached. Run pentest for this exact commit.`

## `0.78.1` — Vulnerability Identity And Affected-Asset Assertions

Status: planned.

Setup: distinguish advisory/vulnerability identity, vendor/scanner finding
identity, affected asset or software instance, product/version/configuration,
observed/business-valid/recorded times, source confidence, evidence, fix
availability, and affected/not-affected/fixed assertions. Exact CVE/CVSS/VEX
profiles remain versioned inputs selected by `0.140.9`, not hard-coded truth.

Goal: model vulnerability knowledge and each asset exposure without conflating a
global advisory, scanner result, or mutable asset record.

Deliverables: vulnerability/advisory aggregate, affected-asset assertion model,
typed source references, alias/equivalence rules, provenance projections, and
bounded ingestion/reconciliation testkit.

Verification: identifier collision, forged advisory/source, wrong asset/software
link, stale product match, destructive deduplication, conflicting affected/VEX
claims, reopened exposure, tenant confusion, parser fuzz, and replay pass.

Exit criteria: every exposure states which asset/software is affected, according
to which source/version/evidence and time. `v0.78.1 implementation stop reached. Run pentest for this exact commit.`

## `0.78.2` — Exposure Prioritization And Risk Decisions

Status: planned.

Setup: define versioned inputs for severity, exploit maturity/known exploitation,
reachability/exposure, asset and service criticality, data class, business
impact, compensating controls, confidence, age, remediation availability, and
policy deadlines. Base scanner severity is evidence, never the final decision.

Goal: prioritize remediation explainably across technical and business context.

Deliverables: pure exposure-priority engine, policy versions, explanation trace,
override/acceptance commands, queue projections, and recalculation protocol when
facts or policies change.

Verification: score inflation, missing/stale facts, forged criticality/control,
non-monotonic rules, overflow, priority starvation, unauthorized override,
policy downgrade, order permutations, bulk recalculation, and tenant tests pass.

Exit criteria: every priority and due date is reproducible from named evidence
and a pinned policy version. `v0.78.2 implementation stop reached. Run pentest for this exact commit.`

## `0.78.3` — Remediation Campaigns, Exceptions, And Verification

Status: planned.

Setup: define remediation owner/team, affected scope snapshot, tasks, patch/
configuration/change links, maintenance windows, deadlines, compensating
controls, risk acceptance with expiry, deferral, false-positive challenge,
verification source, recurrence, and closure/reopen rules.

Goal: manage vulnerabilities with the same typed lifecycle rigor as assets,
incidents, changes, approvals, and evidence.

Deliverables: remediation-campaign and exception aggregates, task/change
orchestration, SLA projections, bulk-safe commands, verification/reopen
workflow, notifications, and audit explanations.

Verification: unauthorized mass close/accept, self-approval, scope drift,
duplicate tasks, stale scan closure, false verification, immortal exception,
change-window bypass, notification flood, race/replay, rollback, and recovery pass.

Exit criteria: an exposure closes only from authorized evidence-backed
verification or remains in an explicit expiring exception state. `v0.78.3
implementation stop reached. Run pentest for this exact commit.`

## `0.78.4` — Vulnerability Program Conformance And Reporting

Status: planned.

Setup: define source coverage/freshness, inventory denominator, exposure/remedy/
exception states, SLA policy, recurrence, aging, trends, service/team views,
executive aggregates, export policy, and accuracy/unknown-state rules.

Goal: provide an operational vulnerability-management system whose dashboards
and reports remain traceable to assets, sources, decisions, and remediation.

Deliverables: vulnerability workspace/API projections, coverage and aging
reports, campaign dashboards, scanner differential corpus, authorization
registry entries, and program runbook.

Verification: missing-source false assurance, denominator manipulation, hidden
asset/count inference, stale dashboard, cross-team/tenant leakage, report/formula
injection, export bypass, source outage, rebuild, and large-inventory load pass.

Exit criteria: program status distinguishes verified coverage from unknown or
stale data and never treats absence of findings as proof of safety. `v0.78.4
implementation stop reached. Run pentest for this exact commit.`

## `0.78.5` — CVE, CVSS, And VEX Interchange Profiles

Status: planned only for exact production profiles chosen for implementation;
other versions/formats are deferred at `0.140.9`. Codecs, feeds, signatures,
and clients require implementation admission.

Setup: pin CVE record/feed/API and CVSS/VEX specification/serialization versions;
source/vendor identity, vulnerability/product identifiers, configurations,
score vector/version/source/time, VEX product identity and status/justification/
impact/action, signatures/provenance, updates/rejections, paging/checkpoints,
licensing, quotas, and raw-record preservation.

Goal: translate standardized vulnerability information into `0.78.1` source
assertions without collapsing conflicting advisories, scores, product matches,
or VEX statements into mutable truth.

Deliverables: bounded codecs/adapters, canonical source envelopes, product/
identifier mapping, versioned scoring parser, VEX assertion mapping, feed
checkpoint/reconciliation, quarantine, conformance corpora, and runbook.

Verification: identifier/product/CPE-style confusion, score/vector/version
smuggling, forged source/signature, VEX status/justification abuse, stale/rejected
record reuse, conflicting vendors, pagination rollback, licensing/source drift,
oversized/deep records, parser differentials, fuzzing, and rebuild pass.

Exit criteria: every imported vulnerability, score, and VEX status remains a
versioned attributable assertion; local exposure and risk decisions stay
authoritative. `v0.78.5 implementation stop reached. Run pentest for this exact commit.`

## `0.79.0` — Forensic Timeline, Preservation, And Evidence Custody
Status: planned. Setup: immutable content-addressed original bytes, tenant/case
scope, envelope encryption, acquisition actor/tool/source/method/location, time
claim plus clock quality/uncertainty, transfers, access/copy/transform/export,
legal hold, preservation notice, disposition, and parent digests. Goal: preserve
complete custody without normalizing conflicting clocks or mutating raw evidence.
Deliverables: evidence aggregate, timeline, custody report, and signed export
manifest covering every derived artifact. Verification: timestamp tamper,
substitution, custody/hold/disposition gaps, unauthorized access/export,
derived-parent mismatch, conflicting clocks, crypto-erasure and restore pass.
Exit criteria: evidence lineage is complete or explicitly incomplete. `v0.79.0 implementation stop reached. Run pentest for this exact commit.`

## `0.80.0` — Integrated SecOps Workspace
Status: planned. Setup: pin current schemas/policies, source integrations,
migrations, deterministic search-port and service-health fakes, on-call/paging/
notification/status-publication integration, and representative attacks. Goal:
prove integrated alert-to-response behavior without claiming Phase J search.
Deliverables: workspace, fake search contract fixtures, runbooks, operational
evidence, paging/status integration fixtures, and service-health contract.
Verification: cross-source/tenant leaks, paging storms/ack races, quiet-hour/
emergency precedence, unauthorized status publication, current authorization/
export parity, fake-search/health contracts, load, recovery, upgrade, full
phase pentest pass; real service-health, graph, and search integration repeats
at `0.82.1`, `0.88.0`, and `0.100.0`. Exit criteria: SecOps scope and
unavailable later-phase dependencies are truthful and not called a full SIEM.
`v0.80.0 implementation stop reached. Run pentest for this exact commit.`
