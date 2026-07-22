# Initial Vitheim Idea And Architecture Discussion

> Historical design input retained verbatim apart from this heading. Later
> sections contain the final discussion and naming decision. Normative project
> policy lives in the other documents in this directory.

Below is the architecture I would actually build. I use platform-* as a neutral crate prefix until the product receives a permanent name.

Architecture Plan: A Security-First Rust Service Operations Platform
1. Executive decision

This should not be designed as a direct ServiceNow clone.

It should be a new service operations platform built around:

A universal work and case model.
Strongly typed first-party applications.
Event-driven state changes.
Durable workflows.
Policy-controlled actions.
Versioned and optional framework packs.
A provenance-aware service and asset graph.
Capability-restricted WebAssembly components.
Database portability through semantic storage interfaces.
Search as a first-class platform capability.
AI as an optional, untrusted advisory subsystem.
Complete auditability and evidence lineage.
A modular Rust workspace with no_std at the pure logic layers.

The product should support the functional territory normally associated with:

Product area	First-party 1.0 capabilities
IT service management	Incidents, requests, problems, changes, releases, major incidents, postmortems, SLAs, approvals and service catalog
Security operations	Alerts, security incidents, vulnerability cases, forensic timelines and evidence
IT operations	Event ingestion, deduplication, correlation, service health and topology-aware impact
Service configuration	Assets, configuration items, services, relationships, discovery imports and reconciliation
Risk and compliance	Risks, controls, obligations, exceptions, evidence, control tests and framework mappings
Knowledge	Articles, known errors, runbooks, contextual suggestions and permission-safe search
Platform engineering	Custom records, forms, workflows, policies, reports, portals, integrations and WASM extensions
General case management	Customer, HR, legal, facilities or organization-specific case types built through the same platform

The objective is not to reproduce every historical screen or module. The objective is to offer the same broad problem-solving power through a cleaner platform.

2. What to retain and change from the attached concept

The attached proposal correctly identifies three important principles:

A lightweight kernel with decoupled modules.
WASM-based extensibility rather than unrestricted server-side JavaScript.
Append-only events for important business history.

It also correctly separates pure no_std logic from operating-system and I/O boundaries.

Several parts should be changed before implementation.

2.1 Do not build every dependency yourself

The draft proposes custom cryptography, PostgreSQL and MySQL wire protocols, MongoDB wire support and a custom HTTP server. It also proposes replacing WASM with a custom scripting virtual machine and implementing the network event loop manually.

That would increase, rather than reduce, security risk.

The project should not independently implement:

TLS.
General-purpose cryptographic algorithms.
OIDC, SAML or WebAuthn protocol stacks.
HTTP/2 or HTTP/3.
Database authentication and wire protocols.
A general-purpose WASM runtime.
Unicode normalization.
Compression formats.
Certificate validation.
A production asynchronous I/O runtime.

These are large, adversarial protocol surfaces. The correct strategy is to isolate a small number of carefully chosen dependencies behind narrow internal interfaces.

2.2 Do not optimize for the smallest Cargo.lock

Supply-chain security is not equivalent to dependency count.

A 200-line custom TLS implementation is vastly more dangerous than a mature, heavily tested TLS stack with multiple transitive dependencies.

Optimize instead for:

Number of trusted security domains.
Auditability of dependencies.
Reachability of dependency code.
Isolation from business logic.
Ability to replace an implementation.
Reproducible builds.
Locked and reviewed updates.
Minimal features enabled.
No dependencies in the pure domain kernel.
2.3 Do not start as a microservice estate

Start as a modular deployable, not as dozens of network services.

A single repository and a single application can still have strict architectural isolation. Premature microservices would introduce:

Distributed transactions.
Partial failures.
Service-to-service authorization.
Version skew.
Message compatibility problems.
Operational complexity.
Difficult local development.
More attack surfaces.

The initial production deployment should support:

platformd --mode all

The same crates can later be deployed as separate processes:

platform-api
platform-worker
platform-ingest
platform-indexer
platform-agent

Process boundaries must remain deployment choices rather than domain architecture requirements.

2.4 Do not promise unrestricted overrides

The user should be able to customize almost everything, but not silently bypass safety or legal obligations.

An override must be represented as a governed object containing:

Requested deviation.
Business justification.
Affected requirements.
Risk owner.
Approver.
Scope.
Effective date.
Expiration date.
Compensating controls.
Supporting evidence.
Review schedule.
Revocation reason.

A normal administrator may alter routing, forms, labels or local process choices. They should not be able to disable tenant isolation, rewrite audit history or remove a legally required control without an explicit exception process.

3. Architectural laws

These rules should be enforced through workspace lints and dependency checks.

Law 1: Domain logic has no I/O

Domain crates never:

Open sockets.
Read files.
Execute SQL.
Call external services.
Read environment variables.
Access the system clock directly.
Generate randomness directly.
Invoke AI models.
Send notifications.

They receive all external facts through typed inputs.

Law 2: State changes enter through commands

No API, plugin, workflow or administrator directly mutates database records.

Every change is expressed as a command:

CreateIncident
AssignWorkItem
AddComment
AcceptRisk
ActivateFrameworkPack
ApproveChange
CorrelateAlert
CloseSecurityIncident

The command handler either rejects the command or emits events.

Law 3: Events are facts, not mutable records

Events describe completed decisions:

IncidentCreated
WorkItemAssigned
RiskAccepted
FrameworkPackActivated
ChangeApproved
AlertCorrelated
SecurityIncidentClosed

Events are immutable once committed.

Law 4: Projections are disposable

Search indexes, dashboards, list views, metrics and denormalized tables are projections. They must be rebuildable from authoritative information.

Law 5: Authorization applies at every boundary

Authorization is required when:

Accepting a command.
Reading a record.
Returning search results.
Rendering a field.
Running a workflow activity.
Invoking a plugin capability.
Retrieving AI context.
Exporting data.
Sending a notification.
Executing a webhook.
Reading an attachment.
Law 6: Frameworks remain data

ITIL, NIST, DORA and other frameworks must not be compiled into core business logic.

They are signed, versioned packages installed through a framework-pack interface.

Law 7: AI has no implicit authority

AI cannot:

Bypass policy.
Read a database directly.
Invent record identifiers.
Execute arbitrary commands.
Approve its own actions.
silently modify a ticket.
access another tenant.
retrieve hidden fields.
alter audit events.
Law 8: Database adapters implement semantics

The platform does not expose generic database CRUD to domain code.

Adapters implement semantic storage capabilities such as atomic event appends, optimistic concurrency and projection checkpoints.

Law 9: Untrusted input is bounded

Every parser has explicit limits for:

Input bytes.
Recursion depth.
Number of fields.
String length.
Collection length.
Attachment size.
Decompression ratio.
Workflow instructions.
Plugin memory.
Plugin execution time.
Search complexity.
Report complexity.
Law 10: Every important result is explainable

The platform must answer questions such as:

Why was this incident assigned to this team?
Why was this field hidden?
Why did this alert join this incident?
Which workflow rule blocked closure?
Which framework requirement created this task?
Which evidence supports this control?
Which records caused this search result?
Which model and prompt produced this AI suggestion?
4. Correct no_std strategy

The complete server cannot meaningfully be no_std. Networking, files, process management, operating-system threads and other hosted functionality require platform integration. Rust’s no_std environment links core rather than std; heap collections require alloc, while operating-system integration belongs in hosted layers.

Use three architectural tiers.

Tier N0: #![no_std], no allocator

Suitable for:

Identifiers.
Fixed-capacity values.
State discriminants.
Error codes.
Capability identifiers.
Hash and signature representations.
Bounded parsing primitives.
Small decision functions.
Core policy operators.

These crates should work in constrained agents, browser WASM, kernels or embedded collectors.

Tier N1: #![no_std] with alloc

Suitable for:

Domain entities.
Commands and events.
Workflow intermediate representation.
Policy models.
Query abstract syntax trees.
Schema definitions.
Evidence models.
Framework-pack models.
Search plans.
Custom record values.

These crates may use Vec, String, BTreeMap and Box, but remain independent of the operating system.

Tier H: Hosted std

Required for:

HTTP.
TLS.
Database drivers.
Async runtime.
Filesystem access.
WASM hosting.
Identity protocols.
Search index implementations.
AI providers.
Message queues.
Email.
Object storage.
Operating-system agents.

The expected dependency direction is:

N0 foundation
    ↓
N1 models and deterministic engines
    ↓
host service orchestration
    ↓
adapters and protocol implementations
    ↓
binaries and user interfaces

Nothing in an inner layer may depend on an outer layer.

5. Repository and workspace layout

Keep the core platform in one repository until at least 1.0.0.

