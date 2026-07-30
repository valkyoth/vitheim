# Law Manifest Admission Set

Status: normative planning-superset registry introduced by `0.25.0`

This file is the append-only planning superset of every reviewed
`(LawId, Generation, Digest)` tuple, including future generations. It is input
to release tooling and is never an active runtime catalog. Presence here proves
reviewed planning identity, not effectiveness, implementation, or activation.
Runtime admits only an immutable activation-floor catalog from
[Active Law Catalogs](LAW_ACTIVE_CATALOGS.md), whose tuple closure contains no
generation effective after its activation floor and which remains applicable
only until its verified successor is explicitly activated.

A valid manifest or planning-superset digest proves content integrity, not
runtime trust. Active catalogs use exactly one profile enum:
`CompiledCatalog` or `SignedCatalog`. The combined phrase “compiled or signed”
is a design choice description and is never serialized as an active profile.
`VIT-INV-057` owns global proposal, activation, succession, revocation,
emergency distrust, and active epoch/digest. `VIT-INV-058` separately owns each
local catalog/distrust/trusted-time ratchet. `VIT-INV-059` owns rollout proof
state, while dynamic topology is later owned only by `VIT-INV-060`.
Topology-mutation authorization issuance is separately owned by `VIT-INV-061`;
the topology owner can verify and consume but never issue its own permission.
Migration/import control state is separately owned by `VIT-INV-062`, while
`VIT-LAW-009` preserves each selected domain owner and permits activation only
for the exact contributor set derived by trusted code from the authenticated
dependency closure of the currently admitted destination `VIT-LAW-009`
generation and manifest, source/destination schemas, migration plan, and
contributor algorithm. No separate runtime invariant catalog or authority root
exists. The closure types VIT-INV-062 only as the live destination coordinator;
all remaining applicable dependencies are importable domain contributors.
Source coordinator state cannot replace, merge with or seed that live owner.
An importer-supplied owner list, pseudo catalog, or registry-created
owner receipt is never catalog or domain authority. Independently issued
single-use activation authority becomes Issued only through explicit admission.
An authenticated revocation creates a destination-local
`RevokedBeforeAdmission` tombstone when absent or CAS-transitions `Issued` to
`RevokedUnused`; both use one exact-target sequence lineage and the same row as
activation. Remote emission alone has no effect.
Every mutation also binds the current `MigrationImportCoordinatorGenerationV1`
and refuses a stale or omitted fence. Bootstrap begin, fresh checkpoint/receipt-
bound handoff and cancellation are distinct pre-admission-revocable actions
with exact results; their one action-discriminated revocation protocol has a
target-scoped sequence/lifetime and destination-only atomic effect, so
authority loss cannot strand the drain. Activation
atomically creates Pending plus zero-counter lineage, or explicit
NoHistory zero-eligibility proof or NotRequested custody record. Append is authenticated
and bounded, and cleanup waits for its
terminal checkpoint. Exhaustion remains ManualRecoveryPending until independent
recovery authority performs its exact action. RetryAppend cannot abandon,
cumulative lineage counters cannot reset or increase and initial ceilings fit
the platform hard maximum. Activation creates zero-counter lineage with every
Pending obligation; initial append co-charges it with the attempt budget, while
NoHistory proves zero eligibility and NotRequested carries a commit-time
custody/approval record. Missing lineage
commits an obligation-scoped corruption fence. Every obligation has an
activation-created Healthy generation-zero fence; absence denies and every
history operation follows the shared typed fence-before-lineage rank. Before
activation, an independently authorized manifest lineage creates one genesis
with separate operational-active and transition-candidate heads over
authenticated committed activation records. Its non-recursively anchored
publication profile, compatibility/distrust ratchet, external activation fence
port/receipt/status, one scoped attempt slot, fail-closed root loss and
protected attempt-completion reserve govern external transition
terminalization. Activation
binds the operational head, creates registry generation zero and reserves non-
borrowable control-state capacity under trusted profile/platform bounds.
Corruption control splits irreversible lifetime work from reclaimable physical
capacity, charges destination artifacts under a backend cost profile and pairs
child allocation/release with Recovery-parent debit/credit; archive plus exact
deletion precedes physical release. Clearance requires its
own admitted/revocable/expiring single-use authorization, destination-ratcheted
mandatory-class/quorum anchor registry and authenticated collection receipt.
A fence-wide scope admits one live authorization/attempt and retains lifetime
proof counters/tombstones. Registry advance atomically rebinds Open scope state
and stale-terminalizes a live grant without losing charges. Manifest weakening
and permanent rejection use complete destination-local admission/revocation/
expiry/consumption lifecycles. Restoration uses typed state algebra. One rebuild
parent owns bounded proposals, independently admitted permanent rejection and one
successor while old evidence stays fenced. Candidate, barrier and
activation authorization bind the exact history disposition, evidence digest
and policy epochs. Recovery request/
result tags are the sole action discriminator. The total six-state row returns
one closed outcome including Fenced; expiry is Issued-only and absent expiry/consumption is typed
no-write NotAdmitted. One closed conflict wrapper preserves detailed errors,
and CAS losers reread/reapply the state table. Authenticated recovery revocation is locally linearized.
Waive/Abandon require distinct custody records plus current
policy/legal-hold/compliance authority. These protocols are part of every admitted VIT-LAW-009
semantic realization, not optional registry behavior.

