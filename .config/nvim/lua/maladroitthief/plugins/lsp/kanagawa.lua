return {
    "rebelot/kanagawa.nvim",
    config = function()
        require('kanagawa').setup({
            compile = false,  -- enable compiling the colorscheme
            undercurl = true, -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = true,    -- do not set background color
            dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
            terminalColors = true, -- define vim.g.terminal_color_{0,17}
            colors = {             -- add/modify theme and palette colors
                palette = {},
                theme = {
                    wave = {},
                    dragon = {},
                    lotus = {
                        syn = {
                            string     = "#98BB6C",
                            variable   = "none",
                            number     = "#b35b79",
                            constant   = "#cc6d00",
                            identifier = "#545464",
                            parameter  = "#5d57a3",
                            fun        = "#4d699b",
                            statement  = "#624c83",
                            keyword    = "#624c83",
                            operator   = "#43436c",
                            preproc    = "#c84053",
                            type       = "#597b75",
                            regex      = "#e98a00",
                            deprecated = "#8a8980",
                            comment    = "#8a8980",
                            punct      = "#4e8ca2",
                            special1   = "#6693bf",
                            special2   = "#c84053",
                            special3   = "#c84053",
                        },
                    },
                    all = {
                        ui = {
                            bg_gutter = "none"
                        }
                    }
                },
            },
            background = {
                dark = "wave",
                light = "wave"
            },
            overrides = function(colors) -- add/modify highlights
                local theme = colors.theme
                local palette = colors.palette
                return {
                    NormalFloat                    = { bg = theme.ui.float.bg },
                    FloatBorder                    = { fg = theme.ui.float.bg_border, bg = theme.ui.float.bg_border },
                    FloatTitle                     = { bg = theme.ui.float.bg },
                    StatusLine                     = { bg = "none" },
                    StatusLineNC                   = { bg = "none" },
                    MasonNormal                    = { fg = theme.ui.float.fg, bg = theme.ui.float.bg },
                    Pmenu                          = { fg = theme.ui.pmenu.fg, bg = theme.ui.pmenu.bg },
                    PmenuSel                       = { fg = theme.ui.pmenu.fg_sel, bg = theme.ui.pmenu.bg_sel },
                    PmenuSbar                      = { bg = theme.ui.pmenu.bg_sbar },
                    PmenuThumb                     = { bg = theme.ui.pmenu.bg_thumb },
                    -- Telescope
                    TelescopeTitle                 = { fg = theme.ui.special, bg = "none", bold = true },
                    TelescopeSelection             = { fg = theme.ui.fg, bg = theme.ui.bg_p2 },
                    TelescopeSelectionCaret        = { fg = theme.ui.bg_special },
                    TelescopeMultiSelection        = { fg = theme.ui.bg_visual },
                    TelescopeMatching              = { bg = theme.ui.bg_search },
                    TelescopePromptPrefix          = { fg = theme.ui.fg },
                    TelescopePromptNormal          = { bg = theme.ui.bg_p1 },
                    TelescopeResultsNormal         = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
                    TelescopePreviewNormal         = { bg = theme.ui.bg_dim },
                    TelescopePromptBorder          = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                    TelescopeResultsBorder         = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
                    TelescopePreviewBorder         = { fg = theme.ui.bg_dim, bg = theme.ui.bg_dim },
                    -- todo comments
                    DiagnosticSignOk               = { fg = palette.oniViolet },
                    DiagnosticError                = { fg = palette.autumnRed },
                    DiagnosticWarn                 = { fg = palette.autumnYellow },
                    DiagnosticInfo                 = { fg = palette.autumnGreen },
                    DiagnosticHint                 = { fg = palette.crystalBlue },
                    -- Treesitter
                    ["@markup.link.label"]         = { link = "SpecialChar" },
                    ["@markup.link.label.symbol"]  = { link = "Identifier" },
                    ["@markup"]                    = { link = "@none" },
                    ["@markup.environment"]        = { link = "Macro" },
                    ["@markup.environment.name"]   = { link = "Type" },
                    ["@markup.raw"]                = { link = "String" },
                    ["@markup.math"]               = { link = "Special" },
                    ["@markup.strong"]             = { bold = true },
                    ["@markup.emphasis"]           = { italic = true },
                    ["@markup.strikethrough"]      = { strikethrough = true },
                    ["@markup.underline"]          = { underline = true },
                    ["@markup.heading.1.markdown"] = { bold = true, fg = colors.theme.syn.special2 },
                    ["@markup.heading.2.markdown"] = { bold = true, fg = colors.theme.syn.identifier },
                    ["@markup.heading.3.markdown"] = { bold = true, fg = colors.theme.syn.fun },
                    ["@markup.heading.4.markdown"] = { bold = true, fg = colors.theme.syn.string },
                    ["@markup.heading.5.markdown"] = { bold = true, fg = colors.theme.syn.keyword },
                    ["@markup.heading.6.markdown"] = { bold = true, fg = colors.theme.syn.constant },
                    ["@markup.link.url"]           = { link = "Underlined" },
                    ["@markup.list"]               = { fg = colors.theme.syn.fun },
                    ["@markup.list.markdown"]      = { fg = colors.theme.syn.constant, bold = true },
                    ["@markup.list.unchecked"]     = { fg = colors.theme.syn.fun },
                    ["@markup.list.checked"]       = { fg = colors.theme.syn.string },
                    ["@markup.spell"]              = { undercurl = true, underline = false, sp = theme.diag.error },
                    ["@comment.warning"]           = { bg = "none", fg = palette.autumnYellow },
                    ["@comment.todo"]              = { bg = "none", fg = palette.crystalBlue },
                    ["@comment.note"]              = { bg = "none", fg = palette.autumnGreen },
                    ["@comment.error"]             = { bg = "none", fg = palette.autumnRed },
                    zshTodo                        = { bg = "none", fg = palette.crystalBlue },
                    Search                         = { bg = "none", bold = true, fg = palette.autumnRed },
                    IncSearch                      = { bg = "none", bold = true, fg = palette.surimiOrange },
                    CurSearch                      = { bg = "none", bold = true, fg = palette.surimiOrange },
                    Folded                         = { fg = palette.springViolet2, bg = "none", underdashed = true },
                }
            end,
        })

        -- setup must be called before loading
        vim.cmd("colorscheme kanagawa")
    end,
}
