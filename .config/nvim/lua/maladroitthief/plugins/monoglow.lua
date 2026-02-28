return {
	"wnkz/monoglow.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		on_colors = function(colors)
			colors.bg = "none"
			colors.glow = "#1bfd9c"
			colors.bg_popup = "none"
		end,
	},
}
