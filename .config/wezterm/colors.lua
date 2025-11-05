local M = {}

function M.kanagawa(config)
	config.force_reverse_video_cursor = true
	config.colors = {
		foreground = "#dcd7ba",
		background = "#1f1f28",

		cursor_bg = "#c8c093",
		cursor_fg = "#c8c093",
		cursor_border = "#c8c093",

		selection_fg = "#c8c093",
		selection_bg = "#2d4f67",

		scrollbar_thumb = "#16161d",
		split = "#16161d",

		tab_bar = {
			background = "#16161D",
			active_tab = {
				fg_color = "#FFA066",
				bg_color = "#2A2A37",
				intensity = "Bold",
			},
			inactive_tab = {
				fg_color = "#C8C093",
				bg_color = "#16161d",
			},
			inactive_tab_hover = {
				fg_color = "#dcd7ba",
				bg_color = "#16161d",
				intensity = "Normal",
			},
			new_tab = {
				fg_color = "#C8C093",
				bg_color = "#16161d",
			},
			new_tab_hover = {
				fg_color = "#dcd7ba",
				bg_color = "#16161d",
			},
		},

		ansi = {
			"#090618",
			"#c34043",
			"#76946a",
			"#c0a36e",
			"#7e9cd8",
			"#957fb8",
			"#6a9589",
			"#c8c093",
		},
		brights = {
			"#727169",
			"#e82424",
			"#98bb6c",
			"#e6c384",
			"#7fb4ca",
			"#938aa9",
			"#7aa89f",
			"#dcd7ba",
		},
		indexed = {
			[16] = "#ffa066",
			[17] = "#ff5d62",
		},
		compose_cursor = "#ffa066",

		visual_bell = "#dcd7ba",
	}
end

return M
