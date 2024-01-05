local Plug = vim.fn['plug#']

vim.call('plug#begin')

--- LSP ---
Plug('neovim/nvim-lspconfig')
Plug('williamboman/mason.nvim', { ['do'] = ':MasonUpdate' })
Plug('williamboman/mason-lspconfig.nvim')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('L3MON4D3/LuaSnip')
Plug('VonHeikemen/lsp-zero.nvim', { branch = 'v2.x' })
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

--- Visual ---
Plug('lukas-reineke/indent-blankline.nvim')
-- Plug('airblade/vim-gitgutter')
Plug('lewis6991/gitsigns.nvim')
Plug('folke/tokyonight.nvim', { branch = 'main' })
Plug('mechatroner/rainbow_csv')

--- Navigation ---
Plug('christoomey/vim-tmux-navigator')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.5' })
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
Plug('nvim-telescope/telescope-file-browser.nvim')
Plug('maladroitthief/telescope-rtfm.nvim')
Plug('jose-elias-alvarez/null-ls.nvim')

--- Functionality ---
Plug('tpope/vim-commentary')
Plug('tpope/vim-fugitive')
Plug('tpope/vim-abolish')
Plug('ThePrimeagen/harpoon')
Plug('mbbill/undotree')
Plug('kevinhwang91/promise-async')
Plug('kevinhwang91/nvim-ufo')
Plug('luukvbaal/statuscol.nvim')

vim.call('plug#end')
