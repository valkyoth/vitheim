# Law Generation Manifest

Status: normative planning schema introduced by `0.18.3`

`LawGenerationManifestV1` is the machine-readable security contract for one
composite-law generation. The Markdown table in
`docs/LAW_GENERATIONS.md` is the planning source; implementation emits the same
fields through the project-owned canonical codec from `0.6.0`. Storage,
migration, recovery, deployment, and conformance tooling consume the manifest
and verify its digest rather than parsing prose.

## Canonical Fields

Fields appear in this exact order:

1. `format`: the ASCII literal `vitheim-law-generation-manifest-v1`;
2. `law_id`: `VIT-LAW-NNN`;
3. `generation`: nonzero decimal without leading zeroes;
4. `effective`: strict numeric SemVer;
5. `predecessor`: `none` or the preceding nonzero decimal generation;
6. `coordinator`: one registered `VIT-INV-NNN`;
7. `dependencies`: the complete resolved invariant set, sorted by numeric ID,
   unique, and joined by comma plus one ASCII space;
8. `semantic_contract`: `VIT-LSEM-NNN-gNN-vN`;
9. `semantics`: the complete resolved canonical text in the form
   `linearize: ...; failure: ...; recovery: ...`;
10. `mixed_version`: the conservative predecessor/successor intersection rule;
11. `activation_fence`: `VIT-LGFEN-NNN-gNN`;
12. `migration_contract`: `VIT-LGMIG-NNN-gNN-vN`;
13. `rollback_floor`: strict numeric SemVer;
14. `dependency_contract`: `VIT-LDEP-NNN-gNN-vN`;
15. `recovery_contract`: `VIT-LRCV-NNN-gNN-vN`.

No field is optional. Canonical-v1 source values use printable ASCII
`U+0020–U+007E`; tabs, carriage returns, control characters, non-ASCII Unicode,
embedded Markdown pipes, leading/trailing whitespace, and alternative Unicode
normalizations are therefore unrepresentable. Markdown cells contain exactly
one space after and before their delimiter. Generations are canonical nonzero
decimal without leading zeroes, contract versions are `v1` or greater without
leading zeroes, and SemVer numeric components are canonical decimal. Unknown
fields, malformed identifiers, ambiguous values, or format versions fail
closed before hashing.

## Planning Digest

The planning registry content-binds every row with SHA-256. For each field in
the order above, encode its value as:

```text
<ASCII decimal UTF-8 byte length>:<exact UTF-8 bytes>
```

Concatenate the fifteen encodings without separators and hash those bytes. The
lowercase 64-hex result is stored as
`sha256:<digest>` in the generation row. Length prefixes make concatenation
unambiguous. The digest field itself is excluded.

The Rust artifact uses the same field values and ordering through the canonical
`0.6.0` codec and stores a typed `Digest32` plus the admitted digest-profile
identifier. Digest self-consistency is not authority: the exact
`(LawId, Generation, Digest)` must also occur in the trusted
[Law Manifest Admission Set](LAW_MANIFEST_ADMISSIONS.md) planning superset and
the exact generation must be effective, realized, and present in a
milestone-scoped [Active Law Catalog](LAW_ACTIVE_CATALOGS.md). The `0.18.3`
implementation-admission record must approve the digest implementation before
production code uses it; `0.140.1` revalidates that choice. Planning SHA-256
verification does not authorize a casual first-party cryptographic
implementation.

## Evolution Rules

Generation one declares the complete dependency set and complete semantics and
cannot remove a dependency. Every resolved generation has at least two distinct
roots and contains its coordinator. Additions and removals are disjoint.
Each later generation starts from its predecessor, applies additions and
removals, and either inherits semantics with `unchanged` or supplies a complete
replacement. A later generation is valid only when at least one security-
relevant value changes:

- dependency addition;
- dependency removal;
- coordinator;
- canonical semantics.

A claimed dependency delta must change the final resolved set; canceling or
otherwise neutral additions/removals are invalid.

An addition-only assumption is forbidden. Removal-only and semantics-only
generations are valid, but still require a new activation fence, migration,
rollback floor, dependency/recovery contracts, semantic contract, manifest
digest, and conservative mixed-version rule.

Historical rows and their digests are append-only. Correcting an already
released meaning requires a successor generation, not an in-place edit.

## Versioned Realization

- `0.18.3`: implement the `no_std`/N1 manifest type, canonical codec, digest
  verification, strict field/parser and composite-structure checks, global
  `VIT-INV-057` catalog lineage, separate `VIT-INV-058` local
  identity/catalog/distrust/trusted-time ratchets, `VIT-INV-059` durable
  serialized rollout process manager and `VIT-LAW-008@g01`, compiled static
  singleton placement, authenticated receipt-bound state, planning/active
  separation, gap-free activation-floor
  selection, fully bound payload/envelope, one runtime/CLI cryptographic
  verifier, closed stage-aware P/N/M/F semantic-realization registry, and
  in-memory round-trip/golden fixtures.
- `0.19.0`: signed checkpoints bind the active admission-catalog identity,
  epoch, digest, and trust profile.
- `0.21.0`: storage capability negotiation declares manifest, digest,
  admission-catalog, and semantic-realization support.
- `0.22.0`: destructive adapter conformance persists, reads, and rejects
  altered or self-consistent-but-untrusted manifests for the complete
  predecessor closure effective by `0.22.0`.
- `0.29.0`: migration and recovery preserve predecessor manifests and verify
  the successor and trusted admission catalog before activation.
- `0.30.0`: export/import binds and verifies the full catalog and generation
  ancestry; it never infers or silently upgrades law authority.
- `0.51.1–0.59.0`: each identity/authorization expansion activates its exact
  generation-qualified manifests.
- `0.140.1–0.140.6`: freeze digest, storage, identity, deployment, HA, and
  recovery profiles.
- `0.141.0`: hand the compiled singleton to independent
  `VIT-INV-060` topology authority and activate `VIT-LAW-008@g02`, whose
  rollout manifests consume authenticated current-topology receipts.
- `0.141.0–1.0.0`: restore, failover, compatibility, release evidence, and
  pentest reports prove manifest/digest continuity with no future-generation
  claim.
