# Active Law Catalogs

Status: normative runtime-catalog plan introduced by `0.18.3`

The planning superset in `docs/LAW_MANIFEST_ADMISSIONS.md` is never admitted
directly. `VIT-INV-057` owns the single global
`LawManifestAdmissionSetV1` lineage. Distinct `VIT-INV-058` local owners admit
that lineage into exact enforcement-partition placement generations and retain
monotonic catalog, distrust, identity-fence, and validity-time ratchets.
`VIT-INV-059` separately owns durable multi-partition rollout coordination.
None of these transaction domains may update another's authority row.

Every active catalog is immutable and complete for all law generations
effective at its activation floor. It contains no generation effective after
that floor. A catalog remains applicable until the global owner explicitly
activates its successor; there is no maximum-platform-version field and a
platform version alone cannot silently supersede a catalog. At any
implementation milestone, the applicable planned catalog is the catalog with
the greatest activation floor not greater than that milestone. The checked
schedule proves exactly one such catalog for every milestone from `0.18.3`
through `1.0.0`.

Activation requires global expected-version CAS, a strictly increasing epoch,
the predecessor's verified envelope digest, compiled semantic realization, and
successful local admission. A cryptographically trusted tuple is not
activatable before its generation is effective and realized. Partial rollout
is an explicit degraded state: nodes that have not admitted the active global
epoch are unready for law-bearing dispatch or transmission start.

## Canonical Active Payload

`LawManifestAdmissionPayloadV1` contains these fields in exact order:

1. format literal `vitheim-law-manifest-admission-payload-v1`;
2. catalog ID and strictly increasing epoch;
3. predecessor envelope digest or `none` for the first active catalog;
4. activation floor as strict numeric SemVer;
5. product, edition, and compatibility scope;
6. sorted, unique tuple count and complete
   `(LawId, Generation, ManifestDigest)` ancestry;
7. payload digest.

The payload digest uses the project length-prefixed canonical encoding over
fields 1–6 and every tuple. It excludes itself, presentation, and signatures.
The tuple set must equal the latest generation of every law effective at the
activation floor plus every predecessor; omission and future inclusion both
fail closed.

The initial scope contract is exact rather than descriptive:

- product scope: `vitheim`;
- edition scope: `vitheim-core`;
- compatibility scope: `vitheim-platform-law-v1`.

A scope change requires a new catalog epoch and an explicitly reviewed scope
contract. A verifier supplied with a different build product, edition, or
compatibility expectation rejects the artifact even when all digests and
signatures are otherwise valid.

## Canonical Trust Envelope

`LawManifestAdmissionEnvelopeV1` content-binds these fields in exact order:

1. format literal `vitheim-law-manifest-admission-envelope-v1`;
2. exact profile enum: `CompiledCatalog` or `SignedCatalog`;
3. payload digest and predecessor envelope digest;
4. catalog ID, epoch, and activation floor;
5. product, edition, and compatibility scope;
6. validity policy enum (`NoExpiry` or `BoundedWindow`), canonical
   not-before/not-after values, and `maximum_time_uncertainty_ns`;
7. signer/key ID, signature profile, and trust-root epoch;
8. revocation policy and successor policy;
9. envelope digest.

The envelope digest uses length-prefixed canonical encoding over fields 1–8.
For `NoExpiry`, both times and `maximum_time_uncertainty_ns` are exact `none`
literals. For `BoundedWindow`, the times are ordered canonical timestamps and
the maximum uncertainty is a positive canonical integer within the selected
platform ceiling. For `CompiledCatalog`, signer/key/signature fields use exact
`none` literals and artifact provenance authenticates an envelope digest
compiled into the release. For `SignedCatalog`, none of those fields may be
`none`; the dedicated platform-law key signs the domain-separated envelope
digest. Trust roots arrive through compiled provenance or a separate
authenticated ceremony, never mutable catalog storage. Signature bytes are
outside the digest but bind its exact value. No hybrid profile or
profile-inapplicable field spelling is accepted.

Revocation and emergency distrust advance the global lineage even if no
successor can activate. A successor binds its predecessor's recomputed,
verified envelope digest. Restore accepts neither an older global epoch nor a
catalog below a local ratchet and cannot reconstruct profile, signer,
trust-root epoch, validity, scope, revocation, or successor authority from
database content.

## Trustworthy Bounded-Window Time

`BoundedWindow` is usable only through `VIT-CAP-058`, an admitted
`TrustedCatalogTime` capability returning a conservative
`[earliest, latest]` interval, uncertainty, continuity/boot identity, and
rollback/suspend evidence. The platform ceiling for uncertainty is frozen at
`0.140.1`; an envelope may select an equal or tighter bound. Admission and
every readiness, dispatch, and transmission-start recheck require:

