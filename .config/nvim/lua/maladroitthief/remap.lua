vim.g.mapleader = " "

-- file navigation
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore)
vim.keymap.set('n', '<Leader>er', vim.cmd.Explore)
vim.keymap.set('n', '<Leader>re', vim.cmd.Rexplore)
vim.keymap.set('n', '<Leader><Leader>', '<C-^>')

-- sorcery with moving blocks in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('n', 'K', ":m '<-2<CR>gv=gv")

-- centering the window on jumps
vim.keymap.set('n', 'G', "Gzz")
vim.keymap.set('n', '<C-d>', "<C-d>zz")
vim.keymap.set('n', '<C-u>', "<C-u>zz")
vim.keymap.set('n', "n", "nzzzv")
vim.keymap.set('n', "N", "Nzzzv")

-- merge lines
vim.keymap.set('n', 'J', "mzJ`z")

-- tmux movements
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')

-- remove find highlights
vim.keymap.set('n', '<ESC>', ':noh<CR>')

-- unmaps
vim.keymap.set('n', "Q", "<nop>")

-- source current file
vim.keymap.set("n", "<leader>so", function()
    vim.cmd("so")
end)
