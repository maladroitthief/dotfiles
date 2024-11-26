return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
        'maladroitthief/telescope-rtfm.nvim',
        "ThePrimeagen/harpoon",
        "ThePrimeagen/git-worktree.nvim",
        "folke/todo-comments.nvim",
    },
    config = function()
        local builtin = require('telescope.builtin')
        local extensions = require('telescope').extensions
        local trouble = require("trouble.sources.telescope")

        local open_with_trouble = trouble.open
        local add_to_trouble = trouble.add

        vim.keymap.set('n', '<leader>tf', function()
            builtin.find_files({
                no_ignore = false,
                no_ignore_parent = false,
                hidden = true,
            })
        end, { desc = "telescope: find files" })
        vim.keymap.set('n', '<leader>tF', function()
            builtin.find_files({
                no_ignore = true,
                no_ignore_parent = true,
                hidden = true,
            })
        end, { desc = "telescope: find files, no ignore" })

        vim.keymap.set('n', '<leader>tg', builtin.live_grep, { desc = "telescope: grep files" })
        vim.keymap.set('n', '<leader>tG', function()
            builtin.live_grep({
                additional_args = {
                    "-u",
                }
            })
        end, { desc = "telescope: grep files, no ignore" })
        vim.keymap.set('n', '<leader>tb', builtin.buffers, { desc = "telescope: buffers" })
        vim.keymap.set('n', '<leader>tt', builtin.help_tags, { desc = "telescope: help" })
        vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = "telescope: git status" })
        vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = "telescope: git branches" })
        vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = "telescope: git commits" })
        vim.keymap.set('n', '<leader>tds', builtin.lsp_document_symbols, { desc = "telescope: document symbols" })
        vim.keymap.set('n', '<leader>tws', builtin.lsp_dynamic_workspace_symbols,
            { desc = "telescope: workspace symbols" })
        vim.keymap.set('n', '<leader>t?', builtin.keymaps, { desc = "telescope: keymaps" })
        vim.keymap.set('n', '<F9>', builtin.lsp_incoming_calls, { desc = "telescope: incoming calls" })
        vim.keymap.set('n', '<F10>', builtin.lsp_outgoing_calls, { desc = "telescope: outgoing calls" })
        vim.keymap.set('n', '<F11>', builtin.lsp_references, { desc = "telescope: references" })
        vim.keymap.set('n', '<F12>', builtin.lsp_definitions, { desc = "telescope: definitions" })

        vim.keymap.set("n", "<Leader>tj", builtin.jumplist, { desc = "telescope: jumplist" })
        vim.keymap.set("n", "<Leader>ts", builtin.spell_suggest, { desc = "telescope: spelling suggest" })

        vim.keymap.set('n', '<leader>tr', builtin.registers, { desc = "telescope: registers" })
        vim.keymap.set('n', '<leader>th', function() extensions.rtfm.rtfm({}) end, { desc = "telescope: rtfm" })
        vim.keymap.set('n', '<leader>he', extensions.harpoon.marks, { desc = "telescope: harpoon" })
        vim.keymap.set('n', '<leader>gw', extensions.git_worktree.git_worktrees, { desc = "telescope: git worktrees" })
        vim.keymap.set('n', '<leader>gaw', extensions.git_worktree.create_git_worktree,
            { desc = "telescope: git add worktree" })
        vim.keymap.set('n', '<leader>to', "<cmd>TodoTelescope<cr>", { desc = "telescope: todo" })

        require("telescope").setup {
            defaults = {
                mappings             = {
                    i = {
                        ["<C-t>"] = open_with_trouble,
                        ["<C-a>"] = add_to_trouble,
                    },
                    n = {
                        ["<C-t>"] = open_with_trouble,
                        ["<C-a>"] = add_to_trouble,
                    },
                },
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
                buffers = {
                    mappings = {
                        i = {
                            ["<C-t>"] = open_with_trouble,
                            ["<C-a>"] = add_to_trouble,
                        },
                        n = {
                            ["<C-t>"] = open_with_trouble,
                            ["<C-a>"] = add_to_trouble,
                            ["dd"] = "delete_buffer",
                        },
                    },
                }
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
                },
            },

        }
    end
}
