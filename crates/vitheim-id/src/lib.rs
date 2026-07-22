#![no_std]
#![doc = include_str!("../README.md")]

/// Fixed-width opaque identifier storage.
#[derive(Clone, Copy, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[repr(transparent)]
pub struct RawId([u8; 16]);

impl RawId {
    /// Creates an identifier from its canonical bytes.
    #[must_use]
    pub const fn from_bytes(bytes: [u8; 16]) -> Self {
        Self(bytes)
    }

    /// Returns the canonical identifier bytes.
    #[must_use]
    pub const fn into_bytes(self) -> [u8; 16] {
        self.0
    }

    /// Reports whether every identifier byte is zero.
    #[must_use]
    pub const fn is_zero(self) -> bool {
        let mut index = 0;
        while index < self.0.len() {
            if self.0[index] != 0 {
                return false;
            }
            index += 1;
        }
        true
    }
}

#[cfg(test)]
mod tests {
    use super::RawId;

    #[test]
    fn bytes_round_trip() {
        let bytes = [7; 16];
        assert_eq!(RawId::from_bytes(bytes).into_bytes(), bytes);
    }

    #[test]
    fn zero_is_detected_without_allocation() {
        assert!(RawId::from_bytes([0; 16]).is_zero());
        assert!(!RawId::from_bytes([0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0]).is_zero());
    }
}
