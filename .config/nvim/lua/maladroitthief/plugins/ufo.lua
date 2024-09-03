return {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        "kevinhwang91/promise-async",
        'luukvbaal/statuscol.nvim'
    },
    event = "UIEnter",
    keys = {
        { "zm", function() require("ufo").closeAllFolds() end, desc = "󱃄 Close All Folds" },
        {
            "zr",
            function()
                require("ufo").openFoldsExceptKinds { "comment", "imports" }
                vim.opt.scrolloff = vim.g.baseScrolloff -- fix scrolloff setting sometimes being off
            end,
            desc = "󱃄 Open All Regular Folds"
        },
        { "zR", function() require("ufo").openFoldsExceptKinds {} end, desc = "󱃄 Open All Folds" },
        { "z1", function() require("ufo").closeFoldsWith(1) end, desc = "󱃄 Close L1 Folds" },
        { "z2", function() require("ufo").closeFoldsWith(2) end, desc = "󱃄 Close L2 Folds" },
        { "z3", function() require("ufo").closeFoldsWith(3) end, desc = "󱃄 Close L3 Folds" },
        { "z4", function() require("ufo").closeFoldsWith(4) end, desc = "󱃄 Close L4 Folds" },
    },
    init = function()
        -- INFO fold commands usually change the foldlevel, which fixes folds, e.g.
        -- auto-closing them after leaving insert mode, however ufo does not seem to
        -- have equivalents for zr and zm because there is no saved fold level.
        -- Consequently, the vim-internal fold levels need to be disabled by setting
        -- them to 99.
        -- vim.opt.foldcolumn = '1'
        vim.opt.foldlevel = 99
        vim.opt.foldlevelstart = 99
    end,
    opts = {
        provider_selector = function(_, ft, _)
            -- INFO some filetypes only allow indent, some only LSP, some only
            -- treesitter. However, ufo only accepts two kinds as priority,
            -- therefore making this function necessary :/
            local lspWithOutFolding = { "markdown", "sh", "css", "html", "python", "json" }
            if vim.tbl_contains(lspWithOutFolding, ft) then return { "treesitter", "indent" } end
            return { "lsp", "indent" }
        end,
        -- when opening the buffer, close these fold kinds
        -- use `:UfoInspect` to get available fold kinds from the LSP
        close_fold_kinds_for_ft = {
            default = { "imports", "comment" },
        },
        open_fold_hl_timeout = 800,
        fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
            local hlgroup = "NonText"
            local newVirtText = {}
            local suffix = "   " .. tostring(endLnum - lnum)
            local sufWidth = vim.fn.strdisplaywidth(suffix)
            local targetWidth = width - sufWidth
            local curWidth = 0
            for _, chunk in ipairs(virtText) do
                local chunkText = chunk[1]
                local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                if targetWidth > curWidth + chunkWidth then
                    table.insert(newVirtText, chunk)
                else
                    chunkText = truncate(chunkText, targetWidth - curWidth)
                    local hlGroup = chunk[2]
                    table.insert(newVirtText, { chunkText, hlGroup })
                    chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    if curWidth + chunkWidth < targetWidth then
                        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
                    end
                    break
                end
                curWidth = curWidth + chunkWidth
            end
            table.insert(newVirtText, { suffix, hlgroup })
            return newVirtText
        end,
    },
}

-- return {
--     'kevinhwang91/nvim-ufo',
--     dependencies = {
--         'kevinhwang91/promise-async',
--         'luukvbaal/statuscol.nvim'
--     },
--     config = function()
--         vim.o.foldcolumn = '1' -- '0' is not bad
--         vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
--         vim.o.foldlevelstart = 99
--         vim.o.foldenable = true
--         vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

--         -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
--         vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
--         vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

--         -- Tell the server the capability of foldingRange,
--         -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
--         local capabilities = vim.lsp.protocol.make_client_capabilities()
--         capabilities.textDocument.foldingRange = {
--             dynamicRegistration = false,
--             lineFoldingOnly = true
--         }
--         local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
--         for _, ls in ipairs(language_servers) do
--             require('lspconfig')[ls].setup({
--                 capabilities = capabilities
--                 -- you can add other fields for setting up lsp server in this table
--             })
--         end

--         local builtin = require("statuscol.builtin")
--         -- require("statuscol").setup({
--         --     segments = {
--         --         { text = { "%s" },             click = "v:lua.ScSa" },
--         --         { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
--         --         {
--         --             text = { " ", builtin.foldfunc, " " },
--         --             condition = { builtin.not_empty, true, builtin.not_empty },
--         --             click = "v:lua.ScFa"
--         --         },
--         --     }
--         -- })
--         require("statuscol").setup({
--             relculright = true,
--             segments = {
--                 { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
--                 { text = { "%s" },                  click = "v:lua.ScSa" },
--                 { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
--             },
--         })
--     end,
--     opts = {},
-- }
