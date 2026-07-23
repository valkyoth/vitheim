# Invariant Ownership Registry

Status: normative planning registry introduced by `0.18.3`

This is the canonical index for authority-bearing invariants. Detailed phase
documents define behavior and test cases; they refer to stable IDs here instead
of creating a second owner. Before a milestone may exit, every invariant it
introduces or changes must have exactly one row, one authoritative owner, an
owner-maintained guard/update path, explicit transaction placement, semantic
storage requirements, all four test classes, and restore/migration obligations.

The table is deliberately machine-readable. Cells cannot be empty, contain
`TBD`, or name alternative owners. The required test markers are `P:` positive,
`N:` negative, `M:` model/interleaving, and `F:` fault/recovery. Storage
requirements begin with `requires:`; guard cells identify how the owner updates
the guard with `owner-updated:`; recovery cells contain both `restore:` and
`migration:`. `scripts/check_invariant_ownership.sh` enforces this schema and
the implementation-plan gate invokes it.

| Invariant ID | Owning stream or state machine | Transactional guard or authority row | Milestone introduced | Transaction-domain placement | Enforcement points | Applicable storage capabilities | Positive, negative, model, and fault tests | Restore and migration obligations |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| VIT-INV-001 | `ProviderPermissionEvaluatorLineage` | `ProviderPermissionEvaluatorEpochRow`; owner-updated: evaluator lifecycle transaction | `0.18.2`; registry `0.18.3` | provider evaluator control-plane partition | activation; readiness; snapshot commit; transmission start | requires: monotonic epoch CAS; signed-admission persistence; owner-row atomicity | P: activate admitted evaluator; N: stale output and incompatible node denied; M: revoke versus snapshot commit; F: restore and failover retain epoch | restore: reject epoch or lineage rollback; migration: preserve generations, tombstones, admission digests, and epoch |
| VIT-INV-002 | `ProviderCredentialCapabilityState` | `ProviderCredentialCapabilityEpochRow`; owner-updated: authenticated observation transaction | `0.18.2`; registry `0.18.3` | provider-account credential-capability partition | credential-handle issue; redemption; transmission start; reconciliation | requires: strong-validator persistence; monotonic epoch CAS; raw-evidence digest retention | P: fresh equal snapshot operates; N: stale, unknown, or mismatched snapshot denied; M: observation versus redemption; F: crash and restore cannot revive snapshot | restore: retain newest epoch and freshness evidence; migration: preserve raw/AST/evaluator/provenance bindings |
| VIT-INV-003 | `ProviderCredentialCapabilityState` | `CredentialCapabilityQuarantineRow`; owner-updated: capability owner transition | `0.18.2`; registry `0.18.3` | same provider-account credential-capability partition as VIT-INV-002 | handle issue; queue claim; credential use; quarantine resolution | requires: atomic quarantine/epoch transition; permanent tombstones; incident linkage | P: strong-evidence resolution creates new generation; N: partial or incident-only clear denied; M: quarantine versus first use; F: failover and restore retain quarantine and tombstones | restore: quarantine dominates older usable state; migration: preserve transition history, evidence, incident, and old-work tombstones |
| VIT-INV-004 | `ProviderCredentialLineage` | `ProviderCredentialRotationGuard`; owner-updated: lineage rotation transaction | `0.18.2`; registry `0.18.3` | provider-account credential-lineage partition | rotation create; successor activation; takeover; orphan reconciliation | requires: single-non-terminal uniqueness; expected-version CAS; quota co-location | P: verified successor activates; N: concurrent rotation and orphan redemption denied; M: takeover versus late callback; F: unknown response and restore retain guard | restore: retain non-terminal rotation, count encumbrance, and callback fences; migration: preserve IDs, digests, generations, and orphan state |
| VIT-INV-005 | `ProviderCredentialRemediationLineage` | `ProviderCredentialRemediationAuthorityRow`; owner-updated: remediation lifecycle transaction | `0.18.2`; bootstrap `0.18.5` | independent provider remediation control-plane partition | remediation admission; rotation/takeover redemption; cleanup quota; recovery ceremony | requires: independent credential/KMS binding; monotonic epoch CAS; quorum receipt persistence | P: separated quorum admits and rotates authority; N: business use, self-approval, and circular recovery denied; M: compromise versus redemption; F: simultaneous business/remediation loss and stale restore | restore: never restore older active authority over compromise/loss tombstone; migration: preserve ceremony, quorum, channel, epoch, and exercise evidence |
| VIT-INV-006 | `TransmissionStartClaimState` | `TransmissionStartClaimRow`; owner-updated: trusted executor claim transaction | `0.18.2`; registry `0.18.3` | effect execution partition co-located with current authority fences | immediately before provider I/O; replay/status; failover reconciliation | requires: unique claim CAS; worker/lease binding; authoritative-time deadline check | P: exact worker claims once; N: duplicate, stale fence, and permit transport denied; M: revocation versus claim; F: ambiguous claim response and executor failover do not retransmit | restore: permit is unreconstructable and claim remains consumed or unknown; migration: preserve claim, worker, lease, digest, deadline, and outcome state |
| VIT-INV-007 | `QuotaClaimSetState` | `QuotaClaimSetAuthorityRows`; owner-updated: quota-ledger transaction | `0.18.1`; registry `0.18.3` | one local quota partition shared with consuming work bundle | admission; dispatch; transmission; storage; settlement; reconciliation | requires: all-or-none multi-row transaction; canonical lock order; exact-token CAS | P: full set reserves and settles; N: partial set, member substitution, and cross-partition set denied; M: overlapping set acquisition; F: partial crash and corrupt restore quarantine whole set | restore: verify and restore complete set or quarantine it; migration: preserve ordered membership, digest, token lineage, units, and settlement state |
| VIT-INV-008 | `EvaluatorReevaluationJobState` | `EvaluatorReevaluationQueueRow`; owner-updated: scheduler transition transaction | `0.18.4` | tenant/provider/account scheduler partition with global fairness authority | evaluator replacement/revocation; dequeue; evidence fetch; evaluation; completion | requires: durable priority queue; stable job uniqueness; lease/fence CAS; fair-share counters | P: privileged fresh job completes; N: queued credential cannot use old output; M: repeated replacement versus running job; F: outage, crash, and failover resume from durable cursor | restore: retain current evaluator/job generations, cursors, attempts, and escalation; migration: preserve partition, priority, freshness, quota, and terminal identity |
| VIT-INV-009 | `ProviderCredentialRemediationLineage` | `RemediationRecoveryCeremonyRow`; owner-updated: separated recovery quorum transaction | `0.18.5` | offline recovery domain plus independent online remediation control plane | first bootstrap; rotation; compromise response; loss recovery; periodic exercise | requires: quorum receipt persistence; independent channel/KMS binding; monotonic recovery epoch | P: independent channels recover authority; N: self-recovery and dependent-channel bootstrap denied; M: rotation versus compromise declaration; F: provider-admin loss, KMS outage, and stale restore fail closed | restore: compromise/loss and recovery epoch dominate backups; migration: preserve channel independence, quorum, exercises, expiry, and manual-only limitation |

## Governance And Change Rules

- A phase document may explain an invariant but cannot rename its owner or
  transaction domain without changing this registry in the same commit.
- A new enforcement point must add a negative test. A new storage profile must
  prove every `requires:` capability used by its supported invariants or report
  the invariant unsupported during capability negotiation.
- An invariant split or owner transfer is a migration: it needs a new stable ID
  or an explicit supersession record, old/new owner fencing, mixed-version
  behavior, rollback rejection, and exact-commit security review.
- Backup, import, and migration tooling consumes this registry to build its
  monotonic-state manifest. Omitting a registered epoch, tombstone, guard,
  cursor, quota state, or recovery fact makes the operation fail closed.
- Phase O and `1.0.0` acceptance must report every selected production storage
  profile against every applicable invariant ID with no unowned or waived row.
