#!/usr/bin/env sh
set -eu

reviews="${1:-docs/AUTHORITY_REVIEWS.md}"
registry="docs/INVARIANT_OWNERSHIP.md"
if [ "$#" -gt 0 ]; then
    shift
fi
if [ "$#" -eq 0 ]; then
    set -- docs/implementation/*.md
fi

awk -F '|' -v reviews="$reviews" -v registry="$registry" '
BEGIN {
    failed = 0
}
FILENAME == reviews &&
/^\| (0\.[0-9]+\.[0-9]+|1\.0\.0) / {
    version = trim($2)
    document = trim($3)
    disposition = trim($4)
    identifiers = trim($5)
    context = trim($6)
    gate = trim($7)
    gsub(/`/, "", document)

    if (review[version]++) {
        fail("duplicate review for " version)
    }
    if (disposition !~ /^(declares|proposed|extends|none)$/) {
        fail(version " has invalid authority disposition")
    }
    if (document == "" || context == "" || gate == "") {
        fail(version " has an incomplete authority review")
    }
    if (disposition == "proposed") {
        expected = version
        gsub(/\./, "-", expected)
        if (identifiers != "VIT-PAUTH-" expected) {
            fail(version " has mismatched proposed-authority ID")
        }
    }
    if (disposition == "none" && identifiers != "none") {
        fail(version " none disposition must use explicit none")
    }
    if ((disposition == "declares" || disposition == "extends") &&
        identifiers !~ /^VIT-(INV|LAW)-[0-9][0-9][0-9]/) {
        fail(version " disposition has no stable authority ID")
    }
    review_document[version] = document
    review_disposition[version] = disposition
    review_identifiers[version] = identifiers
    next
}
FILENAME == registry &&
/^\| VIT-(INV|LAW)-[0-9][0-9][0-9] / {
    known_authority[trim($2)] = 1
    next
}
FILENAME != reviews && FILENAME != registry &&
(/^## `([0-9]+\.[0-9]+\.[0-9]+)`/ || /^# `1\.0\.0`/) {
    heading = $0
    sub(/^##? `/, "", heading)
    split(heading, heading_parts, "`")
    current_version = heading_parts[1]
    if (eligible(current_version)) {
        milestone[current_version]++
        milestone_document[current_version] = FILENAME
        milestone_count++
    }
    next
}
FILENAME != reviews && FILENAME != registry && current_version != "" &&
/^<!--[[:space:]]+vitheim-(invariant|law)[[:space:]]+/ {
    count = split($0, marker, /[[:space:]]+/)
    id = marker[3]
    if (eligible(current_version)) {
        milestone_declaration[current_version, id] = 1
        milestone_declaration_count[current_version]++
    }
    next
}
function eligible(version, parts) {
    if (version == "1.0.0") return 1
    split(version, parts, ".")
    if ((parts[1] + 0) != 0) return (parts[1] + 0) > 0
    if ((parts[2] + 0) > 18) return 1
    return (parts[2] + 0) == 18 && (parts[3] + 0) > 3
}
function trim(value) {
    sub(/^[[:space:]]+/, "", value)
    sub(/[[:space:]]+$/, "", value)
    return value
}
function stable_id(value) {
    return value ~ /^VIT-(INV|LAW)-[0-9][0-9][0-9]$/
}
function fail(message) {
    print "authority reviews: " message > "/dev/stderr"
    failed = 1
}
END {
    for (version in milestone) {
        if (milestone[version] != 1) {
            fail(version " milestone heading is not unique")
        }
        if (!review[version]) {
            fail(version " has no authority review")
            continue
        }
        if (review_document[version] != milestone_document[version]) {
            fail(version " review points to the wrong document")
        }
        disposition = review_disposition[version]
        if (disposition == "declares") {
            declared_count = split(review_identifiers[version],
                                   declared_parts, ",")
            if (declared_count != milestone_declaration_count[version]) {
                fail(version " review/declaration count differs")
            }
            delete declared_seen
            for (part = 1; part <= declared_count; part++) {
                id = trim(declared_parts[part])
                if (!stable_id(id)) {
                    fail(version " review has malformed declaration " id)
                }
                if (declared_seen[id]++) {
                    fail(version " review repeats declaration " id)
                }
                if (!milestone_declaration[version, id]) {
                    fail(version " review cites undeclared " id)
                }
            }
        } else if (milestone_declaration_count[version]) {
            fail(version " has declarations but review is not declares")
        }
        if (disposition == "extends") {
            extension_count = split(review_identifiers[version],
                                    extension_parts, ",")
            delete extension_seen
            for (part = 1; part <= extension_count; part++) {
                id = trim(extension_parts[part])
                if (!stable_id(id)) {
                    fail(version " extends malformed authority " id)
                }
                if (!known_authority[id]) {
                    fail(version " extends unknown authority " id)
                }
                if (extension_seen[id]++) {
                    fail(version " repeats extended authority " id)
                }
            }
        }
    }
    for (version in review) {
        if (!milestone[version]) {
            fail(version " review has no implementation milestone")
        }
    }
    if (milestone_count == 0) fail("no post-0.18.3 milestones found")
    exit failed
}
' "$reviews" "$registry" "$@"
