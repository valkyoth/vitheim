# Roadmap Coherence Completions

Document status: normative implementation handoffs

These focused stops close dependency-feasibility, requirement-discovery, and
chronological integration gaps without weakening the existing owners. They do
not authorize third-party Cargo code, move domain authority into an integration
layer, or let a future-facing fake count as implemented integration.

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

Status: planned; the binding baseline outcome is dependency-free or unsupported.
Setup: inventory each planned Hosted primitive and adapter against Rust `std`
capabilities, including TLS, cryptography, databases, OIDC/WebAuthn/SAML,
MIME, and the Wasm component runtime; bind its first implementation stop,
project-owned port, safe implementation evidence, and support/defer consequence.
Goal: resolve infeasible Hosted work before the first affected implementation,
while preserving the repository-wide prohibition on third-party Cargo code.
Deliverables: capability-to-technology feasibility matrix, earliest-owner
report, dependency-law decision record, explicit unsupported/deferred gates,
and a change protocol requiring a new exact roadmap decision before any future
policy amendment can unblock an affected adapter.
Verification: hidden transitive/native dependency, improvised crypto/protocol,
adapter work preceding its decision, admission-record-as-exception, unsupported
feature advertised as active, N0/N1 contamination, and stale `0.140.14`
revalidation pass.
Exit criteria: every affected Hosted milestone is either backed by an audited
dependency-free project implementation or is visibly blocked/deferred; no
roadmap text, admission record, or adapter can silently relax the dependency law.
`v0.18.16 implementation stop reached. Run pentest for this exact commit.`

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
Setup: enumerate Phase K/L privacy, inbound-mail, audit-export, federation,
plugin/connector, and other post-`0.60.3` interfaces and fields; consume the
prospective registration gate installed at `0.60.3`.
Goal: certify late-domain policy and redaction coverage without pretending
those domains existed during Phase F.
Deliverables: generated registrations, action/resource/field/purpose cases,
negative-policy fixtures, support-state bindings, and coverage differential.
Verification: omitted route/item/action/field, hidden count, purpose confusion,
stale policy, mail/export/federation leak, unsupported surface activation, and
allow-by-default pass.
Exit criteria: every implemented late-domain interface has one current
authorization/redaction case and no future-facing registration is counted as
implemented capability.
`v0.120.8 implementation stop reached. Run pentest for this exact commit.`

## `0.120.9` — Late-Domain Workflow And Notification Integration

Status: planned.
Setup: map ordinary commands and events for privacy, inbound-mail proposals,
audit export, federation, and applicable plugin/connector administration to
versioned triggers, actions, audiences, fields, loop guards, and support state.
Goal: certify late-domain automation after those domains exist without moving
their lifecycles into the workflow engine.
Deliverables: trigger/action descriptors, workflow templates, notification
rules, reauthorization hooks, deterministic fakes, and end-to-end fixtures.
Verification: trigger spoof/replay/storm, generic status mutation, stale
authority, hidden-field notification, recursive loop, unsupported action, and
workflow/domain-version drift pass.
Exit criteria: late-domain workflows invoke only registered application
commands and every notification reauthorizes recipients and visible fields at
dispatch.
`v0.120.9 implementation stop reached. Run pentest for this exact commit.`

## `0.120.10` — Late-Domain Search And History Integration

Status: planned.
Setup: define documents, fields, facets, queues, temporal/history events, graph
references, counts, retention, and policy behavior for privacy, inbound mail,
audit export, federation, and applicable plugin/connector administration.
Goal: certify discoverability for post-`0.100.1` domains without making search
an authority or information oracle.
Deliverables: projection mappings, rebuild/migration hooks, default facets and
queues, redaction registrations, policy differentials, and support-state filters.
Verification: missing/duplicate document, hidden field/count/facet, stale
revocation, cross-organization leak, rebuild divergence, unsupported result,
and query-complexity exhaustion pass.
Exit criteria: each implemented late domain names its search/history owner and
current application reads and search return policy-equivalent visibility.
`v0.120.10 implementation stop reached. Run pentest for this exact commit.`
