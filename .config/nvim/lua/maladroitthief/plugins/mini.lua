return {
  {
    "echasnovski/mini.nvim",
		dependencies = {
			"maladroitthief/jj-minidiff.nvim",
		},
    config = function()
      require("mini.ai").setup()
      require("mini.surround").setup()

      local hipatterns = require "mini.hipatterns"
      hipatterns.setup {
        highlighters = {
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      }

			local diff = require("mini.diff")
			vim.keymap.set(
				"n",
				"<leader>dp",
				function()
					diff.toggle_overlay()
				end,
				{ desc = "mini.diff: overlay" }
			)

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
