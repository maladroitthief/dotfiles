require("notify").setup({
    render = "wrapped-compact",
    timeout = 2000,
    stages = "static",
    on_open = function(win)
        vim.api.nvim_win_set_config(win, {
            border = {
                { "🭽", "FloatBorder" },
                { "▔", "FloatBorder" },
                { "🭾", "FloatBorder" },
                { "▕", "FloatBorder" },
                { "🭿", "FloatBorder" },
                { "▁", "FloatBorder" },
                { "🭼", "FloatBorder" },
                { "▏", "FloatBorder" },
            }
        })
    end,
})
