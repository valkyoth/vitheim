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
    $1 == "prerequisites" { prerequisites = $2 }
    END {
        gsub(/[[:space:]]+/, "-", status)
        if (stop != "" && status != "" && owner != "" &&
            prerequisites != "") {
            print stop "|" status ":" owner "|" prerequisites
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
        return "I8-independent-product-profiles"
    }
    if (n == 1 || n == 38) return "I0-feasibility"
    if (n >= 2 && n <= 11) return "I1-foundation"
    if (n >= 102 && n <= 118) return "I2-service-foundation"
    if (n >= 119 && n <= 121) return "I3-transport-test-slice"
    if (n >= 151 && n <= 225) return "I4-authenticated-incident-proof"
    if (n >= 12 && n <= 101) return "I5-operational-kernel"
    if (n >= 122 && n <= 244) return "I6-service-operations"
    if (n >= 245 && n <= 285) return "I7-security-asset-operations"
    if (n >= 286 && n <= 300) return "I7-shared-search-knowledge"
    if (n >= 301 && n <= 370) return "I8-independent-product-profiles"
    return "I9-production-qualification"
}
function delivery_for(n, state) {
    if (state == "Deferred" || state == "Unsupported") {
        return "independent-optional-profile"
    }
    if (n >= 102 && n <= 244) return "core-service-operations"
    if (n >= 245 && n <= 285) return "security-asset-operations"
    if (n >= 286 && n <= 300) {
        return "core-service-operations,security-asset-operations"
    }
    if ((n >= 133 && n <= 150) || (n >= 301 && n <= 348)) {
        return "independent-optional-profile"
    }
    return "production-common"
}
function claims_for(n, state) {
    if (state == "Deferred" || state == "Unsupported") return "none"
    if (n == 58) return "VITHEIM-PRODUCTION-V1,sqlite-bounded"
    if (n == 267 || n == 277 || n == 284) {
        return "VITHEIM-PRODUCTION-V1,security-asset-operations"
    }
    if (n >= 371) return "VITHEIM-PRODUCTION-V1"
    if (n <= 101) {
        return "VITHEIM-PRODUCTION-V1,core-service-operations,security-asset-operations"
    }
    if (n <= 244) return "VITHEIM-PRODUCTION-V1,core-service-operations"
    if (n <= 285) {
        return "VITHEIM-PRODUCTION-V1,security-asset-operations"
    }
    return "VITHEIM-PRODUCTION-V1,core-service-operations,security-asset-operations"
}
function dependencies_for(n, state) {
    if (n == 1) return "none"
    if (n >= 2 && n <= 11) return "0." (n - 1) ".0"
    if (n >= 12 && n <= 37) return "0.11.0"
    if (n == 38) return "0.1.0"
    if (n >= 39 && n <= 43) return "0.11.0,0.38.0"
    if (n == 44) return "0.10.0,0.19.0,0.23.0,0.24.0"
    if (n == 45) return "0.36.0"
    if (n >= 46 && n <= 56) return "0.11.0,0.38.0,0.44.0"
    if (n >= 57 && n <= 61) return "0.38.0,0.46.0,0.52.0,0.56.0"
    if (n >= 62 && n <= 93) return "0.38.0,0.46.0,0.52.0,0.56.0,0.57.0"
    if (n >= 94 && n <= 99) return "0.11.0,0.25.0,0.36.0,0.89.0"
    if (n >= 100 && n <= 101) return "0.95.0,0.98.0,0.99.0"
    if (n >= 102 && n <= 118) {
        return "0.89.0,0.94.0,0.95.0,0.98.0,0.99.0"
    }
    if (n == 119) {
        return "0.57.0,0.89.0,0.94.0,0.95.0,0.98.0,0.99.0"
    }
    if (n == 120) return "0.95.0,0.119.0"
    if (n >= 121 && n <= 150) return "0.102.0,0.119.0,0.120.0"
    if (n >= 151 && n <= 155) {
        return "0.89.0,0.94.0,0.95.0,0.98.0,0.99.0,0.121.0"
    }
    if (n >= 156 && n <= 210) return "0.100.0,0.101.0,0.155.0"
    if (n >= 211 && n <= 224) return "0.151.0,0.152.0,0.155.0"
    if (n == 225) {
        return "0.57.0,0.119.0,0.121.0,0.211.0,0.212.0,0.213.0,0.219.0,0.220.0,0.221.0,0.223.0,0.224.0"
    }
    if (n >= 226 && n <= 244) return "0.121.0,0.225.0"
    if (n >= 245 && n <= 262) return "0.225.0,0.242.0"
    if (n == 267) return "0.263.0,0.264.0,0.265.0"
    if (n == 277) {
        return "0.212.0,0.225.0,0.263.0,0.264.0,0.265.0,0.267.0,0.275.0"
    }
    if (n == 284) return "0.225.0,0.255.0,0.263.0,0.283.0"
    if (n == 263) return "0.225.0,0.242.0"
    if (n == 264) return "0.225.0,0.242.0,0.263.0"
    if (n == 265) return "0.263.0,0.264.0"
    if (n >= 266 && n <= 285) return "0.225.0,0.242.0,0.263.0"
    if (n == 286) return "0.225.0,0.242.0"
    if (n == 287) return "0.225.0,0.286.0"
    if (n == 288) return "0.286.0,0.287.0"
    if (n == 289) return "0.57.0,0.288.0"
    if (n >= 290 && n <= 297) return "0.225.0,0.287.0"
    if (n == 298) return "0.286.0,0.287.0,0.288.0,0.289.0,0.290.0,0.291.0,0.292.0,0.293.0,0.297.0"
    if (n == 299) return "0.298.0"
    if (n == 300) return "0.299.0"
    if (n >= 301 && n <= 370) return "0.225.0,0.242.0,0.298.0"
    if (n >= 371 && n <= 398) return "0.38.0,0.225.0,0.300.0"
    if (n == 399) return "0.398.0"
    if (n >= 400 && n <= 403) return "0.399.0"
    if (n >= 404 && n <= 405) return "0.399.0"
    if (n == 406) return "0.399.0,0.404.0"
    if (n >= 407 && n <= 409) return "0.406.0"
    if (n == 410) return "0.399.0"
    if (n == 411) return "0.410.0"
    if (n == 412) return "0.411.0"
    if (n == 413) return "0.300.0,0.369.0,0.398.0"
    if (n == 414) return "0.413.0"
    if (n == 415) return "0.398.0,0.399.0"
    if (n >= 416 && n <= 417) return "0.415.0"
    if (n == 418) return "0.398.0,0.417.0"
    if (n == 419) return "0.418.0"
    if (n == 420) return "0.419.0"
    if (n >= 421 && n <= 422) return "0.420.0"
    if (n == 423) return "0.420.0,0.421.0,0.422.0"
    if (n == 424) {
        return "0.58.0,0.267.0,0.277.0,0.284.0,0.412.0,0.413.0,0.414.0,0.417.0,0.419.0,0.423.0"
    }
    if (n == 1000) return "0.58.0,0.267.0,0.277.0,0.284.0,0.424.0"
    return "0.1.0"
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
        package_dependencies[owner_parts[1]] = owner_parts[3]
    }
    close(owner_file)
    print "schema|SelectedProfileManifestV1"
    print "profile_id|VITHEIM-PRODUCTION-V1"
    print "generation|1"
    print "default_evidence_state|Specified"
    print "stop_id|selection|capability_dependencies|dependency_state|increment|delivery_slices|required_for_claims|capability|executable_owner|integration_retest_owners|required_storage_profile|required_identity_profile|required_runtime_profile|successor_after_skip|support_boundary|dependency_class|reason"
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
    for (i = 1; i <= count; i++) {
        v = version[i]
        n = minor(v)
        selected = selection[i] == "Mandatory" ||
            selection[i] == "OptionalSelected"
        dependencies = v in package_dependencies ?
            package_dependencies[v] : dependencies_for(n, selection[i])
        dependency_state = v in package_dependencies ?
            "PackageExact" : "DeclaredMinimum"
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
        print v "|" selection[i] "|" dependencies "|" dependency_state "|" \
            increment_for(n, selection[i]) "|" \
            delivery_for(n, selection[i]) "|" claims_for(n, selection[i]) "|" \
            title[i] "|" owner "|" retest "|" \
            storage_for(n) "|" identity_for(n) "|" runtime_for(n) "|" \
            successor "|" boundary "|" dependency "|" reason
    }
}
' "$catalog"
