local function pick_cmd_result(picker_opts)
	local workspace_root = vim.fn.system({ "jj", "workspace", "root" })

	local function finder(opts, ctx)
		return require("snacks.picker.source.proc").proc({
			opts,
			{
				cmd = picker_opts.cmd,
				args = picker_opts.args,
				transform = function(item)
					item.cwd = picker_opts.cwd or workspace_root
					item.file = item.text
				end,
			},
		}, ctx)
	end

	Snacks.picker.pick({
		source = picker_opts.name,
		finder = finder,
		preview = picker_opts.preview,
		title = picker_opts.title,
	})
end

-- function M.status()
-- 	pick_cmd_result({
-- 		name = "jj_status",
-- 		title = "jj status",
-- 		cmd = "jj",
-- 		args = {
-- 			"st",
-- 			"--no-pager",
-- 			"--quiet",
-- 			"--color=never",
-- 		},
-- 		preview = "git_show",
-- 	})
-- end
