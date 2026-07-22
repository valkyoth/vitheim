# Vitheim Release Plan To 1.0

Status: planning document

Vitheim is built in small releases that can be understood, tested, pentested,
and stopped independently. This list is not a maximum: split a version or add
a corrective patch whenever its scope is too broad for one safe review pass.

Tags use `v0.N.0` for capability milestones, `v0.N.P` for corrections,
`v1.0.0-rc.N` for exact production candidates, and `v1.0.0` only for the first
serious production release. No tag or artifact publication is authorized by
this plan.

The version-by-version implementation handoffs live in the
[Implementation Plan](IMPLEMENTATION_PLAN.md); the summary tables below never
replace their required setup, deliverables, verification, or pentest stops.

## Required Format And Setup

The detailed handoff for every active version must name:

- **Status**: planned, implementing, awaiting pentest, or ready to tag;
- **Goal**: one bounded outcome;
- **Deliverables**: implementation, documentation, fixtures, and evidence;
- **Verification**: version-specific positive, negative, boundary, property,
  fuzz, conformance, integration, failure, migration, and operational tests;
- **Exit criteria**: observable completion followed by an exact-commit pentest.

Before work starts, update latest stable Rust and verification tooling, confirm
official sources and current practices, assign crate boundaries, draft the
threat-model and attack-surface delta, define budgets/non-goals, and write the
release notes and pentest scope. Crates remain private and Rust files remain at
most 500 lines. Third-party Cargo code remains forbidden unless a future,
explicit policy decision changes that rule.

## Universal Verification And Exit Criteria

Each table row below supplies the release-specific goal/deliverable and primary
verification/pentest target. It is additive to all of these gates:

- formatting, check, unit/integration/doc tests, Clippy, documentation links,
  source-size, `no_std`, dependency-direction, publication, license, advisory,
  SBOM, and supported-platform checks;
- threat-model, attack-surface, unsafe-code, dependency, license, toolchain,
  API/schema/protocol compatibility, and performance deltas;
- property tests for changed invariants and fuzzing for changed untrusted
  parsers;
- authorization, tenant isolation, resource exhaustion, audit, and failure
  tests for every affected boundary;
- forward/rollback migration and backup/restore evidence where data changes;
- release notes, known limitations, CI, CodeQL default setup, and signed
  release-evidence review.

When a row's deliverable and verification pass, stop and report:

```text
vX.Y.Z implementation stop reached. Run pentest for this exact commit.
```

Do not tag. Fix findings, rerun all gates, obtain a permanent `Status: PASS`
report for the exact reviewed commit, and run the readiness gate. Critical or
high findings always block release. Patch versions add corrections only and
follow the same process.

## Phase A — Pure Foundation

