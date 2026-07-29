# Roadmap Coherence Completions

Document status: normative implementation handoffs

These focused stops close dependency-feasibility, requirement-discovery,
surface-ownership, domain-boundary, and chronological integration gaps without
weakening the existing owners. They do not authorize third-party Cargo code,
move domain authority into an integration layer, or let a future-facing fake
count as implemented integration.

## `0.18.15` — Requirement Source Anchors And Drift Enforcement

Status: planned.
Setup: extend the `0.18.14` requirement schema with a stable source anchor,
adjacent `vitheim-requirement` marker or structured-manifest origin, canonical
text digest, primary owner, integration/retest owners, and symmetric
supersession lineage; define bounded explicit exceptions for templates and
non-normative examples.
Goal: make newly introduced normative prose discoverable instead of checking
only requirements already known to the registry.
Deliverables: marker grammar, source-anchor resolver, canonicalizer/digester,
normative-language scanner, exception registry, generated cross-reference view,
and positive/negative fixtures.
Verification: mutable line reference, missing/duplicate marker, marker/manifest
conflict, text drift without digest update, orphan registry row, forged
supersession, unmarked MUST/never/only/invariant/verification/exit block,
example false positive, and bounded-work failure pass.
Exit criteria: every in-scope normative block resolves bidirectionally to one
stable requirement lineage and exact source digest, or to one reviewed,
machine-checkable non-normative exception.
`v0.18.15 implementation stop reached. Run pentest for this exact commit.`

## `0.18.16` — Hosted Feasibility And Dependency-Law Decision

Status: planned; owner policy selects repository-wide dependency-free or
unsupported/deferred as the binding outcome.
Setup: inventory each planned Hosted primitive and adapter against Rust `std`
capabilities, including TLS, cryptography, databases, OIDC/WebAuthn/SAML,
MIME, and the Wasm component runtime; bind its first implementation stop,
project-owned port, safe implementation evidence, and support/defer consequence.
Goal: resolve infeasible Hosted work before the first affected implementation,
while preserving the repository-wide prohibition on third-party Cargo code.
Deliverables: capability-to-technology feasibility matrix, earliest-owner
report, decision record materializing the selected zero-dependency option,
explicit unsupported/deferred gates, and a change protocol requiring a new
owner-approved exact roadmap decision before any future policy amendment can
unblock an affected adapter.
Verification: hidden transitive/native dependency, improvised crypto/protocol,
adapter work preceding its decision, admission-record-as-exception, unsupported
feature advertised as active, N0/N1 contamination, and stale `0.140.14`
revalidation pass.
Exit criteria: every affected Hosted milestone is either backed by an audited
dependency-free project implementation or is visibly blocked/deferred; no
roadmap text, admission record, or adapter can silently relax the dependency law.
`v0.18.16 implementation stop reached. Run pentest for this exact commit.`

## `0.30.23` — Stable Domain Manifest Core

Status: planned.
Setup: define stable `DomainId`, owning crate/layer, one-or-more `VIT-REQ-*`
links, aggregate/application command and read schema IDs, classifications, and
a bounded list of typed extension references without defining future surface
protocols.
Goal: provide one mechanically discoverable domain identity without becoming a
parallel authority or forcing Phase D to invent later vocabularies.
Deliverables: `DomainManifestV1`, registry, marker grammar, requirement/crate/
schema link checker, bounded extension-reference envelope, and fixtures.
Verification: requirement-as-domain identity, missing/duplicate `DomainId`,
wrong crate/layer, dangling command/read schema, cross-domain substitution,
embedded future mapping, unknown reference encoding, and parser/work-budget pass.
Exit criteria: every introduced domain has one stable manifest and requirement
set; the core contains identifiers and references only and grants no command,
authorization, data exposure, lifecycle decision, or surface semantics.
`v0.30.23 implementation stop reached. Run pentest for this exact commit.`

## `0.30.24` — Contribution Reference And Generation Safety

Status: planned.
Setup: define registered `ContributionKindId`, authoritative registry/profile,
entry ID, schema version, generation/digest, domain-schema compatibility,
dependencies, activation, supersession, rollback floor, and mixed-version behavior.
Goal: compose future typed extensions without duplicating their registries or
letting manifest metadata become authority.
Deliverables: reference resolver, kind catalog, complete-generation activation
protocol, collision/dependency checker, compatibility matrix, and HA fixtures.
Verification: dangling/mismatched reference, route/resource/command/event/
trigger/facet/block/document namespace collision, dependency/recovery cycle,
schema mismatch, downgrade/rollback, mixed-node interpretation, unknown kind,
partial activation, and digest substitution pass.
Exit criteria: one domain contribution generation activates atomically only
when every reference resolves to the exact authoritative entry; declarations
cannot grant authorization, expose commands, override lifecycle policy, or
change the referenced authority.
`v0.30.24 implementation stop reached. Run pentest for this exact commit.`

