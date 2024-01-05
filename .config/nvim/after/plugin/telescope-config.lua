local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>tp', ':Telescope find_files find_command=rg,--ignore,--hidden,--files <CR>')
vim.keymap.set('n', '<leader>tf', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>te', ':Telescope file_browser<CR>')
vim.keymap.set('n', '<leader>tr', ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
vim.keymap.set('n', '<leader>th', ':Telescope rtfm<CR>')
vim.keymap.set('n', '<leader>gs', ':Telescope git_status<CR>')
vim.keymap.set('n', '<leader>gb', ':Telescope git_branches<CR>')
vim.keymap.set('n', '<leader>gc', ':Telescope git_commits<CR>')
vim.keymap.set('n', '<leader>tds', ':Telescope lsp_document_symbols<CR>')
vim.keymap.set('n', '<leader>tws', ':Telescope lsp_dynamic_workspace_symbols<CR>')
vim.keymap.set('n', '<F8>', ':Telescope diagnostics<CR>')
vim.keymap.set('n', '<F9>', ':Telescope lsp_incoming_calls<CR>')
vim.keymap.set('n', '<F10>', ':Telescope lsp_outgoing_calls<CR>')
vim.keymap.set('n', '<F11>', ':Telescope lsp_references<CR>')
vim.keymap.set('n', '<F12>', ':Telescope lsp_definitions<CR>')

vim.keymap.set("n", "<Leader>tj", builtin.jumplist)
vim.keymap.set("n", "<Leader>ts", builtin.spell_suggest)

local fb_actions = require "telescope._extensions.file_browser.actions"
require("telescope").setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
        },
    },
    extensions = {
        file_browser = {
            hidden = true,
            dir_icon = ">",
            dir_icon_hl = "Default",
            use_fd = true,
            display_stat = {
                date = true,
                size = true,
                mode = false
            },
            hijack_netrw = false,
            git_status = true,
            mappings = {
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

require("telescope").load_extension "file_browser"
require("telescope").load_extension "rtfm"
