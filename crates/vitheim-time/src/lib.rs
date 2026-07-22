#![no_std]
#![doc = include_str!("../README.md")]

/// Milliseconds since the Unix epoch, supplied by a trusted host boundary.
#[derive(Clone, Copy, Debug, Eq, Ord, PartialEq, PartialOrd)]
#[repr(transparent)]
pub struct UnixMillis(i64);

impl UnixMillis {
    /// Creates a timestamp without consulting an ambient clock.
    #[must_use]
    pub const fn new(value: i64) -> Self {
        Self(value)
    }

    /// Returns the signed millisecond value.
    #[must_use]
    pub const fn get(self) -> i64 {
        self.0
    }
}

#[cfg(test)]
mod tests {
    use super::UnixMillis;

    #[test]
    fn timestamps_preserve_host_supplied_values() {
        assert_eq!(UnixMillis::new(-1).get(), -1);
        assert_eq!(UnixMillis::new(i64::MAX).get(), i64::MAX);
    }
}
