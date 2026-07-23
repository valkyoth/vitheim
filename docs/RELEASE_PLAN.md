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
| `0.8.1` | Sensitive payload lifecycle and neutral surface descriptors | Classification downgrade, plaintext leakage, erasure/rebuild failure, outward registry dependency |
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
| `0.15.1` | Security audit envelope and durable intent | Missing/forged audit authority, command/audit mismatch, duplicate rejection, metadata leakage |
| `0.16.0` | Transactional event/receipt/audit/outbox and typed execution-authority-bound effect intent | Mutation without audit/message, missing live/grant/service authority, offline-human impersonation, target substitution, execution/outcome/evidence collapse |
| `0.16.1` | Atomic command commit bundle | Missing/split command component, audit/receipt digest deletion, denial-chain splice |
| `0.17.0` | Inbox and idempotent consumer model | Replay, duplicate local commits, poisoned receipts, remote-duplication ambiguity |
| `0.17.1` | Atomic consumer commit bundle | Receipt/local-commit split, redelivery duplication, hidden multi-stream or remote-in-transaction work |
| `0.18.0` | Leases, timers, and scheduler primitives | Double ownership, clock shifts, expired lease use, retry storms |
| `0.18.1` | Local exact quota sets with per-kind hierarchical lease encumbrances and fair recovery | Exact-set/deadlock/restore laws, expiry with live bytes/liability/spent tokens, child loss, late settlement, transfer/reclaim race |
| `0.18.2` | Atomic effect-resolution work family with one-owner grants, guards, authority fences, exact quotas, and canonical commits | Authority/grant races, missing fence, lock inversion/retry drift, two-stream mutation, grant/quota/receipt atomic split |
| `0.19.0` | Integrity chains and signed-checkpoint interface | Event deletion, reordering, substitution, domain separation |
| `0.20.0` | Replay, verification, and projection-rebuild CLI | Corrupt streams, unbounded replay, evidence omission, unsafe repair |
| `0.20.1` | Security audit projection, access receipts, and journal | Crash rebuild, bytes released before audit, stream completion/abort gaps, outage policy |
| `0.20.2` | Hosted telemetry semantics and instrumentation contract | Tenant/secret labels, cardinality, trace spoofing, readiness lies, backpressure |
| `0.20.3` | Shared provenance and temporal-fact primitives | Clock collapse, destructive correction, confidence inflation, cross-domain semantic drift |

## Phase C — Storage Portability

