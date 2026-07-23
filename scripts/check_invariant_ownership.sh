#!/usr/bin/env sh
set -eu

registry="${1:-docs/INVARIANT_OWNERSHIP.md}"
if [ "$#" -gt 0 ]; then
    shift
fi
if [ "$#" -eq 0 ]; then
    set -- docs/implementation/*.md
fi

awk -F '|' -v registry="$registry" '
BEGIN {
    failed = 0
    mode = ""
}

FILENAME == registry && /^## Ownership Matrix$/ {
    mode = "ownership"
    next
}

FILENAME == registry && /^## Lifecycle And Supersession Registry$/ {
    mode = "lifecycle"
    next
}

FILENAME == registry && /^## Composite Security Law Registry$/ {
    mode = "law"
    next
}

FILENAME == registry && /^## Derived Enforcement-To-Negative Verification Map$/ {
    mode = "mapping"
    next
}

FILENAME == registry && mode == "ownership" &&
/^\| VIT-INV-[0-9][0-9][0-9] / {
    id = trim($2)
    owner = trim($3)
    guard = trim($4)
    milestone = trim($5)
    domain = trim($6)
    enforcement = trim($7)
    storage = trim($8)
    tests = trim($9)
    recovery = trim($10)
    suffix = substr(id, 9)

    if (ownership[id]++) {
        fail("duplicate ownership row " id)
    }
    if (owner !~ /^`[A-Za-z0-9_:]+`$/) {
        fail(id " must name exactly one authoritative owner")
    }
    check(id, "guard", guard)
    check(id, "milestone", milestone)
    check(id, "transaction domain", domain)
    check(id, "enforcement points", enforcement)
    check(id, "storage capabilities", storage)
    check(id, "tests", tests)
    check(id, "restore and migration", recovery)

    if (guard !~ /owner-updated:/) {
        fail(id " guard has no owner-maintained update path")
    }
    if (enforcement !~ ("^VIT-ENF-" suffix ":")) {
        fail(id " has no matching stable enforcement contract")
    }
    enforcement_count = split(enforcement, enforcement_points, ";")
    if (enforcement_count > 26) {
        fail(id " exceeds the single-letter enforcement child namespace")
    }
    for (point = 1; point <= enforcement_count; point++) {
        if (trim(enforcement_points[point]) == "") {
            fail(id " has an empty enforcement point")
        }
    }
    ownership_enforcement_count[id] = enforcement_count
    if (storage !~ ("^requires: VIT-CAP-" suffix "([;]|$)")) {
        fail(id " has no matching semantic storage capability ID")
    }
    if (tests !~ ("^VIT-TST-" suffix " ")) {
        fail(id " has no matching verification contract ID")
    }
    if (tests !~ /P:/ || tests !~ /N:/ || tests !~ /M:/ || tests !~ /F:/) {
        fail(id " must declare P, N, M, and F tests")
    }
    expected_negative_map = substr("ABCDEFGHIJKLMNOPQRSTUVWXYZ",
                                   1, enforcement_count)
    if (tests !~ ("; N-map: " expected_negative_map "$")) {
        fail(id " negative-child map does not cover every enforcement point")
    }
    if (recovery !~ ("^VIT-RCV-" suffix " ")) {
        fail(id " has no matching recovery-manifest ID")
    }
    if (recovery !~ /restore:/ || recovery !~ /migration:/) {
        fail(id " must declare restore and migration obligations")
    }
    ownership_milestone[id] = milestone
    next
}

FILENAME == registry && mode == "law" &&
/^\| VIT-LAW-[0-9][0-9][0-9] / {
    id = trim($2)
    coordinator = trim($3)
    dependencies = trim($4)
    linearization = trim($5)
    failure = trim($6)
    recovery = trim($7)
    contracts = trim($8)
    suffix = substr(id, 9)

    if (law[id]++) {
        fail("duplicate composite law row " id)
    }
    law_count++
    if (!stable_id(coordinator)) {
        fail(id " must name exactly one coordinating invariant")
    }
    check(id, "contributing invariant roots", dependencies)
    check(id, "local linearization points", linearization)
    check(id, "fail-closed state", failure)
    check(id, "end-to-end recovery proof", recovery)
    if (contracts !~ ("^VIT-LENF-" suffix "; VIT-LTST-" suffix "-N$")) {
        fail(id " has no matching law enforcement/negative contracts")
    }
    law_coordinator[id] = coordinator
    law_dependencies[id] = dependencies
    next
}

FILENAME == registry && mode == "lifecycle" &&
/^\| VIT-INV-[0-9][0-9][0-9] / {
    id = trim($2)
    status = trim($3)
    supersedes = trim($4)
    superseded_by = trim($5)
    effective = trim($6)
    fence = trim($7)
    mixed = trim($8)
    migration = trim($9)
    rollback = trim($10)
    suffix = substr(id, 9)

    if (lifecycle[id]++) {
        fail("duplicate lifecycle row " id)
    }
    if (status !~ /^(proposed|active|superseded|retired)$/) {
        fail(id " has invalid lifecycle status")
    }
    check(id, "supersedes value", supersedes)
    check(id, "superseded-by value", superseded_by)
    check(id, "effective-from version", effective)
    check(id, "mixed-version behavior", mixed)
    check(id, "rollback floor", rollback)
    if (effective !~ /^`[0-9]+\.[0-9]+\.[0-9]+`$/ ||
        rollback !~ /^`[0-9]+\.[0-9]+\.[0-9]+`$/) {
        fail(id " lifecycle versions must be strict numeric SemVer")
    }
    if (fence !~ ("^VIT-FEN-" suffix ":")) {
        fail(id " has no matching old/new owner fence")
    }
    if (migration != "VIT-RCV-" suffix) {
        fail(id " lifecycle does not resolve its recovery/migration contract")
    }
    lifecycle_status[id] = status
    lifecycle_supersedes[id] = supersedes
    lifecycle_superseded_by[id] = superseded_by
    lifecycle_effective[id] = effective
    lifecycle_rollback[id] = rollback
    next
}

FILENAME != registry && /vitheim-invariant/ {
    if ($0 !~ /^<!--[[:space:]]+vitheim-invariant[[:space:]]+VIT-INV-[0-9][0-9][0-9][[:space:]]+0\.[0-9]+\.[0-9]+[[:space:]]+-->$/) {
        fail(FILENAME ":" FNR " has a malformed invariant declaration")
        next
    }
    count = split($0, marker, /[[:space:]]+/)
    id = marker[3]
    version = marker[4]
    if (declaration[id]++) {
        fail("duplicate milestone declaration " id)
    }
    declaration_count++
    declaration_version[id] = version
    next
}

function trim(value) {
    sub(/^[[:space:]]+/, "", value)
    sub(/[[:space:]]+$/, "", value)
    return value
}

function check(id, label, value) {
    if (value == "" || value ~ /TBD/ || value == "—") {
        fail(id " has no " label)
    }
}

function stable_id(value) {
    return value ~ /^VIT-INV-[0-9][0-9][0-9]$/
}

function version_compare(left, right, left_parts, right_parts, position) {
    gsub(/`/, "", left)
    gsub(/`/, "", right)
    split(left, left_parts, ".")
    split(right, right_parts, ".")
    for (position = 1; position <= 3; position++) {
        if ((left_parts[position] + 0) < (right_parts[position] + 0)) {
            return -1
        }
        if ((left_parts[position] + 0) > (right_parts[position] + 0)) {
            return 1
        }
    }
    return 0
}

function visit(id, successor) {
    if (visit_state[id] == 1) {
        fail("supersession graph contains a cycle at " id)
        return
    }
    if (visit_state[id] == 2) {
        return
    }
    visit_state[id] = 1
    successor = lifecycle_superseded_by[id]
    if (successor != "none" && lifecycle[successor]) {
        visit(successor)
    }
    visit_state[id] = 2
}

function fail(message) {
    print "invariant ownership: " message > "/dev/stderr"
    failed = 1
}

END {
    for (id in declaration) {
        if (!ownership[id]) {
            fail(id " is declared by a milestone but has no ownership row")
        }
        if (!lifecycle[id]) {
            fail(id " is declared by a milestone but has no lifecycle row")
        }
        if (index(ownership_milestone[id], "`" declaration_version[id] "`") == 0) {
            fail(id " ownership milestone does not match its declaration")
        }
        if (lifecycle_effective[id] != "`" declaration_version[id] "`") {
            fail(id " lifecycle effective-from does not match its declaration")
        }
    }
    for (id in ownership) {
        if (!declaration[id]) {
            fail(id " has an ownership row but no introducing declaration")
        }
        if (!lifecycle[id]) {
            fail(id " has an ownership row but no lifecycle row")
        }
        if (!ownership_enforcement_count[id]) {
            fail(id " has no derived enforcement-to-negative child mapping")
        }
    }
    for (id in lifecycle) {
        if (!declaration[id]) {
            fail(id " has a lifecycle row but no introducing declaration")
        }
        if (!ownership[id]) {
            fail(id " has a lifecycle row but no ownership row")
        }
        predecessor = lifecycle_supersedes[id]
        successor = lifecycle_superseded_by[id]
        if (predecessor != "none") {
            if (!stable_id(predecessor) || !lifecycle[predecessor]) {
                fail(id " supersedes an unknown invariant")
            } else if (lifecycle_superseded_by[predecessor] != id) {
                fail(id " supersession predecessor is not symmetric")
            }
        }
        if (successor != "none") {
            if (!stable_id(successor) || !lifecycle[successor]) {
                fail(id " is superseded by an unknown invariant")
            } else if (lifecycle_supersedes[successor] != id) {
                fail(id " supersession successor is not symmetric")
            } else {
                if (version_compare(lifecycle_effective[successor],
                                    lifecycle_effective[id]) <= 0) {
                    fail(id " successor effective version does not increase")
                }
                if (version_compare(lifecycle_rollback[successor],
                                    lifecycle_effective[id]) < 0) {
                    fail(id " successor rollback floor precedes predecessor")
                }
            }
        }
        if (successor != "none" && lifecycle_status[id] != "superseded") {
            fail(id " names a successor but is not superseded")
        }
        if (lifecycle_status[id] == "superseded" && successor == "none") {
            fail(id " is superseded without a successor")
        }
        if (lifecycle_status[id] == "retired" && successor != "none") {
            fail(id " is retired but names a successor")
        }
    }
    for (id in lifecycle) {
        visit(id)
    }
    for (id in law) {
        if (!ownership[law_coordinator[id]]) {
            fail(id " coordinates through an unknown invariant")
        }
        dependency_count = split(law_dependencies[id], dependency_parts, ",")
        if (dependency_count < 2) {
            fail(id " is not composite")
        }
        coordinator_found = 0
        delete dependency_seen
        for (dependency_index = 1;
             dependency_index <= dependency_count;
             dependency_index++) {
            dependency = trim(dependency_parts[dependency_index])
            if (!stable_id(dependency) || !ownership[dependency]) {
                fail(id " depends on unknown invariant " dependency)
            }
            if (dependency_seen[dependency]++) {
                fail(id " repeats invariant dependency " dependency)
            }
            if (dependency == law_coordinator[id]) {
                coordinator_found = 1
            }
        }
        if (!coordinator_found) {
            fail(id " dependency set omits its coordinator")
        }
    }
    if (law_count == 0) {
        fail("no composite security laws found")
    }
    if (declaration_count == 0) {
        fail("no milestone invariant declarations found")
    }
    exit failed
}
' "$registry" "$@"
