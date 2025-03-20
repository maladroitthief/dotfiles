return {
	"stevearc/overseer.nvim",
	config = function()
        require("overseer").setup({})
		vim.api.nvim_create_autocmd("BufEnter", {
			callback = function()
				if vim.b.overseer_task then
					vim.opt_local.wrap = true
				end
			end,
		})
	end,
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
