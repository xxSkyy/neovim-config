require('neo-tree').setup({
  close_if_last_window = true,
  enable_diagnostics = false,
  source_selector = {
    winbar = true,
    content_layout = "center",
    sources = {
      {
        source = 'filesystem',
        display_name = neovim.get_icon "FolderClosed" .. " File",
      },
      {
        source = 'buffers',
        display_name = neovim.get_icon "DefaultFile" .. " Bufs",
      },
      {
        source = 'git_status',
        display_name = neovim.get_icon "Git" .. " Git",
      },
      {
        source = 'diagnostics',
        display_name = neovim.get_icon "Diagnostic" .. " Diagnostic",
      }
    },
  },
  default_component_configs = {
    indent = { padding = 0 },
    icon = {
      folder_closed = neovim.get_icon "FolderClosed",
      folder_open = neovim.get_icon "FolderOpen",
      folder_empty = neovim.get_icon "FolderEmpty",
      default = neovim.get_icon "DefaultFile",
    },
    git_status = {
      symbols = {
        added = neovim.get_icon "GitAdd",
        deleted = neovim.get_icon "GitDelete",
        modified = neovim.get_icon "GitChange",
        renamed = neovim.get_icon "GitRenamed",
        untracked = neovim.get_icon "GitUntracked",
        ignored = neovim.get_icon "GitIgnored",
        unstaged = neovim.get_icon "GitUnstaged",
        staged = neovim.get_icon "GitStaged",
        conflict = neovim.get_icon "GitConflict",
      },
    },
  },
  window = {
    width = 30,
    mappings = {
      ["<space>"] = false, -- disable space until we figure out which-key disabling
      ["<tab>"] = "open",
      H = "prev_source",
      L = "next_source",
    },
  },
  filesystem = {
    commands = {
      copy_file_name = function(state)
        local node = state.tree:get_node()
        print(node.name)
        vim.fn.setreg('+', node.name)
      end
    },
    follow_current_file = true,
    hijack_netrw_behavior = "open_current",
    use_libuv_file_watcher = true,
    window = {
      mappings = {
        h = "toggle_hidden",
        ["Y"] = function(state)
          local node = state.tree:get_node()
          vim.fn.setreg('+', node.name)
        end,
        ["<C-y>"] = function(state)
          local node = state.tree:get_node()
          local full_path = node.path
          local relative_path = full_path:sub(#state.path + 2)
          vim.fn.setreg('+', relative_path)
        end,
      }
    },
  },
  event_handlers = {
    { event = "neo_tree_buffer_enter", handler = function(_) vim.opt_local.signcolumn = "auto" end },
  },
})