Setup: approve each hosted boundary at its first consuming milestone; no wire
protocol is exposed to domain code. Goal: identical semantic behavior across
documented backends.
Phase exit: export/import and the conformance suite preserve tenant and event
integrity. Under the current no-third-party policy, unavailable safe backend
implementations remain blocked rather than being implemented casually.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.21.0` | Storage, authority-fence, and transaction-topology capability negotiation | Missing/non-local epoch, stale external privileged facts, unbounded retry, false co-location/active-active claim, downgrade |
| `0.22.0` | Destructive authority-fence, composite-lock, grant, and quota conformance | Read-before-dispatch TOCTOU, epoch reuse, lock inversion/retry drift, encumbrance reclaim/transfer loss, test bypass |
| `0.23.0` | SQLite single-node adapter | Locking, rollback, injection, file permissions, tenant partition |
| `0.24.0` | PostgreSQL reference production adapter | Transactions/auth/injection/tenant isolation plus authority-epoch races, canonical retry, guard restore, encumbrance transfer/late settlement |
| `0.25.0` | Experimental MySQL adapter | Isolation/encoding differences, rollback, tenant enforcement, no default v1 claim |
| `0.26.0` | Experimental MongoDB adapter | Transaction boundaries, query injection, collection isolation, no default v1 claim |
| `0.27.0` | Experimental SurrealDB adapter | Namespace/graph/query isolation, capability truthfulness, no default v1 claim |
| `0.28.0` | Blob-store API and filesystem adapter | Traversal, symlinks, races, content mismatch, quotas |
| `0.28.1` | S3-compatible object-storage adapter | Tenant/object confusion, endpoint spoofing, multipart races, retention/deletion |
| `0.28.2` | KMS and secret-provider adapters | Key/tenant confusion, rotation/destruction, outage, secret leakage |
| `0.28.3` | In-process secret handling | Formatting/diagnostic/plugin leakage, stale cache, crash/core-dump policy, overstated erasure |
| `0.29.0` | Migration registry and resumable migrations | Interrupted/malicious migrations, downgrade and rollback safety |
| `0.30.0` | Cross-backend export and import | Substitution, truncation, tenant mix-up, integrity loss |
| `0.30.1` | Durable queue preserving effect resolution, authority fences, attempt claims, exact quotas, and encumbrances | Delivery/failover plus revocation TOCTOU, retry identity drift, consumed attempt, lease expiry/child loss/late settlement/transfer |
| `0.30.2` | Cache semantics and hosted adapter | Cross-tenant/policy keys, stale authorization, poisoning, erasure leaks |

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
| `0.36.1` | Malware-scanner adapter and isolation | Scanner impersonation/downgrade, stale verdicts, worker escape, outage |
| `0.37.0` | Priority, severity, and impact models | Manipulation, overflow, inconsistent derived priority |
| `0.38.0` | Calendars, targets, and SLA calculations | Time zones, holidays, DST, clock boundaries, exhaustion |
| `0.38.1` | SLI, SLO, and error-budget models | Source/unit/window confusion, missing-data fail-open, correction and exclusion abuse |
| `0.38.2` | Customer-service measurement plane | Source/tenant spoofing, late/duplicate data, watermark/downsampling distortion, telemetry-plane confusion |
| `0.38.3` | Measurement retention and authoritative rollups | Unsafe substitution/deletion obstruction, inherited/omitted derived disposition, tombstone leak, authority-loss gap |
| `0.39.0` | Approval and notification foundations | Self-approval, duplicate decision, delivery replay |
| `0.39.1` | On-call rotations, overrides, and handoffs | Stale membership, schedule ambiguity, override abuse, coverage gaps |
| `0.39.2` | Paging escalation, acknowledgement, and receipts | Forged acknowledgement, escalation skip, flood/retry loops, provider outage |
| `0.39.3` | Notification preferences, quiet hours, and emergency overrides | Endpoint takeover, mandatory suppression, quiet-hour abuse, notification flood |
| `0.39.4` | Hosted paging and notification delivery | Forged receipts, provider/account confusion, retry storms, outage reconciliation |
| `0.40.0` | First authenticated API and service-desk UI | IDOR, CSRF, XSS, session fixation, field leakage |
| `0.40.1` | API-first application and UI crate boundary | Privileged UI path, forbidden dependencies, headless/UI differential, undocumented actions |

## Phase E — IT Service Management

Setup: reuse work foundations; domain invariants stay in focused crates. Goal:
complete a coherent ITSM beta against deterministic workflow/search port fakes.
Phase exit: current cross-module policy matrices pass; real workflow/search
integration is deferred to `0.70.0` and `0.100.0`.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.41.0` | Incident management | Unauthorized assignment, resolution, closure, major-impact manipulation |
| `0.42.0` | Service-request management | Input abuse, entitlement and fulfillment bypass |
| `0.43.0` | Catalog items and request forms | Schema injection, pricing/entitlement manipulation |
| `0.44.0` | Problem management | Cross-incident disclosure and invalid linkage |
| `0.45.0` | Known errors and workarounds | Unsafe or unauthorized publication and stale advice |
| `0.46.0` | Change management with owned grant lineages and co-located redemption guards | Approval/grant reorder, pre-revocation, successor fork, missing/stale guard, unsafe backout |
| `0.47.0` | Release and deployment records | False status, unauthorized linkage, evidence forgery |
| `0.48.0` | Major-incident command process | Role takeover, notification floods, hidden decisions |
| `0.48.1` | Stakeholder communications and status publishing | Premature/false publication, audience leakage, stale status, correction-history loss |
| `0.48.2` | Hosted status publication and reconciliation | Hidden-field leakage, stale caches, false receipts, correction loss, provider outage |
| `0.49.0` | Postmortems and corrective actions | Sensitive publication, deletion, blame/identity leakage |
| `0.50.0` | Integrated ITSM beta with later-phase port fakes | Cross-module authorization, fake-port contracts, replay and upgrades |

