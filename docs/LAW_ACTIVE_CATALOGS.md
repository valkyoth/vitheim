# Active Law Catalogs

Status: normative runtime-catalog plan introduced by `0.18.3`

The planning superset in `docs/LAW_MANIFEST_ADMISSIONS.md` is never admitted
directly. `VIT-INV-057` owns one active `LawManifestAdmissionSetV1` lineage.
Every active catalog is immutable, milestone-scoped, complete for all laws
effective at its maximum platform version, and empty of future generations.
Activation requires expected-version CAS, a strictly increasing epoch, exact
predecessor-envelope digest, compiled semantic realization, and a local
high-watermark ratchet. A cryptographically trusted tuple is not activatable
before its generation is effective and realized.

## Canonical Active Payload

`LawManifestAdmissionPayloadV1` contains these fields in exact order:

1. format literal `vitheim-law-manifest-admission-payload-v1`;
2. catalog ID and strictly increasing epoch;
3. predecessor envelope digest or `none` for the first active catalog;
4. activation floor and maximum platform version as strict numeric SemVer;
5. product, edition, and compatibility scope;
6. sorted, unique tuple count and complete
   `(LawId, Generation, ManifestDigest)` ancestry;
7. payload digest.

The payload digest uses the project length-prefixed canonical encoding over
fields 1–6 and every tuple. It excludes itself, presentation, and signatures.
The complete tuple set must equal the latest generation of every law effective
at the maximum platform version plus every predecessor; omission and future
inclusion both fail closed.

## Canonical Trust Envelope

`LawManifestAdmissionEnvelopeV1` content-binds these fields in exact order:

1. format literal `vitheim-law-manifest-admission-envelope-v1`;
2. exact profile enum: `CompiledCatalog` or `SignedCatalog`;
3. payload digest and predecessor envelope digest;
4. catalog ID, epoch, activation floor, and maximum platform version;
5. product, edition, and compatibility scope;
6. validity policy enum (`NoExpiry` or `BoundedWindow`) and canonical
   not-before/not-after values (`none` only under `NoExpiry`);
7. signer/key ID, signature profile, and trust-root epoch;
8. revocation policy and successor policy;
9. envelope digest.

The envelope digest uses length-prefixed canonical encoding over fields 1–8.
For `CompiledCatalog`, signer/key/signature fields use exact `none` literals and
artifact provenance authenticates the envelope digest. For `SignedCatalog`,
none of those fields may be `none`; the dedicated platform-law key signs the
domain-separated envelope digest. Trust roots arrive through compiled
provenance or a separate authenticated ceremony, never mutable catalog
storage. Signature bytes are outside the digest but bind its exact value.

Revocation and emergency distrust advance monotonic lineage state even if no
successor can activate. A successor binds its predecessor's exact envelope
digest. Restore accepts neither an older epoch nor a catalog below any local
high-watermark, and cannot reconstruct profile, signer, trust-root epoch,
validity, scope, revocation, or successor authority from database content.

The first catalog has a deliberately narrow bootstrap: its
`CompiledCatalog` payload/envelope and the `VIT-LAW-007@g01` realization are
embedded in the reviewed artifact, whose provenance establishes the initial
owner row and local high-watermark. Mutable state cannot self-admit the law that
validates it. After that seed, every activation, trust-profile transition, and
emergency distrust follows `VIT-INV-057`/`VIT-LAW-007`; a transition to
`SignedCatalog` additionally requires the separately provisioned trust-root
ceremony.

## Planned Runtime Catalog Schedule

The frontier column is compact notation for a complete ancestry closure. For
example, `VIT-LAW-001@g03` requires tuples g01, g02, and g03. Release tooling
materializes and hashes the full set. The artifact path becomes mandatory when
its activation milestone leaves planned status.

| Epoch | Catalog ID | Activation floor / maximum platform | Profile | Predecessor envelope contract | Required law frontiers | Payload artifact |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | VIT-LAWCAT-ACTIVE-e001-v1 | `0.18.3` / `0.18.3` | CompiledCatalog | none | VIT-LAW-001@g02, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-005@g04, VIT-LAW-006@g01, VIT-LAW-007@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e001-v1.catalog` |
| 2 | VIT-LAWCAT-ACTIVE-e002-v1 | `0.18.4` / `0.18.4` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e001-envelope-v1 | VIT-LAW-001@g02, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g01, VIT-LAW-007@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e002-v1.catalog` |
| 3 | VIT-LAWCAT-ACTIVE-e003-v1 | `0.51.1` / `0.51.1` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e002-envelope-v1 | VIT-LAW-001@g03, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g02, VIT-LAW-007@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e003-v1.catalog` |
| 4 | VIT-LAWCAT-ACTIVE-e004-v1 | `0.52.0` / `0.52.0` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e003-envelope-v1 | VIT-LAW-001@g04, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g03, VIT-LAW-007@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e004-v1.catalog` |
| 5 | VIT-LAWCAT-ACTIVE-e005-v1 | `0.52.1` / `0.52.1` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e004-envelope-v1 | VIT-LAW-001@g05, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g04, VIT-LAW-007@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e005-v1.catalog` |
| 6 | VIT-LAWCAT-ACTIVE-e006-v1 | `0.53.0` / `0.53.0` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e005-envelope-v1 | VIT-LAW-001@g06, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g05, VIT-LAW-007@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e006-v1.catalog` |
| 7 | VIT-LAWCAT-ACTIVE-e007-v1 | `0.53.1` / `0.53.1` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e006-envelope-v1 | VIT-LAW-001@g07, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g06, VIT-LAW-007@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e007-v1.catalog` |
| 8 | VIT-LAWCAT-ACTIVE-e008-v1 | `0.55.0` / `0.55.0` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e007-envelope-v1 | VIT-LAW-001@g08, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g07, VIT-LAW-007@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e008-v1.catalog` |
| 9 | VIT-LAWCAT-ACTIVE-e009-v1 | `0.56.0` / `0.56.0` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e008-envelope-v1 | VIT-LAW-001@g09, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g08, VIT-LAW-007@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e009-v1.catalog` |
| 10 | VIT-LAWCAT-ACTIVE-e010-v1 | `0.57.0` / `0.57.0` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e009-envelope-v1 | VIT-LAW-001@g10, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g09, VIT-LAW-007@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e010-v1.catalog` |
| 11 | VIT-LAWCAT-ACTIVE-e011-v1 | `0.59.0` / `0.59.0` | CompiledCatalog | VIT-LAWCAT-ACTIVE-e010-envelope-v1 | VIT-LAW-001@g11, VIT-LAW-002@g01, VIT-LAW-003@g01, VIT-LAW-004@g01, VIT-LAW-005@g04, VIT-LAW-006@g10, VIT-LAW-007@g01 | `release/law-catalogs/VIT-LAWCAT-ACTIVE-e011-v1.catalog` |

`0.140.1` may retain `CompiledCatalog` or activate a new `SignedCatalog`
successor, but the produced artifact must contain one exact enum and the full
envelope; it cannot serialize a combined profile. `0.140.2` freezes authority
row and ratchet placement. `0.140.6` freezes distribution, failover, emergency
distrust, and recovery. `0.145.0` proves backup/restore without storage-derived
trust. Phase O and `1.0.0` require zero future tuples, incomplete closures,
unrealized semantics, or envelope fields outside the digest.
