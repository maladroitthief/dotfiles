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
				overseer_prefix .. "e",
				function()
					vim.api.nvim_command("OverseerToggle!")
				end,
				desc = "overseer: toggle",
			},
			{
				overseer_prefix .. "c",
				function()
					vim.api.nvim_command("OverseerRunCmd")
				end,
				desc = "overseer: run command",
			},
			{
				overseer_prefix .. "a",
				function()
					vim.api.nvim_command("OverseerTaskAction")
				end,
				desc = "overseer: task action",
			},
			{
				overseer_prefix .. "o",
				function()
					local overseer = require("overseer")
					local tasks = overseer.list_tasks({ recent_first = true })
					if vim.tbl_isempty(tasks) then
						vim.notify("No tasks found", vim.log.levels.WARN)
					else
						overseer.run_action(tasks[1], "open")
					end
				end,
				desc = "overseer: restart last command",
			},
			{
				overseer_prefix .. "r",
				function()
					local overseer = require("overseer")
					local tasks = overseer.list_tasks({ recent_first = true })
					if vim.tbl_isempty(tasks) then
						vim.notify("No tasks found", vim.log.levels.WARN)
					else
						overseer.run_action(tasks[1], "restart")
					end
				end,
				desc = "overseer: restart last command",
			},
			{
				overseer_prefix .. "tp",
				function()
					local overseer = require("overseer")
					local task = overseer.new_task({
						cmd = "terraform plan",
						cwd = vim.fn.expand("%:p:h"),
					})
					task:start()
				end,
				desc = "overseer: terraform plan",
			},
			{
				overseer_prefix .. "ti",
				function()
					local overseer = require("overseer")
					local task = overseer.new_task({
						cmd = "terraform init",
						cwd = vim.fn.expand("%:p:h"),
					})
					task:start()
				end,
				desc = "overseer: terraform init",
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
				desc = "overseer: build layout",
			},
		},
	},
}
