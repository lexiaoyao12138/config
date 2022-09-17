local ok, dap = pcall(require, "dap")
if not ok then
	vim.notify("dap is not install!")
	return
end

local dbg_path = require("dap-install.config.settings").options["installation_path"] .. "ccppr_vsc/"
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
	command = dbg_path .. "extension/debugAdapters/bin/OpenDebugAD7",
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}

vim.fn.sign_define('DapBreakpoint', {text='●', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='', texthl='', linehl='', numhl=''})

dap.configurations.c = dap.configurations.cpp
