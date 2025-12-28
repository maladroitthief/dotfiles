local DEBUG = true
local pwave_prefix = "<leader>p"

local REMOTE = {
	{
		"maladroitthief/pwave.nvim",
	},
}

local LOCAL = {
	enable = false,
	dir = "~/workspace/maladroitthief/pwave.nvim",
	opts = {},
	keys = {
		{
			pwave_prefix .. "c",
			function()
				require("pwave").complete()
			end,
			mode = { "n", "v" },
			desc = "pwave: complete",
		},
	},
}

local M = {}

if DEBUG then
	M = LOCAL
else
	M = REMOTE
end

return M