## Phase F — Identity, Tenancy, And Policy

Setup: authentication supplies facts; policy alone grants authority. Goal:
complete deny-by-default access control across all current interfaces. Phase
exit: the authorization conformance matrix covers command/read/export/search.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.51.0` | Formal tenant isolation model | Cross-tenant reads/writes/caches/indexes/blobs/logs |
| `0.51.1` | Tenant lifecycle, topology migration, and enforcement epoch | Suspension/resume racing dispatch, epoch reuse, partial provision/delete, cleanup/key-destroy ordering |
| `0.51.2` | Tenant data-surface lifecycle registry | Backfill/outward-dependency/gate bypass, inherited retention, partial cleanup, evidence inflation |
| `0.52.0` | Subjects, service principals, identity links, and local enforcement epochs | Disable/mapping/principal revocation racing dispatch, epoch reuse, unsafe linking, identity recreation |
| `0.52.1` | OAuth resource-server workload authentication | Credential/mapping epoch race, stale external privileged fact, false sender constraint, bearer escalation, issuer confusion |
| `0.53.0` | Hosted OIDC integration | Discovery, mix-up, token validation, replay, downgrade, session fixation |
| `0.53.1` | Hosted WebAuthn profile and credential lifecycle | RP/origin/challenge binding, attestation, counters, recovery |
| `0.53.2` | Distributed session store with local session epoch | Logout/revocation racing dispatch, epoch reuse, fixation/replay, node failure, partition |
| `0.53.3` | SAML identity profile and adapter | XML signature wrapping, audience/destination mix-up, assertion replay, metadata rollback |
| `0.54.0` | Directory/group synchronization with authorization-fact epoch | Group change racing dispatch, epoch reuse, takeover, stale privilege, deletion/recreation |
| `0.54.1` | SCIM provisioning profile and adapter | External-ID collision, filter/PATCH abuse, group takeover, pagination/bulk bombs |
| `0.55.0` | RBAC engine with role/assignment epochs | Assignment racing dispatch, epoch reuse, escalation, inherited cycles, hidden grants |
| `0.56.0` | ABAC engine | Missing attributes, type confusion, fail-open decisions |
| `0.56.1` | Policy lifecycle, bootstrap, recovery, and monotonic epoch | Activation/rollback racing dispatch, epoch reuse, self-approval, lockout, recovery abuse |
| `0.57.0` | Relationship authorization with fact epochs | Edge change racing dispatch, epoch reuse, malicious paths, ownership spoofing, traversal bounds |
| `0.58.0` | Authority enforcement registry and fence-set backfill | Missing/substituted/reordered/non-local fence, epoch reuse, stale external privileged fact, unsafe freshness classification |
| `0.59.0` | Delegation/break-glass with enforcement epoch | Delegation revoke racing dispatch, epoch reuse, unbounded privilege, grant amplification, weak audit |
| `0.60.0` | Complete delayed-authority conformance suite | Every authority-source race, incomplete fence set, epoch rollback, external staleness, lock inversion/retry drift, interface parity |

## Phase G — Durable Workflows

Setup: workflow definitions compile to deterministic IR; hosted effects return
as events. Goal: durable execution without hidden code or authority. Phase exit:
HA workers preserve exactly documented at-least-once delivery, idempotent local-
commit, and external-outcome semantics.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.61.0` | Workflow intermediate representation | Invalid graphs, instruction/depth bombs, hidden behavior |
| `0.62.0` | Deterministic workflow interpreter | Infinite loops, nondeterminism, replay divergence |
| `0.63.0` | Human approvals with grant-lineage issuance and redemption-guard maintenance | Self-approval, owner ambiguity, issuance reorder, pre-revocation, successor fork, omitted/stale guard |
| `0.64.0` | Timers, deadlines, fenced authority redemption, and bounded retries | Timer authority/clock/duplication plus every revocation race, missing fence, lock inversion/retry drift, final-attempt restore |
| `0.65.0` | Parallel branches and joins | Premature joins, duplicate completion, branch leaks |
| `0.66.0` | Linked, independently authorized and multi-claim-accounted compensation mechanics | State/linkage collapse, unknown original/compensation, evidence/authority race, claim reuse/cross-kind settlement, double rollback |
| `0.67.0` | Signals and subworkflows | Signal spoofing, cross-tenant routing, recursion exhaustion |
| `0.68.0` | Workflow history, versioning, and migration | Unbounded history, corrupt checkpoint, orphan activity, unsafe remap |
| `0.69.0` | Visual/configuration-as-code compiler | Hidden flags, generated privilege escalation, divergence |
| `0.70.0` | HA workers with typed authority, complete fences, exact quotas, and encumbrance-safe leases | Network/crash/failover plus epoch races, retry identity, lease expiry/child loss/late evidence/transfer, attempt restore |

