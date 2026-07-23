#!/bin/sh
set -eu

generations=${1:-docs/LAW_GENERATIONS.md}
realizations=${2:-docs/LAW_SEMANTIC_REALIZATIONS.md}

fail() {
    echo "law semantic realizations: $*" >&2
    exit 1
}

[ -f "$generations" ] || fail "missing generation registry: $generations"
[ -f "$realizations" ] || fail "missing realization registry: $realizations"

tmp_dir=$(mktemp -d)
trap 'rm -rf "$tmp_dir"' EXIT HUP INT TERM

awk -F'|' '
function trim(value) {
    sub(/^[[:space:]]+/, "", value)
    sub(/[[:space:]]+$/, "", value)
    return value
}
/^\| VIT-LAW-[0-9][0-9][0-9] \|/ {
    law = trim($2)
    generation = trim($3)
    effective = trim($4)
    semantic = trim($15)
    gsub(/`/, "", effective)
    printf "%s|%s@g%02d|%s\n", semantic, law, generation, effective
}
' "$generations" | sort >"$tmp_dir/generations"

awk -F'|' '
function trim(value) {
    sub(/^[[:space:]]+/, "", value)
    sub(/[[:space:]]+$/, "", value)
    return value
}
/^\| VIT-LSEM-[0-9][0-9][0-9]-g[0-9][0-9]-v[0-9]+ \|/ {
    if (NF != 10 || $0 ~ /[^ -~]/) {
        print "noncanonical row: " $0 >"/dev/stderr"
        exit 2
    }
    for (i = 2; i <= 9; i++) {
        if ($i !~ /^ [^ ].*[^ ] $/) {
            print "noncanonical cell whitespace: " $0 >"/dev/stderr"
            exit 2
        }
    }
    semantic = trim($2)
    reference = trim($3)
    effective = trim($4)
    rust_path = trim($5)
    transitions = trim($6)
    tests = trim($7)
    recovery = trim($8)
    gate = trim($9)
    gsub(/`/, "", effective)
    print semantic "|" reference "|" effective "|" rust_path "|" transitions "|" tests "|" recovery "|" gate
}
' "$realizations" >"$tmp_dir/realizations" ||
    fail "registry rows are not canonical printable-ASCII Markdown"

[ -s "$tmp_dir/generations" ] || fail "no law generations found"
[ -s "$tmp_dir/realizations" ] || fail "no realization rows found"

cut -d'|' -f1-3 "$tmp_dir/realizations" | sort >"$tmp_dir/realization_keys"
cmp -s "$tmp_dir/generations" "$tmp_dir/realization_keys" ||
    fail "every generation must have exactly one matching semantic ID, reference, and effective version"

duplicates=$(cut -d'|' -f1 "$tmp_dir/realizations" | sort | uniq -d)
[ -z "$duplicates" ] || fail "duplicate semantic contracts: $duplicates"

while IFS='|' read -r semantic reference effective rust_path transitions tests recovery gate; do
    echo "$semantic" | awk '
        !/^VIT-LSEM-[0-9][0-9][0-9]-g[0-9][0-9]-v[1-9][0-9]*$/ { exit 1 }
    ' || fail "$semantic has a noncanonical ID"
    echo "$reference" | awk '
        !/^VIT-LAW-[0-9][0-9][0-9]@g[0-9][0-9]$/ { exit 1 }
    ' || fail "$semantic has a noncanonical law reference"
    echo "$effective" | awk '
        !/^(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)$/ { exit 1 }
    ' || fail "$semantic has noncanonical SemVer"

    case "$rust_path" in
        \`crates/vitheim-law/src/*.rs\`) ;;
        *) fail "$semantic has an invalid Rust realization path" ;;
    esac
    case "$recovery" in
        \`crates/vitheim-law/src/recovery/*.rs\`) ;;
        *) fail "$semantic has an invalid recovery realization path" ;;
    esac
    [ "$rust_path" != "$recovery" ] ||
        fail "$semantic must separate transition and recovery realization paths"
    echo "$transitions" | awk '
        !/^`[A-Za-z][A-Za-z0-9]*`(, `[A-Za-z][A-Za-z0-9]*`)+$/ { exit 1 }
    ' || fail "$semantic must enumerate typed transitions/outcomes"

    suffix=$(printf '%s\n' "$semantic" |
        sed -n 's/^VIT-LSEM-\([0-9][0-9][0-9]-g[0-9][0-9]\)-v[1-9][0-9]*$/\1/p')
    expected="VIT-LST-${suffix}-P, VIT-LST-${suffix}-M, VIT-LST-${suffix}-F"
    [ "$tests" = "$expected" ] ||
        fail "$semantic must bind its exact P/M/F contracts"
    [ "$gate" = "planned until \`$effective\`; then implementation and P/M/F tests required" ] ||
        fail "$semantic has a noncanonical resolution gate"

    case "$reference" in
        VIT-LAW-006@*)
            for outcome in DefinitelyNotStarted OutcomeUnknown StartClaimedReconciling; do
                case "$transitions" in
                    *"\`$outcome\`"*) ;;
                    *) fail "$semantic omits typed transmission outcome $outcome" ;;
                esac
            done
            ;;
    esac
done <"$tmp_dir/realizations"

echo "law semantic realization policy passed"
