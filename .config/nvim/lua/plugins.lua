local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('neovim/nvim-lspconfig')
Plug('lukas-reineke/indent-blankline.nvim')
Plug('airblade/vim-gitgutter')
Plug('christoomey/vim-tmux-navigator')
Plug('folke/tokyonight.nvim', { branch = 'main' })
Plug('tpope/vim-commentary')
-- Plug('dense-analysis/ale')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.0' })
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
Plug('nvim-telescope/telescope-file-browser.nvim')
Plug('tpope/vim-fugitive')
Plug('tpope/vim-abolish')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('ThePrimeagen/harpoon')

Plug('williamboman/mason.nvim', { ['do'] = ':MasonUpdate' })
Plug('williamboman/mason-lspconfig.nvim')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('L3MON4D3/LuaSnip')
Plug('VonHeikemen/lsp-zero.nvim', { branch = 'v2.x' })
Plug('mbbill/undotree')
Plug('vim-test/vim-test')
Plug('maladroitthief/telescope-rtfm.nvim')
Plug('jose-elias-alvarez/null-ls.nvim')

Plug('mfussenegger/nvim-dap')
Plug('rcarriga/nvim-dap-ui')
Plug('mfussenegger/nvim-dap-python')
Plug('folke/neodev.nvim')
Plug('mechatroner/rainbow_csv')
Plug('kevinhwang91/promise-async')
Plug('kevinhwang91/nvim-ufo')
Plug('luukvbaal/statuscol.nvim')

vim.call('plug#end')