## Phase H — Alerts And Security Operations

Setup: all sources authenticate and all normalization remains bounded. Goal:
turn alerts into explainable security cases without claiming a full SIEM.
Phase exit: integrated SecOps isolation and evidence custody pass pentest.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.71.0` | Authenticated alert ingestion | Source spoofing, replay, flooding, tenant confusion |
| `0.71.1` | Syslog and security-webhook ingestion profiles | Source/framing/schema spoofing, replay, log injection, backpressure/drop evidence |
| `0.71.2` | STIX and TAXII threat-intelligence profiles | Collection/object/marking confusion, graph/pattern bombs, revoked-object reuse |
| `0.71.3` | Threat-intelligence marking enforcement | Marking stripping, derived-data laundering, search/graph/federation/export/AI leakage |
| `0.72.0` | Alert normalization | Parser confusion, field smuggling, oversized records |
| `0.73.0` | Deduplication engine | Collision abuse and evidence loss |
| `0.74.0` | Suppression and maintenance windows | Malicious suppression and expiry bypass |
| `0.75.0` | Topology-port and temporal correlation | Poisoning, hidden-node inference, graph exhaustion, no premature graph claim |
| `0.76.0` | Alert-to-incident orchestration | Incident flooding, unauthorized linking, feedback loops |
| `0.77.0` | Security-incident domain | Evidence access and containment privilege |
| `0.78.0` | Vulnerability findings and remediation | Finding spoofing and risk-score manipulation |
| `0.78.1` | Vulnerability identity and affected-asset assertions | Advisory/finding/asset confusion, conflicting source claims, destructive deduplication |
| `0.78.2` | Exposure prioritization and risk decisions | Score/criticality/control manipulation, stale inputs, unauthorized override |
| `0.78.3` | Remediation campaigns, exceptions, and verification | Mass closure, self-approval, stale verification, immortal exceptions |
| `0.78.4` | Vulnerability program conformance and reporting | Coverage/denominator manipulation, stale dashboards, count/export leakage |
| `0.78.5` | CVE, CVSS, and VEX interchange profiles | Identifier/product/score confusion, forged source, VEX status abuse, feed rollback |
| `0.79.0` | Forensic timeline and evidence custody | Timestamp tamper, custody gaps, export leakage |
| `0.80.0` | Integrated SecOps workspace with search fake | Cross-source/tenant leakage, current authorization, no premature search claim |

## Phase I — Assets, Configuration, And Services

Setup: store provenance-aware facts, not unquestioned mutable truth. Goal:
physical, virtual, cloud, software, CMDB, and service lifecycle with impact.
Phase exit: graph authorization and reconciliation are explainable and bounded.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.81.0` | Asset lifecycle | Ownership/disposal changes, evidence removal, illegal states |
| `0.82.0` | Business and technical services | Service-owner escalation and tenant linkage |
| `0.82.1` | Service health, availability, and SLO binding | False/stale health, raw/rollup authority confusion, override abuse, unknown-to-healthy fail-open |
| `0.83.0` | Typed relationship graph | Malicious cycles, unauthorized edges, traversal bounds |
| `0.84.0` | Provenance and confidence | Source impersonation, confidence inflation, evidence detach |
| `0.85.0` | Bitemporal facts | Historical rewrite, overlaps, invalid intervals |
| `0.86.0` | Discovery and import interface | Poisoned sources, oversized imports, replay |
| `0.86.1` | Concrete CMDB discovery connector | Endpoint/account confusion, identity collision, poisoned relationships, delta gaps, source drift |
| `0.87.0` | Reconciliation engine | Source-priority abuse, destructive merge, nondeterminism |
| `0.88.0` | Dependency impact analysis | Exhaustion and hidden-node inference |
| `0.88.1` | Unified cross-domain operational graph | Wrong-type links, stale provenance, hidden endpoints, rebuild divergence |
| `0.88.2` | Evidence-bound cross-domain correlation | Poisoned/circular evidence, confidence abuse, path explosion, case storms |
| `0.88.3` | Correlation workspace and conformance | Unauthorized pivots, feedback poisoning, bulk abuse, cross-domain leakage |
| `0.89.0` | Software and license inventory | Forged inventory, entitlement and contract leakage |
| `0.89.1` | SPDX and CycloneDX SBOM ingestion profiles | Component/namespace/license confusion, completeness inflation, parser bombs |
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
| `0.93.1` | PostgreSQL full-text search adapter | Injection, tenant/policy leakage, tokenizer drift, rebuild/failover |
| `0.94.0` | Facets, queues, and saved views | Unauthorized counts and shared-view leakage |
| `0.95.0` | Permission-aware indexing | Field/snippet/cache leakage and reindex revocation |
| `0.96.0` | Temporal and history search | Historical access bypass and event inference |
| `0.97.0` | Relationship and impact search | Graph path disclosure and traversal exhaustion |
| `0.98.0` | Semantic-index storage/query interface | Vector leakage, cross-tenant similarity, poisoning, dimension/metric confusion |
| `0.98.1` | Hosted semantic-index adapter and isolation | Cross-tenant/model recall, filter bypass, stale deletion, re-embedding split state |
| `0.98.2` | Embedding generation and provenance | Model/tokenizer/chunk substitution, residency bypass, retention leakage, mixed-model migration |
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
| `0.113.0` | Authorization-bound, quota-accounted effectful component execution | Commit/dispatch revocation, confused deputy/target substitution, forged provider/refund evidence, state collapse, quota/reserve abuse |
| `0.114.0` | Capability and non-extractable secret-operation model | Capability escalation, broker confused deputy, plaintext secret in Wasm memory |
| `0.115.0` | Memory/CPU/network/output metering | Resource-limit bypass and host denial of service |
| `0.116.0` | Signed plugin registry and rollout | Signature downgrade, malicious update, rollback |
| `0.116.1` | Governed plugin catalog and storefront | Publisher/listing/package impersonation, hidden capabilities, review bypass |
| `0.117.0` | Connector SDK and testkit | Workload-principal/audience confusion, SSRF, replay, connector impersonation |
| `0.118.0` | Mail, webhook, and collaboration connectors | Header injection, spoofing, action-link abuse |
| `0.118.1` | Microsoft Defender and Sentinel connector pack | Provider/workspace confusion, cursor/webhook replay, schema drift, action escalation |
| `0.118.2` | Tenable vulnerability connector pack | Asset/finding confusion, forged fixed state, score drift, coverage gaps |
| `0.119.0` | Outbound-only integration agent | Agent takeover, workload-token/spool extraction, identity cloning, audience inflation |
| `0.120.0` | Plugin compatibility/isolation suite | Cross-plugin and cross-tenant interference |

