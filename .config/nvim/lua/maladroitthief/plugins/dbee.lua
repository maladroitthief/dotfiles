return {
	{
		"kndndrj/nvim-dbee",
		enabled = true,
		dependencies = { "MunifTanjim/nui.nvim" },
		build = function()
			require("dbee").install()
		end,
		config = function()
			local source = require("dbee.sources")
			require("dbee").setup({
				sources = {},
			})
			require("maladroitthief.dbee")
		end,
	},
}
