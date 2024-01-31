-- Default options:
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
            lotus = {},
            all = {
                ui = {
                    bg_gutter = "none"
                }
            }
        },
    },
    overrides = function(colors) -- add/modify highlights
        local theme = colors.theme
        local palette = colors.palette
        return {
            NormalFloat                   = { bg = theme.ui.bg_p1 },
            FloatBorder                   = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            FloatTitle                    = { bg = theme.ui.bg_p1 },
            StatusLine                    = { bg = "none" },
            StatusLineNC                  = { bg = "none" },
            MasonNormal                   = { bg = theme.ui.bg_p1, fg = theme.ui.fg_dim },
            Pmenu                         = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
            PmenuSel                      = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar                     = { bg = theme.ui.bg_m1 },
            PmenuThumb                    = { bg = theme.ui.bg_p2 },
            -- Telescope
            TelescopeTitle                = { fg = palette.autumnRed, bg = "none", bold = true },
            TelescopeSelection            = { fg = palette.autumnGreen },
            TelescopeSelectionCaret       = { fg = palette.roninYellow },
            TelescopeMultiSelection       = { fg = palette.oniViolet },
            TelescopeMatching             = { fg = palette.crystalBlue },
            TelescopePromptPrefix         = { fg = palette.roninYellow },
            TelescopePromptNormal         = { bg = theme.ui.bg_p1 },
            TelescopeResultsNormal        = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            TelescopePreviewNormal        = { bg = theme.ui.bg_dim },
            TelescopePromptBorder         = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            TelescopeResultsBorder        = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
            TelescopePreviewBorder        = { fg = theme.ui.bg_dim, bg = theme.ui.bg_dim },
            -- Markdown
            ["@markup.link.label"]        = { link = "SpecialChar" },
            ["@markup.link.label.symbol"] = { link = "Identifier" },
            ["@markup"]                   = { link = "@none" },
            ["@markup.environment"]       = { link = "Macro" },
            ["@markup.environment.name"]  = { link = "Type" },
            ["@markup.raw"]               = { link = "String" },
            ["@markup.math"]              = { link = "Special" },
            ["@markup.strong"]            = { bold = true },
            ["@markup.emphasis"]          = { italic = true },
            ["@markup.strikethrough"]     = { strikethrough = true },
            ["@markup.underline"]         = { underline = true },
            ["@markup.heading"]           = { link = "Title" },
            ["@markup.link.url"]          = { link = "Underlined" },
            ["@markup.list"]              = { fg = colors.palette.springBlue },
            ["@markup.list.markdown"]     = { fg = colors.palette.surimiOrange, bold = true },
            ["@markup.list.unchecked"]    = { fg = colors.palette.springBlue },
            ["@markup.list.checked"]      = { fg = colors.palette.springGreen },
        }
    end,
    theme = "wave",    -- Load "wave" theme when 'background' option is not set
    background = {     -- map the value of 'background' option to a theme
        dark = "wave", -- try "dragon" !
        light = "lotus"
    },
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
