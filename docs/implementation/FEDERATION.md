# Organization Federation

Scope: `0.120.1–0.120.5`. Federation connects independently administered
Vitheim deployments without merging tenants, identities, policy roots, event
streams, encryption domains, or administrator authority. It is optional and
disabled by default.

## `0.120.1` — Organization Identity, Trust, And Connection Enrollment

Status: planned; hosted transport and identity implementations require
version-bound admission before code begins.

Setup: define stable organization/instance IDs, endpoint identity, trust bundle,
protocol/API versions, key and certificate pins, mutual administrator approval,
proof-of-control challenge, allowed purposes, connection states, rotation,
suspension, revocation, reconnect, rate limits, and audit. No connection grants
transitive trust, user federation, tenant administration, or data access.

Goal: establish explicit bilateral trust between independently owned Vitheim
instances before any resource can be discovered or shared.

Deliverables: federation-connection aggregate, signed invitation/acceptance
handshake, mutually authenticated transport port, trust-bundle rotation,
capability negotiation, connection health, security-audit integration, and
administrator runbook.

Verification: organization/endpoint impersonation, invitation theft/replay,
unknown/downgraded protocol, TLS/key substitution, rotation race, confused
tenant, unilateral activation, transitive-trust attempt, stale administrator,
revocation during requests, enumeration, and connection-flood tests pass.

Exit criteria: both organizations can prove the exact peer, protocol, keys,
purpose, and approved empty capability set; enrollment alone shares nothing.
`v0.120.1 implementation stop reached. Run pentest for this exact commit.`

## `0.120.2` — Federated Shared Spaces And Resource Projections

Status: planned.

Setup: define a shared-space ID namespaced by participating organizations,
home/coordinator authority, membership, invited tenants, purpose, resource and
field allowlists, permitted actions, data classification/residency, policy
snapshot/version, retention, legal hold, export, expiry, and revocation.
Multilateral spaces require explicit approval from every participant; adding a
participant never expands existing visibility automatically.

Goal: let cooperating companies share selected tickets, requests, incidents,
comments, attachments, or views while every original record remains owned and
authorized by its source organization.

Deliverables: shared-space aggregate, remote-resource reference/projection,
policy-filtered publication/subscription ports, participant/field/action
manifests, source-of-truth indicators, consistency/lag markers, UI/API views,
and lifecycle runbook.

Verification: hidden field/count/attachment leakage, resource substitution,
participant injection, stale policy, home-authority confusion, cross-space
cache/index keys, revoked/expired membership, residency/hold conflict,
concurrent membership changes, export bypass, and offline peer tests pass.

Exit criteria: a shared space reveals only explicitly projected resources and
actions, and every displayed value names its owning organization and freshness.
`v0.120.2 implementation stop reached. Run pentest for this exact commit.`

## `0.120.3` — Federated Work Exchange And Synchronization

Status: planned.

Setup: define namespaced remote/local work IDs, source authority, projection
version, expected-version command proposals, accepted field/event mappings,
comments and attachment references, assignments, status/lifecycle translation,
idempotency, outbox/inbox, ordering, retries, conflict/duplicate handling,
offline queues, reconciliation, and protocol/schema evolution.

Goal: allow organizations to cooperate on tickets and incidents without a
shared database, generic remote patch, last-write-wins merge, or ambiguity about
which side owns each decision.

Deliverables: federated work protocol, publication/subscription process managers,
typed proposal/accept/reject messages, projection synchronizer, conflict queue,
mapping simulator, audit/custody evidence, and operator recovery tools.

Verification: forged organization/resource, message replay/reorder/drop,
duplicate effects, stale expected version, lifecycle mismatch, unauthorized
assignment/closure, comment/attachment leakage, echo loops, split brain,
offline overflow, schema downgrade, reconcile-after-restore, and fuzz tests pass.

Exit criteria: remote work changes occur only when the owning organization
accepts an authorized typed proposal, and both sides can reconcile the complete
causal history. `v0.120.3 implementation stop reached. Run pentest for this exact commit.`

## `0.120.4` — Managed-Service Asset And Security Delegation

Status: planned.

Setup: distinguish asset owner, service provider/operator, technical contact,
data controller/processor roles, delegated purpose, asset/service scope, allowed
reads/actions, fields, evidence, approval, expiry, subdelegation prohibition,
break glass, vulnerability/alert/incident links, change windows, and liability/
responsibility statements. Asset ownership never transfers implicitly.

Goal: support a company managing another company's assets, vulnerabilities,
alerts, incidents, or remediation while preserving the customer's authority,
tenant boundary, data policy, and complete accountability.

Deliverables: managed-service agreement/delegation aggregate, scoped remote
asset projection, operator work queues, proposed remediation/change commands,
customer approval flow, responsibility matrix, service evidence/reporting, and
revocation/offboarding runbook.

Verification: provider privilege amplification, hidden asset discovery,
cross-customer confusion, stale/expired delegation, unauthorized containment/
patch/change, subdelegation, self-approval, false ownership, evidence removal,
emergency abuse, provider compromise, revocation during work, and export pass.

Exit criteria: every provider action cites the customer-approved agreement,
purpose, resource scope, role path, current policy, and owning-customer decision
where required. `v0.120.4 implementation stop reached. Run pentest for this exact commit.`

## `0.120.5` — Federation Conformance, Revocation, And Recovery

Status: planned.

Setup: enumerate connection/shared-space/work/managed-service API surfaces,
protocol and schema versions, trust rotations, tenant/RBAC/ABAC matrices,
outages/partitions, quotas, observability, backup/restore, revocation,
offboarding, retention/erasure/hold, incident response, and support boundaries.

Goal: prove federation fails closed across two or more independently operated
deployments and can be completely disconnected without corrupting local truth.

Deliverables: multi-instance adversarial harness, generated authorization
registry cases, protocol compatibility corpus, failure/recovery simulator,
revocation and data-disposition verifier, inter-organization audit report,
support matrix, and joint incident/offboarding runbooks.

Verification: twin organizations/tenants with colliding IDs, malicious peer,
compromised key/admin/plugin, protocol skew/downgrade, partitions/reordering,
quota exhaustion, revocation/rotation races, restored stale peer, shared-space
closure, legal-hold conflict, data cleanup, timing/count inference, and pentest
across both trust boundaries pass.

Exit criteria: disconnecting a peer removes every capability and scheduled
effect within documented bounds, preserves attributable required history, and
leaves each organization's authoritative state independently operable.
`v0.120.5 implementation stop reached. Run pentest for this exact commit.`
