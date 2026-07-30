# Implementation Scope Audit

Status: normative roadmap sizing policy

## Small-Loop Rule

Every exact release stop must be implementable, reviewable, testable, and
pentestable as one bounded change. A stop may own:

- one primary authority/state-machine change or one adapter/profile;
- one associated persistence or migration transition;
- one external trust boundary admission, if that is the stop's purpose; and
- one coherent conformance corpus for those changes.

A stop fails sizing when it combines independent authorities, unrelated
adapters, multiple irreversible lifecycles, implementation plus production
certification, or a verification matrix whose failures need different owners.
Line count is a warning, not the decision rule: cumulative security context may
be long, but the exact implementation slice must remain singular.

Before any stop changes from `planned`, its owner records the crates, authority
delta, schema/migration delta, external boundary, tests, rollback, and pentest
scope. If more than one item in any category is independently shippable, split
again. A companion stop may not be pulled back into its parent for schedule
convenience, and passing a parent pentest never covers a companion commit.

## Audit Result

All 229 previously planned stops were reviewed. Eighteen families failed the
small-loop rule and were decomposed into 65 additional exact stops. The later
capability-gap review added 21 independently scoped verification, product, and
profile-decision stops. The second gap review added 31 requirement-ownership,
domain-decomposition, integration, and discovery-profile stops. The coherence
reviews added 50 requirement-source, dependency-feasibility, phased surface-
ownership, domain-boundary, adapter-placement, and chronological-integration
stops. The canonical roadmap therefore contains **418 exact stops**:

`150 base 0.x.0 stops + 267 companion stops + 1 production stop = 418`.

The existing long sections remain cumulative family ledgers because they hold
important threat, invariant, recovery, and verification context. Their heading
version owns only the first slice below. The focused handoffs in
[Foundation And Storage Scope Splits](implementation/SCOPE_SPLITS_FOUNDATION_STORAGE.md)
and
[Product And Production Scope Splits](implementation/SCOPE_SPLITS_PRODUCT_PRODUCTION.md)
own every later slice. Family-level `Goal`, `Deliverables`, `Verification`, and
`Exit criteria` prose is an eventual completion contract, not authorization to
implement all of it in the heading version.

The 21 gap-driven additions are not scope silently pulled into an existing
stop. Their independent handoffs are in
[Focused Product Capability Completions](implementation/PRODUCT_CAPABILITY_COMPLETIONS.md):

| Capability family | Exact stops | Small-loop boundary |
| --- | --- | --- |
| Executable verification | `0.20.4`, `0.22.4` | Reference-model method, then adapter correspondence |
| Early policy contract | `0.30.17` | Policy/redaction shape only; full engines remain Phase F |
| Broader service management | `0.50.1–0.50.6` | One domain each: portfolio, customer, supplier, procurement, capacity, continuity |
| Real-time reads | `0.60.1–0.60.2` | Semantic subscription/cursor, then hosted delivery/revocation |
| Pre-SecOps topology | `0.70.3` | Shared vocabulary/port only; graph ownership remains Phase I |
| Asset extensibility | `0.81.1–0.81.2` | Kind registry, then ephemeral identity/reincarnation |
| Privacy operations | `0.110.1–0.110.2` | Case authority, then fulfilment/evidence |
| Inbound email | `0.118.3–0.118.4` | Hostile intake/quarantine, then correlation/proposals |
| Audit export | `0.120.6–0.120.7` | Signed export contract, then delivery/reconciliation |
| Product freeze | `0.140.27` | Evidence-based full-suite support/defer decision |

The second review's 31 additions live in
[Requirement Ownership And Product Integration Completions](implementation/REQUIREMENT_AND_INTEGRATION_COMPLETIONS.md):

