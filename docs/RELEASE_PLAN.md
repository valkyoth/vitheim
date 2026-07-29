# Vitheim Release Plan To 1.0

Status: planning document

Vitheim is built in small releases that can be understood, tested, pentested,
and stopped independently. This list is not a maximum: split a version or add
a corrective patch whenever its scope is too broad for one safe review pass.

Tags use `v0.N.0` for capability milestones, `v0.N.P` for corrections,
focused completion slices, or explicitly planned bounded capability increments
within the current `0.N.0` phase family,
`v1.0.0-rc.N` for exact production candidates, and `v1.0.0` only for the first
serious production release. No tag or artifact publication is authorized by
this plan.

The version-by-version implementation handoffs live in the
[Implementation Plan](IMPLEMENTATION_PLAN.md); the summary tables below never
replace their required setup, deliverables, verification, or pentest stops.
The canonical roadmap contains 400 exact stops: 150 base `0.x.0` stops, 249
companion stops, and one `1.0.0` stop. “151 base stops including `1.0.0`” is a
valid qualified summary; “151 phases,” “225 milestones,” and “228 exact stops”
are not. [Evidence And Roadmap Governance](EVIDENCE_AND_ROADMAP_GOVERNANCE.md)
defines the claim states and canonical-manifest rules.

## Required Format And Setup

The detailed handoff for every active version must name:

- **Status**: planned, implementing, awaiting pentest, or ready to tag;
- **Evidence state**: specified, implementing, implemented, conditional,
  supported, or unsupported, with executable owner and immutable references;
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
A version-bound implementation-admission record does not itself change the
dependency policy or create a scoped exception. A hosted profile requiring an
external Cargo dependency remains blocked until a separate owner-approved
policy change; N0/N1 remain dependency-free under every future profile. The
current owner-selected product decision is repository-wide zero dependencies:
`0.18.16` must mark infeasible Hosted capabilities unsupported/deferred rather
than creating an allowlist or improvised implementation. `0.140.28` blocks a
Hosted `1.0.0` production claim unless every mandatory baseline capability has
exact Supported evidence.

## Scope Sizing And Focused Companion Stops

The [Implementation Scope Audit](IMPLEMENTATION_SCOPE_AUDIT.md) limits each
exact stop to one primary authority/state-machine change or adapter/profile,
one associated persistence/migration transition, at most one external
admission boundary, and one coherent conformance corpus. Eighteen overloaded
family ledgers were retained for their security context but decomposed into 65
new exact stops. The later capability-gap review added 21 independently scoped
product, verification, and profile-decision companions. The second review added
31 requirement-ownership, domain-decomposition, cross-surface integration, and
cloud-discovery companions. The coherence reviews added 54 requirement-source,
dependency-feasibility, phased-surface-ownership, domain-boundary, adapter-
placement, and chronology companions:

| Parent family | Focused companion stops | Completion sequence |
| --- | --- | --- |
| `0.18.1` quota | `0.18.6–0.18.7` | admission, then settlement/recovery |
| `0.18.2` atomic work | `0.18.8–0.18.10` | command/consumer, timer/activity, then poison/adapter certification |
| `0.18.3` invariant governance | `0.18.11–0.18.13` | ownership/lifecycle, law admission, then executable realization |
| `0.21.0` capability negotiation | `0.21.1–0.21.5` | static admission, probe, lineage, recovery, then refusal differential |
| `0.22.0` storage testkit | `0.22.1–0.22.3` | atomic destruction, tenant isolation, then HA/migration matrix |
| `0.29.0` migration | `0.29.1–0.29.5` | execution, fencing, activation, recovery, then history/disposition |
| `0.30.0` export/import | `0.30.3–0.30.14` | export, stage, prepare, activate, history, budget, corruption, rebuild, re-cost, witness fence, bootstrap, operationalize |
| `0.30.1` durable queue | `0.30.15–0.30.16` | claims/scheduling, then recovery/conformance |
| `0.70.0` workflow HA | `0.70.1–0.70.2` | takeover/recovery, then real integration certification |
| `0.140.1` crypto/dependencies | `0.140.12–0.140.14` | transport/time, KMS/key lifecycle, then build/dependency evidence |
| `0.140.2` storage decision | `0.140.15–0.140.20` | isolation, transaction, migration, recovery, experimental promotion, then final matrix |
| `0.140.6` deployment decision | `0.140.21–0.140.23` | HA, regional/DR, then operational authority |
| `0.140.11` witness decision | `0.140.24–0.140.26` | bootstrap, capacity transfer, then checkpoint/replay |
| `0.141.0` packaging | `0.141.1–0.141.4` | startup, topology bootstrap, replay budgets, then capacity drains |
| `0.143.0` HA | `0.143.1–0.143.2` | owner failover, then service partition/recovery |
| `0.145.0` backup/DR | `0.145.1–0.145.2` | restore/readiness, then DR/failback/disposition |
| `0.146.0` performance | `0.146.1–0.146.2` | soak/fairness, then chaos/recovery |
| `0.149.0` remediation | `0.149.1–0.149.3` | authority/tenant, storage/recovery, then external boundaries/final retest |

The focused capability additions are `0.20.4`, `0.22.4`, `0.30.17`,
`0.50.1–0.50.6`, `0.60.1–0.60.2`, `0.70.3`, `0.81.1–0.81.2`,
`0.110.1–0.110.2`, `0.118.3–0.118.4`, `0.120.6–0.120.7`, and `0.140.27`.
Their exact handoffs live in
[Focused Product Capability Completions](implementation/PRODUCT_CAPABILITY_COMPLETIONS.md).

The second additions are `0.18.14`, `0.20.5`, `0.30.18–0.30.22`,
`0.50.7–0.50.17`, `0.60.3`, `0.70.4`, `0.81.3–0.81.6`, `0.86.2`,
`0.100.1`, `0.132.3`, `0.138.4–0.138.5`, `0.139.1`, and `0.145.3`.
Their exact handoffs live in
[Requirement Ownership And Product Integration Completions](implementation/REQUIREMENT_AND_INTEGRATION_COMPLETIONS.md).

The coherence additions are `0.18.15–0.18.16`, `0.30.23–0.30.29`, `0.50.18`,
`0.51.3–0.51.34`, `0.60.4`, `0.70.5`, `0.100.2`, `0.118.5`,
`0.120.8–0.120.10`, `0.132.4`, `0.138.6–0.138.7`, `0.140.28`, and `0.145.4`.
Their exact handoffs live in
[Roadmap Coherence Completions](implementation/ROADMAP_COHERENCE_COMPLETIONS.md)
and [Roadmap Authority And Recovery Completions](implementation/ROADMAP_AUTHORITY_COMPLETIONS.md).

Every companion has a separate exact-commit pentest. New scope discovered
during implementation triggers another split; it may not be absorbed into the
parent or covered by an earlier report.

Splitting does not weaken the cumulative Phase C transaction law. Every
`0.29.x–0.30.x` slice uses the canonical
deployment-retirement-fence→active-coordinator-generation→job→candidate/barrier→authorization→ordered-domain-owner→control-settlement-archive-head→control-settlement-journal-head→recovery-capacity-parent-ledger→backend-storage-cost-active-recost-campaign-slot→backend-storage-cost-recost-campaign-fence→corruption-control-reserve→history-obligation→corruption-fence→corruption-control-lineage→corruption-control-lineage-checkpoint→lineage-disposition→recovery-authorization→clearance-anchor-source-manifest-head→clearance-anchor-source-manifest-authorization→corruption-clearance-anchor-registry→corruption-clearance-scope→corruption-clearance-authorization→corruption-clearance-attempt→corruption-rebuild→corruption-rebuild-rejection-authorization→archive-head→history/idempotency→recovery-lineage-budget→attempt/successor-budget→retention/legal-hold→audit/result/outbox
order and may implement only the ranks needed by its exact slice.

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
- exact composite-law generation conformance, with no dependency effective
  after its generation, canonical manifest/digest verification, no semantic
  drift between historical and latest views, and no future-generation claim;
- exactly one authority disposition for every post-`0.18.3` milestone;
  conservative proposals are legal only while the milestone is planned, must
  resolve in the status-transition commit, and cannot enter a release
  candidate;
- release notes, known limitations, CI, CodeQL default setup, and signed
  release-evidence review.

Planning prose, a passing documentation check, or an elapsed date cannot satisfy
an implementation exit. Every shipped claim must name an executable owner and
be no broader than the exact tested protocol, provider, topology, storage,
platform, and deployment profile. Conditional and unsupported combinations
remain explicit and fail closed.

When a row's deliverable and verification pass, stop and report:

```text
vX.Y.Z implementation stop reached. Run pentest for this exact commit.
```

Do not tag. Fix findings, rerun all gates, obtain a permanent `Status: PASS`
report for the exact reviewed commit, and run the readiness gate. Critical or
high findings always block release. A companion version may correct or complete
one pre-declared parent-family slice or deliver one explicitly planned bounded
phase capability. It cannot absorb unrelated scope or widen an earlier contract
implicitly, and it follows the same process.

## Phase A — Pure Foundation

Setup: N0/N1 only, no I/O, allocator use explicit, no external code.
Goal: establish canonical deterministic types and state transitions.
Phase exit: the in-memory incident slice replays identically and passes its
exact-commit pentest.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.1.0` | Workspace, architecture laws, threat-model format, CI, private crates, evidence-status manifest, canonical 400-stop roadmap manifest, and release baseline | Repository trust, CI permissions, action pins, source/publication policy, count/claim drift, fail-closed release gate |
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
| `0.16.0` | Transactional effect intent with authority, remote concurrency, and exception identity | Missing audit/authority, target/validator substitution, weak provider condition, exception ID/scope reuse, outcome collapse |
| `0.16.1` | Atomic command commit bundle | Missing/split command component, audit/receipt digest deletion, denial-chain splice |
| `0.17.0` | Inbox and idempotent consumer model | Replay, duplicate local commits, poisoned receipts, remote-duplication ambiguity |
| `0.17.1` | Atomic consumer commit bundle | Receipt/local-commit split, redelivery duplication, hidden multi-stream or remote-in-transaction work |
| `0.18.0` | Leases, timers, and scheduler primitives | Double ownership, clock shifts, expired lease use, retry storms |
| `0.18.1` | Durable quota vocabulary, kinds, epochs, and ledger schema | Type/boundary/overflow/cross-tenant tests; no admission or settlement implementation is pulled forward |
| `0.18.2` | Discriminated atomic-work bundle schema and canonical variant envelope | Closed discriminant/codec/property tests; executable variants remain in `0.18.8–0.18.10` |
| `0.18.3` | Stable invariant/law declaration IDs, markers, and parser | Missing/duplicate/malformed declaration tests; ownership and law execution remain in `0.18.11–0.18.13` |
| `0.18.4` | Source-delivery-complete evaluator re-evaluation plus first real catalog successor rollout | Crash/race both authenticated control receipts and action-claim issue/consume boundaries; test crash-after-commit, expiry-before-response, revocation-before-replay, restore-before-tombstone reconciliation, receiver forgery, substitution, uncertain reissue, and existing authority failures |
| `0.18.5` | Remediation-authority bootstrap and recovery root | First admission, independent channels/KMS, quorum/separation, simultaneous loss, compromise, circularity, stale restore, manual-only providers |
| `0.18.14` | Stable functional/operational requirement registry and bidirectional ownership checker | Missing/duplicate primary owner, predecessor/crate/schema/test/retest/lifecycle drift |
| `0.18.15` | Stable requirement source anchors, content digests, supersession, and normative drift checker | Unmarked normative block, mutable line binding, digest drift, orphan/supersession conflict |
| `0.18.16` | Early Hosted feasibility and dependency-law support/defer decision | Hidden dependency, improvised protocol, premature adapter, false support, N0/N1 contamination |
| `0.19.0` | Integrity chains and signed-checkpoint interface | Bind both control receipts/authenticators/replay tombstones, authorization/outbox/pin, action-claim issuer sequence plus local consumption/outcome/uncertainty, exact owners/ratchets, and existing event/catalog integrity |
| `0.20.0` | Replay, verification, and projection-rebuild CLI | Corrupt streams, unbounded replay, evidence omission, unsafe repair |
| `0.20.1` | Security audit projection, access receipts, and journal | Crash rebuild, bytes released before audit, stream completion/abort gaps, outage policy |
| `0.20.2` | Hosted telemetry semantics and instrumentation contract | Tenant/secret labels, cardinality, trace spoofing, readiness lies, backpressure |
| `0.20.3` | Shared provenance and temporal-fact primitives | Clock collapse, destructive correction, confidence inflation, cross-domain semantic drift |
| `0.20.4` | Reference-model harness plus models for critical state machines implemented through `0.20.3`; later critical machines register before their own exit | Faulty transition detection, small-state completeness, deterministic counterexample replay, prospective registration |
| `0.20.5` | Complete Phase A/B requirement-ownership backfill | Prose/registry differential, semantic duplication, uncovered requirement, dead owner/test link |

## Phase C — Storage Portability

Setup: approve each hosted boundary at its first consuming milestone; no wire
protocol is exposed to domain code. Goal: identical semantic behavior across
documented backends.
Phase exit: export/import and the conformance suite preserve tenant and event
integrity. Under the current no-third-party policy, unavailable safe backend
implementations remain blocked rather than being implemented casually.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.21.0` | Stable storage-capability vocabulary and canonical report schema | Type/canonicalization/contradiction tests only; admission, probes, lineage, recovery, and refusal are `0.21.1–0.21.5` |
| `0.22.0` | Reusable storage-conformance harness, deterministic fixtures, and fault-injection contract | Harness self-tests and fixture reproducibility; destructive, tenant, HA/migration, and model-correspondence matrices are `0.22.1–0.22.4` |
| `0.22.4` | In-memory/reference adapter correspondence and deterministic fault execution; later adapters certify at their own milestones | Seeded divergence, response loss, crash, retry, and explicit refusal |
| `0.23.0` | SQLite single-node adapter | Retain all prior adapter proofs; prove unified checkpoint/deletion journaling, atomic checkpoint bundle, mixed-trigger archive replay, both CAS boundaries and all prior busy/crash/reopen guarantees, or refuse VIT-CAP-060/061 |
| `0.24.0` | PostgreSQL reference production adapter | Retain all prior protections; prove concurrent atomic checkpoint bundles, checkpoint/deletion trigger isolation, unified journal ordering, mixed archives and both CAS boundaries under pool failover |
| `0.25.0` | Experimental MySQL adapter | Prove unified checkpoint/deletion settlement and all prior two-head/bounds/exact-ID/conservative semantics plus attempt-ledger parity, or refuse VIT-CAP-060/061; no default v1 claim |
| `0.26.0` | Experimental MongoDB adapter | Prove unified checkpoint/deletion settlement and all prior semantics under transactions/failover, or refuse VIT-CAP-060/061; no default v1 claim |
| `0.27.0` | Experimental SurrealDB adapter | Prove version-specific unified checkpoint/deletion settlement and all prior two-head semantics, or refuse VIT-CAP-060/061; retain capability truthfulness |
| `0.28.0` | Blob-store API and filesystem adapter | Traversal, symlinks, races, content mismatch, quotas |
| `0.28.1` | S3-compatible object-storage adapter | Tenant/object confusion, endpoint spoofing, multipart races, retention/deletion |
| `0.28.2` | KMS and secret-provider adapters | Serialized provisioning/inventory/orphan/count controls plus governed evaluator upgrade/reevaluation, strong-resolution evidence, independent recovery or manual limitation |
| `0.28.3` | In-process secret and brokered-bearer memory handling | HTTP/TLS/redirect/error/log/crash/core-dump/swap canaries, stale cache, honest transient-memory/erasure limits |
| `0.29.0` | Immutable migration registry, identity, plan hash, preconditions, and dry-run planner | Deterministic plan/canonicalization/signature/non-rewrite tests; execution through disposition is `0.29.1–0.29.5` |
| `0.30.0` | Canonical cross-backend manifest format and bounded preflight verifier | Manifest substitution/truncation/version/tenant/law/profile/budget tests; transfer program is `0.30.3–0.30.14` |
| `0.30.1` | Durable queue record model and non-authoritative semantic port | Ordering/tenant/idempotency/boundary tests; claims and recovery are `0.30.15–0.30.16` |
| `0.30.2` | Cache semantics and hosted adapter | Cross-tenant/policy keys, stale authorization, poisoning, erasure leaks |
| `0.30.17` | Minimal N1 policy, field-redaction, obligation, and interface-registration contract | Missing decision inputs, allow-by-default, field reappearance, unregistered DTO/command surface |
| `0.30.18` | Complete Phase C requirement-to-stop ownership backfill | Buried requirement omission/duplication, wrong adapter/migration/test/retest owner |
| `0.30.19` | Complete Phase D–G requirement ownership before product implementation | Domain/UI owner confusion, missing policy/fake-retest/side-effect/lifecycle owner |
| `0.30.20` | Complete Phase H–K requirement ownership | Raw/derived, graph/search, asset/discovery, pack/policy, privacy/lifecycle gaps |
| `0.30.21` | Complete Phase L–production requirement ownership | Optional/core confusion, missing external/profile/restore/pentest/support owner |
| `0.30.22` | Stable early service/asset/agreement/customer/contact/supplier references and read-port fakes | Cross-type/tenant substitution, ref-as-authority, hidden/stale/unbounded reads, duplicate identity vocabulary |
| `0.30.23` | Stable domain manifest, dedicated `DomainId`, requirement/crate plus aggregate/stream/command/event/read/consumer links, and typed reference envelope | Requirement/domain confusion, duplicate ID, wrong-domain event, unowned upcaster, embedded future mapping, authority grant |
| `0.30.24` | Contribution-kind references, required registry/lifecycle/test/certification dimensions, scope-separated metadata admission, compatibility, and rollback safety | Dangling/mismatched ID, missing kind obligations, namespace/dependency collision, downgrade, partial admission, metadata-as-enable |
| `0.30.25` | Contribution deferral lifecycle, structural no-deferral rule, and product-state/certification gates | Existing schema/store/route/derived/effect/message deferred, incomplete/expired defer, owner/retest gap, silent support, bypass |
| `0.30.26` | Current domain-event ownership backfill and prospective emission/consumer/upcaster/generation gate | Unowned/wrong-domain event, undeclared emission/consumption, owner mismatch, stale generation, future-only claim, bypass |
| `0.30.27` | Complete `0.18.8–0.18.10` durable async ownership backfill and prospective effect/message/consumer/timer/activity/poison/replay/result gate | Kind/instance confusion, wrong owner/schema/destination, unauthorized replay, orphaned poison/quarantine, retention loss, downgrade |
| `0.30.28` | Domain retirement lifecycle, orthogonal authority/work/data/history evidence, distinct verified/loss/blocking terminals, and prospective gate | Dimension collapse, loss presented as clean, hold/residual release from loss evidence, ID reuse, late work, codec/backup/import break |
| `0.30.29` | Closed tenant-versus-deployment scope, exact tenant-child proposal authority, expected-version admission, atomic commitment, cancellation, and recovery | Optional/wildcard tenant, deployment-as-one-child, cross-tenant transaction, scope/digest/generation substitution, self-approval, unsafe resume |

### Migration/import irreversible-operation hardening map

The following work strengthens the existing `0.29.0` contract; it does not
replace or defer its earlier retirement, cost-lineage or parent-ledger
requirements.

#### Retained baseline contract

| Version | Required context and deliverable | Verification and exit condition |
| --- | --- | --- |
| `0.29.0` | Correct the parent ledger to four authenticated encumbrance classes and fund every workspace with an atomic parent transfer/inverse. Freeze the three-case release cut, campaign+mutation-fence product, prior-state recovery, exact shared logical/physical verification cut, post-slot bounded cleanup and named settlement checkpoint. Add issuer intent plus destination inbox/apply/result revocation and make quarantined capacity a permanent whole parent member pending broader custody-safe release | Race simultaneous child/campaign/workspace reservations and prove ParentTotal conservation. Reject Verified while Open or at mismatched logical/physical cuts. Race slot clear/new campaign/old cleanup without stale mutation or starvation. Race revocation before admission/Issued/consumption with stale and cross-target sequences. Prove quarantine cannot partially refund |
| `0.30.0` | Export/import preserves the fourth workspace aggregate/membership, parent transfers, exact-cut checkpoint, old Closed fence and settlement checkpoint, plus quarantine revocation intent/sequence/inbox/tombstone/result beside every prior retirement/campaign/classifier/verification artifact | Missing/defaulted aggregate, transfer, cut field, stable fence or revocation state leaves the destination fenced and unready; no source charge, credit, sequence or terminal meaning is inferred |
| `0.140.1` | Freeze retirement and permanent-quarantine grant and revocation preimages, target-scoped sequence/time/key-continuity rules, symbolic-classifier proof format, exact-cut checkpoint digest and final activation authority preimage | Independent review proves remote intent alone has no local effect, sequences cannot suppress unrelated targets, neither issuer self-admits/consumes, two different cuts cannot activate and quarantine cannot be selected by generic recovery |
| `0.140.2` | Freeze rows/indexes and checked atomic transactions for all four parent aggregates, workspace parent transfer/inverse, logical/physical checkpoint, old-fence cleanup and `MigrationWorkspaceSettlementCheckpointV1`, plus revocation inbox/tombstone/result | Each adapter proves no double reservation/credit, same-cut verification, safe cleanup after None/new slot, exact per-leg workspace settlement and destination-local revocation or refuses |
| `0.140.3` | Freeze issuer/admitter/revocation-applier/quorum/SoD roles for retirement, campaign/recovery, permanent quarantine, parent allocator, workspace worker/settler, classifier and verifier | No role can issue and apply revocation, self-authorize quarantine, approve and execute recovery, build and falsely settle workspace, mutate a newer campaign during old cleanup, classify/approve weakening or repair/credit capacity |
| `0.140.5` | Freeze custody for release cuts, product/fence/terminal state, quarantine grant+revocation tombstones, parent workspace transfers, exact-cut and deletion/settlement evidence | Compaction/erasure cannot remove the fourth member, create credit, reopen Closed, reuse/revive authority, discard cleanup encumbrance, invent a cut/settlement/refund or reset sequence/work |
| `0.140.6` | Freeze HA takeover/restore for prior-state recovery/folds, terminal checkpoint, old Closed cleanup fence, revocation inbox and full workspace/parent-transfer lifecycle | Failover resumes identical cursor/fold/cut/reservation/member/settlement/revocation winner without unbounded transaction, reopened fence, stale-slot mutation, duplicate credit or release |
| `0.142.0` | Expose state and status only: RPC carries exact campaign/workspace/parent/revocation identifiers and stored outcomes without becoming an authority path | Remote calls cannot bypass destination admission/apply, invent a workspace credit or accept mismatched cuts |
| `0.143.0` | Model-check parent/workspace transfer races, logical/physical cut closure, slot-clear/new-campaign/old-cleanup interleavings and revocation/consume CAS winners | All reachable states conserve four-class ParentTotal, have one terminal winner and exclude stale mutation, partial-leg settlement and cross-target revocation |
| `0.145.0` | Exercise backup/restore and disaster recovery for the fourth aggregate, exact cut, old terminal fence, settlement checkpoint and revocation sequence/inbox | Restored partitions stay unavailable until complete membership/transfer/cut/sequence proof; no guessed credit, cut or revocation |
| `0.146.0` | Fuzz codecs, bounds, crash points and changed retries for transfers, checkpoint fields, cleanup quanta and revocation material | Malformed/overflowed/stale inputs fail closed within hard work limits and never split parent/workspace state |
| `0.147.0` | Audit role separation, operational cleanup fairness and permanent quarantine/custody-safe-release evidence | No issuer/applier, worker/settler, old/new campaign or allocator/verifier authority collapse; every retained/refunded unit is attributable |
| `0.148.0` | Freeze compatibility and reject legacy encodings lacking workspace membership, exact-cut, settlement or revocation fields | No defaulting or semantic downgrade; unsupported data remains fenced |
| `0.149.0` | External pentest targets double workspace reservation, forged inverse credit/deletion, mismatched-cut activation, stale-slot cleanup mutation/starvation, quarantine revocation theft/replay/cross-target suppression, partial quarantine refund and all prior attacks | Zero unresolved critical/high findings and no waived authority, bounded-work, conservation, locking, physical-capacity, settlement, revocation or recovery issue |
| `0.150.0` and `1.0.0` | Demonstrate install/upgrade/failover/restore continuity for the frozen four-class, same-cut, terminal-cleanup and revocation contract and retain exact-commit evidence | No production claim until every selected adapter passes and the final exact commit passes the independent pentest |

