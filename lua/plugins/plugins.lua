-- Packer file
require("plugins/packer")

-- Color scheme
require('kanagawa').setup({
  transparent = true
})
vim.cmd([[colorscheme kanagawa]])

-- If Nvim is not running under VSCode  enable those extensions
if vim.g.vscode == nil then
  -- Jumping over code
  require'hop'.setup{}

  -- Nvim Tree Navigation
  require('nvim-tree').setup{}

  -- Nice bottom line
  require('lualine').setup {
    options = {
      theme = 'kanagawa'
    }
  }

  -- Autocompletion
  local cmp = require'cmp'

  if not cmp then return end

  cmp.setup {
    sources = {
      {name = 'crates'},
      {name = 'rust-analyzer'},
      {name = 'nvim_lsp'},
      {name = 'buffer'},
      {name = 'path'},
      {name = "luasnip"},
    },
    mapping = {
      ['<Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
      ['<S-Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end,
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({ select = true })
    },
    snippet = {
        expand = function(args)
            local luasnip = require("luasnip")
            if not luasnip then
                return
            end
            luasnip.lsp_expand(args.body)
        end,
    },
  }


  -- Prettier
  require("prettier").setup({
    bin = 'prettier', -- or `prettierd`
    -- filetypes = {
    --   "css",
    --   "graphql",
    --   "html",
    --   "javascript",
    --   "javascriptreact",
    --   "json",
    --   "less",
    --   "markdown",
    --   "scss",
    --   "typescript",
    --   "typescriptreact",
    --   "yaml",
    --   "vue",
    --   "rs",
    --   "rust",
    --   "lua"
    -- },

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

  -- require("mason").setup()
  -- require("mason-lspconfig").setup()
  --

  -- Lsp configs only pure nvim
  require("plugins/lsp/lua")
  require("plugins/lsp/deno")
  require("plugins/lsp/godot")
  require("plugins/lsp/rust")
  require("plugins/lsp/typescript")
  require("plugins/lsp/vue")
  require("plugins/lsp/tailwind")
end
