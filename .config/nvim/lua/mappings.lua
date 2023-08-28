nmap('<C-J>', '<C-W><C-J>')
nmap('<C-K>', '<C-W><C-K>')
nmap('<C-L>', '<C-W><C-L>')
nmap('<C-H>', '<C-W><C-H>')
nmap('<Leader><Leader>', '<C-^>')
nmap('<Leader>so', ':source ~/.config/nvim/init.lua<CR>')
nmap('<ESC>', ':noh<CR>')
nmap('<Leader>er', ':E<CR>')
nmap('<Leader>re', ':Rex<CR>')
nmap('<C-_>', '<Plug>Commentary')
nmap('<C-_><C-_>', '<Plug>CommentaryLine<CR>')
vmap('<C-_>', '<Plug>Commentary<CR>')

-- sorcery with moving blocks in visual mode
vmap('J', ":m '>+1<CR>gv=gv")
vmap('K', ":m '<-2<CR>gv=gv")

nmap('J', "mzJ`z")

nmap('<C-d>', "<C-d>zz")
nmap('<C-u>', "<C-u>zz")

nmap("n", "nzzzv")
nmap("N", "Nzzzv")
nmap("Q", "<nop>")
