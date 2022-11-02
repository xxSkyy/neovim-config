require'lspconfig'.denols.setup{
  capabilities = Capabilities,
  root_dir = require'lspconfig'.util.root_pattern("deno.json", "import_map.json"),
}

