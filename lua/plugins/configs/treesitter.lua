require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "rust",
    "toml",
    "json",
    "yaml",
    "css",
    "html",
    "typescript",
    "lua",
    "dockerfile",
    "sql"
  },
  endwise = {
    enable = true,
  },
  autotag = {
    enable = true,
    filetypes = {
      'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
      'xml',
      'php',
      'markdown',
      'glimmer', 'handlebars', 'hbs', 'rust'
    }
  },
}