```text
earliest >= not_before
latest < not_after
reported_uncertainty <= envelope_maximum <= platform_maximum
```

The local `CatalogAdmissionRatchetRow` persists the greatest admitted catalog
epoch/digest, greatest distrust epoch, last observed trusted lower bound, time
continuity identity, and expired-window tombstone. A lower time bound, clock
rollback, lost continuity, unaccounted suspend/resume, excessive uncertainty,
or unavailable trustworthy time fails closed and requires time re-attestation
before the node becomes ready. Suspend-aware sources must include suspended
duration; other sources lose continuity on resume.

Restore merges the greatest externally retained/local ratchet before catalog
use and obtains a fresh trusted interval. It never restores an older time
observation to extend a window. Once the trusted interval proves expiry, the
local tombstone and global revocation/distrust processing dominate backups. If
current trustworthy time or the non-rollback recovery ratchet is unavailable,
a bounded catalog remains unusable. `NoExpiry` avoids a time availability
dependency but not catalog epoch, digest, revocation, or distrust checks.

## Canonical Local Admission Owner

The ownership grain is one logical enforcement-partition placement generation,
not an interchangeable host, pod, process, or copied database row. The
canonical `CatalogAdmissionOwnerKeyV1` is:

```text
(DeploymentId, RegionId, ServiceRole, EnforcementPartitionId,
 PlacementGeneration)
```

The current placement manifest allocates each key exactly once. A local
`CatalogAdmissionRatchetRow` and every prepare/admission/convergence receipt
bind the complete key plus:

1. the current topology and placement-manifest generations;
2. an authenticated, non-clonable `WorkloadIdentity`;
3. fresh `BootOrContinuityId`;
4. binary capability-profile digest;
5. complete semantic-realization-set digest;
6. catalog epoch and envelope digest;
7. previous admitted local epoch and digest;
8. local fencing token and global/rollout owner fences; and
9. receipt ID, rollout ID, typed disposition, and canonical receipt digest.

The selected workload-identity profile must prevent two live runtimes from
presenting the same owner identity. A cloneable bearer identity, disk-derived
identity, or host name alone is unsupported. A cloned disk, restored VM,
duplicated pod, copied partition database, or replacement process receives no
usable authority from the copied ratchet: its workload/continuity identity,
placement generation, and current owner fence do not match. Replacement or
region movement increments `PlacementGeneration`, permanently fences the old
key, obtains a fresh identity and boot/continuity binding, and performs a new
admission from a verified global rollout receipt. Rollback cannot make a
predecessor placement current again.

## Durable Distributed Rollout

`0.18.3` introduces `VIT-INV-059`/`VIT-LAW-008` and the durable
`LawCatalogRolloutRootRow`; `0.18.4` uses it for the first real successor.
`LawCatalogRolloutId` is globally unique. Its immutable
`CatalogPlacementManifestV1` binds the candidate catalog ID/epoch/envelope
digest, predecessor epoch/digest, topology generation, sorted required local
owner keys, required binary capability and semantic-realization profiles,
activation policy, deadlines, global/local owner fences, and manifest digest.
Changing membership or any bound requirement creates a successor manifest
generation; an in-flight manifest is never edited.

The closed rollout states are:

```text
Candidate -> Preparing -> GloballyActivated -> Converging -> Completed
                    \-> Blocked
Candidate/Preparing/Blocked(pre-activation) -> Abandoned
any nonterminal state or Completed -> Revoked
```

`Blocked` records its source phase and may resume only that phase after the same
manifest's contradiction or availability issue is reconciled. After global
activation, abandonment is forbidden; the rollout must converge, remain
visibly blocked, or be revoked. `Revoked` and `Abandoned` are terminal.

The normal protocol is an at-least-once process manager, not a distributed
transaction:

1. candidate creation seals the catalog/placement manifest;
2. the rollout root enters `Preparing` and transactionally appends one outbox
   intent per required placement;
3. local inbox processing verifies identity, placement/fence, binary
   capability, semantic set, catalog bytes, predecessor local epoch, and time,
   then atomically records one idempotent `CatalogPrepareReceipt`;
4. the rollout root admits receipts by exact identity/digest and issues one
   activation-authorization receipt only when policy is satisfied;
5. `VIT-INV-057` consumes that receipt in its own expected-version activation
   CAS and emits the authoritative global-activation receipt;
6. the rollout root consumes that receipt, enters `GloballyActivated`, emits
   activation deliveries, and enters `Converging`;
