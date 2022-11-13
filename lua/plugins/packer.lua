--- Put in this file all plugins
require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'
  use "lukas-reineke/lsp-format.nvim"

  -- Completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path"
  use "saadparwaiz1/cmp_luasnip"
  use "onsails/lspkind.nvim"

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

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
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
  use {
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- colorscheme
  use "EdenEast/nightfox.nvim"

  -- multi cursor
  use "mg979/vim-visual-multi"
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
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

  -- Colorize hex color
  use 'norcalli/nvim-colorizer.lua'

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
      require 'nvim-treesitter.configs'.setup {
        context_commentstring = {
          enable = true
        }
      }
    end
  }

  -- git diffview
  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      local actions = require("diffview.actions")

      require 'diffview'.setup {
        keymaps = {
          disable_defaults = false, -- Disable the default keymaps
          view = {
            -- The `view` bindings are active in the diff buffers, only when the current
            -- tabpage is a Diffview.
            ["<tab>"]      = actions.select_next_entry, -- Open the diff for the next file
            ["<s-tab>"]    = actions.select_prev_entry, -- Open the diff for the previous file
            ["gf"]         = actions.goto_file, -- Open the file in a new split in the previous tabpage
            ["<C-w><C-f>"] = actions.goto_file_split, -- Open the file in a new split
            ["<C-w>gf"]    = actions.goto_file_tab, -- Open the file in a new tabpage
            ["<leader>e"]  = actions.focus_files, -- Bring focus to the file panel
            ["<leader>b"]  = actions.toggle_files, -- Toggle the file panel.
            ["[x"]         = actions.prev_conflict, -- In the merge_tool: jump to the previous conflict
            ["]x"]         = actions.next_conflict, -- In the merge_tool: jump to the next conflict
            ["<leader>co"] = actions.conflict_choose("ours"), -- Choose the OURS version of a conflict
            ["<leader>ct"] = actions.conflict_choose("theirs"), -- Choose the THEIRS version of a conflict
            ["<leader>cb"] = actions.conflict_choose("base"), -- Choose the BASE version of a conflict
            ["<leader>ca"] = actions.conflict_choose("all"), -- Choose all the versions of a conflict
            ["dx"]         = actions.conflict_choose("none"), -- Delete the conflict region
          },
          diff1 = { --[[ Mappings in single window diff layouts ]] },
          diff2 = { --[[ Mappings in 2-way diff layouts ]] },
          diff3 = {
            -- Mappings in 3-way diff layouts
            { { "n", "x" }, "2do", actions.diffget("ours") }, -- Obtain the diff hunk from the OURS version of the file
            { { "n", "x" }, "3do", actions.diffget("theirs") }, -- Obtain the diff hunk from the THEIRS version of the file
          },
          diff4 = {
            -- Mappings in 4-way diff layouts
            { { "n", "x" }, "1do", actions.diffget("base") }, -- Obtain the diff hunk from the BASE version of the file
            { { "n", "x" }, "2do", actions.diffget("ours") }, -- Obtain the diff hunk from the OURS version of the file
            { { "n", "x" }, "3do", actions.diffget("theirs") }, -- Obtain the diff hunk from the THEIRS version of the file
          },
          file_panel = {
            ["j"]          = actions.next_entry, -- Bring the cursor to the next file entry
            ["k"]          = actions.prev_entry, -- Bring the cursor to the previous file entry.
            ["<cr>"]       = actions.select_entry, -- Open the diff for the selected entry.
            ["-"]          = actions.toggle_stage_entry, -- Stage / unstage the selected entry.
            ["S"]          = actions.stage_all, -- Stage all entries.
            ["U"]          = actions.unstage_all, -- Unstage all entries.
            ["X"]          = actions.restore_entry, -- Restore entry to the state on the left side.
            ["L"]          = actions.open_commit_log, -- Open the commit log panel.
            ["<tab>"]      = actions.select_next_entry,
            ["<s-tab>"]    = actions.select_prev_entry,
            ["gf"]         = actions.goto_file,
            ["<C-w><C-f>"] = actions.goto_file_split,
            ["<C-w>gf"]    = actions.goto_file_tab,
            ["i"]          = actions.listing_style, -- Toggle between 'list' and 'tree' views
            ["R"]          = actions.refresh_files, -- Update stats and entries in the file list.
            ["<leader>e"]  = actions.focus_files,
            ["<leader>b"]  = actions.toggle_files,
            ["[x"]         = actions.prev_conflict,
            ["]x"]         = actions.next_conflict,
          },
          file_history_panel = {
            ["g!"]            = actions.options, -- Open the option panel
            ["<C-A-d>"]       = actions.open_in_diffview, -- Open the entry under the cursor in a diffview
            ["y"]             = actions.copy_hash, -- Copy the commit hash of the entry under the cursor
            ["L"]             = actions.open_commit_log,
            ["zR"]            = actions.open_all_folds,
            ["zM"]            = actions.close_all_folds,
            ["j"]             = actions.next_entry,
            ["k"]             = actions.prev_entry,
            ["<cr>"]          = actions.select_entry,
            ["o"]             = actions.select_entry,
            ["<2-LeftMouse>"] = actions.select_entry,
            ["<c-b>"]         = actions.scroll_view(-0.25),
            ["<c-f>"]         = actions.scroll_view(0.25),
            ["<tab>"]         = actions.select_next_entry,
            ["<s-tab>"]       = actions.select_prev_entry,
            ["gf"]            = actions.goto_file,
            ["<C-w><C-f>"]    = actions.goto_file_split,
            ["<C-w>gf"]       = actions.goto_file_tab,
            ["<leader>e"]     = actions.focus_files,
            ["<leader>b"]     = actions.toggle_files,
          },
          option_panel = {
            ["<tab>"] = actions.select_entry,
            ["q"]     = actions.close,
          },
        },
      }
    end
  }


end)
