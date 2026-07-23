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

extra_versions="
0.8.1 0.15.1 0.18.1 0.20.1 0.20.2
0.28.1 0.28.2 0.30.1 0.30.2 0.36.1
0.38.1 0.39.1 0.39.2 0.39.3 0.40.1 0.48.1
0.51.1 0.53.1 0.53.2 0.53.3 0.54.1 0.56.1
0.71.1 0.71.2 0.78.1 0.78.2 0.78.3 0.78.4 0.78.5
0.82.1 0.88.1 0.88.2 0.88.3 0.89.1
0.93.1 0.98.1
0.116.1 0.118.1 0.118.2
0.120.1 0.120.2 0.120.3 0.120.4 0.120.5
0.132.1 0.132.2
0.138.1 0.138.2 0.138.3
0.140.1 0.140.2 0.140.3 0.140.4 0.140.5 0.140.6 0.140.7 0.140.8 0.140.9 0.140.10
0.142.1
"

for version in $extra_versions; do
    count="$(rg -l "^## \`$version\`" docs/implementation | wc -l)"
    if [ "$count" -ne 1 ]; then
        echo "implementation plan: expected one heading for $version, found $count" >&2
        failed=1
    fi
done

for field in Status Setup Goal Deliverables Verification 'Exit criteria'; do
    count="$(rg -o "$field:" docs/implementation | wc -l)"
    if [ "$count" -lt 211 ]; then
        echo "implementation plan: field '$field' appears only $count times" >&2
        failed=1
    fi
done

pentest_count="$(rg -o 'Run (final )?pentest for this exact commit' docs/implementation | wc -l)"
if [ "$pentest_count" -ne 211 ]; then
    echo "implementation plan: expected 211 exact-commit pentest stops, found $pentest_count" >&2
    failed=1
fi

if [ "$failed" -ne 0 ]; then
    exit 1
fi
