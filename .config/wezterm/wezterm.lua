local wezterm = require 'wezterm'
local kanagawa = require 'kanagawa'

local config = wezterm.config_builder()

config.unix_domains = {
    {
        name = 'unix'
    }
}

config.enable_tab_bar = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true
config.tab_max_width = 32
config.scrollback_lines = 8000

config.cursor_blink_rate = 750
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

config.visual_bell = {
    fade_in_function = 'Constant',
    fade_in_duration_ms = 0,
    fade_out_function = 'Constant',
    fade_out_duration_ms = 0,
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

config.window_background_opacity = 0.90

--config.leader = { key = "w", mods = "CTRL" }
config.keys = {
    { mods = 'CTRL', key = '=', action = wezterm.action.IncreaseFontSize },
    { mods = 'CTRL', key = '+', action = wezterm.action.IncreaseFontSize },
    { mods = 'CTRL', key = '-', action = wezterm.action.DecreaseFontSize },
    { mods = 'CTRL', key = '0', action = wezterm.action.ResetFontSize },
    -- { mods = 'LEADER', key = 'c', action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
    -- { mods = "LEADER", key = "s", action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
    -- { mods = "LEADER", key = "v", action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
    -- { mods = "LEADER", key = "1", action = wezterm.action { ActivateTab = 0 } },
    -- { mods = "LEADER", key = "2", action = wezterm.action { ActivateTab = 1 } },
    -- { mods = "LEADER", key = "3", action = wezterm.action { ActivateTab = 2 } },
    -- { mods = "LEADER", key = "4", action = wezterm.action { ActivateTab = 3 } },
    -- { mods = "LEADER", key = "5", action = wezterm.action { ActivateTab = 4 } },
    -- { mods = "LEADER", key = "6", action = wezterm.action { ActivateTab = 5 } },
    -- { mods = "LEADER", key = "7", action = wezterm.action { ActivateTab = 6 } },
    -- { mods = "LEADER", key = "8", action = wezterm.action { ActivateTab = 7 } },
    -- { mods = "LEADER", key = "9", action = wezterm.action { ActivateTab = 8 } },
    -- { mods = "CTRL",   key = "h", action = wezterm.action { ActivatePaneDirection = "Left" } },
    -- { mods = "CTRL",   key = "j", action = wezterm.action { ActivatePaneDirection = "Down" } },
    -- { mods = "CTRL",   key = "k", action = wezterm.action { ActivatePaneDirection = "Up" } },
    -- { mods = "CTRL",   key = "l", action = wezterm.action { ActivatePaneDirection = "Right" } },
    -- { mods = 'LEADER', key = '[', action = wezterm.action.ActivateCopyMode },
    -- { mods = 'LEADER', key = 'z', action = wezterm.action.TogglePaneZoomState },
    -- {
    --     mods = 'LEADER',
    --     key = ',',
    --     action = wezterm.action.PromptInputLine {
    --         description = 'Rename tab',
    --         action = wezterm.action_callback(
    --             function(window, pane, line)
    --                 if line then
    --                     window:active_tab():set_title(line)
    --                 end
    --             end
    --         ),
    --     },
    -- },
    -- { mods = 'LEADER', key = 'x', action = wezterm.action.CloseCurrentTab { confirm = true } },
    -- { mods = 'LEADER', key = 'l', action = wezterm.action.ActivateLastTab },
    -- { mods = 'LEADER', key = 'a', action = wezterm.action.AttachDomain 'unix' },
    -- { mods = 'LEADER', key = 'd', action = wezterm.action.DetachDomain { DomainName = 'unix' } },
    -- {
    --     mods = 'LEADER|SHIFT',
    --     key = '$',
    --     action = wezterm.action.PromptInputLine {
    --         description = 'Rename session',
    --         action = wezterm.action_callback(
    --             function(window, pane, line)
    --                 if line then
    --                     wezterm.mux.rename_workspace(
    --                         window:mux_window():get_workspace(),
    --                         line
    --                     )
    --                 end
    --             end
    --         ),
    --     }
    -- },
    -- { mods = 'LEADER', key = 'w', action = wezterm.action.ShowLauncherArgs { flags = 'WORKSPACES' } },
}

kanagawa.wave(config)


wezterm.on('user-var-changed', function(window, pane, name, value)
    local overrides = window:get_config_overrides() or {}
    if name == "ZEN_MODE" then
        local incremental = value:find("+")
        local number_value = tonumber(value)
        if incremental ~= nil then
            while (number_value > 0) do
                window:perform_action(wezterm.action.IncreaseFontSize, pane)
                number_value = number_value - 1
            end
            overrides.enable_tab_bar = false
        elseif number_value < 0 then
            window:perform_action(wezterm.action.ResetFontSize, pane)
            overrides.font_size = nil
            overrides.enable_tab_bar = true
        else
            overrides.font_size = number_value
            overrides.enable_tab_bar = false
        end
    end
    window:set_config_overrides(overrides)
end)

return config
