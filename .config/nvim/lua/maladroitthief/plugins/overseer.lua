local overseer_prefix = "<leader>o"

return {
	{
		"stevearc/overseer.nvim",
		opts = {},
		config = function()
			require("overseer").setup({})
			vim.api.nvim_create_autocmd("BufEnter", {
				callback = function()
					if vim.b.overseer_task then
						vim.opt_local.wrap = true
					end
				end,
			})
			local overseer = require("overseer")
			overseer.add_template_hook({ module = "^make$" }, function(task_defn, util)
				util.remove_component(task_defn, "on_complete_notify")
				util.add_component(task_defn, { "myplugin.on_complete_notify_full", max_lines = 40 })
			end)
			overseer.add_template_hook({ module = "^shell$" }, function(task_defn, util)
				util.remove_component(task_defn, "on_complete_notify")
				util.add_component(task_defn, { "myplugin.on_complete_notify_full", max_lines = 40 })
			end)
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
					local overseer = require("overseer")
					overseer.run_template({
						name = "shell",
					})
				end,
				desc = "overseer: shell",
			},
			{
				overseer_prefix .. "C",
				function()
					local overseer = require("overseer")
					overseer.run_template({
						name = "shell",
						cwd = vim.fn.expand("%:p:h"),
					})
				end,
				desc = "overseer: cwd shell",
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
				overseer_prefix .. "w",
				function()
					local overseer = require("overseer")
					local tasks = overseer.list_tasks({ recent_first = true })
					if vim.tbl_isempty(tasks) then
						vim.notify("No tasks found", vim.log.levels.WARN)
					else
						overseer.run_action(tasks[1], "watch")
					end
				end,
				desc = "overseer: watch last command",
			},
			{
				overseer_prefix .. "m",
				function()
					local overseer = require("overseer")
					overseer.run_template({
						name = "make",
					})
				end,
				desc = "overseer: make",
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
		},
	},
}
