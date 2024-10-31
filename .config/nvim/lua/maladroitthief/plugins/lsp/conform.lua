return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            python = { "ruff_fix", "ruff_format" },
            markdown = { "deno_fmt" },
        },
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },
}