## Organization Federation

Setup: independently administered Vitheim deployments retain separate tenants,
policy roots, identities, event authority, and keys. Goal: optional explicit
cooperation without tenant merging or transitive trust. Phase exit: malicious-
peer, revocation, partition, offboarding, and managed-service tests pass across
both organizational boundaries.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.120.1` | Organization identity, trust, and connection enrollment | Peer/endpoint impersonation, invitation replay, downgrade, unilateral/transitive trust |
| `0.120.2` | Federated shared spaces and resource projections | Participant/resource injection, field/count leakage, stale policy, residency/hold conflict |
| `0.120.3` | Federated work exchange and synchronization | Forged/stale proposals, replay/reorder, lifecycle mismatch, echo loops, split brain |
| `0.120.4` | Managed-service asset and security delegation | Provider escalation, cross-customer confusion, false ownership, unauthorized remediation |
| `0.120.5` | Federation conformance, revocation, and recovery | Malicious peer, partitions, protocol skew, stale restore, cleanup/offboarding failure |

## Phase M — Optional AI Capabilities

Setup: AI remains untrusted, optional, policy-filtered, provenance-recorded,
and unable to execute commands directly. Goal: useful advisory capability with
measurable safety. Phase exit: governance, injection, retrieval, and tool-abuse
tests pass without any autonomous authority claim.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.121.0` | Provider-neutral AI interface | Provider impersonation and unsafe fallback |
| `0.122.0` | Classification, redaction, residency, and external embedding gateway | Sensitive-field/region leakage, provider retention mismatch, bypass and no-fallback |
| `0.123.0` | Model, prompt, and purpose registry | Prompt/model substitution and unapproved purpose |
| `0.124.0` | Timeline and record summarization | Injection, fabricated citations, hidden-field recall |
| `0.125.0` | Similarity and duplicate suggestions | Cross-tenant retrieval, generation/index provenance substitution, and poisoning |
| `0.126.0` | Triage and next-action suggestions | Manipulated assignment and unsafe advice |
| `0.127.0` | Natural-language query compiler | Generated authorization bypass and query bombs |
| `0.128.0` | Restricted command proposals | Escalation, forged IDs, approval bypass |
| `0.129.0` | Evaluation, provenance, and reviewer feedback | Evaluation tamper and hidden model drift |
| `0.130.0` | AI governance and NIST AI RMF pack | Policy gaps and accidental autonomous mode |

