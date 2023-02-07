local have_vue = neovim.is_npm_package_installed 'vue'


if not have_vue then
  require 'lspconfig'.tsserver.setup {
    root_dir = require 'lspconfig'.util.root_pattern("package.json"),
    server = {
      on_attach = require("lsp-format").on_attach,
      capabilities = neovim.capabilities
    }
  }
end
