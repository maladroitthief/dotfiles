local palette = {
	-- Bg Shades
	sumiInk0 = "#16161D",
	sumiInk1 = "#181820",
	sumiInk2 = "#1a1a22",
	sumiInk3 = "#1F1F28",
	sumiInk4 = "#2A2A37",
	sumiInk5 = "#363646",
	sumiInk6 = "#54546D",

	-- Popup and Floats
	waveBlue1 = "#223249",
	waveBlue2 = "#2D4F67",

	-- Diff and Git
	winterGreen = "#2B3328",
	winterYellow = "#49443C",
	winterRed = "#43242B",
	winterBlue = "#252535",
	autumnGreen = "#76946A",
	autumnRed = "#C34043",
	autumnYellow = "#DCA561",

	-- Diag
	samuraiRed = "#E82424",
	roninYellow = "#FF9E3B",
	waveAqua1 = "#6A9589",
	dragonBlue = "#658594",

	-- Fg and Comments
	oldWhite = "#C8C093",
	fujiWhite = "#DCD7BA",
	fujiGray = "#727169",

	oniViolet = "#957FB8",
	oniViolet2 = "#b8b4d0",
	crystalBlue = "#7E9CD8",
	springViolet1 = "#938AA9",
	springViolet2 = "#9CABCA",
	springBlue = "#7FB4CA",
	lightBlue = "#A3D4D5",
	waveAqua2 = "#7AA89F",
	waveAqua4 = "#7AA880",
	waveAqua5 = "#6CAF95",
	waveAqua3 = "#68AD99",

	springGreen = "#98BB6C",
	boatYellow1 = "#938056",
	boatYellow2 = "#C0A36E",
	carpYellow = "#E6C384",

	sakuraPink = "#D27E99",
	waveRed = "#E46876",
	peachRed = "#FF5D62",
	surimiOrange = "#FFA066",
	katanaGray = "#717C7C",

	dragonBlack0 = "#0d0c0c",
	dragonBlack1 = "#12120f",
	dragonBlack2 = "#1D1C19",
	dragonBlack3 = "#181616",
	dragonBlack4 = "#282727",
	dragonBlack5 = "#393836",
	dragonBlack6 = "#625e5a",

	dragonWhite = "#c5c9c5",
	dragonGreen = "#87a987",
	dragonGreen2 = "#8a9a7b",
	dragonPink = "#a292a3",
	dragonOrange = "#b6927b",
	dragonOrange2 = "#b98d7b",
	dragonGray = "#a6a69c",
	dragonGray2 = "#9e9b93",
	dragonGray3 = "#7a8382",
	dragonBlue2 = "#8ba4b0",
	dragonViolet = "#8992a7",
	dragonRed = "#c4746e",
	dragonAqua = "#8ea4a2",
	dragonAsh = "#737c73",
	dragonTeal = "#949fb5",
	dragonYellow = "#c4b28a",

	lotusInk1 = "#545464",
	lotusInk2 = "#43436c",
	lotusGray = "#dcd7ba",
	lotusGray2 = "#716e61",
	lotusGray3 = "#8a8980",
	lotusWhite0 = "#d5cea3",
	lotusWhite1 = "#dcd5ac",
	lotusWhite2 = "#e5ddb0",
	lotusWhite3 = "#f2ecbc",
	lotusWhite4 = "#e7dba0",
	lotusWhite5 = "#e4d794",
	lotusViolet1 = "#a09cac",
	lotusViolet2 = "#766b90",
	lotusViolet3 = "#c9cbd1",
	lotusViolet4 = "#624c83",
	lotusBlue1 = "#c7d7e0",
	lotusBlue2 = "#b5cbd2",
	lotusBlue3 = "#9fb5c9",
	lotusBlue4 = "#4d699b",
	lotusBlue5 = "#5d57a3",
	lotusGreen = "#6f894e",
	lotusGreen2 = "#6e915f",
	lotusGreen3 = "#b7d0ae",
	lotusPink = "#b35b79",
	lotusOrange = "#cc6d00",
	lotusOrange2 = "#e98a00",
	lotusYellow = "#77713f",
	lotusYellow2 = "#836f4a",
	lotusYellow3 = "#de9800",
	lotusYellow4 = "#f9d791",
	lotusRed = "#c84053",
	lotusRed2 = "#d7474b",
	lotusRed3 = "#e82424",
	lotusRed4 = "#d9a594",
	lotusAqua = "#597b75",
	lotusAqua2 = "#5e857a",
	lotusTeal1 = "#4e8ca2",
	lotusTeal2 = "#6693bf",
	lotusTeal3 = "#5a7785",
	lotusCyan = "#d7e3d8",
}
local highlight = palette.peachRed

