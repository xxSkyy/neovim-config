--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('plug')      -- Plugins

-- THEME
require('kanagawa').setup({
  transparent = true
})
vim.cmd([[colorscheme kanagawa]])
-- 

-- Nvim Lsp Object
require("lsp-format").setup {}
require "lspconfig".gopls.setup { on_attach = require "lsp-format".on_attach }
local nvim_lsp = require'lspconfig'


-- Nvim Tree Navigation
require('nvim-tree').setup{}

-- Nice bottom line
require('lualine').setup {
  options = {
    theme = 'kanagawa'
  }
}

-- Volar - Vue devtools
require'lspconfig'.volar.setup{
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}

-- Autocompletion
require'cmp'.setup {
 sources = {
-- 	{ name = 'cmp_tabnine' },
 },
}

---- RUST
-- Rust Crates version helper
require('crates').setup()
-- Rust analyzer 
nvim_lsp.rust_analyzer.setup({
    capabilities=capabilities,
    -- on_attach is a callback called when the language server attachs to the buffer
    -- on_attach = on_attach,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy diagnostics on save
        checkOnSave = {
          command = "clippy"
        },
      }
    }
})
---------

-- Deno tools
nvim_lsp.denols.setup{}

-- Prettier
require("null-ls").setup{}

require("prettier").setup({
  bin = 'prettier', -- or `prettierd`
--  filetypes = {
--    "css",
--    "graphql",
--    "html",
--    "javascript",
--    "javascriptreact",
--    "json",
--    "less",
--    "markdown",
--    "scss",
--    "typescript",
--    "typescriptreact",
--    "yaml",
--    "vue",
--    "rs",
--    "rust",
--    "lua"
--  },

  -- prettier format options (you can use config files too. ex: `.prettierrc`)
  arrow_parens = "always",
  bracket_spacing = true,
  embedded_language_formatting = "auto",
  end_of_line = "lf",
  html_whitespace_sensitivity = "css",
  jsx_bracket_same_line = false,
  jsx_single_quote = false,
  print_width = 60,
  prose_wrap = "preserve",
  quote_props = "as-needed",
  semi = false,
  single_quote = false,
  tab_width = 2,
  trailing_comma = "es5",
  use_tabs = false,
  vue_indent_script_and_style = false,
})
