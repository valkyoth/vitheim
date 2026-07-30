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
again. A focused successor release may not be pulled back into its predecessor
for schedule convenience, and passing an earlier pentest never covers a later
minor commit. The implementation-entry certificate and patch restrictions are
normative in
[Release Granularity Standard](RELEASE_GRANULARITY_STANDARD.md).

## Audit Result

All 229 previously planned stops were reviewed. Eighteen families failed the
small-loop rule and were decomposed into 65 additional exact stops. The later
capability-gap review added 21 independently scoped verification, product, and
profile-decision stops. The second gap review added 31 requirement-ownership,
domain-decomposition, integration, and discovery-profile stops. The coherence
reviews added 50 requirement-source, dependency-feasibility, phased surface-
ownership, domain-boundary, adapter-placement, and chronological-integration
stops. The latest authority/delivery review added four narrow remote-handoff,
post-fence recovery, transmission-claim closure and seal-lineage stops. The
canonical roadmap therefore contains **425 exact stops**:

`424 pre-production minor stops + 1 production stop = 425`.

The final numbering pass assigned those pre-production stops contiguously to
`0.1.0–0.424.0`. It found no justification for preallocating patch releases:
each formerly planned `0.N.P` stop is an independently shippable and
pentestable change, so it now owns a minor version. In particular, the former
60-stop `0.51.0–0.51.59` family is now `0.151.0–0.210.0`; this is an advanced
domain-retirement program made of 60 separate release boundaries, not one
minor release with 59 planned fixes. Patch numbers are reserved for actual
post-implementation corrections under the
[Release Granularity Standard](RELEASE_GRANULARITY_STANDARD.md).

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
| Executable verification | `0.44.0`, `0.56.0` | Reference-model method, then adapter correspondence |
| Early policy contract | `0.89.0` | Policy/redaction shape only; full engines remain Phase F |
| Broader service management | `0.133.0–0.138.0` | One domain each: portfolio, customer, supplier, procurement, capacity, continuity |
| Real-time reads | `0.226.0–0.227.0` | Semantic subscription/cursor, then hosted delivery/revocation |
| Pre-SecOps topology | `0.242.0` | Shared vocabulary/port only; graph ownership remains Phase I |
| Asset extensibility | `0.264.0–0.265.0` | Kind registry, then ephemeral identity/reincarnation |
| Privacy operations | `0.311.0–0.312.0` | Case authority, then fulfilment/evidence |
| Inbound email | `0.324.0–0.325.0` | Hostile intake/quarantine, then correlation/proposals |
| Audit export | `0.334.0–0.335.0` | Signed export contract, then delivery/reconciliation |
| Product freeze | `0.397.0` | Evidence-based full-suite support/defer decision |

The second review's 31 additions live in
[Requirement Ownership And Product Integration Completions](implementation/REQUIREMENT_AND_INTEGRATION_COMPLETIONS.md):

| Capability family | Exact stops | Small-loop boundary |
| --- | --- | --- |
| Requirement ownership | `0.36.0`, `0.45.0`, `0.90.0–0.93.0` | Registry/checker, then bounded phase-family backfills |
| Early domain references | `0.94.0` | Opaque references and read fakes only |
| Customer decomposition | `0.139.0–0.141.0` | Contacts, agreements, then entitlement decisions |
| Supplier decomposition | `0.142.0–0.144.0` | Contract, obligation lifecycle, then access termination |
| Procurement decomposition | `0.145.0–0.148.0` | External-order evidence/receipt, allocation/return, entitlement, then provider-neutral reconciliation |
| Continuity decomposition | `0.149.0` | Exercise/evidence authority separated from plan authority |
| Cross-surface integration | `0.154.0–0.155.0`, `0.228.0–0.229.0`, `0.243.0–0.244.0`, `0.299.0–0.300.0`, `0.336.0–0.338.0`, `0.353.0–0.354.0`, `0.364.0–0.367.0`, `0.369.0`, `0.413.0–0.414.0` | Per-vocabulary extension/backfill, contribution-kind-driven differentials, selected lifecycle/recovery certification, then default dynamic-retirement refusal/history certification without first implementation |
| Asset-kind packs | `0.266.0–0.269.0` | Physical/compute, cloud-native, identity/network, then SaaS/data |
| Cloud-native discovery | `0.277.0` | One exact connector profile or explicit manual/import-only defer |

The 57 coherence additions live in
[Roadmap Coherence Completions](implementation/ROADMAP_COHERENCE_COMPLETIONS.md)
and [Roadmap Authority And Recovery Completions](implementation/ROADMAP_AUTHORITY_COMPLETIONS.md):

