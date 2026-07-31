#!/usr/bin/env sh
set -eu

failed=0

require_text() {
    file="$1"
    expected="$2"
    label="$3"
    if ! grep -Fq "$expected" "$file"; then
        echo "implementation convergence: missing semantic anchor '$label' in $file" >&2
        failed=1
    fi
}

plan=docs/IMPLEMENTATION_CONVERGENCE_PLAN.md

require_text "$plan" \
    'repository-wide prohibition on third-party Cargo code' \
    'owner dependency policy'
require_text "$plan" \
    'planning/evidence superset, not a requirement to' \
    'non-serial roadmap interpretation'
require_text "$plan" \
    'Selected Production-v1 Capability Contract' \
    'selected production core'
require_text "$plan" \
    'Production-Authenticated Incident Proof' \
    'early real vertical slice'
require_text "$plan" \
    'Persistent Incident Transport Test Slice' \
    'non-production transport slice'
require_text "$plan" \
    'cannot retroactively promote' \
    'fake identity cannot gain production support'
require_text "$plan" \
    'SelectedProfileManifestV1' \
    'machine-readable selected closure'
require_text "$plan" \
    'PackageExact' \
    'work-package exact capability graph'
require_text "$plan" \
    'DependencySupersessionV1' \
    'non-weakening dependency refinement'
require_text "$plan" \
    'same-version or numerically later prerequisite' \
    'numeric dependency order'
require_text "$plan" \
    'ExecutableTestEvidenceV1' \
    'executable test evidence'
require_text "$plan" \
    'WorkPackageClosureV1' \
    'work-package milestone closure'
require_text "$plan" \
    'normalized crate/path/test/verification sets are exact' \
    'exact bidirectional work-package closure'
require_text "$plan" \
    '`crates/vitheim-time`' \
    '0.2.0 time ownership'
require_text "$plan" \
    'Independently Operable Delivery Checkpoints' \
    'separate service and security asset feedback slices'
require_text "$plan" \
    'Increment 2 — Service Foundations' \
    'service foundation increment'
require_text "$plan" \
    'shared projection/application' \
    'shared search and knowledge slice'
require_text "$plan" \
    'PostgreSQL is the reference production backend' \
    'PostgreSQL reference profile'
require_text "$plan" \
    'SQLite is a separately evidenced bounded single-node/local profile' \
    'bounded SQLite profile'
require_text "$plan" \
    'Explicit Product Boundaries' \
    'explicit non-goals'
require_text "$plan" \
    'Dynamic built-in-domain retirement/reinstall' \
    'advanced retirement default refusal'
require_text "$plan" \
    'MinimumProfileWorkloadEnvelopeV1' \
    'quantitative workload envelope'
require_text "$plan" \
    'Authority Decomposition' \
    'independent authority ownership'
require_text "$plan" \
    'Existing Late-Protocol Corrections' \
    'existing-version corrections'
require_text "$plan" \
    'Stopping Rule' \
    'finite planning stop rule'

require_text docs/IMPLEMENTATION_PLAN.md \
    'transitive closure of the selected mandatory core' \
    'canonical selected closure'
require_text docs/implementation/PRODUCTION_1_0.md \
    'selected core'\''s complete transitive' \
    'production selected closure'
require_text docs/implementation/PRODUCTION_1_0.md \
    'not select dynamic built-in-domain retirement/reinstall' \
    'production retirement refusal'
require_text docs/implementation/PHASE_C.md \
    'selected core production path implements PostgreSQL first' \
    'Phase C PostgreSQL-first order'
require_text docs/implementation/PHASE_C.md \
    'Scope: `0.46.0–0.74.0`' \
    'complete Phase C scope'
require_text docs/implementation/PHASE_C.md \
    '## `0.57.0` — PostgreSQL Reference Adapter' \
    'PostgreSQL numerically first'
require_text docs/implementation/PHASE_C.md \
    '## `0.58.0` — SQLite Adapter' \
    'SQLite bounded successor'
require_text docs/implementation/PHASE_C.md \
    'backend migration is Unsupported by default' \
    'Phase C migration boundary'
require_text docs/implementation/PHASE_D.md \
    'Internal API And Service-Desk UI Test Slice' \
    'truthful fake-identity API slice'
require_text docs/implementation/PHASE_F.md \
    'production-authenticated architecture proof' \
    'post-identity vertical certification'

authority=docs/implementation/ROADMAP_AUTHORITY_COMPLETIONS.md

require_text "$authority" \
    'PhysicalStatusSuccessorActivationAppliedReceiptV1' \
    'successor activation applied receipt'
require_text "$authority" \
    'PhysicalStatusFailedSuccessorFenceReceiptV1' \
    'failed successor local fence'
require_text "$authority" \
    'ClaimAdmissionOpen → ClaimAdmissionSealing → ClaimAdmissionSealed' \
    'atomic claim admission cut'
require_text "$authority" \
    'SealPermanentlyUnresolved' \
    'non-resetting seal exhaustion result'
require_text "$authority" \
    'Default-Profile Retirement Refusal And Historical Compatibility Certification' \
    'default retirement refusal certification'

require_text docs/ROADMAP_GAP_DISPOSITIONS.md \
    'Consolidated Reviews Through 2026-07-31' \
    'consolidated finding dispositions'

if [ "$failed" -ne 0 ]; then
    exit 1
fi

echo "implementation convergence: ok"
