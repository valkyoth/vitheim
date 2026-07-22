# Phase K — Compliance And Risk

Scope: `0.101.0–0.110.0`. Frameworks are signed versioned data, not hard-coded authority.

## `0.101.0` — Signed Framework-Pack Format
Status: planned. Setup: canonical manifest/content digests, signer/trust, compatibility, licensing, downgrade/expiry. Goal: authentic portable packs. Deliverables: pack model, validator, signature port. Verification: substitution, downgrade, wrong signer, ambiguity, bombs, fuzz pass. Exit criteria: untrusted packs cannot activate. `v0.101.0 implementation stop reached. Run pentest for this exact commit.`

## `0.102.0` — Requirement And Control Graph
Status: planned. Setup: typed requirements/controls/mappings, applicability, versions, provenance, cycle/work limits. Goal: framework-neutral compliance graph. Deliverables: graph model/evaluator. Verification: malicious cycles/mappings, hidden obligations, duplicates, traversal exhaustion pass. Exit criteria: mappings retain source/version. `v0.102.0 implementation stop reached. Run pentest for this exact commit.`

## `0.103.0` — Evidence Requirements And Lineage
Status: planned. Setup: evidence type, subject, period, collector, digest, custody, freshness, access. Goal: verifiable control evidence. Deliverables: requirements, evidence aggregate, lineage report. Verification: forgery, detached provenance, stale/reused evidence, cross-tenant access pass. Exit criteria: satisfaction cites admissible evidence. `v0.103.0 implementation stop reached. Run pentest for this exact commit.`

## `0.104.0` — NIST CSF Pack
Status: planned. Setup: pin official version/source, licensing, mappings, applicability, signing. Goal: versioned NIST CSF support. Deliverables: pack, provenance, fixtures, mapping review. Verification: source drift, activation/downgrade, mapping integrity, conflict tests pass. Exit criteria: claims are limited to reviewed mappings. `v0.104.0 implementation stop reached. Run pentest for this exact commit.`

## `0.105.0` — DORA Pack
Status: planned. Setup: pin authoritative text/version, applicability/jurisdiction, evidence, licensing, signing. Goal: governed DORA support. Deliverables: pack and applicability/evidence fixtures. Verification: applicability bypass, missing mandatory evidence, downgrade/conflict, source drift pass. Exit criteria: legal applicability is explicit, not inferred silently. `v0.105.0 implementation stop reached. Run pentest for this exact commit.`

## `0.106.0` — ITIL Practice Packs
Status: planned. Setup: version/licensing metadata, practice mappings, optional overlays, precedence, activation. Goal: configurable ITIL-aligned practices. Deliverables: reviewed packs and overlay fixtures. Verification: licensing omission, unsafe override, workflow conflict, downgrade, activation pass. Exit criteria: no claim exceeds licensed reviewed content. `v0.106.0 implementation stop reached. Run pentest for this exact commit.`

## `0.107.0` — Licensed And Custom Standards Importer
Status: planned. Setup: isolated import, licensing declaration, schema/signature, quotas, mapping review, quarantine. Goal: safely onboard authorized standards. Deliverables: importer, validator, review report. Verification: malicious content, mapping escalation, parser bombs, license absence, signature substitution pass. Exit criteria: import never equals activation. `v0.107.0 implementation stop reached. Run pentest for this exact commit.`

## `0.108.0` — Risk, Treatment, And Exception Workflows
Status: planned. Setup: risk owner, scoring version, treatment, acceptance authority, expiry, controls, evidence. Goal: governed risk decisions. Deliverables: aggregates/workflows and exception review. Verification: self-acceptance, score tamper, immortal/broad exception, stale owner, hidden decision pass. Exit criteria: accepted risk is scoped and expiring. `v0.108.0 implementation stop reached. Run pentest for this exact commit.`

## `0.109.0` — Control Testing, Findings, And Reports
Status: planned. Setup: test plan/executor/time, samples, results, findings, review, report policy. Goal: evidence-backed assurance. Deliverables: test/finding aggregates and bounded reports. Verification: falsified result, sample substitution, unauthorized report, aggregate inference, rerun history pass. Exit criteria: results retain complete lineage. `v0.109.0 implementation stop reached. Run pentest for this exact commit.`

## `0.110.0` — Pack Impact And Conflict Simulator
Status: planned. Setup: precedence rules, current/candidate snapshots, deterministic simulation, budgets, activation gate. Goal: explain changes before activation. Deliverables: simulator, conflict/impact report, approval binding. Verification: precedence ambiguity, hidden impacts, graph bombs, runtime/simulation differential pass. Exit criteria: activation binds the reviewed simulation digest. `v0.110.0 implementation stop reached. Run pentest for this exact commit.`

