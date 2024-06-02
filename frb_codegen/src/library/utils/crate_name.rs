use crate::utils::namespace::Namespace;
use serde::{Deserialize, Serialize};

/// e.g. `web-audio-api` (note the `-` instead of `_`)
#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq, Hash)]
#[serde(transparent)]
pub(crate) struct CrateName(String);

impl CrateName {
    pub(crate) const SELF_CRATE: &'static str = "crate";

    pub fn self_crate() -> CrateName {
        CrateName::new(Self::SELF_CRATE.to_owned())
    }

    pub const fn new(raw: String) -> Self {
        Self(raw)
    }

    pub(crate) fn namespace(&self) -> Namespace {
        Namespace::new_raw(self.0.replace('-', "_"))
    }

    pub(crate) fn raw(&self) -> &str {
        &self.0
    }
}