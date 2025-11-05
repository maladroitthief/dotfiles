local M = {}

M.toggle = function(w, window, pane)
	local projects = {}

	local success, stdout, stderr = w.run_child_process({
		"fd",
		"-HI",
		"^.jj$",
		"--max-depth=4",
		"--prune",
		os.getenv("HOME") .. "/workspace",
	})

	if not success then
		w.log_error("Failed to run fd: " .. stderr)
		return
	end

	for line in stdout:gmatch("([^\n]*)\n?") do
		local project = line:gsub("/.jj.*$", "")
		local label = project
		local id = project:gsub(".*/", "")
		table.insert(projects, { label = tostring(label), id = tostring(id) })
	end

	window:perform_action(
		w.action.InputSelector({
			action = w.action_callback(function(win, _, id, label)
				if not id and not label then
					w.log_info("Cancelled")
				else
					w.log_info("Selected " .. label)
					win:perform_action(w.action.SwitchToWorkspace({ name = id, spawn = { cwd = label } }), pane)
				end
			end),
			fuzzy = true,
			title = "Select project",
			choices = projects,
		}),
		pane
	)
end

return M
