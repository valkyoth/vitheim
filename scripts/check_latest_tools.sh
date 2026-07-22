#!/usr/bin/env sh
set -eu

expected_rust="1.97.1"
expected_deny="0.20.2"
expected_audit="0.22.2"
expected_sbom="0.10.0"
expected_checkout="3d3c42e5aac5ba805825da76410c181273ba90b1"

test "$(rustc --version | awk '{print $2}')" = "$expected_rust"
test "$(cargo deny --version | awk '{print $2}')" = "$expected_deny"
test "$(cargo audit --version | awk '{print $2}')" = "$expected_audit"
test "$(cargo sbom --version | awk '{print $2}')" = "$expected_sbom"

test "$(cargo search cargo-deny --limit 1 | sed -n 's/^cargo-deny = "\([^"]*\)".*/\1/p')" = "$expected_deny"
test "$(cargo search cargo-audit --limit 1 | sed -n 's/^cargo-audit = "\([^"]*\)".*/\1/p')" = "$expected_audit"
test "$(cargo search cargo-sbom --limit 1 | sed -n 's/^cargo-sbom = "\([^"]*\)".*/\1/p')" = "$expected_sbom"

checkout="$(git ls-remote https://github.com/actions/checkout.git refs/tags/v7.0.1 | awk '{print $1}')"
test "$checkout" = "$expected_checkout"

rustup check | rg -q "stable.*$expected_rust|$expected_rust.*up to date"

