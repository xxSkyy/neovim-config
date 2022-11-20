-- crates version helper
require('crates').setup()

-- rust analuzer
require 'lspconfig'.rust_analyzer.setup({
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
})
