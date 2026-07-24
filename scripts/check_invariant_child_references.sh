#!/usr/bin/env sh
set -eu

registry="${1:-docs/INVARIANT_OWNERSHIP.md}"

awk -F '|' '
BEGIN {
    failed = 0
    in_ownership = 0
}
/^## Ownership Matrix$/ {
    in_ownership = 1
    next
}
in_ownership && /^## / {
    in_ownership = 0
}
{
    scan_references($0, FNR)
}
in_ownership && /^\| VIT-INV-[0-9][0-9][0-9] / {
    count = split($7, points, ";")
    for (position = 1; position <= count; position++) {
        point = trim(points[position])
        if (!match(point, /^VIT-ENF-[0-9][0-9][0-9]-[A-Z]:/)) {
            continue
        }
        enforcement = substr(point, RSTART, RLENGTH - 1)
        if (!match(point, /VIT-TST-[0-9][0-9][0-9]-N-[A-Z]/)) {
            continue
        }
        test = substr(point, RSTART, RLENGTH)
        if (declared_enforcement[enforcement]++) {
            fail("duplicate enforcement child " enforcement)
        }
        if (declared_test[test]++) {
            fail("duplicate negative test child " test)
        }
    }
}
function trim(value) {
    sub(/^[[:space:]]+/, "", value)
    sub(/[[:space:]]+$/, "", value)
    return value
}
function scan_references(line, line_number, remaining, child) {
    remaining = line
    while (match(remaining, /VIT-ENF-[0-9][0-9][0-9]-[A-Z]/)) {
        child = substr(remaining, RSTART, RLENGTH)
        referenced_enforcement[child] = line_number
        remaining = substr(remaining, RSTART + RLENGTH)
    }
    remaining = line
    while (match(remaining, /VIT-TST-[0-9][0-9][0-9]-N-[A-Z]/)) {
        child = substr(remaining, RSTART, RLENGTH)
        referenced_test[child] = line_number
        remaining = substr(remaining, RSTART + RLENGTH)
    }
}
function fail(message) {
    print "invariant ownership: " message > "/dev/stderr"
    failed = 1
}
END {
    for (child in referenced_enforcement) {
        if (!declared_enforcement[child]) {
            fail("referenced but undeclared enforcement child " child \
                 " at registry line " referenced_enforcement[child])
        }
    }
    for (child in referenced_test) {
        if (!declared_test[child]) {
            fail("referenced but undeclared negative test child " child \
                 " at registry line " referenced_test[child])
        }
    }
    exit failed
}
' "$registry"
