# Law Manifest Admission Set

Status: normative planning-superset registry introduced by `0.18.3`

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

Database access alone must never authorize either profile. Startup, adapter
admission, migration, restore, failover, import, and recovery reject a
self-consistent manifest absent from the trusted set. Signed checkpoints,
backup manifests, release evidence, and restore reports bind the active catalog
ID, epoch, digest, and trust profile. Rollback cannot select an older catalog
unless its release and generation rollback floors explicitly permit it.

Planning catalog ID: `VIT-LAWCAT-PLAN-001-v1`

Planning catalog revision: `1`

Trust profile: `planning-superset-not-runtime-v1`

Planning catalog digest: `sha256:8109c675223331ea07d891ed9930e417fc34aa694bed4eebecdfffeb78e79ab7`

The planning-catalog digest uses the length-prefixed encoding defined by
`docs/LAW_GENERATION_MANIFEST.md`. Encode, in order, the ASCII format literal
`vitheim-law-manifest-planning-superset-v1`, planning catalog ID, revision,
the exact non-runtime trust-profile literal, and decimal tuple count. Then
encode each reference and manifest digest in table order. Rows are sorted by
numeric law ID then generation, unique, and complete. The digest field and
Markdown presentation are excluded.

| Law generation | Admitted manifest digest |
| --- | --- |
| VIT-LAW-001@g01 | sha256:0ad9616ca703dc198a287bda26d3bd35c8a034f523acc0c140c1ebc077d2d146 |
| VIT-LAW-001@g02 | sha256:0e4c701e6b7560612307560e4e0666c204b66f7f54b62920a3f0fd9591a821ab |
| VIT-LAW-001@g03 | sha256:cb7c34c47e2b79152340f2ba9dfbc4daf88a2638c868b4cd59e4232a294d90e7 |
| VIT-LAW-001@g04 | sha256:ecd7fc555f864c2fd81c61bb54cf10bf394bf1544964b9b2a3afb8d141fff661 |
| VIT-LAW-001@g05 | sha256:cc60d70e52de33e47dde7a9ee6be88e061854b66a28668eb10d2ef60a530d790 |
| VIT-LAW-001@g06 | sha256:4f7b90238a1ffefb7718b0e3a5720261cfecda0123fb611b84b1292b67bdc9b2 |
| VIT-LAW-001@g07 | sha256:d5feb56b64f28b1cd812cd3555671a87b48b021c99f603944801702e921f7f2d |
| VIT-LAW-001@g08 | sha256:3b720d6c8dc7a1c639cbf4cf622697d9be368a148b133b97c55b9e3d23a9283d |
| VIT-LAW-001@g09 | sha256:6f3da855ad6550cc094d9b9195318fb89f354a3a10ee264a9efe7e8967b6cb67 |
| VIT-LAW-001@g10 | sha256:08dfe5d2a62cd36cb5bebee746d1b5f44b17501c4e53904e56f718c00f491a4e |
| VIT-LAW-001@g11 | sha256:854f8cbfd9fdb56c6e0593b9944c383623dcf4d7061f62b722f34852eeae97c3 |
| VIT-LAW-002@g01 | sha256:45f96a24e22d94a2a52f033b8c177155361cb87412071f9d6a83faf3492e2c5b |
| VIT-LAW-003@g01 | sha256:d7676f2d86177a47be071e9498622ef3f2aca8612c7f364a677b2c67677fe808 |
| VIT-LAW-004@g01 | sha256:c7793caa65dd0f76405c5f75d191ee8d7da30e2bd3db6f654a9af4e1a789851a |
| VIT-LAW-005@g01 | sha256:ebaadc7e8ef5c78c59ac009704c61849e8042379fd3dbdc27a1296d90e13dc8a |
| VIT-LAW-005@g02 | sha256:c4ec5a568579a9ab9ce12c2a0359997f72f6eb6fadc93e9dcb60be04f4ffc91c |
| VIT-LAW-005@g03 | sha256:3c9b7bb272112ba60d472330e5d60f6717c482a7518bf5d41d47e019079d2e5c |
| VIT-LAW-005@g04 | sha256:f859a7ddc5b2181b741e7d502ae2c948a0c57cc74d81110ed9823d792b707c09 |
| VIT-LAW-006@g01 | sha256:f03bf8c7d8adf1b03eb9191f64ef55b1f953c454031ae5385ed6bae05e1b35ce |
| VIT-LAW-006@g02 | sha256:29ba7b2d7dc05b1f24f08d80052693445ddfe8ff56e1d75ea3525ca15454ad5b |
| VIT-LAW-006@g03 | sha256:6ba5fe08f4725ee7cd7363aa9b838ffbd0f937fa1bde062aaf7b612023bae78f |
| VIT-LAW-006@g04 | sha256:445bfcda3cc24d9af0c3366d120708c5e5bac8bc8ac689897d777d7745ff9d79 |
| VIT-LAW-006@g05 | sha256:67c4870fd7a49d2b2e197bdd8162ee6771da5d036b0ddff201ff496aa974b111 |
| VIT-LAW-006@g06 | sha256:a052d0ad1933024ceaa84422126f31a64e5e2542e4f07c0caee7e7a75f802a29 |
| VIT-LAW-006@g07 | sha256:9eac643e5e3f43838b666ac4021f01c066a80dd2a11204a41ad43842a8993071 |
| VIT-LAW-006@g08 | sha256:1831ab3a258cc5cc6cbc50a579cae326973bd4406749c6cb3ed9e665be27e095 |
| VIT-LAW-006@g09 | sha256:44b4e01d4de263d630fbf5ea97e52fcfa1a06f0d63056ba4a9af0aeb2e0cc12f |
| VIT-LAW-006@g10 | sha256:54280761c256d867005a953f5c2f46d6e0d0ed018ac4b3ad47326d859f47d338 |
| VIT-LAW-007@g01 | sha256:d36ba8b53e831437107f1f78610dfa889ccdfdd9288a58f90b01affb4caee5d7 |
| VIT-LAW-007@g02 | sha256:ab2dcb2593e25d58ec06dbd4f6add9789cdef308281efa9876241295ec2148b2 |
| VIT-LAW-008@g01 | sha256:108df80613c6b4fc288a343ae04a81c90f6d3a403a1ea3c01d0c230cac5052e3 |
| VIT-LAW-008@g02 | sha256:9e3856ef1cd658ceffcbf219311f45708646442fe221c68ad4b1db1a0a97c701 |

