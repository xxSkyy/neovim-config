local nightfox_shade = require("nightfox.lib.shade")
require('nightfox').setup({
  palettes = {
    duskfox = {
      black   = nightfox_shade.new("#393552", "#47407d", "#322e42"),
      red     = nightfox_shade.new("#eb6f92", "#f083a2", "#d84f76"),
      green   = nightfox_shade.new("#a3be8c", "#b1d196", "#8aa872"),
      yellow  = nightfox_shade.new("#dbc074", 0.15, -0.15),
      blue    = nightfox_shade.new("#569fba", "#65b1cd", "#4a869c"),
      -- magenta = Shade.new("#c4a7e7", "#ccb1ed", "#a580d2"),
      magenta = nightfox_shade.new("#9d79d6", 0.15, -0.15),
      cyan    = nightfox_shade.new("#9ccfd8", "#a6dae3", "#7bb8c1"),
      white   = nightfox_shade.new("#dddddf", 0.15, -0.15),
      orange  = nightfox_shade.new("#ea9a97", "#f0a4a2", "#d6746f"),
      pink    = nightfox_shade.new("#eb98c3", "#f0a6cc", "#d871a6"),

      comment = "#817c9c",

      bg0 = "#171616", -- Dark bg (status line and float)
      bg1 = "#161615", -- Default bg
      bg2 = "#30302F", -- Lighter bg (colorcolm folds)
      bg3 = "#30302F", -- Lighter bg (cursor line)
      bg4 = "#4b4673", -- Conceal, border fg

      fg0 = "#d6d6d7", -- Lighter fg
      fg1 = "#cdcecf", -- Default fg
      fg2 = "#aeafb0", -- Darker fg (status line)
      fg3 = "#4b4673", -- Darker fg (line numbers, fold colums)

      sel0 = "#433c59", -- Popup bg, visual selection bg
      sel1 = "#63577d", -- Popup sel bg, search bg
    }
  },
  options = {
    transparent = true,
    styles = {
      comments = "italic",
      keywords = "italic",
      types = "italic,bold",
    }
  }
})
vim.cmd([[colorscheme duskfox]])
