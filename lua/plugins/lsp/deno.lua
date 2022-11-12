require 'lspconfig'.denols.setup {
  on_attach = require("lsp-format").on_attach,
  root_dir = require 'lspconfig'.util.root_pattern("deno.json", "import_map.json"),
}
