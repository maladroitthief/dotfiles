local M = {}

local sessionizer = require("sessionizer")
local split_nav = require("split_nav")

function M.setup(w, config)
	config.leader = { key = "w", mods = "CTRL", timeout_milliseconds = 4000 }

	config.keys = {
		{ mods = "CTRL", key = "=", action = w.action.IncreaseFontSize },
		{ mods = "CTRL", key = "+", action = w.action.IncreaseFontSize },
		{ mods = "CTRL", key = "-", action = w.action.DecreaseFontSize },
		{ mods = "CTRL", key = "0", action = w.action.ResetFontSize },
		{ mods = "LEADER", key = "s", action = w.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{ mods = "LEADER", key = "v", action = w.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
		{ mods = "LEADER", key = "c", action = w.action({ SpawnTab = "CurrentPaneDomain" }) },
		{ mods = "LEADER", key = "x", action = w.action.CloseCurrentTab({ confirm = true }) },
		{ mods = "LEADER", key = "l", action = w.action.ActivateLastTab },
		{ mods = "LEADER", key = "1", action = w.action({ ActivateTab = 0 }) },
		{ mods = "LEADER", key = "2", action = w.action({ ActivateTab = 1 }) },
		{ mods = "LEADER", key = "3", action = w.action({ ActivateTab = 2 }) },
		{ mods = "LEADER", key = "4", action = w.action({ ActivateTab = 3 }) },
		{ mods = "LEADER", key = "5", action = w.action({ ActivateTab = 4 }) },
		{ mods = "LEADER", key = "6", action = w.action({ ActivateTab = 5 }) },
		{ mods = "LEADER", key = "7", action = w.action({ ActivateTab = 6 }) },
		{ mods = "LEADER", key = "8", action = w.action({ ActivateTab = 7 }) },
		{ mods = "LEADER", key = "9", action = w.action({ ActivateTab = 8 }) },
		-- move between split panes
		-- { mods = "CTRL", key = "h", action = W.action({ ActivatePaneDirection = "Left" }) },
		-- { mods = "CTRL", key = "j", action = W.action({ ActivatePaneDirection = "Down" }) },
		-- { mods = "CTRL", key = "k", action = W.action({ ActivatePaneDirection = "Up" }) },
		-- { mods = "CTRL", key = "l", action = W.action({ ActivatePaneDirection = "Right" }) },
		split_nav.handle(w, "move", "h"),
		split_nav.handle(w, "move", "j"),
		split_nav.handle(w, "move", "k"),
		split_nav.handle(w, "move", "l"),
		-- resize panes
		split_nav.handle(w, "resize", "h"),
		split_nav.handle(w, "resize", "j"),
		split_nav.handle(w, "resize", "k"),
		split_nav.handle(w, "resize", "l"),
		{ mods = "LEADER", key = "[", action = w.action.ActivateCopyMode },
		{ mods = "LEADER", key = "z", action = w.action.TogglePaneZoomState },
		{
			mods = "LEADER",
			key = ",",
			action = w.action.PromptInputLine({
				description = "Rename tab",
				action = w.action_callback(function(window, _, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
		{
			mods = "LEADER",
			key = "p",
			action = w.action_callback(function(window, pane, _)
				sessionizer.toggle(w, window, pane)
			end),
		},
		{
			mods = "LEADER|SHIFT",
			key = "l",
			action = w.action_callback(function(window, pane, _)
				sessionizer.previous(w, window, pane)
			end),
		},
		{ mods = "LEADER", key = "w", action = w.action.ShowLauncherArgs({ flags = "WORKSPACES" }) },
		{ mods = "LEADER", key = "a", action = w.action.AttachDomain("unix") },
		{ mods = "LEADER", key = "d", action = w.action.DetachDomain({ DomainName = "unix" }) },
		{
			mods = "LEADER|SHIFT",
			key = "$",
			action = w.action.PromptInputLine({
				description = "Rename session",
				action = w.action_callback(function(window, _, line)
					if line then
						w.mux.rename_workspace(window:mux_window():get_workspace(), line)
					end
				end),
			}),
		},
	}
end

return M
