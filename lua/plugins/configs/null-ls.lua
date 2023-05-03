local null_ls = require("null-ls")

null_ls.setup({
  on_attach = require("lsp-format").on_attach,
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.rustfmt,
    -- null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.completion.luasnip,
    -- null_ls.builtins.completion.spell,
  },
})
