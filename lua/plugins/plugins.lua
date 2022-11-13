-- Packer file
require("plugins/packer")
local Shade = require("nightfox.lib.shade")

require('nightfox').setup({
  palettes = {
    duskfox = {
      black   = Shade.new("#393552", "#47407d", "#322e42"),
      red     = Shade.new("#eb6f92", "#f083a2", "#d84f76"),
      green   = Shade.new("#a3be8c", "#b1d196", "#8aa872"),
      yellow  = Shade.new("#dbc074", 0.15, -0.15),
      blue    = Shade.new("#569fba", "#65b1cd", "#4a869c"),
      -- magenta = Shade.new("#c4a7e7", "#ccb1ed", "#a580d2"),
      magenta = Shade.new("#9d79d6", 0.15, -0.15),
      cyan    = Shade.new("#9ccfd8", "#a6dae3", "#7bb8c1"),
      white   = Shade.new("#dddddf", 0.15, -0.15),
      orange  = Shade.new("#ea9a97", "#f0a4a2", "#d6746f"),
      pink    = Shade.new("#eb98c3", "#f0a6cc", "#d871a6"),

      comment = "#817c9c",

      bg0 = "#171616", -- Dark bg (status line and float)
      bg1 = "#161615", -- Default bg
      bg2 = "#30302F", -- Lighter bg (colorcolm folds)
      bg3 = "#30302F", -- Lighter bg (cursor line)
      bg4 = "#4b4673", -- Conceal, border fg

      fg0 = "#d6d6d7", -- Lighter fg
      fg1 = "#cdcecf", -- Default fg
      fg2 = "#aeafb0", -- Darker fg (status line)
      fg3 = "#4b4673", -- Darker fg (line numbers, fold colums)

      sel0 = "#433c59", -- Popup bg, visual selection bg
      sel1 = "#63577d", -- Popup sel bg, search bg
    }
  },
  options = {
    transparent = true,
    styles = {
      comments = "italic",
      keywords = "italic",
      types = "italic,bold",
    }
  }
})
vim.cmd([[colorscheme duskfox]])


-- If Nvim is not running under VSCode enable those extensions
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

  require 'colorizer'.setup {
    filetypes = { "*" },
    user_default_options = {
      tailwind = true,
      virtualtext = "■",
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
  -- require("plugins/lsp/typescript")
  require("plugins/lsp/vue")
  require("plugins/lsp/tailwind")
end
