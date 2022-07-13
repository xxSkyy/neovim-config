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

-- Nvim Lsp Object
require "lspconfig".gopls.setup { on_attach = require "lsp-format".on_attach }
local nvim_lsp = require'lspconfig'

-- Nvim Cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- If Nvim is not running under VSCode  enable those extensions
if vim.g.vscode == nil then
-- Nvim Tree Navigation
require('nvim-tree').setup{}

-- Nice bottom line
require('lualine').setup {
  options = {
    theme = 'kanagawa'
  }
}

-- Typescript server
nvim_lsp.tsserver.setup{
  root_dir = nvim_lsp.util.root_pattern("package.json")
}

-- Volar - Vue devtools
require'lspconfig'.volar.setup{
  capabilities = capabilities,
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json', 'tsx'}
}

-- Autocompletion
local cmp = require'cmp'
cmp.setup {
 sources = {
   {name = 'crates'},
   {name = 'nvim_lsp'}
-- 	{ name = 'cmp_tabnine' },
 },
     mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
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
nvim_lsp.denols.setup{
  capabilities = capabilities,
  root_dir = nvim_lsp.util.root_pattern("deno.json"),
}

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
end