platform/
├── Cargo.toml
├── rust-toolchain.toml
├── deny.toml
├── crates/
│   ├── foundation/
│   ├── kernel/
│   ├── domain/
│   ├── workflow/
│   ├── policy/
│   ├── storage/
│   ├── search/
│   ├── compliance/
│   ├── plugin/
│   ├── integration/
│   ├── ai/
│   ├── api/
│   ├── ui/
│   └── testkit/
├── bins/
│   ├── platformd/
│   ├── platform-worker/
│   ├── platform-ingest/
│   ├── platform-indexer/
│   ├── platform-agent/
│   └── platformctl/
├── packs/
│   ├── itsm/
│   ├── secops/
│   ├── compliance/
│   └── examples/
├── wit/
├── schemas/
├── migrations/
├── threat-models/
├── fuzz/
├── proofs/
├── conformance/
├── deployment/
├── docs/
└── tests/

A large internal workspace does not mean publishing every crate to crates.io.

Most crates should initially remain workspace-private.

6. Crate topology
6.1 Foundation crates
Crate	Environment	Responsibility
platform-id	N0	Typed tenant, record, event, command and correlation identifiers
platform-time	N0	Logical time, timestamps, durations and injected clock contracts
platform-error	N0	Stable error categories and machine-readable error codes
platform-budget	N0	Input, memory, recursion and execution budgets
platform-fixed	N0	Fixed-capacity strings, arrays and byte buffers
platform-value	N1	Canonical typed dynamic values
platform-codec	N0/N1	Bounded deterministic internal encoding
platform-schema	N1	Record schemas, field constraints and schema evolution
platform-capability	N0/N1	Stable capability names, scopes and constraints
platform-context	N1	Actor, tenant, correlation and execution context
6.2 Kernel crates
Crate	Responsibility
platform-command	Command envelopes, idempotency and expected-version rules
platform-event	Event envelopes, metadata, causality and schema versions
platform-aggregate	Pure decide and evolve mechanics
platform-journal-model	Stream positions, checkpoints and append contracts
platform-projection-model	Projection offsets, rebuilds and consistency tokens
platform-query	Database-independent query AST
platform-audit-model	Security audit event definitions
platform-evidence-model	Evidence, provenance and integrity references
platform-crypto-api	Crypto-provider traits without algorithm implementations
platform-tenant	Tenant boundaries, partitions and data-location metadata
6.3 Domain crates
Crate	Primary aggregates
platform-work	Shared work-item components
platform-task	Generic tasks and checklists
platform-incident	Operational incidents and major incidents
platform-request	Service requests and fulfillment
platform-catalog	Catalog items, offerings and request forms
platform-problem	Problems, workarounds and known errors
platform-change	Changes, assessments, approvals and scheduling
platform-release	Releases and deployment records
platform-alert	Normalized alerts and correlation candidates
platform-secops	Security incidents and response activities
platform-vulnerability	Findings, exposure cases and remediation
platform-risk	Risks, treatments, acceptance and exceptions
platform-control	Controls, tests and implementation status
platform-obligation	Legal, contractual and framework obligations
platform-evidence	Evidence packages and lineage
platform-asset	Assets and lifecycle
platform-service	Business and technical services
platform-relationship	Typed graph relationships
platform-knowledge	Articles, runbooks and known solutions
platform-sla	Service targets, schedules and breach events
platform-approval	Approval policies and decisions
platform-case	Generic case-management foundation
platform-notification-model	Notification requests and templates
6.4 Engine crates
Crate	Responsibility
platform-kernel	Command pipeline and aggregate orchestration
platform-workflow-ir	Deterministic workflow representation
platform-workflow-engine	Durable workflow execution
platform-policy-model	Policies, facts, decisions and obligations
platform-policy-engine	Deterministic authorization and policy evaluation
platform-compliance-engine	Applicability, controls, evidence and pack overlays
platform-correlation	Alert deduplication and correlation algorithms
platform-search-plan	Search query planning and ranking contracts
platform-scheduler	Timers, leases, retries and scheduled commands
platform-reconciliation	CMDB fact merging and source precedence
platform-notification	Notification routing and delivery state
platform-report	Report definitions and bounded execution plans
6.5 Storage crates
Crate	Responsibility
platform-storage-api	Semantic persistence ports
platform-storage-testkit	Mandatory adapter conformance suite
platform-storage-memory	Deterministic test adapter
platform-storage-sqlite	Single-node and developer deployments
platform-storage-postgres	PostgreSQL production adapter
platform-storage-mysql	MySQL production adapter
platform-storage-mongodb	MongoDB production adapter
platform-storage-surreal	SurrealDB production adapter
platform-blob-api	Attachment and object storage port
platform-blob-fs	Local filesystem blob adapter
platform-blob-object	S3-compatible object-store adapter
platform-queue-api	Work queue abstraction
platform-queue-journal	Default journal-backed queue
platform-cache-api	Optional cache interface
6.6 WASM crates
Crate	Responsibility
platform-plugin-model	Manifests, permissions and compatibility metadata
platform-plugin-sdk	Public SDK for WASM component authors
platform-plugin-host	WASM runtime integration
platform-plugin-policy	Plugin capability authorization
platform-plugin-registry	Installation, signing, approval and rollout
platform-plugin-testkit	Determinism, limits and compatibility tests
6.7 Hosted integration crates
Crate	Responsibility
platform-runtime	Runtime-neutral hosted orchestration
platform-runtime-async	Selected async runtime implementation
platform-api-model	Stable API request and response structures
platform-api-http	HTTP API and streaming endpoints
platform-identity	OIDC, SAML, WebAuthn and service identities
platform-directory	Group and directory synchronization
platform-webhook	Signed outbound and validated inbound webhooks
platform-mail	Email ingestion and delivery
platform-ingest	Alert and event ingestion pipeline
platform-agent-protocol	Remote collector protocol
platform-agent-runtime	Hosted collector and integration agent
platform-export	Policy-aware export
platform-import	Validated migration and bulk import
6.8 Search and AI crates
Crate	Responsibility
platform-search-api	Search engine contract
platform-search-memory	Test search engine
platform-search-lexical	Lexical and faceted index
platform-search-vector	Optional vector index adapter
platform-search-graph	Relationship and impact search
platform-ai-api	Model-neutral inference contracts
platform-ai-broker	Policy, redaction, routing and budgets
platform-ai-context	Permission-safe context assembly
platform-ai-eval	Evaluation sets and model quality gates
platform-ai-agent	Restricted command proposal mechanism
6.9 Product and UI crates
Crate	Responsibility
platform-ui-model	Declarative forms, panels, actions and views
platform-ui-server	Server rendering and backend-for-frontend
platform-ui-web	Rust/WASM browser client
platform-builder	Schema, workflow, policy and application compiler
platform-dashboard	Dashboard and report presentation
platform-portal	External requester portal
platform-admin	Tenant and platform administration
7. Core domain model
7.1 Do not create one universal mutable ticket table

A single dynamic record table eventually becomes another Glide-like platform.

Instead, use composition.

WorkItem
├── Identity
├── Classification
├── Lifecycle
├── Ownership
├── Timing
├── SecurityLabels
├── Relationships
├── Collaboration
├── ComplianceContext
└── CustomFields

Domain-specific aggregates add invariants:

Incident
├── WorkItem
├── Impact
├── Urgency
├── ServiceImpact
├── RestorationState
└── MajorIncidentState

Change
├── WorkItem
├── RiskAssessment
├── ImplementationPlan
├── ValidationPlan
├── BackoutPlan
├── ChangeWindow
└── ApprovalState

The shared model improves consistency without pretending that a vulnerability, service request and change are the same thing.

7.2 Custom records

Organizations still need custom applications.

A custom record type is defined by:

RecordType
├── Stable type identifier
├── Schema version
├── Fields
├── Validation rules
├── Command definitions
├── State machine
├── Relationships
├── Security policies
├── Search projection
├── UI definition
└── Migration definitions

Custom records use a canonical Value type:

pub enum Value {
    Null,
    Bool(bool),
    Signed(i128),
    Unsigned(u128),
    Decimal(Decimal),
    Text(BoundedText),
    Bytes(BoundedBytes),
    Timestamp(Timestamp),
    Duration(Duration),
    Identifier(TypedId),
    List(BoundedList<Value>),
    Object(BoundedMap<FieldId, Value>),
    Reference(EntityRef),
}

There should be no arbitrary executable validation embedded inside schemas. Complex validation is handled by policy or deterministic WASM validators.

7.3 Entity relationships

Every relationship is a first-class record.

Relationship
├── relationship_id
├── tenant_id
├── source_entity
├── relationship_type
├── target_entity
├── valid_from
├── valid_until
├── recorded_at
├── source
├── confidence
├── evidence
└── security_labels

Examples:

Service DEPENDS_ON Database
Incident AFFECTS Service
Change MODIFIES Asset
Control MITIGATES Risk
Evidence SUPPORTS ControlTest
Alert OBSERVED_ON Asset
User OWNS Service
KnowledgeArticle RESOLVES Problem
8. Command and event architecture
8.1 Pure aggregate interface

