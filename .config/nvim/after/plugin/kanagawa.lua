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
            NormalFloat             = { bg = theme.ui.bg_p1 },
            FloatBorder             = { bg = "none" },
            FloatTitle              = { bg = theme.ui.bg_p1 },
            StatusLine              = { bg = "none" },
            StatusLineNC            = { bg = "none" },
            MasonNormal             = { bg = theme.ui.bg_p1, fg = theme.ui.fg_dim },

            -- Telescope
            TelescopeTitle          = { fg = palette.autumnRed, bg = "none", bold = true },
            TelescopeSelection      = { fg = palette.autumnGreen, gui = bold },
            TelescopeSelectionCaret = { fg = palette.roninYellow },
            TelescopeMultiSelection = { fg = palette.oniViolet },
            TelescopeMatching       = { fg = palette.crystalBlue },
            TelescopePromptPrefix   = { fg = palette.roninYellow },

            TelescopePromptNormal   = { bg = theme.ui.bg_p1 },
            TelescopeResultsNormal  = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            TelescopePreviewNormal  = { bg = theme.ui.bg_dim },

            TelescopePromptBorder   = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            TelescopeResultsBorder  = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
            TelescopePreviewBorder  = { fg = theme.ui.bg_dim, bg = theme.ui.bg_dim },
            -- Notify
            NotifyBackground        = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            NotifyERRORBorder       = { link = "NotifyBackground" },
            NotifyWARNBorder        = { link = "NotifyBackground" },
            NotifyINFOBorder        = { link = "NotifyBackground" },
            NotifyHINTBorder        = { link = "NotifyBackground" },
            NotifyDEBUGBorder       = { link = "NotifyBackground" },
            NotifyTRACEBorder       = { link = "NotifyBackground" },

            NotifyERRORIcon         = { link = "DiagnosticError" },
            NotifyWARNIcon          = { link = "DiagnosticWarn" },
            NotifyINFOIcon          = { link = "DiagnosticInfo" },
            NotifyHINTIcon          = { link = "DiagnosticHint" },
            NotifyDEBUGIcon         = { link = "Debug" },
            NotifyTRACEIcon         = { link = "Comment" },

            NotifyERRORTitle        = { link = "DiagnosticError" },
            NotifyWARNTitle         = { link = "DiagnosticWarn" },
            NotifyINFOTitle         = { link = "DiagnosticInfo" },
            NotifyHINTTitle         = { link = "DiagnosticHint" },
            NotifyDEBUGTitle        = { link = "Debug" },
            NotifyTRACETitle        = { link = "Comment" },

            NotifyERRORBody         = { fg = theme.ui.fg_dim, bg = theme.ui.bg_p1 },
            NotifyWARNBody          = { fg = theme.ui.fg_dim, bg = theme.ui.bg_p1 },
            NotifyINFOBody          = { fg = theme.ui.fg_dim, bg = theme.ui.bg_p1 },
            NotifyHINTBody          = { fg = theme.ui.fg_dim, bg = theme.ui.bg_p1 },
            NotifyDEBUGBody         = { fg = theme.ui.fg_dim, bg = theme.ui.bg_p1 },
            NotifyTRACEBody         = { fg = theme.ui.fg_dim, bg = theme.ui.bg_p1 },
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
