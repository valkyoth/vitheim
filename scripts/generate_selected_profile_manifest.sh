#!/usr/bin/env sh
set -eu

catalog="$(mktemp /tmp/vitheim-selected-profile-catalog.XXXXXX)"
owners="$(mktemp /tmp/vitheim-selected-profile-owners.XXXXXX)"
trap 'rm -f "$catalog" "$owners"' EXIT

for package in docs/implementation/work_packages/*.work-package; do
    awk -F '=' '
    $1 == "stop_id" { stop = $2 }
    $1 == "status" { status = $2 }
    $1 == "crates_and_files" {
        owner = substr($0, index($0, "=") + 1)
    }
    END {
        gsub(/[[:space:]]+/, "-", status)
        if (stop != "" && status != "" && owner != "") {
            print stop "|" status ":" owner
        }
    }
    ' "$package"
done > "$owners"

for file in docs/implementation/*.md; do
    awk -v document="$file" '
    /^##? `([0-9]+\.[0-9]+\.[0-9]+)`/ {
        heading = $0
        sub(/^##? `/, "", heading)
        split(heading, parts, "`")
        version = parts[1]
        title = heading
        sub(/^[^`]+`[[:space:]]*[—-]?[[:space:]]*/, "", title)
        gsub(/\|/, "/", title)
        print version "|" document "|" title
    }
    ' "$file"
done | sort -t '|' -k1,1V > "$catalog"

awk -F '|' -v owner_file="$owners" '
function minor(version, parts) {
    split(version, parts, ".")
    if (parts[1] == 1) return 1000
    return parts[2] + 0
}
function selection_for(n) {
    if (n == 58 || n == 267 || n == 277 || n == 284) {
        return "OptionalSelected"
    }
    if ((n >= 59 && n <= 61) || (n >= 63 && n <= 64) ||
        (n >= 66 && n <= 72) || (n >= 74 && n <= 86) ||
        (n >= 133 && n <= 150) || n == 214 ||
        (n >= 216 && n <= 218) || n == 222 ||
        (n >= 226 && n <= 227) || n == 234 ||
        (n >= 236 && n <= 238) || (n >= 247 && n <= 248) ||
        n == 260 || (n >= 268 && n <= 269) || n == 276 ||
        (n >= 294 && n <= 296) || (n >= 301 && n <= 310) ||
        (n >= 313 && n <= 333) || (n >= 339 && n <= 348) ||
        n == 361) {
        return "Deferred"
    }
    if ((n >= 100 && n <= 101) || (n >= 156 && n <= 210)) {
        return "Unsupported"
    }
    return "Mandatory"
}
function increment_for(n, state) {
    if (state == "Deferred" || state == "Unsupported") {
        return "I7-independent-product-profiles"
    }
    if (n == 1 || n == 38) return "I0-feasibility"
    if (n >= 2 && n <= 11) return "I1-foundation"
    if (n >= 119 && n <= 121) return "I2-transport-test-slice"
    if (n >= 151 && n <= 225) return "I3-authenticated-incident-proof"
    if (n >= 12 && n <= 118) return "I4-operational-kernel"
    if (n >= 122 && n <= 244) return "I5-service-operations"
    if (n >= 245 && n <= 300) return "I6-security-asset-operations"
    if (n >= 301 && n <= 370) return "I7-independent-product-profiles"
    return "I8-production-qualification"
}
function delivery_for(n, state) {
    if (state == "Deferred" || state == "Unsupported") {
        return "independent-optional-profile"
    }
    if (n >= 102 && n <= 244) return "core-service-operations"
    if (n >= 245 && n <= 300) return "security-asset-operations"
    if ((n >= 133 && n <= 150) || (n >= 301 && n <= 348)) {
        return "independent-optional-profile"
    }
    return "production-common"
}
function storage_for(n) {
    if (n <= 45) return "none-or-memory"
    if (n <= 56) return "semantic-storage-contract"
    if (n == 57) return "postgresql-reference"
    if (n == 58) return "sqlite-bounded"
    if (n == 59) return "mysql-deferred"
    if (n == 60) return "mongodb-deferred"
    if (n == 61) return "surrealdb-deferred"
    return "postgresql-reference"
}
function identity_for(n) {
    if (n <= 150) return "fake-facts-only"
    if (n <= 210) return "tenant-lifecycle-only"
    return "oidc-rbac-abac-selected"
}
function runtime_for(n) {
    if (n <= 10) return "N0-N1"
    if (n == 11) return "test-host-only"
    if (n <= 45) return "N1-hosted-boundary"
    return "Hosted"
}
BEGIN {
    while ((getline owner_row < owner_file) > 0) {
        split(owner_row, owner_parts, "|")
        owner_for_stop[owner_parts[1]] = owner_parts[2]
    }
    close(owner_file)
    print "schema|SelectedProfileManifestV1"
    print "profile_id|VITHEIM-PRODUCTION-V1"
    print "generation|1"
    print "default_evidence_state|Specified"
    print "stop_id|selection|predecessors|increment|delivery_slice|capability|executable_owner|integration_retest_owners|required_storage_profile|required_identity_profile|required_runtime_profile|successor_after_skip|support_boundary|dependency_class|reason"
}
{
    count++
    version[count] = $1
    document[count] = $2
    title[count] = $3
    n = minor($1)
    selection[count] = selection_for(n)
}
END {
    previous_mandatory = "none"
    for (i = 1; i <= count; i++) {
        v = version[i]
        n = minor(v)
        selected = selection[i] == "Mandatory" ||
            selection[i] == "OptionalSelected"
        predecessor = selected ? previous_mandatory : "none"
        successor = selected ? "not-applicable" :
            "future-minor-required-after-skip"
        boundary = selection[i] == "Mandatory" ?
            "SpecifiedUntilExactStopAndPentest" :
            (selection[i] == "OptionalSelected" ?
             "SelectedBoundedProfileOnly" :
             (selection[i] == "Deferred" ?
              "NotInDefaultV1" : "RefusedInDefaultV1"))
        dependency = selected ? "selected-closure" :
            "optional-outward-only"
        reason = selection[i] == "Mandatory" ?
            "required by the combined production-v1 claim" :
            (selection[i] == "OptionalSelected" ?
             "selected as one separately evidenced bounded reference profile" :
             (selection[i] == "Deferred" ?
              "not required by the default production-v1 claim" :
              "explicitly refused by the default production-v1 profile"))
        owner = v in owner_for_stop ? owner_for_stop[v] :
            "specified:" document[i] "#" v
        retest = v == "0.424.0" || v == "1.0.0" ? "self" :
            (selected ? v ",0.424.0" : "future-successor-required")
        print v "|" selection[i] "|" predecessor "|" \
            increment_for(n, selection[i]) "|" \
            delivery_for(n, selection[i]) "|" title[i] "|" owner "|" retest "|" \
            storage_for(n) "|" identity_for(n) "|" runtime_for(n) "|" \
            successor "|" boundary "|" dependency "|" reason
        if (selection[i] == "Mandatory") previous_mandatory = v
    }
}
' "$catalog"