#### Immutable workspace and cleanup-progress refinement

| Version | Required context and deliverable | Verification and exit condition |
| --- | --- | --- |
| `0.29.0` | Retain four-class parent accounting and add immutable workspace OriginalTotal, monotonic Released, derived remaining member and atomic complete-leg settlement. Freeze a durable cleanup admission lane/contention budget/backlog/hard maximum. Make quarantine authorization revocation first-terminal-wins across all six states through one outcome wrapper | Prove original/released equations and per-leg/parent atomicity under response loss. Race continuous foreground work against cleanup and prove a bounded cleanup turn plus bounded terminal backlog. Race revocation with expiry/consumption and require stored terminal outcomes rather than retry loops |
| `0.30.0` | Export/import preserves original/released/settled-leg history, cleanup lane/turn/contention/backlog/maxima and quarantine first-terminal outcome beside every prior workspace/parent/campaign artifact | Missing/defaulted counters, legs, scheduler state or terminal result leaves the destination fenced; no total, release, cleanup turn or result is inferred/reset |
| `0.140.1` | Freeze prior grant/revocation preimages plus the closed permanent-quarantine authorization outcome/conflict wrappers and first-terminal table | Independent review proves CAS losers reread/reapply, terminal observations join stored quarantine/expiry/revocation results and changed material alone conflicts |
| `0.140.2` | Freeze OriginalTotal/Released/settled-leg and cleanup lane/contention/backlog/hard-maximum rows/indexes; atomic leg→Released→parent inverse→ParentAvailable settlement; and total revocation transactions | Each adapter proves immutable total, monotonic release, no fractional/double leg, bounded cleanup admission/backlog and uniform terminal outcomes or refuses |
| `0.140.3` | Freeze prior roles plus cleanup scheduler/claimant authority and foreground admission boundaries | No worker resets/bypasses a due cleanup turn, self-settles, expands backlog, rewrites totals/releases or returns adapter-specific terminal conflicts |
| `0.140.5` | Freeze custody for immutable totals, released counters, exact leg tombstones, cleanup turns/budgets/backlogs and every terminal authorization result | Compaction/erasure cannot roll back release, recreate a leg, reset cleanup priority, drop a terminal result or invent capacity |
| `0.140.6` | Freeze HA takeover/restore for original/released/leg state, cleanup lane/claimant/contention/backlog and first-terminal authorization outcome | Failover resumes identical accounting, scheduled turn and winner without free retries, starvation, duplicate credit, terminal conversion or result loss |
| `0.142.0` | RPC carries exact original/released/leg, cleanup scheduler/backlog and terminal authorization outcomes as state only | Remote calls cannot settle, reset priority/counters, apply authority or translate a stored terminal result into conflict |
| `0.143.0` | Model-check leg settlement/restore anti-rollback, adversarial foreground-cleanup scheduling/backlog admission and every revocation/expiry/consume CAS loser | All states conserve original total and ParentTotal; cleanup wins within its bound; backlog stays capped; first terminal result is stable |
| `0.145.0` | Restore immutable totals, monotonic releases, settled legs, scheduler counters/backlog and terminal outcomes beside prior state | No guessed total/release/turn/result; affected capacity and foreground admission remain fenced until complete proof |
| `0.146.0` | Fuzz equation/leg/scheduler/outcome codecs, counters, crash points, thresholds, changed retries and backend contention | Overflow, rollback, duplicate legs, unfair mutexes and malformed terminal material fail closed within hard work/backlog limits |
| `0.147.0` | Audit cleanup admission fairness, backlog operations, per-unit release attribution and first-terminal result parity across adapters | No role collapse, hidden starvation/reset, mutable original total, missing release evidence or adapter-specific terminal behavior |
| `0.148.0` | Reject legacy encodings lacking original/released equations, exact settled legs, cleanup scheduler/backlog/maxima or closed terminal outcomes | No defaulting, semantic downgrade or mutable-current-total compatibility |
| `0.149.0` | External pentest attacks total/released rollback, fractional/double settlement, parent-credit split, cleanup starvation/backlog exhaustion/priority bypass and terminal revocation retry/conflict loops beside all prior attacks | Zero unresolved critical/high findings and no waived conservation, bounded-backlog, fairness, authority, settlement, restore or compatibility issue |
| `0.150.0` and `1.0.0` | Demonstrate continuity for immutable workspace accounting, bounded terminal cleanup and total authorization outcomes beside the prior frozen contract | No production claim until every selected adapter passes and the final exact commit passes the independent pentest |

#### Custody closure and unverifiable-cleanup refinement

This refinement closes the two previously identified terminal workspace paths. It is
additive to both tables above: ordinary Cleaned settlement, permanent campaign
quarantine, immutable accounting and cleanup fairness remain unchanged.

| Version | Required context and deliverable | Verification and exit condition |
| --- | --- | --- |
| `0.29.0` | Add CleanupReconciling for bounded DeletionOutcomeUnknown recovery and an independently authorized PermanentlyRetained terminal that preserves every remaining leg/parent charge while moving the workspace from the active cleanup lane into a precharged hard-bounded retention pool. Add distinct CustodyReleased and one whole-member custody-release settlement/checkpoint that verifies retention, legal hold, custody and no future dependency, then atomically settles all remaining legs, advances Released to OriginalTotal, removes/credits the identical parent member and writes tombstones/result/audit/outbox | Fault lost credentials/keys, inconsistent backend responses, late evidence and every crash boundary. Prove no unknown-as-deleted, no activation rewrite, no credit on retention, bounded foreground recovery and either complete parent+workspace custody release or the fully encumbered predecessor |
| `0.30.0` | Export/import preserves reconciliation observations/budgets, retention authorization/result, pool reservation/occupancy/maxima, CustodyReleased meaning and whole-member leg/checkpoint/parent-transfer evidence beside all earlier state | Missing/defaulted/forked reconciliation, pool or custody-release state leaves the destination fenced; restore never chooses parent or workspace as truth and never infers deletion, release or repair |
| `0.140.1` | Freeze deletion-observation and retention/custody authorization preimages, first-terminal outcomes, exact workspace/activation/leg/evidence/policy/hold/time/quorum/SoD bindings and domain-separated custody-release digest | Independent review proves campaign quarantine authority cannot terminalize post-activation uncertainty, workers cannot self-retain/release and late evidence cannot mutate activation or authorize credit |
| `0.140.2` | Freeze reconciliation, retention-pool/reservation/maxima and custody-release rows/indexes plus atomic CleanupReconciling→PermanentlyRetained no-credit transfer and whole-member legs→Released→parent inverse→CustodyReleased transaction | Every adapter proves all-or-none state/accounting/lane/pool/result changes, bounded maximum transaction shape and no duplicate generic-lineage workspace credit, or refuses |
| `0.140.3` | Freeze retention issuer/admitter/operator, cleanup claimant, custody/legal-hold approver and custody releaser separation beside prior roles | No worker/claimant self-terminalizes, no sole approver releases custody, no foreground actor consumes protected pool capacity and no lineage releaser bypasses workspace settlement |
| `0.140.5` | Freeze reconciliation observations, permanent-retention evidence, late-evidence history, pool occupancy and every custody-release leg/tombstone/checkpoint/result as retained custody records | Compaction/erasure cannot turn unknown into deleted, drop retained encumbrance, reopen cleanup, rewrite activation, orphan a parent/workspace side or manufacture a release proof |
| `0.140.6` | Freeze HA takeover/restore for reconciliation cursor/budgets, retention authorization/pool reservation and whole-member custody-release predecessor/result | Failover resumes the same claimant, budget, pool charge and transaction winner; crash at every leg/credit/checkpoint boundary restores either complete CustodyReleased or complete encumbrance |
| `0.142.0` | RPC exposes deletion outcome, reconciliation, retention/pool and custody-release status/evidence only | Remote services cannot assert deletion, consume retention/custody authority, remove the cleanup lane claim, credit the parent or translate PermanentlyRetained/CustodyReleased |
| `0.143.0` | Model-check unknown/present/deleted observations, cleanup/reconciliation/retention authorization races, active-lane removal and whole-member release against foreground contention | No permanent foreground deadlock, unsafe credit, activation-result mutation, pool overflow, split ledger terminal or illegal late-evidence transition is reachable |
| `0.145.0` | Restore all reconciliation/retention/pool/custody-release state with the linked lineage checkpoint and both ledger sides from one authenticated snapshot | Any missing/forked observation, authority, leg, pool reservation, parent transfer or checkpoint keeps affected foreground admission/capacity fenced without guessed repair |
| `0.146.0` | Fuzz deletion outcomes, credentials/keys, evidence generations, authorization codecs, pool bounds, late evidence and each whole-member crash/retry boundary under failover and backend inconsistency | Unknown remains nonterminal until authorized retention; retries are exact; work stays bounded; ParentTotal and workspace equations hold without duplicate credit |
| `0.147.0` | Audit SoD, no-credit retention, active-lane escape, protected pool provisioning, late-evidence custody and linked parent/workspace release attribution across adapters | Zero high/critical authority, availability, conservation, custody, restore or evidence-retention gap |
| `0.148.0` | Reject legacy encodings lacking CleanupReconciling/PermanentlyRetained/CustodyReleased distinctions, pool reservations, retention authority or linked whole-member settlement | No state collapse to Cleaned/Quarantined, inferred deletion, default pool capacity, independent parent credit or semantic downgrade |
| `0.149.0` | External pentest attacks unknown-as-deleted, credential/key loss, retention self-approval, lane/pool exhaustion, late-evidence activation rewrite, partial/double custody release and parent/workspace split restore beside every prior attack | Zero unresolved critical/high findings and no waived authority, availability, bounded-work, custody, accounting, atomicity, restore or compatibility issue |
| `0.150.0` and `1.0.0` | Demonstrate exact-commit install/upgrade/failover/restore continuity for bounded unknown-deletion handling, permanent retention and atomic whole-member custody release beside the entire prior contract | No production claim until every selected adapter passes, operational escalation is proven and the final exact commit passes independent pentest |

#### Abort symmetry, combined release rank and typed-authority refinement

This refinement completes, rather than replaces, the custody-closure table.
Activated and aborted cleanup now share one origin-preserving reconciliation
protocol; the all-or-none bundle remains the selected release strategy.

| Version | Required context and deliverable | Verification and exit condition |
| --- | --- | --- |
| `0.29.0` | Add closed CleanupOrigin/terminal-reference types so ActivatedCleanupPending and AbortCleanupPending can both enter CleanupReconciling and return only to their matching pending state. Complete the six-state retention authorization operation family. Add separate BeginRelease and CommitCustodyRelease lineage grants, one canonical archive/journal→parent→current-slot→sorted-old-fences→control/lineage/checkpoint→authorization/custody→outputs rank, and aggregate CustodyReleaseBundleHardMaximum covering ordinary legs plus every workspace | Exercise unknown deletion, retention and late evidence for activation and abort. Race every authorization operation. Reject evidence-as-authority, wrong-origin resume, unsorted/late lock acquisition, per-workspace-only sizing and any over-limit or split release before mutation |
| `0.30.0` | Preserve CleanupOrigin/terminal reference, every retention and lineage-release authorization state/inbox/tombstone/result/sequence, sorted fence-set digest, aggregate bundle profile/preflight and acquisition trace beside all prior custody state | Missing/defaulted/forked origin, grant, sequence, fence set, bound or trace keeps the destination fenced; import cannot infer activation versus abort, authority or aggregate fit |
| `0.140.1` | Freeze origin/terminal-reference encoding and retention plus BeginRelease/CommitCustodyRelease authorization/revocation preimages, sequence scopes, action binding and first-terminal wrappers | Review proves mixed terminal references are noncanonical, evidence never invokes a command, cross-action replay fails and CAS losers return stored winners |
| `0.140.2` | Freeze authorization/inbox/tombstone/result rows, aggregate bundle maximum/preflight, deterministic multi-fence indexes and both ranked atomic transactions | Every adapter proves exact six-state operations, all-or-none authorization consumption/accounting and a backend-supported maximum transaction or refuses |
| `0.140.3` | Freeze retention issuer/admitter/applier/operator and lineage-release issuer/admitter/applier/begin/finalize roles beside cleanup, custody and legal-hold approvers | No worker or evidence holder self-authorizes; no Begin grant commits custody; no Commit grant creates ReleasePending; no role bypasses ordered locks |
| `0.140.5` | Retain cleanup origin/reference, every grant/tombstone/result, sorted bundle digest, aggregate sizing proof and acquisition trace with custody evidence | Compaction cannot collapse abort into activation, revive authority, erase a lock/order violation or turn an individually bounded set into aggregate release proof |
| `0.140.6` | Freeze failover/takeover of reconciliation origin, authorization winners/sequences and the exact combined lock/bundle state | Crash resumes the same origin, grant winner and bundle; takeover never changes fence order, recreates authority or partially releases |
| `0.142.0` | RPC carries origin/reference, typed authorization outcomes and aggregate bundle/rank status only | Remote services cannot choose cleanup origin, translate outcomes, mint release authority, reorder fences or assert bundle fit |
| `0.143.0` | Model both cleanup origins, all retention/release authorization races and combined multi-fence acquisition at/over every aggregate limit | No wrong-origin transition, deadlock cycle, cross-action consumption, unbounded transaction or partial ledger terminal is reachable |
| `0.145.0` | Restore origin/reference, authorization sequences/inboxes/tombstones/results, sorted fence set and bundle proof with both ledger sides | Any missing or inconsistent item preserves the authoritative predecessor and denies readiness without repair inference |
| `0.146.0` | Fuzz origin/union codecs, grant operations, fence-set ordering/deduplication, aggregate arithmetic and every begin/final crash boundary | Malformed, overflowed, reordered, duplicate or changed material fails closed within row/byte/lock/write/work/time limits |
| `0.147.0` | Audit abort/activation symmetry, complete authorization SoD, canonical lock acquisition and aggregate preflight across adapters | Zero high/critical lifecycle, authority, deadlock, transaction-bound, custody, accounting or replay gap |
| `0.148.0` | Reject legacy encodings lacking origin/reference, complete authorization families, combined rank or aggregate bundle proof | No default Activated origin, prose authority, per-workspace-only sizing, unsorted fence set or semantic downgrade |
| `0.149.0` | External pentest targets aborted unknown cleanup deadlock, origin substitution, revocation/apply replay, custody evidence forgery, Begin/Commit action confusion, ABBA locks and aggregate transaction exhaustion beside every prior attack | Zero unresolved critical/high findings and no waived lifecycle, authority, availability, locking, bounded-work, atomicity, restore or compatibility issue |
| `0.150.0` and `1.0.0` | Demonstrate exact-commit continuity for origin-symmetric cleanup, fully typed release authority, combined ranked locking and aggregate-bounded all-or-none custody release | No production claim until every selected backend proves its supported maximum, all adapters pass and the final exact commit passes independent pentest |

#### Explicit commit boundary and issuer-revocation refinement

This final command-kernel refinement retains the selected all-or-none bundle,
combined rank and separate Begin/Commit grants. It makes the two mutations and
both issuer-to-destination revocation paths mechanically complete.

| Version | Required context and deliverable | Verification and exit condition |
| --- | --- | --- |
| `0.29.0` | Add explicit BeginLineageRelease and CommitLineageCustodyRelease commands with action-specific payload/result/conflict types. Commit binds stored begin result, verified publication receipt, archive/journal heads, bundle digest, authorization and expected lineage version. Publishers/adapters emit evidence only. Add issuer-side Revoke commands, monotonic signed-intent result/conflict and the complete shared six-state table for retention and lineage grants | Exact retries return stored action results; changed payloads conflict. Direct publisher terminal mutation is impossible. Exhaust every table cell, absent no-write, issuer retry/sequence, late admission, stale sequence, terminal observation and changed material |
| `0.30.0` | Preserve command payload/result identities, expected versions, publication receipts, issuer sequences/signed-intent results and every destination table row/outcome beside prior origin/bundle/custody state | Missing/defaulted/forked command, receipt, issuer or destination state denies import; destination never infers final commit from archive publication or intent from a tombstone |
| `0.140.1` | Freeze begin/commit payload and result/conflict encodings plus both issuer Revoke request/intent/result/conflict preimages, sequence allocation and total-table outcomes | Review proves payload rebinding, generic release dispatch, evidence authority, issuer destination mutation and first-terminal conversion are impossible |
| `0.140.2` | Freeze command dispatch/CAS/result rows, receipt verification, issuer sequence/result transaction, destination Apply transaction and all six-state no-write/write bundles | Every adapter proves exact retry, changed conflict, atomic intent allocation, no absent expiry/consume write and action-specific final mutation or refuses |
| `0.140.3` | Freeze begin operator, commit operator, publisher, storage adapter, revocation issuer and destination applier capabilities beside prior SoD | Publishers/adapters cannot call terminal commands; issuers cannot apply; begin cannot finalize; commit cannot create ReleasePending |
| `0.140.5` | Retain begin/final payload digests/results, publication receipts, issuer sequence/intent results and destination inbox/tombstone/outcomes | Compaction cannot turn evidence into mutation, lose exact-retry history, reuse a sequence or collapse issuer intent into destination effect |
| `0.140.6` | Freeze takeover/restore of in-flight publication, both command results and both sides of each revocation transport | Failover resumes the same command/intent/table winner without replayed deletion, duplicate credit, sequence rollback or terminal conversion |
| `0.142.0` | RPC exposes explicit begin/commit and issuer-Revoke/destination-Apply messages with typed status only | Remote publisher/storage status cannot become commit; issuer intent cannot become destination mutation; payload fields remain lossless |
| `0.143.0` | Model command, publication, authorization, expiry and revocation races across all six states and every begin/final crash boundary | One action-specific terminal result wins; no unnamed transition, absent write, direct evidence mutation, duplicate action or cross-command replay is reachable |
| `0.145.0` | Restore expected versions, payload/result/idempotency, publication receipt/head coverage, issuer sequence/result and destination table state | Any missing/forked item preserves ReleasePending or its predecessor and denies readiness without inferred finalization |
| `0.146.0` | Fuzz payload/receipt/intent/outcome codecs, sequence arithmetic, every table state and response-loss/changed-retry boundary | Malformed, stale, overflowed, cross-action or rebound material fails closed within prior aggregate limits |
| `0.147.0` | Audit typed-command exclusivity, evidence-only publishers, issuer/applier separation and cross-adapter table/result parity | Zero high/critical command-kernel, authority, replay, custody, accounting, restore or evidence gap |
| `0.148.0` | Reject legacy encodings or dispatch maps with generic lineage release, implicit archive finalization, missing issuer Revoke/result/sequence or incomplete table outcomes | No compatibility shim translates publisher evidence into commit, defaults table state or merges begin/final results |
| `0.149.0` | External pentest targets generic/direct terminal mutation, payload rebinding, forged publication receipts, issuer sequence races, remote-intent effect, absent-state writes, late admission and terminal-result conversion beside all prior attacks | Zero unresolved critical/high findings and no waived command-boundary, authority, atomicity, replay, restore or compatibility issue |
| `0.150.0` and `1.0.0` | Demonstrate exact-commit continuity for explicit begin/final commands and complete issuer/destination authorization protocols beside all prior custody controls | No production claim until every adapter proves command capability isolation and the final exact commit passes independent pentest |

#### Authoritative archive commit and physical-disposition refinement

This refinement preserves the explicit command kernel, all-or-none bundle and
evidence-only publishers while closing the remaining authority and physical-
capacity conservation boundaries.

| Version | Required context and deliverable | Verification and exit condition |
| --- | --- | --- |
| `0.29.0` | Make archive publication lifecycle non-authoritative until Commit. Commit alone CAS-installs the proposed archive replay head with exact hot-row deletion, authorization consumption, settlement and results. Add a closed AuthenticatedDeleted/TransferredToCustodyLedger/Unknown disposition for every remaining workspace leg; transfer converts its prior reservation into the conservatively costed archive/legal-hold custody member before exact source credit | Crash after upload leaves readers on the prior head and all hot rows authoritative. Prove no head-without-delete, deletion-without-head, credit-without-deletion-or-charged-transfer, partial leg, Unknown release or adapter head mutation |
| `0.30.0` | Preserve staged receipt lifecycle, proposed/predecessor and committed heads, captured hot-row versions, per-leg terminal disposition receipts/tombstones and custody-ledger versions/members/transfers beside every prior command/result | Missing/defaulted/forked archive or disposition state fences import; no staged receipt becomes replay authority and no restored workspace credit lacks matching physical conservation |
| `0.140.1` | Freeze publication/verification, proposed-head, hot-row capture, deletion and physical-disposition receipt preimages including storage generation, roots, terminal idempotency, custody ledger/member and dimension amounts | Independent review proves receipt/head aliasing, forged deletion, root/generation substitution, partial disposition and custody-capacity substitution fail closed |
| `0.140.2` | Freeze the one commit CAS over authoritative head install, exact hot-row deletion, receipt consumption, custody-reservation/member conversion, workspace tombstones/credit, lineage settlement, result/audit/outbox | Every selected backend proves the indivisible bundle within its declared transaction maximum or refuses; response loss returns the stored winner |
| `0.140.3` | Freeze publisher/verifier, commit operator, deletion verifier and archive/legal-hold custody-ledger authority separation | Publisher and storage adapters cannot advance authoritative heads; deletion evidence cannot debit custody; commit cannot invent either physical outcome |
| `0.140.5` | Retain committed-head coverage, staged/orphan references, deletion/transfer receipts, disposition tombstones and custody-ledger member history | Compaction/GC cannot promote an orphan, erase a charged custody member, turn Unknown into release or sever head/delete and debit/credit proofs |
| `0.140.6` | Freeze takeover/restore at upload, verification and every final commit boundary including custody-ledger versions | Failover recovers either the complete atomic commit or prior head/hot rows/encumbrances; external deletion/transfer uncertainty remains conservatively charged |
| `0.142.0` | RPC exposes staged/verified receipt and physical-disposition status as evidence only; final committed head and capacity result come only from Commit | Remote upload/deletion/transfer success cannot impersonate local replay authority or parent credit |
| `0.143.0` | Model upload/verify/commit/GC, concurrent head CAS, disposition receipt, custody-capacity debit and workspace-credit races | No reader observes head-before-delete; exactly one complete commit wins and no physical quantity exists uncharged between custody and source ledgers |
| `0.145.0` | Restore both archive chains, exact hot coverage, every disposition receipt/tombstone and both source/custody capacity members from one authenticated checkpoint | Any missing/forked relationship preserves ReleasePending or the exact workspace predecessor and denies capacity reuse |
| `0.146.0` | Fuzz receipts, roots, storage/custody generations, dimension arithmetic, proposed heads, captured versions and exact-response-loss retries | Forged, stale, partial, overflowing, cross-leg or rebound material cannot install a head, delete rows or release capacity |
| `0.147.0` | Audit publisher non-authority, commit atomicity, per-leg physical proof and custody-ledger/source-parent conservation across adapters | Zero high/critical archive authority, physical accounting, deletion, transfer, restore or evidence finding |
| `0.148.0` | Reject legacy schemas that let publishers advance heads, split head/delete, omit disposition receipts or credit without a charged custody member | No compatibility shim infers committed archive or physical release from staged/external status |
| `0.149.0` | External pentest targets adapter head advance, forged verified receipt, upload/commit crash, stale captured rows, deletion replay, custody-ledger undercharge, Unknown conversion and commit response loss beside every prior attack | Zero unresolved critical/high findings and no waived archive-authority, head/delete atomicity or physical-conservation issue |
| `0.150.0` and `1.0.0` | Demonstrate committed-head/hot-row exact continuity and source-to-deletion-or-charged-custody conservation for every released workspace leg | No production claim until every selected backend passes crash/model/restore evidence and the final exact commit passes independent pentest |

#### Pre-transfer reservation, custody costing and publication-lifecycle refinement

This refinement keeps the selected explicit Begin/Commit boundary and
head/delete atomicity. It closes the time before Commit, admits unlike storage
dimensions safely and gives publication/GC races typed owners.

