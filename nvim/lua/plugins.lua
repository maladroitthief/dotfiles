local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('neovim/nvim-lspconfig')
Plug('Yggdroot/indentLine')
Plug('airblade/vim-gitgutter')
Plug('christoomey/vim-tmux-navigator')
Plug('folke/tokyonight.nvim', { branch = 'main' })
Plug('tpope/vim-commentary')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.0' })
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })

vim.call('plug#end')

-- tokyonight
vim.cmd('colorscheme tokyonight')
vim.api.nvim_set_hl(0, 'Normal', { fg = 'none', bg = 'none' })

-- indent-line
vim.g.indentLine_char = "│"
vim.g.indentLine_setColors = 0

-- telescope
nmap('<C-P>', ':Telescope find_files<CR>')
nmap('<C-F>', ':Telescope live_grep<CR>')
nmap('<C-B>', ':Telescope buffers<CR>')
nmap('<C-G>', ':Telescope git_commits<CR>')
