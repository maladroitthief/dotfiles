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
    dimInactive = true,    -- dim inactive window `:h hl-NormalNC`
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
    colors = {             -- add/modify theme and palette colors
        palette = {},
        theme = {
            wave = {},
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
            NormalFloat             = { bg = "none" },
            FloatBorder             = { bg = "none" },
            FloatTitle              = { bg = "none" },
            StatusLine              = { bg = "none" },
            StatusLineNC            = { bg = "none" },
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
