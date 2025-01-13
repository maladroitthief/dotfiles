return {
    "neovim/nvim-lspconfig",
    enabled = false,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
        local lspconfig = require('lspconfig')
        local lsp_defaults = lspconfig.util.default_config
        local border = {
            { "🭽", "FloatBorder" },
            { "▔", "FloatBorder" },
            { "🭾", "FloatBorder" },
            { "▕", "FloatBorder" },
            { "🭿", "FloatBorder" },
            { "▁", "FloatBorder" },
            { "🭼", "FloatBorder" },
            { "▏", "FloatBorder" },
        }
        -------------------------------------------------------------------------------
        lsp_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lsp_defaults.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
        )
        -------------------------------------------------------------------------------
        local signs = {
            Error = '',
            Warn = '',
            Hint = '',
            Info = '',
        }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end
        -------------------------------------------------------------------------------
        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                vim.keymap.set("n", "<F1>", function() vim.lsp.buf.hover() end,
                    { buffer = event.buf, desc = "LSP: hover" })
                vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end,
                    { buffer = event.buf, desc = "LSP: rename" })
                vim.keymap.set("i", "<F1>", function() vim.lsp.buf.signature_help() end,
                    { buffer = event.buf, desc = "LSP: signature help" })
                vim.keymap.set("n", "<F4>", function() vim.diagnostic.open_float() end,
                    { buffer = event.buf, desc = "LSP: open float" })
                vim.keymap.set('n', '<F5>', function()
                    require("conform").format({ async = true, lsp_format = "fallback" })
                    -- vim.lsp.buf.format { async = true }
                end, { buffer = event.buf, desc = "LSP: format" })
                vim.keymap.set("n", "<F6>", function() vim.lsp.buf.code_action() end,
                    { buffer = event.buf, desc = "LSP: code action" })
                vim.diagnostic.enable(event.buf)
            end
        })
        -------------------------------------------------------------------------------
        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })

        local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or border
            opts.max_width = opts.max_width or 80
            return orig_util_open_floating_preview(contents, syntax, opts, ...)
        end

        -------------------------------------------------------------------------------
        lspconfig.ruff.setup({})
        lspconfig.pyright.setup({
            before_init = function(_, config)
                config.settings.python.analysis.stubPath = vim.fs.joinpath(vim.fn.stdpath "data", "lazy",
                    "python-type-stubs")
            end,
        })
        lspconfig.gopls.setup({})
        lspconfig.rust_analyzer.setup({})
        lspconfig.solargraph.setup({})
        lspconfig.jsonls.setup({})
        lspconfig.sqlls.setup({})
        lspconfig.docker_compose_language_service.setup({})
        lspconfig.dockerls.setup({})
        lspconfig.ansiblels.setup({})
        lspconfig.marksman.setup({})
        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {
                            "vim"
                        }
                    }
                }
            }
        })
        lspconfig.yamlls.setup({})
        lspconfig.cssls.setup({})
        lspconfig.ts_ls.setup({})
        lspconfig.eslint.setup({})
        lspconfig.html.setup({})
        lspconfig.terraformls.setup({
            filetypes = { "terraform" }
        })
        lspconfig.clangd.setup({})
        lspconfig.zls.setup({})
        -------------------------------------------------------------------------------
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.go",
            callback = function()
                local params = vim.lsp.util.make_range_params()
                params.context = { only = { "source.organizeImports" } }
                -- buf_request_sync defaults to a 1000ms timeout. Depending on your
                -- machine and codebase, you may want longer. Add an additional
                -- argument after params if you find that you have to write the file
                -- twice for changes to be saved.
                -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
                local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
                for cid, res in pairs(result or {}) do
                    for _, r in pairs(res.result or {}) do
                        if r.edit then
                            local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                            vim.lsp.util.apply_workspace_edit(r.edit, enc)
                        end
                    end
                end
                vim.lsp.buf.format({ async = false })
            end
        })
    end,
}