## `0.30.25` — Contribution Deferral And Product-State Gates

Status: planned.
Setup: define required/not-applicable/deferred contribution states with exact
implementation milestone, blocking prerequisite, responsible crate, retest
milestone, Supported/Conditional/Unsupported effect, review/expiry point,
supersession, and closure evidence.
Goal: permit honest sequencing without allowing difficult surfaces to remain
indefinitely deferred behind a nominally supported domain.
Deliverables: deferral record/lifecycle, overdue review and product-state
projection, certification blocker, generated unresolved report, and fixtures.
Verification: owner-only defer, missing prerequisite/crate/retest, expiry
rollback, defer loop, false not-applicable, silent support, stale closure,
supersession fork, and final-certification bypass pass.
Exit criteria: a domain may exit with a bounded deferral only when all fields
are complete and its product state reflects the gap; no Supported capability,
RC, or `1.0.0` profile has an unresolved required contribution.
`v0.30.25 implementation stop reached. Run pentest for this exact commit.`

## `0.50.18` — Supplier Performance Assessment And Risk Proposals

Status: planned.
Setup: consume immutable contractual obligations from `0.50.11`; define
assessment identity/period, method/version, assessor independence, evidence
references, measurements, explained score, finding, correction, review
schedule, and inert `RiskProposal` output.
Goal: assess supplier performance without sharing the contractual-obligation
lifecycle or duplicating Phase K risk authority.
Deliverables: assessment aggregate, measurement/evidence ports, deterministic
scoring interface, reports, finding and risk-proposal projection, and fixtures.
Verification: obligation/evidence/method/period substitution, self-assessment,
score manipulation, hidden negative result, proposal-as-accepted-risk,
parallel treatment/exception, stale evidence, and correction deletion pass.
Exit criteria: every assessment is reproducible from exact obligation,
evidence, method, assessor, period, and correction history; only Phase K can
accept risk, create treatment, or authorize an exception or waiver.
`v0.50.18 implementation stop reached. Run pentest for this exact commit.`

## `0.51.3` — Tenant-Surface Reference Extension And Backfill

Status: planned.
Setup: consume the authoritative `0.51.2` `TenantDataSurface` registry and
reference, never duplicate, its IDs for aggregates, blobs/attachments, audit/
evidence, subscriptions, reports, telemetry, federation/external replicas,
caches, queues, inbox/outbox, search, configuration, and other tenant-bearing state.
Goal: connect domains to authoritative lifecycle surfaces after that vocabulary exists.
Deliverables: tenant-surface contribution kind/resolver, Phase D/E backfill,
prospective registration gate, dangling/disagreement report, and fixtures.
Verification: copied retention/hold/backup/erasure fields, dangling/wrong-
tenant ID, duplicate owner, missing derived/external surface, semantic/version
disagreement, recovery-order cycle, and late surface bypass pass.
Exit criteria: domain manifests contain only exact `TenantDataSurfaceId`
references; `0.51.2` remains the sole lifecycle metadata authority and every
later tenant-bearing surface registers and links at introduction.
`v0.51.3 implementation stop reached. Run pentest for this exact commit.`

## `0.60.4` — Authorization Contribution Certification

Status: planned.
Setup: consume the authorization/redaction extension and Phase D–F backfill
from `0.60.3`, the authoritative policy interface registry, current domain
generations, deferrals, and product states.
Goal: certify authorization contribution completeness separately from defining
or backfilling those references.
Deliverables: generated domain/interface/field/purpose matrix, reference-
registry differentials, negative-policy corpus, and certification report.
Verification: dangling/mismatched interface ID, hidden field/count, stale
generation, allow-by-default, unresolved required defer, false support, and
late implementation in the certifier pass.
Exit criteria: every current domain reference resolves to authoritative policy
metadata and passes; missing behavior blocks the owner and is never added here.
`v0.60.4 implementation stop reached. Run pentest for this exact commit.`

## `0.70.5` — Workflow And Notification Contribution Certification

