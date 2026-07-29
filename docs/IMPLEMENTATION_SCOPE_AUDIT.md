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
profile-decision stops. The canonical roadmap therefore contains **315 exact
stops**:

`150 base 0.x.0 stops + 164 companion stops + 1 production stop = 315`.

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
again before implementation. The roadmap checker verifies all 315 headings,
required handoff fields, authority dispositions, and exact-commit pentest
markers; count drift blocks release.
