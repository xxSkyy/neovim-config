--[[ opts.lua ]]
local opt = vim.opt
local cmd = vim.api.nvim_command


-- [[ Context ]]
opt.colorcolumn = '60'    -- str:  Show col for max line length
opt.number = true         -- bool: Show line numbers
opt.relativenumber = true -- bool: Show relative line numbers
opt.scrolloff = 4         -- int:  Min num lines of context
opt.signcolumn = "yes"    -- str:  Show the sign column



-- [[ Filetypes ]]
opt.encoding = 'utf8'     -- str:  String encoding to use
opt.fileencoding = 'utf8' -- str:  File encoding to use

-- [[ Theme ]]
opt.syntax = "ON"        -- str:  Allow syntax highlighting
opt.termguicolors = true -- bool: If term supports ui color then enable

vim.g.icons_enabled = true
vim.g.mapleader = " "

-- [[ Search ]]
opt.ignorecase = true -- bool: Ignore case in search patterns
opt.smartcase = true  -- bool: Override ignorecase if search contains capitals
opt.incsearch = true  -- bool: Use incremental search
opt.hlsearch = false  -- bool: Highlight search matches

-- [[Whitespace ]]
opt.expandtab = true -- bool: Use spaces instead of tabs
opt.shiftwidth = 2   -- num:  Size of an indent
opt.softtabstop = 2  -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 2      -- num:  Number of spaces tabs count for

-- [[ Splits ]]
opt.splitright = true -- bool: Place new window to right of current one
opt.splitbelow = true -- bool: Place new window below the current one

vim.cmd('set guicursor=n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor')
opt.cursorline = true
opt.cursorlineopt = 'both'

-- Use system clipboard
opt.clipboard = 'unnamedplus'

-- Set borders for hover
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
})

-- Set borders for diagnostics
vim.diagnostic.config {
  float = {
    border = "rounded",
  }
}

if neovim.is_module_available("notify") then
  print("Setting notify as vim.notify")
  require('notify').setup({
    background_colour = "#000000",
  })

  vim.notify = require('notify')
end

vim.notify = neovim.notify

-- Grey out search area on Leap search
vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })

-- Bypass version check, vue lsp dont work sometimes due to that
vim.lsp.util.apply_text_document_edit = function(text_document_edit, index, offset_encoding)
  local text_document = text_document_edit.textDocument
  local bufnr = vim.uri_to_bufnr(text_document.uri)
  if offset_encoding == nil then
    vim.notify_once('apply_text_document_edit must be called with valid offset encoding', vim.log.levels.WARN)
  end

  vim.lsp.util.apply_text_edits(text_document_edit.edits, bufnr, offset_encoding)
end
