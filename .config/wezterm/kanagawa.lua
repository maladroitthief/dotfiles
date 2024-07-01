local wezterm = require 'wezterm'
local module = {}

function module.wave(config)
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

    ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
    brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
    indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
  }
end

function module.lotus(config)
  config.force_reverse_video_cursor = true
  config.colors = {
    foreground = "#545464",
    background = "#f2ecbc",

    cursor_bg = "#43436c",
    cursor_fg = "#43436c",
    cursor_border = "#43436c",

    selection_fg = "#43436c",
    selection_bg = "#c9cbd1",

    scrollbar_thumb = "#c7d7e0",
    split = "#c7d7e0",

    ansi = { "#1F1F28", "#c84053", "#6f894e", "#77713f", "#4d699b", "#b35b79", "#597b75", "#545464" },
    brights = { "#8a8980", "#d7474b", "#6e915f", "#836f4a", "#6693bf", "#624c83", "#5e857a", "#43436c" },
    indexed = { [16] = "#cc6d00", [17] = "#e82424" },

    tab_bar = {
      inactive_tab_edge = '#dcd5ac',
    },
  }
  config.window_frame = {
    active_titlebar_bg = '#e7dba0',
    inactive_titlebar_bg = '#e7dba0',
  }
end

return module