Setup: N0/N1 only, no I/O, allocator use explicit, no external code.
Goal: establish canonical deterministic types and state transitions.
Phase exit: the in-memory incident slice replays identically and passes its
exact-commit pentest.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.1.0` | Workspace, architecture laws, threat-model format, CI, private crates, and release baseline | Repository trust, CI permissions, action pins, source/publication policy, fail-closed release gate |
| `0.2.0` | Typed IDs, injected time primitives, and stable error codes | Domain confusion, malformed IDs, canonical forms, time overflow, diagnostic leakage |
| `0.3.0` | Shared budgets and fixed-capacity primitives | Allocation/work exhaustion, integer overflow, budget reset, partial mutation |
| `0.4.0` | Canonical bounded dynamic value model | Deep nesting, invalid types, duplicate fields, oversized values, deterministic ordering |
| `0.5.0` | Schema definitions, evolution classes, and field constraints | Constraint bypass, contradictions, recursion bombs, version confusion |
| `0.6.0` | Deterministic bounded internal codec | Truncation, non-canonical bytes, trailing data, decoder differential and fuzz tests |
| `0.7.0` | Context and command envelope | Spoofed actor, missing tenant, duplicate command/idempotency key, target confusion |
| `0.8.0` | Immutable event envelope | Metadata/tenant/stream confusion, schema abuse, causality gaps, tamper attempts |
| `0.9.0` | Pure aggregate `decide`/`evolve` framework | Invalid transitions, rejection mutation, nondeterminism, bounded replay |
| `0.10.0` | In-memory incident CLI vertical slice | End-to-end tenant/authorization assumptions, replay, projection rebuild, audit completeness |

## Phase B — Journal And Projection Mechanics

Setup: retain pure semantic contracts; adapters use project-owned in-memory
implementations. Goal: prove ordered, replayable, failure-aware state mechanics.
Phase exit: corrupt streams are detected and projections rebuild from authority.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.11.0` | Semantic event-journal interface | Contract ambiguity, tenant omission, partial append semantics |
| `0.12.0` | Deterministic in-memory journal | Ordering, stream isolation, bounded reads, crash simulation |
| `0.13.0` | Expected-version concurrency | Lost updates, stale writers, duplicated events, race model tests |
| `0.14.0` | Snapshots and validation | Stale, forged, truncated, cross-tenant, or poisoned snapshots |
| `0.15.0` | Projection engine and checkpoints | Skipped, duplicated, reordered events and invalid checkpoints |
| `0.16.0` | Transactional outbox model | Event without message, message without event, rollback gaps |
| `0.17.0` | Inbox and idempotent consumer model | Replay, duplicate effects, poisoned receipts, crash windows |
| `0.18.0` | Leases, timers, and scheduler primitives | Double ownership, clock shifts, expired lease use, retry storms |
| `0.19.0` | Integrity chains and signed-checkpoint interface | Event deletion, reordering, substitution, domain separation |
| `0.20.0` | Replay, verification, and projection-rebuild CLI | Corrupt streams, unbounded replay, evidence omission, unsafe repair |

## Phase C — Storage Portability

Setup: approve each hosted boundary independently; no wire protocol is exposed
to domain code. Goal: identical semantic behavior across documented backends.
Phase exit: export/import and the conformance suite preserve tenant and event
integrity. Under the current no-third-party policy, unavailable safe backend
implementations remain blocked rather than being implemented casually.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.21.0` | Storage capability negotiation | False claims, downgrade, unsafe optional fallback |
| `0.22.0` | Mandatory storage conformance testkit | Test bypass, weak adapters, backend-specific divergence |
| `0.23.0` | SQLite single-node adapter | Locking, rollback, injection, file permissions, tenant partition |
| `0.24.0` | PostgreSQL reference production adapter | Transactions, authentication, injection, tenant isolation |
| `0.25.0` | MySQL adapter | Isolation/encoding differences, rollback, tenant enforcement |
| `0.26.0` | MongoDB adapter | Transaction boundaries, query injection, collection isolation |
| `0.27.0` | SurrealDB adapter | Namespace/graph/query isolation and capability truthfulness |
| `0.28.0` | Blob-store API and filesystem adapter | Traversal, symlinks, races, content mismatch, quotas |
| `0.29.0` | Migration registry and resumable migrations | Interrupted/malicious migrations, downgrade and rollback safety |
| `0.30.0` | Cross-backend export and import | Substitution, truncation, tenant mix-up, integrity loss |

## Phase D — Universal Work Platform

Setup: every mutation is a command and every read is policy-filtered. Goal:
shared work composition without one universal mutable ticket table. Phase exit:
the first authenticated UI/API slice passes cross-module isolation testing.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.31.0` | Shared work-item components | Cross-type and custom-field confusion |
| `0.32.0` | Generic task aggregate | Unauthorized completion, dependency bypass, replay |
| `0.33.0` | Configurable lifecycle state machines | Illegal transitions, loops, unreachable states |
| `0.34.0` | Assignment groups and ownership | Assignment privilege escalation and stale ownership |
| `0.35.0` | Comments, mentions, watchers, and activity | Stored content injection, field leaks, notification abuse |
| `0.36.0` | Attachment quarantine lifecycle | Malware, archive bombs, type confusion, download authorization |
| `0.37.0` | Priority, severity, and impact models | Manipulation, overflow, inconsistent derived priority |
| `0.38.0` | Calendars, targets, and SLA calculations | Time zones, holidays, DST, clock boundaries, exhaustion |
| `0.39.0` | Approval and notification foundations | Self-approval, duplicate decision, delivery replay |
| `0.40.0` | First authenticated API and service-desk UI | IDOR, CSRF, XSS, session fixation, field leakage |

