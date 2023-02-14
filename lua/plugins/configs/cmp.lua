-- Autocompletion
local cmp = require 'cmp'
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.setup {
  source_priority = {
    nvim_lsp = 1000,
    luasnip = 750,
    buffer = 500,
    path = 250,
    text = 10,
  },
  sources = {
    { name = 'crates' },
    { name = 'rust-analyzer' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = "luasnip" },
    { name = "vim-dadbod-completion" }
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
    format = function(entry, vim_item)
      vim_item.kind = require("lspkind").presets.codicons[vim_item.kind]
          .. "  "
          .. vim_item.kind

      vim_item.menu = ({
            ['vim-dadbod-completion'] = '[DB]',
          })[entry.source.name]

      return vim_item
    end,
  },
  -- formatting = {
  -- format = require("lspkind").cmp_format({ with_text = false, maxwidth = 50, mode = 'symbol', ellipsis_char = '...' }),
  -- },
  window = {
    completion = cmp.config.window.bordered(),
    documentations = cmp.config.window.bordered(),
  }
}

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
