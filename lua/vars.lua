--[[ vars.lua ]]
local g = vim.g
g.t_co = 256
g.background = "dark"

g.mapleader = ","
g.localleader = "\\"

-- -- Update the packpath
-- local packer_path = vim.fn.stdpath('config') .. '/site'
-- vim.o.packpath = vim.o.packpath .. ',' .. packer_path

-- To appropriately highlight codefences returned from denols,
-- you will need to augment vim.g.markdown_fenced languages
-- in your init.lua
g.markdown_fenced_languages = {
  "ts=typescript"
}