7. each `VIT-INV-058` owner admits the active global epoch and emits one
   `CatalogConvergenceReceipt`; and
8. the root reaches `Completed` only after every policy-required current
   placement receipt is present and freshly revalidated.

`0.18.3–0.140.6` supports `AllRequired`: every placement in the sealed current
manifest must prepare and converge. A `FencedQuorum` profile is unsupported
unless `0.140.6` explicitly selects it after proving that every unprepared
placement is durably fenced before global activation and cannot regain
readiness from cached state. A numeric quorum without that fencing is invalid.

Join, leave, replacement, service-role change, region movement, partition
split/merge, and topology-generation changes fence the old placement
generation and block an affected in-flight rollout. Reconciliation seals a new
manifest or completes only when the original manifest is still exactly current.
No receipt crosses rollout, topology, placement, workload, boot/continuity,
binary, semantic, catalog, predecessor, or fence generations.

Revocation and emergency distrust bypass candidate preparation. The global
owner advances distrust first and transactionally emits high-priority
revocation deliveries. Connected local owners ratchet immediately. An
unreachable placement cannot perform the required current-global-authority
recheck and is therefore unready; cached admission is insufficient. Revocation
reconciliation continues until every current placement has a receipt or is
durably fenced. Missing, late, duplicate, or contradictory receipts move the
root to `Blocked`, retain conservative readiness, and trigger a bounded
deadline escalation with operator-visible evidence.

Recovery replays transactional outbox/inbox state, re-reads the global owner,
current topology/placement manifest, and every local owner, and resumes from
durable receipts. Crash injection covers before and after manifest seal,
prepare outbox commit, local receipt commit, root receipt admission, activation
authorization, global CAS, global receipt delivery, local convergence, final
receipt admission, completion, topology change, revocation, abandonment, and
every response-loss boundary. Duplicate/reordered delivery is idempotent;
ambiguous state never invents preparation, activation, convergence, or
revocation completion.

## Project-Owned Artifact Verification

`0.18.3` implements one `no_std` verification core used by startup, restore,
import, local admission, and the hosted
`vitheim-law-catalog-verify` release tool. The release tool must decode the
binary artifact through the canonical Rust codec and call that same core; CI
does not parse key/value text or accept field-shaped comments as evidence.
For every non-planned activation milestone,
`scripts/check_law_active_catalogs.sh` invokes the tool with the expected
catalog ID, epoch, activation floor, exact scope, profile, and actual
predecessor artifact.

The verifier:

1. rejects noncanonical/trailing/duplicate/unknown bytes and resource-bound
   violations;
2. recomputes payload and envelope digests from decoded typed values;
3. reconstructs and verifies the complete generation tuple ancestry against
   the compiled project generation registry;
4. compares the successor's predecessor digest with the predecessor artifact's
   recomputed envelope digest;
5. enforces every profile- and validity-specific `none`/required field rule;
6. compares `CompiledCatalog` with the release-compiled expected envelope
   digest, or verifies `SignedCatalog` with the separately admitted root,
   signature profile, key ID, and root epoch;
7. confirms the exact product, edition, compatibility, activation-floor, and
   build context supplied by the caller; and
8. returns a typed verified-catalog value or a typed fail-closed reason—never a
   partially trusted decoded structure.

Golden bytes and digests, bit flips in every field, truncation/trailing data,
tuple reorder/omission/substitution, forged self-consistent digests, wrong
predecessor artifact, profile-field confusion, compiled-digest mismatch,
invalid signature/root epoch, wrong scope, rollback, and bounded-time boundary
tests are mandatory. The CLI/runtime equivalence test feeds identical bytes and
context to both entry points and requires the same typed result.

The first catalog has a deliberately narrow bootstrap: its
`CompiledCatalog` payload/envelope, compiled expected envelope digest, and
`VIT-LAW-007@g01` realization are embedded in the reviewed artifact. Provenance
establishes the initial global owner row and each local admission row. Mutable
state cannot self-admit the law that validates it. The same bootstrap seeds the
empty rollout root and compiled `VIT-LAW-008@g01` realization, so the first
`0.18.4` successor is governed without circular self-admission. After that
seed, every activation, trust-profile transition, rollout, local admission, and
emergency distrust follows `VIT-INV-057`/`VIT-INV-058`/`VIT-INV-059` and
`VIT-LAW-007`/`VIT-LAW-008`; a transition to `SignedCatalog` additionally
requires the separately provisioned trust-root ceremony.

## Planned Runtime Catalog Schedule

