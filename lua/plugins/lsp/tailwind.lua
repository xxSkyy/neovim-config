require'lspconfig'.tailwindcss.setup {
  root_dir = require'lspconfig'.util.root_pattern("tailwind.config.js", "windi.config.ts"),
}
