return {
	{
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
			{
				"<leader>x1",
				function()
					overseer = require("overseer")

					vim.cmd("only")
					local main = vim.api.nvim_get_current_win()
									local side = vim.api.nvim_open_win(0, true, {
										split = 'left',
									})

					overseer.run_template({ name = "make" }, function(task)
						if task then
							task:add_component({ "restart_on_save", paths = { vim.fn.expand("%:p") } })
							overseer.run_action(task, "open hsplit")
						end
					end)

					vim.api.nvim_set_current_win(main)
				end,
				desc = "Overseer: build layout",
			},
		},
	}
}
