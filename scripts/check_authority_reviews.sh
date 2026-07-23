#!/usr/bin/env sh
set -eu

reviews="${1:-docs/AUTHORITY_REVIEWS.md}"
registry="docs/INVARIANT_OWNERSHIP.md"
generations="docs/LAW_GENERATIONS.md"
admissions="docs/LAW_MANIFEST_ADMISSIONS.md"
if [ "$#" -gt 0 ]; then
    shift
fi
if [ "$#" -eq 0 ]; then
    set -- docs/implementation/*.md
fi

awk -F '|' -v reviews="$reviews" -v registry="$registry" \
    -v generations="$generations" -v admissions="$admissions" '
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
FILENAME == generations &&
/^\| VIT-LAW-[0-9][0-9][0-9] / {
    law = trim($2)
    generation = trim($3) + 0
    law_generation[law, generation] = 1
    law_generation_effective[law, generation] = trim($4)
    if (generation > law_generation_count[law]) {
        law_generation_count[law] = generation
    }
    next
}
FILENAME == admissions &&
/^\| VIT-LAW-[0-9][0-9][0-9]@g[0-9][0-9] / {
    split(trim($2), admission_reference, "@g")
    admitted_generation[admission_reference[1],
                        admission_reference[2] + 0] = 1
    next
}
FILENAME != reviews && FILENAME != registry && FILENAME != generations &&
FILENAME != admissions &&
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
FILENAME != reviews && FILENAME != registry && FILENAME != generations &&
FILENAME != admissions &&
current_version != "" &&
/^<!--[[:space:]]+vitheim-(invariant|law)[[:space:]]+/ {
    count = split($0, marker, /[[:space:]]+/)
    id = marker[3]
    if (eligible(current_version)) {
        milestone_declaration[current_version, id] = 1
        milestone_declaration_count[current_version]++
    }
    next
}
FILENAME != reviews && FILENAME != registry && FILENAME != generations &&
FILENAME != admissions &&
current_version != "" && /^Status:[[:space:]]*/ {
    if (eligible(current_version)) {
        milestone_status_count[current_version]++
        milestone_status[current_version] = $0
        sub(/^Status:[[:space:]]*/, "", milestone_status[current_version])
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
function is_planned_status(value) {
    return value ~ /^planned([^[:alnum:]]|$)/ ||
        value ~ /^conditional[[:space:]]+planned([^[:alnum:]]|$)/
}
function version_compare(left, right, left_parts, right_parts, position) {
    gsub(/`/, "", left)
    gsub(/`/, "", right)
    split(left, left_parts, ".")
    split(right, right_parts, ".")
    for (position = 1; position <= 3; position++) {
        if ((left_parts[position] + 0) < (right_parts[position] + 0)) return -1
        if ((left_parts[position] + 0) > (right_parts[position] + 0)) return 1
    }
    return 0
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
        if (milestone_status_count[version] != 1) {
            fail(version " must have exactly one milestone status")
        }
        disposition = review_disposition[version]
        if (disposition == "proposed" &&
            !is_planned_status(milestone_status[version])) {
            fail(version " unresolved proposal is legal only while planned")
        }
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
                if (id ~ /^VIT-LAW-[0-9][0-9][0-9]@g[0-9][0-9]$/) {
                    split(id, law_reference, "@g")
                    law = law_reference[1]
                    generation = law_reference[2] + 0
                    if (!known_authority[law] ||
                        !law_generation[law, generation]) {
                        fail(version " extends unknown law generation " id)
                    } else {
                        for (ancestor = 1; ancestor <= generation; ancestor++) {
                            if (!admitted_generation[law, ancestor]) {
                                fail(version " closure lacks admitted " law \
                                     "@g" sprintf("%02d", ancestor))
                            }
                        }
                        latest = 0
                        for (candidate = 1;
                             candidate <= law_generation_count[law];
                             candidate++) {
                            candidate_effective = \
                                law_generation_effective[law, candidate]
                            candidate_compare = version_compare(candidate_effective, version)
                            if (law_generation[law, candidate] &&
                                candidate_compare <= 0) {
                                latest = candidate
                            }
                        }
                        referenced_effective = \
                            law_generation_effective[law, generation]
                        referenced_compare = version_compare(referenced_effective, version)
                        if (referenced_compare > 0) {
                            fail(version " extends future law generation " id)
                        } else if (generation != latest) {
                            expected_reference = law "@g" sprintf("%02d", latest)
                            fail(version " does not cite effective generation " \
                                 expected_reference)
                        }
                    }
                } else if (id ~ /^VIT-LAW-/) {
                    fail(version " extends bare law without generation " id)
                } else if (!stable_id(id)) {
                    fail(version " extends malformed authority " id)
                } else if (!known_authority[id]) {
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
' "$reviews" "$registry" "$generations" "$admissions" "$@"