| Capability family | Exact stops | Small-loop boundary |
| --- | --- | --- |
| Requirement ownership | `0.18.14`, `0.20.5`, `0.30.18–0.30.21` | Registry/checker, then bounded phase-family backfills |
| Early domain references | `0.30.22` | Opaque references and read fakes only |
| Customer decomposition | `0.50.7–0.50.9` | Contacts, agreements, then entitlement decisions |
| Supplier decomposition | `0.50.10–0.50.12` | Contract, obligation lifecycle, then access termination |
| Procurement decomposition | `0.50.13–0.50.16` | External-order evidence/receipt, allocation/return, entitlement, then provider-neutral reconciliation |
| Continuity decomposition | `0.50.17` | Exercise/evidence authority separated from plan authority |
| Cross-surface integration | `0.51.3–0.51.4`, `0.60.3–0.60.4`, `0.70.4–0.70.5`, `0.100.1–0.100.2`, `0.120.8–0.120.10`, `0.132.3–0.132.4`, `0.138.4–0.138.7`, `0.139.1`, `0.145.3–0.145.4` | Per-vocabulary extension/backfill, contribution-kind-driven differentials, then destructive lifecycle/recovery/retirement certification without first implementation |
| Asset-kind packs | `0.81.3–0.81.6` | Physical/compute, cloud-native, identity/network, then SaaS/data |
| Cloud-native discovery | `0.86.2` | One exact connector profile or explicit manual/import-only defer |

The 57 coherence additions live in
[Roadmap Coherence Completions](implementation/ROADMAP_COHERENCE_COMPLETIONS.md)
and [Roadmap Authority And Recovery Completions](implementation/ROADMAP_AUTHORITY_COMPLETIONS.md):

| Coherence family | Exact stops | Small-loop boundary |
| --- | --- | --- |
| Requirement discovery | `0.18.15` | Source markers, digests, supersession, and normative drift only |
| Hosted feasibility | `0.18.16` | Early dependency-law support/defer decision; no exception |
| Domain identity | `0.30.23` | Stable manifest with authoritative application/event/consumer references only |
| Contribution safety | `0.30.24–0.30.25` | Kind-owned verification obligations and scope-separated metadata admission, then bounded absent-surface-only deferral/product gates |
| Domain-event gate | `0.30.26` | Current event-owner backfill plus prospective emission/consumption, upcaster, and generation checks |
| Async-contract gate | `0.30.27` | Complete `0.18.8–0.18.10` effect/message/consumer/timer/activity/poison/replay/result ownership backfill and prospective checks |
| Domain retirement | `0.30.28–0.30.29`, `0.51.5–0.51.52`, `0.145.4` | Truthful terminals; cut/plan/guard/root; residual handoff/lineage/cuts; restrictive invalidation; takeover/release; funded retained controls; archival/retained namespace; fenced evaluation; explicit lifecycle adjacency; source-partition admission; root-bound activation preparation; canonical empty ownership/disposition; funded bridge ownership; partial-admission abort/supersession; permanent-unknown decision/quarantine; complete restriction-coverage root; enforced unknown-restriction top; terminal replacement exhaustion; bounded replacement-evaluation lineage; lowering-specific evaluation/admission; tagged top-or-lowered successor genesis; closed tagged per-partition lowered adoption through shared lifecycle/admission/ownership; sole typed final-revalidation edge over distinct guard generations; dual release; operational lowering CAS; policy-derived worst-case funding; bounded prepared construction; source-fenced distributed inventory cuts with an immediate restrictive lane; one-winner parent effect intents; intent-scoped issuance scope plus unique entries and atomic lifetime-reservation/outbox coupling; activation-bound local redemption; partition-local effects with parent-local folding; funded physical-effect conflict settlement; sole issued-universe delivery closure with final budget head; ABA-resistant physical-status capability/refusal; create-or-join post-closure incident ownership; finite multidimensional intent-lifetime reservations and explicit replan exhaustion; no-effect intent disposition/replanning; exact saturation arithmetic; heterogeneous absorbing-member vector reconciliation; a separate versioned saturated-retry ledger; predispatch expected-predecessor continuity; certification |
| Supplier boundary | `0.50.18` | Performance assessment and inert risk proposals only |
| Tenant-surface linkage | `0.51.3–0.51.4` | Reference authoritative lifecycle IDs, then immediately certify the backfill |
| Surface certification | `0.60.4`, `0.70.5`, `0.100.2`, `0.132.4`, `0.138.6–0.138.7` | Authorization, workflow, search, workspace, API, and transfer each certify separately |
| ERP placement | `0.118.5` | One exact adapter profile or defer after connector infrastructure |
| Late-domain integration | `0.120.8–0.120.10` | Manifest-driven authorization, automation, then search/history certification |
| Hosted production gate | `0.140.28` | Mandatory baseline go/no-go under the selected dependency law |