The frontier column is compact notation for a complete ancestry closure. For
example, `VIT-LAW-001@g03` requires tuples g01, g02, and g03. Release tooling
materializes and hashes the full set. Each row's catalog remains applicable
from its activation floor until the next row is explicitly activated; the last
row remains applicable until an explicitly reviewed successor is added. The
artifact path and project-owned cryptographic verification become mandatory
when the activation milestone leaves planned status.

| Epoch | Catalog ID | Activation floor | Profile | Predecessor envelope contract | Required law frontiers | Canonical artifact |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | VIT-LAWCAT-ACTIVE-e001-v1 | `0.18.3` | CompiledCatalog | none | VIT-LAW-001@g02, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-005@g04, VIT-LAW-006@g01, VIT-LAW-007@g01, VIT-LAW-008@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e001-v1.catalog` |
| 2 | VIT-LAWCAT-ACTIVE-e002-v1 | `0.18.4` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e001-envelope-v1 | VIT-LAW-001@g02, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g01, VIT-LAW-007@g01, VIT-LAW-008@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e002-v1.catalog` |
| 3 | VIT-LAWCAT-ACTIVE-e003-v1 | `0.51.1` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e002-envelope-v1 | VIT-LAW-001@g03, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g02, VIT-LAW-007@g01, VIT-LAW-008@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e003-v1.catalog` |
| 4 | VIT-LAWCAT-ACTIVE-e004-v1 | `0.52.0` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e003-envelope-v1 | VIT-LAW-001@g04, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g03, VIT-LAW-007@g01, VIT-LAW-008@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e004-v1.catalog` |
| 5 | VIT-LAWCAT-ACTIVE-e005-v1 | `0.52.1` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e004-envelope-v1 | VIT-LAW-001@g05, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g04, VIT-LAW-007@g01, VIT-LAW-008@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e005-v1.catalog` |
| 6 | VIT-LAWCAT-ACTIVE-e006-v1 | `0.53.0` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e005-envelope-v1 | VIT-LAW-001@g06, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g05, VIT-LAW-007@g01, VIT-LAW-008@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e006-v1.catalog` |
| 7 | VIT-LAWCAT-ACTIVE-e007-v1 | `0.53.1` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e006-envelope-v1 | VIT-LAW-001@g07, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g06, VIT-LAW-007@g01, VIT-LAW-008@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e007-v1.catalog` |
| 8 | VIT-LAWCAT-ACTIVE-e008-v1 | `0.55.0` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e007-envelope-v1 | VIT-LAW-001@g08, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g07, VIT-LAW-007@g01, VIT-LAW-008@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e008-v1.catalog` |
| 9 | VIT-LAWCAT-ACTIVE-e009-v1 | `0.56.0` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e008-envelope-v1 | VIT-LAW-001@g09, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g08, VIT-LAW-007@g01, VIT-LAW-008@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e009-v1.catalog` |
| 10 | VIT-LAWCAT-ACTIVE-e010-v1 | `0.57.0` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e009-envelope-v1 | VIT-LAW-001@g10, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g09, VIT-LAW-007@g01, VIT-LAW-008@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e010-v1.catalog` |
| 11 | VIT-LAWCAT-ACTIVE-e011-v1 | `0.59.0` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e010-envelope-v1 | VIT-LAW-001@g11, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g10, VIT-LAW-007@g01, VIT-LAW-008@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e011-v1.catalog` |

`0.18.3` delivers the canonical codec, shared verification core, CLI, first
compiled artifact, exact local owner identity, split global/rollout/local
owners, durable process manager, and trusted-time interface. `0.18.4` verifies
the first actual predecessor transition through every rollout state and crash
boundary. `0.19.0` binds verified envelope digests, rollout manifest/receipts,
and local identity/ratchets into checkpoints.
`0.21.0–0.22.0` negotiate and destructively conform storage without making it a
trust root. `0.29.0–0.30.0` prove migration/import with the real verifier.
`0.140.1` freezes compiled versus signed profile, signature suite/root ceremony,
time source, and maximum uncertainty. `0.140.2` freezes separate global,
rollout-root, and local row placement. `0.140.6` freezes `AllRequired` or a
fully fenced quorum, topology evolution, distribution, failover, revocation,
time loss, and recovery. `0.145.0` proves backup/restore cannot clone a local
owner, invent a receipt, or roll back catalog/validity state. Phase O and
`1.0.0` require zero unresolved rollout receipts, identity clones, coverage
gaps, overlaps, future tuples, incomplete closures, unrealized semantics,
text-only artifact checks, or envelope fields outside cryptographic
verification.