`0.18.3` implements planning-superset validation and generation of the first
active activation-floor catalog. Each later law-effective milestone generates
one immutable explicit successor containing complete effective ancestry and no
planned future tuple; between those floors the previously activated catalog
remains applicable. The first catalog embeds `VIT-LAW-008@g01`, the compiled
static singleton topology, and its empty serialized rollout root without self-
admission. `0.18.4` proves the first predecessor transition and competing-
candidate recovery through the durable process manager, including irreversible
authorization state/receipt/outbox pinning, both authenticated cross-owner
receipts, and external-issuer/local-consumption action-claim recovery. `0.19.0` binds that bundle, the verified
envelope, immutable placement manifest, receipts, and exact local identities/
ratchets into signed checkpoints. `0.21.0–0.22.0` negotiate and conform catalog
global/rollout/local ownership, trusted-time ratchets, persistence, and
admission; `0.29.0–0.30.0`
preserve them through migration, export, and import. `0.140.1`, `0.140.2`, and
`0.140.6` freeze exact cryptographic/time, storage, and deployment profiles.
`0.141.0` activates/converges epoch 12 under generation 1, requires every local
generation-2 admission, and only then lets generation 2 initialize/verify the
exact dormant singleton and commit the one-time handoff to independent
`VIT-INV-060` topology authority.
The same floor activates independent `VIT-INV-061` authorization issuance and
challenge/sequence topology-receipt currentness; neither authority can be
reconstructed from the other.
Phase O and `1.0.0` require verifier-bound
topology/identity/receipt/backup/restore/failover evidence and an exact-commit
pentest.
