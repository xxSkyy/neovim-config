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
  autotag = {
    enable = true,
  },
}
