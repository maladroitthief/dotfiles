return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set('n', '<C-Z>', vim.cmd.UndotreeToggle, { desc = "undotree: toggle" })
    end,
    opts = {},
}