## Phase E — IT Service Management

Setup: reuse work foundations; domain invariants stay in focused crates. Goal:
complete a coherent ITSM beta. Phase exit: cross-module workflows and policy
matrices pass the phase pentest.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.41.0` | Incident management | Unauthorized assignment, resolution, closure, major-impact manipulation |
| `0.42.0` | Service-request management | Input abuse, entitlement and fulfillment bypass |
| `0.43.0` | Catalog items and request forms | Schema injection, pricing/entitlement manipulation |
| `0.44.0` | Problem management | Cross-incident disclosure and invalid linkage |
| `0.45.0` | Known errors and workarounds | Unsafe or unauthorized publication and stale advice |
| `0.46.0` | Change management | Approval bypass, conflict and schedule manipulation |
| `0.47.0` | Release and deployment records | False status, unauthorized linkage, evidence forgery |
| `0.48.0` | Major-incident command process | Role takeover, notification floods, hidden decisions |
| `0.49.0` | Postmortems and corrective actions | Sensitive publication, deletion, blame/identity leakage |
| `0.50.0` | Integrated ITSM beta | Cross-module authorization, workflow chaining, replay and upgrades |

## Phase F — Identity, Tenancy, And Policy

Setup: authentication supplies facts; policy alone grants authority. Goal:
complete deny-by-default access control across all current interfaces. Phase
exit: the authorization conformance matrix covers command/read/export/search.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.51.0` | Formal tenant isolation model | Cross-tenant reads/writes/caches/indexes/blobs/logs |
| `0.52.0` | Subjects, identities, and service principals | Identity confusion, impersonation, lifecycle gaps |
| `0.53.0` | Hosted OIDC and WebAuthn integration | Token validation, replay, downgrade, session fixation |
| `0.54.0` | Directory and group synchronization | Group takeover, stale privilege, deletion/recreation |
| `0.55.0` | RBAC engine | Role escalation, inherited cycles, hidden grants |
| `0.56.0` | ABAC engine | Missing attributes, type confusion, fail-open decisions |
| `0.57.0` | Relationship-based authorization | Malicious paths, ownership spoofing, traversal bounds |
| `0.58.0` | Field redaction and policy obligations | Hidden-field leaks through APIs, search, export, notification |
| `0.59.0` | Delegation and break-glass access | Unbounded/non-expiring privilege, weak approval/audit |
| `0.60.0` | Authorization conformance suite | Complete action/read/field/search/export permission equivalence |

## Phase G — Durable Workflows

