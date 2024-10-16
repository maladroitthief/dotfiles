return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
    opts = {
        position = "bottom",
        height = 10,
        width = 50,
        mode = "diagnostics",
        severity = nil,
        fold_open = "",
        fold_closed = "",
        group = true,
        padding = true,
        cycle_results = true,
        action_keys = {
            close = "q",
            cancel = "<esc>",
            refresh = "r",
            jump = { "<cr>", "<tab>", "<2-leftmouse>" },
            open_split = { "<c-s>" },
            open_vsplit = { "<c-v>" },
            open_tab = { "<c-t>" },
            jump_close = { "o" },
            toggle_mode = "m",
            switch_severity = "s",
            toggle_preview = "P",
            hover = "<F1>",
            preview = "p",
            open_code_href = "c",
            close_folds = { "zM", "zm" },
            open_folds = { "zR", "zr" },
            toggle_fold = { "zA", "za" },
            previous = "k",
            next = "j",
            help = "?"
        },
        multiline = true,
        indent_lines = true,
        win_config = { border = "single" },
        auto_open = false,
        auto_close = false,
        auto_preview = true,
        auto_fold = false,
        auto_jump = { "lsp_definitions" },
        include_declaration = { "lsp_references", "lsp_implementations", "lsp_definitions" },
        signs = {
            error = "",
            warning = "",
            hint = "",
            information = "",
            other = "",
        },
        use_diagnostic_signs = true
    },
    cmd = "Trouble",
    keys = {
        {
            "<leader>xx",
            function() require("trouble").toggle("diagnostics") end,
            desc = "Trouble: Diagnostics",
        },
        { "<leader>xq",  function() require("trouble").toggle("quickfix") end,             desc = "Trouble: Quickfix", },
        { "<leader>xl",  function() require("trouble").toggle("loclist") end,              desc = "Trouble: LocList", },
        { "<leader>xds", function() require("trouble").toggle("lsp_document_symbols") end, desc = "Trouble: Symbols", },
        { "<leader>xi",  function() require("trouble").toggle("lsp_incoming_calls") end,   desc = "Trouble: Incoming", },
        { "<leader>xo",  function() require("trouble").toggle("lsp_outgoing_calls") end,   desc = "Trouble: Outgoing", },
        { "<leader>xr",  function() require("trouble").toggle("lsp_references") end,       desc = "Trouble: References", },
    },
}
