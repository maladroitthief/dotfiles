local wezterm = require 'wezterm'
local kanagawa = require 'kanagawa'

local config = wezterm.config_builder()

config.enable_tab_bar = false
config.font = wezterm.font('Fira Code', {weight='Regular'})
config.font_size = 24.0

kanagawa.lotus(config)

return config
