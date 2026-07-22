#!/usr/bin/env sh
set -eu

failed=0

for manifest in crates/*/Cargo.toml; do
    if ! rg -q '^publish = false$' "$manifest"; then
        echo "workspace policy: $manifest must contain 'publish = false'" >&2
        failed=1
    fi
done

for source in $(find crates scripts -type f \( -name '*.rs' -o -name '*.sh' \) -print); do
    lines="$(wc -l < "$source")"
    if [ "$lines" -gt 500 ]; then
        echo "workspace policy: $source has $lines lines (maximum 500)" >&2
        failed=1
    fi
done

for library in crates/*/src/lib.rs; do
    if ! rg -q '^#!\[no_std\]$' "$library"; then
        echo "workspace policy: $library must declare #![no_std]" >&2
        failed=1
    fi
done

metadata="$(cargo metadata --format-version 1 --locked)"
if printf '%s\n' "$metadata" | rg -q 'registry\+|git\+'; then
    echo "workspace policy: third-party Cargo sources are forbidden" >&2
    failed=1
fi

if [ "$failed" -ne 0 ]; then
    exit 1
fi