Setup: workflow definitions compile to deterministic IR; hosted effects return
as events. Goal: durable execution without hidden code or authority. Phase exit:
HA workers preserve exactly documented at-least-once/idempotent semantics.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.61.0` | Workflow intermediate representation | Invalid graphs, instruction/depth bombs, hidden behavior |
| `0.62.0` | Deterministic workflow interpreter | Infinite loops, nondeterminism, replay divergence |
| `0.63.0` | Human tasks and approvals | Task theft, self-approval, stale authorization |
| `0.64.0` | Timers, deadlines, and retries | Retry storms, clock manipulation, duplicated effects |
| `0.65.0` | Parallel branches and joins | Premature joins, duplicate completion, branch leaks |
| `0.66.0` | Compensation mechanics | Double compensation and incomplete rollback |
| `0.67.0` | Signals and subworkflows | Signal spoofing, cross-tenant routing, recursion exhaustion |
| `0.68.0` | Workflow versioning and migration | State corruption, unsafe remap, downgrade |
| `0.69.0` | Visual/configuration-as-code compiler | Hidden flags, generated privilege escalation, divergence |
| `0.70.0` | HA workflow workers | Lease loss, duplicate activity, poison work, failover |

## Phase H — Alerts And Security Operations

Setup: all sources authenticate and all normalization remains bounded. Goal:
turn alerts into explainable security cases without claiming a full SIEM.
Phase exit: integrated SecOps isolation and evidence custody pass pentest.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.71.0` | Authenticated alert ingestion | Source spoofing, replay, flooding, tenant confusion |
| `0.72.0` | Alert normalization | Parser confusion, field smuggling, oversized records |
| `0.73.0` | Deduplication engine | Collision abuse and evidence loss |
| `0.74.0` | Suppression and maintenance windows | Malicious suppression and expiry bypass |
| `0.75.0` | Topology and temporal correlation | Poisoning, hidden-node inference, graph exhaustion |
| `0.76.0` | Alert-to-incident orchestration | Incident flooding, unauthorized linking, feedback loops |
| `0.77.0` | Security-incident domain | Evidence access and containment privilege |
| `0.78.0` | Vulnerability findings and remediation | Finding spoofing and risk-score manipulation |
| `0.79.0` | Forensic timeline and evidence custody | Timestamp tamper, custody gaps, export leakage |
| `0.80.0` | Integrated SecOps workspace | Cross-source/tenant leakage and authorization equivalence |

## Phase I — Assets, Configuration, And Services

Setup: store provenance-aware facts, not unquestioned mutable truth. Goal:
physical, virtual, cloud, software, CMDB, and service lifecycle with impact.
Phase exit: graph authorization and reconciliation are explainable and bounded.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.81.0` | Asset lifecycle | Ownership/disposal changes, evidence removal, illegal states |
| `0.82.0` | Business and technical services | Service-owner escalation and tenant linkage |
| `0.83.0` | Typed relationship graph | Malicious cycles, unauthorized edges, traversal bounds |
| `0.84.0` | Provenance and confidence | Source impersonation, confidence inflation, evidence detach |
| `0.85.0` | Bitemporal facts | Historical rewrite, overlaps, invalid intervals |
| `0.86.0` | Discovery and import interface | Poisoned sources, oversized imports, replay |
| `0.87.0` | Reconciliation engine | Source-priority abuse, destructive merge, nondeterminism |
| `0.88.0` | Dependency impact analysis | Exhaustion and hidden-node inference |
| `0.89.0` | Software and license inventory | Forged inventory, entitlement and contract leakage |
| `0.90.0` | Interactive service map | Graph authorization, browser injection, stale policy |

## Phase J — Search And Knowledge

Setup: search is a projection and never an authorization oracle. Goal: unified,
permission-safe lexical, temporal, graph, and optional semantic discovery.
Phase exit: search/API conformance proves identical visibility.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.91.0` | Canonical query AST | Complexity, malformed query, type and parser abuse |
| `0.92.0` | Search projection pipeline | Stale permissions, missing/duplicate indexing |
| `0.93.0` | Lexical and full-text search | Query injection and document-size exhaustion |
| `0.94.0` | Facets, queues, and saved views | Unauthorized counts and shared-view leakage |
| `0.95.0` | Permission-aware indexing | Field/snippet/cache leakage and reindex revocation |
| `0.96.0` | Temporal and history search | Historical access bypass and event inference |
| `0.97.0` | Relationship and impact search | Graph path disclosure and traversal exhaustion |
| `0.98.0` | Semantic-index interface | Embedding leakage, cross-tenant similarity, poisoning |
| `0.99.0` | Knowledge articles and runbooks | Unsafe content, poisoning, publication bypass |
| `0.100.0` | Unified search conformance suite | Search/API/read/export authorization equivalence |

## Phase K — Compliance And Risk

