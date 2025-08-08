local DEV_MODE = false

local REMOTE = {
	{
		"rluba/jai.vim",
	},
}

local LOCAL = {
	enable = false,
	dir = "~/workspace/maladroitthief/jai.nvim",
	opts = {},
	config = function()
		require("jai")
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
