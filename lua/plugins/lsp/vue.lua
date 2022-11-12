local util = require 'lspconfig.util'
local function get_typescript_server_path(root_dir)

  local global_ts = '/home/sky/.nvm/versions/node/v16.16.0/lib/node_modules/typescript/lib'
  if vim.fn.has('macunix') == 1 then
    -- Mac path
    global_ts = '/Users/sky/.nvm/versions/node/v14.20.0/lib/node_modules/typescript/lib'
  end

  -- Alternative location if installed as root:
  -- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
  local found_ts = ''
  local function check_dir(path)
    found_ts = util.path.join(path, 'node_modules', 'typescript', 'lib')
    if util.path.exists(found_ts) then
      return path
    end
  end

  if util.search_ancestors(root_dir, check_dir) then
    return found_ts
  else
    return global_ts
  end
end

require 'lspconfig'.volar.setup {
  on_attach = require("lsp-format").on_attach,
  root_dir = require 'lspconfig'.util.root_pattern("package.json"),
  filetypes = { 'vue' },

  on_new_config = function(new_config, new_root_dir)
    new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
  end
}