The core decision mechanism should remain deterministic.

pub trait Aggregate {
    type State;
    type Command;
    type Event;
    type Error;

    fn decide(
        state: &Self::State,
        command: &Self::Command,
        context: &DecisionContext,
    ) -> Result<EventBatch<Self::Event>, Self::Error>;

    fn evolve(
        state: &mut Self::State,
        event: &Self::Event,
    );
}

decide performs no I/O.

The host runtime:

Loads prior events or a snapshot.
Rebuilds aggregate state.
Evaluates authorization.
Calls decide.
Encodes emitted events.
Appends them with an expected stream version.
Writes outbox messages atomically.
Returns a write receipt.
Updates projections asynchronously.
8.2 Command envelope

Every accepted command contains:

CommandEnvelope
├── command_id
├── command_type
├── command_schema_version
├── tenant_id
├── target
├── expected_version
├── actor
├── authentication_context
├── authorization_context
├── idempotency_key
├── correlation_id
├── causation_id
├── requested_at
├── client_information
├── policy_snapshot
└── payload
8.3 Event envelope
EventEnvelope
├── event_id
├── event_type
├── event_schema_version
├── tenant_id
├── stream_id
├── stream_version
├── partition
├── partition_position
├── valid_at
├── recorded_at
├── actor
├── command_id
├── correlation_id
├── causation_id
├── policy_decision_id
├── workflow_instance_id
├── integrity_previous
├── payload
└── metadata
8.4 Consistency model

Guarantee:

Strong ordering within one aggregate stream.
Atomic append of one aggregate’s event batch.
Atomic event plus outbox write.
Optimistic concurrency through expected versions.
Idempotent command submission.
Eventual consistency for projections.
Explicit read-after-write consistency tokens.
At-least-once background delivery.
Idempotent consumers.

Do not claim global exactly-once execution.

8.5 What is event sourced

Event-source:

Work items.
Workflow instances.
Policies and configuration changes.
Framework-pack activation.
Approvals.
Risks and exceptions.
Asset and service facts.
Plugin lifecycle.
Security-relevant administrative actions.

Do not put large binary attachments or every raw telemetry event directly into aggregate streams.

Large or high-volume content should be placed in blob storage with immutable references and integrity metadata.

9. Database-agnostic persistence
9.1 Why a generic CRUD trait is insufficient

This is too weak:

trait StorageEngine {
    fn insert(collection: &str, bytes: &[u8]);
    fn query(collection: &str, query: &[u8]);
}

It cannot express:

Expected stream version.
Atomic append.
Transaction boundaries.
Durable outbox.
Consistent projection checkpoints.
Compare-and-swap.
Tenant partitions.
Leases.
Idempotency.
Blob integrity.
Search indexing.
Graph traversal capabilities.
9.2 Semantic storage ports

Use separate contracts.

EventJournal
ProjectionStore
SnapshotStore
OutboxStore
InboxStore
LeaseStore
SchemaRegistry
ConfigurationStore
BlobStore
SearchIndex
GraphIndex
SecretStore
KeyProvider

A database adapter may implement several ports.

For example:

PostgreSQL adapter
├── EventJournal
├── ProjectionStore
├── OutboxStore
├── InboxStore
├── LeaseStore
├── SchemaRegistry
└── ConfigurationStore

Search and blobs can still be backed by separate systems.

9.3 Required production capabilities

A backend must pass these before being called production-supported:

Capability	Requirement
Atomic append	Events and outbox commit together
Optimistic concurrency	Append fails on wrong stream version
Idempotency	Repeated command key cannot duplicate effects
Tenant enforcement	Tenant partition cannot be omitted
Ordered reads	Per-stream ordering is stable
Durable checkpoints	Projectors resume safely
Lease semantics	Only one active lease holder for protected work
Transaction rollback	Failed writes leave no partial state
Migration safety	Interrupted migrations can resume or roll back
Backup validation	Restored data passes integrity and replay tests
Integrity storage	Event integrity fields are preserved exactly
Bounded query execution	Adapter supports limits and cancellation
9.4 Capability negotiation

Adapters report capabilities:

AtomicAppend
MultiRecordTransaction
CompareAndSwap
ConsistentSnapshot
FullTextSearch
VectorSearch
GraphTraversal
ChangeFeed
TimeToLive
JsonProjection
AdvisoryLease
OnlineIndexBuild
PointInTimeRecovery

Core business correctness must depend only on mandatory capabilities.

Optional capabilities improve performance but cannot change user-visible correctness.

9.5 Canonical journal structures

Logical storage objects:

journal_stream
journal_event
journal_checkpoint
projection_checkpoint
snapshot
outbox_message
inbox_receipt
lease
schema_definition
pack_definition
plugin_definition
configuration_revision
blob_reference
integrity_checkpoint

Each adapter maps these to its native storage model.

9.6 Supported backend profiles
SQLite

Use for:

Development.
Evaluation.
Personal or small single-node installations.
Offline edge installations.
Automated tests.

Do not initially advertise multi-node HA.

PostgreSQL

Use as the reference production backend.

It should receive the deepest performance, migration, recovery and fault-injection testing.

MySQL

Provide equal business behavior through the conformance suite, even when implementation details differ.

MongoDB

Use collections and transactional capabilities internally, but expose the same event-journal semantics.

SurrealDB

Use its relational and graph features where beneficial, while still implementing canonical platform semantics.

9.7 Cross-backend portability

Database portability requires:

Canonical event representation.
Canonical schema identifiers.
Stable binary export format.
Exported projection definitions.
Blob manifests.
Integrity checkpoints.
Import validation.
Reconciliation reports.
Source and destination position mapping.

Never promise that a customer can point the same binaries at a different database without performing a migration.

10. Durable workflow engine
10.1 Workflow model

A workflow definition is compiled into a deterministic intermediate representation.

Supported nodes:

Start
End
Evaluate
HumanTask
Approval
Command
Activity
WaitForEvent
WaitUntil
Timer
Parallel
Join
Choice
Loop
Subworkflow
Compensate
Escalate
EmitSignal
Fail
10.2 Pure interpreter and hosted activities

The interpreter is no_std + alloc.

It evaluates workflow state and yields requested effects:

RunActivity
CreateHumanTask
ScheduleTimer
SubscribeToEvent
IssueCommand
RequestApproval
CompleteWorkflow
CompensateActivity

The hosted runtime performs the effect and sends the result back as another workflow event.

This prevents workflow definitions from obtaining uncontrolled I/O.

10.3 Durable guarantees

Every workflow step has:

Stable step identifier.
Input schema.
Output schema.
Retry policy.
Timeout policy.
Idempotency key.
Compensation behavior.
Required capabilities.
Authorization context.
Data-classification constraints.
Audit requirements.

A worker crash must not lose or repeat a non-idempotent action without detection.

10.4 Workflow versioning

Running instances remain pinned to their original version unless migrated.

A workflow update includes:

Old version.
New version.
Compatible nodes.
Removed nodes.
State-mapping rules.
Migration preconditions.
Rollback behavior.
Dry-run results.
Approval record.
10.5 Visual and configuration-as-code authoring

The visual editor and text representation compile to the same canonical workflow package.

The visual editor must not store hidden flags that cannot be represented in source control.

Recommended lifecycle:

Draft
→ Validate
→ Simulate
→ Security review
→ Approve
→ Sign
→ Stage
→ Activate
→ Observe
→ Roll back or promote
11. Policy and authorization
11.1 Policy decision model

A policy evaluation returns:

pub enum Decision {
    Permit,
    Deny,
    Challenge(Challenge),
    PermitWithObligations(ObligationSet),
    Indeterminate(PolicyError),
}

Obligations can require the caller to:

Hide specific fields.
Require stronger authentication.
Collect a reason.
Add an audit event.
Obtain another approval.
Restrict export format.
Keep processing in a region.
Prevent AI processing.
Apply a watermark.
Remove attachment access.
Recheck authorization before execution.
11.2 Combined access model

Use a combination of:

RBAC for comprehensible job-level permissions.
ABAC for context and data attributes.
ReBAC for ownership and graph relationships.
Explicit capabilities for services, agents and plugins.

Example:

Permit incident.read
when
    actor.tenant == incident.tenant
    and (
        actor is incident.assignee
        or actor belongs_to incident.assignment_group
        or actor owns incident.affected_service
        or actor has role major_incident_manager
    )
    and incident.security_classification <= actor.clearance
11.3 Policy evaluation order
1. Immutable platform safety invariants
2. Tenant isolation
3. Jurisdiction and legal obligations
4. Organization-wide security baseline
5. Enabled framework packs
6. Domain policy
7. Workflow policy
8. Record-level policy
9. Time-limited exception

A lower layer cannot silently weaken a higher layer.

11.4 Break-glass access

Break-glass access requires:

Strong authentication.
Explicit reason.
Restricted duration.
Narrow scope.
Notification to designated reviewers.
Separate audit event.
Review workflow.
Automatic expiration.
Optional dual control.
12. Compliance and framework architecture
12.1 Framework-neutral control graph

