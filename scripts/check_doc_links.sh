#!/usr/bin/env sh
set -eu

failed=0
tmp="$(mktemp "${TMPDIR:-/tmp}/vitheim-doc-links.XXXXXX")"
trap 'rm -f "$tmp"' EXIT HUP INT TERM

rg -n --glob '*.md' -o '\[[^]]+\]\([^ )#]+(?:#[^ )]+)?\)' . > "$tmp" || true

while IFS= read -r entry; do
    file="${entry%%:*}"
    rest="${entry#*:}"
    line="${rest%%:*}"
    link="${entry##*](}"
    link="${link%)}"
    path="${link%%#*}"
    case "$path" in
        http://*|https://*|mailto:*|'') continue ;;
    esac
    base="$(dirname "$file")"
    if [ ! -e "$base/$path" ]; then
        echo "$file:$line: missing local link target: $path" >&2
        failed=1
    fi
done < "$tmp"

if [ "$failed" -ne 0 ]; then
    exit 1
fi

