#!/usr/bin/env bash
set -euo pipefail

output="${1:-docs/AUTHORITY_REVIEWS.md}"
if [ -e "$output" ]; then
    echo "authority reviews: refusing to overwrite reviewed registry: $output" >&2
    exit 1
fi
output_dir="$(dirname "$output")"
temporary="$(mktemp "$output_dir/.authority-reviews.XXXXXX")"
rows="$(mktemp "$output_dir/.authority-review-rows.XXXXXX")"
trap 'rm -f "$temporary" "$rows"' EXIT

awk '
    function eligible(version, parts) {
        if (version == "1.0.0") return 1
        split(version, parts, ".")
        if ((parts[1] + 0) != 0) return (parts[1] + 0) > 0
        if ((parts[2] + 0) > 18) return 1
        return (parts[2] + 0) == 18 && (parts[3] + 0) > 3
    }
    function emit(candidate, context, gate) {
        if (!have || !eligible(version)) return
        context = title
        gsub(/\|/, "/", context)
        if (declarations != "") {
            print "| " version " | `" file "` | declares | " declarations \
                " | " context \
                " | declarations, ownership/law generations, and lifecycle" \
                " must change together |"
        } else {
            candidate = version
            gsub(/\./, "-", candidate)
            candidate = "VIT-PAUTH-" candidate
            gate = "before implementation resolve to exact declarations," \
                " `extends`, or reviewed `none`"
            print "| " version " | `" file "` | proposed | " candidate \
                " | " context " authority review | " gate " |"
        }
    }
    FNR == 1 {
        if (file != "") emit()
        file = FILENAME
        have = 0
        declarations = ""
    }
    /^## `([0-9]+\.[0-9]+\.[0-9]+)`/ ||
    /^# `1\.0\.0`/ {
        if (have) emit()
        heading = $0
        sub(/^##? `/, "", heading)
        split(heading, heading_parts, "`")
        version = heading_parts[1]
        title = heading
        sub(/^[^`]+`[[:space:]]*[—-]?[[:space:]]*/, "", title)
        if (version == "1.0.0" && title == heading) {
            title = "Production release"
        }
        declarations = ""
        have = 1
        next
    }
    have && /^<!--[[:space:]]+vitheim-(invariant|law)[[:space:]]+/ {
        count = split($0, marker, /[[:space:]]+/)
        if (declarations != "") declarations = declarations ", "
        declarations = declarations marker[3]
    }
    END {
        emit()
    }
    ' docs/implementation/*.md > "$rows"

{
    printf '%s\n' \
        '# Milestone Authority Reviews' \
        '' \
        'Status: normative planning registry introduced by `0.18.3`' \
        '' \
        'Every implementation milestone after `0.18.3` has exactly one' \
        'authority disposition. `declares` resolves existing invariant/law' \
        'markers. `proposed` is a conservative authority-review candidate:' \
        'before that milestone starts, it must be split into exact `VIT-INV-*`/' \
        '`VIT-LAW-*` declarations, changed to `extends` with resolved existing' \
        'IDs, or changed to `none` with a reviewed non-authority reason.' \
        'A proposed candidate is not implementation authority and cannot satisfy' \
        'storage, recovery, or production conformance by itself.' \
        'It is legal only while the milestone status contains `planned`; changing' \
        'status requires resolving the proposal in the same commit. `extends` law' \
        'references are generation-qualified as `VIT-LAW-NNN@gNN`.' \
        '`scripts/generate_authority_reviews.sh` creates a conservative bootstrap for a' \
        'new plan; reviewed `extends`/`none` resolutions are normative and must not' \
        'be overwritten by regenerating that bootstrap.' \
        '' \
        '| Milestone | Document | Disposition | Declared or proposed IDs | Context | Resolution gate |' \
        '| --- | --- | --- | --- | --- | --- |'
    sort -t '|' -k 2,2V "$rows"
} > "$temporary"

mv "$temporary" "$output"
rm -f "$rows"
trap - EXIT