Do not create a column such as dora_compliant = true.

Use a graph:

Framework
→ Requirement
→ ControlObjective
→ Control
→ Implementation
→ EvidenceRequirement
→ Evidence
→ Test
→ TestResult
→ Finding
→ Risk
→ Treatment
→ Exception

A single control may support multiple requirements.

12.2 Pack categories
Pack type	Example
Regulatory	DORA, NIS2 or organization-specific legal obligations
Outcome framework	NIST CSF
Control catalog	NIST SP 800-53 or licensed ISO mappings
Service-management practice	ITIL
Contractual	Customer-specific security schedules
Internal	Corporate policy and architecture standards
AI governance	NIST AI RMF or internal model policy

NIST CSF 2.0 defines high-level cybersecurity outcomes and intentionally does not prescribe exactly how organizations must achieve them, making it suitable as a versioned outcome pack rather than a hard-coded process.

DORA is a legal-regulatory pack with applicability, incident, resilience, testing and evidence consequences; the regulation has applied since January 17, 2025.

As of July 2026, PeopleCert lists both ITIL Foundation Version 5 and ITIL 4 offerings. This demonstrates why the platform must support multiple framework versions concurrently instead of treating “ITIL” as one permanent workflow.

12.3 Framework-pack structure
FrameworkPack
├── Manifest
├── Source and licensing metadata
├── Framework version
├── Effective dates
├── Applicability rules
├── Requirement definitions
├── Control mappings
├── Evidence requirements
├── Workflow overlays
├── Policy overlays
├── Required fields
├── Reports
├── Tests
├── Migration rules
└── Digital signature
12.4 Workflow overlays

A pack should not replace an organization’s workflow.

It may contribute overlays:

RequireField
RequireApproval
AddGuard
AddTask
AddEvidence
AddNotification
AddTimer
RestrictTransition
RequireReason
RequireClassification
RequireReport

Example:

Base incident workflow:
Open → Investigating → Resolved → Closed

DORA overlay:
- Require reportability assessment for qualifying organizations.
- Require impact and duration evidence.
- Require regulatory reporting decision.
- Prevent closure while mandatory evidence is absent.
12.5 Pack activation

Activation is a controlled operation:

Upload
→ Verify signature
→ Validate licensing metadata
→ Analyze applicability
→ Compare with existing packs
→ Detect conflicts
→ Simulate workflow effects
→ Preview newly required fields and tasks
→ Approve
→ Stage
→ Activate

The preview should answer:

How many active records would become nonconforming?
Which workflows would change?
Which new fields become required?
Which policies conflict?
Which SLAs or timers change?
Which evidence is missing?
Which users lose or gain access?
Which reports become available?
12.6 Framework conflicts

Conflicts are explicit objects.

FrameworkConflict
├── participating rules
├── affected object types
├── example decisions
├── precedence rule
├── resolution
├── approver
└── evidence

The platform must never resolve a conflict merely through load order.

12.7 Claims and intellectual property

The product should say:

Supports workflows and evidence mappings for Framework X

It should not automatically claim:

Certified compliant with Framework X

PeopleCert owns ITIL and operates an official tool-vendor accreditation program. Any official ITIL compatibility or accreditation claim should therefore follow the applicable licensing and accreditation process.

For proprietary standards, packs should contain only content the vendor or customer is legally entitled to use. The pack system therefore needs licensing metadata and support for customer-supplied mappings.

13. Alerting and security operations
13.1 Ingestion pipeline
Source
→ Authentication
→ Rate limiting
→ Decode
→ Validate
→ Normalize
→ Enrich
→ Store raw reference
→ Deduplicate
→ Suppress
→ Correlate
→ Score
→ Route
→ Create or update work

Every stage should produce measurable outcomes and failure reasons.

13.2 Normalized alert
Alert
├── source
├── source_alert_id
├── observed_at
├── received_at
├── event_kind
├── severity
├── confidence
├── affected_entities
├── indicators
├── user or workload identities
├── network context
├── cloud context
├── source links
├── raw evidence reference
├── deduplication fingerprint
├── correlation features
└── security labels
13.3 Deduplication

Deduplication may use:

Exact source identifier.
Canonical fingerprint.
Asset and detection-rule tuple.
Identity and indicator tuple.
Time window.
Repeated state transitions.
Source-specific logic through a restricted plugin.

Deduplication must never destroy raw evidence.

13.4 Correlation

Correlation strategies:

Shared asset.
Shared service.
Shared identity.
Shared indicator.
Common deployment or change.
Dependency graph proximity.
Temporal sequence.
Parent-child alert relationships.
Known attack pattern.
Customer-defined WASM correlator.
Optional AI recommendation.

The correlation result includes an explanation:

These 43 alerts were grouped because:
- 39 concern hosts belonging to Service X.
- All began within six minutes of Change Y.
- 31 contain the same process fingerprint.
- Service X depends on Database Z, which produced the first alert.
13.5 Security incident model

A security incident should add:

Confidentiality, integrity and availability impact.
Affected information classifications.
Detection source.
Containment state.
Eradication state.
Recovery state.
Indicators.
Evidence custody.
Regulatory assessment.
Stakeholder notifications.
Legal hold.
Lessons learned.
Timeline confidence.
Reportability decisions.
13.6 The platform is not automatically a SIEM

It can ingest and correlate alerts from SIEM, EDR, cloud and monitoring systems.

A future telemetry engine may be added, but 1.0 should not attempt to replace every log analytics platform. Its primary role is turning observations into governed work, decisions and evidence.

14. Asset and service graph
14.1 Facts rather than unquestioned records

A CMDB value should not merely be:

server.owner = Team A

It should be represented as a fact:

Fact
├── subject
├── field
├── value
├── source
├── observed_at
├── valid_from
├── valid_until
├── recorded_at
├── confidence
├── evidence
└── supersedes
14.2 Fact kinds
ObservedFact
AssertedFact
ImportedFact
ComputedFact
ManuallyConfirmedFact
14.3 Reconciliation

For each field, organizations can define:

Source priority.
Maximum age.
Confidence thresholds.
Whether manual confirmation overrides discovery.
Conflict behavior.
Required evidence.
Automatic expiration.
Merge rules.
14.4 Bitemporal model

Track both:

When a fact was true in the represented world.
When the platform learned or recorded it.

This supports questions such as:

What did we believe the service topology was when the incident began?

and:

What do we now know was actually true at that time?
14.5 Impact engine

The impact engine traverses typed relationships with limits.

Example:

Change modifies Database A
Database A supports Application B
Application B provides Service C
Service C supports Business Process D

The change assessment can suggest affected services and approvers while showing exactly which graph paths produced the result.

15. Search architecture

Search should be a central product capability rather than a text box over ticket descriptions.

15.1 Search modes
Exact identifier search
Structured field search
Lexical full-text search
Faceted search
Temporal search
Relationship search
Historical event search
Semantic similarity search
Natural-language query compilation
15.2 Canonical query AST
Query
├── And
├── Or
├── Not
├── FieldEquals
├── FieldRange
├── TextMatches
├── RelatedTo
├── PathExists
├── ChangedWithin
├── ChangedBy
├── AsOf
├── HasEvidence
├── MissingEvidence
├── SimilarTo
├── Sort
├── Limit
└── Projection

Example:

And(
    TypeIs(SecurityIncident),
    SeverityAtLeast(High),
    RelatedTo(Service("payments")),
    ChangedWithin(LastDays(30)),
    MissingEvidence("regulatory-assessment")
)
15.3 Permission-safe search

Search authorization has several layers:

Tenant and coarse security labels constrain index lookup.
Field-level policy determines indexed and returned fields.
Exact policy evaluation runs before each result is returned.
Snippets are generated only from permitted fields.
Facet counts are protected against inference.
Cached results include policy and identity context.
AI context retrieval uses the same search pipeline.

Filtering only after vector or lexical retrieval is insufficient because counts, timing and snippets may reveal restricted information.

15.4 Natural-language search

The AI does not search the database directly.

It converts a question into a canonical query plan:

User:
"Show critical incidents affecting payment services after changes last month."

Generated plan:
- type = incident
- priority = critical
- relation = affects service tagged payments
- related change time = previous calendar month
- sort = newest first

The user can inspect or edit the plan before execution.

15.5 Explainable ranking

Every result can show:

Matching fields.
Matching terms.
Related records.
Graph distance.
Temporal relevance.
Semantic similarity.
Applied security filters.
Ranking contributions.
15.6 Search indexes are replaceable

The search engine is a projection.

A tenant should be able to:

Rebuild an index.
Change index provider.
Delete and regenerate embeddings.
Move an index to another region.
Disable semantic indexing.
Exclude sensitive record classes.
16. AI architecture

AI must be optional. Disabling it must not disable core product functionality.

16.1 AI provider interface

