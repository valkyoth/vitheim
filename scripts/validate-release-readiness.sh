#!/usr/bin/env sh
set -eu

version="${1:-}"
case "$version" in
    v[0-9]*.[0-9]*.[0-9]*) ;;
    *)
        echo "usage: scripts/validate-release-readiness.sh vX.Y.Z" >&2
        exit 2
        ;;
esac

report="security/pentest/$version.md"
notes="release-notes/RELEASE_NOTES_${version#v}.md"

test -f "$report"
test -f "$notes"
grep -Fxq 'Status: PASS' "$report"
grep -Fxq "Version: ${version#v}" "$report"
grep -Eq '^Reviewed commit: [0-9a-f]{40}$' "$report"

scripts/checks.sh
scripts/generate-sbom.sh --check

if git rev-parse "$version" >/dev/null 2>&1; then
    echo "release readiness must run before tag creation: $version already exists" >&2
    exit 1
fi
