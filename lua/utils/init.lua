_G.neovim = {}

local map = vim.keymap.set

function neovim.initialize_icons()
  neovim.icons = require "utils.icons.nerd_font"
  neovim.text_icons = require "utils.icons.text"
end

--- Get an icon from `lspkind` if it is available and return it
-- @param kind the kind of icon in `lspkind` to retrieve
-- @return the icon
function neovim.get_icon(kind)
  local icon_pack = vim.g.icons_enabled and "icons" or "text_icons"
  if not neovim[icon_pack] then neovim.initialize_icons() end
  return neovim[icon_pack] and neovim[icon_pack][kind] or ""
end

function neovim.set_mappings(map_table, base)
  -- iterate over the first keys for each mode
  for mode, maps in pairs(map_table) do
    -- iterate over each keybinding set in the current mode
    for keymap, options in pairs(maps) do
      -- build the options for the command accordingly
      if options then
        local cmd = options
        local keymap_opts = base or {}
        if type(options) == "table" then
          cmd = options[1]
          keymap_opts = vim.tbl_deep_extend("force", options, keymap_opts)
          keymap_opts[1] = nil
        end
        -- extend the keybinding options with the base provided and set the mapping
        map(mode, keymap, cmd, keymap_opts)
      end
    end
  end
end

function neovim.is_available(plugin) return packer_plugins ~= nil and packer_plugins[plugin] ~= nil end