Support:

Local models.
Organization-hosted models.
Cloud providers.
Specialized classifiers.
Embedding providers.
Rerankers.
Multiple providers by data classification or region.
16.2 AI broker

All inference passes through one broker:

Caller
→ Capability check
→ Purpose check
→ Data classification
→ Tenant policy
→ Region policy
→ Context retrieval
→ Field redaction
→ Prompt assembly
→ Provider selection
→ Budget enforcement
→ Model invocation
→ Output validation
→ Provenance recording
→ Human or automated disposition
16.3 Initial AI functions

Safe early functions:

Summarize a long incident timeline.
Extract possible action items.
Suggest duplicate tickets.
Suggest categories and assignment groups.
Generate search plans.
Suggest knowledge articles.
Draft status updates.
Draft postmortems.
Explain workflow or policy decisions.
Identify missing evidence.
Suggest alert correlations.

Higher-risk later functions:

Propose remediation commands.
Propose changes.
Execute approved runbooks.
Coordinate multi-step response.
16.4 AI-generated command model

An AI agent never calls domain internals.

It submits a proposal:

ProposedCommand
├── model
├── model_version
├── prompt_version
├── purpose
├── supporting_record_ids
├── proposed_command
├── confidence
├── risk_class
├── required_approval
└── expiration

The normal command pipeline then authenticates, authorizes and validates it.

16.5 Prompt-injection defense

Ticket descriptions, emails, logs, knowledge articles and attachments are untrusted model input.

Controls include:

Separation of instructions from retrieved content.
Tool capabilities defined outside prompts.
No secrets placed in prompts unless explicitly permitted.
Structured model output.
Output schema validation.
Command allowlists.
Human approval.
Host-side authorization.
Rate and cost limits.
Context provenance.
Adversarial evaluation.
16.6 AI provenance

Store:

Provider.
Model identifier.
Model version where available.
Prompt template version.
Input record references.
Redaction policy.
Retrieval query.
Output.
Confidence.
Reviewer.
Accepted, rejected or edited disposition.
Downstream commands.
Evaluation results.
16.7 AI governance pack

NIST AI RMF is intended as a flexible and voluntary risk-management framework. NIST states that AI RMF 1.0 is currently being revised, so the platform should treat it as a versioned pack rather than hard-code its present structure.

17. WebAssembly extension model
17.1 Use the Component Model

Use WIT-defined interfaces and a mature component runtime.

As of July 2026, WASI 0.3 is the latest milestone and adds native asynchronous functions, streams and futures to the Component Model. That makes it a strong future-facing interface for asynchronous integration components, while compatibility adapters may still be needed for older components.

17.2 Plugin categories
Validator
WorkflowActivity
EventEnricher
AlertNormalizer
AlertCorrelator
Importer
Exporter
NotificationChannel
IntegrationConnector
ReportFunction
SearchEnricher
UIExtension
17.3 Capability manifest
PluginCapabilities
├── record.read(type, fields)
├── record.command(command_types)
├── search.query(scopes)
├── workflow.signal(names)
├── event.subscribe(event_types)
├── http.fetch(allowed_domains)
├── secret.use(secret_ids)
├── blob.read(classifications)
├── blob.write(classifications)
├── notify.send(channels)
├── clock.read
├── randomness.read
└── log.write(levels)

Capabilities are deny-by-default and tenant-specific.

17.4 No direct database access

Plugins never receive:

Database credentials.
SQL access.
Native database handles.
Filesystem access.
Arbitrary network access.
Core process memory.
Undocumented host functions.

They interact through versioned host interfaces.

17.5 Resource controls

Every invocation has:

Memory limit.
Fuel or instruction limit.
Wall-clock deadline.
Output-size limit.
Host-call limit.
Network-byte limit.
Concurrency limit.
Recursion limit.
Cancellation.
Tenant quota.
17.6 Deterministic and effectful modes
Deterministic mode

Used for:

Validation.
Classification.
Pure enrichment.
Policy helpers.
Workflow conditions.

No time, randomness, network or external state.

Effectful mode

Used for:

External integrations.
Notifications.
Importers.
Remediation activities.

Every capability call is policy checked and audited.

17.7 Plugin lifecycle
Uploaded
→ Signature verified
→ Static validation
→ Capability review
→ Test execution
→ Security scan
→ Tenant approval
→ Staged
→ Active
→ Suspended
→ Retired

Plugins should support canary activation and automatic suspension after repeated traps or policy violations.

17.8 UI extensions

UI plugins should submit declarative definitions:

Panels.
Fields.
Tables.
Charts.
Actions.
Commands.
Help content.

Do not allow arbitrary plugins to modify the application DOM or load unrestricted JavaScript into the primary origin.

Complex UI extensions can run in an isolated worker or sandboxed frame with a narrow message API.

18. API architecture
18.1 Commands rather than unrestricted CRUD

Write endpoints express intent:

POST /v1/incidents/{id}/commands/assign
POST /v1/changes/{id}/commands/approve
POST /v1/risks/{id}/commands/accept
POST /v1/framework-packs/{id}/commands/activate

Generic application records may also use a canonical command endpoint:

POST /v1/commands
18.2 Read models

Reads use explicit views:

GET /v1/incidents/{id}
GET /v1/incidents/{id}/timeline
GET /v1/services/{id}/impact
POST /v1/search
GET /v1/work-queues/{id}
18.3 API safeguards

Every API supports:

Idempotency keys.
Optimistic concurrency tokens.
Bounded pagination.
Request size limits.
Explicit field selection.
Stable error codes.
Correlation identifiers.
Rate limits.
Cancellation.
Policy-aware field redaction.
Audit metadata.
18.4 Real-time communication

Use:

Server-sent events for simple subscriptions.
WebSockets where bidirectional real-time behavior is required.
Durable event cursors.
Resume tokens.
Backpressure.
Permission reevaluation on reconnect and subscription changes.
18.5 Webhooks

Outbound webhooks require:

Signed payloads.
Event identifier.
Delivery identifier.
Idempotency.
Timestamp.
Replay protection.
Bounded retries.
Dead-letter handling.
Destination allowlists.
DNS and address validation against SSRF.
Per-destination secrets.
Full delivery history.
19. User experience
19.1 Unified object experience

Every major object should use a consistent composition:

Header
├── Identity and status
├── Primary actions
├── Ownership
└── SLA or risk indicators

Body
├── Contextual overview
├── Activity timeline
├── Tasks and approvals
├── Relationships
├── Evidence
├── Affected services and assets
└── Domain-specific panels
19.2 Workspaces

Provide first-party workspaces:

Service desk.
Incident operations.
Major incident command.
Change management.
Security operations.
Vulnerability response.
Risk and compliance.
Service and asset map.
Knowledge management.
Application builder.
Administration.
Executive operations.
19.3 Command palette

The command palette should search:

Records.
Views.
Actions.
Reports.
Knowledge.
Administrative settings.
Builder objects.
Recent work.

Actions shown in the palette are policy filtered.

19.4 Collaborative timeline

One timeline combines:

State changes.
Comments.
Alerts.
Workflow decisions.
Approvals.
Related changes.
AI suggestions.
Notifications.
Evidence.
Administrative overrides.

Users can filter by event category without losing the authoritative history.

19.5 Builder experience

The builder creates a versioned application package:

ApplicationPackage
├── Schemas
├── Commands
├── State machines
├── Forms
├── Views
├── Workflows
├── Policies
├── Reports
├── Notifications
├── Portal definitions
├── Search projections
├── Migrations
└── Tests

The package can be:

Exported.
Reviewed.
Signed.
Stored in source control.
Promoted between environments.
Rolled back.
Compared semantically.
19.6 Accessibility and internationalization

Accessibility is a 1.0 requirement rather than a later cosmetic improvement.

The design must include:

Complete keyboard operation.
Screen-reader semantics.
Focus management.
Reduced-motion behavior.
Text scaling.
High-contrast compatibility.
Localized dates, numbers and time zones.
Right-to-left layout capability.
Translation-key validation.
No status communicated solely through color.
20. Security architecture
20.1 Trust boundaries

Explicitly model:

Internet → API gateway
Browser → platform API
Tenant → shared platform
Plugin → host runtime
AI model → command gateway
Agent → ingestion service
Integration → webhook endpoint
Attachment → parsing and scanning pipeline
Administrator → control plane
Database administrator → audit evidence
Worker → event journal
Region → region
20.2 Tenant isolation

Tenant identifiers are mandatory in:

Commands.
Events.
Streams.
Projection keys.
Search documents.
Cache keys.
Blob paths.
Queue messages.
Workflow instances.
Plugin invocations.
AI context.
Logs and traces.

A storage request without an explicit tenant context is rejected.

Deployment options:

Shared database, shared schema
Shared database, isolated schema or collection
Dedicated database
Dedicated cluster
Dedicated regional deployment

The application-level isolation model remains active even with dedicated infrastructure.