| Version | Required context and deliverable | Verification and exit condition |
| --- | --- | --- |
| `0.29.0` | Begin atomically moves a conservative maximum from custody Available to durable TransferPending for every planned external transfer; adapters require that exact reservation. Add a governed versioned CustodyCapacityCostProfile over source/destination generations, unit mapping, compression/encryption/replication/index overhead, rational ceilings, encoded size and backend limits. Add Stage/Verify/MarkOrphan/FinalizeGc commands and Staged→Verified→ConsumedByCommit or Staged/Verified→OrphanGcEligible→Collected lifecycle | No destination byte can exist without a pending or final custody charge. Unknown transfer keeps its reservation. Stage, Verify, MarkEligible, Replan, Abandon, Commit and MarkOrphan serialize through archive-head→plan-head→attempt→receipt ordering; no terminal attempt creates artifacts and no committed chunk is collected |
| `0.30.0` | Preserve cost-profile lineage/digest, transfer plans, maximum/final charges, reservation states/results, publication operation results/budgets and every head/receipt/member link | Missing/defaulted/forked mapping, reservation or publication transition fences import; restore neither refunds uncertainty nor promotes a receipt |
| `0.140.1` | Freeze reservation/transfer/reconciliation and custody-cost preimages plus Stage/Verify/MarkOrphan/FinalizeGc request/result/conflict encodings | Review proves transfer-without-reservation, dimension aliasing, rounding undercharge, changed retry and receipt-state substitution fail closed |
| `0.140.2` | Freeze Begin Available→TransferPending, Commit reservation→member/surplus return and Verified→ConsumedByCommit/head/delete bundles, reconciliation release, orphan admission and GC finalization transactions | Every backend proves each expected-version CAS and exact stored result within declared atomic bounds or refuses |
| `0.140.3` | Freeze Begin operator, transfer adapter, custody-profile owner, capacity-ledger owner, deletion/reconciliation verifier, publisher/verifier, Commit operator and orphan-GC capabilities | No adapter reserves/refunds itself, caller supplies cost factors, publisher commits a head or GC races outside typed commands |
| `0.140.5` | Retain pending/consumed/released reservations, definitely-never-transferred/deleted evidence, cost-profile generations, receipt lifecycle/results/budget and collected tombstones | Compaction cannot refund Unknown, erase an unconsumed charge, revive Collected, detach chunks from a consumed receipt or weaken mapping |
| `0.140.6` | Freeze takeover/restore across Begin reservation, external transfer uncertainty, Commit/MarkOrphan CAS and GC deletion response loss | Failover resumes the exact pending charge and publication state; it never guesses transfer absence, receipt reference or GC completion |
| `0.142.0` | RPC exposes reservation, transfer outcome, cost-profile identity and publication command status as typed evidence only | Remote transfer/upload/GC status cannot release capacity, install a member/head or skip local CAS |
| `0.143.0` | Model reservation/transfer/Commit/reconcile, cost-profile activation and Verify/Commit/MarkOrphan/FinalizeGc races | Every destination object remains covered by pending/final charge; ConsumedByCommit excludes GC and orphan/collected states exclude Commit |
| `0.145.0` | Restore custody Available/TransferPending/member equations, mapping profiles, transfer identities and publication state/head/chunk relationships from one authenticated checkpoint | Any missing/forked charge, profile, receipt or result preserves conservative capacity and affected unready state |
| `0.146.0` | Fuzz unit mappings, compression/encryption/replication/index factors, encoded sizes, rational ceilings, overflow, backend limits, reservation and publication codecs/CAS retries | Unknown/incomparable/zero-rounded/overflowed/stale material denies before external work or remains charged |
| `0.147.0` | Audit pre-transfer charging, source-versus-destination dimensional conservation, reservation reconciliation and command-owned publication/GC state across adapters | Zero high/critical uncharged-byte, cost-undercharge, unauthorized-refund, receipt-race, GC or restore finding |
| `0.148.0` | Reject legacy transfer without reservation, caller-defined/equal-dimension custody costing and publication state without ConsumedByCommit/Collected or typed transition results | No compatibility shim invents a reservation, mapping, terminal transfer outcome or receipt winner |
| `0.149.0` | External pentest targets transfer-before-reserve, reservation exhaustion/refund forgery, unknown outcome, compression/replication undercharge, rounding overflow, Commit/MarkOrphan CAS, collected receipt replay and GC response loss beside prior attacks | Zero unresolved critical/high findings and no waived precharge, costing, publication-lifecycle or atomicity issue |
| `0.150.0` and `1.0.0` | Demonstrate every external custody byte is continuously covered by TransferPending or a final member and every committed archive chunk is permanently excluded from GC | No production claim until cross-backend conservation/crash proofs and the final exact commit pass independent pentest |

#### Custody replan, profile succession and commit-eligibility refinement

This refinement strengthens the reservation/cost/publication contract above.
It selects independently authorized replanning instead of a fictitious full
abort: Begin may already have committed control-capacity release and admitted
external effects, so returning to the exact predecessor is not generally
possible without unsafe compensation.

| Version | Required context and deliverable | Verification and exit condition |
| --- | --- | --- |
| `0.29.0` | Add monotonic `CustodyReleasePlanV1`/head generations and one durable PreparingOpen/PreparingRevalidationRequired→CommitEligible→Consumed or preparing/CommitEligible→Superseded/Abandoned commit attempt per plan. Begin creates generation 1 in PreparingOpen. Independently authorized Replan requires all old transfer outcomes terminal, fences old Commit grants/receipts, advances the head and creates a new bundle/attempt/reservation set; independently authorized Abandon terminalizes only the attempt and never refunds Begin effects. Reuse the governed backend-storage cost-profile lineage with exact reservation-generation/evaluator dependencies and drain fences. Enforce adapter streaming caps and atomic reservation extension before further bytes. MarkOrphan accepts only Superseded/Abandoned attempts | Reconciled reservations cannot strand ReleasePending. No old reservation is recreated/double-released, no superseded grant or receipt commits, profile drift cannot strand a transfer, no destination finalizes above its current reservation, and a still-possible Commit cannot be orphaned |
| `0.30.0` | Export/import plan heads/generations, attempt dispositions/fences, Replan/Abandon/eligibility results, profile bindings/dependencies/drain fences, retained evaluators, streaming limits and extension history with every receipt/reservation link | Missing, defaulted, forked or downgraded state keeps the destination fenced; import never infers abandonment, current-profile substitution, extension or orphan eligibility |
| `0.140.1` | Freeze Begin/Replan/Abandon/MarkCommitEligible/Commit/MarkOrphan preimages, plan and attempt identities, action grants, profile compatibility/destructive-auth decisions, reservation extension and streaming-limit encodings | Independent review proves cross-generation replay, grant/receipt rebinding, current-head substitution, under-reservation and authorization-loss-as-abandonment impossible |
| `0.140.2` | Freeze plan-head and shared attempt-row CAS, authorization fences, replacement reservation transaction, profile dependency/drain activation transaction, atomic capacity extension and Commit/Abandon/Replan/MarkOrphan ordering | Every backend proves exact retry and one winner within declared bounds; otherwise it refuses the feature |
| `0.140.3` | Freeze distinct Begin, Replan, Abandon, eligibility, Commit, profile-governance, ledger-extension, transfer-adapter and orphan-GC capabilities | No actor can self-authorize replacement/abandonment, lower charges, accept bytes before capacity or collect a commit-eligible receipt |
| `0.140.5` | Retain every plan generation, attempt/fence/result, old grant/receipt disposition, terminal reservation, profile evaluator/dependency, extension and streaming decision | Compaction cannot recreate IDs, erase a fence/dependency/charge, turn temporary authorization loss into abandonment or revive old Commit authority |
| `0.140.6` | Freeze takeover/restore across reconciliation→Replan, profile activation/drain, reservation extension, eligibility and every Commit/Abandon/MarkOrphan race | Failover resumes the same plan/attempt/profile/charge winner and never guesses external outcome, eligibility or orphan status |
| `0.142.0` | RPC exposes typed plan, attempt, profile-generation, extension and receipt status as evidence only | Remote status cannot advance a plan, abandon an attempt, extend capacity, activate a weakening profile, commit or admit GC |
| `0.143.0` | Model Replan/Abandon/Commit/MarkOrphan on the shared attempt row, old/new reservation uniqueness, profile succession with live dependencies and streaming extension races | One terminal attempt winner exists; conservation, liveness and continuously charged destination bytes hold |
| `0.145.0` | Restore the complete plan/attempt/fence chain, pinned evaluator dependencies, reservation/extension states and receipt links from one authenticated checkpoint | Any missing/forked artifact preserves ReleasePending, the conservative charge and unready status |
| `0.146.0` | Fuzz plan generation/version arithmetic, terminal-outcome sets, profile classification/drain, streaming chunk boundaries, extension response loss and attempt/receipt CAS | Overflow, ABA, stale/rebound material, liveness loops and finalization beyond reserved capacity fail closed within hard bounds |
| `0.147.0` | Audit independent Replan/Abandon authority, profile weakening authorization, adapter/ledger separation, orphan eligibility and cross-backend exact-retry parity | Zero high/critical lifecycle, authority, undercharge, liveness, GC, restore or compatibility finding |
| `0.148.0` | Reject legacy encodings without plan generations, attempt dispositions, authorization fences, pinned profile dependencies, streaming caps or extension history | No compatibility shim invents abandonment, follows CurrentHead, recreates reservations or admits orphan GC |
| `0.149.0` | External pentest targets reconciled-reservation stranding, old grant/receipt replay, Replan/Commit races, profile drift/weakening, streaming overflow, extension replay and authorization-expiry orphan attacks | Zero unresolved critical/high findings and no waived lifecycle, conservation, costing, authorization, liveness or GC issue |
| `0.150.0` and `1.0.0` | Demonstrate exact continuity for replan recovery, governed profile succession, streaming precharge and terminal commit eligibility beside every prior custody control | Production remains blocked until every selected backend passes and the final exact commit passes independent pentest |

#### Replan feasibility, unknown-transfer retention and evaluator-distrust refinement

This refinement completes the preceding plan rather than relaxing it. Every
replacement repeats aggregate feasibility, permanently uncertain external
effects stay fully charged under a fenced terminal, cumulative history is
bounded, publication work closes with its attempt, and a compromised pinned
evaluator fails closed.

| Version | Required context and deliverable | Verification and exit condition |
| --- | --- | --- |
| `0.29.0` | Add `CustodyReleaseReplanPreflightV1` proving both replacement and future Commit fit current backend atomic limits while reserving new-bundle plus retained-history/cleanup capacity. Add immutable lineage-wide cumulative budgets and authenticated compaction checkpoints. Add independently authorized Unknown-transfer quarantine that converts the full pending maximum into a permanent member, fences transfer/namespace and permits Replan only with new capacity. Stage/Verify accept only the current PreparingOpen attempt. Bind evaluator binary/corpus digests, readiness manifests, emergency distrust and independently authorized no-undercharge reservation migration | No current plan can be installed without a feasible Commit; Unknown neither refunds nor blocks dependencies forever; repeated Replan cannot grow without bound; terminal attempts create no new publication artifacts; distrusted evaluation cannot accept bytes or commit |
| `0.30.0` | Export/import preflights/capacity reservations, lineage counters/disposition/checkpoints, quarantined unknown-transfer members/fences/evidence, AttemptClosed results, evaluator artifacts/readiness/distrust epochs and migration records | Any missing/defaulted/forked counter, fence, evaluator or exact-history proof leaves the destination fenced and conservatively charged |
| `0.140.1` | Freeze Replan-preflight, cumulative-budget, quarantine, Stage/Verify AttemptClosed, evaluator artifact/distrust and reservation-migration preimages with all exact plan/attempt/profile/ledger bindings | Review proves feasibility bypass, budget reset, Unknown refund, terminal publication, evaluator substitution and charge reduction impossible |
| `0.140.2` | Freeze the full Replan combined lock rank and atomic grant+preflight-capacity+plan-CAS+replacement-reservation bundle; quarantine conversion/fence; budget-exhaustion/checkpoint; Stage/Verify attempt CAS; distrust/migration transactions | Every backend proves one exact winner and declared maximum or refuses; no partially current replacement or uncharged retained artifact exists |
| `0.140.3` | Freeze Replan preflight/budget owner, unknown-transfer quarantine issuer/operator, publisher/verifier, profile distrust authority, node readiness and evaluator-migration operator separation | No actor self-approves resource expansion, permanent retention, evaluator trust or charge migration |
| `0.140.5` | Retain exact cumulative counters, compacted replay/anti-reuse membership, quarantine evidence/member/fence, closed-attempt publication results and evaluator artifact/distrust/migration history under legal hold | Compaction/erasure cannot reset budgets, recreate identity, refund Unknown, revive publication or conceal a distrusted evaluator |
| `0.140.6` | Freeze restore/rolling-upgrade/failover across Replan preflight, budget exhaustion, unknown quarantine, Stage/Verify races, readiness and distrust/migration | Takeover resumes identical capacity, attempt, charge and distrust winners; incomplete evaluator sets remain unready |
| `0.142.0` | RPC carries typed preflight/budget/quarantine/AttemptClosed/readiness/distrust/migration status as evidence only | Remote services cannot reserve replacement capacity, terminalize Unknown, trust/migrate evaluators or reopen publication |
| `0.143.0` | Model full-rank Replan against Commit/Abandon/Stage/Verify, repeated generations to budget exhaustion, quarantine/late evidence and distrust at every streaming/eligibility boundary | No deadlock, infeasible current plan, unbounded history, refunded uncertainty, terminal-attempt artifact or distrusted-evaluator commit is reachable |
| `0.145.0` | Restore the cumulative plan checkpoint/archive, retained obligations, unknown member/fence and exact evaluator artifact/distrust/migration dependency set | Missing history or executable evaluator preserves charge and unready/fenced status without inferred cleanup |
| `0.146.0` | Fuzz backend-limit/preflight and cumulative arithmetic, generation/archive membership, unknown evidence, Stage/Verify races, binary/corpus digests, distrust epochs and no-undercharge migration | Overflow, ABA, replay, downgrade, omitted retained work, late evidence and evaluator confusion fail closed within permanent bounds |
| `0.147.0` | Audit resource accounting, full lock-rank parity, retention/legal-hold evidence, publisher closure, evaluator supply chain/readiness and migration conservation across adapters | Zero high/critical feasibility, availability, retention, resource, evaluator, replay or restore finding |
| `0.148.0` | Reject legacy encodings lacking fresh Replan proof, cumulative budget/checkpoint, unknown-transfer terminal, attempt-closed publication or evaluator digest/readiness/distrust/migration state | No compatibility shim invents capacity, terminal outcome, evaluator trust or exact replay history |
| `0.149.0` | External pentest targets authorized infeasible Replan, retained-artifact exhaustion, endless Unknown, quarantine refund/fence bypass, Replan history amplification, terminal Stage/Verify, evaluator compromise/substitution, readiness downgrade and undercharging migration | Zero unresolved critical/high findings and no waived feasibility, boundedness, conservation, retention, publication or evaluator-trust issue |
| `0.150.0` and `1.0.0` | Demonstrate exact install/upgrade/failover/restore continuity for feasible bounded Replan, permanently charged uncertainty, attempt-closed publication and emergency evaluator distrust/migration | Production remains blocked until all selected backends pass and the unchanged candidate passes independent pentest |

#### Transfer sealing, evaluator-deficit and retained-unknown resolution refinement

This refinement closes the external write boundary and makes compromised
accounting honest even when corrected liability exceeds the historical plan.
It also turns cumulative-budget prose into exhaustive admission charges and
adds governed adjudication without weakening the immutable quarantine record.
Every row below is cumulative with the already selected immutable sealing/
never-completed proof, unclamped EffectiveCharge/DeficitSettlement, complete
destructive-authorization families, exhaustive post-Begin charges, bounded
pre-Begin activation, retained-unknown resolution, restore, compatibility and
pentest obligations. The refinements add missing mappings and successors; they
do not replace or relax those deliverables.

| Version | Required context and deliverable | Verification and exit condition |
| --- | --- | --- |
| `0.29.0` | Preserve all seal, deficit, authorization and budget controls. Add a total remediation action/result matrix: provision→ResumableCommit, delete→VerifiedDeletionAndReplan, migrate→MigratedPlanReadyForReplan, explicit RetainPermanentlyFenced→PermanentlyFencedRetained. Failed/Unknown work retains predecessor/charge; the asynchronous-authority refinement below consumes the execution grant at Begin and preserves a non-reusable admitted attempt. Permanent retention creates a named member containing base+deficit. Split Completed into WithoutResidualCustody/WithResidualCustody and atomically transfer every surviving unknown member plus protected budget/authority/deficit/fence provenance into its own residual obligation and non-borrowable budget under one committed set/root and routing head. Make losing pre-Begin cleanup exact-candidate scoped under a durable winner mapping and non-aliasing settlement identity | No action selects another policy outcome; every retained charge has a member; completed lineages cannot strand or reopen custody work; one residual child cannot settle a sibling; losing cleanup cannot block or release the winner |
| `0.30.0` | Export/import the remediation admitted attempt/action/continuation and permanently fenced member, completed disposition, every residual child/budget/transfer result, membership root/aggregate budget/routing generation, and candidate winner mapping plus exact cleanup settlement alongside every previously required artifact | Missing/defaulted/forked mapping, member, residual child/root/route or candidate proof preserves predecessor charge, completed fence and losing candidate encumbrance |
| `0.140.1` | Freeze remediation action/result/attempt and permanent-member encodings, completed/residual disposition and transfer preimages, and candidate/winner/cleanup identity domains in addition to prior frozen formats | Review proves fall-through retention, unrepresented capacity, post-completion budget ambiguity, winner/loser alias and global-cleanup deadlock impossible |
| `0.140.2` | Freeze action-specific success CAS, base+deficit→permanently-fenced-member transaction, final-Commit residual children/set/budget/routing/disposition CAS, routed residual command matrix and candidate-scoped cleanup/winner recheck | Every backend proves one exact policy/member/child set/route/candidate winner atomically within limits or refuses |
| `0.140.3` | Freeze distinct provision/delete/migrate/permanent-retention authority and SoD, residual router/child resolver/aggregate checkpoint owner, completed-lineage proof owner, candidate cleanup owner and winner activator separation | No failed operator self-selects retention, completed lineage borrows work, residual child settles a sibling, or cleanup actor releases winning capacity |
| `0.140.5` | Retain action/attempt/result/member history, every residual child budget/authority/deficit/fence provenance, membership/aggregate/routing history and candidate winner/cleanup settlement ancestry | Compaction cannot remap an action, orphan a retained charge, merge residual children, erase routing authority or make a loser resemble the winner |
| `0.140.6` | Freeze response-loss/failover/restore for failed/Unknown remediation, permanent-member settlement, With/WithoutResidual selection, mixed child operations, routing races and many-candidate cleanup | Unknown retains its admitted attempt/predecessor; completed residual children restore independently under one owner; every loser remains distinguishable from the winner |
| `0.142.0` | RPC exposes typed mapped continuation/admitted attempt, permanent member, completed disposition, residual child/set/aggregate/routing evidence and candidate winner/cleanup evidence only | Remote status cannot choose retention, mutate a completed lineage, spend a sibling budget, select an owner or release candidate capacity |
| `0.143.0` | Model every action against every continuation/failure, final Commit with zero/one/max residual members, post-completion operations, plan compaction and many-candidate winner/cleanup races | No action substitution, capacity sink, residual dead end/reset, forbidden completed command or winner release is reachable |
| `0.145.0` | Restore named permanent members, every exact residual child transfer/budget/authorization/deficit/fence provenance, membership root/aggregate/routing owner and candidate winner plus all cleanup settlements independently of compacted plan rows | Missing relationship retains the larger charge, every residual fence and candidate encumbrance; no child, owner, winner or cleanup is inferred |
| `0.146.0` | Fuzz action/continuation discriminants, remediation attempt states, member/child/aggregate arithmetic, routing generations, completed command matrix, winner mapping and activation/cleanup identity domains | Fall-through, enum confusion, omission/double count, sibling budget borrowing, owner alias, ABA and cross-candidate cleanup fail closed |
| `0.147.0` | Audit action-specific authority, permanent custody representation, per-child/aggregate lifetime budgeting and restore, routing coverage, completed-lineage closure and candidate-scoped cleanup alongside all prior controls | Zero high/critical policy, conservation, custody, resource, authority, lifecycle, routing, restore or parity finding |
| `0.148.0` | Reject legacy encodings without total remediation mapping/admitted attempt/member, explicit completed disposition, residual child set/root/aggregate/routing transfer and candidate winner mapping | No compatibility shim invents a continuation, retained member, residual child/budget/owner or candidate ownership |
| `0.149.0` | External pentest targets action/result substitution, response-loss redispatch, failure→retention fall-through, permanently fenced capacity omission, post-completion budget bypass/exhaustion, sibling settlement, residual routing/compaction loss, many-candidate cleanup deadlock and winner release | Zero unresolved critical/high findings and no waived policy totality, conservation, boundedness, custody, authority or ownership issue |
| `0.150.0` and `1.0.0` | Demonstrate continuity for the total remediation matrix, named permanent member, exact With/WithoutResidual completion, independently resolving residual children and one linearizable owner, plus arbitrary losing-candidate cleanup without winner impact, while retaining all earlier seal/deficit/authorization guarantees | Production remains blocked until selected backends pass, residual children/set/route survive full lifecycle/restore and the unchanged commit passes independent pentest |

#### Asynchronous remediation and residual routing refinement

This refinement is cumulative with every requirement above. It closes the
authority lifetime across asynchronous effects, makes residual custody
member-scoped and defines one linearizable ownership route during final Commit.

| Version | Required context and deliverable | Verification and exit condition |
| --- | --- | --- |
| `0.29.0` | Split remediation into Begin and Complete. Begin consumes execution authority and atomically creates the exact effect ID/request/capacity/target/capability attempt before dispatch; Complete only reconciles that effect into the mapped continuation. Unknown retains the admitted attempt/charge without reusable grant or redispatch; definite no-effect needs a fresh grant. Deletion release and permanent retention consume a separate complete finalization family. Create one residual obligation/budget per surviving member, plus sorted membership root and aggregate terminalization budget. Add LineageOwned/ResidualOwned generationed routing head; final Commit CASes it with child creation/budget transfer/completed disposition, and destination authorization/resolution/checkpoint/GC operations route by it | Authority survives response loss/revocation; mixed residual outcomes are independent; no operation is omitted, double-charged or split across owners |
| `0.30.0` | Export/import Begin/Complete results, admitted effect/capability evidence, finalization authorization lifecycle, per-member residual children/budget/results, membership root/aggregate budget and routing generations with every owner-specific row/sequence/inbox/charge | Missing or forked effect authority, child membership or route preserves admitted charge and rejects readiness |
| `0.140.1` | Freeze Begin/Complete/effect/finalization preimages and state algebra; child obligation/membership/aggregate encodings; routing-head owner/root/generation and owner-domain identities | Review proves redispatch, lost historical authority, sibling mutation, ambiguous root and dual ownership impossible |
| `0.140.2` | Freeze Begin grant-consumption+attempt transaction, dispatch gate, Complete reconciliation/finalization CAS, final-Commit child/root/budget/routing/disposition transaction and routed destination operations | Each backend proves one exact execution, continuation, child and owner winner atomically or refuses |
| `0.140.3` | Freeze execution issuer/admitter/dispatcher/completer/finalizer separation and residual lineage owner/router/child resolver/aggregate checkpoint roles | No dispatcher self-authorizes, completer chooses policy, or lineage/residual actor owns both sides of routing |
| `0.140.5` | Retain admitted effect/request/capability evidence, completion/finalization history, every child result/budget, membership predecessor/root, aggregate counters and routing generations/owner-specific tombstones | Compaction cannot erase asynchronous authority, merge children or duplicate/move authorization ownership |
| `0.140.6` | Freeze crash/failover/restore across dispatch/response loss/revocation, mixed child resolution, final routing CAS and owner-rerouted admission/revocation/checkpoint/GC | Unknown effects stay admitted; CAS losers reroute once; split ownership refuses readiness |
| `0.142.0` | RPC exposes typed admitted-effect/completion/finalization, per-child residual status/membership proof/aggregate budget and routing owner/generation evidence only | RPC cannot dispatch, redispatch, finalize policy, close siblings or select an owner |
| `0.143.0` | Model Begin vs expiry/revocation, dispatch/Complete at every crash point, zero/one/max children with mixed outcomes and final Commit against Admit/Expire/Apply/Resolve/checkpoint/GC/compaction | No orphan authority, duplicate effect, sibling settlement, omitted/double charge or dual-owner row is reachable |
| `0.145.0` | Restore exact admitted-effect and finalization state plus every child/root/aggregate/routing generation independently of compacted lineage plans | Missing child/root or owner mismatch retains all charges/fences and makes the node unready |
| `0.146.0` | Fuzz effect/request/target/capability bindings, Begin/Complete discriminants, finalization sequences, child IDs/digests/root/proofs, counters and routing generations/owner domains | Substitution, replay, redispatch, overflow, sibling alias, ABA and cross-owner duplication fail closed |
| `0.147.0` | Audit asynchronous authority durability, constrained dispatch, fresh destructive finalization, per-member/aggregate conservation and routing coverage for every destination command | Zero high/critical authority, effect, custody, accounting, lifecycle, restore or routing finding |
| `0.148.0` | Reject legacy encodings without admitted execution authority, completion/finalization history, per-member residual set/root/aggregate and routing head | No compatibility shim invents effect authority, child membership, budget or owner |
| `0.149.0` | External pentest targets response-loss+revocation, redispatch, stale capability, completion policy substitution, finalization bypass, mixed-child closure/budget theft and final-Commit routing races/dual ownership | Zero unresolved critical/high findings and no waived authority survival, single effect, child isolation, conservation or ownership issue |
| `0.150.0` and `1.0.0` | Demonstrate full continuity for admitted async remediation, exact mapped completion/fresh finalization, arbitrary mixed residual children and linearizable lineage→residual routing while retaining all prior guarantees | Production remains blocked until selected providers/backends pass and the unchanged candidate passes independent pentest |

