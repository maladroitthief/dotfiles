return {
	"stevearc/overseer.nvim",
	opts = {},
	keys = {
		{
			"<leader>xx",
			function()
				vim.api.nvim_command("OverseerToggle!")
			end,
			desc = "Overseer: Toggle",
		},
		{
			"<leader>xc",
			function()
				vim.api.nvim_command("OverseerRunCmd")
			end,
			desc = "Overseer: Run Cmd",
		},
		{
			"<leader>xt",
			function()
				vim.api.nvim_command("OverseerTaskAction")
			end,
			desc = "Overseer: Task Action",
		},
	},
}
