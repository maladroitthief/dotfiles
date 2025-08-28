local overseer_prefix = "<leader>o"

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
				overseer_prefix .. "x",
				function()
					vim.api.nvim_command("OverseerToggle!")
				end,
				desc = "Overseer: Toggle",
			},
			{
				overseer_prefix .. "c",
				function()
					vim.api.nvim_command("OverseerRunCmd")
				end,
				desc = "Overseer: Run Cmd",
			},
			{
				overseer_prefix .. "t",
				function()
					vim.api.nvim_command("OverseerTaskAction")
				end,
				desc = "Overseer: Task Action",
			},
			{
				overseer_prefix .. "1",
				function()
					-- TODO: This should find the buffer if it already exists -ian
					local overseer = require("overseer")

					vim.cmd("only")
					local main = vim.api.nvim_get_current_win()
					local side = vim.api.nvim_open_win(0, true, {
						split = "left",
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
	},
}