#### Dispatch cut, immutable residual membership and routing genesis refinement

This refinement preserves every earlier requirement while closing the remaining
pre-provider policy window, separating immutable membership from mutable child
state and defining routing ownership from its first durable row.

| Version | Required context and deliverable | Verification and exit condition |
| --- | --- | --- |
| `0.29.0` | Insert broker-owned Dispatch between Begin and Complete. Dispatch is the legal/policy cut: it locks routing/state-head/attempt-set/attempt state, rechecks current hold, retention, policy, distrust, namespace fence, provider credential and owner epochs, atomically redeems one non-exportable capability and moves ExecutionAdmitted→EffectDispatched before the broker call. Drift closes definitely-no-effect without traffic; any post-CAS uncertainty becomes Unknown. Define each residual obligation and transfer result as immutable root inputs; put mutable child disposition/budget and aggregate counters in separately versioned CAS rows with an atomic settlement/checkpoint lock rank. Winning custody-release Begin atomically creates routing generation 1 LineageOwned with exact plan/budget identity and empty root; absence is never ownership | No stale policy deletion, double worker redemption, mutable-root drift, lost sibling decrement or inferred routing owner is possible |
| `0.30.0` | Export/import Dispatch result, broker capability/redemption and EffectDispatched/Unknown history; immutable descriptor/transfer root plus child state, child budget state, settlement and aggregate state generations; and the exact routing-genesis Begin binding | Missing/forked dispatch redemption, mutable-state ancestry, aggregate equation or routing genesis preserves all charges/fences and rejects readiness |
| `0.140.1` | Freeze Dispatch request/result/capability/redemption/state preimages and provider idempotency/query contract; immutable membership descriptor domain; mutable child/budget/aggregate state encodings; routing-genesis identity and canonical-empty root | Review proves policy-cut ambiguity, mutable digest inclusion, counter race and absence-as-LineageOwned impossible |
| `0.140.2` | Freeze broker redemption+EffectDispatched CAS, no-dispatch drift transition, same-effect reconciliation, child terminalization transaction/lock order and winning-Begin routing-genesis creation; Replan checks but never recreates or resets routing | Each backend/broker proves one call right, one child settlement/decrement and one durable routing genesis atomically or refuses |
| `0.140.3` | Freeze worker/broker/provider-reconciler/finalizer separation plus immutable-descriptor owner, child resolver, aggregate-state owner, routing-genesis creator and Replan roles | Workers cannot hold provider credentials, resolver cannot mutate membership, and Replan cannot mint or replace ownership |
| `0.140.5` | Retain policy/hold/credential/distrust/routing epochs and broker redemption; immutable membership root; all child-state/budget/settlement and aggregate predecessor generations; routing genesis and later owner transitions | Compaction cannot erase the dispatch cut, make a mutable root stale, lose a decrement or manufacture initial ownership |
| `0.140.6` | Freeze crash/failover/restore at redemption/CAS/provider-call boundaries, simultaneous sibling terminalization and competing Begin/Replan/genesis operations | Post-dispatch ambiguity stays Unknown; sibling CAS retries preserve totals; missing/duplicate/rolled-back genesis refuses readiness |
| `0.142.0` | RPC exposes typed Dispatch/redemption evidence, immutable membership proof, versioned child/aggregate state and explicit routing genesis/owner evidence only | RPC cannot redeem capability, choose the policy cut, rewrite the root, decrement aggregate state or infer an absent owner |
| `0.143.0` | Model every hold/policy/credential/distrust/routing transition around Dispatch, worker takeover/redemption and provider response; concurrent mixed-child settlements; zero/one/many competing Begin genesis attempts and Replan/final Commit | No stale-policy external effect, duplicate provider effect, stale root, lost/double decrement, routing recreation or owner gap is reachable |
| `0.145.0` | Restore exact dispatch and provider-effect ancestry, immutable descriptor/transfer membership, every child/budget/settlement/aggregate generation and generation-1 routing Begin binding independently of compacted plan rows | Any missing/forked predecessor, aggregate mismatch or inferred/duplicated routing genesis retains the conservative state and makes the node unready |
| `0.146.0` | Fuzz dispatch epochs, effect/idempotency/capability/redemption bindings, state discriminants, immutable-vs-mutable digest domains, child/aggregate CAS generations and routing-genesis identity | Stale credential use, capability reuse, root contamination, counter underflow/ABA and genesis alias/replay fail closed |
| `0.147.0` | Audit dispatch-time legal/hold enforcement, broker exclusivity/provider guarantees, immutable membership and mutable-state conservation, child lock ordering and routing-genesis lifecycle | Zero high/critical authority, destructive-effect, custody, accounting, concurrency, restore or ownership finding |
| `0.148.0` | Reject legacy encodings without Dispatch/redemption evidence, immutable descriptor-root domain, separate child/budget/aggregate state generations or explicit routing genesis | No compatibility shim assumes a policy cut, removes Unknown, hashes mutable rows into the fixed root or treats absence as LineageOwned |
| `0.149.0` | External pentest targets hold activation after Begin, credential rotation, broker takeover/capability replay, forbidden application resend, mutable-root confusion, sibling terminalization races and missing/duplicate/rollback routing genesis | Zero unresolved critical/high findings and no waived current-policy cut, single-effect, immutable-membership, atomic-counter or explicit-owner issue |
| `0.150.0` and `1.0.0` | Demonstrate continuity for dispatch-fenced destructive effects, immutable residual membership with atomic mutable child/aggregate evolution and explicit routing genesis through every supported provider/backend/restore path | Production remains blocked until the unchanged candidate passes provider fault campaigns, backend parity and independent pentest |

#### Residual anti-rollback, effect-drain and provider-conformance refinement

This refinement is cumulative. It anchors mutable residual state, closes final
Commit over provider work, makes empty aggregate state explicit and turns
provider effect guarantees into tested governed capability.

| Version | Required context and deliverable | Verification and exit condition |
| --- | --- | --- |
| `0.29.0` | Add a predecessor-linked ResidualCustodyStateHead committing routing/membership, every child state/budget-state, latest settlement/checkpoint, aggregate reference/state and integrity epochs; child settlement advances it atomically and signed checkpoints bind an external high-watermark. Add a complete remediation-attempt-set head/root advanced by every covered writer. MarkEligible and Commit are no-write for ExecutionAdmitted, EffectDispatched, Unknown, live capability or pending reconciliation, and CommitEligible fences new Begin/Dispatch. Define AggregateReference=NoneCanonicalEmpty at routing genesis and zero-survivor final Commit, with authenticated empty state heads and no aggregate row. Govern provider effect-conformance profiles/results and authenticated definitely-no-effect evidence | Coordinated residual rollback, Commit-over-effect, absent aggregate inference and unsupported provider semantics are impossible |
| `0.30.0` | Export/import the state-head/checkpoint chain and external high-watermark; exact complete attempt-set head/root and effect history; aggregate-reference tag/empty head; provider profile/result/no-effect evidence | Missing/forked state ancestry, nonterminal effect, implicit empty state or unproved provider capability preserves all charges/fences and rejects readiness |
| `0.140.1` | Freeze state-head/root/checkpoint/high-watermark preimages, complete attempt-set commitment domain, terminal-state predicate, aggregate tagged union/empty vectors and provider conformance profile/evidence schema | Review proves rollback hiding, partial attempt enumeration, row-absence inference and self-asserted provider capability impossible |
| `0.140.2` | Freeze child+aggregate+state-head atomic transition, every covered attempt-set writer advance, MarkEligible effect fence, final-Commit root recheck, empty Commit representation and provider adapter conformance gate | Each backend/provider commits one continuous head/effect set/empty representation atomically or refuses |
| `0.140.3` | Freeze residual state-head/checkpoint/anchor owner, attempt-set owner, eligibility finalizer and provider-profile governor/conformance-runner separation | Resolver cannot rewrite its anchor, dispatcher cannot certify its provider, and finalizer cannot omit attempts |
| `0.140.5` | Retain state-head/checkpoint/external-anchor ancestry, complete attempt/capability/redemption/reconciliation set, explicit None tags and provider conformance/evidence generations | Compaction cannot conceal rollback, erase effect work, infer an aggregate or outlive a provider guarantee |
| `0.140.6` | Freeze failover/restore across child/head/checkpoint publication, MarkEligible/Commit around redemption/response loss, empty genesis/final Commit and provider query/dedup horizon transitions | Stale nodes and missing anchors are unready; uncertain effects block Commit; empty state and provider behavior restore exactly |
| `0.142.0` | RPC exposes authenticated residual-state head/proof/high-watermark, complete attempt-set status, aggregate tag and provider profile/result evidence only | RPC cannot advance anchors, hide attempts, invent empty state, certify providers or override no-write |
| `0.143.0` | Model coordinated child+aggregate rollback, sibling/head races, Commit immediately before/after every effect transition, zero-survivor representation and provider transmission/query/timeout/rotation/late-duplicate behavior | No rollback-equivalent state, effect escape, absent aggregate or duplicate/unknowable provider effect reaches Released |
| `0.145.0` | Restore continuous local state head at or beyond greatest authenticated external high-watermark, exact terminal attempt set, explicit aggregate tag and current passing provider profile independently of compacted plan rows | Missing/forked/rolled-back anchor, attempt, tag or provider evidence retains the conservative state and makes the node unready |
| `0.146.0` | Fuzz state-head predecessor/root/epoch/checkpoint fields, attempt-set completeness/state/capability bindings, aggregate tags and provider profile/result/no-effect evidence | Coordinated rollback, omission, ABA, tag confusion, forged no-effect and horizon overflow fail closed |
| `0.147.0` | Audit residual anti-rollback anchoring, effect-drain closure, empty aggregate representation and provider conformance governance/suite coverage | Zero high/critical integrity, external-effect, custody, lifecycle, restore or provider-capability finding |
| `0.148.0` | Reject legacy encodings without state-head/high-watermark ancestry, complete attempt-set root, explicit aggregate tag or governed provider profile/result | No shim infers current child state, terminal effects, empty aggregate or provider guarantees |
| `0.149.0` | External pentest targets coordinated state rollback/deletion, stale external anchor, Commit around dispatch redemption/Unknown, hidden attempts, absent aggregate confusion, dedup-horizon expiry, late duplicate and forged definitely-no-effect evidence | Zero unresolved critical/high findings and no waived anti-rollback, effect-drain, explicit-state or provider-conformance issue |
| `0.150.0` and `1.0.0` | Demonstrate continuous anchored residual state, terminal complete effect sets, explicit empty/nonempty aggregate representations and passing provider effect profiles through all backend/provider/HA/restore paths | Production remains blocked until the unchanged candidate passes fault campaigns and independent pentest |

#### Attempt-set writer, eligibility revalidation and single-claim refinement

This refinement is cumulative. It closes every attempt-set mutation path,
preserves restrictive processing after eligibility and removes ambiguity
between application resend and transport retransmission.

| Version | Required context and deliverable | Verification and exit condition |
| --- | --- | --- |
| `0.29.0` | Add the closed attempt-set writer matrix for execution/finalization authorization, Begin/Dispatch/Complete/reconciliation, capability lifecycle, provider evidence and checkpoint/compaction/archive. Every mutation follows routing→state-head→counter-capacity-state→attempt-set→attempt→auxiliary→result order, consumes one typed immutable writer charge and atomically advances the head. A covered mutation against CommitEligible writes an exact invalidation and selects PreparingRevalidationRequired; every later covered mutation CAS-advances its non-wrapping lineage and immutable cumulative evidence. PreparingOpen alone admits new effect/artifact work and the retained fence is integrity evidence. MarkEligible verifies the latest root and repeats full validation. Dispatch persists one unique application-level transmission claim; after return/crash/lease loss/uncertainty only query reconciliation is permitted | No uncharged/unrooted writer, class substitution, lock inversion, blocked restrictive processing, stranded revalidation root, preparing-mode confusion, reopened admission, stale-eligibility Commit trap or application resend is reachable |
| `0.30.0` | Export/import every attempt-set mutation predecessor/successor, typed preparation mode, eligibility invalidation/fence, one transmission claim and terminal claim evidence with authorization/evidence/checkpoint/archive history | Restore never accepts an unrooted mutation, missing mode payload, stale eligible result, reopened effect lane or second provider invocation |
| `0.140.1` | Freeze writer-class enumeration, mutation/root/invalidation/fence preimages and the transmission-claim identity/deadline/terminal encoding | Review proves omitted writers, ambiguous invalidation, application resend and root substitution impossible |
| `0.140.2` | Freeze the common writer lock/CAS transaction, Commit-versus-invalidation race, full MarkEligible revalidation and Dispatch redemption+claim+EffectDispatched+head transaction | Each backend commits the complete mutation/root/eligibility or dispatch/claim bundle atomically or refuses |
| `0.140.3` | Freeze attempt-set owner, authorization applier, evidence admitter, checkpoint/archiver, eligibility validator, dispatcher and transmission executor separation | A row writer cannot omit its head, a finalizer cannot suppress revocation, and a worker cannot claim or resend |
| `0.140.5` | Retain mutation ancestry, invalidation/revalidation results, evidence fences, claim/redemption/terminal evidence and authenticated archival replacements | Compaction cannot erase a writer, revive eligibility, reopen dispatch or recreate a send right |
| `0.140.6` | Freeze failover across every writer lock/CAS, CommitEligible invalidation/revalidation and claim-before-call/call/return/timeout/crash/takeover boundaries | Recovery joins one stored mutation/claim; uncertainty is query-only and restrictive work remains live |
| `0.142.0` | RPC exposes typed current attempt-set head, mutation/invalidation status, sticky fence and transmission-claim status as evidence only | RPC cannot mutate the root, refresh eligibility, clear the fence, claim transmission or authorize resend |
| `0.143.0` | Model every writer against MarkEligible/Commit plus dispatch claim against timeout, partition, lease loss, worker crash and takeover | No stale-root Commit, lock cycle, blocked revocation, reopened dispatch or second application invocation is reachable |
| `0.145.0` | Restore a continuous attempt-set mutation chain, latest eligibility/invalidation/fence state and exactly one claim disposition independently of hot rows | Missing/forked writer, stale eligibility, missing fence or uncertain claim keeps ReleasePending/unready |
| `0.146.0` | Fuzz writer discriminants/order, predecessor/successor roots, changed-row sets, invalidation bindings, fence persistence and claim deadlines/terminal states | Omission, ABA, partial atomicity, stale eligibility, fence clearing and resend fail closed |
| `0.147.0` | Audit writer completeness, lock-order conformance, restrictive mutation liveness, full revalidation and executor single-claim enforcement | Zero high/critical lifecycle, authority, deadlock, liveness or duplicate-effect finding |
| `0.148.0` | Reject legacy encodings without a closed writer class/mutation chain, eligibility invalidation/sticky fence or unique transmission claim | No compatibility shim infers root coverage, preserves stale eligibility or converts deduplication into resend authority |
| `0.149.0` | External pentest targets hidden authorization/evidence writers, lock inversion, CommitEligible revocation/checkpoint/compaction races, stale-root Commit, claim replay and crash/takeover resend | Zero unresolved critical/high findings and no waived writer-completeness, restrictive-liveness or single-send issue |
| `0.150.0` and `1.0.0` | Demonstrate closed attempt mutation ancestry, repeatable full eligibility validation and exactly one application provider invocation across all backends/providers/HA/restore paths | Production remains blocked until the unchanged candidate passes concurrency/fault campaigns and independent pentest |

#### Structural preparing-state and invariant-realization refinement

This refinement is cumulative. It makes revalidation denial structural in the
authoritative attempt row and reuses the platform transmission-start invariant
without turning durable status into bearer authority.

| Version | Required context and deliverable | Verification and exit condition |
| --- | --- | --- |
| `0.29.0` | Replace ambiguous Preparing with tagged PreparingOpen and PreparingRevalidationRequired carrying the mandatory initial invalidation plus the non-wrapping revalidation lineage defined below. Begin/Replan creates Open; invalidation selects Required atomically; only Open admits Begin/Dispatch/Stage/Verify. Retain the fence as integrity evidence only. Declare ProviderEffectTransmissionClaim a VIT-INV-006 realization: only the winning trusted-executor transaction receives one unreconstructable process-local permit, exact retry returns status only, response loss cannot reconstruct it and durable claim/digest is non-bearer | Missing joins/fences cannot widen authority, repeated mutations cannot strand revalidation, and the specialized effect has exactly the platform claim semantics |
| `0.30.0` | Export/import the preparation discriminant/payload, invalidation/fence cross-proof and VIT-INV-006 claim/status/consumed-or-unknown evidence without permit material | Missing/unknown mode, incomplete payload, fence mismatch or reconstructable permit rejects import/readiness |
| `0.140.1` | Freeze disposition tags, mandatory revalidation payload/preimages, invalidation/fence domains and specialized claim-to-VIT-INV-006 mapping | Review proves default-to-open, optional payload, adjacent-row authority and durable-bearer interpretation impossible |
| `0.140.2` | Freeze CommitEligible→PreparingRevalidationRequired+head+invalidation/fence CAS, full revalidation transition and trusted-executor claim/permit handoff | Each backend commits one structural denial and each executor exposes a permit to one winning process only |
| `0.140.3` | Freeze attempt-state owner/evidence-fence owner/eligibility-validator and claim-state owner/executor/worker separation | Evidence cannot widen attempt authority, and status readers cannot invoke the provider |
| `0.140.5` | Retain every mode transition/payload/invalidation/fence and claim/status/consumption/unknown artifact while never persisting permit material | Compaction cannot erase structural denial, default a mode or recreate provider authority |
| `0.140.6` | Freeze failover/restore at invalidation row/fence loss, mode decode, revalidation, claim commit, permit return, response loss, crash and takeover | Missing evidence stays denied/unready; claim uncertainty stays consumed-or-Unknown without another permit |
| `0.142.0` | RPC exposes typed preparation state and non-bearer claim status only; Required payload is complete or the response is a typed corruption denial | RPC cannot omit the mode, clear denial, return permit material or treat a digest as authority |
| `0.143.0` | Model delete/omit/substitute invalidation/fence with every mode and race mode transition against Begin/Dispatch/Stage/Verify/MarkEligible/Commit; model exact claim retry/response loss/takeover | PreparingRevalidationRequired never behaves as Open and no path obtains two permits |
| `0.145.0` | Restore exact mode/payload/invalidation/fence consistency and VIT-INV-006 greatest claim high-watermark independently of hot evidence | Partial restore is unready and never falls back to Open or reconstructs a permit |
| `0.146.0` | Fuzz preparation discriminants/payload lengths/root bindings/default codecs and claim/digest/permit/status confusion | Unknown/truncated/omitted state and transported durable claim/digest fail closed |
| `0.147.0` | Audit structural authorization derivation, evidence-only fence use and exact VIT-INV-006 enforcement/traceability | Zero high/critical mode-confusion, authority-widening or transmission-permit finding |
| `0.148.0` | Reject legacy ambiguous Preparing encodings and specialized claims lacking explicit VIT-INV-006 realization metadata | No shim infers Open, synthesizes Required payload or treats persistent status as bearer |
| `0.149.0` | External pentest targets missing join/fence, corrupt/default enum decoding, stale Required roots, revalidation bypass, durable-claim replay and post-response-loss permit recovery | Zero unresolved critical/high findings and no waived structural-state or non-bearer-claim issue |
| `0.150.0` and `1.0.0` | Demonstrate structural preparation authorization and one unreconstructable VIT-INV-006 permit across every backend/provider/RPC/HA/restore path | Production remains blocked until the unchanged candidate passes codec/fault campaigns and independent pentest |

#### Repeated revalidation-advance refinement

This cumulative refinement preserves the structural denial above while making
every later restrictive mutation revalidatable. Original invalidation evidence
is immutable; successor writers append a provable lineage rather than
overwriting its target root.

| Version | Required context and deliverable | Verification and exit condition |
| --- | --- | --- |
| `0.29.0` | Add Required→Required CAS advances with checked non-wrapping `u128` revalidation epoch/sequence, original invalidation and eligibility-result/root, previous/current required roots, latest attempt-set mutation and a domain-separated cumulative commitment. Append immutable RevalidationAdvance records and continuous-prefix checkpoints; exact retry joins. The counter-capacity refinement below proves every admitted lifetime advance and rollover fits | Sequential/concurrent mutations always leave one provable terminal root; no evidence overwrite, sequence wrap or authority reopening is possible |
| `0.30.0` | Export/import the original invalidation, complete ordered advance lineage, checkpoint coverage and rollover without inferring omitted members | Missing, reordered, duplicated, forked, rolled-back or partially covered advance evidence rejects import/readiness |
| `0.140.1` | Freeze advance/checkpoint tags, `u128` epoch/sequence domains, original/previous/current root preimages, mutation IDs, cumulative commitment and rollover semantics | Review proves root overwrite, ABA, chain splicing, wrap and checkpoint reset impossible |
| `0.140.2` | Freeze CommitEligible→Required initialization, Required→Required writer CAS, exact response-loss replay and MarkEligible chain/checkpoint verification under the common lock order | Each backend commits mutation+head+payload+advance atomically and validates only the locked terminal root |
| `0.140.3` | Freeze attempt-state owner, covered writer, advance/checkpoint owner, eligibility validator and counter-proof owner separation | No writer can self-validate, omit its advance, rewrite original invalidation or choose its lifetime count |
| `0.140.5` | Retain original invalidation, every uncovered advance, checkpoint predecessor/coverage/terminal commitment and rollover evidence | Compaction cannot erase a mutation, reset the clock or convert an incomplete chain into readiness |
| `0.140.6` | Freeze failover/restore at every payload/head/advance/checkpoint CAS and during sequence rollover, response loss and concurrency | Recovery joins one greatest continuous lineage; uncertainty remains Required/unready for every admitted operation |
| `0.142.0` | RPC exposes typed epoch/sequence, original invalidation, terminal root/commitment and checkpoint/coverage status as non-authoritative evidence | RPC cannot omit a gap, reorder a chain, reset an epoch, advance state or authorize revalidation |
| `0.143.0` | Model sequential/concurrent revocation, evidence, reconciliation, checkpoint and archive writers before revalidation; then revalidate and independently invalidate again | One CAS order wins, all losers reapply, the final root revalidates and the later invalidation uses a strictly newer epoch |
| `0.145.0` | Restore the greatest authenticated checkpoint plus exact uncovered suffix independently of hot rows and reject rollback below its terminal commitment | Missing/forked history, stale checkpoint or payload/head mismatch stays denied and never strands a falsely valid result |
| `0.146.0` | Fuzz epoch/sequence boundaries below the reserved sentinel, roots, mutation IDs, cumulative commitments, record order/duplication/omission and checkpoint coverage | Wrap, ABA, splice, truncation, replay and default decoding fail closed for every admitted mutation |
| `0.147.0` | Audit repeated-writer completeness, capacity-proof use, checkpoint soundness, failover liveness and MarkEligible terminal-root proof | Zero high/critical integrity, stale-eligibility or restrictive-liveness finding |
| `0.148.0` | Reject legacy Required encodings without the lineage payload and migrations that cannot prove a continuous original-invalidation-to-current-root chain | No shim overwrites the root, fabricates an advance/checkpoint or infers continuity |
| `0.149.0` | External pentest targets concurrent/reordered advances, lost responses, omitted records, checkpoint forgery/rollback, epoch reuse, sentinel collision and invalidate-after-revalidate | Zero unresolved critical/high findings and no waived lineage-integrity, latest-root or restrictive-liveness issue |
| `0.150.0` and `1.0.0` | Demonstrate continuous revalidation lineage and latest-root full validation across every backend/RPC/HA/restore/compaction path under repeated mutations | Production remains blocked until the unchanged candidate passes concurrency, boundary, fault and independent pentest campaigns |

