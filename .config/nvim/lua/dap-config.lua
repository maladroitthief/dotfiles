require("dapui").setup()

local dap = require("dap")
local dapui = require("dapui")

vim.keymap.set("n", "<Leader>vdt", dapui.toggle)

vim.keymap.set("n", "<Leader>vdb", dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>vdc", dap.continue)
vim.keymap.set("n", "<Leader>vdj", dap.step_over)
vim.keymap.set("n", "<Leader>vdl", dap.step_into)
vim.keymap.set("n", "<Leader>vdh", dap.step_out)

local hl = "DapBreakpoint"
vim.fn.sign_define(hl, { text = "", texthl = 'DiagnosticError', numhl = 'DiagnosticError' })

require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
dap.configurations.python = {
  {
    name = "Launch file",
    type = 'python',
    request = 'launch',
    program = "${file}",
    pythonPath = function()
      return os.getenv("HOME") .. "/.pyenv/shims/python"
    end,
  },
}

