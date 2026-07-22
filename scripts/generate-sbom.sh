#!/usr/bin/env sh
set -eu

mode="${1:---write}"
target="sbom/vitheim.spdx.json"
tmp="$(mktemp "${TMPDIR:-/tmp}/vitheim-sbom.XXXXXX")"
trap 'rm -f "$tmp"' EXIT HUP INT TERM

cargo sbom --output-format spdx_json_2_3 > "$tmp"
test -s "$tmp"

case "$mode" in
    --check)
        test -s "$target"
        for package in vitheim vitheim-budget vitheim-error vitheim-id vitheim-time; do
            rg -q "\"name\": \"$package\"" "$target"
        done
        if rg -q 'registry\+|git\+' "$target"; then
            echo "SBOM contains a forbidden third-party Cargo source" >&2
            exit 1
        fi
        ;;
    --write)
        mkdir -p sbom
        mv "$tmp" "$target"
        ;;
    *)
        echo "usage: scripts/generate-sbom.sh [--check|--write]" >&2
        exit 2
        ;;
esac