#### Counter-capacity proof and exhaustion-fence refinement

This cumulative refinement makes the finite identity model honest. Exhaustion
is rejected at admission for valid work; the reserved terminal sentinel can
only close a corrupt or unexpectedly exhausted owner and never names the
mutation that could not be represented.

| Version | Required context and deliverable | Verification and exit condition |
| --- | --- | --- |
| `0.29.0` | Fix attempt-set-head sequence, revalidation epoch/sequence and capacity-state version to checked `u128`. Add RevalidationCounterCapacityProof to Begin/Replan preflight, derived from immutable plan budgets and maximum lifetime counts of every authorization, evidence, reconciliation, checkpoint, compaction, rollover, response-loss, Replan and terminalization writer. Prove every domain's worst-case terminal ordinary value remains at most `u128::MAX - 1`, reserving `u128::MAX` exclusively for CounterExhaustionFence. Enforce the proof mechanically through the class-bucketed capacity state below. Reject overflow, unbounded class or insufficient headroom before plan installation, reservation or external work | Every admitted lineage can name and charge all possible writers; ordinary state never uses a sentinel and no post-exhaustion mutation is promised |
| `0.30.0` | Export/import exact counter widths/current values, lifetime-count derivation/proof, remaining headroom, reserved sentinel and authentic exhaustion fence/result | Missing proof, arithmetic mismatch, ordinary sentinel use or unauthenticated terminal state rejects import/readiness |
| `0.140.1` | Freeze counter domains, ordinary/sentinel ranges, writer-class maxima, checked sum/headroom formula, proof digest and fence preimage | Review proves truncation, saturation, wrap, caller-chosen count and cross-domain confusion impossible |
| `0.140.2` | Freeze Begin/Replan proof transaction, per-writer proof/count/headroom recheck and last-ordinary→sentinel fence CAS with result/audit/outbox | Each backend either admits complete lifetime capacity, installs exactly one absorbing fence instead of the mutation, or writes nothing |
| `0.140.3` | Freeze plan-budget owner, proof calculator, attempt-set owner, revalidation owner, import validator and fence observer separation | A writer cannot inflate capacity, choose maxima, consume the sentinel ordinarily or clear its own fence |
| `0.140.5` | Retain proof inputs/result, writer-count charges, last ordinary counters and terminal fence/result forever or behind authenticated exact coverage | Compaction cannot create headroom, erase exhaustion or convert the sentinel into an ordinary identity |
| `0.140.6` | Freeze failover/restore at last ordinary attempt-set sequence, last revalidation sequence/rollover and fence commit/response-loss boundaries | Recovery returns the exact proof/fence result; it never repeats the mutation, invents an advance or fabricates a retroactive fence |
| `0.142.0` | RPC exposes proof status, remaining admitted counts and absorbing fence/result as read-only evidence; sentinel state is typed separately from ordinary counters | RPC cannot supply maxima, widen headroom, clear the fence or represent a post-sentinel command |
| `0.143.0` | Model last ordinary sequence, last rollover, separate/simultaneous attempt-set and revalidation exhaustion, proof drift and fence-versus-writer races | Only admitted ordinary successor or one terminal fence wins; all effect and Commit paths deny after the fence |
| `0.145.0` | Restore the proof and greatest authenticated ordinary/fence state, rejecting raw numeric maximum, missing fence or sentinel reuse | Terminal sentinel restores permanently unready and malformed exhausted state remains corruption |
| `0.146.0` | Fuzz every lifetime maximum and arithmetic operator, counter widths/endian encoding, last values, rollover, sentinel tag/domain and proof/fence digests | Overflow, undercount, off-by-one, saturation, truncation and cross-counter substitution fail closed before external work |
| `0.147.0` | Audit writer enumeration, proof arithmetic, budget-to-count derivation, sentinel exclusivity, fence absorption and all-path denial | Zero high/critical capacity, wrap, external-effect or invented-mutation finding |
| `0.148.0` | Reject legacy encodings without fixed widths/proof/sentinel reservation and imports that used the terminal value as ordinary state | No shim infers headroom, renumbers history, synthesizes a missing fence or replays the triggering mutation |
| `0.149.0` | External pentest targets proof overflow/undercount, last sequence/rollover, response loss, cross-counter mismatch, fence forgery/omission, restore and post-sentinel dispatch/Commit | Zero unresolved critical/high findings and no waived finite-capacity or terminal-fence issue |
| `0.150.0` and `1.0.0` | Demonstrate admitted lifetime capacity and absorbing exhaustion behavior across every backend/RPC/HA/import/restore/compaction path | Production remains blocked until the unchanged candidate passes arithmetic, boundary, fault and independent pentest campaigns |

#### Writer-charge capacity-state refinement

This cumulative refinement turns the lifetime proof into a mechanically
enforced conservation ledger. Capacity is lineage-wide and survives every plan
generation; a head cannot advance without exactly one typed charge.

| Version | Required context and deliverable | Verification and exit condition |
| --- | --- | --- |
| `0.29.0` | Add lineage-wide RevalidationCounterCapacityState with proof ID/version, plan/lineage, closed writer-class enum including Replan, per-class admitted/consumed/reserved/remaining `u128` counts, total attempt-set-head writes, revalidation advance/rollover subsets, per-domain sentinel reservations, current counter tuple and predecessor-linked state version/digest. Add immutable RevalidationCounterWriterCharge keyed by lineage+class+command/idempotency and carrying prior/successor state/counts/counters, mutation/head and result/audit/outbox. Every head writer locks capacity state before the head and commits one charge+state CAS+mutation+head+result atomically; the reserved-capacity refinement below governs future terminal legs | Per class admitted=consumed+reserved+remaining, total consumed equals head delta, state-version delta equals charges plus terminal bit, typed subsets equal advances/rollovers, active reservations have exact history, exact retry rejoins and CAS losers consume nothing |
| `0.30.0` | Export/import capacity state, proof linkage, every uncovered charge, authenticated compacted charge coverage, per-class totals, genesis/current tuples, sentinel reservation and exact results | Missing/reset state, class/count mismatch, head without charge, charge without mutation/result or non-isomorphic carryover rejects import/readiness |
| `0.140.1` | Freeze writer-class enum, charge identity/domain, state/charge fields, conservation equations, proof/plan bindings and changed-material conflict preimages | Review proves class substitution, aliasing, dense inference, reset, saturation and charge/result rebinding impossible |
| `0.140.2` | Freeze capacity-state-before-head lock order and atomic class decrement, immutable charge, covered mutation, head, result, audit and outbox CAS; freeze sentinel-reservation update outside ordinary buckets | Each backend exposes one indivisible charged head advance or no write; no partial charge/head state is observable |
| `0.140.3` | Freeze capacity-state owner, proof calculator, domain writer, Replan planner, compactor, restore/import validator and result reader separation | No writer chooses its class/bound, no planner resets consumption and no reader or compactor mints capacity |
| `0.140.5` | Retain state predecessor chain, charges/results and per-class/total equations; compact only behind authenticated exact charge coverage preserving replay/conflict and retained old-plan obligations | Compaction cannot refund, coalesce charge identities, hide a class or detach head history from consumption |
| `0.140.6` | Freeze failover at capacity-state CAS, last class charge, head/mutation/result commit and Replan proof/state successor; restore greatest state plus uncovered charges | Response loss returns one stored charge/result, takeover cannot double-decrement and restore never repairs by guessing |
| `0.142.0` | RPC exposes class-specific admitted/consumed/reserved/remaining, total/head equation, reservation/settlement and charge/result lookup, and proof/sentinel status as read-only evidence | RPC cannot choose a writer class, reserve/release/settle, decrement, reset, synthesize a charge or authorize from stale totals |
| `0.143.0` | Model concurrent last-charge consumers, every class substitution, exact retry/CAS loser, Replan carryover and compaction versus writers | One correct-class transaction wins; no over-admission, double charge, free head or liveness loop is reachable |
| `0.145.0` | Restore/migrate greatest predecessor-linked state, checkpointed coverage and uncovered charges, proving class/total/subset/head/counter equations and retained obligations | Any omission, rollback, fork, mismatch or reset leaves the owner unready |
| `0.146.0` | Fuzz class tags, admitted/consumed/reserved/remaining arithmetic, reservation/settlement identities, state versions/digests, charge IDs, request/result bindings, counter tuples and coverage boundaries | Overflow, underflow, substitution, duplicate, omission, double settlement, ABA and head/count mismatch fail closed |
| `0.147.0` | Audit complete writer enumeration, atomic charge coupling, Replan non-reset, compaction exactness, HA replay and conservation equations | Zero high/critical capacity, accounting, replay, lock-order or uncharged-writer finding |
| `0.148.0` | Reject legacy proof-only encodings without authoritative capacity state/charges and migrations unable to prove exact consumption/head equivalence | No shim invents buckets, resets consumption, renumbers charges or infers totals from a head alone |
| `0.149.0` | External pentest targets concurrent last charge, class confusion, response loss, Replan reset, compaction rollback, restore omission and charge/head/result splitting | Zero unresolved critical/high findings and no waived exact-once capacity-ledger issue |
| `0.150.0` and `1.0.0` | Demonstrate one class-correct immutable charge per head advance across every backend/RPC/HA/Replan/import/restore/compaction path | Production remains blocked until the unchanged candidate passes concurrency, accounting, fault and independent pentest campaigns |

#### Capacity-charge checkpoint and archive-replay refinement

This cumulative refinement makes compacted writer charges as authoritative as
hot rows. It specializes the broader plan-lineage checkpoint rather than
replacing it: exact retry, conflict, genuinely-unseen decisions and all
capacity equations remain independently provable after deletion.

| Version | Required context and deliverable | Verification and exit condition |
| --- | --- | --- |
| `0.29.0` | Preserve the generational guard and permanent authority seal, then add one typed BeginAbortDrain completion reservation before its seal permit. It covers sealed-abort disposition, WitnessWon Commit continuity, bounded seal-status admission/terminalization, outputs/work, existing-query drain, typed exhaustion and equivocation. Add an AbortDrainPending-only Recovery-funded seal-status lane with writer-derived attempt IDs, one process-local permit, SealWon/WitnessWon/Unknown/TransportFailure/DeadlineExceeded/ContradictoryEvidence, trusted-time backoff, immutable terminalization reservation and exact-once settlement. Original seal retry is status-only | Exhaust every completion dimension and prove BeginAbortDrain is no-write/no-permit. Lose the seal response, fail over/restore through the same metered lane, prohibit reseal/unmetered I/O, and prove all five route equations, exact `q`/`s` reservation consumption and typed non-aliasing |
| `0.30.0` | Export/import all prior guard/seal artifacts plus abort completion reservation/settlement, seal budget, query attempts/states/outcomes/reservations/settlements, recovery Unready state, typed admission/invocation/reconcile/lost-to-witness/exhaustion/equivocation results and route charge evidence | Import reads authority state first, resumes the same bounded seal-query protocol, proves each route equation and `q`/`s` conservation, and rejects missing/moved escrow, recreated permit, reseal, generic-conflict substitution, unmetered restore result or AbortDrainPending state that cannot complete |
| `0.140.1` | Freeze prior guard/seal schemas plus completion-reservation legs, seal budget/attempt/state/outcome/reservation/settlement/recovery types, every canonical result/conflict, trusted-time preimage, route discriminator and charge-equation variables | Review proves closed outcomes/results, status-only retry, no generic witness-conflict fallback, no branch/encoding ambiguity, no special restore query and exactly one possible co-commit subtraction per route |
| `0.140.2` | Freeze BeginAbortDrain charge+claim+complete escrow+typed result→permit, seal-query admission+reservation→permit, reconcile+reservation-consumption+settlement, route terminalization/exhaustion and final rollover transactions under the common order | Faults expose each bundle all-or-none. Missing any escrow is no-write; `3 + 2q - e`, both `3 + 2q + 2s - e` routes, `4 + 2q + 2s - e` and `3 + 2q + 2s` match heads/charges/results with exact `q`/`s` settlement |
| `0.140.3` | Separate prior owners plus abort-completion reservation owner, seal-status admission executor, seal-query outcome importer/terminalizer, exhaustion writer and recovery driver; the original seal executor cannot act as query executor | No role reseals, self-funds/settles/reassigns escrow, imports generic outcome, selects its route equation, performs restore-only I/O, suppresses contradictory evidence or consumes another attempt's reservation |
| `0.140.5` | Retain prior guard/seal evidence plus completion reservation/terminal settlements, seal budgets/attempts/outcomes/results/conflicts, route charges/equations and recovery state until authenticated archive coverage | Retention cannot forget a consumed/unused route leg, recreate seal/query authority, reclassify WitnessWon/exhaustion/contradiction, release escrow on timeout/Replan/restore or make a route appear to use the normal three-charge equation |
| `0.140.6` | Freeze failover at abort admission/escrow/permit, seal invocation response loss, every seal-query admission/permit/outcome/settlement/backoff/exhaustion, route co-commit, contradictory evidence, Unready restore and rollover | Takeover is status/query-only, preserves all completion/query reservations, uses no special authority I/O, reaches only the same typed route result, and cannot leak concurrency, double-subtract a co-commit or reopen an exhausted/contradictory generation |
| `0.142.0` | RPC exposes read-only completion reservation/settlement, seal-query budget/attempt/outcome/reservation/settlement/recovery/exhaustion, route discriminator/equation and every typed result/conflict in addition to prior guard/seal state | RPC cannot issue/reconstruct seal/query permits, reseal, fund/release/move escrow, perform authority I/O, choose/coerce a route or turn status-only retry into invocation |
| `0.143.0` | Model seal response loss, abort escrow exhaustion, all `q`/`s` interleavings/outcomes, restore Unready, trusted-time drift, route co-commit choices, WitnessWon Commit, contradiction and exhaustion alongside prior submission/seal races | Only the five stated equations and exact `q`/`s` conservation are reachable; each admission can terminalize, one co-commit is subtracted at most once, exhaustion stays fenced, contradiction cannot roll/Commit and restore uses the same lane |
| `0.145.0` | Restore/migrate by loading completion/query reservations and route history, entering Unready, then admitting bounded seal-status queries through the ordinary durable protocol after independently reading authority state | Missing escrow/result/settlement, unmetered evidence, reseal, permit reconstruction, route/equation mismatch, released reservation, contradictory evidence or exhausted generation reopening is fenced/unavailable—not repaired |
| `0.146.0` | Fuzz abort reservation legs, seal budget/attempt tags/outcomes/results/conflicts, query IDs/reservation/settlement, route variables/arithmetic, co-commit bit, recovery state/time/backoff and prior guard/DAG/pair encodings | Branch aliasing, generic conflict fallback, under-reservation, release/reassignment/double consumption, co-commit double subtraction, overflow, unmetered restore I/O, reseal and invalid terminal transition fail closed |
| `0.147.0` | Audit abort completion guarantees, response-loss seal reconciliation, restore metering, typed result completeness, five-route charge/reservation conservation and prior submission/seal/equivocation/guard controls | Zero high/critical completion-capacity, seal-query authorization, special-restore-I/O, outcome/result alias, route-accounting, reservation/concurrency, equivocation, replay/rollover or anti-rollback finding |
| `0.148.0` | Reject legacy imports lacking completion reservation, seal reconciliation budget/attempt/outcome/reservation/settlement/recovery, route charges/equations or dedicated typed results/conflicts in addition to prior guard/seal artifacts | No shim invents escrow/outcomes/results, treats generic witness query/conflict as seal reconciliation, performs unmetered discovery, drops BeginAbortDrain from accounting or reopens exhausted/contradictory state |
| `0.149.0` | External pentest targets lost seal responses, restore/failover query bypass, reseal, completion-reserve exhaustion/theft/release, `q`/`s` amplification, trusted-time bypass, result/conflict substitution, route/co-commit arithmetic and every prior delayed-submit/equivocation race | Zero unresolved critical/high findings and no waived abort-completion, seal-query authorization, restore metering, typed-result, route-conservation, reservation/settlement, authority-equivocation, generational or anti-rollback issue |
| `0.150.0` and `1.0.0` | Demonstrate all prior guarantees plus no-write fully funded BeginAbortDrain, query-only bounded seal recovery, metered Unready restore, exact typed outcomes and all five charge equations with exact `q`/`s` reservation consumption across every backend/RPC/HA/Replan/import/restore path | Production remains blocked until the unchanged candidate passes completion-reserve, seal-query, route-accounting/result, submission/seal/drain/equivocation, guard-liveness, concurrency/time, fault/model and independent-pentest campaigns |

#### Reserved-capacity conservation and absorbing-equivocation refinement

This cumulative refinement does not replace the writer-charge, query or abort
route equations above. It makes every promised future route leg visible in the
authoritative capacity state and chooses a single fail-closed recovery model
for contradictory signed authority evidence.

| Version | Required context and deliverable | Verification and exit condition |
| --- | --- | --- |
| `0.29.0` | Extend CounterCapacityState and every class aggregate to admitted/consumed/reserved/remaining with `admitted = consumed + reserved + remaining`. Add canonical CapacityReservation and CapacityReservationSettlement records. Admission performs remaining→reserved before any permit; terminal selection atomically performs selected reserved→consumed and unused-exclusive reserved→remaining with result/event/audit/outbox. Make equivocation permanently absorbing for the old lineage and authority/key epoch, retain both receipts, and define independently authorized authority retirement plus fresh-identity/fresh-lineage replacement genesis with conservative capacity carry-forward | Race the last unit across ordinary/query/seal/abort reservations; prove no double allocation/decrement. Duplicate settlement joins, unused legs release only at terminal selection, route switches remain exact, and no timeout/CAS loss/failover moves capacity. Prove no ClearFence/receipt-selection/old-namespace transition exists and replacement cannot increase remaining capacity |
| `0.30.0` | Export/import every active reservation ID, exact class/dimension quantity, exclusive-leg group, settlement/disposition and integrity link, plus equivocation evidence bundle, absorbing fence, authority-retirement record and replacement genesis/lineage link | Round trips at every reservation and settlement boundary preserve the equation. Missing/forked reservation, settlement, receipt, retirement or replacement link keeps the affected lineage unavailable; import cannot infer a release, clear the fence or reuse an old namespace |
| `0.140.1` | Freeze four-member capacity encodings, reservation/settlement/leg-disposition tags, evidence-bundle/retirement/replacement-genesis schemas, canonical preimages and new authority/lineage namespace domains | Independent schema review rejects legacy three-member defaults, partial settlement, unknown leg/receipt tags, ambiguous authority scope, cyclic genesis evidence and any encoding of ClearFence or old namespace reuse |
| `0.140.2` | Freeze atomic remaining→reserved admission and terminal selected-consume/unused-release transactions with result/event/audit/outbox, checkpoint/archive head updates and the existing writer order. Freeze absorbing-fence, authority-retirement and replacement-genesis CAS boundaries | Backend fault injection exposes each bundle all-or-none. Last-unit races have one winner; duplicate/changed settlement joins/conflicts; replacement cannot race old Commit/rollover or publish before retirement/evidence/capacity transfer |
| `0.140.3` | Separate capacity planner, reservation owner, route terminalizer, settlement auditor, checkpoint/archive owner, equivocation-evidence custodian, retirement quorum, replacement-lineage initializer and new-authority operator. Require independent quorum and SoD for retirement/replacement | No actor can reserve and self-settle, release an unused leg early, clear its own fence, suppress a receipt, retire its own authority, initialize and operate the replacement alone, or reuse old permit/sequence authority |
| `0.140.5` | Retain active and settled reservation histories in exact-set commitments and permanently retain the old equivocation fence, proposal, both receipts, key/signer/distrust epochs, retirement and replacement link | Compaction/erasure cannot turn reserved into remaining, recreate/forget a leg, double-settle, discard inconvenient evidence, make the old lineage operable or detach the replacement from its conservative predecessor |
| `0.140.6` | Freeze failover across reservation admission, permit delivery, terminal selection, settlement, route switching, checkpoint/compaction and equivocation retirement/replacement. Takeover must restore the four-member equation before readiness | Crash at every write boundary; takeover returns the stored result, moves no quantity twice, preserves active escrow, remains unable to clear the old fence and starts a replacement only with the exact new identities and carried state |
| `0.140.11` | Complete the witness-authority equivocation recovery option decision before production: select permanently absorbing old lineage/authority plus independently governed fresh-identity/fresh-lineage re-anchor; explicitly reject generic ClearFence, preferred-receipt continuation and old sequencing/permit namespace reuse | Architecture, security and legal review approve the operational runbook, quorum/SoD, evidence custody, conservative capacity transfer and service-impact language. Any unresolved safe-reanchor question keeps the capability disabled |
| `0.142.0` | RPC exposes four capacity members, reservation/settlement status and read-only equivocation/retirement/replacement evidence without bearer authority | Clients cannot reserve/release/settle, select a receipt, clear a fence, retire an authority, mint replacement genesis or reconstruct old/new permits through status APIs |
| `0.143.0` | Model per-class last-unit races, multiple exclusive routes, settlement/terminal-result interleavings, restore/compaction cuts, contradictory receipts, retirement quorum and replacement bootstrap | Conservation holds in every reachable state; each reservation has exactly one final disposition, old state remains absorbing, and replacement state is fresh-namespaced and no less conservatively charged |
| `0.145.0` | Restore/migrate active reservations and settlements from one authenticated checkpoint/archive plus hot suffix. Restore equivocating state as fenced and load both receipts/retirement/replacement lineage together before either lineage is evaluated | Missing or inconsistent history yields typed unavailable/unready. Restore never refunds escrow, invents settlement, clears the old fence, chooses evidence or admits a replacement against incomplete custody |
| `0.146.0` | Fuzz four-member arithmetic, reservation IDs/amounts/classes/leg groups, settlement dispositions, duplicate/changed retries, archive boundaries, authority/key/lineage identities and replacement-genesis evidence graphs | Overflow, underflow, double debit/release, class/leg substitution, reservation collision, evidence omission, old namespace rebound and ClearFence/receipt-selection tags fail closed |
| `0.147.0` | Audit conservation ownership, reservation lifecycle completeness, integrity commitments, checkpoint/restore continuity, absorbing-fence semantics, evidence retention, retirement quorum/SoD and replacement capacity transfer | Zero high/critical accounting, authorization, evidence-custody, namespace-reuse or recovery finding; every active reservation and equivocation artifact has one accountable owner |
| `0.148.0` | Reject legacy imports lacking explicit reserved counts, reservation/settlement history, leg dispositions or absorbing-equivocation retirement/replacement evidence | No compatibility shim derives reserved from remaining, treats absent settlement as release, clears an old fence, selects a receipt or aliases new identities to old namespaces |
| `0.149.0` | External pentest targets last-unit double allocation, duplicate/post-restore settlement, route-switch refund, unused-leg early release, checkpoint/compaction rollback, forged retirement quorum, evidence suppression, ClearFence injection and old namespace/key reuse | Zero unresolved critical/high findings and no waived capacity-conservation, settlement-integrity, absorbing-fence, evidence-custody, SoD or replacement-reanchor issue |
| `0.150.0` and `1.0.0` | Demonstrate four-member conservation and exact reservation settlement across every backend/RPC/HA/Replan/import/archive/restore route, and exercise the approved absorbing-equivocation retirement/replacement runbook on the unchanged candidate | Production remains blocked until all model/fault/DR/audit and independent-pentest evidence passes, the old lineage remains provably absorbing and the replacement neither refunds capacity nor reuses authority |

#### Single replacement successor and cross-lineage transfer refinement

This refinement preserves the absorbing old lineage and four-member capacity
model above. It closes the recovery interval between fence installation and
activation without a distributed-transaction assumption.

