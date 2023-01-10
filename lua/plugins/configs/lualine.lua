-- Nice bottom line
local custom_horizon = require 'lualine.themes.horizon'
custom_horizon.normal.c.bg = 'transparent'
custom_horizon.command.c.bg = 'transparent'
custom_horizon.inactive.c.bg = 'transparent'
custom_horizon.insert.c.bg = 'transparent'
custom_horizon.replace.c.bg = 'transparent'
custom_horizon.visual.c.bg = 'transparent'
require('lualine').setup {
  options = {
    theme = custom_horizon,
    globalstatus = true,
  }
}
