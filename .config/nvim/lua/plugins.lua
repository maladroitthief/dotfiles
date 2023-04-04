local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('neovim/nvim-lspconfig')
Plug('lukas-reineke/indent-blankline.nvim')
Plug('airblade/vim-gitgutter')
Plug('christoomey/vim-tmux-navigator')
Plug('folke/tokyonight.nvim', { branch = 'main' })
Plug('tpope/vim-commentary')
Plug('dense-analysis/ale')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.0' })
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
Plug('nvim-telescope/telescope-file-browser.nvim')
Plug('tpope/vim-fugitive')

vim.call('plug#end')
