-- Autocompletion
local cmp = require 'cmp'

cmp.setup {
  sources = {
    { name = 'crates' },
    { name = 'rust-analyzer' },
    { name = 'nvim_lsp' },
    { kjname = 'buffer' },
    { name = 'path' },
    { name = "luasnip" },
  },
  mapping = {
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true })
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    format = require("lspkind").cmp_format({ with_text = false, maxwidth = 50, mode = 'symbol', ellipsis_char = '...' }),
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentations = cmp.config.window.bordered(),
  }
}
