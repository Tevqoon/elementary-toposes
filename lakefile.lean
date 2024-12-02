import Lake
open Lake DSL

package "elementary-toposes" where
  version := v!"0.1.0"
  keywords := #["math"]
  leanOptions := #[
  ⟨`pp.unicode.fun, true⟩, -- pretty-prints `fun a ↦ b`
  ⟨`autoImplicit, false⟩,
  ⟨`diagnostics, true⟩
]

require "leanprover-community" / "mathlib"

@[default_target]
lean_lib «ElementaryToposes» where
  -- add any library configuration options here

require checkdecls from git "https://github.com/PatrickMassot/checkdecls.git"

meta if get_config? env = some "dev" then
require «doc-gen4» from git
  "https://github.com/leanprover/doc-gen4" @ "main"
