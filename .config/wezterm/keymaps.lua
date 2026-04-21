local M = {}

function M.setup(w, config)
	config.keys = {
		{ mods = "CTRL", key = "=", action = w.action.IncreaseFontSize },
		{ mods = "CTRL", key = "+", action = w.action.IncreaseFontSize },
		{ mods = "CTRL", key = "-", action = w.action.DecreaseFontSize },
		{ mods = "CTRL", key = "0", action = w.action.ResetFontSize },
	}
end

return M
