-- crates version helper
require('crates').setup()

-- rust analuzer
require'lspconfig'.rust_analyzer.setup({
    capabilities=Capabilities,
    -- on_attach is a callback called when the language server attachs to the buffer
    -- on_attach = on_attach,
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
