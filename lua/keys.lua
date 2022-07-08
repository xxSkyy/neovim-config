--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- remap the key used to leave insert mode
map('i', 'jk', '', {})

-- Toggle nvim-tree
map('n', 't', [[:NvimTreeToggle<CR>]], {})

-- Easier split toggle

map('n', '<C-J>', '<C-W><C-J>', {})
map('n', '<C-K>', '<C-W><C-K>', {})
map('n', '<C-L>', '<C-W><C-L>', {})
map('n', '<C-H>', '<C-W><C-H>', {})

-- Search for files easily
map('n', '<C-P>', [[:Telescope find_files<CR>]], {})

map('n', 'f', [[:Prettier<CR>]],{})

-- Autocomplete
-- map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})