Setup: frameworks are signed, versioned data with licensing metadata. Goal:
framework-neutral controls, obligations, evidence, exceptions, and simulation.
Phase exit: pack conflicts and impact are explainable before activation.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.101.0` | Signed framework-pack format | Substitution, downgrade, signature and licensing confusion |
| `0.102.0` | Requirement and control graph | Malicious mappings, cycles, hidden obligations |
| `0.103.0` | Evidence requirements and lineage | Forgery, detached provenance, cross-tenant evidence |
| `0.104.0` | Versioned NIST CSF pack | Activation, mapping integrity, source provenance |
| `0.105.0` | Versioned DORA pack | Applicability and mandatory-evidence bypass |
| `0.106.0` | Versioned ITIL practice packs | Overlay conflicts, licensing metadata, unsafe override |
| `0.107.0` | Licensed/custom standards importer | Untrusted pack content and mapping escalation |
| `0.108.0` | Risk, treatment, and exception workflows | Self-acceptance, immortal exceptions, hidden owner |
| `0.109.0` | Control testing, findings, and reports | Falsified tests and report leakage |
| `0.110.0` | Pack impact and conflict simulator | Precedence error and simulation/runtime divergence |

## Phase L — WASM And Integrations

Setup: use versioned component interfaces and project-owned capability types;
never expose direct database access. Goal: bounded replaceable extensions.
Phase exit: cross-plugin/tenant isolation and compatibility suite pass pentest.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.111.0` | Versioned WIT component interfaces | ABI confusion and malformed components |
| `0.112.0` | Deterministic component execution | Fuel bypass, nondeterminism, covert host access |
| `0.113.0` | Effectful component execution | Unauthorized host calls and replay effects |
| `0.114.0` | Capability and secret-handle model | Capability escalation and secret extraction |
| `0.115.0` | Memory/CPU/network/output metering | Resource-limit bypass and host denial of service |
| `0.116.0` | Signed plugin registry and rollout | Signature downgrade, malicious update, rollback |
| `0.117.0` | Connector SDK and testkit | SSRF, replay, connector impersonation |
| `0.118.0` | Mail, webhook, and collaboration connectors | Header injection, spoofing, action-link abuse |
| `0.119.0` | Outbound-only integration agent | Agent takeover, spool extraction, identity theft |
| `0.120.0` | Plugin compatibility/isolation suite | Cross-plugin and cross-tenant interference |

## Phase M — Optional AI Capabilities

Setup: AI remains untrusted, optional, policy-filtered, provenance-recorded,
and unable to execute commands directly. Goal: useful advisory capability with
measurable safety. Phase exit: governance, injection, retrieval, and tool-abuse
tests pass without any autonomous authority claim.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.121.0` | Provider-neutral AI interface | Provider impersonation and unsafe fallback |
| `0.122.0` | Classification, redaction, and residency gateway | Sensitive-field and cross-region leakage |
| `0.123.0` | Model, prompt, and purpose registry | Prompt/model substitution and unapproved purpose |
| `0.124.0` | Timeline and record summarization | Injection, fabricated citations, hidden-field recall |
| `0.125.0` | Similarity and duplicate suggestions | Cross-tenant retrieval and poisoning |
| `0.126.0` | Triage and next-action suggestions | Manipulated assignment and unsafe advice |
| `0.127.0` | Natural-language query compiler | Generated authorization bypass and query bombs |
| `0.128.0` | Restricted command proposals | Escalation, forged IDs, approval bypass |
| `0.129.0` | Evaluation, provenance, and reviewer feedback | Evaluation tamper and hidden model drift |
| `0.130.0` | AI governance and NIST AI RMF pack | Policy gaps and accidental autonomous mode |

## Phase N — Complete Product Experience

Setup: every UI action maps to a command or policy-filtered read; no hidden
database manipulation. Goal: accessible, localizable, operable full product.
Phase exit: administrators and external portal users pass full boundary review.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.131.0` | Unified shell and command palette | Unauthorized action discovery/execution |
| `0.132.0` | Role-specific operational workspaces | Field and aggregate leakage |
| `0.133.0` | Schema and form builder | Malicious schemas and stored UI injection |
| `0.134.0` | Workflow and policy builder | Generated privilege escalation and hidden behavior |
| `0.135.0` | Dashboards and bounded report builder | Query exhaustion and aggregate inference |
| `0.136.0` | Request portal and generic cases | External-user isolation and enumeration |
| `0.137.0` | Configuration-as-code and signed changes | Substitution, unauthorized activation, rollback abuse |
| `0.138.0` | Stable API, SDKs, import, and export | Mass assignment and export-policy bypass |
| `0.139.0` | Accessibility, localization, mobile layouts | Localization injection and client-state leakage |
| `0.140.0` | Operator and tenant administration console | Administrative privilege and support boundaries |

