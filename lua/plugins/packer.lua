--- Put in this file all plugins
require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'
  use "lukas-reineke/lsp-format.nvim"

  use "rcarriga/nvim-notify"

  -- Completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path"
  use "saadparwaiz1/cmp_luasnip"
  use "onsails/lspkind.nvim"

  use { 'mrjones2014/smart-splits.nvim',
    config = function()
      neovim.require('smart-splits')
    end
  }

  -- Snippets engine
  use {
    "L3MON4D3/LuaSnip",
    tag = "v1.1.*",
    after = "nvim-cmp",
  }

  -- filesystem navigation & icons
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- Comment out engine
  use { "numToStr/Comment.nvim",
    config = function()
      neovim.require('Comment')
    end
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { "nvim-telescope/telescope-live-grep-args.nvim" }
    }
  }

  -- Window picker
  use {
    's1n7ax/nvim-window-picker',
    tag = 'v1.*',
    config = function()
      neovim.require('window-picker', {
        autoselect_one = true,
        include_current = false,
        filter_rules = {
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { 'neo-tree', "neo-tree-popup", "notify" },

            -- if the buffer type is one of following, the window will be ignored
            buftype = { 'terminal', "quickfix" },
          },
        },
        other_win_hl_color = '#e35e4f',
      })
    end
  }

  use {
    "tiagovla/scope.nvim",
    config = function()
      neovim.require('scope')
    end
  }

  -- Tree
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  -- [[ Theme ]]
  -- start screen
  use { 'mhinz/vim-startify' }

  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons',
      opt = true }
  }

  -- tabs
  use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }


  -- colorscheme
  use "EdenEast/nightfox.nvim"

  -- multi cursor
  use "mg979/vim-visual-multi"
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      neovim.require('trouble')
    end
  }

  -- formatter
  use "MunifTanjim/prettier.nvim"

  -- jumping over words
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      neovim.require('hop')
    end
  }

  use "folke/lua-dev.nvim"
  use { "nvim-treesitter/nvim-treesitter",
    config = function()
      neovim.require("nvim-treesitter.configs", {
        context_commentstring = {
          enable = true
        }
      })
    end

  }


  -- Treesitter autoclose and autorename html tags
  use { "windwp/nvim-ts-autotag",
    config = function()
      neovim.require('nvim-ts-autotag')
    end
  }


  -- Rust
  use {
    'saecki/crates.nvim',
    tag = 'v0.2.1',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      neovim.require('crates')
    end

  }
  use 'simrat39/rust-tools.nvim'

  -- Godot
  use "habamax/vim-godot"

  -- Multiple terminals, floating etc
  use {
    "akinsho/toggleterm.nvim", tag = '*'
  }

  -- Shows git decorations
  use { 'lewis6991/gitsigns.nvim',
    config = function()
      neovim.require('gitsigns')
    end
  }


  -- Colorize hex color
  use 'NvChad/nvim-colorizer.lua'

  -- Show matching words
  use "RRethy/vim-illuminate"

  -- TODO: REMOVE LATER
  -- Key helper
  use { "folke/which-key.nvim",
    config = function()
      neovim.require('which-key')
    end
  }

  -- Auto pairs plugin
  use "windwp/nvim-autopairs"

  -- UI Installer
  use { "williamboman/mason.nvim",
    config = function()
      neovim.require('mason')
    end
  }

  use { "williamboman/mason-lspconfig.nvim",
    config = function()
      neovim.require('mason-lspconfig', {
        ensure_installed = {
          "sumneko_lua", "denols",
          "rust_analyzer", "jsonls", "volar",
          "tsserver", "tailwindcss", "sqlls",
          "graphql", "dockerls", "cssls"
        },
      })
    end
  }

  -- Debug Adapter Protocol
  use 'mfussenegger/nvim-dap'
  use { 'rcarriga/nvim-dap-ui',
    config = function()
      neovim.require('dapui')
    end
  }

  -- Show indentation etc
  use { "lukas-reineke/indent-blankline.nvim",
    neovim.require('indent_blankline', {
      show_end_of_line = true,
    })
  }

  -- Another commenting
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- git diffview
  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  }

  use {
    "jayp0521/mason-null-ls.nvim",

    config = function()
      neovim.require('mason-null-ls')
    end
  }
end)
