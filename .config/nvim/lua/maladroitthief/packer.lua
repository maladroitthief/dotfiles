-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    --- Theme ---
    use("rebelot/kanagawa.nvim")

    --- LSP ---
    use('neovim/nvim-lspconfig')
    use({ 'williamboman/mason.nvim', run = ":MasonUpdate" })
    use('williamboman/mason-lspconfig.nvim')
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('saadparwaiz1/cmp_luasnip')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-nvim-lua')
    use('L3MON4D3/LuaSnip')
    use('rafamadriz/friendly-snippets')
    use('jose-elias-alvarez/null-ls.nvim')

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
    use("nvim-treesitter/nvim-treesitter-context");
    use("theprimeagen/harpoon")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use('tpope/vim-commentary')
    use('tpope/vim-abolish')
    use('kevinhwang91/promise-async')
    use({
        'kevinhwang91/nvim-ufo',
        requires = 'luukvbaal/statuscol.nvim'
    })
    use({ "ellisonleao/glow.nvim", config = function() require("glow").setup() end })
    use({
        "folke/trouble.nvim",
        requires = { "nvim-tree/nvim-web-devicons" }
    })
    use({
        "tpope/vim-dadbod",
        requires = {
            "kristijanhusak/vim-dadbod-ui",
            "kristijanhusak/vim-dadbod-completion",
        },
        config = function()
            require("config.dadbod").setup()
        end,
    })
    use("ThePrimeagen/git-worktree.nvim")
    use("folke/zen-mode.nvim")
end)
