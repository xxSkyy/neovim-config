require 'lspconfig'.tsserver.setup {
  on_attach = require("lsp-format").on_attach,
  root_dir = require 'lspconfig'.util.root_pattern("package.json")
}