20.3 Cryptography

Use a provider interface.

CryptoProvider
├── hash
├── message authentication
├── sign
├── verify
├── random bytes
├── envelope encrypt
├── envelope decrypt
└── key metadata

Production implementations should use mature, reviewed cryptographic libraries and external KMS or HSM systems where required.

Do not implement cryptographic algorithms merely to eliminate a dependency.

20.4 Tamper-evident history

Use:

Per-stream hash chaining.
Partition-level Merkle checkpoints.
Periodically signed checkpoint roots.
Key identifiers and rotation metadata.
Optional external checkpoint publication.
Verification CLI.
Restore-time validation.
Independent audit export.

Describe this as tamper-evident, not tamper-proof.

20.5 Privacy and deletion

Event history can conflict with deletion and privacy obligations.

Separate personally identifying or sensitive payloads from permanent event metadata where possible:

Event
├── non-sensitive decision metadata
└── encrypted sensitive payload reference

This enables:

Field redaction.
Token replacement.
Encryption-key destruction.
Retention-specific payload deletion.
Legal holds.
Audit records showing that deletion occurred.
Preservation of non-sensitive process integrity.
20.6 Attachments

Attachment pipeline:

Upload
→ size validation
→ type detection
→ archive inspection
→ decompression limits
→ malware scan
→ content-disarm plugin where configured
→ classification
→ encryption
→ immutable storage
→ access-controlled reference

Attachments are never executed or rendered directly from the primary application origin.

20.7 Secret handling

Prefer secret handles over secret values.

A plugin receives:

SecretHandle("outbound-api")

The host uses the secret on the plugin’s behalf.

Raw secret bytes should enter application memory only when unavoidable and should use dedicated secret container types.

20.8 Unsafe Rust policy

Default:

#![forbid(unsafe_code)]

Any unavoidable unsafe code is confined to named low-level crates with:

Written invariants.
Safety comments.
Miri tests where applicable.
Fuzz tests.
Dedicated review.
No domain logic.
No network protocol parsing mixed into unsafe sections.
20.9 Supply-chain policy

Every release includes:

Locked dependencies.
Dependency allowlist.
License report.
Advisory scan.
Feature inventory.
Reachability review for security-critical changes.
SBOM.
Reproducible-build evidence.
Signed source tag.
Signed artifacts.
Build provenance.
Compiler and toolchain versions.
21. Reliability and distributed execution
21.1 Transactional outbox

A command transaction writes:

Business events
+
Outbox messages
+
Idempotency receipt

atomically.

A dispatcher later delivers outbox messages.

21.2 Inbox

Consumers record processed message identifiers before acknowledging completion.

This prevents duplicate effects during retries.

21.3 Poison handling

Repeatedly failing work enters a quarantine queue with:

Failure reason.
Attempt count.
First and most recent failure.
Worker version.
Payload reference.
Tenant.
Required operator action.
Replay capability.
21.4 Backpressure

Each tenant and pipeline has quotas for:

Ingestion rate.
Pending workflow activities.
Search queries.
AI tokens.
Plugin CPU.
Notification delivery.
Attachment processing.
Report execution.
Export volume.
21.5 Multi-region model

For 1.0:

One authoritative write region per tenant or partition.
Read projections may exist in additional regions.
Region metadata is explicit.
Policies can prohibit cross-region replication.
Failover is a controlled operation.
Split-brain writes are rejected.
Recovery objectives are deployment-profile specific.

Avoid transparent active-active writes until the event and conflict model has proven it safe.

21.6 Backup and recovery

Recovery testing must verify:

Database restore.
Blob restore.
Event-chain integrity.
Projection rebuild.
Search-index rebuild.
Workflow continuation.
Plugin and framework-pack restoration.
Key metadata.
Tenant isolation.
Point-in-time consistency between database and blobs.
22. Dependency policy
22.1 Dependency-free internal areas

The following should have no external runtime dependencies wherever practical:

Identifiers.
Error model.
Budgets.
Value model.
Commands.
Events.
Aggregate logic.
Workflow IR.
Policy model.
Query AST.
Compliance model.
Domain aggregates.
22.2 Approved dependency domains

External dependencies are acceptable for:

Domain	Reason
Async runtime	Correct high-performance hosted I/O
HTTP implementation	Complex protocol handling
TLS and crypto	Security-critical standards
WASM runtime	Sandboxing and Component Model support
Database drivers	Authentication and wire protocols
Identity protocols	OIDC, SAML, WebAuthn and cryptographic validation
Unicode	Correct normalization and segmentation
Compression	Secure format compatibility
Serialization at boundaries	Standards-based external APIs
Observability export	Ecosystem interoperability
22.3 Adapter isolation

No selected web framework, database library or WASM runtime may appear in domain APIs.

Example:

platform-plugin-host-wasmtime
implements
platform-plugin-host::ComponentRuntime

A future runtime can be added without changing plugin contracts.

22.4 Serialization strategy

Use:

A small bounded canonical codec for internal stable envelopes.
WIT canonical interfaces for WASM components.
JSON for public APIs.
Optional CSV and other formats for import/export.
Adapter-specific database encoding internally.

Do not use Rust-native memory layout as a persisted format.

23. Public crate publication strategy

Do not publish 60 internal crates independently.

Initially publish only developer-facing contracts:

platform-sdk
platform-model
platform-query
platform-plugin-sdk
platform-policy-sdk
platform-pack-sdk
platform-agent-sdk
platform-testkit

Internal crates remain:

publish = false

After 1.0, additional crates should be published only when independent reuse and compatibility commitments justify it.

24. Version and compatibility model

The platform has several independent compatibility dimensions:

ProductVersion
ApiVersion
EventSchemaVersion
WorkflowIrVersion
PolicyLanguageVersion
PluginAbiVersion
FrameworkPackVersion
ExportFormatVersion
AgentProtocolVersion

These must never be represented by one shared version number.

For example, platform 1.4 might still support:

API v1
Plugin ABI v1 and v2
Event schema families 1–3
Agent protocol v1
25. Universal release gate

Every 0.x.0 release adds one bounded capability.

Every release must be pentestable from the previous tag to the new tag.

The mandatory gate is:

Threat-model delta.
Attack-surface delta.
Changed-code review.
Unit and integration tests.
Property tests for changed invariants.
Fuzzing for changed parsers and decoders.
Authorization tests for affected commands and reads.
Tenant-isolation tests.
Migration forward and rollback tests.
Dependency and license delta.
Unsafe-code delta.
Resource-exhaustion tests.
Audit-event verification.
Failure-injection tests where persistence changed.
Benchmark regression check.
Signed release evidence bundle.

Patch versions such as 0.42.1 contain corrections only. They must not introduce unrelated features.

