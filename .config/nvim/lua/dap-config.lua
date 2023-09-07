require("dapui").setup()

local dap = require("dap")
local dapui = require("dapui")

vim.keymap.set("n", "<Leader>vdt", dapui.toggle)

vim.keymap.set("n", "<Leader>vdb", dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>vdc", dap.continue)

-- vim.keymap.set("n", "<Leader>vd", dap.step_over)
-- vim.keymap.set("n", "<Leader>vd", dap.step_into)
-- vim.keymap.set("n", "<Leader>vd", dap.step_out)

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return '/usr/bin/python'
    end,
  },
}
