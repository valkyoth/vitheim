#!/usr/bin/env sh
set -eu

cargo fmt --all -- --check
cargo check --workspace --all-targets --all-features --locked
cargo test --workspace --all-features --locked
cargo clippy --workspace --all-targets --all-features --locked -- \
    -D warnings \
    -D clippy::pedantic
cargo doc --workspace --all-features --no-deps --locked

scripts/check_workspace_policy.sh
scripts/check_doc_links.sh
scripts/check_implementation_plan.sh
cargo deny check
cargo audit