return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = true, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				background = {
					dark = "wave",
					light = "wave",
				},
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = {
						wave = {
							ui = {
								bg_gutter = "none",
								fg_reverse = highlight,
								bg_search = highlight,
								bg_visual = palette.waveBlue2,
								pmenu = {
									fg = palette.fujiWhite,
									fg_sel = "none",
									bg_sel = highlight,
									bg_thumb = highlight,
									bg = palette.waveBlue2,
									bg_sbar = palette.waveBlue2,
								},
							},
							syn = {
								number = highlight,
								operator = highlight,
								preproc = highlight,
								deprecated = palette.lotusGray3,
								comment = palette.lotusGray3,
								special2 = palette.lotusWhite5,
								punct = palette.lotusWhite5,
								fun = palette.lotusWhite5,
								type = palette.lotusWhite4,
								keyword = palette.lotusWhite4,
								constant = palette.lotusWhite3,
								special1 = palette.lotusWhite3,
								variable = palette.lotusWhite2,
								statement = palette.lotusWhite2,
								regex = palette.lotusWhite1,
								string = palette.lotusWhite1,
								identifier = palette.lotusWhite0,
								parameter = palette.lotusWhite0,
								special3 = palette.fujiWhite,
							},
						},
					},
				},
				overrides = function(colors) -- add/modify highlights
					return {
						NormalFloat = { bg = "none" },
						FloatBorder = { fg = colors.theme.ui.float.fg_border, bg = "none" },
						FloatTitle = { bg = "none" },
						StatusLine = { fg = colors.theme.ui.special, bg = colors.theme.ui.bg_p1 },
						StatusLineNC = { bg = colors.theme.ui.bg_dim },
						MsgArea = { bg = colors.theme.ui.bg_p1 },
						Pmenu = { fg = colors.theme.ui.pmenu.fg, bg = colors.theme.ui.pmenu.bg },
						PmenuSel = { fg = colors.theme.ui.pmenu.fg_sel, bg = colors.theme.ui.pmenu.bg_sel },
						PmenuSbar = { bg = colors.theme.ui.pmenu.bg_sbar },
						PmenuThumb = { bg = colors.theme.ui.pmenu.bg_thumb },
						DiagnosticSignOk = { fg = colors.theme.diag.ok }, -- PERF:
						DiagnosticError = { fg = colors.theme.diag.error }, -- FIX:
						DiagnosticWarn = { fg = colors.theme.diag.warning }, -- WARN:
						DiagnosticInfo = { fg = colors.theme.diag.info }, -- NOTE:
						DiagnosticHint = { fg = colors.theme.diag.hint }, -- TODO:
						["@markup.link.label"] = { link = "SpecialChar" },
						["@markup.link.label.symbol"] = { link = "Identifier" },
						["@markup"] = { link = "@none" },
						["@markup.environment"] = { link = "Macro" },
						["@markup.environment.name"] = { link = "Type" },
						["@markup.raw"] = { link = "String" },
						["@markup.math"] = { link = "Special" },
						["@markup.strong"] = { bold = true },
						["@markup.emphasis"] = { italic = true },
						["@markup.strikethrough"] = { strikethrough = true },
						["@markup.underline"] = { underline = true },
						["@markup.heading.1.markdown"] = { bold = true, fg = colors.theme.syn.special2 },
						["@markup.heading.2.markdown"] = { bold = true, fg = colors.theme.syn.identifier },
						["@markup.heading.3.markdown"] = { bold = true, fg = colors.theme.syn.fun },
						["@markup.heading.4.markdown"] = { bold = true, fg = colors.theme.syn.string },
						["@markup.heading.5.markdown"] = { bold = true, fg = colors.theme.syn.keyword },
						["@markup.heading.6.markdown"] = { bold = true, fg = colors.theme.syn.constant },
						["@markup.link.url"] = { link = "Underlined" },
						["@markup.list"] = { fg = colors.theme.syn.fun },
						["@markup.list.markdown"] = { fg = colors.theme.syn.constant, bold = true },
						["@markup.list.unchecked"] = { fg = colors.theme.syn.fun },
						["@markup.list.checked"] = { fg = colors.theme.syn.string },
						["@markup.spell"] = { undercurl = true, underline = false, sp = colors.theme.diag.error },
						["@comment.warning"] = { bg = "none", fg = colors.theme.diag.warning },
						["@comment.todo"] = { bg = "none", fg = colors.theme.diag.hint },
						["@comment.note"] = { bg = "none", fg = colors.theme.diag.info },
						["@comment.error"] = { bg = "none", fg = colors.theme.diag.error },
						zshTodo = { bg = "none", fg = colors.theme.diag.hint },
						Search = { bg = "none", bold = true, fg = colors.theme.ui.bg_search },
						IncSearch = { bg = colors.theme.ui.bg_search, bold = true, fg = colors.theme.ui.fg },
						CurSearch = { bg = colors.theme.ui.bg_search, bold = true, fg = colors.theme.ui.fg },
						Folded = { fg = colors.theme.ui.special, bg = "none", underdashed = true },
					}
				end,
			})

			-- setup must be called before loading
			vim.cmd("colorscheme kanagawa")
		end,
	},
}