Status: planned.
Setup: consume the workflow/notification extension and backfill from `0.70.4`,
authoritative IR/command/event/notification registries, current generations,
deferrals, and support state.
Goal: certify automation references without moving lifecycle or mappings into
the certification layer.
Deliverables: trigger/action/audience/field completeness matrix, loop and
reauthorization differentials, end-to-end fixtures, and report.
Verification: dangling trigger/command/event, namespace collision, generic
mutation, stale authority, hidden-field notification, recursive loop,
generation mismatch, unresolved defer, and late implementation pass.
Exit criteria: referenced automation invokes only authoritative ordinary
commands and reauthorizes at dispatch; the certifier adds no mapping.
`v0.70.5 implementation stop reached. Run pentest for this exact commit.`

## `0.100.2` — Search And History Contribution Certification

Status: planned.
Setup: consume the search/history extension and Phase D–J backfill from
`0.100.1`, authoritative document schemas, deletion/redaction/rebuild owners,
current generations, deferrals, and support state.
Goal: certify discoverability without making the manifest or certifier a search authority.
Deliverables: document/facet/history completeness matrix, rebuild orchestration
differential, policy-equivalence corpus, and report.
Verification: dangling/colliding schema or facet, hidden field/count, missing
deletion, stale revocation, rebuild divergence, generation mismatch, unresolved
defer, query exhaustion, and late implementation pass.
Exit criteria: every referenced mapping is domain-owned and policy equivalent;
missing behavior blocks the domain and is not implemented here.
`v0.100.2 implementation stop reached. Run pentest for this exact commit.`

## `0.118.5` — ERP Connector Adapter Profile

Status: conditional planned milestone; implement one exact demanded ERP profile
or record it unsupported/deferred.
Setup: consume the `0.50.16` project-owned port and reconciliation semantics,
`0.52.1` workload identity, Phase F policy/redaction, credential handles,
egress allowlists, and `0.117.0` connector testkit; bind one provider/API
version, account/tenant, field ownership, conditional mutation, cursor,
idempotency, response ambiguity, and provider-effect reconciliation profile.
Goal: implement a real ERP boundary only after identity and connector security
infrastructure exists.
Deliverables: one exact hosted adapter or explicit defer record, mapping pack,
capability probe, fake provider corpus, reconcile state, operator runbook,
admission evidence, and unsupported matrix.
Verification: principal/account/tenant substitution, secret exposure, SSRF,
field smuggling, stale overwrite, duplicate/reordered event, response loss,
currency/unit drift, unconditional mutation downgrade, and cursor rollback pass.
Exit criteria: only the exact passing provider profile is supported; otherwise
the `0.50.16` port and deterministic fake remain usable without a production
ERP claim.
`v0.118.5 implementation stop reached. Run pentest for this exact commit.`

## `0.120.8` — Late-Domain Authorization Registration

Status: planned.
Setup: consume Phase K/L domain-owned authorization/redaction contributions for
privacy, inbound mail, audit export, federation, plugin/connector, and other
post-`0.60.3` interfaces through the prospective registration gate.
Goal: certify late-domain policy and redaction coverage without pretending
those domains existed during Phase F.
Deliverables: generated completeness matrix, action/resource/field/purpose
differentials, negative-policy fixtures, support-state bindings, and report.
Verification: omitted route/item/action/field, hidden count, purpose confusion,
stale policy, mail/export/federation leak, unsupported surface activation, and
allow-by-default pass.
Exit criteria: every implemented late-domain interface has one current
domain-owned authorization/redaction case; missing behavior is not implemented
here and no future-facing registration counts as implemented capability.
`v0.120.8 implementation stop reached. Run pentest for this exact commit.`

## `0.120.9` — Late-Domain Workflow And Notification Integration

Status: planned.
Setup: consume domain-owned ordinary-command, event, trigger, action, audience,
field, loop-guard, and support-state contributions for privacy, inbound-mail
proposals, audit export, federation, and plugin/connector administration.
Goal: certify late-domain automation after those domains exist without moving
their lifecycles into the workflow engine.
Deliverables: composed workflow templates, completeness/differential report,
reauthorization tests, deterministic fakes, and end-to-end fixtures.
Verification: trigger spoof/replay/storm, generic status mutation, stale
authority, hidden-field notification, recursive loop, unsupported action, and
workflow/domain-version drift pass.
Exit criteria: late-domain workflows invoke only domain-owned registered
commands and every notification reauthorizes recipients and visible fields at
dispatch; missing mappings are not first implemented here.
`v0.120.9 implementation stop reached. Run pentest for this exact commit.`