| Version | Required context and deliverable | Verification and exit condition |
| --- | --- | --- |
| `0.29.0` | Add a fence-keyed WitnessAuthorityReplacementHead with NoReplacement→Staged→ActivatedPendingPointerWitness→Operational expected-version CAS, immutable predecessor, unique old-fence→genesis constraint and permanently rejected competitors. Make retirement one local atomic transition and pre-reserve parent Recovery. Stage frozen source/outbox and non-operational destination/inbox, witness exact transfer, then install only a pending pointer after import/conformance; signed `P_n` reconciliation alone enters Operational and consumes the source. Preserve one-to-one mapping or quarantine-as-consumed and inherited baseline | Concurrent bootstrap IDs produce one winner and durable conflicts. Pending state cannot dispatch, emit effects or claim projection/readiness. Signed witness alone operationalizes. Prove `Q + M = S.reserved`, all destination/source equations, no double-live permit/quantity and no fabricated head credit |
| `0.30.0` | Export/import all replacement, Recovery, transfer, pointer and typed result/conflict state, including ActivatedPendingPointerWitness, Operational, operationalization result and ConsumedByOperationalReplacement | Round trip every state cut. Missing/forked pointer witness remains pending; import never infers operationality from activation, timeout/source absence or creates a second successor |
| `0.140.1` | Freeze replacement state/pointer, local retirement, recovery-budget classes, transfer/mapping/baseline/high-watermark, activation/operationalization and result/conflict schemas and identity domains | Review rejects absent state, mutable predecessor, duplicate fence mapping, ambiguous inherited charges, implicit operationality, unknown reservation disposition and old permit material |
| `0.140.2` | Freeze retirement, stage, inbox import, source reconciliation, transfer witness, pending activation, signed-pointer operationalization, rejection, exhaustion and audit/outbox transactions under the recovery rank | Fault every local bundle all-or-none. No authority path can interleave between pending activation and witness reconciliation; same-backend and portable profiles preserve identical logical records |
| `0.140.3` | Separate retirement quorum/executor, Recovery owner, selector, source/destination owners, mapping verifier, transfer witness, conformance verifier, pending activator, pointer signer/reconciler and source consumer | No actor can select and operationalize its own candidate, self-witness transfer/pointer, import and acknowledge, or consume/refund another writer class |
| `0.140.5` | Permanently retain replacement ancestry/candidates, both transfer sides/receipts, mappings/equations/baseline/withheld, independent high-watermarks, pending activation, signed operationalization/current-pointer history and Recovery charges | Compaction cannot resurrect a loser, detach pointer witness, convert pending to operational, roll back one side or turn quarantine/baseline into capacity |
| `0.140.6` | Freeze failover at every retirement, stage, outbox/inbox, status, transfer witness, pending activation, pointer witness and source-consumption boundary | Takeover resumes status/Reconcile only, keeps destination non-operational until signed `P_n`, detects either-side rollback and never reissues operational authority |
| `0.140.11` | Freeze the exact single-successor, local retirement, reservation disposition, portable transfer, independent witness and pending→Operational runbook | Architecture/security/operations approve one profile or keep replacement disabled; no distributed transaction, implicit carryover, activation-as-authority or multi-successor option may be selected |
| `0.142.0` | RPC exposes read-only replacement states, candidates/pointer, Recovery, transfer/equations, high-watermarks and typed activation/operationalization outcomes | RPC cannot mutate, operationalize, choose material, forge receipts, move budget, infer completion or reconstruct permits |
| `0.143.0` | Model concurrent administrators, outbox/inbox crashes, response loss, conformance drift, pending/witness races, source delay, mapping partitions and last-unit funding | Exactly one replacement becomes Operational; no pending path accepts authority; conservation holds and losers are bounded terminal rejections |
| `0.145.0` | Restore/migrate source, coordinator, pending/Operational destination, transfer sides, pointer and independent commitment from authenticated snapshots plus hot suffix | Missing/forked/rolled-back witness keeps destination unready; restore cannot replay stage, activation or operationalization authority |
| `0.146.0` | Fuzz uniqueness, quantities/mappings, receipt tags, high-watermark ancestry, pending→Operational CAS, greatest-generation guard, Recovery charges and lock traces | Duplicate successor, double-live reservation, implicit operationality, stale generation, forged witness and rank inversion fail closed |
| `0.147.0` | Audit single-successor ownership, funding, transfer, conservation, external rollback detection and structural authority guards | Zero high/critical split-brain, pending-dispatch, unfunded-writer, double-capacity, permit-reuse, rollback or liveness finding |
| `0.148.0` | Reject imports lacking explicit replacement state, unique pointer, retirement terminal, Recovery head, transfer/equations, external witness or activation/operationalization result | No shim invents winner/funding/witness, assumes pending retirement or activation succeeded, maps reservations or derives operational authority |
| `0.149.0` | Pentest concurrent creation, suppression, stale versions, forged quorum/conformance/transfer/pointer receipts, rollback, disappearance, double-live capacity, funding exhaustion and pointer hijack | Zero unresolved critical/high findings and no waived successor, conservation, funding, transfer, rollback, SoD or operational-authority issue |
| `0.150.0` and `1.0.0` | Demonstrate one Operational winner and exact transfer across every selected profile, including transfer/pointer-witness outage and delayed source consumption | Production remains blocked until model/fault/DR/audit/pentest passes and no profile assumes distributed atomicity, activation authority or implicit recovery authority |

#### Replacement-recovery history and early-conformance refinement

This refinement gives the separate recovery attempt-set head an equally
separate durable history. The frozen old-lineage archive is never a fallback.

| Version | Required context and deliverable | Verification and exit condition |
| --- | --- | --- |
| `0.29.0` | Import signed tenant/deployment-bound `P_0` from an already signed receipt under a separate deployment-bootstrap reserve; the local transaction performs no external I/O and creates recovery/replay genesis plus Healthy guard. Split post-bootstrap operations into Healthy-only AuthorityChanging and preserve/strengthen-only EvidenceMaintenance. While Fenced permit only dedicated exact `E_m` fence checkpoint and FenceEvidence Stage/Verify/Commit producing `J_m`, independent signed fence-high-watermark Publish/Reconcile/query, restore verification/export and retention/hold strengthening. Add one total recovery-anchor sequence so a fence anchor dominates every earlier pointer. Require guard-first post-bootstrap locking | Reject unsigned/substituted `P_0`, in-transaction signer calls, bootstrap borrowing, reserve exhaustion partial writes and every rank inversion. Restore a pre-fence backup and require the greater fence anchor to force FencedEvidenceVerified. Under Fenced deny ordinary `C/H`, replacement/operationalization/capacity release/MarkOrphan/GC/clear while all allowed evidence maintenance remains live and bounded |
| `0.30.0` | Export/import bootstrap reserve settlement, signed genesis receipt, operation class, shared anchor sequence, fence checkpoint/archive/high-watermark publication/query, FencedEvidenceVerified and evidence-export state alongside all existing recovery artifacts | Round trip every Healthy/Fenced maintenance cut. Import rejects absent reserve proof, synthesized receipt, pointer-after-fence, incomparable anchors, missing fence evidence, weakened hold and undeclared Fenced mutation |
| `0.140.1` | Freeze bootstrap receipt/preimage/reserve, AuthorityChanging/EvidenceMaintenance, shared anchor/fence-high-watermark, publication/query/restore-verification/export and SignedNoFenceAtPointer schemas | Schema review rejects external effects hidden in bootstrap, class ambiguity, anchors without total order/dominance, mutable fence evidence, unknown outcomes and any Fenced authority transition |
| `0.140.2` | Freeze the separate initial-bootstrap transaction/order and guard-first post-bootstrap order; freeze fence installation, dedicated `E/J` EvidenceMaintenance checkpoint/Stage/Verify/Commit, fence-anchor Publish/Reconcile/query and restore-verification transactions | Fault every boundary all-or-none. Lock traces for fence installation, checkpoint, activation, pointer/fence reconciliation and restore begin at guard; FenceEvidence Commit writes only `J_m` and never deletes hot guard/fence/anchor |
| `0.140.3` | Separate deployment-bootstrap reserve owner and genesis signer/importer; separate AuthorityChanging executors from fence checkpointer/publisher/signer/query reconciler, evidence exporter and retention/legal-hold strengthener | No actor can sign/import/fund its own root, use evidence maintenance to change authority, self-anchor then erase evidence, weaken its own hold or select an older pointer |
| `0.140.5` | Permanently retain bootstrap funding/receipt, guard/fence/bundle/result, shared anchor, fence checkpoints/replay/receipts, query settlements, restore verification/export and strengthened custody decisions | Compaction cannot remove the hot fence/anchor, GC fence evidence, regress FencedEvidenceVerified, detach an external anchor or turn a stronger retention/hold state into a weaker one |
| `0.140.6` | Freeze failover across pre-signed bootstrap import, guard/class acquisition, fence checkpoint/archive, fence-anchor invocation/query, restore verification and retention strengthening | Takeover performs persisted status/Reconcile only, recreates no permit, compares both greatest anchors and preserves evidence-maintenance availability while authority remains denied |
| `0.140.11` | Decide before `1.0.0` the genesis signer/bootstrap-reserve profile, shared anchor encoding/order, independent fence-anchor authority, Fenced evidence-publication backend, retention/export policy and recovery runbook; manual root governance remains unsupported | Independent architecture/security/legal/operations approval is mandatory. No option may call a signer in the local transaction, borrow Recovery funding, allow incomparable anchors, disable post-fence anchoring or broaden EvidenceMaintenance into authority |
| `0.142.0` | RPC exposes read-only bootstrap funding/receipt, operation class, pointer/fence anchors and dominance, evidence publication/query, FencedEvidenceVerified, export and retention/hold strength | RPC cannot sign/import genesis, switch classes, mutate authority, publish without a durable claim, clear/GC evidence, weaken custody or translate SignedNoFenceAtPointer outside the exact pointer anchor |
| `0.143.0` | Model bootstrap funding/signature races, guard/class lock interleavings, fence checkpoint/archive, pointer-vs-fence anchor ordering, response loss, pre-fence restore and maintenance under prolonged Fenced | No partial root/fence, rank cycle, pointer-after-fence, incomparable anchor, lost evidence, recreated permit, maintenance starvation or Fenced authority is reachable |
| `0.145.0` | Restore authenticated `P_0`, both greatest pointer and fence anchors, exact fence checkpoint/replay ancestry and hot suffix; choose Healthy operational completion or FencedEvidenceVerified/export only | Pre-fence backups, missing/unknown/incomparable anchors, unavailable archive and absent SignedNoFenceAtPointer fail closed; dominating fence remains externally detectable and maintainable |
| `0.146.0` | Fuzz bootstrap reserve/receipt, operation-class tags, guard-first traces, anchor sequence/dominance, fence publication/query reservations, evidence exact sets, restore verification and monotone retention | Borrowing, external-I/O replay, overflow/ABA, rank inversion, partial anchor, evidence mutation/deletion, result substitution, hold weakening and accidental authority fail closed |
| `0.147.0` | Audit bootstrap trust/funding, dual lock orders, class ownership, bounded Fenced maintenance, anchor independence/dominance, evidence retention/export, HA and restore | Zero high/critical bootstrap ambiguity, lock inversion, rollback-unanchored fence, evidence-maintenance escape, stale authority, custody weakening, permit or role-confusion finding |
| `0.148.0` | Reject imports lacking pre-signed genesis and reserve settlement, explicit operation class, shared anchor sequence, fence high-watermark/evidence history, restore-verification or monotone custody evidence | No shim calls a signer, invents funding, defaults a class, orders anchors locally, drops a fence, treats Fenced as terminally unmaintainable or derives authority from evidence maintenance |
| `0.149.0` | External pentest targets bootstrap signer/I/O confusion, funding substitution, guard/rank bypass, pre-fence backup rollback, pointer-after-fence, fence-anchor suppression/forgery, evidence archive deletion, GC/hold bypass and Fenced class escalation | Zero unresolved critical/high and no waived bootstrap-atomicity, funding, lock-order, anchor-dominance, evidence-availability, custody, structural-fence or authority-separation issue |
| `0.150.0` and `1.0.0` | Demonstrate locally atomic pre-signed genesis import, guard-first dual-class recovery, externally anchored maintainable fence and witness-gated authority across every selected profile and sequential equivocation | Production remains blocked until core/schema/fault/DR/audit/pentest evidence passes with no hidden bootstrap effect, borrowed funding, lock inversion, rollback-undetected fence, evidence loss, Fenced authority or fallback |

#### Recovery observation completeness, fenced archive and genesis-trust refinement

This cumulative refinement closes the interval between a pointer observation
and its independently durable fence anchor. It strengthens, and never replaces,
the preceding recovery history, guard, anchor, custody and rollback controls.

| Version | Required context and deliverable | Verification and exit condition |
| --- | --- | --- |
| `0.10.0–0.11.0` | Replace every Phase B local order with `GlobalTransactionLockRankCatalogV1`: versioned ranks for recovery/authority guards; fences; quota/uniqueness; command/claim/proposal; payload lifecycle; time ratchet; aggregate/journal; and commit/result/audit/outbox. Every writer declares a subset and catalog generation; successor activation fences legacy writers | A static phase/adapter-trace checker rejects contradictory prose, reversed common subsequences, undeclared acquisitions and a legacy writer after catalog activation. Model representative partial subsets without ABBA deadlock |
| `0.23.0–0.27.0` | Add version-bound CommitCutRecordedTimePort profiles to SQLite, PostgreSQL, MySQL, MongoDB and SurrealDB adapter milestones. Accept only NativeAuthenticatedCommitTimestampOrSequence, BackendEnforcedCommitBeforeFence or formally equivalent attestation bound to transaction/journal/ratchet; start/insert/client time never qualifies | Run identical commit-delay/crash/rollback/suspend/failover/restore/readback tests. A failing exact adapter/server/topology disables DomainAggregateTarget while preserving explicitly supported control/no-aggregate operations |
| `0.29.0` | Preserve pinned genesis, AuthorityFenced, `R_first`, `B_EM`, `c_max`, PreparedNonAuthoritative, typed LocalFinalize, post-commit signing, DomainAggregateTarget/ControlOwnerTarget/CanonicalNoAggregateTarget, ProposedEventDescriptor, ClaimAcquisitionPending, no-classified-plaintext payload lifecycle, predecessor chain, independently unique identities with one-sided conflict, CommitReceiptSignerRecoveryRequired, PayloadReferenceUseClaim, CanonicalNoDomainEventChain, `e_claim_max/p_claim_max/n_signer_max/k_signer`, cardinality-safe `P_claim/S_claim` and every prior guarantee. Implement `GlobalTransactionLockRankCatalogV1` for Phase C and fence legacy Phase B writers at activation. Add PayloadMaintenanceHandoffPending plus CanonicalNoPayloadMaintenanceHandoffProof. Extend PayloadLifecycleMaintenanceCapacity from landing/handoff through stable reservation sets, predecessor-linked exact settlements, terminal checkpoint, verified archive replay, authenticated physical deletion and absorbing PhysicallyReleased conservation. Domain finalization still requires CommitCutRecordedTimePort/RecordedTimeAuthorityRatchet | Race old/new writers, every declared rank subset, signed/handoff/no-handoff/status transitions, settlement retries and changed material, archive loss/fork, early hot deletion, physical deletion, payload membership, ratchet/stream append, backend commit-cut mechanisms, signer recovery and restore. No dual/missing owner, hidden signed-pending state, capacity leak/double release, `c_max` retention pin, ABBA order, capability lie, time fallback or prior regression is accepted |
| `0.30.0` | Export/import catalog ID/generation/writer fences/traces; command handoff state/no-handoff proof; lifecycle reservation-set IDs, every live capacity leg, settlement journal/head, archive replay head, physical-deletion receipt and absorbing terminal term beside every prior state | Round trip every cut. Missing/forked catalog, handoff, settlement, archive or deletion evidence is RestoreUnready; import never revives legacy order, skips handoff, infers release from absent hot rows, releases twice or drops an unsettled leg |
| `0.140.1` | Freeze GlobalTransactionLockRankCatalog ranks/keys/generation, command handoff tags/proof, lifecycle reservation-set/state/settlement/archive/deletion schemas and both conservation equations plus all prior schemas | Review rejects contradictory order, ambiguous signed state, unstable IDs, incomplete legs, checkpoint-as-release, terminal disappearance, mutable conformance claim and every prior unsafe alias |
| `0.140.2` | Freeze catalog activation/legacy-writer fencing and trace validation; handoff/no-handoff state CAS; predecessor-linked settlement/archive CAS; verified-archive-before-hot-delete; physical-release CAS and per-backend commit-cut/head/ratchet transaction beside every prior transaction | Fault every boundary. No mixed writer generation, handoff gap/duplication, hidden state, double settlement, archive-unavailable release, early hot deletion, cleanup starvation, ABBA inversion or prior atomicity failure can commit |
| `0.140.3` | Separate catalog governance/activation/trace validation, operational/lifecycle owners, handoff/settlement/archive/deletion, structural-key validator, commit-cut verifier and prior roles | No actor self-approves a rank change, bypasses a writer fence, self-handoffs/releases, certifies its own archive/deletion evidence, borrows cleanup or bypasses prior SoD |
| `0.140.4` | Freeze redacted catalog generation/conflict, handoff pending/no-handoff, lifecycle leg/settlement/archive/physical-release status and prior APIs | API reveals no reference/store/key/signer evidence and never maps legacy-writer rejection, handoff pending, archive unavailable, ledger saturation, transfer unknown or RecoveryRequired to absent/released/success |
| `0.140.5` | Retain catalog lineage/activation/traces, lifecycle reservation sets/settlements/archive/deletion/conservation and prior history under retention/hold/erasure policy | Compaction cannot lose the active rank law, sole capacity owner, unsettled leg, exact retry/conflict evidence or archive predecessor; hot settlement deletion requires verified archive replay |
| `0.140.6` | Freeze failover during catalog activation, handoff, lifecycle settlement/archive/deletion, shared-subset acquisition and every prior boundary | Takeover joins exact writer generation, command state, owner/occupancy/settlement/archive state, preserves protected cleanup and unreadies on missing evidence |
| `0.140.11` | Decide before `1.0.0`: exact catalog ranks/structural keys/activation drain and adapter trace format; `L_max` per-leg/physical ceilings, reservation/settlement ID derivation, checkpoint/archive/deletion authorities, archive durability and unavailable-history SLO, handoff/no-handoff policy and protected workers; plus exact backend commit-cut and every prior profile choice | Architecture/security/privacy/legal/forensic/operations approve one immutable production profile. A backend without catalog-generation fencing, trace validation, complete terminal settlement conservation, verified archive replay, durable handoff states, passing commit-cut conformance or any prior requirement refuses governed domain claims |
| `0.142.0` | Expose redacted catalog generation/writer-fence conflict, handoff state/proof kind, every lifecycle leg/settlement/archive/physical-release state and prior status | RPC cannot reveal bearer evidence, mutate rank/capacity/profile, authorize release, hide pending work, free capacity early or imply support without proof |
| `0.143.0` | Model catalog activation plus all transaction subsets, command handoff/no-handoff, full lifecycle settlement/archive/release conservation and every prior state machine | No reachable state has mixed lock law, ABBA, unsigned/handoff alias, dual/no owner, leaked/double capacity, archive-unavailable release or weakened prior guarantee |
| `0.145.0` | Restore catalog lineage/fences/traces, command handoff state, every lifecycle unsettled/absorbing leg, settlement/archive heads/deletion receipts and prior evidence | Missing/forked evidence remains RestoreUnready; restore never chooses an order, skips a state, infers archive/delete success, refunds twice or resets capacity |
| `0.146.0` | Load/soak catalog transitions, opposite-order subsets, handoff/no-handoff, long holds and every lifecycle terminal route through archive outage/recovery; fuzz IDs, predecessors, legs and prior fields | Existing cleanup meets SLO under saturation. Mixed order, state alias, double release, permanent leakage, archive substitution, overflow and one-short reserves fail closed |
| `0.147.0` | Audit global rank governance/fencing, command handoff visibility, end-to-end lifecycle conservation/archive/delete trust and every prior control | Zero high/critical lock-law, hidden-state, capacity-lifetime, archive/deletion, cleanup-starvation, backend-time, payload, identity, signer, evidence or role finding |
| `0.148.0` | Reject imports lacking catalog generation/fence, handoff/no-handoff state, exact reservation/settlement/archive/delete conservation or any prior field | No shim maps a legacy order to current, signed to settled, absent hot row to archived/released, checkpoint to physical deletion or unsupported adapter to domain support |
| `0.149.0` | Pentest catalog split-brain/legacy-writer activation, handoff state confusion, settlement replay/change, archive loss/fork/early deletion, physical-release forgery and every prior attack | Zero unresolved critical/high and no waived lock-rank, lifecycle terminal settlement, command state, archive/deletion, commit-cut or prior issue |
| `0.150.0` and `1.0.0` | Demonstrate one unchanged candidate across selected global catalog, handoff/no-handoff, complete lifecycle settlement/archive/physical-release and every prior profile | Production remains blocked until all catalog/adapter traces, terminal conservation, archive outage/restore, performance/soak, DR, independent audit and pentest gates pass with no high/critical issue; unsupported profiles remain refused |

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
| `0.48.2` | Hosted publication through governed credential-operation profiles | Existing rotation/orphan/bearer/uncertainty controls plus evaluator reevaluation, evidence-backed quarantine exit, independent remediation or manual outage |
| `0.49.0` | Postmortems and corrective actions | Sensitive publication, deletion, blame/identity leakage |
| `0.50.0` | Integrated ITSM beta with later-phase port fakes | Cross-module authorization, fake-port contracts, replay and upgrades |
| `0.50.1` | Service portfolio lifecycle | Unauthorized activation/retirement, orphan consumers, hidden costs/risks, stale approval |
| `0.50.2` | Customer organization identity and lifecycle | Tenant/customer confusion, alias collision, destructive merge, ownership escalation |
| `0.50.3` | Supplier/vendor identity and lifecycle | Impersonation, external-ID collision, destructive equivalence, cross-tenant association |
| `0.50.4` | Procurement requisition and approval | Self-approval, quantity/unit/currency confusion, supplier/contract substitution |
| `0.50.5` | Capacity and demand management | Forecast-as-fact, unit/window confusion, hidden assumptions, stale observations |
| `0.50.6` | Service continuity plan lifecycle | Stale activation, recovery-objective manipulation, protected-plan leak, self-approval |
| `0.50.7` | Customer contacts and organization relationships | Contact/principal confusion, channel takeover, stale relationship, cross-customer disclosure |
| `0.50.8` | Customer service agreements and coverage | Agreement-as-authority, retroactive amendment, overlapping/expired coverage, term leakage |
| `0.50.9` | Service entitlement decisions | Subject/agreement substitution, quantity/period bypass, override escalation |
| `0.50.10` | Supplier contract lifecycle | Party/reference substitution, silent renewal, retroactive rewrite, expired contract use |
| `0.50.11` | Supplier contractual-obligation lifecycle | Contract/obligation substitution, silent deletion, unit/period confusion, supersession fork |
| `0.50.12` | Supplier data access and termination | Contract-as-access, scope expansion, missed system, false external deletion |
| `0.50.13` | Immutable external purchase-order evidence and receipt authority | Issuer/version/digest forgery, local order mutation, over-receipt, duplicate/false delivery |
| `0.50.14` | Allocation, return, and Phase I asset handoff | Double allocation, false return, custody loss, premature/duplicate asset creation |
| `0.50.15` | Non-software entitlement lifecycle | Source substitution, over-allocation, double consumption, software-kind confusion |
| `0.50.16` | Provider-neutral ERP port, ownership, fake, and reconciliation semantics | Endpoint/account/tenant confusion, stale overwrite, field/unit/currency drift |
| `0.50.17` | Continuity exercises and corrective evidence | Wrong plan, false completion, evidence substitution, self-attestation, missing gap/action |
| `0.50.18` | Supplier performance assessment, evidence, findings, and inert risk proposals | Obligation/evidence/method substitution, self-assessment, hidden result, proposal-as-risk |

## Phase F — Identity, Tenancy, And Policy

