return {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.black.with({
                    extra_args = {
                        "--line-length",
                        "100",
                    },
                }),
                null_ls.builtins.formatting.deno_fmt,
                null_ls.builtins.formatting.shellharden,
                null_ls.builtins.code_actions.gomodifytags,
            },
        })
    end
}
