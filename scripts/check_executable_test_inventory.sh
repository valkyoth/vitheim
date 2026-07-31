#!/usr/bin/env sh
set -eu

inventory="${VITHEIM_TEST_INVENTORY:-docs/implementation/executable_test_inventory_v1.txt}"
symbols="${VITHEIM_SYMBOL_INVENTORY:-docs/implementation/executable_symbol_inventory_v1.txt}"
evidence="${VITHEIM_TEST_EVIDENCE:-docs/implementation/executable_test_evidence_v1.txt}"
symbol_rows="$(mktemp /tmp/vitheim-test-symbols.XXXXXX)"
test_rows="$(mktemp /tmp/vitheim-test-registrations.XXXXXX)"
evidence_rows="$(mktemp /tmp/vitheim-test-evidence.XXXXXX)"
trap 'rm -f "$symbol_rows" "$test_rows" "$evidence_rows"' EXIT

fail() {
    echo "executable test inventory: $1" >&2
    exit 1
}

awk -F '|' '
NR == 1 {
    if ($0 != "schema|ExecutableSymbolInventoryV1") fail("wrong symbol schema")
    next
}
NR == 2 {
    if ($0 != "generation|1") fail("wrong symbol generation")
    next
}
NR == 3 {
    if ($0 != "owner_ref|source_file|symbol|status") fail("wrong symbol header")
    next
}
{
    if (NF != 4 || $1 !~ /^crates\/[^#]+#[A-Za-z0-9_:]+$/ ||
        $2 !~ /^crates\/[^|]+\.rs$/ || $2 ~ /\.\./ ||
        $3 !~ /^[A-Za-z_][A-Za-z0-9_]*$/ || $4 != "implemented") {
        fail("malformed symbol row")
    }
    if (seen[$1]++) fail("duplicate symbol owner " $1)
    print
}
END { exit failed }
function fail(message) {
    print "executable test inventory: " message > "/dev/stderr"
    failed = 1
}
' "$symbols" > "$symbol_rows"

awk -F '|' '
NR == 1 {
    if ($0 != "schema|ExecutableTestInventoryV1") fail("wrong test schema")
    next
}
NR == 2 {
    if ($0 != "generation|2") fail("wrong test generation")
    next
}
NR == 3 {
    if ($0 != "test_id|owner|runner|status") fail("wrong test header")
    next
}
{
    if (NF != 4) {
        fail("test row has wrong field count")
        next
    }
    if ($1 !~ /^VIT-(TST-[A-Z0-9-]+|MT-[0-9][0-9][0-9]-[PNMFR])$/) {
        fail("malformed test ID " $1)
    }
    if (seen[$1]++) fail("duplicate test ID " $1)
    if ($2 !~ /^crates\/[^#]+#[A-Za-z0-9_:]+$/) {
        fail($1 " has malformed owner")
    }
    if ($3 !~ /^script:scripts\/[A-Za-z0-9_.\/-]+\.sh$/ ||
        $3 ~ /\.\./) {
        fail($1 " must use a safe project-owned script runner")
    }
    if ($4 != "registered" && $4 != "implemented") {
        fail($1 " has invalid status")
    }
    print
}
END { exit failed }
function fail(message) {
    print "executable test inventory: " message > "/dev/stderr"
    failed = 1
}
' "$inventory" > "$test_rows"

awk -F '|' '
NR == 1 {
    if ($0 != "schema|ExecutableTestEvidenceV1") fail("wrong evidence schema")
    next
}
NR == 2 {
    if ($0 != "generation|1") fail("wrong evidence generation")
    next
}
NR == 3 {
    if ($0 != "test_id|source_digest|runner_digest|toolchain|candidate_commit|result|evidence_path|evidence_digest") {
        fail("wrong evidence header")
    }
    next
}
{
    if (NF != 8) {
        fail("evidence row has wrong field count")
        next
    }
    if ($1 !~ /^VIT-(TST-[A-Z0-9-]+|MT-[0-9][0-9][0-9]-[PNMFR])$/ ||
        $2 !~ /^sha256:[0-9a-f]+$/ || length($2) != 71 ||
        $3 !~ /^sha256:[0-9a-f]+$/ || length($3) != 71 ||
        $4 !~ /^rust-[0-9]+\.[0-9]+\.[0-9]+$/ ||
        $5 !~ /^[0-9a-f]+$/ || length($5) != 40 ||
        $6 != "passed" ||
        $7 !~ /^security\/test-evidence\/[A-Za-z0-9_.\/-]+$/ ||
        $7 ~ /\.\./ ||
        $8 !~ /^sha256:[0-9a-f]+$/ || length($8) != 71) {
        fail("malformed evidence row for " $1)
    }
    if (seen[$1]++) fail("duplicate test evidence " $1)
    print
}
END { exit failed }
function fail(message) {
    print "executable test inventory: " message > "/dev/stderr"
    failed = 1
}
' "$evidence" > "$evidence_rows"

pinned_channel="$(sed -n 's/^channel = "\([^"]*\)"$/\1/p' rust-toolchain.toml)"
[ -n "$pinned_channel" ] || fail "rust-toolchain.toml lacks an exact channel"
pinned_toolchain="rust-$pinned_channel"

while IFS='|' read -r test_id owner runner status; do
    symbol_row="$(awk -F '|' -v wanted="$owner" '
        $1 == wanted { print }
    ' "$symbol_rows")"
    [ -n "$symbol_row" ] ||
        fail "$test_id owner is absent from the executable symbol inventory"
    source_file="$(printf '%s\n' "$symbol_row" | awk -F '|' '{ print $2 }')"
    symbol="$(printf '%s\n' "$symbol_row" | awk -F '|' '{ print $3 }')"
    [ -f "$source_file" ] || fail "$test_id owner source is missing"
    grep -Fq "$symbol" "$source_file" ||
        fail "$test_id owner symbol is absent from its source"

    runner_path="${runner#script:}"
    [ -f "$runner_path" ] || fail "$test_id runner is missing"
    [ -x "$runner_path" ] || fail "$test_id runner is not executable"
    "$runner_path" --list-test-ids |
        grep -Fxq "$test_id" ||
        fail "$test_id is absent from its runner list"
    "$runner_path" --run-test-id "$test_id" ||
        fail "$test_id execution failed"

    if [ "$status" = "implemented" ]; then
        evidence_row="$(awk -F '|' -v wanted="$test_id" '
            $1 == wanted { print }
        ' "$evidence_rows")"
        [ -n "$evidence_row" ] || fail "$test_id lacks immutable evidence"
        source_digest="$(printf '%s\n' "$evidence_row" |
            awk -F '|' '{ print $2 }')"
        runner_digest="$(printf '%s\n' "$evidence_row" |
            awk -F '|' '{ print $3 }')"
        toolchain="$(printf '%s\n' "$evidence_row" |
            awk -F '|' '{ print $4 }')"
        candidate_commit="$(printf '%s\n' "$evidence_row" |
            awk -F '|' '{ print $5 }')"
        evidence_path="$(printf '%s\n' "$evidence_row" |
            awk -F '|' '{ print $7 }')"
        evidence_digest="$(printf '%s\n' "$evidence_row" |
            awk -F '|' '{ print $8 }')"
        actual_source="sha256:$(sha256sum "$source_file" | awk '{ print $1 }')"
        actual_runner="sha256:$(sha256sum "$runner_path" | awk '{ print $1 }')"
        git cat-file -e "$candidate_commit^{commit}" 2>/dev/null ||
            fail "$test_id evidence candidate commit does not exist"
        candidate_source="sha256:$(git show "$candidate_commit:$source_file" |
            sha256sum | awk '{ print $1 }')"
        candidate_runner="sha256:$(git show "$candidate_commit:$runner_path" |
            sha256sum | awk '{ print $1 }')"
        [ "$source_digest" = "$actual_source" ] ||
            fail "$test_id source digest differs from evidence"
        [ "$source_digest" = "$candidate_source" ] ||
            fail "$test_id source digest is absent from its candidate commit"
        [ "$runner_digest" = "$actual_runner" ] ||
            fail "$test_id runner digest differs from evidence"
        [ "$runner_digest" = "$candidate_runner" ] ||
            fail "$test_id runner digest is absent from its candidate commit"
        [ "$toolchain" = "$pinned_toolchain" ] ||
            fail "$test_id evidence uses a different toolchain"
        [ -f "$evidence_path" ] ||
            fail "$test_id evidence artifact is missing"
        actual_evidence="sha256:$(sha256sum "$evidence_path" |
            awk '{ print $1 }')"
        [ "$evidence_digest" = "$actual_evidence" ] ||
            fail "$test_id evidence artifact digest differs"
    fi
done < "$test_rows"

while IFS='|' read -r test_id _rest; do
    test_status="$(awk -F '|' -v wanted="$test_id" '
        $1 == wanted { print $4 }
    ' "$test_rows")"
    [ "$test_status" = "implemented" ] ||
        fail "$test_id has stale evidence without implemented registration"
done < "$evidence_rows"

echo "executable test inventory: ok"
