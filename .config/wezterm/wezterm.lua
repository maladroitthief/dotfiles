local wezterm = require("wezterm")
local colors = require("colors")
local keymaps = require("keymaps")

local config = wezterm.config_builder()

config.term = "wezterm"
config.unix_domains = {
	{
		name = "unix",
	},
}

config.window_decorations = "RESIZE"
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true
config.tab_max_width = 32
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.scrollback_lines = 1000000

config.cursor_blink_rate = 750
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

config.visual_bell = {
	fade_in_function = "Constant",
	fade_in_duration_ms = 0,
	fade_out_function = "Constant",
	fade_out_duration_ms = 0,
}

config.font_size = 15.0
config.freetype_load_target = "HorizontalLcd"
config.font = wezterm.font({
	family = "Fira Code",
	weight = "Regular",
	harfbuzz_features = {
		"ss01",
		"ss02",
		"ss03",
		"ss04",
		"ss05",
		"ss07",
		"ss08",
		"zero",
		"onum",
	},
})


config.window_background_opacity = 0.85
colors.kanagawa(config)
keymaps.setup(wezterm, config)

return config