Setup: authentication supplies facts; policy alone grants authority. Goal:
complete deny-by-default access control across all current interfaces. Phase
exit: the authorization conformance matrix covers command/read/export/search.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.51.0` | Formal tenant isolation model | Cross-tenant reads/writes/caches/indexes/blobs/logs |
| `0.51.1` | Tenant lifecycle, topology migration, enforcement epoch, and law-generation expansion | Activate `VIT-LAW-001` g03 and `VIT-LAW-006` g02 only after tenant-root migration/fence proof; suspension/resume racing dispatch, epoch reuse, partial provision/delete, cleanup/key-destroy ordering |
| `0.51.2` | Tenant data-surface lifecycle registry | Backfill/outward-dependency/gate bypass, inherited retention, partial cleanup, evidence inflation |
| `0.51.3` | Domain tenant-surface reference extension, Phase D/E backfill, and prospective gate | Copied lifecycle semantics, dangling/wrong-tenant ID, missing derived/external surface, recovery cycle |
| `0.51.4` | Immediate tenant-surface contribution and recovery-order certification | Omitted surface, wrong owner/key, copied lifecycle fields, stale generation, unresolved defer, late handler |
| `0.51.5` | Authenticated deployment tenant-membership retirement cut, fenced topology mutation, late-member reconciliation, and safe finalization/release lifecycle | Omitted/substituted member, projection authority, create/move/close/delete race, lost handoff, incomplete barrier, restore revival, unsafe/replayed release |
| `0.51.6` | Separately approved immutable exact-cut retirement plan, one-shot consumption, atomic cut binding, campaign admission, and derived child-authority template | Cut-only start, cut/plan/generation substitution, stale or revoked approval, double consumption, response-loss ambiguity, cross-campaign child authority |
| `0.51.7` | Monotonic successor-plan lineage, exact allowed-delta approval, cumulative budgets, predecessor fencing, and resume authority | Concurrent/forked successor, stale predecessor CAS, restored predecessor, dual dispatch generation, completed-child replay, budget reset or widening |
| `0.51.8` | Narrow domain guard, authenticated post-cut absence/child handoffs, broad-fence transfer, and finite handoff barrier | Unguarded transfer, projection-as-absence, omitted surface, moved-in tenant gap, stale topology, response loss/restore, blocked campaign holding broad fence |
| `0.51.9` | Canonical campaign-protection root and joint successor/protection CAS with authenticated ancestor-issued receipt validity | Successor/append race, stale root, receipt/barrier/blocker rollback, omitted guard, nonancestor receipt, dual current root |
| `0.51.10` | Bounded fair child execution and complete terminal aggregation into clean, non-clean, or blocked-nonterminal branches | Unauthorized dispatch, fabricated retirement for absence, hidden terminal loss, nonterminal treated ready, cursor rollback, starvation |
| `0.51.11` | Bounded process-manager handoff of non-clean residual obligations through tenant-local atomic owner acceptance | Cross-tenant transaction, partial acceptance, tenant outage, receipt substitution/replay, fold rollback, starvation, premature cleanup |
| `0.51.12` | Immutable residual membership and predecessor-linked mutable residual-state evolution | Membership mutation, state fork/rollback, unauthorized transition, receipt replay, restore divergence, stale eligibility lineage |
| `0.51.13` | Restore-safe purpose-bound delivery cuts, consuming states, release manifests, and canonical-empty residual tuple | Delayed outbox, barrier race, consumed-cut revival, absent/empty confusion, missing release work |
| `0.51.14` | Closed residual-mutation classification, protected restrictive lane, safety epochs, invalidation and source status | Misclassification, blocked legal hold/revocation, emergency starvation, stale status/permit, invalidation loss |
| `0.51.15` | Fresh permanent-guard authorization over one target slot, sealed cut, and safety-status root | Stale plan/cut/status, slot/root/guard substitution, topology starvation, key/revoke/expiry race |
| `0.51.16` | Atomic permanent takeover/completion, ConsumedByTakeover and bounded barrier-release work | Protection gap, restrictive mutation race, incomplete consumed/release state, capacity loss, false clean |
| `0.51.17` | Atomic candidate-control retention ownership and maintenance-capacity transfer | Unfunded/double-funded retained control, split ownership, capacity settlement before acceptance, accounting mismatch, restore divergence |
| `0.51.18` | Takeover delivery-barrier release/retention reconciliation | Wrong barrier release, residual restriction loss, outage/replay, unfunded successor retention, premature archive |
| `0.51.19` | Authenticated campaign archive checkpoints and uncertainty-preserving cleanup reconciliation | Archive omission/corruption, delete-before-verify, partial archive/head/delete, false cleanup, capacity release |
| `0.51.20` | Independent retained-campaign namespace-safety authorization | Self-certification, omitted deletion mechanism, target overlap, stale evidence/key, delayed delete |
| `0.51.21` | Bounded partition-fenced reinstall evaluation with restrictive bypass and canonical clean-empty result | Mutation class confusion, partial fencing, stale status, invalidation loss, absent/empty confusion, starvation |
| `0.51.22` | Explicit adjacency-table and shared generation-CAS lifecycle for admission, abort, quarantine, expiry and activation | Illegal lifecycle edge, process-state confusion, split terminal outcomes, final-acceptance/abort race, late response completion |
| `0.51.23` | Source-partition reinstall activation admission with one-shot permit redemption and successor-restriction bridges | Signature-as-admission, permit race/replay, rejected/unknown admission, abort-fenced late result, bridge omission |
| `0.51.24` | Durable successor-restriction bridge ownership, funded capacity, canonical empty root, and typed root-bound activation preparation CAS | Missing/double bridge owner, preparation without complete roots, abort/expiry race, absent/empty confusion, restore divergence |
| `0.51.25` | Partial reinstall-admission abort, artifact disposition, canonical empty disposition, and candidate supersession | Rejection revival, unknown treated absent, activation/abort race, permit regeneration, competing candidates, aborted activation |
| `0.51.26` | Permanent-unknown admission recovery policy decision | Ambiguous option, unsafe recovery claim, missing catastrophe authority/fences/floors/capacity, decision used as execution authority |
| `0.51.27` | Conditional two-CAS unknown-admission catastrophe quarantine or explicit Unsupported refusal | Unknown relabeling, direct/final quarantine before root, incomplete permanent fence, stale key/lease/routing, unfunded residual |
| `0.51.28` | Generated complete enforcement-scope coverage root for quarantined unknown restrictions | Omitted action/effect/plugin/admin/adapter/kind, forged smaller root, mixed generations, late activation, unsafe fallback |
| `0.51.29` | Maximal conservative enforcement over the exact current coverage root through evaluation, admission, and successor bridges | Residual/coverage omitted from roots, canonical-empty substitution, capacity without enforcement, implicit lowering, unfunded bridge |
| `0.51.30` | One finite post-quarantine replacement-evaluation lineage with fresh generations, cumulative budgets, and permanent exhaustion | Eligibility reuse, stale receipt crossing generations, old-fence leak, retry/budget reset, forged successor recovery |
| `0.51.31` | One-shot successor-lifecycle genesis from a current replacement-evaluation receipt | Missing/replayed lineage or tombstone, eligibility re-consumption, identity reuse, duplicate lifecycle, restriction-generation omission |
| `0.51.32` | Tagged initial-or-replacement guard supersession, absorbing cut/evaluation consumption, operational transfer, and dual release manifest | Genesis-branch substitution, double eligibility consumption, missing tombstone/receipt, abort/expiry race, partial activation |
| `0.51.33` | Reinstall delivery-barrier/evaluation-fence release or funded successor-retention reconciliation | Wrong control release, residual restriction loss, outage/replay, unfunded retention, premature cleanup, consumed revival, new-generation blockage |
| `0.51.34` | Destination-admitted, separately governed unknown-restriction lowering for pre-operational reservations and operational guards | Incomplete authority/evaluation/bridges, lifecycle race, non-atomic live-guard lowering, early top release, restore divergence |
| `0.52.0` | Subjects, service principals, independent external-identity mapping epochs, and law-generation expansion | Activate `VIT-LAW-001` g04/`VIT-LAW-006` g03; principal/mapping revocation racing dispatch, unsafe linking, immutable issuer-subject identity, epoch reuse, recreation |
| `0.52.1` | OAuth resource-server workload authentication, mapping epoch, and law-generation expansion | Activate `VIT-LAW-001` g05/`VIT-LAW-006` g04; workload remap/revoke race, stale external privileged fact, false sender constraint, bearer escalation, issuer/audience confusion |
| `0.53.0` | Hosted OIDC integration, independent interactive-session epoch, and law-generation expansion | Activate `VIT-LAW-001` g06/`VIT-LAW-006` g05; discovery, mix-up, replay, downgrade, fixation, logout/assurance racing dispatch |
| `0.53.1` | Hosted WebAuthn lifecycle, authenticator epoch, and law-generation expansion | Activate `VIT-LAW-001` g07/`VIT-LAW-006` g06; RP/origin/challenge binding, counters, revoke/rotate racing assertion or dispatch, recovery |
| `0.53.2` | Distributed session store with local session epoch | Logout/revocation racing dispatch, epoch reuse, fixation/replay, node failure, partition |
| `0.53.3` | SAML identity profile and adapter | XML signature wrapping, audience/destination mix-up, assertion replay, metadata rollback |
| `0.54.0` | Directory/group synchronization with authorization-fact epoch | Group change racing dispatch, epoch reuse, takeover, stale privilege, deletion/recreation |
| `0.54.1` | SCIM provisioning profile and adapter | External-ID collision, filter/PATCH abuse, group takeover, pagination/bulk bombs |
| `0.55.0` | RBAC with independent role-definition, assignment, admitted-group epochs, and law-generation expansion | Activate `VIT-LAW-001` g08/`VIT-LAW-006` g07; definition/assignment/membership races, raw-SCIM grant, epoch reuse, cycles, hidden grants |
| `0.56.0` | ABAC engine and law-generation expansion | Activate `VIT-LAW-001` g09/`VIT-LAW-006` g08; missing attributes, type confusion, fail-open decisions |
| `0.56.1` | Policy lifecycle, bootstrap, recovery, and monotonic epoch | Activation/rollback racing dispatch, epoch reuse, self-approval, lockout, recovery abuse |
| `0.57.0` | Relationship authorization with fact epochs and law-generation expansion | Activate `VIT-LAW-001` g10/`VIT-LAW-006` g09; edge-change races, epoch reuse, malicious paths, ownership spoofing, traversal bounds |
| `0.58.0` | Authority registry for governed profiles, serialized credential state, TCB, and rollout recovery | Evaluator lineage/epoch/start fence, quarantine owner/resolver/tombstones, remediation profile/lineage/audit/quota, existing boundaries |
| `0.59.0` | Delegation/break-glass with enforcement epoch and final planned law-generation expansion | Activate `VIT-LAW-001` g11/`VIT-LAW-006` g10; delegation revoke racing dispatch, epoch reuse, unbounded privilege, grant amplification, weak audit |
| `0.60.0` | Complete governed-executor and successor/cancellation conformance suite | Existing profile/rotation/TCB/recovery cases plus evaluator upgrade/mixed nodes, invalid quarantine exits/revival, remediation compromise/circularity/no-path |
| `0.60.1` | Policy-bound read-subscription port, cursor, and gap contract | Cursor/tenant/topic substitution, hidden fields/counts, replay horizon, no command path |
| `0.60.2` | Subscription delivery, item-level reauthorization, revocation, and backpressure | Policy/session change between items, slow consumer, flood, reconnect/failover, transport downgrade |
| `0.60.3` | Authorization/redaction contribution extension, Phase D–F backfill, and prospective gate | Dangling/copied policy entry, duplicate owner, generation mismatch, false defer, allow-by-default |
| `0.60.4` | Authorization contribution completeness and registry-differential certification | Missing/mismatched interface/field/purpose, hidden count, unresolved defer, late implementation |

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
| `0.64.0` | Timers with governed provider authority and explicit credential TCB | Existing stale/bearer/duplicate/failover cases; no timer evaluator/resolve/remediation authority; fresh authorization after resolution |
| `0.65.0` | Parallel branches and joins | Premature joins, duplicate completion, branch leaks |
| `0.66.0` | Linked, independently authorized and multi-claim-accounted compensation mechanics | State/linkage collapse, unknown original/compensation, evidence/authority race, claim reuse/cross-kind settlement, double rollback |
| `0.67.0` | Signals and subworkflows | Signal spoofing, cross-tenant routing, recursion exhaustion |
| `0.68.0` | Workflow history, versioning, and migration | Unbounded history, corrupt checkpoint, orphan activity, unsafe remap |
| `0.69.0` | Visual/configuration-as-code compiler | Hidden flags, generated privilege escalation, divergence |
| `0.70.0` | Workflow worker lease, owner identity, and fencing model | Lease/fence/takeover boundary model tests only; recovery and cross-domain HA certification are `0.70.1–0.70.2` |
| `0.70.3` | Minimal typed topology vocabulary and policy-before-traversal port | Wrong-type links, hidden intermediates/counts, temporal/provenance drift, path exhaustion |
| `0.70.4` | Workflow/notification contribution extension, Phase D–G backfill, and prospective gate | Dangling/colliding trigger, copied IR, generic mutation, generation mismatch, false defer |
| `0.70.5` | Workflow/notification contribution completeness and behavior certification | Stale authority, hidden-field notification, loop, unresolved defer, late implementation |

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
| `0.75.0` | `0.70.3` topology-port and temporal correlation | Poisoning, hidden-node inference, graph exhaustion, no premature full-CMDB claim |
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
| `0.81.1` | Signed extensible asset-kind registry, descriptor validation, activation, compatibility, and migration | Kind substitution, namespace collision, cross-kind mutation, unsafe migration |
| `0.81.2` | Ephemeral identity, incarnation, disappearance, and reincarnation semantics | ABA identifier reuse, false deletion, stale vulnerabilities/ownership/edges |
| `0.81.3` | Physical and compute asset-kind pack | Serial/provider-ID collision, VM/host confusion, unsafe migration, disposal gaps |
| `0.81.4` | Cloud, Kubernetes, and container asset-kind pack | Account/cluster/namespace confusion, provider-ID reuse, image/instance collapse |
| `0.81.5` | Identity, certificate, domain, and network asset-kind pack | Secret ingestion, authority confusion, certificate/domain takeover, identifier reuse |
| `0.81.6` | SaaS and data asset-kind pack | SaaS-tenant/data identity collision, classification/residency/retention downgrade |
| `0.82.0` | Business and technical services | Service-owner escalation and tenant linkage |
| `0.82.1` | Service health, availability, and SLO binding | False/stale health, raw/rollup authority confusion, override abuse, unknown-to-healthy fail-open |
| `0.83.0` | Typed relationship graph | Malicious cycles, unauthorized edges, traversal bounds |
| `0.84.0` | Provenance and confidence | Source impersonation, confidence inflation, evidence detach |
| `0.85.0` | Bitemporal facts | Historical rewrite, overlaps, invalid intervals |
| `0.86.0` | Discovery and import interface | Poisoned sources, oversized imports, replay |
| `0.86.1` | Concrete CMDB discovery connector | Endpoint/account confusion, identity collision, poisoned relationships, delta gaps, source drift |
| `0.86.2` | One representative cloud-native discovery profile or explicit manual/import-only defer | Account/cluster confusion, watch gap, UID reuse, forged deletion, cursor/source drift |
| `0.87.0` | Reconciliation engine with target-fence-safe identity lifecycle | Source-priority abuse, destructive merge, stale target fence, dispatch race, nondeterminism |
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
| `0.100.1` | Search/history contribution extension, Phase D–J backfill, and prospective gate | Dangling/colliding schema/facet, copied deletion semantics, rebuild-owner mismatch, false defer |
| `0.100.2` | Search/history contribution completeness, rebuild, and policy certification | Hidden field/count, stale revocation, rebuild divergence, unresolved defer, late implementation |

## Phase K — Compliance And Risk

Setup: frameworks are signed, versioned data with licensing metadata. Goal:
framework-neutral controls, obligations, evidence, exceptions, and simulation.
Phase exit: pack conflicts and impact are explainable before activation.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.101.0` | Signed framework-pack format with dependency, signer-rotation, revocation, and licensing semantics | Content/dependency substitution, signer downgrade/distrust, incompatible activation |
| `0.102.0` | Requirement/control graph, applicability, mappings, and overlays | Malicious mappings/cycles, scope inheritance, hidden obligations, provenance loss |
| `0.103.0` | Point-in-time and continuous evidence requirements, admissibility, lineage, custody, and redaction | Forgery, stale/reused evidence, collector downgrade, cross-tenant/export leakage |
| `0.104.0` | Versioned NIST CSF pack | Source drift, false normative status, activation, mapping and overlay integrity |
| `0.105.0` | Versioned DORA pack | Jurisdiction/entity/effective-date confusion, applicability and mandatory-evidence bypass |
| `0.106.0` | Licensed versioned ITIL practice packs and organization overlays | Overlay/dependency precedence, licensing metadata, workflow conflict, unsafe override |
| `0.107.0` | Quarantined licensed/custom standards importer | Untrusted content, namespace collision, mapping escalation, import-as-activation |
| `0.108.0` | Risk, treatment, acceptance, waiver, and exception workflows | Self-acceptance, scoring/method tamper, precedence bypass, immortal exceptions |
| `0.109.0` | Control testing, continuous observations, findings, reports, and redacted exports | Plan/sample/result substitution, selective rerun, self-review, report leakage |
| `0.110.0` | Pack dependency/overlay/applicability impact and conflict simulator | Precedence error, hidden obligation removal, simulation/runtime divergence |
| `0.110.1` | Privacy request case domain | Requester impersonation, subject disclosure, hold/approval/deadline bypass |
| `0.110.2` | Privacy fulfilment, data-surface evidence, safe export, and third-party uncertainty | Omitted surface, export leak, early completion, erasure resurrection, false certainty |

## Phase L — WASM And Integrations

Setup: use versioned component interfaces and project-owned capability types;
never expose direct database access. Goal: bounded replaceable extensions.
Phase exit: cross-plugin/tenant isolation and compatibility suite pass pentest.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.111.0` | Versioned WIT component interfaces | ABI confusion and malformed components |
| `0.112.0` | Deterministic component execution | Fuel bypass, nondeterminism, covert host access |
| `0.113.0` | Effectful components with governed provider execution authority | Plugin cannot govern evaluators, resolve quarantine, or request remediation operations; reauthorization follows resolution |
| `0.114.0` | Capability, profile-governance, and credential-operation/TCB model | Evaluator/quarantine/remediation handles remain host-only and non-composable; existing key/bearer boundaries |
| `0.115.0` | Memory/CPU/network/output metering | Resource-limit bypass and host denial of service |
| `0.116.0` | Signed plugin registry and rollout | Signature downgrade, malicious update, rollback |
| `0.116.1` | Governed plugin catalog and storefront | Publisher/listing/package impersonation, hidden capabilities, review bypass |
| `0.117.0` | Connector SDK with evaluator/quarantine/remediation and credential-TCB testkit | Existing rotation/orphan/policy/TCB corpus plus evaluator upgrade/mixed-node, resolution no-revival, independent-remediation/no-path fixtures |
| `0.118.0` | Mail, webhook, and collaboration connectors | Header injection, spoofing, action-link abuse |
| `0.118.1` | Microsoft Defender and Sentinel connector pack | Provider/workspace confusion, cursor/webhook replay, schema drift, action escalation |
| `0.118.2` | Tenable vulnerability connector pack | Asset/finding confusion, forged fixed state, score drift, coverage gaps |
| `0.118.3` | Inbound service-desk mail intake, bounded MIME handling, and quarantine | Sender/tenant spoofing, MIME/nested/decompression bombs, duplicate delivery, attachment escape |
| `0.118.4` | Reply-token correlation, loop suppression, moderation, and work proposals | Subject/token/case substitution, forwarding leak, DSN/auto-reply loop, direct mutation |
| `0.118.5` | One exact ERP connector adapter profile or explicit unsupported/deferred result | Workload/account confusion, secret/egress bypass, stale overwrite, ambiguous effect |
| `0.119.0` | Outbound agent with local governed credential-operation authority | Existing rotation/orphan/count/bearer isolation plus no spool evaluator/resolve/remediate authority and offline-work invalidation |
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
| `0.120.6` | Signed, redacted, resumable security-audit export contract | Destination/tenant substitution, field leak, cursor forgery, batch gap/reorder/key rollback |
| `0.120.7` | Audit-export delivery, backpressure, reconciliation, and offboarding | Silent loss, response ambiguity, slow sink, spool exhaustion, revoked destination |
| `0.120.8` | Manifest-driven late-domain authorization contribution certification | Wrong/stale interface generation, missing field/purpose, false not-applicable/defer/support, leak, late implementation |
| `0.120.9` | Manifest-driven late-domain workflow and notification contribution certification | Wrong/stale trigger generation, generic mutation, recursive loop, false defer/support, late mapping |
| `0.120.10` | Manifest-driven late-domain search and history contribution certification | Wrong/stale document generation, hidden field/count, rebuild drift, false defer/support, late mapping |

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
| `0.132.3` | Workspace contribution extension, historical domain backfill, and prospective gate | Dangling/colliding block, copied command/policy, generation mismatch, false defer |
| `0.132.4` | Workspace composition, organization profiles, accessibility, and contribution certification | Hidden route/action/field, profile privilege, unsupported claim, late implementation |
| `0.133.0` | Schema and form builder | Malicious schemas and stored UI injection |
| `0.134.0` | Workflow and policy builder | Generated privilege escalation and hidden behavior |
| `0.135.0` | Dashboards and bounded report builder | Query exhaustion and aggregate inference |
| `0.136.0` | Request portal and generic cases | External-user isolation and enumeration |
| `0.137.0` | Configuration-as-code and signed changes | Substitution, unauthorized activation, rollback abuse |
| `0.138.0` | External API v1 candidate | Mass assignment, cursor/ETag/token confusion, decompression, cancellation, compatibility |
| `0.138.1` | Private SDK candidate | Generated-code substitution, secret logging, retry/version differential |
| `0.138.2` | Import staging and validation | Parser bombs, mass assignment, stale plan, partial promotion, erased-data resurrection |
| `0.138.3` | Export policy snapshots and manifests | Authorization drift, hidden fields, truncation, delivery/retention lifecycle |
| `0.138.4` | External API contribution extension, selected-domain backfill, and prospective gate | Dangling/colliding route/resource, copied schema, generation mismatch, false defer |
| `0.138.5` | Transfer/configuration contribution extension, selected-domain backfill, and prospective gate | Dangling/colliding codec, copied semantics, secret reference error, false defer |
| `0.138.6` | External API/SDK assembly, freeze, compatibility, and contribution certification | Mass assignment, cursor/consistency mismatch, SDK drift, unresolved defer, late implementation |
| `0.138.7` | Transfer/configuration composition, round-trip, activation, and contribution certification | Secret export, generic fallback, partial activation, unresolved defer, late implementation |
| `0.139.0` | Accessibility, localization, mobile layouts | Localization injection and client-state leakage |
| `0.139.1` | Contribution-kind-driven full-suite differential suite jointly sourced from requirements, manifests, and authorization | Kind missing registry/lifecycle/certification/test dimensions, missing differential, stale generation, false defer/support, future-surface omission |
| `0.140.0` | Operator and tenant administration console | Administrative privilege and support boundaries |

## Pre-Production Profile Freeze Decisions

These evidence-producing patch milestones revalidate implementation-admission
records and freeze supported production choices before Phase O. They are not
the first technology decision. An unselected option remains unsupported at
`1.0.0`.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.140.1` | Cryptographic primitive, signature, and canonical-authentication profile decision | Known-answer/negative/canonicalization/replacement review; transport/time, KMS, and build inputs remain `0.140.12–0.140.14` |
| `0.140.2` | Default production storage and tenancy candidate matrix | Evidence-based SQLite/PostgreSQL/default-versus-experimental selection only; focused storage decisions are `0.140.15–0.140.20` |
| `0.140.3` | Human/workload/session, migration-authorization issuer/SoD, and worker-instance identity decision | Retain issuer/admitter/applier/operator, campaign/recovery, allocator/verifier and worker/settler separation. Add cleanup scheduler/claimant versus foreground admission. No role may reset priority, rewrite accounting, self-settle, issue+apply revocation, mutate a new campaign or repair/credit state |
| `0.140.4` | Component runtime and governed credential-broker TCB decision | Evaluator binary/corpus admission and upgrade; quarantine-resolution evidence; non-composable remediation authority; existing TCB |
| `0.140.5` | Privacy, tenant-surface lifecycle, evidence, and residency decision | Retain all prior transfer/cut/fence/settlement/grant/revocation evidence plus immutable totals, releases, leg tombstones, cleanup turn/budget/backlog and terminal outcomes. Erasure cannot drop a member, roll back release, reset priority, recreate a leg, invent credit or revive authority |
| `0.140.6` | Supported deployment-shape decision | Select modular-monolith/split/single-node topology shapes only; HA, regional/DR, and operational authority are `0.140.21–0.140.23` |
| `0.140.7` | API, SDK, licensing, and publication decision | Compatibility, registry ownership/provenance/recovery, exact SDK exception or no publication |
| `0.140.8` | AI production enablement decision | Advisory-only isolation, provider policy, evaluation, injection, kill switch, disabled fallback |
| `0.140.9` | Interchange and integration-boundary freeze decision | Directional SCIM, STIX publication, authenticated syslog, SIEM/detection, and CMDB support/defer evidence |
| `0.140.10` | Federation production enablement decision | Cross-organization isolation, malicious peer, delegation abuse, revocation/offboarding evidence |
| `0.140.11` | Witness-authority retirement freeze decision | Contradictory evidence stays permanent; old authority/lineage is absorbing; retirement requires independent quorum and custody |
| `0.140.12–0.140.14` | Focused transport/time, KMS/key-lifecycle, and build/dependency freezes | Each decision binds its own exact profile, evidence, unsupported combinations, and pentest |
| `0.140.15–0.140.20` | Focused storage isolation, transaction, migration, recovery, promotion, and final-support freezes | No storage claim spans an unproven backend, topology, operation, or recovery path |
| `0.140.21–0.140.23` | Focused HA, regional/DR, and operational-authority freezes | Each deployment claim has one topology, failure model, role matrix, and exercise corpus |
| `0.140.24–0.140.26` | Focused witness replacement bootstrap, capacity transfer, and operationalization freezes | No approval can select a convenient receipt, reuse an old namespace, fabricate credit, or skip witnessed replay |
| `0.140.27` | Full-suite product profile freeze decision | Evidence-based support/defer matrix for extended service management, subscriptions, assets, privacy, inbound mail, and audit export |
| `0.140.28` | Mandatory Hosted production baseline go/no-go under repository-wide zero dependencies | Missing TLS/crypto/storage/identity/input/operations evidence, false support, hidden installer or claim bypass |

