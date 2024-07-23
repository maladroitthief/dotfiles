local wezterm = require 'wezterm'
local kanagawa = require 'kanagawa'

local config = wezterm.config_builder()

config.enable_tab_bar = false
config.scrollback_lines = 8000

config.cursor_blink_rate = 800
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

config.visual_bell = {
  fade_in_function = 'EaseIn',
  fade_in_duration_ms = 250,
  fade_out_function = 'EaseOut',
  fade_out_duration_ms = 250,
}

config.font_size = 20.0
config.freetype_load_target = 'HorizontalLcd'
config.font = wezterm.font {
  family = 'Fira Code',
  weight = 'Regular',
  harfbuzz_features = {
    'ss01',
    'ss02',
    'ss03',
    'ss04',
    'ss05',
    'ss07',
    'ss08',
    'zero',
    'onum'
  },
}

config.window_background_opacity = 0.95

config.keys = {
  {
    key = '=',
    mods = 'CTRL',
    action = wezterm.action.IncreaseFontSize,
  },
  {
    key = '+',
    mods = 'CTRL',
    action = wezterm.action.IncreaseFontSize,
  },
  {
    key = '-',
    mods = 'CTRL',
    action = wezterm.action.DecreaseFontSize,
  },
  {
    key = '0',
    mods = 'CTRL',
    action = wezterm.action.ResetFontSize,
  },
}

kanagawa.wave(config)

return config
