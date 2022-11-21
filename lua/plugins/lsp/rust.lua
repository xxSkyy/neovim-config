-- crates version helper
require('crates').setup()

-- rust analuzer
local server = {
  on_attach = require("lsp-format").on_attach,
  capabilities = Capabilities,
  settings = {
    -- to enable rust-analyzer settings visit:
    -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
    ["rust-analyzer"] = {
      completion = {
        addcallargumentsnippets = false,
        postfix = {
          enable = false
        }
      },
      -- enable clippy diagnostics on save
      checkonsave = {
        command = "clippy"
      },
    }
  }
}

local rt = require("rust-tools")
rt.setup({
  server = server,
  tools = {
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      show_parameter_hints = true,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  }
})
