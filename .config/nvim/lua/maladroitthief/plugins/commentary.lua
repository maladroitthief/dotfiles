return {
    'tpope/vim-commentary',
    config = function()
        vim.keymap.set('n', '<C-_>', '<Plug>Commentary')
        vim.keymap.set('n', '<C-_><C-_>', '<Plug>CommentaryLine<CR>')
        vim.keymap.set('v', '<C-_>', '<Plug>Commentary<CR>')
    end,
}

