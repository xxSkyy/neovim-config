-- Packer file
require("plugins/packer")

require('nightfox').setup({
  options = {
    transparent = true,

    palettes = {
      duskfox = {
        bg1 = "#161615",
        bg0 = "#161615",
        bg3 = "#161615",
        sel0 = "#161615",
      }
    },

    styles = {
      comments = "italic",
      keywords = "italic",
      types = "italic,bold",
    }
  }
})
vim.cmd([[colorscheme duskfox]])



-- If Nvim is not running under VSCode  enable those extensions
if vim.g.vscode == nil then
  -- Jumping over code
  require 'hop'.setup {}

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.diagnostic.config {
    float = {
      border = "rounded",
    }
  }

  -- Nvim Tree Navigation
  require('nvim-tree').setup {
    view = {
      adaptive_size = true,
      mappings = {
        list = {
          { key = "u", action = "dir_up" },
          { key = "<C-e>", action = "" },
        },
      },
    },
  }

  -- Nice bottom line
  require('lualine').setup {
    options = {
      theme = 'horizon'
    }
  }

  -- Autocompletion
  local cmp = require 'cmp'

  if not cmp then return end

  cmp.setup {
    sources = {
      { name = 'crates' },
      { name = 'rust-analyzer' },
      { name = 'nvim_lsp' },
      { kjname = 'buffer' },
      { name = 'path' },
      { name = "luasnip" },
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
        require("luasnip").lsp_expand(args.body)
      end,
    },
    format = require("lspkind").cmp_format({ with_text = false, maxwidth = 50 }),
    window = {
      completion = cmp.config.window.bordered(),
      documentations = cmp.config.window.bordered(),
    }
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