Database access alone must never authorize either profile. Startup, adapter
admission, migration, restore, failover, import, and recovery reject a
self-consistent manifest absent from the trusted set. Signed checkpoints,
backup manifests, release evidence, and restore reports bind the active catalog
ID, epoch, digest, and trust profile. Rollback cannot select an older catalog
unless its release and generation rollback floors explicitly permit it.

Planning catalog ID: `VIT-LAWCAT-PLAN-001-v1`

Planning catalog revision: `1`

Trust profile: `planning-superset-not-runtime-v1`

Planning catalog digest: `sha256:42fe3b005cf939eb8c02c2136a8f3fde69ef98390e2751ac8b1886a530c204d9`

The planning-catalog digest uses the length-prefixed encoding defined by
`docs/LAW_GENERATION_MANIFEST.md`. Encode, in order, the ASCII format literal
`vitheim-law-manifest-planning-superset-v1`, planning catalog ID, revision,
the exact non-runtime trust-profile literal, and decimal tuple count. Then
encode each reference and manifest digest in table order. Rows are sorted by
numeric law ID then generation, unique, and complete. The digest field and
Markdown presentation are excluded.

| Law generation | Admitted manifest digest |
| --- | --- |
| VIT-LAW-001@g01 | sha256:f78a752e19ceb2533525957dfe5f6e81a41a576b7890b930e20093a0796a12a5 |
| VIT-LAW-001@g02 | sha256:214af6583900f4589316445c27b00501cf6385fe4faf2dfde71129d05a560135 |
| VIT-LAW-001@g03 | sha256:0ffb3edb95857e5be276adc92097c19e2be6e1d6a30e2bbfd311b231fe43444b |
| VIT-LAW-001@g04 | sha256:16e020a00706cfc927d79676c68e932ec1d7453966574d8cf3bd401fe60a15d2 |
| VIT-LAW-001@g05 | sha256:11b1400ff675a7e98a89d8e13ea1f3fbef9a4a65f9694d6d76481d748f1a0feb |
| VIT-LAW-001@g06 | sha256:621a752fbfada4bc067b752ae1120d0e2ce1b79b4b77ed2a42a9967e565c0c30 |
| VIT-LAW-001@g07 | sha256:f36cdbb735bbe2f16a4eb07d93255aa71cc10c9c74a3593133bfed47d328063d |
| VIT-LAW-001@g08 | sha256:220af8abc4fc5cebe416bf0cc0318569927f4c71df4a8e5da4627433beb1578f |
| VIT-LAW-001@g09 | sha256:c31cff807553394f103b581544e6a8c50c42f626c8b2850bc729126100cc962d |
| VIT-LAW-001@g10 | sha256:8a601dd42aaa4fa5c07e095b08b8440afb80f6a2c0efc1fe83ca4bb27b057834 |
| VIT-LAW-001@g11 | sha256:9d508a97fe2657418b14eda5a6cdad230ddba5ebb9e9d73b9a6d58ec81e4439a |
| VIT-LAW-002@g01 | sha256:11cac943a1ab25897611afa0c765b890bee88925ddebd7fb93ad1b8ec934b08c |
| VIT-LAW-003@g01 | sha256:6cfa3db5dab5350d23fef107810ea2e6765f685ad92ab26b79677a07d84c12c5 |
| VIT-LAW-004@g01 | sha256:5b871e407e715593221c383b92f4aacb84c4ae8319cad61de4492ff0c24f4d5b |
| VIT-LAW-005@g01 | sha256:f2a133dcac387c262b633fc24587b0a7511077a3eb2248ea653c2de774bf5bd3 |
| VIT-LAW-005@g02 | sha256:fe9c32a9c67b29ef4629a1687c8b468af2c758377f89bb58a17080ced00c42e6 |
| VIT-LAW-005@g03 | sha256:b6784396cf4d68ae06413e24b713e4e5078f002f3075fe6e4db061d419e5762e |
| VIT-LAW-005@g04 | sha256:1a79abfc03b2425782c654750ca84588eb52df9510e25386042ab786da86457a |
| VIT-LAW-006@g01 | sha256:5a0de3d727241be6475ad663e07d34e601d2afd6c039516fe1d828c40a7d72c0 |
| VIT-LAW-006@g02 | sha256:cf57fe07293296582288bec8a025360bc20c17a3e735396a3368f73ac2c580ab |
| VIT-LAW-006@g03 | sha256:73e7eedb3fac5145ebb40b579a1ef925167d792923d39ae9a0d9ff8596ec0a6b |
| VIT-LAW-006@g04 | sha256:32221d8bb5637b342f7f11b14e714ac2e5400ac4920b33223aec99a1e3537cf4 |
| VIT-LAW-006@g05 | sha256:24d6264f268db0c209d130f5fad2d2f8c21b81a415330df235f0c1dacc564700 |
| VIT-LAW-006@g06 | sha256:dfa476052b1102613ed6458eb2a8c0cb9e665381bedc9aff62d67aebd698ddf2 |
| VIT-LAW-006@g07 | sha256:5e092c8394ba05af6be61678e888ec364e90dc55236cfdda108c157b00d764e5 |
| VIT-LAW-006@g08 | sha256:0a50d8744eac016b5a8632c951d449893329916fb1009dab246c556f897b5d96 |
| VIT-LAW-006@g09 | sha256:cc096495e635a754501dfcea819ff12cf3c99a84526523cb8662cc0374131874 |
| VIT-LAW-006@g10 | sha256:40871ba6c5605b877fb03e650f83784c7b5b36803536789f1647d7b5f4384eb5 |
| VIT-LAW-007@g01 | sha256:553eb76c886092676b1df83f31c59529120e9150333490a5f85b4c37cb971771 |
| VIT-LAW-007@g02 | sha256:6f3e4ad65ecd88ee6ebadc59d5c544965cc7e6a5e49276cd63fbf3be3ebb5055 |
| VIT-LAW-008@g01 | sha256:4249d47d61ee308e6ff759971254ed473416abea0483813224048bdf2c43c37e |
| VIT-LAW-008@g02 | sha256:178ed4f5137401c476c0afd784c9b00574174dde750a9e3947b976a1b446e4b6 |
| VIT-LAW-009@g01 | sha256:400dd34bb3d442ac575a3d824a31c0de351f1a9ac3121df0b4328c450013bbc1 |
| VIT-LAW-009@g02 | sha256:267f77d87d9014b339086cd134edc2411ddcf02efceeda9c4c551cf937983b6a |
| VIT-LAW-009@g03 | sha256:b74809e3ac40c6b259f03f4c08b7cf9155a6800ca4d79e32528c75e4ccbc0f40 |
| VIT-LAW-009@g04 | sha256:5ef46185fb99fd911c7f0f31c1fc69fdb6f2a0a603734e1f64eef05c0f6e9d53 |
| VIT-LAW-009@g05 | sha256:d90b3491469e0543580ec27b39ebe0c13f78f47731976a4c1a3f0cda9e6c305c |
| VIT-LAW-009@g06 | sha256:6282acd6206416daa1db88237fa22e32d835fe3103598bbc205f59b28eb69cd7 |
| VIT-LAW-009@g07 | sha256:67af910130d6d65c1dc97c1fa07d40c92cd47ab55690aa14e9b7e57f6dc7ae85 |
| VIT-LAW-009@g08 | sha256:6475ce5a2c3b932540e1e5a84597e98b18dbedd870fdba625f83ae052ce71ea8 |
| VIT-LAW-009@g09 | sha256:339035230dead6167287a4a54b0a89df731b9b2ccba4dfafcb41464488771e17 |
| VIT-LAW-009@g10 | sha256:f3f4ba81ce3b2e713b5ae1553b43def5003fe00db21ca9063a47d2745b07de20 |
| VIT-LAW-009@g11 | sha256:d4a4df92e980eaf5b41f358d13adc716fe5f4647fae9622fba6f8e22ce9a848d |

