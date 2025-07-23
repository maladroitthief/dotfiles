return {
	"echasnovski/mini.diff",
	version = false,
	dependencies = {
		"maladroitthief/jj-minidiff.nvim",
  },
	config = function()
		local M = require("mini.diff")

	  vim.keymap.set(
      "n",
      "<leader>dp",
      function()
        M.toggle_overlay()
      end,
      { desc = "mini.diff: overlay" }
    )

		M.setup({
			source = {
        M.gen_source.git(),
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
}
