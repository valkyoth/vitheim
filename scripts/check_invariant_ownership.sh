#!/usr/bin/env sh
set -eu

registry="${1:-docs/INVARIANT_OWNERSHIP.md}"
if [ "$#" -gt 0 ]; then
    shift
fi
if [ "$#" -eq 0 ]; then
    set -- docs/implementation/PHASE_A.md docs/implementation/PHASE_B.md
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
    if (storage !~ ("^requires: VIT-CAP-" suffix "([;]|$)")) {
        fail(id " has no matching semantic storage capability ID")
    }
    if (tests !~ ("^VIT-TST-" suffix " ")) {
        fail(id " has no matching verification contract ID")
    }
    if (tests !~ /P:/ || tests !~ /N:/ || tests !~ /M:/ || tests !~ /F:/) {
        fail(id " must declare P, N, M, and F tests")
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
            }
        }
        if (lifecycle_status[id] == "superseded" && successor == "none") {
            fail(id " is superseded without a successor")
        }
        if (lifecycle_status[id] == "active" && successor != "none") {
            fail(id " is active but names a successor")
        }
    }
    if (declaration_count == 0) {
        fail("no milestone invariant declarations found")
    }
    exit failed
}
' "$registry" "$@"