26. Version plan: 0.1.0 to 1.0.0
Phase A — Pure foundation
Version	Deliverable	Primary pentest target
0.1.0	Workspace, architecture rules, threat-model format and CI baseline	Repository trust, CI permissions and release process
0.2.0	Typed IDs, time primitives and stable error codes	ID confusion, malformed identifiers and time overflow
0.3.0	Input budgets and bounded collection primitives	Allocation exhaustion and integer overflow
0.4.0	Canonical dynamic value model	Deep nesting, invalid types and oversized values
0.5.0	Schema definitions and field constraints	Schema bypass and malicious recursion
0.6.0	Deterministic bounded codec	Malformed bytes, truncation and decoder differential tests
0.7.0	Command envelope	Spoofed actor, duplicate command and missing tenant
0.8.0	Event envelope	Metadata confusion and schema-version abuse
0.9.0	Pure aggregate decide/evolve framework	Invalid transitions and replay determinism
0.10.0	In-memory incident CLI vertical slice	End-to-end state and authorization assumptions
Phase B — Journal and projection mechanics
Version	Deliverable	Primary pentest target
0.11.0	Semantic event-journal interface	Contract ambiguity and partial append behavior
0.12.0	In-memory journal adapter	Ordering and stream-isolation failures
0.13.0	Expected-version concurrency	Lost updates and duplicate event creation
0.14.0	Snapshots and snapshot validation	Stale or poisoned snapshots
0.15.0	Projection engine and checkpoints	Skipped, duplicated and reordered events
0.16.0	Transactional outbox model	Event committed without message or inverse
0.17.0	Inbox and idempotent consumer model	Replay and duplicate side effects
0.18.0	Leases, timers and scheduler primitives	Double ownership and expired lease use
0.19.0	Integrity chains and signed checkpoint interface	Event deletion, reordering and substitution
0.20.0	Replay, verification and projection rebuild CLI	Corrupt streams and resource-exhaustion replay
Phase C — Storage portability
Version	Deliverable	Primary pentest target
0.21.0	Storage capability negotiation	False capability claims and unsafe fallback
0.22.0	Storage conformance testkit	Test bypass and backend-specific divergence
0.23.0	SQLite adapter	Locking, rollback and local-file permissions
0.24.0	PostgreSQL adapter	Transaction, authentication and tenant partitioning
0.25.0	MySQL adapter	Isolation-level and encoding differences
0.26.0	MongoDB adapter	Transaction boundaries and query injection
0.27.0	SurrealDB adapter	Namespace, graph and query isolation
0.28.0	Blob-store API and filesystem adapter	Path traversal, symlinks and content mismatch
0.29.0	Migration registry and resumable migrations	Interrupted and malicious migrations
0.30.0	Cross-backend export and import	Record substitution, truncation and integrity loss
Phase D — Universal work platform
Version	Deliverable	Primary pentest target
0.31.0	Shared work-item components	Cross-type field confusion
0.32.0	Generic task aggregate	Unauthorized completion and dependency bypass
0.33.0	Configurable lifecycle state machines	Illegal transition and transition-loop abuse
0.34.0	Assignment groups and ownership	Assignment privilege escalation
0.35.0	Comments, mentions, watchers and activity	Stored content injection and notification abuse
0.36.0	Attachments and quarantine lifecycle	Malware, archive bombs and content-type confusion
0.37.0	Priority, severity and impact models	Priority manipulation and integer boundary errors
0.38.0	Calendars, targets and SLA calculations	Time-zone, holiday and clock-boundary errors
0.39.0	Approval and notification foundations	Self-approval and delivery replay
0.40.0	First authenticated API and service-desk UI	IDOR, CSRF, XSS and field leakage
Phase E — IT service management
Version	Deliverable	Primary pentest target
0.41.0	Incident management	Unauthorized assignment, resolution and closure
0.42.0	Service-request management	Catalog input abuse and fulfillment bypass
0.43.0	Service catalog and request forms	Schema injection and price or entitlement manipulation
0.44.0	Problem management	Cross-incident data exposure
0.45.0	Known errors and workarounds	Unsafe workaround publication
0.46.0	Change management	Approval bypass and schedule manipulation
0.47.0	Release and deployment records	False deployment status and unauthorized linkage
0.48.0	Major-incident command process	Role takeover and notification flooding
0.49.0	Postmortem and corrective actions	Sensitive-data publication and action deletion
0.50.0	Integrated ITSM beta	Cross-module authorization and workflow chaining
Phase F — Identity, tenancy and policy
Version	Deliverable	Primary pentest target
0.51.0	Formal tenant isolation model	Cross-tenant reads, writes, caches and indexes
0.52.0	Subjects, identities and service principals	Identity confusion and impersonation
0.53.0	Hosted OIDC and WebAuthn integration	Token validation and session fixation
0.54.0	Directory and group synchronization	Group takeover and stale privilege
0.55.0	RBAC engine	Role escalation and inherited-role cycles
0.56.0	ABAC engine	Missing attributes and fail-open decisions
0.57.0	Relationship-based authorization	Malicious graph paths and ownership spoofing
0.58.0	Field redaction and policy obligations	Hidden-field leaks through API, search and exports
0.59.0	Delegation and break-glass access	Unbounded scope and non-expiring privilege
0.60.0	Authorization conformance suite	Full command/read/export permission matrix
Phase G — Durable workflows
Version	Deliverable	Primary pentest target
0.61.0	Workflow intermediate representation	Invalid graphs and malicious instruction counts
0.62.0	Deterministic workflow interpreter	Infinite loops and nondeterministic replay
0.63.0	Human tasks and approvals	Task theft and self-approval
0.64.0	Timers, deadlines and retries	Retry storms and time manipulation
0.65.0	Parallel branches and joins	Premature joins and duplicate completion
0.66.0	Compensation mechanics	Double compensation and incomplete rollback
0.67.0	Signals and subworkflows	Signal spoofing and recursion exhaustion
0.68.0	Workflow versioning and migration	State corruption during upgrades
0.69.0	Visual and configuration-as-code compiler	Hidden behavior and unsafe generated workflows
0.70.0	HA workflow workers	Duplicate activity execution and lease loss
Phase H — Alerts and security operations
Version	Deliverable	Primary pentest target
0.71.0	Authenticated alert-ingestion protocol	Spoofed sources and ingestion flooding
0.72.0	Alert normalization	Parser confusion and field smuggling
0.73.0	Deduplication engine	Collision attacks and evidence loss
0.74.0	Suppression and maintenance windows	Malicious suppression of real alerts
0.75.0	Topology and temporal correlation	Correlation poisoning and unbounded graph traversal
0.76.0	Alert-to-incident orchestration	Incident flooding and unauthorized linking
0.77.0	Security-incident domain	Evidence access and containment privilege
0.78.0	Vulnerability findings and remediation cases	Finding spoofing and risk-score manipulation
0.79.0	Forensic timeline and evidence custody	Timestamp tampering and custody gaps
0.80.0	Integrated SecOps workspace	Cross-source, cross-tenant and export leakage
Phase I — Assets, configuration and services
Version	Deliverable	Primary pentest target
0.81.0	Asset lifecycle	Unauthorized ownership and disposal changes
0.82.0	Business and technical services	Service-owner privilege escalation
0.83.0	Typed relationship graph	Malicious cycles and unauthorized edges
0.84.0	Provenance and confidence	Source impersonation and confidence inflation
0.85.0	Bitemporal facts	Historical rewrite and invalid time intervals
0.86.0	Discovery and import interface	Poisoned discovery sources and oversized imports
0.87.0	Reconciliation engine	Source-priority abuse and destructive merges
0.88.0	Dependency impact analysis	Traversal exhaustion and hidden-node inference
0.89.0	Software and license inventory	Forged inventory and entitlement leakage
0.90.0	Interactive service map	Graph authorization and browser rendering abuse
Phase J — Search and knowledge
Version	Deliverable	Primary pentest target
0.91.0	Canonical query AST	Query complexity and parser abuse
0.92.0	Search projection pipeline	Stale permissions and indexing duplication
0.93.0	Lexical full-text search	Query injection and document-size exhaustion
0.94.0	Facets, queues and saved views	Unauthorized counts and shared-view leakage
0.95.0	Permission-aware indexing	Field, snippet and cache leakage
0.96.0	Temporal and event-history search	Historical access bypass
0.97.0	Relationship and impact search	Graph-path disclosure
0.98.0	Semantic-index interface	Embedding leakage and cross-tenant similarity
0.99.0	Knowledge articles and runbooks	Unsafe content, poisoning and publication bypass
0.100.0	Unified search conformance suite	Search/API authorization equivalence
Phase K — Compliance and risk
Version	Deliverable	Primary pentest target
0.101.0	Signed framework-pack format	Package substitution and downgrade
0.102.0	Requirement and control graph	Malicious mappings and graph cycles
0.103.0	Evidence requirements and lineage	Forged evidence and detached provenance
0.104.0	NIST CSF versioned pack	Pack activation and mapping integrity
0.105.0	DORA versioned pack	Applicability and mandatory-evidence bypass
0.106.0	Versioned ITIL practice packs	Workflow overlay conflicts and licensing metadata
0.107.0	Licensed/custom standards importer	Untrusted package content and mapping escalation
0.108.0	Risk, treatment and exception workflows	Self-accepted risk and non-expiring exceptions
0.109.0	Control testing, findings and reporting	Falsified tests and report data leakage
0.110.0	Pack impact and conflict simulator	Incorrect precedence and simulation divergence
Phase L — WASM and integrations
Version	Deliverable	Primary pentest target
0.111.0	Versioned WIT plugin interfaces	ABI confusion and malformed components
0.112.0	Deterministic component execution	Fuel bypass and nondeterminism
0.113.0	Effectful component execution	Unauthorized host calls
0.114.0	Capability and secret-handle model	Capability escalation and secret extraction
0.115.0	Memory, CPU, network and output metering	Resource-limit bypass
0.116.0	Signed plugin registry and rollout	Signature downgrade and malicious update
0.117.0	Connector SDK and testkit	SSRF, replay and connector impersonation
0.118.0	Email, webhook and collaboration connectors	Header injection, spoofing and action-link abuse
0.119.0	Outbound-only integration agent	Agent takeover and offline-spool extraction
0.120.0	Plugin compatibility and isolation suite	Cross-plugin and cross-tenant interference
Phase M — AI capabilities
Version	Deliverable	Primary pentest target
0.121.0	AI provider interface	Provider impersonation and unsafe fallback
0.122.0	Classification, redaction and residency gateway	Sensitive-field leakage
0.123.0	Model, prompt and purpose registry	Prompt substitution and unapproved models
0.124.0	Timeline and record summarization	Prompt injection and fabricated citations
0.125.0	Similarity and duplicate suggestions	Cross-tenant retrieval and poisoning
0.126.0	Triage and next-action suggestions	Manipulated assignment and unsafe advice
0.127.0	Natural-language search compiler	Authorization bypass through generated queries
0.128.0	Restricted AI command proposals	Command escalation and approval bypass
0.129.0	Evaluation, provenance and reviewer feedback	Evaluation tampering and hidden model changes
0.130.0	AI governance and NIST AI RMF pack	Policy gaps and unsafe autonomous modes
Phase N — Complete product experience
Version	Deliverable	Primary pentest target
0.131.0	Unified shell and command palette	Unauthorized action discovery
0.132.0	Role-specific operational workspaces	Workspace field leakage
0.133.0	Schema and form builder	Malicious schemas and stored UI injection
0.134.0	Workflow and policy builder	Generated privilege escalation
0.135.0	Dashboards and bounded report builder	Expensive queries and aggregate leakage
0.136.0	Request portal and generic case management	External-user isolation and enumeration
0.137.0	Configuration-as-code and signed change sets	Configuration substitution and rollback abuse
0.138.0	Stable API, SDKs, import and export	Mass assignment and export-policy bypass
0.139.0	Accessibility, localization and mobile layouts	Localization injection and client-state leakage
0.140.0	Operator and tenant administration console	Administrative privilege boundaries
Phase O — Production hardening
Version	Deliverable	Primary pentest target
0.141.0	Single-node production packaging	File permissions, defaults and secret exposure
0.142.0	Split API, worker, ingest and index deployments	Service identity and network authorization
0.143.0	HA leases, failover and partition handling	Split brain and duplicate processing
0.144.0	Regional placement and data-residency enforcement	Cross-region data leakage
0.145.0	Backup, restore and disaster-recovery tooling	Backup substitution and incomplete restore
0.146.0	Performance, load, soak and chaos certification	Resource exhaustion and cascading failure
0.147.0	Final security and supply-chain hardening	Artifact, dependency and build compromise
0.148.0	API, event, plugin and pack compatibility freeze	Downgrade and version-confusion attacks
0.149.0	Release candidate and external pentest remediation	Full platform attack-path testing
0.150.0	Final production-readiness candidate	Clean-install, upgrade, restore and rollback validation
1.0.0 — Production release

