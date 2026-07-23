#!/bin/sh
set -eu

tmp_dir=$(mktemp -d)
trap 'rm -rf "$tmp_dir"' EXIT HUP INT TERM

ownership="$tmp_dir/ownership.md"
generations="$tmp_dir/generations.md"
admissions="$tmp_dir/admissions.md"
realizations="$tmp_dir/realizations.md"

reset_law() {
    cp docs/INVARIANT_OWNERSHIP.md "$ownership"
    cp docs/LAW_GENERATIONS.md "$generations"
    cp docs/LAW_MANIFEST_ADMISSIONS.md "$admissions"
}

expect_law_failure() {
    label=$1
    if scripts/check_law_generations.sh \
        "$ownership" "$generations" "$admissions" >/dev/null 2>&1; then
        echo "adversarial law policy: unexpectedly accepted $label" >&2
        exit 1
    fi
    reset_law
}

expect_law_failure_message() {
    label=$1
    expected=$2
    if output=$(scripts/check_law_generations.sh \
        "$ownership" "$generations" "$admissions" 2>&1); then
        echo "adversarial law policy: unexpectedly accepted $label" >&2
        exit 1
    fi
    case "$output" in
        *"$expected"*) ;;
        *)
            echo "adversarial law policy: $label failed for the wrong reason" >&2
            exit 1
            ;;
    esac
    reset_law
}

expect_realization_failure() {
    label=$1
    if scripts/check_law_semantic_realizations.sh \
        "$generations" "$realizations" >/dev/null 2>&1; then
        echo "adversarial law policy: unexpectedly accepted $label" >&2
        exit 1
    fi
    cp docs/LAW_SEMANTIC_REALIZATIONS.md "$realizations"
}

digest_sha256() {
    if command -v sha256sum >/dev/null 2>&1; then
        hash_line=$(sha256sum)
    elif command -v shasum >/dev/null 2>&1; then
        hash_line=$(shasum -a 256)
    elif command -v sha256 >/dev/null 2>&1; then
        sha256 -q
        return
    else
        echo "adversarial law policy: no SHA-256 tool found" >&2
        exit 1
    fi
    printf '%s\n' "${hash_line%% *}"
}

reset_law
cp docs/LAW_SEMANTIC_REALIZATIONS.md "$realizations"

sed -i 's/| VIT-LAW-001 | 1 |/| VIT-LAW-001 | 01 |/' "$generations"
expect_law_failure "a leading-zero generation"

sed -i 's/| VIT-LAW-001 | 1 |/| VIT-LAW-001 | 1x |/' "$generations"
expect_law_failure "a malformed generation"

sed -i 's/`0.16.0`/`00.16.0`/g' "$generations"
expect_law_failure "noncanonical SemVer"

sed -i 's/-g01-v1/-g01-v01/g' "$generations"
expect_law_failure "a leading-zero contract version"

sed -i 's/| none | linearize:/| VIT-INV-019 | linearize:/' "$generations"
expect_law_failure "generation-one removals"

sed -i \
    's/| VIT-INV-020 | none |/| VIT-INV-020 | VIT-INV-020 |/' \
    "$generations"
expect_law_failure "overlapping dependency deltas"

sed -i \
    's/| VIT-INV-019, VIT-INV-021, VIT-INV-023 |/| VIT-INV-019 |/' \
    "$generations"
expect_law_failure "fewer than two resolved roots"

tab=$(printf '\t')
sed -i "s/linearize: /linearize:${tab}/" "$generations"
expect_law_failure "a tab"

carriage_return=$(printf '\r')
sed -i "s/; failure:/;${carriage_return} failure:/" "$generations"
expect_law_failure "a carriage return"

non_ascii=$(printf '\303\251')
sed -i "s/linearize:/lineariz${non_ascii}e:/" "$generations"
expect_law_failure "non-ASCII normalization input"

sed -i 's/; failure:/; | failure:/' "$generations"
expect_law_failure "an embedded Markdown field separator"

old_digest=$(awk -F'|' '
/^\| VIT-LAW-001 \| 1 \|/ {
    value = $17
    gsub(/^ | $/, "", value)
    print value
    exit
}
' "$generations")
sed -i 's/each authority owner advances/each admitted authority owner advances/' \
    "$generations"
new_preimage=$(LC_ALL=C awk -F'|' '
function trim(value) {
    sub(/^ +/, "", value)
    sub(/ +$/, "", value)
    return value
}
function bare(value) {
    value = trim(value)
    gsub(/`/, "", value)
    return value
}
function net(value) {
    return length(value) ":" value
}
/^\| VIT-LAW-001 \| 1 \|/ {
    print net("vitheim-law-generation-manifest-v1") \
        net(trim($2)) net(trim($3)) net(bare($4)) net(trim($5)) \
        net(trim($6)) net(trim($7)) net(trim($15)) net(trim($9)) \
        net(trim($10)) net(trim($11)) net(trim($12)) net(bare($13)) \
        net(trim($14)) net(trim($16))
    exit
}
' "$generations")
new_digest="sha256:$(printf '%s' "$new_preimage" | digest_sha256)"
sed -i "s/$old_digest/$new_digest/" "$generations"
expect_law_failure_message \
    "a self-consistent manifest absent from the trusted catalog" \
    "admission digest differs from manifest"

sed -i '/| VIT-LAW-001@g01 |/d' "$admissions"
expect_law_failure "a missing ancestry admission"

sed -i '/| VIT-LSEM-006-g01-v1 |/d' "$realizations"
expect_realization_failure "a missing semantic realization"

sed -i 's/, `OutcomeUnknown`//g' "$realizations"
expect_realization_failure "a missing typed transmission outcome"

echo "adversarial law policy checks passed"
