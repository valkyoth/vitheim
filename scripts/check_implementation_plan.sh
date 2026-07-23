#!/usr/bin/env sh
set -eu

failed=0

for minor in $(seq 1 150); do
    version="0.$minor.0"
    count="$(rg -l "^## \`$version\`" docs/implementation | wc -l)"
    if [ "$count" -ne 1 ]; then
        echo "implementation plan: expected one heading for $version, found $count" >&2
        failed=1
    fi
done

production_count="$(rg -l '^# `1\.0\.0`' docs/implementation | wc -l)"
if [ "$production_count" -ne 1 ]; then
    echo "implementation plan: expected one 1.0.0 production document" >&2
    failed=1
fi

for version in 0.53.1 0.140.1 0.140.2 0.140.3 0.140.4 0.140.5 0.140.6 0.140.7 0.140.8; do
    count="$(rg -l "^## \`$version\`" docs/implementation | wc -l)"
    if [ "$count" -ne 1 ]; then
        echo "implementation plan: expected one heading for $version, found $count" >&2
        failed=1
    fi
done

for field in Status Setup Goal Deliverables Verification 'Exit criteria'; do
    count="$(rg -o "$field:" docs/implementation | wc -l)"
    if [ "$count" -lt 160 ]; then
        echo "implementation plan: field '$field' appears only $count times" >&2
        failed=1
    fi
done

pentest_count="$(rg -o 'Run (final )?pentest for this exact commit' docs/implementation | wc -l)"
if [ "$pentest_count" -ne 160 ]; then
    echo "implementation plan: expected 160 exact-commit pentest stops, found $pentest_count" >&2
    failed=1
fi

if [ "$failed" -ne 0 ]; then
    exit 1
fi
