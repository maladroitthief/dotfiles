return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set('n', '<C-Z>', vim.cmd.UndotreeToggle)
    end,
}