## Phase N — Complete Product Experience

Setup: every UI action maps to a command or policy-filtered read; no hidden
database manipulation. Goal: accessible, localizable, operable full product
whose governed interface blocks support both unified small-company and separated
enterprise operating models.
Phase exit: administrators and external portal users pass full boundary review.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.131.0` | Unified shell and command palette | Unauthorized action discovery/execution |
| `0.132.0` | Role-specific operational workspaces | Field and aggregate leakage |
| `0.132.1` | Composable interface blocks and dashboard layouts | Unauthorized blocks/actions, XSS, query storms, layout/plugin substitution |
| `0.132.2` | Organization-scale information architecture profiles | Profile-based privilege, hidden routes, unified-page exhaustion, semantic divergence |
| `0.133.0` | Schema and form builder | Malicious schemas and stored UI injection |
| `0.134.0` | Workflow and policy builder | Generated privilege escalation and hidden behavior |
| `0.135.0` | Dashboards and bounded report builder | Query exhaustion and aggregate inference |
| `0.136.0` | Request portal and generic cases | External-user isolation and enumeration |
| `0.137.0` | Configuration-as-code and signed changes | Substitution, unauthorized activation, rollback abuse |
| `0.138.0` | External API v1 candidate | Mass assignment, cursor/ETag/token confusion, decompression, cancellation, compatibility |
| `0.138.1` | Private SDK candidate | Generated-code substitution, secret logging, retry/version differential |
| `0.138.2` | Import staging and validation | Parser bombs, mass assignment, stale plan, partial promotion, erased-data resurrection |
| `0.138.3` | Export policy snapshots and manifests | Authorization drift, hidden fields, truncation, delivery/retention lifecycle |
| `0.139.0` | Accessibility, localization, mobile layouts | Localization injection and client-state leakage |
| `0.140.0` | Operator and tenant administration console | Administrative privilege and support boundaries |

## Pre-Production Profile Freeze Decisions

These evidence-producing patch milestones revalidate implementation-admission
records and freeze supported production choices before Phase O. They are not
the first technology decision. An unselected option remains unsupported at
`1.0.0`.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.140.1` | Dependency, cryptography, KMS, and timestamp profile decision | Auditability, maintenance, license, key lifecycle, replacement boundary, no improvised security protocol |
| `0.140.2` | Tenant, storage, and transaction-domain topology decision | Guard/fence/effect and quota/work co-location, cross-partition rejection, active/active write rejection, no weak fallback |
| `0.140.3` | Human/workload/session local-revocation profile decision | Co-located epochs, external-staleness classification, privileged-profile rejection, sender constraint, offline-human non-impersonation |
| `0.140.4` | Component runtime, worker/effect-broker isolation, and egress decision | Escape, metering, grant/service redemption, multi-kind quota/reserve abuse, host amplification, DNS/redirect, OS/cross-tenant evidence |
| `0.140.5` | Privacy, tenant-surface lifecycle, evidence, and residency decision | Missing copies, retention precedence, omitted derived surfaces, tombstone/evidence inflation |
| `0.140.6` | Deployment/HA authority-fence, composite-lock, and quota-encumbrance decision | Epoch linearization, external staleness, lock order/retry bound, per-kind expiry/transfer/late settlement, failover/RPO/RTO |
| `0.140.7` | API, SDK, licensing, and publication decision | Compatibility, registry ownership/provenance/recovery, exact SDK exception or no publication |
| `0.140.8` | AI production enablement decision | Advisory-only isolation, provider policy, evaluation, injection, kill switch, disabled fallback |
| `0.140.9` | Interchange and integration-boundary freeze decision | Directional SCIM, STIX publication, authenticated syslog, SIEM/detection, and CMDB support/defer evidence |
| `0.140.10` | Federation production enablement decision | Cross-organization isolation, malicious peer, delegation abuse, revocation/offboarding evidence |

