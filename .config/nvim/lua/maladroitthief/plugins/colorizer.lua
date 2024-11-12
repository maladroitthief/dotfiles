return {
    'norcalli/nvim-colorizer.lua',
    config = function()
        vim.keymap.set('n', '<leader>c', ':ColorizerToggle<CR>', { desc = "colorizer: toggle" })
    end,
}
