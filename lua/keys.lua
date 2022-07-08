--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- remap the key used to leave insert mode
map('i', 'jk', '', {})
-- Easier split toggle

map('n', '<C-J>', '<C-W><C-J>', {})
map('n', '<C-K>', '<C-W><C-K>', {})
map('n', '<C-L>', '<C-W><C-L>', {})
map('n', '<C-H>', '<C-W><C-H>', {})

-- Disable arrows
map('n', '<Up>', '<Nop>', {})
map('n', '<Down>', '<Nop>', {})
map('n', '<Left>', '<Nop>', {})
map('n', '<Right>', '<Nop>', {})

-- If it's not under VSCode add those mappings
if vim.g.vscode == nil then

-- Toggle nvim-tree
map('n', 't', [[:NvimTreeToggle<CR>]], {})

-- Search for files easily
map('n', '<C-P>', [[:Telescope find_files<CR>]], {})

-- Code Formatting
map('n', 'f', [[:Prettier<CR>]],{})

end
