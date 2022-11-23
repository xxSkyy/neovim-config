-- Packer file
require("plugins.packer")
require("plugins.theme")

-- If Nvim is not running under VSCode enable those extensions
if vim.g.vscode == nil then
  -- Jumping over code
  require 'hop'.setup {}

  -- Show key combinations hints
  require 'which-key'.setup {}

  require "nvim-autopairs".setup {
    fast_wrap = {
      map = '<C-a>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = [=[[%'%"%)%>%]%)%}%,]]=],
      end_key = '$',
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      check_comma = true,
      highlight = 'Search',
      highlight_grey = 'Comment'
    },
  }
  local Rule = require('nvim-autopairs.rule')
  require 'nvim-autopairs'.add_rules {
    Rule('|', '|', 'rust'),
    Rule('<', '>', 'rust')
  }

  require "indent_blankline".setup {
    show_end_of_line = true,
  }

  require 'nvim-treesitter.configs'.setup {
    context_commentstring = {
      enable = true
    }
  }

  require("Comment").setup()

  require('crates').setup()

  require("nvim-ts-autotag").setup()

  require 'gitsigns'.setup()

  require("trouble").setup {}

  require("plugins.configs.dap")
  require("dapui").setup()
  -- Nice bottom line
  --
  local custom_horizon = require 'lualine.themes.horizon'
  custom_horizon.normal.c.bg = 'transparent'
  custom_horizon.command.c.bg = 'transparent'
  custom_horizon.inactive.c.bg = 'transparent'
  custom_horizon.insert.c.bg = 'transparent'
  custom_horizon.replace.c.bg = 'transparent'
  custom_horizon.visual.c.bg = 'transparent'
  require('lualine').setup {
    options = {
      theme = custom_horizon,
      globalstatus = true,
    }
  }

  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = {
      "sumneko_lua", "denols",
      "rust_analyzer", "jsonls", "volar",
      "tsserver", "tailwindcss", "sqlls",
      "graphql", "dockerls", "cssls"
    },
  })


  local null_ls = require("null-ls")

  null_ls.setup({
    on_attach = require("lsp-format").on_attach,
    sources = {
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.rustfmt,
      null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.completion.luasnip,
      -- null_ls.builtins.completion.spell,
    },
  })

  require("mason-null-ls").setup()

  require('smart-splits').setup {}


  require("plugins.configs.neo-tree")
  require("plugins.configs.cmp")
  require("plugins.configs.colorizer")
  require("plugins.configs.treesitter")
  require("plugins.configs.diffview")
  require("plugins.configs.bufferline")
  require("plugins.configs.telescope")
  require("plugins.configs.toggleterm")
  --

  -- Lsp configs only pure nvim
  require("plugins/lsp/tailwind")
  require("plugins/lsp/lua")
  require("plugins/lsp/deno")
  require("plugins/lsp/godot")
  require("plugins/lsp/rust")
  require("plugins/lsp/typescript")
  require("plugins/lsp/vue")
end