1.0.0 is released only when all acceptance criteria below are satisfied.

27. 1.0.0 acceptance criteria
Platform stability
Public API v1 is stable.
Event schemas have documented compatibility policies.
Plugin ABI v1 is stable.
Framework-pack format v1 is stable.
Export format v1 is stable.
Agent protocol v1 is stable.
Upgrade and rollback paths are tested.
Database support

The following pass the same mandatory conformance suite:

PostgreSQL.
MySQL.
MongoDB.
SurrealDB.
SQLite for its documented single-node profile.
Product completeness

Production-ready:

Incident management.
Major incident management.
Service requests.
Service catalog.
Problems and known errors.
Changes.
Releases and deployment records.
Generic tasks and approvals.
SLAs and calendars.
Alerts and correlation.
Security incidents.
Vulnerability response.
Assets and service graph.
Knowledge management.
Risk and compliance.
Custom cases and applications.
Workflow and policy builder.
Search.
WASM integrations.
Optional AI assistance.
Administration.
Import, export and reporting.
Security
External pentest completed and findings resolved or formally accepted.
Tenant isolation tested across every interface.
Authentication and authorization matrices complete.
Fuzzing covers every untrusted parser.
No unexplained unsafe code.
Cryptographic design independently reviewed.
Plugin sandbox escape tests completed.
AI prompt-injection and tool-abuse tests completed.
Backup restoration and integrity validation tested.
Signed build provenance and SBOM produced.
Default configuration is secure.
Operations
Single-node deployment supported.
HA deployment supported.
Documented regional model.
Backpressure and quotas supported.
Projection rebuilds supported.
Search rebuilds supported.
Workflow recovery supported.
Disaster-recovery runbooks tested.
Upgrade health checks available.
Configuration changes are auditable and reversible.
User experience
Complete keyboard operation.
Screen-reader validation.
Localizable interface.
Consistent timelines and workspaces.
Explainable policy, workflow, search, correlation and AI results.
No administrative feature depends on hidden database manipulation.
28. Recommended implementation order

The most important early vertical slice is:

Create incident
→ authorize command
→ emit event
→ atomically append event
→ project read model
→ search incident
→ assign incident
→ execute a workflow timer
→ record audit evidence
→ rebuild projection

Do this first in memory, then SQLite, then PostgreSQL.

Do not start with:

AI.
MongoDB.
A visual workflow editor.
Hundreds of forms.
A marketplace.
A mobile application.
Full regulatory packs.
Multi-region writes.

The foundation must first prove that commands, events, authorization, storage and replay work correctly.

29. The key differentiator

The final product should not merely store tickets.

It should maintain a secure, explainable work and evidence graph that understands:

What happened.
What changed.
Who decided it.
Which policy allowed it.
Which workflow caused it.
Which service or asset was affected.
Which requirements apply.
Which evidence exists.
Which evidence is missing.
Why an alert was correlated.
Why a search result appeared.
What an AI system suggested.
Whether that suggestion was accepted.
What would happen before a configuration or framework change is activated.

That is the modern experience legacy ITSM platforms generally struggle to provide because records, scripts, workflow, permissions, integrations and database structures have become tightly entangled over many years.

The Rust platform should therefore be designed as a deterministic core surrounded by replaceable hosted capabilities—not as a large database application with scripts attached.

A repository-ready follow-up should define the exact public Rust APIs, Cargo feature graph and permitted dependency list for the first ten releases.

Yes. It includes a complete asset-management capability, not merely a basic CMDB table. The attached concept already proposed dynamic asset tracking and graph-based configuration relationships, and the architecture expands this substantially.

It would cover four related areas:

Asset management

Tracks physical, virtual and cloud assets throughout their lifecycle:

Requested
→ Purchased
→ Received
→ In stock
→ Assigned
→ Active
→ Under repair
→ Retired
→ Sanitized
→ Disposed

Examples include:

Laptops, servers and network equipment.
Virtual machines and containers.
Cloud resources.
Mobile devices.
Applications and software installations.
Certificates and domains.
Facilities equipment.
Security tools and appliances.
Organization-defined asset types.

Each asset can contain ownership, location, cost, supplier, warranty, lifecycle status, security classification, support contract, disposal evidence and related tickets.

Software asset management

It can also track:

Installed software.
Software versions.
Licences and subscriptions.
Entitlements.
Licence allocations.
Renewal dates.
Unsupported software.
Vulnerable software versions.
Licence overuse and unused licences.

This should be a separate platform-software-asset module rather than forcing software into the same model as physical hardware.

CMDB and configuration management

The CMDB represents operational configuration items such as:

Server
Database
Application
API
Certificate
Load balancer
Network
Cloud account
Business service
Technical service

It records their relationships:

Application DEPLOYED_ON Server
Application DEPENDS_ON Database
Certificate SECURES Endpoint
Service PROVIDED_BY Application
Incident AFFECTS Service
Change MODIFIES ConfigurationItem

This makes impact analysis possible. Before approving a database change, the system could show every application, service, customer group and compliance control potentially affected.

Provenance-aware discovery

A major improvement over traditional asset systems is that values are not blindly trusted.

Instead of only storing:

Owner: Infrastructure Team

it stores:

Value: Infrastructure Team
Source: Azure discovery connector
Observed: July 22, 2026
Confidence: 92%
Evidence: resource metadata

If another source reports a different owner, the reconciliation engine can compare source priority, freshness and confidence rather than silently overwriting the value.

So yes: the platform is simultaneously an:

IT asset-management system.
Software asset-management system.
CMDB.
Service and dependency graph.
Discovery and reconciliation platform.
Asset-related compliance evidence system.

For 1.0.0, I would include strong lifecycle, inventory, discovery, relationships, ownership, warranty, software and disposal capabilities. More specialized financial functions—such as advanced depreciation, purchase-order accounting and full contract accounting—could remain optional modules rather than making the core platform behave like an ERP.

could Vitheim or Grunnheim fit for this project?
Worked for 33s

Both fit, but Vitheim is considerably stronger for the complete platform.

Vitheim

The Icelandic/Norse root vit carries meanings such as intelligence, reason, sense, knowledge and know-how, while Old Norse heimr can mean a home, realm, region or world. Vitheim can therefore be interpreted as:

The realm of knowledge, understanding and reason.

That aligns extremely well with a platform that understands tickets, assets, services, alerts, risks, compliance obligations, evidence, relationships and AI-assisted decisions.

It also works across every planned product area:

Vitheim Service Operations
Vitheim Asset Management
Vitheim Security Operations
Vitheim Risk & Compliance
Vitheim Service Graph
Vitheim Intelligence
Vitheim Automation

The workspace naming would also feel natural:

vitheim-core
vitheim-kernel
vitheim-work
vitheim-incident
vitheim-asset
vitheim-service
vitheim-secops
vitheim-compliance
vitheim-workflow
vitheim-policy
vitheim-search
vitheim-wasm
vitheim-ai
vitheim-sdk
vitheim-server
vitheim-agent
vitheim-cli
