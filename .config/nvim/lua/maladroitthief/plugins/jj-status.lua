local DEV_MODE = true

local REMOTE = {
	{
		"maladroitthief/jj-picker.nvim",
	},
}

local LOCAL = {
	enable = false,
	dir = "~/workspace/maladroitthief/jj-picker.nvim",
	opts = {},
	config = function()
		require("jj-picker")
	end,
	keys = {},
}

local M = {}

if DEV_MODE then
	M = LOCAL
else
	M = REMOTE
end

return M
