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

  -- Inlay hints
  use { "simrat39/inlay-hints.nvim",
    config = function()
      neovim.require('inlay-hints')
    end
  }

  -- Surround edits
  use({
    "kylechui/nvim-surround",
    tag = "*",
    config = function()
      neovim.require('nvim-surround')
    end
  })

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
      neovim.require('Comment', {}, true)
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

  -- Sort lines
  use "sQVe/sort.nvim"

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

  -- Code action menu
  use {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  }

  -- Better UI
  use { 'stevearc/dressing.nvim',
    config = function()
      neovim.require('dressing')
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
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }

  -- tabs
  use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
  -- Close current buffer
  use { 'kazhala/close-buffers.nvim',
    config = function()
      neovim.require(
        "close_buffers",
        {
          preserve_window_layout = { 'this' },
          next_buffer_cmd = function(windows)
            require('bufferline').cycle(1)
            local bufnr = vim.api.nvim_get_current_buf()

            for _, window in ipairs(windows) do
              vim.api.nvim_win_set_buf(window, bufnr)
            end
          end,
        }
      )
    end }


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
  -- use {
  --   'phaazon/hop.nvim',
  --   branch = 'v2', -- optional but strongly recommended
  --   config = function()
  --     neovim.require('hop')
  --   end
  -- }
  use {
    "ggandor/leap.nvim"
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
  use { "RRethy/vim-illuminate",
    config = function()
      if not neovim.is_vscode() then
        require('illuminate').configure({
          modes_denylist = { 'v' }
        })
      end
    end
  }

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
  use { "williamboman/mason.nvim" }

  use { "williamboman/mason-lspconfig.nvim" }

  -- Debug Adapter Protocol
  use 'mfussenegger/nvim-dap'
  use { 'rcarriga/nvim-dap-ui',
    config = function()
      neovim.require('dapui')
    end
  }

  -- Show indentation etc
  use { "lukas-reineke/indent-blankline.nvim",
    config = function()
      neovim.require('indent_blankline', {
        show_end_of_line = true,
      })
    end
  }

  -- Another commenting
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Removed, use lazygit instead
  -- git diffview
  -- use {
  --   'sindrets/diffview.nvim',
  --   requires = 'nvim-lua/plenary.nvim',
  -- }

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

  -- Package json helper
  use({
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
    config = function()
      neovim.require('package-info')
    end
  })

  -- SQL LSP
  use 'nanotee/sqls.nvim'

  -- Database
  use {
    "tpope/vim-dadbod",
    opt = true,
    requires = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    config = function()
      vim.g.db_ui_save_location = vim.fn.stdpath "config" .. require("plenary.path").path.sep .. "db_ui"

      -- vim.api.nvim_create_autocmd("FileType", {
      --   pattern = {
      --     "sql",
      --   },
      --   command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
      -- })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "sql",
          "mysql",
          "plsql",
        },
      })
    end,
    cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
  }
end)
