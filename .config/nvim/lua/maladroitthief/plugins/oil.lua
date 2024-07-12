return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { '<Leader>oo', function() require("oil").open() end, },
        { '<Leader>op', function() require("oil").open_preview() end, },
        { '<Leader>of', function() require("oil").toggle_float() end, },
        { '<Leader>oh', function() require("oil").toggle_hidden() end, },
    },
    config = function()
        require("oil").setup({
            default_file_explorer = false,
            columns = {
                "icon",
            },
            view_options = {
                show_hidden = true,
            },
            keymaps = {
                ["<Leader>ol"] = {
                    desc = "Toggle file detail view",
                    callback = function()
                        detail = not detail
                        if detail then
                            require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
                        else
                            require("oil").set_columns({ "icon" })
                        end
                    end,
                },
            },
        })
    end,
}
