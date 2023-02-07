require 'lspconfig'.tailwindcss.setup {
  capabilities = neovim.capabilities,
  filetypes = {
    "css",
    "scss",
    "sass",
    "postcss",
    "html",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "svelte",
    "vue",
    "rust",
  },
  -- experimental = {
  --   classRegex = {
  --     [[class="([^"]*)]],
  --     '~H""".*class="([^"]*)".*"""',
  --   },
  -- },
  init_options = {
    userLanguages = {
      rust = "html",
    },
  },
  root_dir = require 'lspconfig'.util.root_pattern('tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js',
    'postcss.config.ts', 'windi.config.ts'),
}
