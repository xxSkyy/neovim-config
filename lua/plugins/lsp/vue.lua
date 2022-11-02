require'lspconfig'.volar.setup{
  capabilities = Capabilities,
  root_dir = require'lspconfig'.util.root_pattern("package.json"),
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json', 'tsx'}
}
