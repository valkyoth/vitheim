# Roadmap Gap Dispositions

Status: incorporated planning record

This record explains how the reviewed gap analysis strengthened the existing
roadmap. It is not a substitute for the version handoffs and does not copy the
analysis wholesale.

| Gap | Disposition and version context |
| --- | --- |
| Release report does not bind the candidate | Reopen `0.1.0`: validate candidate tree/parent and signed detached or evidence-only attestation before its pentest exit. |
| SBOM check is name-only | Reopen `0.1.0`: compare normalized semantic package/source/version/license/relationship content and bind it into release evidence. |
| Permissive version parsing | Reopen `0.1.0`: strict numeric SemVer parsing with negative tests; never interpolate untrusted version text into regex. |
| N0/N1 is mostly prose | Add layer metadata and checked DAG/build-script/proc-macro/FFI/alloc/facade rules to `0.2.0`; maintain them thereafter. |
| Universal polymorphic write risk | Strengthen `0.2.0`, `0.31.0`, and `0.33.0`: typed IDs/commands/events/streams, component-only `WorkItem`, no patch/set-state escape hatch, configured lifecycles only narrow aggregate law. |
| Tenant proof arrives too late | Move structural tenant scope to `0.2.0`, `0.7.0`, journals at `0.11.0`, twin-tenant conformance at `0.22.0`, and adapters at `0.23.0–0.30.0`; `0.51.0` becomes formal cross-surface assurance. |
| Command transaction/idempotency ambiguity | Strengthen `0.13.0`, `0.16.0`, and `0.17.0`: exact-version normal writes, request digests, atomic receipt/outbox/inbox/effects, fenced exceptional `Any`, bounded replay horizon. |
| Journal chain lacks external anchor | Strengthen `0.19.0`: partition commitments, external signed anchors, cross-signed rotations, optional independent timestamps, recovery verification. |
| Privacy, retention, holds, erasure absent | Add foundations to `0.28.0` and custody/disposition to `0.79.0`; freeze production policy at `0.140.5`. |
| Key lifecycle incomplete | Expand `0.19.0`, `0.28.0`, `0.79.0`, `0.145.0`, and `0.147.0`; select crypto/KMS profile at `0.140.1`. |
| Authenticated API precedes real identity | Limit `0.40.0` to static/fake internal test authentication; production OIDC/WebAuthn remains Phase F and production profile selection is `0.140.3`. |
| OIDC and WebAuthn are over-bundled | `0.53.0` owns OIDC; add corrective milestone `0.53.1` for independently pinned WebAuthn profile and review. |
| ITSM transitions could collapse into generic mutation | Make sealed domain transition commands/events and side-effect-free rejection universal in Phase E; `0.41.0` supplies the first explicit fixtures. |
| Policy decisions lack one complete contract | Strengthen `0.56.0` with tenant/subject/action/resource/field/purpose/environment/version input and obligation-bearing decisions; prove every interface at `0.58.0–0.60.0`. |
| Authorization inventory is manual | Strengthen `0.58.0` and `0.60.0`: generated interface registry and mandatory cases for routes, reads, exporters, notifications, plugins, workflows, and AI. |
| Raw SecOps evidence could be normalized away | Strengthen `0.72.0–0.74.0`: normalization, grouping, and suppression create derived assertions while raw source bytes remain immutable. |
| Graph time/correction/merge/traversal semantics incomplete | Strengthen `0.84.0–0.88.0`: four distinct time claims, correction identities, non-destructive equivalence, immutable source facts, filter-before-traversal, policy-safe paths. |
| Evidence custody lacks preservation/disposition | Strengthen `0.79.0`: envelope encryption, clock quality, access/copy/transform/hold/disposition events, signed derived-artifact manifests. |
| WASM capabilities lack host/OS detail | Strengthen `0.111.0–0.120.0`; select runtime/process/egress profile at `0.140.4`. |
| AI broker isolation is mostly prose | Strengthen `0.121.0–0.130.0`: no DB/dispatcher authority, immutable context packs, opaque citations, server-side resolution, current-policy recheck, no policy-incompatible fallback; decide enablement at `0.140.8`. |
| Production options were implicit | Add `0.140.1–0.140.8` decision releases covering dependency/crypto, storage/tenancy, identity, plugins, privacy, deployment, SDK publication, and AI before Phase O. |

Recommendations that merely restated existing controls remain in their original
versions. Backend-specific or protocol-specific choices are not prematurely
declared universal; they are evaluated and selected by the option-decision
releases, then certified only for the chosen `1.0.0` profiles.