| Coherence family | Exact stops | Small-loop boundary |
| --- | --- | --- |
| Requirement discovery | `0.37.0` | Source markers, digests, supersession, and normative drift only |
| Hosted feasibility | `0.38.0` | Early dependency-law support/defer decision; no exception |
| Domain identity | `0.95.0` | Stable manifest with authoritative application/event/consumer references only |
| Contribution safety | `0.96.0–0.97.0` | Kind-owned verification obligations and scope-separated metadata admission, then bounded absent-surface-only deferral/product gates |
| Domain-event gate | `0.98.0` | Current event-owner backfill plus prospective emission/consumption, upcaster, and generation checks |
| Async-contract gate | `0.99.0` | Complete `0.30.0–0.32.0` effect/message/consumer/timer/activity/poison/replay/result ownership backfill and prospective checks |
| Domain retirement | `0.100.0–0.101.0`, `0.156.0–0.210.0`, `0.414.0` | Truthful terminals; cut/plan/guard/root; residual handoff/lineage/cuts; restrictive invalidation; takeover/release; funded retained controls; archival/retained namespace; fenced evaluation; explicit lifecycle adjacency; source-partition admission; root-bound activation preparation; canonical empty ownership/disposition; funded bridge ownership; partial-admission abort/supersession; permanent-unknown decision/quarantine; complete restriction-coverage root; enforced unknown-restriction top; terminal replacement exhaustion; bounded replacement-evaluation lineage; lowering-specific evaluation/admission; tagged top-or-lowered successor genesis; closed tagged per-partition lowered adoption through shared lifecycle/admission/ownership; sole typed final-revalidation edge over distinct guard generations; dual release; operational lowering CAS; policy-derived worst-case funding; bounded prepared construction; source-fenced distributed inventory cuts with an immediate restrictive lane; one-winner parent effect intents; intent-scoped issuance scope plus unique entries and atomic lifetime-reservation/outbox coupling; activation-bound local redemption; partition-local effects with parent-local folding; funded physical-effect conflict settlement; sole issued-universe delivery closure with final budget head; ABA-resistant physical-status capability/refusal and governed continuity succession; create-or-join post-closure incident ownership with non-weakening manual evidence; finite multidimensional intent-lifetime reservations and explicit replan exhaustion; prepaid bounded dispatch attempts; backend-admitted bounded delivery-seal construction; authenticated remote status fencing and dormant successor admission; irreversible bounded post-fence recovery; canonical transmission-claim closure interlock; codec-pinned cumulative seal-preparation lineage; no-effect intent disposition/replanning; exact saturation arithmetic; heterogeneous absorbing-member vector reconciliation; a separate versioned saturated-retry ledger; predispatch expected-predecessor continuity; certification |
| Supplier boundary | `0.150.0` | Performance assessment and inert risk proposals only |
| Tenant-surface linkage | `0.154.0–0.155.0` | Reference authoritative lifecycle IDs, then immediately certify the backfill |
| Surface certification | `0.229.0`, `0.244.0`, `0.300.0`, `0.354.0`, `0.366.0–0.367.0` | Authorization, workflow, search, workspace, API, and transfer each certify separately |
| ERP placement | `0.326.0` | One exact adapter profile or defer after connector infrastructure |
| Late-domain integration | `0.336.0–0.338.0` | Manifest-driven authorization, automation, then search/history certification |
| Hosted production gate | `0.398.0` | Mandatory baseline go/no-go under the selected dependency law |

| Overloaded family | Exact first slice | Added exact stops | Why it was split |
| --- | --- | --- | --- |
| `0.23.0` quota accounting | Claim/ledger vocabulary | `0.28.0–0.29.0` | Admission, settlement, and recovery are separate transactional concerns |
| `0.24.0` atomic work family | Discriminated bundle schema | `0.30.0–0.32.0` | Command/consumer, timer/activity, poison, and adapter destruction should not land together |
| `0.25.0` invariant governance | Stable declaration IDs/parser | `0.33.0–0.35.0` | Ownership, law manifests, semantic realization, and generated conformance have distinct reviewers |
| `0.46.0` capability negotiation | Capability vocabulary/report | `0.47.0–0.51.0` | Static admission, probing, lineage, recovery, and refusal are independent |
| `0.52.0` storage testkit | Harness and fixture contract | `0.53.0–0.55.0` | Atomicity destruction, tenant isolation, and HA/migration matrices are separable |
| `0.66.0` migration authority | Registry and immutable plan | `0.67.0–0.71.0` | Execution, fencing, activation, recovery, and disposition each mutate different authority |
| `0.72.0` cross-backend transfer | Canonical manifest/preflight | `0.75.0–0.86.0` | Export, import, activation, history, recovery, corruption, re-cost, witness replacement, and settlement were a program, not a release |
| `0.73.0` durable queue | Queue record and semantic port | `0.87.0–0.88.0` | Scheduling/claims and crash recovery/conformance require separate failure campaigns |
| `0.239.0` HA workflow workers | Worker lease/fence | `0.240.0–0.241.0` | Takeover/recovery and cross-domain integration should be independently proven |
| `0.371.0` crypto/dependency freeze | Primitive and signature profile | `0.382.0–0.384.0` | Transport/time, KMS lifecycle, and dependency/tool evidence need separate decisions |
| `0.372.0` storage/tenancy freeze | Default support matrix | `0.385.0–0.390.0` | Isolation, transaction, migration, recovery, experimental promotion, and final evidence are separate decisions |
| `0.376.0` deployment freeze | Deployment shapes | `0.391.0–0.393.0` | HA, regional/DR, and operational authority must be independently selected |
| `0.381.0` witness recovery freeze | Authority retirement | `0.394.0–0.396.0` | Bootstrap, capacity transfer, and checkpoint/replay cannot share one approval |
| `0.399.0` single-node packaging | Package/install layout | `0.400.0–0.403.0` | Startup compatibility, topology bootstrap, replay budgets, and drains need distinct operational gates |
| `0.406.0` HA/failover | Lease and fencing model | `0.407.0–0.408.0` | Storage failover and partition/service recovery need independent fault campaigns |
| `0.410.0` backup/DR | Backup format and custody | `0.411.0–0.412.0` | Restore verification and full DR/retention exercises are separate destructive paths |
| `0.415.0` performance certification | Load harness and ceilings | `0.416.0–0.417.0` | Soak/fairness and chaos/recovery are different evidence sets |
| `0.420.0` pentest remediation | Finding intake and ownership | `0.421.0–0.423.0` | Authority, data/recovery, and integration findings require separate remediation and retest waves |