## Phase O — Production Hardening

Setup: freeze compatibility dimensions progressively and test real operations.
Goal: reliable single-node and HA deployments with recoverable upgrades. Phase
exit: production candidate has passed external pentest and all acceptance tests.

| Version | Goal and deliverable | Release-specific verification / pentest target |
| --- | --- | --- |
| `0.141.0` | Single-node package/image layout, users, paths, permissions, and secure install/uninstall | Clean-install, ownership, permissions, secret-sink, uninstall-retention, and unsupported-platform tests; operational gates are `0.141.1–0.141.4` |
| `0.141.1–0.141.4` | Startup compatibility, topology bootstrap, authorization replay/rate budgets, and capacity drains | Each focused stop passes its own failure matrix, evidence report, and exact-commit pentest |
| `0.142.0` | Split deployments with separated topology/authorization services and exact topology-issued catalog placement owners | RPC carries all prior parent/campaign/cut/fence/settlement/revocation state plus original/released/legs, cleanup turn/backlog and terminal outcomes; it grants no remote retirement, terminal, recovery, settlement, scheduler reset, revocation apply, debit/credit/release or lock authority |
| `0.142.1` | Production telemetry exporters and graceful drain | `0.20.2` contract conformance, exporter failure, readiness and drain |
| `0.143.0` | HA lease, owner identity, and fencing model | Model one-owner lease/fence safety; owner failover and service partitions are `0.143.1–0.143.2` |
| `0.143.1–0.143.2` | Stateful-owner failover and cross-service partition/recovery certification | Each owner and service-pair failure campaign passes independently |
| `0.144.0` | Authoritative-region placement and residency through topology successors | `VIT-INV-060` regional move/fence/tombstone, predecessor-bound rollout block, cross-region identity/lease collision, receipt/start split, floor owner split, omitted regional parent |
| `0.145.0` | Backup format, manifest, encryption, custody, and creation path | Backup integrity/custody/partial-write/key/profile tests; restore and DR are `0.145.1–0.145.2` |
| `0.145.1–0.145.2` | Restore/readiness and full DR/failback/disposition certification | Separate destructive restore and regional-loss exercises with exact evidence |
| `0.145.3` | Manifest-driven destructive full-suite lifecycle and recovery certification after immediate `0.51.4` coverage | Omitted/stale contribution, unresolved defer, late-added reference/handler, resurrection, false evidence, restore divergence |
| `0.145.4` | Destructive tenant/deployment retirement campaign, terminal truth, historical readability, restore/import, and reinstall certification | Membership omission/cut race, child substitution, blocked completion, cursor rollback, starvation, loss-as-clean, late work, data/codec failure |
| `0.146.0` | Reproducible load harness, workload profiles, ceilings, and invariant oracle | Harness calibration and boundary tests only; soak and chaos are `0.146.1–0.146.2` |
| `0.146.1–0.146.2` | Soak/fairness and chaos/recovery-capacity certification | Independent sustained-load and compound-fault evidence sets |
| `0.147.0` | Final profile-governance, topology replay-lifecycle, bearer-memory, executor, migration/import-budget/activation, and supply-chain hardening | Retain prior authority/conservation/cut/physical-capacity audit; add cleanup fairness/backlog, per-unit settlement attribution, counter immutability and terminal-result parity |
| `0.148.0` | Compatibility freeze for provider authority, rollout recovery, topology replay lifecycle, and migration/import budget/activation | Retain prior strict campaign/workspace/revocation encodings and additionally reject mutable-current-total, missing released/leg/scheduler/maxima or non-total terminal schemas; no defaults/downgrade |
| `0.149.0` | Pentest finding intake, severity, dependency graph, ownership, and immutable remediation ledger | Completeness/triage/ownership checks only; remediation waves are `0.149.1–0.149.3` |
| `0.149.1–0.149.3` | Authority/tenant, storage/recovery, then external-boundary remediation and final retest | Every wave fixes and independently retests one finding family with zero unresolved critical/high issues |
| `0.150.0` | Final production-readiness candidate | Prove install/upgrade/restore/failover continuity for independent retirement and empty bootstrap, mutually exclusive external terminal state, governed one-slot cost succession with exact logical/physical conservation and bounded parent verification beside protected terminalization, two heads, atomic transfers, universal locking and rollback-safe reclaim |

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
- Production settlement recovery supports only the complete authenticated
  two-head format. The compatibility matrix explicitly lists every singular-
  head representation as unsupported; restore, migration and import quarantine
  it before authority mutation and make no conversion or genesis claim.
- Every production migration/import is one destination-local, durable and
  fenced `MigrationImportWorkBudgetV1` job. Its immutable operation key and
  frozen profile bind source, destination, schema/manifest, principal,
  workload/boot continuity and lease/fence; cumulative byte/item/crypto/proof/
  temporary-storage/staged-row/open-stream/checkpoint/retry/elapsed/cleanup and
  concurrent-job counters never reset across crash, retry, reconnect, failover,
  restore or adapter-native retry. Pessimistic precharge and admission-time
  staging/verification/result/cleanup reservations keep work bounded. Typed
  exhaustion leaves the source unchanged and destination unready, permits only
  digest/metadata quarantine, and finishes through protected non-borrowable
  Recovery capacity. Only an explicitly authorized, predecessor-bound successor
  profile can increase limits.
- Production import cutover is governed by VIT-INV-062 and VIT-LAW-009. Trusted
  code derives the exact owner manifest from schema/migration authority plus
  the currently admitted VIT-LAW-009 manifest and authenticated dependency
  closure; no separate invariant catalog or importer input can select owners.
  The manifest types VIT-INV-062 as live non-importable coordinator and the
  remaining applicable entries as domain contributors. Owner-held capabilities
  authenticate dormant domain receipts, while the registry has verify-only
  access. Explicit admission makes independent candidate-bound authority
  Issued. Target-scoped revocation creates RevokedBeforeAdmission when absent
  or RevokedUnused when Issued and cannot expire before its target authority;
  delayed admission joins its tombstone. Job/barrier and every domain-owner
  guard are co-located; one fixed-order transaction rederives roles, rechecks
  job/budget/fence/receipts/authorization/owner versions, consumes authorization
  and activates all domain generations plus barrier/result/audit/outbox or none.
  Pre-activation failure permanently fences the candidate, prepared state never
  authorizes, response-loss retry is idempotent and cleanup cannot promote or
  delete authority. Live VIT-INV-062 control state remains outside staging;
  nonterminal source jobs/cycles/collisions deny, terminal history is inert
  post-activation archive only, and coordinator schema uses a separate
  predecessor-owned bootstrap.
  Remote/cross-region selector cutover is unsupported.
- Immutable versioned provider execution profiles bind every transmitted
  operation to its exact claim, tenant/provider/account/action/request/
  destination and scoped opaque secret handle. Executors hold no master-key
  ring or general write authority, use least-privilege short-lived credentials,
  enforce allowlisted TLS/DNS/redirect-safe egress, run in documented bounded
  pool trust domains, and publish their residual compromise radius. One
  authoritative lineage owns monotonic profile/account/credential/broker-policy
  epochs and revocation/restore ordering. Typed control-plane lifecycle commands
  require signed exact-digest admission, semantic expansion review, risk owner,
  quorum/separation, current activation fences, and revocation tombstones.
  Remote rotation is a provider-evidence-driven state machine: local successor
  activation alone is atomic, permanently disables predecessor redemption, and
  unknown provider creation/revocation reconciles under overlap/escalation
  deadlines. One credential-lineage owner and guard serialize rotations; stable
  rotation/generation/idempotency/digest identity, provider-inventory takeover,
  quarantined orphan cleanup, late-callback fences, and provider-credential-
  count quota accounting survive restore. Fresh credential-capability snapshots
  and monotonic local epochs bind raw/normalized policy, evaluator and provider
  language versions, canonical equal/subset/superset/incomparable/unknown result,
  explanation, provenance, profile, and credential. Only equal or an explicitly
  admitted exact-operation-safe subset operates. Superset, incomparable, or
  unknown quarantines the whole credential, invalidates all pending authority,
  emits an incident, and cannot be automatically widened or break-glass
  promoted. A signed binary/corpus-admitted evaluator lineage and never-reused
  epoch govern the evaluator itself; activation/revocation immediately makes old
  snapshots require re-evaluation and incompatible nodes reject startup.
  Quarantine exits only through owned investigation/remediation and verified
  replacement or revalidation using current evaluator/provider/epoch/
  consistency and separated-resolver evidence. Resolution creates a new
  capability generation and never revives earlier work. Rotation/takeover uses
  an independent cleanup-only remediation credential/channel with its own
  profile/lineage/approval/audit/quota; providers lacking one are explicitly
  manual-recovery-only. Non-exportable signing/mTLS/
  HSM exposes operations only. Bearer/API-key profiles put authorization
  serialization, redirects, TLS, claim, and socket inside the hardened broker/
  executor TCB; temporary bearer bytes are covered by explicit memory canaries
  and never reach upstream, plugin, queue, general connector, or durable state.
- Identical mandatory conformance for supported production storage profiles;
  SQLite remains limited to its documented single-node profile.
- Production topology authorization proves independently provisioned,
  non-borrowable normal/recovery/break-glass ingress resources under an
  aggregate ceiling; server-controlled ingress routing without authorization;
  sole VIT-INV-061 mapping ownership with emergency-promotion separation of
  duties; and a two-stage presentation protocol. Stage one commits the
  non-refundable presentation debit, bounded internal evidence, sequence and
  awaiting disposition atomically before any protected lookup, or ledger
  saturation commits none of them. Four closed terminal kinds are irreversible;
  checkpointed compaction preserves the original kind and result/evidence
  commitment. Stage two consumes that evidence, rechecks the mapping
  generation, and commits one local atomic original-claim/reservation/request-
  and-issuance-sequence/receipt/idempotent-result/outbox success transaction.
  Durable charge rows, bytes, awaiting records, checkpoint backlog,
  checkpoint/archive I/O, and compaction workers are non-borrowable by
  Normal/Recovery/BreakGlass lane below aggregate disk/work ceilings; stage one
  reserves its own lane's lifecycle work, so Normal or break-glass saturation
  cannot block Recovery.
  VIT-INV-061 activates those limits only through an immutable capacity-profile
  successor with governed expected-version CAS, mandatory PendingDrain for
  every overflow-safe typed canonical reduction, and authenticated physical
  provisioning evidence. Restore selects active state from the greatest
  authenticated committed activation record, separately restores pending
  state/fence and lineage/activation high-watermarks, and never revives an
  older larger numeric ceiling.
  Every PendingDrain action, including Normal-only drain, requires one exact
  current deployment/tenant/action/predecessor/successor/diff/coverage/policy/
  approval-bound authorization with SoD, expiry, nonce, idempotency and replay
  protection; activation uses a separate action authorization binding the
  installed begin-drain authorization and rechecks both, while rejection/
  abandonment is separately authorized and audited.
  Pending drain installs a canonically derived lane/aggregate durable fence.
  New stage-one work must satisfy active and successor lane/aggregate profiles
  under fixed row locking or fail before debit with a typed
  draining result; existing obligations retain completion capacity. Activation
  or authorized rejection consumes the exact fence under expected-version CAS,
  only atomic installed/consumed events exist, and failover/restore cannot lose,
  duplicate, bypass or independently invoke it.
  Successful activation atomically commits a canonical non-wrapping
  predecessor-linked activation record with active head, supersession,
  activation, optional fence consumption/event, audit, idempotent result and
  outbox. Authenticated checkpoints preserve the complete activation head and
  active/pending/fence tuple before deletion; gaps, forks, reorder, duplicates,
  active-row disagreement or high-watermark rollback fail closed.
  Crash or mapping drift leaves the first charge spent, allocates no logical
  request, and requires a new retry charge. Settlement remains all-or-none
  against the original counters.
  Every first-seen canonical request has a stable request sequence and exact
  retry outcome; denied history checkpoints before deletion, stays historical
  after compaction, fails closed on missing proof, and has bounded storage/
  archive/verification work.
  Lineage revoke/supersede and timeout cannot free a live receipt. Immediate
  receipt revocation requires VIT-INV-060 consumer fencing and an authenticated
  canonical closed-outcome terminal envelope the issuer cannot forge;
  `Reconciling` never releases and consumer sender credentials never enter the
  issuer. Canonical caller sub-limits and
  bounded range-root/chunk decoding and verification remain mandatory.

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
  rejection, typed target fence, target deletion/merge/migration/supersession/
  restore race, stale projection/cross-shard placement, target substitution,
  remote provider/account/resource/validator binding, weak/strong/ABA
  semantics, conditional downgrade/ignore, refresh prohibition, typed
  precondition failure, response-loss ambiguity, reviewed unconditional
  exception owner/scope/approval/time/attempt/epochs, co-located guard,
  revocation/expiry/supersession/provider-capability/final-attempt races,
  retry/restore behavior, immutable redemption/transmission deadline,
  current-fence start claim, globally unique claim/exact worker instance/lease
  generation/fence/effect/audience/provider/request/permit-digest binding,
  trusted executor co-owning claim plus provider socket, immutable authenticated
  instruction/status-only split protocol, sealed non-`Clone`/non-serializable
  consumed-by-value permit, digest-as-evidence-only, at-most-once process-local
  return, status-only replay, shared-credential duplicate workers/instructions,
  claim-response loss, executor failover/compromise, permit transport/log/core-
  dump exposure, takeover, reconstruction/restore, long pauses, clock rollback,
  uncertain-start no-retry, arbitrary unclaimed provider socket/credential use,
  handle/account/cross-tenant substitution, master-key/general-write rejection,
  unrestricted shared-credential rejection, allowlist/TLS/DNS/redirect/general-
  proxy bypass, profile/account/credential/broker epoch rollback/ABA/restore,
  unauthorized/self-approved profile activation, semantic expansion, stale
  approver/account/policy fence, delayed activation after tombstone, emergency
  replacement activation, every rotation crash and unknown-response point,
  duplicate creation, eventual consistency, continued old-key validity, overlap/
  deadline, single-key outage, restored dual redemption, simultaneous rotations,
  unknown-state successor, rotation/idempotency/digest substitution, timeout-
  then-provider-create, late callback, unauthorized takeover, orphan handle/
  revocation-loss/restore, provider credential-count exhaustion, out-of-band
  permission expansion/reduction, wildcard/`NotAction`, explicit deny, resource/
  tag/time/network/identity/session conditions, boundaries/organization policy,
  role/group/cross-account trust/inheritance, evaluator or policy-language
  downgrade, complexity-budget exhaustion, raw/AST/result/explanation mismatch,
  unsigned/wrong-binary-or-corpus evaluator activation, evaluator epoch rollback,
  security-fix/semantic/corpus upgrade, emergency revocation, partial
  re-evaluation, mixed incompatible node, old snapshot surviving evaluator
  revocation, non-privileged use while quarantined, safe-subset without explicit profile,
  claimed-work quarantine race, automatic widening, break-glass promotion,
  generic administrator clear, incident-only closure, weak/stale resolution
  evidence, missing consistency barrier or resolver separation, pre-resolution
  handle/receipt/queue/effect revival, same-credential revalidation without a new
  capability generation, sole-key quarantine, remediation-credential compromise,
  derivation/circularity/business-operation abuse, cross-tenant substitution,
  remediation response loss/outage/count exhaustion, provider with no
  independent path claiming automatic recovery, callback reorder, stale polling,
  wrong policy validator, restored snapshot/cleared quarantine, signing/mTLS/HSM key
  export, bearer HTTP/TLS/redirect/log/diagnostic/crash/core-dump/swap escape,
  caller-owned bearer claim/socket, and worker confused-deputy attempts.
- Every untrusted parser is fuzzed; cryptography is independently reviewed;
  plugin escape and AI injection/tool-abuse suites pass.
- Atomic audit-intent crash tests, protected-read release receipts, exact
  interchange conformance, effect authorization/revocation races, quota
  all-or-none canonical claim-set reservation, exact immutable token/digest/
  membership consumption, overlap deadlock/livelock freedom, whole-set restore/
  quarantine, single-partition placement, hierarchical capacity-lease
  per-kind encumbrance across expiry/reclamation/failover/transfer/late evidence,
  receipt-idempotent capacity-transfer state over at-least-once delivery,
  authenticated acknowledgement and old-epoch fence proof, conservative double-
  entry conservation, original transfer lineage, immutable owner/hierarchy/
  parent/period/lane/class/region/authorization binding, no cross-class adjustment,
  existing-capacity class immutability, forbidden protected-to-business
  transitions, one-parent capacity-policy lineage with co-located parent-ledger
  CAS, base/parent high-watermark/exact-delta/simulation binding, independent
  floor capability/history/reduction receipts, operational fences/obligation
  simulation, stable platform-floor profile ID/version/digest and durable fully
  typed key/admission epoch/high-watermark covering owner/root, `QuotaKind`,
  unit/scale, period, lane/class, region/residency, and settlement-policy
  version; total overflow-checked key migration; strict mixed-version floor; lower-node
  startup rejection, governed higher-floor migration, downgrade/rollback/
  restore/lower-default no-release behavior, floor-policy cross-command
  separation, root-owned canonical parent manifest/membership epoch, complete
  bound preparations, total conservation, root finalization as permission only,
  exactly one monotonic active rollout generation, permanent atomic successor
  supersession, complete-successor rollback over current actual limits, typed
  cancellation versus partial-activation supersession, rejection of late or
  restored superseded messages,
  direct cancellation only before preparation, one complete root-owned recovery
  successor after preparation, conservative prepared parents with no independent
  restore, idempotent restore-safe recovery receipts, current ledger/floor/
  obligation/authority rechecks, and overdue-recovery escalation,
  fresh local parent activation CAS over ledger/unallocated capacity/floor/
  obligations/root/current fences, conservative blocked/reconciliation state on
  drift, current delayed-transition authority, and emergency/security-cleanup/
  reconciliation isolation,
  canonical composite lock order and bounded identity-preserving retry,
  active/active authoritative-write rejection, per-kind settlement, exactly-once
  refunds, write-off separation, compensation claims, provider-outage fairness/
  emergency-reserve isolation, and selected semantic-index isolation/rebuild
  pass.
- Backup restoration, event integrity, projection/search rebuild, workflow
  continuation, disaster recovery, migration, rollback, load, soak, chaos,
  accessibility, localization, and secure-default tests pass. Migration/import
  tests attack millions of small records, decoded/crypto/proof amplification,
  temporary disk, staged rows, streams, cursor/checkpoint churn, response loss,
  reconnects, native retries, failover/restore, duplicate jobs, changed
  manifests and concurrent tenants/deployments. They prove counters and
  reservations survive every boundary, exhaustion prevents promotion and source
  mutation, quarantine remains digest-only, and Recovery cleanup converges
  within its reserved bound. Cutover tests race every failure, takeover,
  owner-version change and cleanup boundary; malformed or partial manifests/
  receipts, one-owner rejection, concurrent activation, response loss, failover
  after preparation and prepared/false-active restore expose the complete
  matching domain-owner set and canonical barrier result or no authority at all.
  They also reorder revocation before authorization admission, lose/delay
  authority through expiry, vary unrelated target sequences, present active or
  terminal source jobs and stable-ID collisions, attempt cyclic self-import and
  inert-history promotion, and interrupt coordinator bootstrap at every
  boundary. History-recovery tests prove closed action-tagged request/result
  decoding, activation-created zero-counter lineage, cryptographic NoHistory
  zero eligibility or custody-governed NotRequested, and atomic
  attempt/cumulative initial charges. Candidate, barrier and authorization bind
  that exact disposition/evidence/policy material. Every obligation has
  activation-created Healthy fence generation zero and every history path
  follows the universal fence-before-budget order. Tests prove exact-obligation corruption
  fencing on missing lineage, denial of append/recovery/cleanup while fenced,
  and clearance only by consuming independently admitted/revocable/expiring
  single-use authority within a proof budget while complete restoration covers
  every mandatory class/quorum in the current destination-ratcheted anchor
  registry and authenticated collection receipt derived from the independently
  governed source manifest; activation creates registry genesis. One fence-wide
  scope permits one live authorization/attempt, preserves lifetime precharges
  across replacements and tombstones Unprovable/Cleared/RebuildActivated.
  Publication-profile tests require the concrete linearizable fence port,
  authenticated receipt/status/finality and one tenant/deployment attempt slot;
  its per-transition map makes Activated/Aborted/PermanentlyUnresolved mutually
  exclusive, including abort before local activation. Independent signatures,
  independently writable terminal journals, forked status, shared-profile
  enumeration and inferred in-place root recovery fail closed. Root loss/full
  compromise uses independently authenticated Pending→Retired or
  EvidenceUnavailable retirement; the latter permits empty new-identity
  bootstrap but permanently quarantines old custody. Backend cost-profile tests
  govern lineage/head/high-watermark/classification and destructive weakening,
  analytically compare the complete size domain and require complete atomic
  destination re-cost before backend/schema activation.
  Parent/child capacity tests fault every debit/credit and allocation/release,
  requiring one immutable transfer and the Recovery parent equation, including
  completion reserves. Restore uses aggregate counters, exact membership,
  predecessor checkpoints and protected cursor/budget streaming; affected
  partitions stay VerificationPending or Fenced rather than scanning
  unboundedly or mutating before Ready.
  Typed restoration algebra uses checked maxima only for comparable consumed-
  work G-counters, exact ceilings, derived remaining, causal head selection and
  one consistent balance/reservation snapshot. Stale/incomplete/unanchored
  lineage remains fenced. One rebuild parent permits bounded retryable proposal
  attempts, independently authorized permanent rejection and exactly one
  successor namespace while retaining the old evidence.
  Every transition in the total six-state table, Issued-only expiry, typed no-write NotAdmitted,
  one closed operation outcome including Fenced and three-variant changed-
  material conflict envelope, sole-tag action authority
  and derived-index verification pass. Races prove CAS-loser reread/reapply,
  admission followed by revocation/expiry where applicable, and one first
  terminal winner without treating a different valid operation as changed
  material. Complete revocation authentication/time binding,
  expiry-winner preservation, the platform hard maximum and no amendment path
  remain mandatory. Custody-free NotRequested, false NoHistory, disposition
  substitution, missing/lazy lineage or fence genesis, absent-as-Healthy, lock
  inversion, generation rollback, widened/bypassed fences, forged clearance,
  competing live grants, fence-lifetime proof reset or terminal-scope bypass,
  missing/lazy registry genesis, source/quorum/nonresponse/time/continuity
  weakening, stale registry or omitted anchor class, collection-receipt forgery,
  temporary-evidence retry loop, worker takeover race, mixed-snapshot/field-wise
  state join, parent-consuming invalid proposal, inferred permanent rejection,
  duplicate successor or dual-current archive, split charges,
  guessed expiry tombstones, adapter-specific outcomes/conflicts or
  Fenced-as-conflict,
  outer/payload contradictions,
  unknown/mixed/inapplicable fields, index corruption, policy capacity creation,
  old-backup reset and remote-effect inference fail before authority mutation.
- Reproducible signed artifacts, checksums, SBOM, provenance, license report,
  and exact source/tool inputs are complete.

### Exit Criteria

No acceptance criterion is waived merely to meet a date. The exact
`v1.0.0-rc.N` candidate must be stable under the complete gate and external
review; any code or artifact change creates a new candidate. Only then may the
final unchanged candidate be considered for `v1.0.0` promotion after explicit
maintainer authorization. Run final pentest for the exact candidate commit and
artifacts before any tag is created.
