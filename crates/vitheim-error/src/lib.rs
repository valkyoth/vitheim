#![no_std]
#![doc = include_str!("../README.md")]

/// Stable top-level error categories that do not expose sensitive details.
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
#[non_exhaustive]
pub enum ErrorCategory {
    /// The caller supplied structurally invalid input.
    InvalidInput,
    /// A bounded resource budget was exhausted.
    ResourceLimit,
    /// A security or authorization policy rejected the operation.
    PolicyDenied,
    /// A state transition was invalid for the current aggregate state.
    InvalidState,
    /// The requested operation is deliberately unavailable.
    Unsupported,
}

impl ErrorCategory {
    /// Returns a stable, non-sensitive machine code.
    #[must_use]
    pub const fn code(self) -> &'static str {
        match self {
            Self::InvalidInput => "VITHEIM_INVALID_INPUT",
            Self::ResourceLimit => "VITHEIM_RESOURCE_LIMIT",
            Self::PolicyDenied => "VITHEIM_POLICY_DENIED",
            Self::InvalidState => "VITHEIM_INVALID_STATE",
            Self::Unsupported => "VITHEIM_UNSUPPORTED",
        }
    }
}

#[cfg(test)]
mod tests {
    use super::ErrorCategory;

    #[test]
    fn codes_are_stable_and_namespaced() {
        let categories = [
            ErrorCategory::InvalidInput,
            ErrorCategory::ResourceLimit,
            ErrorCategory::PolicyDenied,
            ErrorCategory::InvalidState,
            ErrorCategory::Unsupported,
        ];
        for category in categories {
            assert!(category.code().starts_with("VITHEIM_"));
        }
    }
}
