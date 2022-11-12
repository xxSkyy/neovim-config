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

-- In input mode also, no more
-- Update: It was stupid
-- map('i', '<Up>', '<Nop>', {})
-- map('i', '<Down>', '<Nop>', {})
-- map('i', '<Left>', '<Nop>', {})
-- map('i', '<Right>', '<Nop>', {})

-- Terminal mappings out of console
map('t', '<C-h>', '<C-\\><C-N><C-w>h', {})
map('t', '<C-j>', '<C-\\><C-N><C-w>j', {})
map('t', '<C-k>', '<C-\\><C-N><C-w>k', {})
map('t', '<C-l>', '<C-\\><C-N><C-w>l', {})

-- Open floating inline error
map("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true })

-- Show types etc of selected code part
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true })


-- Lsp rename
map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })

-- Pasting yanked not deleted n' yanked value
map('n', ',p', '"0p', {})
map('n', ',P', '"0P', {})

-- Remove useless whitespaces from end of lines
map('n', '<F5>', [[:%s/\s\+$//e<CR>]], {})

-- If it's not under VSCode add those mappings
if vim.g.vscode == nil then

  -- Toggle nvim-tree
  map('n', '<C-E>', [[:NvimTreeToggle<CR>:NvimTreeRefresh<CR>]], {})

  -- Search for files easily
  map('n', '<C-P>', [[:Telescope find_files<CR>]], {})
  map('n', '<C-G>', [[:Telescope live_grep<CR>]], {})

  -- Code Formatting
  map('n', '<C-F>', [[:Prettier<CR>]], {})

  -- Jump to selected word
  map('n', '<C-y>', [[:HopWord<CR>]], {})

  -- Switch between tabs
  map('n', 'gt', '[[:BufferNext<CR>]]', {})
  map('n', 'gT', '[[:BufferPrevious<CR>]]', {})

  -- Git Diff view
  map('n', 'gd', '[[:DiffviewOpen<CR>]]', {})
end
