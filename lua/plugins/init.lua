-- Packer file
require("plugins.packer")
require("plugins.theme")

-- If Nvim is not running under VSCode enable those extensions
if vim.g.vscode == nil then
  -- Jumping over code
  require 'hop'.setup {}

  -- Show key combinations hints
  require 'which-key'.setup {}

  require "nvim-autopairs".setup {}

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

  -- Nice bottom line
  require('lualine').setup {
    options = {
      theme = 'horizon'
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
