return {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        "kevinhwang91/promise-async",
        'luukvbaal/statuscol.nvim'
    },
    event = "UIEnter",
    keys = {
        { "zm", function() require("ufo").closeAllFolds() end,         desc = "ufo: close all folds" },
        {
            "zr",
            function()
                require("ufo").openFoldsExceptKinds { "comment", "imports" }
                vim.opt.scrolloff = vim.g.baseScrolloff -- fix scrolloff setting sometimes being off
            end,
            desc = "ufo: open all regular folds"
        },
        { "zR", function() require("ufo").openFoldsExceptKinds {} end, desc = "ufo: open all folds" },
        { "z1", function() require("ufo").closeFoldsWith(1) end,       desc = "ufo: close l1 folds" },
        { "z2", function() require("ufo").closeFoldsWith(2) end,       desc = "ufo: close l2 folds" },
        { "z3", function() require("ufo").closeFoldsWith(3) end,       desc = "ufo: close l3 folds" },
        { "z4", function() require("ufo").closeFoldsWith(4) end,       desc = "ufo: close l4 folds" },
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
            local lspWithOutFolding = { "markdown", "sh", "css", "go", "html", "python", "json", "yaml" }
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
