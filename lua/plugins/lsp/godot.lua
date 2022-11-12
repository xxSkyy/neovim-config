require 'lspconfig'.gdscript.setup {
  on_attach = require("lsp-format").on_attach,
  -- capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
}
