-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    --- Theme ---
    use("rebelot/kanagawa.nvim")

    --- LSP ---
    use({
        'neovim/nvim-lspconfig',
        requires = {
            { 'williamboman/mason.nvim',          run = ":MasonUpdate" },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
            { 'jose-elias-alvarez/null-ls.nvim' },
        }
    })
    use({
        "folke/trouble.nvim",
        requires = { "nvim-tree/nvim-web-devicons" }
    })
    ----- Visual ---
    use('lukas-reineke/indent-blankline.nvim')
    use('lewis6991/gitsigns.nvim')
    use('folke/neodev.nvim')
    use('norcalli/nvim-colorizer.lua')

    ----- Navigation ---
    use('christoomey/vim-tmux-navigator')
    use({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        requires = { 'nvim-lua/plenary.nvim' },

    })
    use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
    use('nvim-telescope/telescope-file-browser.nvim')
    use('maladroitthief/telescope-rtfm.nvim')

    --- Functionallity ---
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("theprimeagen/harpoon")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("nvim-treesitter/nvim-treesitter-context");
    use('tpope/vim-commentary')
    use('tpope/vim-abolish')
    use('kevinhwang91/promise-async')
    use({
        'kevinhwang91/nvim-ufo',
        requires = 'luukvbaal/statuscol.nvim'
    })
    use({ "ellisonleao/glow.nvim", config = function() require("glow").setup() end })
end)
