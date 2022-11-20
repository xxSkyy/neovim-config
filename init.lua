--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","
vim.g.localleader = "\\"

local has_cmp_nvim_lsp = pcall(require, "vmp_nvim_lsp")
if has_cmp_nvim_lsp then
  Capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
  Capabilities.textDocument.completion.completionItem.snippetSupport = true
end


-- IMPORTS
require('vars') -- Variables
require('opts') -- Options
require('keys') -- Keymaps

require('plugins/plugins') -- Pluginm
