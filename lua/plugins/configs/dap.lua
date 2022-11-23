-- Dap for GDScript
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#godot-gdscript
local dap = require('dap')

dap.adapters.godot = {
  type = "server",
  host = '127.0.0.1',
  port = 6006,
}

dap.configurations.gdscript = {
  {
    type = "godot",
    request = "launch",
    name = "Launch scene",
    project = "${workspaceFolder}",
    launch_scene = true,
  }
}

-- LLdb Rust
-- dap.adapters.lldb = {
--   type = 'executable',
--   command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
--   name = 'lldb'
-- }
--
-- -- configure the adapter for Rust Debugging
-- dap.configurations.rust = {
--   {
--     name = 'Launch Debug',
--     type = 'lldb',
--     request = "launch",
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/' .. '')
--     end,
--     cwd = '${workspaceFolder}',
--     stopOnEntry = false,
--     args = {},
--     initCommand = {},
--     runInTerminal = false
--   }
-- }
