return {
    'tpope/vim-commentary',
    config = function()
        vim.keymap.set('n', '<C-_>', '<Plug>Commentary', { desc = "commentary: toggle" })
        vim.keymap.set('n', '<C-_><C-_>', '<Plug>CommentaryLine<CR>', { desc = "commentary: line" })
        vim.keymap.set('v', '<C-_>', '<Plug>Commentary<CR>', { desc = "commentary: toggle" })
    end,
}
