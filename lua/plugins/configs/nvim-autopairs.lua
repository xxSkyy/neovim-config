require "nvim-autopairs".setup {
  fast_wrap = {
    map = '<C-a>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = [=[[%'%"%)%>%]%)%}%,]]=],
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'Search',
    highlight_grey = 'Comment'
  },
}
local Rule = require('nvim-autopairs.rule')
require 'nvim-autopairs'.add_rules {
  Rule('|', '|', 'rust'),
  Rule('<', '>', 'rust')
}
