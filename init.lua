--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","
vim.g.localleader = "\\"



for _, source in ipairs {
  "utils",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end


local has_cmp_nvim_lsp = pcall(require, "vmp_nvim_lsp")
if has_cmp_nvim_lsp then
  Capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
  Capabilities.textDocument.completion.completionItem.snippetSupport = true
end


-- IMPORTS
require('vars') -- Variables
require('opts') -- Options
require('plugins') -- Pluginm
require('mappings') -- Keymaps
