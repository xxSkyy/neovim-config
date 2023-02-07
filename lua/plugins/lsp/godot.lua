require 'lspconfig'.gdscript.setup {
  on_attach = require("lsp-format").on_attach,
  capabilities = neovim.capabilities,
}
