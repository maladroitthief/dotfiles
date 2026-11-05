return {
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
		config = function()
			require("kanagawa").setup({
				compile = false,
				undercurl = true,
				commentStyle = { italic = false },
				functionStyle = {},
				keywordStyle = { italic = false },
				statementStyle = { bold = false },
				typeStyle = {},
				transparent = true,
				dimInactive = false,
				terminalColors = true,
				background = {
					dark = "dragon",
					light = "dragon",
				},
				overrides = function(colors) -- add/modify highlights
					return {
						NormalFloat = { bg = "none" },
						FloatBorder = { fg = colors.theme.ui.float.fg_border, bg = "none" },
						FloatTitle = { bg = "none" },
						StatusLine = { fg = highlight, bg = colors.theme.ui.bg_p1 },
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
						IncSearch = { bg = colors.theme.ui.bg_search, bold = true, fg = fade0 },
						CurSearch = { bg = colors.theme.ui.bg_search, bold = true, fg = fade0 },
						Folded = { fg = colors.theme.ui.special, bg = "none", underdashed = true },
					}
				end,
			})

			-- setup must be called before loading
			-- vim.cmd("colorscheme kanagawa")
		end,
	},
}
