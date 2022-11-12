require 'lspconfig'.tailwindcss.setup {
  on_attach = require("lsp-format").on_attach,
  root_dir = require 'lspconfig'.util.root_pattern("tailwind.config.js", "windi.config.ts"),
}
