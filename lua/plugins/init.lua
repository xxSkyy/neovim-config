-- Packer file
require("plugins.packer")
require("plugins.theme")

-- If Nvim is not running under VSCode enable those extensions
if vim.g.vscode == nil then
  -- Plugin custom configs
  neovim.load_folder("plugins.configs")

  -- Lsp configs only pure nvim
  neovim.load_folder("plugins.lsp")
end
