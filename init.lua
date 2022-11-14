--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","
vim.g.localleader = "\\"

Capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())


-- IMPORTS
require('vars') -- Variables
require('opts') -- Options
require('keys') -- Keymaps

require('tweaks/clipboard')
require('plugins/plugins') -- Plugins
