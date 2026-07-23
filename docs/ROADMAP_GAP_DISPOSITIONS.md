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
| Privacy, retention, holds, erasure absent | Add classification at `0.5.0`, immutable-safe event metadata at `0.8.0`, dedicated sensitive-payload lifecycle at `0.8.1`, hosted foundations at `0.28.0–0.28.2`, custody/disposition at `0.79.0`, and production freeze at `0.140.5`. |
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
| Production options were implicit | Add `0.140.1–0.140.10` production-profile freeze decisions covering dependency/crypto, storage/tenancy, identity, plugins, privacy, deployment, SDK publication, AI, interchange, and federation before Phase O. |
| Production technology decisions occurred after implementation | Require a version-bound implementation-admission record at every first consuming hosted milestone (`0.19.0`, `0.23.0–0.28.2`, `0.36.1`, `0.53.0–0.53.2`, `0.93.1`, `0.112.0`, `0.142.1`); redefine `0.140.x` as revalidation/freeze, never first selection. |
| Early integration gates depended on later phases | Make `0.50.0`, `0.75.0`, and `0.80.0` certify deterministic port fakes only; require fake-versus-real integration retests at `0.70.0`, `0.88.0`, and `0.100.0`. Later authority-bearing surfaces must register before their own exit. |
| Security audit architecture lacked an owner | Add `0.20.1` for separate security audit facts/journal, denial and sensitive-read coverage, mandatory-audit fail-closed behavior, retention/integrity, and idempotent rejection receipts without domain mutation. |
| Personal/secret event data was protected too late | Add schema classification at `0.5.0`, safe event metadata at `0.8.0`, and `0.8.1` for encrypted/erasable payloads, tombstones, crypto-erasure, hash authority, rebuild-after-erasure, and forbidden metadata sinks. |
| Hosted HA capabilities lacked implementation owners | Assign S3 at `0.28.1`, KMS/secrets at `0.28.2`, journal-backed queue at `0.30.1`, cache at `0.30.2`, malware scanner at `0.36.1`, distributed sessions at `0.53.2`, PostgreSQL search at `0.93.1`, and telemetry exporters at `0.142.1`. |
| Tenant lifecycle was implicit | Add `0.51.1` for provision/suspend/export/hold/close/delete/key-destroy, identifier non-reuse, cleanup proof, and topology migration. |
| Quotas were process-local or underspecified | Add semantic durable reservations/refunds/fairness/reconciliation at `0.18.1` and production stress evidence at `0.146.0`. |
| Event evolution and cross-aggregate law were incomplete | Strengthen `0.8.0`, `0.11.0`, `0.14.0`, `0.29.0`, and `0.148.0` with schema registry, one-stream transactions, process managers, pure upcasters, original-byte authority, quarantine, and mixed-version corpora. |
| Read consistency was not externalized | Carry `0.15.0` consistency/read-your-write tokens through `0.40.0` and the external API candidate at `0.138.0`. |
| Workflow history and policy lifecycle lacked operational limits | Strengthen `0.68.0` for checkpoint/continue/archive/heartbeat/orphan handling and add `0.56.1` for policy simulation, approval, activation, rollback, bootstrap and lockout recovery. |
| Scanner verdict, notification, plugin-state, and observability details were implicit | Bind scanner versions/reevaluation at `0.36.0–0.36.1`, render protected notification references at `0.39.0`, define stateless-or-namespaced plugin state at `0.114.0`, and own tenant-safe telemetry at `0.142.1`. |
| Stable API milestone bundled unrelated responsibilities | Make `0.138.0` the external API/codec candidate, `0.138.1` private SDK candidate, `0.138.2` staged import, and `0.138.3` policy-snapshot/manifest export. |
| Five production databases create excessive pre-v1 surface | Keep memory semantics, SQLite single-node, and PostgreSQL HA as default candidates; classify MySQL/MongoDB/SurrealDB milestones experimental unless `0.140.2` promotes an evidenced profile. |
| Interchange support was vague | Add `0.140.9` to freeze exact supported/deferred SCIM/SAML, CVSS/VEX, SPDX/CycloneDX, STIX/TAXII, syslog/webhook profiles and forbid generic family claims. |
| Interface flexibility needed a governed “Lego block” model | Strengthen `0.132.0` and add `0.132.1` for typed composable blocks, drag/drop layouts, tenant/team/role/user ownership, safe custom blocks, configuration-as-code, accessibility, budgets, review, versioning, and rollback without arbitrary scripts or raw queries. |
| Small and large organizations need different interface structures | Add `0.132.2` with unified small-company and separated enterprise information-architecture profiles plus governed custom profiles that preserve identical API/domain/RBAC semantics. |
| RBAC needed explicit product-wide scope | Strengthen `0.55.0` for platform/tenant/workspace/shared-space/resource scopes, custom roles, separation of duties, provenance/expiry, and a law that dashboards/navigation/plugins never grant capabilities. |
| Organization-to-organization cooperation was absent | Add `0.120.1–0.120.5` for bilateral instance trust, shared spaces, federated work exchange, managed-service asset/security delegation, and multi-instance conformance/revocation/recovery; add optional production freeze at `0.140.10`. |
| API-first architecture and UI separation were not early enough | Add architecture laws and `0.40.1` for separate API contract/application/transport and UI crates, forbidden UI-to-domain/storage dependencies, headless conformance, and UI/API differential tests; `0.138.0` later freezes API v1. |
| Plugin ecosystem lacked a storefront and concrete security connectors | Add `0.116.1` for a governed signed catalog/storefront, `0.118.1` for Microsoft Defender/Sentinel ingestion, and `0.118.2` for Tenable asset/vulnerability ingestion; discovery, install, permission approval, activation, and upgrade remain separate actions. |
| Vulnerability management was too compressed | Expand `0.78.1–0.78.4` for advisory/finding/affected-asset identities, evidence-based prioritization, remediation campaigns/exceptions/verification, and coverage/program conformance reporting. |
| Cross-domain graph correlation needed explicit ownership | Add `0.88.1–0.88.3` to connect teams/services/assets/software/vulnerabilities/alerts/incidents/changes/evidence/remediation through typed provenance-aware edges, bounded evidence-based correlation, and an authorized analyst workspace. |

Recommendations that merely restated existing controls remain in their original
versions. Backend-specific and protocol-specific implementations are admitted
at their first consuming milestone, then revalidated and frozen by the
pre-production decisions. Only the selected profiles proceed through Phase O
and appear in `1.0.0` claims.