## Large-Looking Stops Rechecked

The final pass also rechecked every heading and every retained section rather
than treating line count as a size certificate. The main apparent outliers
have these bounded interpretations:

| Exact stop | Why the surrounding ledger is long | Admitted implementation pass |
| --- | --- | --- |
| `0.24.0`, `0.25.0`, `0.46.0`, `0.52.0`, `0.66.0`, `0.72.0`, `0.73.0` | They preserve cumulative foundation/storage laws and successor obligations. | Only the first slice named in the split table; every later concern remains owned by its listed successor minor. |
| `0.151.0–0.210.0` | Together they specify the optional advanced domain-retirement program. | One authority/state transition per minor; the range is never implemented or pentested as one change. |
| `0.370.0` | It is the last compact Phase N entry, so a naive cross-file line counter can include later files. | Operator/tenant administration console only; no hidden database or neighboring production work. |
| `0.371.0–0.398.0` | Decision records cite the evidence needed by later production profiles. | One decision family or evidence freeze per minor; a decision milestone performs no missing implementation. |
| `0.399.0`, `0.406.0`, `0.410.0`, `0.415.0`, `0.420.0` | Phase O keeps full operational and adversarial context beside the first family stop. | The first row only; startup/topology, failover/recovery, restore/DR, soak/chaos, and remediation waves remain separate successors. |
| `0.414.0`, `0.424.0`, `1.0.0` | Certification must reference a broad selected-profile matrix. | Evidence-only certification of an unchanged candidate. Missing behavior fails the stop and becomes a separately numbered implementation or corrective release. |

This recheck found no remaining stop that should be implemented as two
independently shippable changes. That result is conditional on the mandatory
implementation-entry certificate: if concrete crate, schema, authority,
adapter, rollback, or pentest planning exposes two boundaries, the stop must
split before implementation. The current numbering is therefore a reviewed
plan, not permission to absorb newly discovered work.

## Stop IDs Are Not Size Certificates

The earlier audit classified every remaining exact stop as having a dominant
owner, but the consolidated review found that several cumulative Phase C and
retirement specifications still describe multiple child authorities in one
logical protocol. The 425 IDs remain stable requirement/evidence owners; their
existence is not proof that one implementation PR, crate, state machine, or
process should contain all surrounding prose.

Before implementation, every stop must extract a focused protocol package and
pass a fresh authority/test-boundary audit. Migration progress, import staging,
activation, integrity, evidence custody, capacity, witness observation,
corruption recovery, and retirement coordination remain separate owners joined
only by immutable requests/receipts and local idempotent folds. A coordinator
cannot copy child state machines or add cross-concern fields merely because the
phase ledger discusses them together.

The [Implementation Convergence Plan](IMPLEMENTATION_CONVERGENCE_PLAN.md)
prevents further numbering growth for acceptance details and makes dynamic
domain retirement plus generalized backend migration optional profiles rather
than default-v1 blockers. New minor numbering is reserved for a genuinely
missing independent authority or implementation boundary. Corrective patch
numbering is created only after an implementation exists.

New threat-model detail, authority changes, schema work, provider admission, or
recovery scope still triggers the small-loop audit before code. The roadmap
checker verifies all 425 headings, required handoff fields, authority
dispositions, and exact-commit pentest markers; count drift blocks release.
