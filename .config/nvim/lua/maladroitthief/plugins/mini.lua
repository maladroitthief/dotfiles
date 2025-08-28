local mini_prefix = "<leader>m"

return {
	{
		"echasnovski/mini.nvim",
		dependencies = {
			"maladroitthief/jj-minidiff.nvim",
		},
		config = function()
			require("mini.ai").setup()
			require("mini.surround").setup()

			local hipatterns = require("mini.hipatterns")
			hipatterns.setup({
				highlighters = {
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			})

			local diff = require("mini.diff")
			vim.keymap.set("n", mini_prefix .. "d", function()
				local buf_id = vim.api.nvim_get_current_buf()
				diff.toggle_overlay(buf_id)
			end, { desc = "mini.diff: overlay" })

			diff.setup({
				source = {
					diff.gen_source.git(),
					require("jj-minidiff").setup({}),
				},
				view = {
					style = "sign",
					signs = {
						add = "▎",
						change = "▎",
						delete = "",
					},
				},
			})
		end,
	},
}
