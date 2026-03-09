local overseer_prefix = "<leader>o"

return {
	{
		"stevearc/overseer.nvim",
		---@module 'overseer'
		---@type overseer.SetupOpts
		opts = {},
		config = function()
			require("overseer").setup({})
			-- vim.api.nvim_create_autocmd("BufEnter", {
			-- 	callback = function()
			-- 		if vim.b.overseer_task then
			-- 			vim.opt_local.wrap = true
			-- 		end
			-- 	end,
			-- })
			-- local overseer = require("overseer")
			-- overseer.add_template_hook({ module = "^make$" }, function(task_defn, util)
			-- 	util.remove_component(task_defn, "on_complete_notify")
			-- 	util.add_component(task_defn, { "myplugin.on_complete_notify_full", max_lines = 40 })
			-- end)
			-- overseer.add_template_hook({ module = "^shell$" }, function(task_defn, util)
			-- 	util.remove_component(task_defn, "on_complete_notify")
			-- 	util.add_component(task_defn, { "myplugin.on_complete_notify_full", max_lines = 40 })
			-- end)
		end,
		keys = {
			{
				overseer_prefix .. "o",
				function()
					vim.api.nvim_command("OverseerToggle!")
				end,
				desc = "overseer: toggle",
			},
			{
				overseer_prefix .. "c",
				function()
					local overseer = require("overseer")
					overseer.run_task({
						name = "shell",
					})
				end,
				desc = "overseer: shell",
			},
			{
				overseer_prefix .. "C",
				function()
					local overseer = require("overseer")
					overseer.run_task({
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
				overseer_prefix .. "r",
				function()
					local overseer = require("overseer")
					local task_list = require("overseer.task_list")
					local tasks = overseer.list_tasks({
						status = {
							overseer.STATUS.SUCCESS,
							overseer.STATUS.FAILURE,
							overseer.STATUS.CANCELED,
						},
						sort = task_list.sort_finished_recently,
					})
					if vim.tbl_isempty(tasks) then
						vim.notify("No tasks found", vim.log.levels.WARN)
					else
						local most_recent = tasks[1]
						overseer.run_action(most_recent, "restart")
					end
				end,
				desc = "overseer: restart last command",
			},
			{
				overseer_prefix .. "m",
				function()
					local overseer = require("overseer")
					local task = overseer.new_task({
						cmd = { "make" },
						components = { { "on_output_quickfix", open = false }, "default" },
					})
					task:start()
				end,
				desc = "overseer: make",
			},
			{
				overseer_prefix .. "M",
				function()
					local overseer = require("overseer")
					local task = overseer.new_task({
						cmd = { "make" },
						components = { { "on_output_quickfix", open = true }, "default" },
					})
					task:start()
				end,
				desc = "overseer: make",
			},
		},
	},
}
