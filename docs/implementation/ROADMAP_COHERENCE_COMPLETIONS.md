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

## `0.30.23` — Domain Surface Contribution Contract

Status: planned.
Setup: define one versioned `DomainSurfaceContribution` manifest keyed to the
domain requirement owner and covering headless application commands/reads and
internal DTOs; policy/redaction declarations; workspace contribution
descriptors; external API resource/command/query/error/pagination/consistency
mappings; workflow-trigger/ordinary-command/notification declarations;
permission-aware search/history/deletion/rebuild mappings; typed import/export/
configuration codecs and secret/environment-overlay handling; and tenant
ownership, retention, hold, backup/restore, erasure, export class, rebuild
source, recovery order, and external-copy disposition.
Goal: make every domain own its surfaces at introduction so late milestones
compose and certify rather than implement a monolithic integration layer.
Deliverables: bounded manifest schema, stable domain/surface IDs, registry,
dependency-direction rules, generated completeness/differential checker,
explicit not-applicable/deferred reason and retest records, and fixtures.
Verification: missing/duplicate owner, UI-only command, unregistered field,
search-without-deletion, transfer escape hatch, secret material export,
surface-without-lifecycle, mutable late override, false not-applicable,
dead retest owner, and manifest/parser work-budget exhaustion pass.
Exit criteria: every later domain is mechanically unable to exit until each
required contribution is implemented and tested at that domain stop or is
explicitly deferred to one exact owner; a late certification stop cannot fill
missing domain behavior.
`v0.30.23 implementation stop reached. Run pentest for this exact commit.`

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
