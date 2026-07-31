#!/usr/bin/env sh
set -eu

supersessions="${VITHEIM_DEPENDENCY_SUPERSESSIONS:-docs/implementation/dependency_supersessions_v1.txt}"
test_inventory="${VITHEIM_TEST_INVENTORY:-docs/implementation/executable_test_inventory_v1.txt}"
rows="$(mktemp /tmp/vitheim-dependency-supersession-rows.XXXXXX)"
trap 'rm -f "$rows"' EXIT

fail() {
    echo "dependency supersessions: $1" >&2
    exit 1
}

awk -F '|' '
NR <= 3 { next }
{ print }
' "$supersessions" > "$rows"

while IFS='|' read -r dependent removed reason controls replacement reviewer \
    generation digest negative_tests integration_tests status; do
    canonical="$(printf '%s|%s|%s|%s|%s|%s|%s|%s|%s|%s' \
        "$dependent" "$removed" "$reason" "$controls" "$replacement" \
        "$reviewer" "$generation" "$negative_tests" "$integration_tests" \
        "$status")"
    actual_digest="sha256:$(printf '%s' "$canonical" |
        sha256sum | awk '{ print $1 }')"
    [ "$digest" = "$actual_digest" ] ||
        fail "$dependent -> $removed has a noncanonical record digest"

    old_ifs="$IFS"
    IFS=,
    for control in $controls; do
        case "$control" in
            VIT-INV-*)
                grep -Fq "$control" docs/INVARIANT_OWNERSHIP.md ||
                    fail "$dependent -> $removed references unknown $control"
                ;;
            VIT-LAW-*)
                grep -Fq "$control" docs/LAW_GENERATIONS.md ||
                    fail "$dependent -> $removed references unknown $control"
                ;;
            VIT-MODEL-*)
                grep -Fq "$control" \
                    docs/implementation/executable_model_bindings_v1.txt ||
                    fail "$dependent -> $removed references unknown $control"
                ;;
            VIT-REQ-*)
                grep -R -Fq --include='*.md' "$control" docs/implementation ||
                    fail "$dependent -> $removed references unknown $control"
                ;;
        esac
    done
    for test_id in $negative_tests,$integration_tests; do
        test_status="$(awk -F '|' -v wanted="$test_id" '
            $1 == wanted { print $4 }
        ' "$test_inventory")"
        [ "$test_status" = "implemented" ] ||
            fail "$dependent -> $removed lacks implemented evidence for $test_id"
    done
    IFS="$old_ifs"
done < "$rows"

echo "dependency supersessions: ok"
