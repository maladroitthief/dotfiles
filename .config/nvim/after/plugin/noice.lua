require("noice").setup({
    views = {
        cmdline_popup = {
            border = {
                style = "none",
                padding = { 1, 2 },
            },
            filter_options = {},
            win_options = {
                winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            },
        },
        mini = {
            winhighlight = {},
        },
        hover = {
            border = 'rounded',
            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
            zindex = 1001,
            scrolloff = 0,
            col_offset = 0,
            side_padding = 1,
        },
        popup = {
            border = {
                style = "none",
                padding = { 1, 2 },
            },
        },
    },
    lsp = {
        hover = {
            view = "hover",
        },
        override = {
            -- override the default lsp markdown formatter with Noice
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            -- override the lsp markdown formatter with Noice
            ["vim.lsp.util.stylize_markdown"] = true,
            -- override cmp documentation with Noice (needs the other options to work)
            ["cmp.entry.get_documentation"] = true,
        },
    },
    presets = {
        -- bottom_search = true,         -- use a classic bottom cmdline for search
        -- command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
    },
})