| Overloaded family | Exact first slice | Added exact stops | Why it was split |
| --- | --- | --- | --- |
| `0.18.1` quota accounting | Claim/ledger vocabulary | `0.18.6–0.18.7` | Admission, settlement, and recovery are separate transactional concerns |
| `0.18.2` atomic work family | Discriminated bundle schema | `0.18.8–0.18.10` | Command/consumer, timer/activity, poison, and adapter destruction should not land together |
| `0.18.3` invariant governance | Stable declaration IDs/parser | `0.18.11–0.18.13` | Ownership, law manifests, semantic realization, and generated conformance have distinct reviewers |
| `0.21.0` capability negotiation | Capability vocabulary/report | `0.21.1–0.21.5` | Static admission, probing, lineage, recovery, and refusal are independent |
| `0.22.0` storage testkit | Harness and fixture contract | `0.22.1–0.22.3` | Atomicity destruction, tenant isolation, and HA/migration matrices are separable |
| `0.29.0` migration authority | Registry and immutable plan | `0.29.1–0.29.5` | Execution, fencing, activation, recovery, and disposition each mutate different authority |
| `0.30.0` cross-backend transfer | Canonical manifest/preflight | `0.30.3–0.30.14` | Export, import, activation, history, recovery, corruption, re-cost, witness replacement, and settlement were a program, not a release |
| `0.30.1` durable queue | Queue record and semantic port | `0.30.15–0.30.16` | Scheduling/claims and crash recovery/conformance require separate failure campaigns |
| `0.70.0` HA workflow workers | Worker lease/fence | `0.70.1–0.70.2` | Takeover/recovery and cross-domain integration should be independently proven |
| `0.140.1` crypto/dependency freeze | Primitive and signature profile | `0.140.12–0.140.14` | Transport/time, KMS lifecycle, and dependency/tool evidence need separate decisions |
| `0.140.2` storage/tenancy freeze | Default support matrix | `0.140.15–0.140.20` | Isolation, transaction, migration, recovery, experimental promotion, and final evidence are separate decisions |
| `0.140.6` deployment freeze | Deployment shapes | `0.140.21–0.140.23` | HA, regional/DR, and operational authority must be independently selected |
| `0.140.11` witness recovery freeze | Authority retirement | `0.140.24–0.140.26` | Bootstrap, capacity transfer, and checkpoint/replay cannot share one approval |
| `0.141.0` single-node packaging | Package/install layout | `0.141.1–0.141.4` | Startup compatibility, topology bootstrap, replay budgets, and drains need distinct operational gates |
| `0.143.0` HA/failover | Lease and fencing model | `0.143.1–0.143.2` | Storage failover and partition/service recovery need independent fault campaigns |
| `0.145.0` backup/DR | Backup format and custody | `0.145.1–0.145.2` | Restore verification and full DR/retention exercises are separate destructive paths |
| `0.146.0` performance certification | Load harness and ceilings | `0.146.1–0.146.2` | Soak/fairness and chaos/recovery are different evidence sets |
| `0.149.0` pentest remediation | Finding intake and ownership | `0.149.1–0.149.3` | Authority, data/recovery, and integration findings require separate remediation and retest waves |

## Stops That Passed

Every other exact stop passed the current sizing review because it has one
dominant domain/adapter/decision owner and one coherent primary test boundary.
This is not a permanent exemption. New threat-model detail, authority changes,
schema work, provider admission, or recovery scope triggers the small-loop rule
again before implementation. The roadmap checker verifies all 418 headings,
required handoff fields, authority dispositions, and exact-commit pentest
markers; count drift blocks release.
