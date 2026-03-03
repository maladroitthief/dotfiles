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

function M.monoglow(config)
	config.force_reverse_video_cursor = true
	config.colors = {
		background = "#121212",
		foreground = "#cccccc",
		cursor_bg = "#cccccc",
		cursor_fg = "#121212",
		cursor_border = "#cccccc",
		selection_bg = "#2a2a2a",
		selection_fg = "#dddddd",

		ansi = {
			"#2a2a2a",
			"#deeeed",
			"#1bfd9c",
			"#b4b4b4",
			"#7a7a7a",
			"#66b2b2",
			"#cccccc",
			"#f1f1f1",
		},

		brights = {
			"#4a4a4a",
			"#708090",
			"#a6ffc9",
			"#dddddd",
			"#aaaaaa",
			"#49c4c4",
			"#d3d3d3",
			"#ffffff",
		},

		tab_bar = {
			background = "#121212",
			active_tab = {
				bg_color = "#dddddd",
				fg_color = "#0e0e0e",
			},
			inactive_tab = {
				bg_color = "#2a2a2a",
				fg_color = "#7a7a7a",
			},
			inactive_tab_hover = {
				bg_color = "#444444",
				fg_color = "#cccccc",
			},
			new_tab = {
				bg_color = "#2a2a2a",
				fg_color = "#7a7a7a",
			},
			new_tab_hover = {
				bg_color = "#444444",
				fg_color = "#cccccc",
			},
		},
	}
end

return M
