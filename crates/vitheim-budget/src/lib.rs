#![no_std]
#![doc = include_str!("../README.md")]

/// An explicit non-zero upper bound for attacker-controlled work.
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
#[repr(transparent)]
pub struct Limit(u64);

impl Limit {
    /// Constructs a limit, rejecting an accidentally unbounded zero value.
    #[must_use]
    pub const fn new(value: u64) -> Option<Self> {
        if value == 0 { None } else { Some(Self(value)) }
    }

    /// Returns the configured upper bound.
    #[must_use]
    pub const fn get(self) -> u64 {
        self.0
    }

    /// Checks whether a measured value is within this limit.
    #[must_use]
    pub const fn allows(self, measured: u64) -> bool {
        measured <= self.0
    }
}

#[cfg(test)]
mod tests {
    use super::Limit;

    #[test]
    fn zero_is_rejected() {
        assert_eq!(Limit::new(0), None);
    }

    #[test]
    fn boundary_is_inclusive() {
        let limit = Limit(4);
        assert!(limit.allows(4));
        assert!(!limit.allows(5));
    }
}
