#![no_std]
#![doc = include_str!("../README.md")]

//! Vitheim's private facade exposes only dependency-free deterministic
//! foundation crates at the initial repository stage.

pub use vitheim_budget as budget;
pub use vitheim_error as error;
pub use vitheim_id as id;
pub use vitheim_time as time;

/// The repository stage represented by this facade release.
pub const REPOSITORY_STAGE: &str = "security-baseline";

#[cfg(test)]
mod tests {
    use super::REPOSITORY_STAGE;

    #[test]
    fn stage_is_explicit() {
        assert_eq!(REPOSITORY_STAGE, "security-baseline");
    }
}
