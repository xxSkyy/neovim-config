-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/sky/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/sky/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/sky/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/sky/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/sky/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["beacon.nvim"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/beacon.nvim",
    url = "https://github.com/DanilaMihailov/beacon.nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["crates.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vcrates\frequire\0" },
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/crates.nvim",
    url = "https://github.com/saecki/crates.nvim"
  },
  ["diffview.nvim"] = {
    config = { "\27LJ\2\nÍ\f\0\0\n\0`\3À\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3^\0005\4\4\0005\5\6\0009\6\5\0=\6\a\0059\6\b\0=\6\t\0059\6\n\0=\6\v\0059\6\f\0=\6\r\0059\6\14\0=\6\15\0059\6\16\0=\6\17\0059\6\18\0=\6\19\0059\6\20\0=\6\21\0059\6\22\0=\6\23\0059\6\24\0'\b\25\0B\6\2\2=\6\26\0059\6\24\0'\b\27\0B\6\2\2=\6\28\0059\6\24\0'\b\29\0B\6\2\2=\6\30\0059\6\24\0'\b\31\0B\6\2\2=\6 \0059\6\24\0'\b!\0B\6\2\2=\6\"\5=\5#\0044\5\0\0=\5$\0044\5\0\0=\5%\0044\5\3\0005\6'\0005\a&\0>\a\1\0069\a(\0'\t\25\0B\a\2\0?\a\0\0>\6\1\0055\6*\0005\a)\0>\a\1\0069\a(\0'\t\27\0B\a\2\0?\a\0\0>\6\2\5=\5+\0044\5\4\0005\6-\0005\a,\0>\a\1\0069\a(\0'\t\29\0B\a\2\0?\a\0\0>\6\1\0055\6/\0005\a.\0>\a\1\0069\a(\0'\t\25\0B\a\2\0?\a\0\0>\6\2\0055\0061\0005\a0\0>\a\1\0069\a(\0'\t\27\0B\a\2\0?\a\0\0>\6\3\5=\0052\0045\0054\0009\0063\0=\0065\0059\0066\0=\0067\0059\0068\0=\0069\0059\6:\0=\6;\0059\6<\0=\6=\0059\6>\0=\6?\0059\6@\0=\6A\0059\6B\0=\6C\0059\6\5\0=\6\a\0059\6\b\0=\6\t\0059\6\n\0=\6\v\0059\6\f\0=\6\r\0059\6\14\0=\6\15\0059\6D\0=\6E\0059\6F\0=\6G\0059\6\16\0=\6\17\0059\6\18\0=\6\19\0059\6\20\0=\6\21\0059\6\22\0=\6\23\5=\5H\0045\5J\0009\6I\0=\6K\0059\6L\0=\6M\0059\6N\0=\6O\0059\6B\0=\6C\0059\6P\0=\6Q\0059\6R\0=\6S\0059\0063\0=\0065\0059\0066\0=\0067\0059\0068\0=\0069\0059\0068\0=\6T\0059\0068\0=\6U\0059\6V\0*\b\1\0B\6\2\2=\6W\0059\6V\0*\b\2\0B\6\2\2=\6X\0059\6\5\0=\6\a\0059\6\b\0=\6\t\0059\6\n\0=\6\v\0059\6\f\0=\6\r\0059\6\14\0=\6\15\0059\6\16\0=\6\17\0059\6\18\0=\6\19\5=\5Y\0045\5Z\0009\0068\0=\6\a\0059\6[\0=\6\\\5=\5]\4=\4_\3B\1\2\1K\0\1\0\fkeymaps\1\0\0\17option_panel\6q\nclose\1\0\0\23file_history_panel\n<c-f>\n<c-b>\16scroll_view\18<2-LeftMouse>\6o\azM\20close_all_folds\azR\19open_all_folds\6y\14copy_hash\f<C-A-d>\21open_in_diffview\ag!\1\0\0\foptions\15file_panel\6R\18refresh_files\6i\18listing_style\6L\20open_commit_log\6X\18restore_entry\6U\16unstage_all\6S\14stage_all\6-\23toggle_stage_entry\t<cr>\17select_entry\6k\15prev_entry\6j\1\0\0\15next_entry\ndiff4\1\3\0\0\0\b3do\1\3\0\0\6n\6x\1\3\0\0\0\b2do\1\3\0\0\6n\6x\1\3\0\0\0\b1do\1\3\0\0\6n\6x\ndiff3\1\3\0\0\0\b3do\1\3\0\0\6n\6x\fdiffget\1\3\0\0\0\b2do\1\3\0\0\6n\6x\ndiff2\ndiff1\tview\adx\tnone\15<leader>ca\ball\15<leader>cb\tbase\15<leader>ct\vtheirs\15<leader>co\tours\20conflict_choose\a]x\18next_conflict\a[x\18prev_conflict\14<leader>b\17toggle_files\14<leader>e\16focus_files\f<C-w>gf\18goto_file_tab\15<C-w><C-f>\20goto_file_split\agf\14goto_file\f<s-tab>\22select_prev_entry\n<tab>\1\0\0\22select_next_entry\1\0\1\21disable_defaults\1\nsetup\rdiffview\21diffview.actions\frequire\a€€À™\4\1€€Àþ\v\1€€Àþ\3\0" },
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nW\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\21show_end_of_line\2\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lsp-format.nvim"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/lsp-format.nvim",
    url = "https://github.com/lukas-reineke/lsp-format.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    config = { "\27LJ\2\nu\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\26context_commentstring\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["prettier.nvim"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/prettier.nvim",
    url = "https://github.com/MunifTanjim/prettier.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-be-good"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/vim-be-good",
    url = "https://github.com/ThePrimeagen/vim-be-good"
  },
  ["vim-godot"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/vim-godot",
    url = "https://github.com/habamax/vim-godot"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["vscode.nvim"] = {
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/vscode.nvim",
    url = "https://github.com/Mofiqul/vscode.nvim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/sky/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-ts-context-commentstring
time([[Config for nvim-ts-context-commentstring]], true)
try_loadstring("\27LJ\2\nu\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\26context_commentstring\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-ts-context-commentstring")
time([[Config for nvim-ts-context-commentstring]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
try_loadstring("\27LJ\2\nÍ\f\0\0\n\0`\3À\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3^\0005\4\4\0005\5\6\0009\6\5\0=\6\a\0059\6\b\0=\6\t\0059\6\n\0=\6\v\0059\6\f\0=\6\r\0059\6\14\0=\6\15\0059\6\16\0=\6\17\0059\6\18\0=\6\19\0059\6\20\0=\6\21\0059\6\22\0=\6\23\0059\6\24\0'\b\25\0B\6\2\2=\6\26\0059\6\24\0'\b\27\0B\6\2\2=\6\28\0059\6\24\0'\b\29\0B\6\2\2=\6\30\0059\6\24\0'\b\31\0B\6\2\2=\6 \0059\6\24\0'\b!\0B\6\2\2=\6\"\5=\5#\0044\5\0\0=\5$\0044\5\0\0=\5%\0044\5\3\0005\6'\0005\a&\0>\a\1\0069\a(\0'\t\25\0B\a\2\0?\a\0\0>\6\1\0055\6*\0005\a)\0>\a\1\0069\a(\0'\t\27\0B\a\2\0?\a\0\0>\6\2\5=\5+\0044\5\4\0005\6-\0005\a,\0>\a\1\0069\a(\0'\t\29\0B\a\2\0?\a\0\0>\6\1\0055\6/\0005\a.\0>\a\1\0069\a(\0'\t\25\0B\a\2\0?\a\0\0>\6\2\0055\0061\0005\a0\0>\a\1\0069\a(\0'\t\27\0B\a\2\0?\a\0\0>\6\3\5=\0052\0045\0054\0009\0063\0=\0065\0059\0066\0=\0067\0059\0068\0=\0069\0059\6:\0=\6;\0059\6<\0=\6=\0059\6>\0=\6?\0059\6@\0=\6A\0059\6B\0=\6C\0059\6\5\0=\6\a\0059\6\b\0=\6\t\0059\6\n\0=\6\v\0059\6\f\0=\6\r\0059\6\14\0=\6\15\0059\6D\0=\6E\0059\6F\0=\6G\0059\6\16\0=\6\17\0059\6\18\0=\6\19\0059\6\20\0=\6\21\0059\6\22\0=\6\23\5=\5H\0045\5J\0009\6I\0=\6K\0059\6L\0=\6M\0059\6N\0=\6O\0059\6B\0=\6C\0059\6P\0=\6Q\0059\6R\0=\6S\0059\0063\0=\0065\0059\0066\0=\0067\0059\0068\0=\0069\0059\0068\0=\6T\0059\0068\0=\6U\0059\6V\0*\b\1\0B\6\2\2=\6W\0059\6V\0*\b\2\0B\6\2\2=\6X\0059\6\5\0=\6\a\0059\6\b\0=\6\t\0059\6\n\0=\6\v\0059\6\f\0=\6\r\0059\6\14\0=\6\15\0059\6\16\0=\6\17\0059\6\18\0=\6\19\5=\5Y\0045\5Z\0009\0068\0=\6\a\0059\6[\0=\6\\\5=\5]\4=\4_\3B\1\2\1K\0\1\0\fkeymaps\1\0\0\17option_panel\6q\nclose\1\0\0\23file_history_panel\n<c-f>\n<c-b>\16scroll_view\18<2-LeftMouse>\6o\azM\20close_all_folds\azR\19open_all_folds\6y\14copy_hash\f<C-A-d>\21open_in_diffview\ag!\1\0\0\foptions\15file_panel\6R\18refresh_files\6i\18listing_style\6L\20open_commit_log\6X\18restore_entry\6U\16unstage_all\6S\14stage_all\6-\23toggle_stage_entry\t<cr>\17select_entry\6k\15prev_entry\6j\1\0\0\15next_entry\ndiff4\1\3\0\0\0\b3do\1\3\0\0\6n\6x\1\3\0\0\0\b2do\1\3\0\0\6n\6x\1\3\0\0\0\b1do\1\3\0\0\6n\6x\ndiff3\1\3\0\0\0\b3do\1\3\0\0\6n\6x\fdiffget\1\3\0\0\0\b2do\1\3\0\0\6n\6x\ndiff2\ndiff1\tview\adx\tnone\15<leader>ca\ball\15<leader>cb\tbase\15<leader>ct\vtheirs\15<leader>co\tours\20conflict_choose\a]x\18next_conflict\a[x\18prev_conflict\14<leader>b\17toggle_files\14<leader>e\16focus_files\f<C-w>gf\18goto_file_tab\15<C-w><C-f>\20goto_file_split\agf\14goto_file\f<s-tab>\22select_prev_entry\n<tab>\1\0\0\22select_next_entry\1\0\1\21disable_defaults\1\nsetup\rdiffview\21diffview.actions\frequire\a€€À™\4\1€€Àþ\v\1€€Àþ\3\0", "config", "diffview.nvim")
time([[Config for diffview.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nW\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\21show_end_of_line\2\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: crates.nvim
time([[Config for crates.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vcrates\frequire\0", "config", "crates.nvim")
time([[Config for crates.nvim]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")
time([[Config for nvim-ts-autotag]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-cmp ]]
vim.cmd [[ packadd LuaSnip ]]
time([[Sequenced loading]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
