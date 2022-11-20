-- Packer file
require("plugins/packer")
require("plugins/theme")

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

  require("toggleterm").setup()

  require('crates').setup()

  require("nvim-ts-autotag").setup()

  require 'gitsigns'.setup()

  require("trouble").setup {}

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
    formatting = {
      format = require("lspkind").cmp_format({ with_text = false, maxwidth = 50, mode = 'symbol', ellipsis_char = '...' }),
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentations = cmp.config.window.bordered(),
    }
  }

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
    },
  }


  local diffview_actions = require("diffview.actions")

  require 'diffview'.setup {
    keymaps = {
      disable_defaults = false, -- Disable the default keymaps
      view = {
        -- The `view` bindings are active in the diff buffers, only when the current
        -- tabpage is a Diffview.
        ["<tab>"]      = diffview_actions.select_next_entry, -- Open the diff for the next file
        ["<s-tab>"]    = diffview_actions.select_prev_entry, -- Open the diff for the previous file
        ["gf"]         = diffview_actions.goto_file, -- Open the file in a new split in the previous tabpage
        ["<C-w><C-f>"] = diffview_actions.goto_file_split, -- Open the file in a new split
        ["<C-w>gf"]    = diffview_actions.goto_file_tab, -- Open the file in a new tabpage
        ["<leader>e"]  = diffview_actions.focus_files, -- Bring focus to the file panel
        ["<leader>b"]  = diffview_actions.toggle_files, -- Toggle the file panel.
        ["[x"]         = diffview_actions.prev_conflict, -- In the merge_tool: jump to the previous conflict
        ["]x"]         = diffview_actions.next_conflict, -- In the merge_tool: jump to the next conflict
        ["<leader>co"] = diffview_actions.conflict_choose("ours"), -- Choose the OURS version of a conflict
        ["<leader>ct"] = diffview_actions.conflict_choose("theirs"), -- Choose the THEIRS version of a conflict
        ["<leader>cb"] = diffview_actions.conflict_choose("base"), -- Choose the BASE version of a conflict
        ["<leader>ca"] = diffview_actions.conflict_choose("all"), -- Choose all the versions of a conflict
        ["dx"]         = diffview_actions.conflict_choose("none"), -- Delete the conflict region
      },
      diff1 = { --[[ Mappings in single window diff layouts ]] },
      diff2 = { --[[ Mappings in 2-way diff layouts ]] },
      diff3 = {
        -- Mappings in 3-way diff layouts
        { { "n", "x" }, "2do", diffview_actions.diffget("ours") }, -- Obtain the diff hunk from the OURS version of the file
        { { "n", "x" }, "3do", diffview_actions.diffget("theirs") }, -- Obtain the diff hunk from the THEIRS version of the file
      },
      diff4 = {
        -- Mappings in 4-way diff layouts
        { { "n", "x" }, "1do", diffview_actions.diffget("base") }, -- Obtain the diff hunk from the BASE version of the file
        { { "n", "x" }, "2do", diffview_actions.diffget("ours") }, -- Obtain the diff hunk from the OURS version of the file
        { { "n", "x" }, "3do", diffview_actions.diffget("theirs") }, -- Obtain the diff hunk from the THEIRS version of the file
      },
      file_panel = {
        ["j"]          = diffview_actions.next_entry, -- Bring the cursor to the next file entry
        ["k"]          = diffview_actions.prev_entry, -- Bring the cursor to the previous file entry.
        ["<cr>"]       = diffview_actions.select_entry, -- Open the diff for the selected entry.
        ["-"]          = diffview_actions.toggle_stage_entry, -- Stage / unstage the selected entry.
        ["S"]          = diffview_actions.stage_all, -- Stage all entries.
        ["U"]          = diffview_actions.unstage_all, -- Unstage all entries.
        ["X"]          = diffview_actions.restore_entry, -- Restore entry to the state on the left side.
        ["L"]          = diffview_actions.open_commit_log, -- Open the commit log panel.
        ["<tab>"]      = diffview_actions.select_next_entry,
        ["<s-tab>"]    = diffview_actions.select_prev_entry,
        ["gf"]         = diffview_actions.goto_file,
        ["<C-w><C-f>"] = diffview_actions.goto_file_split,
        ["<C-w>gf"]    = diffview_actions.goto_file_tab,
        ["i"]          = diffview_actions.listing_style, -- Toggle between 'list' and 'tree' views
        ["R"]          = diffview_actions.refresh_files, -- Update stats and entries in the file list.
        ["<leader>e"]  = diffview_actions.focus_files,
        ["<leader>b"]  = diffview_actions.toggle_files,
        ["[x"]         = diffview_actions.prev_conflict,
        ["]x"]         = diffview_actions.next_conflict,
      },
      file_history_panel = {
        ["g!"]            = diffview_actions.options, -- Open the option panel
        ["<C-A-d>"]       = diffview_actions.open_in_diffview, -- Open the entry under the cursor in a diffview
        ["y"]             = diffview_actions.copy_hash, -- Copy the commit hash of the entry under the cursor
        ["L"]             = diffview_actions.open_commit_log,
        ["zR"]            = diffview_actions.open_all_folds,
        ["zM"]            = diffview_actions.close_all_folds,
        ["j"]             = diffview_actions.next_entry,
        ["k"]             = diffview_actions.prev_entry,
        ["<cr>"]          = diffview_actions.select_entry,
        ["o"]             = diffview_actions.select_entry,
        ["<2-LeftMouse>"] = diffview_actions.select_entry,
        ["<c-b>"]         = diffview_actions.scroll_view(-0.25),
        ["<c-f>"]         = diffview_actions.scroll_view(0.25),
        ["<tab>"]         = diffview_actions.select_next_entry,
        ["<s-tab>"]       = diffview_actions.select_prev_entry,
        ["gf"]            = diffview_actions.goto_file,
        ["<C-w><C-f>"]    = diffview_actions.goto_file_split,
        ["<C-w>gf"]       = diffview_actions.goto_file_tab,
        ["<leader>e"]     = diffview_actions.focus_files,
        ["<leader>b"]     = diffview_actions.toggle_files,
      },
      option_panel = {
        ["<tab>"] = diffview_actions.select_entry,
        ["q"]     = diffview_actions.close,
      },
    },
  }

  require("mason").setup()
  require("mason-lspconfig").setup()
  --

  -- Lsp configs
  require("plugins/lsp/lua")
  require("plugins/lsp/deno")
  require("plugins/lsp/godot")
  require("plugins/lsp/rust")
  -- require("plugins/lsp/typescript")
  require("plugins/lsp/tailwind")
  require("plugins/lsp/vue")
end