## Phase O — Production Hardening

Setup: freeze compatibility dimensions progressively and test real operations.
Goal: reliable single-node and HA deployments with recoverable upgrades. Phase
exit: production candidate has passed external pentest and all acceptance tests.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.141.0` | Single-node production packaging | Permissions, defaults, secret exposure, clean install |
| `0.142.0` | Split API/worker/ingest/index deployments | Service identity and network authorization |
| `0.143.0` | HA leases, failover, and partitions | Split brain, duplicate processing, fencing |
| `0.144.0` | Regional placement and residency | Cross-region leakage and unsafe failover |
| `0.145.0` | Backup, restore, and disaster recovery | Substitution, incomplete restore, RPO/RTO claims |
| `0.146.0` | Performance, load, soak, and chaos certification | Exhaustion, cascading failure, noisy tenants |
| `0.147.0` | Final security and supply-chain hardening | Artifact, dependency, CI, builder, key compromise |
| `0.148.0` | API/event/plugin/pack compatibility freeze | Downgrade and version confusion |
| `0.149.0` | Release candidate and external pentest remediation | Complete platform attack paths and clean retest |
| `0.150.0` | Final production-readiness candidate | Install, upgrade, restore, rollback, failover, evidence |

## `1.0.0` — Serious Production Release

Status: planned; not reached by schedule alone

### Goal

Release Vitheim only when the complete claimed product and operational profile
are independently evidenced as production-ready.

### Deliverables

- Stable API v1, plugin ABI v1, framework-pack v1, export format v1, and agent
  protocol v1 with documented compatibility and migration policy.
- Production ITSM, SecOps, vulnerability, assets/software assets/CMDB/service
  graph, knowledge, risk/compliance, cases, workflow/policy builders, search,
  integrations, optional AI, administration, import/export, and reporting.
- Documented single-node, HA, regional, backup/restore, rebuild, recovery,
  upgrade, rollback, health, quota, and backpressure operations.
- Identical mandatory conformance for supported production storage profiles;
  SQLite remains limited to its documented single-node profile.

### Verification

- External pentest completed with all critical/high findings fixed and cleanly
  retested; other findings fixed or explicitly time-bound and owned.
- Tenant and authorization matrices cover every API, UI, search, workflow,
  plugin, AI, export, attachment, notification, and administrative interface.
- Every untrusted parser is fuzzed; cryptography is independently reviewed;
  plugin escape and AI injection/tool-abuse suites pass.
- Backup restoration, event integrity, projection/search rebuild, workflow
  continuation, disaster recovery, migration, rollback, load, soak, chaos,
  accessibility, localization, and secure-default tests pass.
- Reproducible signed artifacts, checksums, SBOM, provenance, license report,
  and exact source/tool inputs are complete.

### Exit Criteria

No acceptance criterion is waived merely to meet a date. The exact
`v1.0.0-rc.N` candidate must be stable under the complete gate and external
review; any code or artifact change creates a new candidate. Only then may the
final unchanged candidate be considered for `v1.0.0` promotion after explicit
maintainer authorization. Run final pentest for the exact candidate commit and
artifacts before any tag is created.
