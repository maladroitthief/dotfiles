return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	enabled = true,
	priority = 1000,
	opts = {
		variant = "moon",
		dim_inactive_windows = false,
		extend_background_behind_borders = false,
		enable = {
			terminal = true,
			legacy_highlights = true,
			migrations = true,
		},
		styles = {
			italic = true,
			bold = true,
			transparency = true,
		},
		highlight_groups = {
		},
	},
	config = function(_, opts)
		require("rose-pine").setup(opts)

		vim.cmd("colorscheme rose-pine")
	end,
}
