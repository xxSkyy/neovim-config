require('neo-tree').setup({
  close_if_last_window = true,
  enable_diagnostics = false,
  source_selector = {
    winbar = true,
    content_layout = "center",
    tab_labels = {
      filesystem = neovim.get_icon "FolderClosed" .. " File",
      buffers = neovim.get_icon "DefaultFile" .. " Bufs",
      git_status = neovim.get_icon "Git" .. " Git",
      diagnostics = neovim.get_icon "Diagnostic" .. " Diagnostic",
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
    follow_current_file = true,
    hijack_netrw_behavior = "open_current",
    use_libuv_file_watcher = true,
    window = { mappings = { h = "toggle_hidden" } },
  },
  event_handlers = {
    { event = "neo_tree_buffer_enter", handler = function(_) vim.opt_local.signcolumn = "auto" end },
  },
})