## Phase O — Production Hardening

Setup: freeze compatibility dimensions progressively and test real operations.
Goal: reliable single-node and HA deployments with recoverable upgrades. Phase
exit: production candidate has passed external pentest and all acceptance tests.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.141.0` | Single-node production packaging | Permissions, defaults, secret exposure, clean install |
| `0.142.0` | Split API/worker/ingest/index deployments | Service identity and network authorization |
| `0.142.1` | Production telemetry exporters and graceful drain | `0.20.2` contract conformance, exporter failure, readiness and drain |
| `0.143.0` | HA leases, atomic work, authority fences, quota encumbrances, failover, and partitions | Split brain/duplicate remote effect plus epoch TOCTOU, retry duplication, spent-capacity reclaim, transfer/failover loss |
| `0.144.0` | Authoritative-region placement and residency | Active/active authoritative write request, cross-region guard/set split, stale failover fence, external-copy leakage |
| `0.145.0` | Backup, restore, and disaster recovery | Authority-epoch rollback, consumed-attempt resurrection, live-encumbrance capacity recreation, duplicate transfer, disposition loss |
| `0.146.0` | Performance, composite contention, and encumbrance-safe quota certification | Lock-order/retry duplication, lease expiry with live claims, child loss/late settlement/transfer race, starvation, cascading failure |
| `0.147.0` | Final security, secret-memory, and supply-chain hardening | Diagnostic/crash/plugin secret leakage and artifact/dependency/CI/builder/key compromise |
| `0.148.0` | API/event/plugin/pack compatibility freeze | Downgrade and version confusion |
| `0.149.0` | Release candidate and external pentest remediation | Complete platform attack paths and clean retest |
| `0.150.0` | Final production-readiness candidate | Install, upgrade, restore, rollback, failover, evidence |

## `1.0.0` — Serious Production Release

Status: planned; not reached by schedule alone

### Goal

Release Vitheim only when the complete claimed product and operational profile
are independently evidenced as production-ready.

### Deliverables

- Stable API v1, separate API/UI crate boundary, plugin ABI/catalog v1,
  federation protocol/profile where enabled, framework-pack v1, export format
  v1, and agent protocol v1 with documented compatibility and migration policy.
- Production ITSM, SecOps, vulnerability, assets/software assets/CMDB/service
  graph and correlation, knowledge, risk/compliance, cases, workflow/policy
  builders, composable dashboards/layout profiles, search, governed connector
  storefront, on-call/paging/preferences, SLI/SLO/error budgets, service health/
  status publishing, optional federation/AI, administration, import/export, and
  reporting.
- Documented single-node, HA, regional, backup/restore, rebuild, recovery,
  upgrade, rollback, health, durable execution-authority/grant-lineage
  ownership, guarded attempt claims, complete authority-fence epochs, canonical
  composite transaction retry, local exact-set/hierarchical per-kind quota
  encumbrances, authoritative-region failover, fair recovery, and backpressure
  operations.
- Identical mandatory conformance for supported production storage profiles;
  SQLite remains limited to its documented single-node profile.

### Verification

- External pentest completed with all critical/high findings fixed and cleanly
  retested; other findings fixed or explicitly time-bound and owned.
- Tenant and authorization matrices cover every API, UI, search, workflow,
  plugin, federation, shared-space/managed-service, AI, export, attachment,
  notification, and administrative interface, including intent-commit and
  live-subject/grant/service-principal issuance/redemption/revocation and
  dispatch gates, effect binding/freshness profiles, offline-human
  impersonation, grant owner/approval-receipt/outbox/lineage/successor rules,
  pre-issuance revocation, co-located redemption guard, revocation/final-attempt
  races, claim/receipt substitution, consumed-attempt restore, grant/effect two-
  stream rejection, every tenant/identity/session/delegation/role/relationship/
  policy revocation race, complete monotonic fence set, external-staleness
  rejection, target substitution, and worker confused-deputy attempts.
- Every untrusted parser is fuzzed; cryptography is independently reviewed;
  plugin escape and AI injection/tool-abuse suites pass.
- Atomic audit-intent crash tests, protected-read release receipts, exact
  interchange conformance, effect authorization/revocation races, quota
  all-or-none canonical claim-set reservation, exact immutable token/digest/
  membership consumption, overlap deadlock/livelock freedom, whole-set restore/
  quarantine, single-partition placement, hierarchical capacity-lease
  per-kind encumbrance across expiry/reclamation/failover/transfer/late evidence,
  canonical composite lock order and bounded identity-preserving retry,
  active/active authoritative-write rejection, per-kind settlement, exactly-once
  refunds, write-off separation, compensation claims, provider-outage fairness/
  emergency-reserve isolation, and selected semantic-index isolation/rebuild
  pass.
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
