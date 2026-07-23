#!/usr/bin/env sh
set -eu

registry="${1:-docs/INVARIANT_OWNERSHIP.md}"

awk -F '|' '
BEGIN {
    failed = 0
    rows = 0
}

/^\| VIT-INV-[0-9][0-9][0-9] / {
    rows++
    id = trim($2)
    owner = trim($3)
    guard = trim($4)
    milestone = trim($5)
    domain = trim($6)
    enforcement = trim($7)
    storage = trim($8)
    tests = trim($9)
    recovery = trim($10)

    if (seen[id]++) {
        fail("duplicate invariant ID " id)
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
    if (storage !~ /^requires:/) {
        fail(id " has no required semantic storage capability")
    }
    if (tests !~ /P:/ || tests !~ /N:/ || tests !~ /M:/ || tests !~ /F:/) {
        fail(id " must declare P, N, M, and F tests")
    }
    if (recovery !~ /restore:/ || recovery !~ /migration:/) {
        fail(id " must declare restore and migration obligations")
    }
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

function fail(message) {
    print "invariant ownership: " message > "/dev/stderr"
    failed = 1
}

END {
    if (rows < 9) {
        fail("expected at least 9 registered invariants, found " rows)
    }
    exit failed
}
' "$registry"
