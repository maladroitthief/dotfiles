return {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    lazy = true,
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
            end,
            mode = { "n", "v" },
            desc = "conform: format injected languages",
        },
    },
    opts = {
        formatters_by_ft = {
            python = { "ruff_fix", "ruff_format" },
            markdown = { "prettier" },
            sql = { "sqlfmt" },
            yaml = { "prettier" },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
        formatters = {
            prettier = {
                prepend_args = { "--prose-wrap", "always" },
            },
        },
        -- format_on_save = {
        --     -- These options will be passed to conform.format()
        --     timeout_ms = 500,
        --     lsp_format = "fallback",
        -- },
    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
