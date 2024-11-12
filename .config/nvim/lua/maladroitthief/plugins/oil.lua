return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { '<Leader>oo', function() require("oil").open() end,          desc = "oil: open" },
        { '<Leader>op', function() require("oil").open_preview() end,  desc = "oil: open preview" },
        { '<Leader>of', function() require("oil").toggle_float() end,  desc = "oil: toggle float" },
        { '<Leader>oh', function() require("oil").toggle_hidden() end, desc = "oil: toggle hidden" },
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
                    desc = "oil: toggle file details",
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