## `0.120.10` — Late-Domain Search And History Integration

Status: planned.
Setup: consume post-`0.100.1` domain-owned search/history documents, fields,
deletion/redaction behavior, facets, queues, graph references, rebuild hooks,
retention, policy, and support-state contributions.
Goal: certify late-domain discoverability without implementing mappings here or
making search an authority or information oracle.
Deliverables: generated completeness matrix, shared facet/queue composition,
rebuild orchestration, policy differentials, support filters, and report.
Verification: missing/duplicate document, hidden field/count/facet, stale
revocation, cross-organization leak, rebuild divergence, unsupported result,
and query-complexity exhaustion pass.
Exit criteria: each late-domain mapping is domain-owned and current application
reads and search return policy-equivalent visibility; missing behavior is not
implemented by this certification stop.
`v0.120.10 implementation stop reached. Run pentest for this exact commit.`

## `0.132.4` — Workspace Contribution Composition And Certification

Status: planned.
Setup: consume the workspace extension/backfill from `0.132.3`, authoritative
block/profile registries, current contribution generations, deferrals, and support state.
Goal: compose full-suite workspaces without implementing domain blocks here.
Deliverables: navigation/composition manifests, role/purpose layouts, small/
large organization profiles, accessibility journeys, completeness matrix, and report.
Verification: dangling/colliding block, hidden route/action/field/count,
profile privilege, query storm, XSS, generation mismatch, unresolved defer,
unsupported feature, and late implementation pass.
Exit criteria: composition adds no domain command, DTO, field, block, or
privilege; incomplete domain contributions fail closed.
`v0.132.4 implementation stop reached. Run pentest for this exact commit.`

## `0.138.6` — External API And SDK Contribution Certification

Status: planned.
Setup: consume the API extension/backfill from `0.138.4`, authoritative API v1
schemas, existing application services, current generations, deferrals,
subscription contracts, and support state.
Goal: assemble and freeze the supported API/SDK without implementing mappings here.
Deliverables: composed OpenAPI/schema set, private SDK generation, compatibility
matrix, subscription conformance, completeness differential, and report.
Verification: route/resource collision, dangling command/query/error, mass
assignment, cursor/consistency mismatch, hidden field, generation downgrade,
unresolved defer, SDK drift, and late implementation pass.
Exit criteria: every external mapping resolves to authoritative application and
API entries; the certifier creates no service, DTO, route, or error mapping.
`v0.138.6 implementation stop reached. Run pentest for this exact commit.`

## `0.138.7` — Transfer And Configuration Contribution Certification

Status: planned.
Setup: consume the typed transfer/configuration extension and backfill from
`0.138.5`, authoritative import/export/config registries, current generations,
deferrals, secret-reference/environment-overlay rules, and support state.
Goal: certify cross-domain transfer without a generic record fallback.
Deliverables: composed transfer manifest, staging/orchestration matrix, dry-run
impact report, round-trip corpus, completeness differential, and report.
Verification: dangling/colliding codec, secret export, mass assignment, stale
reference, partial activation, erased-data resurrection, generation downgrade,
unresolved defer, generic fallback, and late implementation pass.
Exit criteria: every transfer is authoritative-registry-referenced, typed,
staged, policy-filtered, and separately activated; the certifier adds no codec.
`v0.138.7 implementation stop reached. Run pentest for this exact commit.`

## `0.140.28` — Minimum Hosted Production Profile Go/No-Go

Status: planned; failure blocks a Hosted `1.0.0` production claim.
Setup: consume `0.18.16` feasibility outcomes and frozen transport/crypto/KMS,
storage, identity/session, hostile-input, packaging, operational, recovery, and
exact-commit evidence; distinguish mandatory Hosted baseline from optional features.
Goal: ensure repository-wide zero dependencies produce either a safe deployable
minimum profile or an explicit no-go, never misleading production wording.
Deliverables: mandatory Hosted capability matrix, exact supported/conditional/
unsupported results, blocker ledger, product/installer/API/UI claim gates, and decision.
Verification: TLS/crypto/storage/identity/input/runtime omission, planned-as-
supported evidence, unsafe project implementation, optional-as-mandatory
confusion, hidden installer path, documentation drift, and gate bypass pass.
Exit criteria: `1.0.0` proceeds as a Hosted production product only if every
mandatory baseline capability is Supported with exact evidence; otherwise the
Hosted release and claim remain blocked regardless of schedule.
`v0.140.28 implementation stop reached. Run pentest for this exact commit.`
