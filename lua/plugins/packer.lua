--- Put in this file all plugins
require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Completion && Lsp
  use {
    "hrsh7th/nvim-cmp",
    config = function() require('config.cmp') end
  }

  use "hrsh7th/cmp-nvim-lsp"
  use "saadparwaiz1/cmp_luasnip"

  use 'neovim/nvim-lspconfig'
  use "lukas-reineke/lsp-format.nvim"
  use "hrsh7th/cmp-path"

  -- Snippets engine
  use {
    "L3MON4D3/LuaSnip",
    tag = "v<CurrentMajor>.*",
    after = "nvim-cmp",
    config = function() require('config.snippets') end
  }

  -- filesystem navigation & icons
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- [[ Theme ]]
  -- start screen
  use { 'mhinz/vim-startify' }

  -- cursor jump
  use { 'DanilaMihailov/beacon.nvim' }

  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons',
    opt = true}
  }

  -- tabs
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- colorscheme
  use 'Mofiqul/vscode.nvim'
  use "rebelot/kanagawa.nvim"

  -- multi cursor
  use "mg979/vim-visual-multi"
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup { }
    end
  }

  -- commenting out code
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- formatter
  use "MunifTanjim/prettier.nvim"

  -- jumping over words
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      -- require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  use "folke/lua-dev.nvim"
  use 'nvim-treesitter/nvim-treesitter'

  -- Treesitter autoclose and autorename html tags
  use {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  }

  -- Rust
  use {
    'saecki/crates.nvim',
    tag = 'v0.2.1',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
  }

  -- Godot
  use "habamax/vim-godot"

  -- Practice vim
  use "ThePrimeagen/vim-be-good"

  -- Multiple terminals, floating etc
  use {
    "akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
    end
  }

  -- Shows git decorations
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }


  -- Show matching words
  use "RRethy/vim-illuminate"

  -- TODO: REMOVE LATER
  -- Key helper
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- Auto pairs plugin
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- UI Installer
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"


  -- Debug Adapter Protocol
  use 'mfussenegger/nvim-dap'

  -- Show indentation etc
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      -- vim.opt.list = true
      -- vim.opt.listchars:append "eol:↴"
      require("indent_blankline").setup {
        show_end_of_line = true,
      }
    end
  }

  -- another commenting
  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require'nvim-treesitter.configs'.setup {
        context_commentstring = {
          enable = true
        }
      }
    end
  }



end)
