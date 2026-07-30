# Release Granularity Standard

Status: normative planning and implementation-entry policy

## Canonical Version Shape

Vitheim has 425 exact planned release stops:

- 424 independently implementable pre-production minor releases,
  `0.1.0–0.424.0`; and
- one serious production release, `1.0.0`.

Every planned capability, authority change, adapter, option decision,
certification campaign, and production-hardening boundary receives its own
`0.N.0` release. Planned work never uses a patch number merely because it was
discovered after a neighboring milestone.

This numbering preserves the existing dependency order and exact stop count.
It does not make the complete planning catalog a serial requirement for the
selected `1.0.0` profile. The
[Implementation Convergence Plan](IMPLEMENTATION_CONVERGENCE_PLAN.md) still
selects the mandatory transitive closure and explicit optional profiles.

## Patch-Version Policy

`0.N.P`, where `P > 0`, is reserved for corrective maintenance after `0.N.0`
has an implementation commit:

- security-finding remediation;
- a defect fix that preserves the release's authority and support envelope;
- documentation or packaging correction tied to that exact implementation; or
- compatibility repair that does not add a capability or widen a claim.

A patch may not introduce an independent aggregate, state machine, adapter,
external trust boundary, schema authority, product module, support profile, or
certification campaign. Such work receives the next unused minor release and a
new exact-commit pentest. Patch releases are created when needed and are not
preallocated in the architectural roadmap.

## Small-Pass Admission Certificate

Before any planned release moves from `Specified` to `Implementing`, its owner
must record one checked
[`ImplementationWorkPackageV1`](IMPLEMENTATION_WORK_PACKAGES.md) containing:

1. one dominant authority owner, or `none` for a pure adapter/decision/
   certification release;
2. one primary state transition, adapter boundary, option decision, or
   evidence question;
3. the exact crates and files expected to change;
4. at most one independently meaningful schema/migration transition;
5. at most one new external trust/admission boundary;
6. the positive, negative, property/model, fuzz, crash, restore, compatibility,
   and operational tests applicable to that boundary;
7. rollback, refusal, and unsupported behavior;
8. the exact pentest question and attack-surface delta; and
9. an explicit list of neighboring requirements that are not part of the
   release.

The work package fails admission when two entries in any category could ship,
fail, roll back, or be pentested independently. The remedy is a new minor
release, not a larger pull request or a broader pentest report.

The line-oriented record and model-binding registry make this admission rule
machine-checkable. The checker verifies shape and single-unit assertions; human
review still verifies that the exact code/schema diff does not conceal a second
independently shippable boundary.

## Cumulative Ledger Rule

Several phase documents intentionally retain long security ledgers. Their
length preserves threat, invariant, recovery, and cross-version context; it
does not assign all surrounding prose to the heading release.

For a cumulative ledger:

- the release title, focused release-plan row, scope-audit allocation, and
  implementation-entry work package define the executable slice;
- successor minor releases own every separately allocated authority or
  conformance slice;
- a family-level `Goal`, `Deliverables`, `Verification`, or `Exit criteria`
  section is an eventual family contract;
- no implementation commit may satisfy future releases early and then reuse
  one pentest report; and
- a checker passing against planning prose is not implementation evidence.

The largest retained ledgers are already divided as follows:

| First release | Focused successor releases | Executable boundary |
| --- | --- | --- |
| `0.23.0` | `0.28.0–0.29.0` | quota vocabulary, admission, then settlement/recovery |
| `0.24.0` | `0.30.0–0.32.0` | bundle schema, command/consumer, timer/activity, then poison certification |
| `0.25.0` | `0.33.0–0.35.0` | declarations, ownership, law admission, then executable realization |
| `0.46.0` | `0.47.0–0.51.0` | capability vocabulary, static/runtime admission, lineage, recovery, refusal |
| `0.52.0` | `0.53.0–0.56.0` | harness, destructive atomicity, tenant isolation, HA matrix, correspondence |
| `0.66.0` | `0.67.0–0.71.0` | migration plan, execution, fencing, activation, recovery, history |
| `0.72.0` | `0.75.0–0.86.0` | manifest, export/import, activation, custody, corruption, cost, witness |
| `0.73.0` | `0.87.0–0.88.0` | queue semantic port, scheduling, then recovery/conformance |
| `0.151.0–0.155.0` | `0.156.0–0.210.0` | tenant assurance first; advanced domain retirement split by authority |
| `0.239.0` | `0.240.0–0.244.0` | worker fencing, takeover, integration, topology, contribution certification |
| `0.371.0` | `0.382.0–0.384.0` | crypto choice, then transport/time, KMS, and build-input freezes |
| `0.372.0` | `0.385.0–0.390.0` | storage selection, then isolation, atomicity, migration, recovery, promotion, truth |
| `0.376.0` | `0.391.0–0.393.0` | deployment shape, then HA, regional/DR, operational authority |
| `0.381.0` | `0.394.0–0.396.0` | witness decision, then bootstrap, capacity transfer, operationalization |
| `0.399.0` | `0.400.0–0.403.0` | packaging, startup, topology bootstrap, replay budgets, drains |
| `0.406.0` | `0.407.0–0.408.0` | HA model, owner failover, then service recovery |
| `0.410.0` | `0.411.0–0.414.0` | backup custody, restore, DR, lifecycle certification, then default dynamic-retirement refusal/history certification |
| `0.415.0` | `0.416.0–0.417.0` | load limits, soak/fairness, then chaos/recovery |
| `0.420.0` | `0.421.0–0.423.0` | finding intake, authority, storage/recovery, integration and final retest |

## Certification And Decision Releases

A certification release may cover a broad system matrix only when it
implements no missing product behavior. Its single outcome is whether the
already implemented exact profile passes or remains unsupported. Any missing
handler, migration, recovery path, authority record, or adapter discovered by
the campaign becomes a later corrective or minor implementation release; it is
not smuggled into the certification commit.

An option-decision release similarly freezes one decision family from existing
evidence. It cannot be the first implementation of the technology being
selected and cannot turn a planned capability into Supported.

## Pentest Boundary

Each implemented `0.N.0` stops at one unchanged candidate commit for its own
pentest. Findings are fixed in one or more corrective `0.N.P` releases, each
with proportionate retest evidence. A later minor release reruns applicable
regression suites but never treats an earlier pentest as coverage for its new
authority or trust boundary.

## Ongoing Size Review

Line count is a warning signal, not the sizing decision. The decisive questions
are whether the release has one owner, one irreversible boundary, one rollback/
refusal story, and one coherent pentest question. Scope is re-audited before
implementation and whenever design work introduces a new independently
shippable authority, adapter, migration, or external boundary.
