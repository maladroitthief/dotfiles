nmap('<leader>tt', ':TestNearest<CR>')
nmap('<leader>tf', ':TestFile<CR>')
nmap('<leader>tp', ':TestSuite<CR>')
nmap('<leader>tl', ':TestLast<CR>')
nmap('<leader>tv', ':TestVisit<CR>')

vim.g['test#strategy'] = 'neovim'
vim.g['test#go#gotest#options'] = '-cover'
