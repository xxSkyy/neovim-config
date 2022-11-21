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

  use 'mrjones2014/smart-splits.nvim'

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
  use "numToStr/Comment.nvim"

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { "nvim-telescope/telescope-live-grep-args.nvim" }
    }
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
  }

  -- formatter
  use "MunifTanjim/prettier.nvim"

  -- jumping over words
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
  }

  use "folke/lua-dev.nvim"
  use 'nvim-treesitter/nvim-treesitter'


  -- Treesitter autoclose and autorename html tags
  use "windwp/nvim-ts-autotag"


  -- Rust
  use {
    'saecki/crates.nvim',
    tag = 'v0.2.1',
    requires = { 'nvim-lua/plenary.nvim' },
  }
  use 'simrat39/rust-tools.nvim'

  -- Godot
  use "habamax/vim-godot"

  -- Multiple terminals, floating etc
  use {
    "akinsho/toggleterm.nvim", tag = '*'
  }

  -- Shows git decorations
  use 'lewis6991/gitsigns.nvim'

  -- Colorize hex color
  use 'NvChad/nvim-colorizer.lua'

  -- Show matching words
  use "RRethy/vim-illuminate"

  -- TODO: REMOVE LATER
  -- Key helper
  use "folke/which-key.nvim"

  -- Auto pairs plugin
  use "windwp/nvim-autopairs"

  -- UI Installer
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"


  -- Debug Adapter Protocol
  use 'mfussenegger/nvim-dap'

  -- Show indentation etc
  use "lukas-reineke/indent-blankline.nvim"

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
  }
end)
