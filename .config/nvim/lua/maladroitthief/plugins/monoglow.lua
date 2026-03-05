return {
	"wnkz/monoglow.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("monoglow").setup({
			on_colors = function(colors)
				colors.bg = "none"
				colors.glow = "#1bfd9c"
				colors.blue1 = "#9CABCA"
				colors.blue2 = "#7E9CD8"
				colors.bg_popup = "none"

				-- colors.visual = "#1bfd9c"
			end,
		})

		-- vim.cmd.colorscheme("monoglow")
	end,
}
