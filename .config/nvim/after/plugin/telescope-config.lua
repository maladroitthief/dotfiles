local builtin = require('telescope.builtin')
local extensions = require('telescope').extensions
local trouble = require("trouble.providers.telescope")

vim.keymap.set('n', '<leader>tf', function()
    builtin.find_files({
        no_ignore = false,
        no_ignore_parent = false,
        hidden = true,
    })
end, {})
vim.keymap.set('n', '<leader>tF', function()
    builtin.find_files({
        no_ignore = true,
        no_ignore_parent = true,
        hidden = true,
    })
end, {})

vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>tG', function()
    builtin.live_grep({
        additional_args = {
            "-u",
        }
    })
end, {})
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>tt', builtin.help_tags, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>tds', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>tws', builtin.lsp_dynamic_workspace_symbols, {})
vim.keymap.set('n', '<leader>t?', builtin.keymaps, {})
vim.keymap.set('n', '<F9>', builtin.lsp_incoming_calls, {})
vim.keymap.set('n', '<F10>', builtin.lsp_outgoing_calls, {})
vim.keymap.set('n', '<F11>', builtin.lsp_references, {})
vim.keymap.set('n', '<F12>', builtin.lsp_definitions, {})

vim.keymap.set("n", "<Leader>tj", builtin.jumplist)
vim.keymap.set("n", "<Leader>ts", builtin.spell_suggest)

vim.keymap.set('n', '<leader>te', extensions.file_browser.file_browser, {})
vim.keymap.set('n', '<leader>tr',
    function() extensions.file_browser.file_browser({ select_buffer = true, path = "%:p:h" }) end, {})
vim.keymap.set('n', '<leader>th', function() extensions.rtfm.rtfm({}) end, {})
vim.keymap.set('n', '<leader>he', extensions.harpoon.marks, {})
vim.keymap.set('n', '<leader>gw', extensions.git_worktree.git_worktrees, {})
vim.keymap.set('n', '<leader>gnw', extensions.git_worktree.create_git_worktree, {})


local fb_actions = require "telescope._extensions.file_browser.actions"
require("telescope").setup {
    defaults = {
        vimgrep_arguments    = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
        },
        prompt_prefix        = "󰱽  ",
        selection_caret      = " ",
        entry_prefix         = "  ",
        initial_mode         = "insert",
        selection_strategy   = "reset",
        sorting_strategy     = "descending",
        layout_strategy      = "horizontal",
        layout_config        = {
            horizontal = {
                mirror = false,
                height = 0.9,
                preview_cutoff = 40,
                prompt_position = "bottom",
                width = 0.9
            },
            vertical = {
                mirror = false,
                height = 0.9,
                preview_cutoff = 10,
                prompt_position = "bottom",
                width = 0.9
            }
        },
        file_sorter          = require 'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {
            ".git/*",
        },
        generic_sorter       = require 'telescope.sorters'.get_generic_fuzzy_sorter,
        winblend             = 0,
        border               = {},
        borderchars          = { "▔", "▕", "▁", "▏", "🭽", "🭾", "🭿", "🭼" },
        color_devicons       = false,
        use_less             = true,
        path_display         = {},
        set_env              = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer       = require 'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer       = require 'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer     = require 'telescope.previewers'.vim_buffer_qflist.new,
        mappings             = {
            i = { ["<F8>"] = trouble.open_with_trouble },
            n = { ["<F8>"] = trouble.open_with_trouble },
        },
    },
    pickers = {
        find_files = {
            prompt_prefix = "󰱽  ",
            hidden        = true,
            no_ignore     = true,
        },
        live_grep = {
            prompt_prefix = "󱎸  ",
        },
    },
    extensions = {
        file_browser = {
            prompt_prefix = "󰥩  ",
            hidden        = true,
            -- dir_icon = "",
            dir_icon_hl   = "Default",
            use_fd        = true,
            display_stat  = {
                date = true,
                size = true,
                mode = false
            },
            hijack_netrw  = false,
            git_status    = true,
            mappings      = {
                ["i"] = {
                    ["<C-n>"] = fb_actions.create,
                    ["<F2>"] = fb_actions.rename,
                    ["<C-x>"] = fb_actions.remove,
                },
                ["n"] = {
                    ["<n>"] = fb_actions.create,
                    ["<F2>"] = fb_actions.rename,
                    ["<x>"] = fb_actions.remove,
                },
            },
        },
    },

}

require("telescope").load_extension("file_browser")
require("telescope").load_extension("rtfm")
require("telescope").load_extension("harpoon")
require("telescope").load_extension("git_worktree")
