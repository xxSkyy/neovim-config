--[[ keys.lua ]]
local is_available = neovim.is_available

local maps = { i = {}, n = {}, v = {}, t = {},[""] = {} }

maps[""]["<Space>"] = "<Nop>"

maps.i = {
  ['jk'] = { '' },
  ['<S-Tab>'] = { '<C-d>' }
}

maps.n = {
  -- Disable arrows
  ['<Up>'] = { '<Nop>' },
  ['<Down>'] = { '<Nop>' },
  ['<Left>'] = { '<Nop>' },
  ['<Right>'] = { '<Nop>' },
  ['<C-d>'] = { "<C-d>zz" },
  ['<C-u>'] = { "<C-u>zz" },
  ['n'] = { "nzzzv" },
  ['N'] = { "Nzzzv" },
}

-- Pasting yanked not deleted n' yanked value
maps.n[',p'] = { '"0p' }
maps.n[',P'] = { '"0P' }
maps.v['<leader>p'] = { '"_dP', desc = "Paste on selection without yank" }

-- Remove useless whitespaces from end of lines
-- map('n', '<F5>', [[:%s/\s\+$//e<CR>]], {})

-- If it's not under VSCode add those mappings
if not neovim.is_vscode() then
  -- Normal --
  -- Standard Operations
  maps.n["<leader>fn"] = { "<cmd>enew<cr>", desc = "New File" }
  -- maps.n["gx"] = { function() neovim.system_open() end, desc = "Open the file under cursor with system app" }
  maps.n["Q"] = "<Nop>"

  -- Packer
  maps.n["<leader>pc"] = { "<cmd>PackerCompile<cr>", desc = "Packer Compile" }
  maps.n["<leader>pi"] = { "<cmd>PackerInstall<cr>", desc = "Packer Install" }
  maps.n["<leader>ps"] = { "<cmd>PackerSync<cr>", desc = "Packer Sync" }
  maps.n["<leader>pS"] = { "<cmd>PackerStatus<cr>", desc = "Packer Status" }
  maps.n["<leader>pu"] = { "<cmd>PackerUpdate<cr>", desc = "Packer Update" }

  -- CodeAction Menu
  maps.n["<leader>a"] = { "<cmd>CodeActionMenu<cr>", desc = "Code action menu" }

  -- Trouble
  maps.n["<leader>xx"] = { "<cmd>TroubleToggle<cr>", desc = "Toggle touble window" }
  maps.n["<leader>xw"] = { "<cmd>Trouble workspace_diagnostics<cr>", desc = "Trouble workspace window" }
  maps.n["<leader>xd"] = { "<cmd>Trouble document_diagnostics<cr>", desc = "Trouble document window" }
  maps.n["<leader>xq"] = { "<cmd>Trouble quickfix<cr>", desc = "Trouble quickfix window" }
  maps.n["<leader>xl"] = { "<cmd>Trouble loclist<cr>", desc = "Trouble loclist window" }
  maps.n["<leader>xr"] = { "<cmd>Trouble lsp_references<cr>", desc = "Trouble lsp reference window" }
  maps.n["<leader>xc"] = { "<cmd>TroubleClose<cr>", desc = "Close trouble window" }

  -- Navigate buffers
  maps.n["<S-l>"] = { "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer tab" }
  maps.n["<S-h>"] = { "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer tab" }
  maps.n[">b"] = { "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer tab right" }
  maps.n["<b"] = { "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer tab left" }

  -- Close current buffer
  maps.n["<leader>cc"] = {
    "<cmd>lua require('close_buffers').delete({type = 'this'})<CR>",
    noremap = true,
    desc = "Close current buffer"
  }
  maps.n["<leader>cr"] = {
    "<cmd>BufferLineCloseRight<CR>",
    noremap = true,
    desc = "Close close all buffers to right"
  }
  maps.n["<leader>cl"] = {
    "<cmd>BufferLineCloseLeft<CR>",
    noremap = true,
    desc = "Close all buffers to left"
  }
  maps.n["<leader>ca"] = {
    "<cmd>BufferLineCloseLeft<CR><cmd>BufferLineCloseRight<CR>",
    noremap = true,
    desc = "Close all buffers but active one"
  }
  maps.n["<leader>cA"] = {
    "<cmd>BufferLineCloseLeft<CR><cmd>BufferLineCloseRight<CR><cmd>lua require('close_buffers').delete({type = 'this'})<CR>",
    noremap = true,
    desc = "Close all buffers with active one"
  }

  -- Dapui
  maps.n["<leader>bo"] = { function() require("dapui").open() end, desc = "DapUI Open" }
  maps.n["<leader>bc"] = { function() require("dapui").close() end, desc = "DapUI Close" }
  maps.n["<leader>bt"] = { function() require("dapui").toggle() end, desc = "DapUI Toggle" }
  maps.n["<leader>be"] = { function() require("dapui").editogglet() end, desc = "DapUI Edit expression" }
  maps.n["<leader>bb"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle breakpoint" }
  maps.n["<leader>bc"] = { "<cmd>lua require'dap'.continue()<cr>", desc = "Continue executing debugger" }
  maps.n["<leader>bs"] = { "<cmd>lua require'dap'.step_over()<cr>", desc = "Step through code" }
  maps.n["<leader>bi"] = { "<cmd>lua require'dap'.repl.open()<cr>", desc = "Inspect state" }
  maps.n["<leader>bl"] = { "<cmd>lua require'dap'.run_last()<cr>", desc = "Run last debug adapter" }

  -- Database
  maps.n["<leader>Du"] = { "<cmd>DBUIToggle<cr>", desc = "Toggle Database UI" }
  maps.n["<leader>Df"] = { "<cmd>DBUIFindBuffer<cr>", desc = "Database Find Buffer" }
  maps.n["<leader>Dr"] = { "<cmd>DBUIRenameBuffer<cr>", desc = "Database Rename Buffer" }
  maps.n["<leader>Dq"] = { "<cmd>DBUILastQueryInfo<cr>", desc = "Database last query info" }

  -- DiffView
  maps.n["<leader>dv"] = { "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" }
  maps.n["<leader>dc"] = { "<cmd>DiffviewClose<cr>", desc = "Diffview Close" }

  -- Package info
  maps.n["<leader>nv"] = {
    function() require("package-info").change_version() end,
    noremap = true,
    desc = "Change package.json version"
  }
  maps.n["<leader>ni"] = {
    function() require("package-info").install() end,
    noremap = true,
    desc = "Install package.json dependency"
  }
  maps.n["<leader>nd"] = {
    function() require("package-info").delete() end,
    silent = true,
    noremap = true,
    desc = "Delete package.json dependency"
  }


  -- GitSigns
  maps.n["<leader>gj"] = { function() require("gitsigns").next_hunk() end, desc = "Next git hunk" }
  maps.n["<leader>gk"] = { function() require("gitsigns").prev_hunk() end, desc = "Previous git hunk" }
  maps.n["<leader>gl"] = { function() require("gitsigns").blame_line() end, desc = "View git blame" }
  maps.n["<leader>gL"] = { function() require("gitsigns").toggle_current_line_blame() end, desc = "View git blame" }
  maps.n["<leader>gp"] = { function() require("gitsigns").preview_hunk() end, desc = "Preview git hunk" }
  maps.n["<leader>gh"] = { function() require("gitsigns").reset_hunk() end, desc = "Reset git hunk" }
  maps.n["<leader>gr"] = { function() require("gitsigns").reset_buffer() end, desc = "Reset git buffer" }
  maps.n["<leader>gs"] = { function() require("gitsigns").stage_hunk() end, desc = "Stage git hunk" }
  maps.n["<leader>gu"] = { function() require("gitsigns").undo_stage_hunk() end, desc = "Unstage git hunk" }
  maps.n["<leader>gd"] = { function() require("gitsigns").diffthis() end, desc = "View git diff" }


  maps.n["<leader>e"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", noremap = true, desc = "Open diagnostic" }
  maps.n["<leader>rn"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", noremap = true, desc = "LSP Rename" }
  maps.n["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", noremap = true, desc = "Hover" }

  maps.n["<C-e>"] = { "<cmd>Neotree toggle<CR>", desc = "Toggle neotree" }
  maps.n["<C-p>"] = { "<cmd>Telescope find_files<CR>", desc = "Find file" }
  maps.n["<C-g>"] = { "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", desc = "Live grep" }
  -- maps.n["<C-y>"] = { "<cmd>HopWord<CR>" }
  maps.n["<C-y>"] = { "<cmd>lua require('leap').leap { target_windows = { vim.fn.win_getid() } }<CR>" }

  -- Smart Splits

  -- Better window navigation
  maps.n["<C-h>"] = { function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" }
  maps.n["<C-j>"] = { function() require("smart-splits").move_cursor_down() end, desc = "Move to below split" }
  maps.n["<C-k>"] = { function() require("smart-splits").move_cursor_up() end, desc = "Move to above split" }
  maps.n["<C-l>"] = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" }

  -- Resize with arrows
  maps.n["<C-Up>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" }
  maps.n["<C-Down>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" }
  maps.n["<C-Left>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" }
  maps.n["<C-Right>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" }

  -- maps.n["<C-h>"] = { "<C-w>h", desc = "Move to left split" }
  -- maps.n["<C-j>"] = { "<C-w>j", desc = "Move to below split" }
  -- maps.n["<C-k>"] = { "<C-w>k", desc = "Move to above split" }
  -- maps.n["<C-l>"] = { "<C-w>l", desc = "Move to right split" }
  -- maps.n["<C-Up>"] = { "<cmd>resize -2<CR>", desc = "Resize split up" }
  -- maps.n["<C-Down>"] = { "<cmd>resize +2<CR>", desc = "Resize split down" }
  -- maps.n["<C-Left>"] = { "<cmd>vertical resize -2<CR>", desc = "Resize split left" }
  -- maps.n["<C-Right>"] = { "<cmd>vertical resize +2<CR>", desc = "Resize split right" }

  -- Telescope
  maps.n["<leader>fw"] = { function() require("telescope.builtin").live_grep() end, desc = "Search words" }
  maps.n["<leader>fW"] = {
    function()
      require("telescope.builtin").live_grep {
        additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
      }
    end,
    desc = "Search words in all files",
  }
  maps.n["<leader>gt"] = { function() require("telescope.builtin").git_status() end, desc = "Git status" }
  maps.n["<leader>gb"] = { function() require("telescope.builtin").git_branches() end, desc = "Git branches" }
  maps.n["<leader>gc"] = { function() require("telescope.builtin").git_commits() end, desc = "Git commits" }

  maps.n["<leader>ff"] = { function() require("telescope.builtin").find_files() end, desc = "Search files" }
  maps.n["<leader>fF"] = {
    function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
    desc = "Search all files",
  }

  maps.n["<leader>fb"] = { function() require("telescope.builtin").buffers() end, desc = "Search buffers" }
  maps.n["<leader>fh"] = { function() require("telescope.builtin").help_tags() end, desc = "Search help" }
  maps.n["<leader>fm"] = { function() require("telescope.builtin").marks() end, desc = "Search marks" }
  maps.n["<leader>fo"] = { function() require("telescope.builtin").oldfiles() end, desc = "Search history" }
  maps.n["<leader>fc"] =
  { function() require("telescope.builtin").grep_string() end, desc = "Search for word under cursor" }
  maps.n["<leader>sb"] = { function() require("telescope.builtin").git_branches() end, desc = "Git branches" }
  maps.n["<leader>sh"] = { function() require("telescope.builtin").help_tags() end, desc = "Search help" }
  maps.n["<leader>sm"] = { function() require("telescope.builtin").man_pages() end, desc = "Search man" }
  maps.n["<leader>sr"] = { function() require("telescope.builtin").registers() end, desc = "Search registers" }
  maps.n["<leader>sk"] = { function() require("telescope.builtin").keymaps() end, desc = "Search keymaps" }
  maps.n["<leader>sc"] = { function() require("telescope.builtin").commands() end, desc = "Search commands" }

  maps.n["<leader>ls"] = {
    function()
      local aerial_avail, _ = pcall(require, "aerial")
      if aerial_avail then
        require("telescope").extensions.aerial.aerial()
      else
        require("telescope.builtin").lsp_document_symbols()
      end
    end,
    desc = "Search symbols",
  }

  maps.n["<leader>lG"] =
  { function() require("telescope.builtin").lsp_workspace_symbols() end, desc = "Search workspace symbols" }
  maps.n["<leader>lR"] = { function() require("telescope.builtin").lsp_references() end, desc = "Search references" }
  maps.n["<leader>lD"] = { function() require("telescope.builtin").diagnostics() end, desc = "Search diagnostics" }
  -- end

  maps.n["<leader>tn"] = { "<cmd>tabnew<cr>" }
  maps.n["<leader>tc"] = { "<cmd>tabclose<cr>" }

  -- Fix for toggleterm getting weird counts
  local function runToggleTerm(args)
    local count = vim.v.count
    if (count < 0) then count = '' end

    if not args then
      args = "direction=float"
    end

    vim.cmd(":ToggleTerm " .. count .. args)
  end

  maps.n["<leader>tf"] = { function() runToggleTerm() end, desc = "ToggleTerm float" }
  maps.n["<C-\\>"] = { function() runToggleTerm() end, desc = "ToggleTerm" }
  maps.n["<leader>th"] = {
    function() runToggleTerm("size=10 direction=horizontal") end,
    desc = "ToggleTerm horizontal split"
  }
  maps.n["<leader>tv"] = { function() runToggleTerm("size=80 direction=vertical") end, desc = "ToggleTerm vertical split" }

  maps.n["<F7>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
  maps.t["<F7>"] = maps.n["<F7>"]


  -- Improved Terminal Navigation
  maps.t["<C-h>"] = { "<c-\\><c-n><c-w>h", desc = "Terminal left window navigation" }
  maps.t["<C-j>"] = { "<c-\\><c-n><c-w>j", desc = "Terminal down window navigation" }
  maps.t["<C-k>"] = { "<c-\\><c-n><c-w>k", desc = "Terminal up window navigation" }
  maps.t["<C-l>"] = { "<c-\\><c-n><c-w>l", desc = "Terminal right window navigation" }


  -- Toggle nvim-tree
  maps.n['<C-E>'] = { [[:Neotree toggle<CR>]] }

  -- Git Diff view
  -- maps.n['gd'] = { '[[:DiffviewOpen<CR>]]' }

  -- Generate types from json
  maps.n["<leader>gj"] = {
    function()
      local language = vim.fn.input("Lang > ", "typescript")
      local top_level = vim.fn.input("Main type name > ")

      vim.cmd(".!quicktype -l " .. language .. " --just-types --top-level " .. top_level)
    end,
    desc = "Generate types from current line json"
  }

  maps.n["<leader>z"] = {
    function()
      print(vim.v.count)
      vim.cmd(":ToggleTerm " .. vim.v.count .. "direction=float")
    end,
    desc = "Generate types from current line json"
  }
end

neovim.set_mappings(maps)