`0.25.0` implements planning-superset validation and generation of the first
active activation-floor catalog. Each later law-effective milestone generates
one immutable explicit successor containing complete effective ancestry and no
planned future tuple; between those floors the previously activated catalog
remains applicable. The first catalog embeds `VIT-LAW-008@g01`, the compiled
static singleton topology, and its empty serialized rollout root without self-
admission. `0.26.0` proves the first predecessor transition and competing-
candidate recovery through the durable process manager, including irreversible
authorization state/receipt/outbox pinning, both authenticated cross-owner
receipts, and external-issuer/local-consumption action-claim recovery. `0.39.0` binds that bundle, the verified
envelope, immutable placement manifest, receipts, and exact local identities/
ratchets into signed checkpoints. `0.46.0–0.52.0` negotiate and conform catalog
global/rollout/local ownership, trusted-time ratchets, persistence, and
admission; `0.66.0–0.72.0`
preserve them through migration, export, and import. `0.371.0`, `0.372.0`, and
`0.376.0` freeze exact cryptographic/time, storage, and deployment profiles.
`0.399.0` activates/converges epoch 13 under generation 1, requires every local
generation-2 admission, and only then lets generation 2 initialize/verify the
exact dormant singleton and commit the one-time handoff to independent
`VIT-INV-060` topology authority.
The same floor activates independent `VIT-INV-061` authorization issuance and
challenge/sequence topology-receipt currentness; neither authority can be
reconstructed from the other.
Phase O and `1.0.0` require verifier-bound
topology/identity/receipt/backup/restore/failover evidence and an exact-commit
pentest.
