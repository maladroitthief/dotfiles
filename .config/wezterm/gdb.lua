local M = {}

M.dashboard = function(w, window, pane)
	local mux_window = window:mux_window()
	local gdb_tab, gdb_pane, _ = mux_window:spawn_tab({})
	gdb_tab:set_title("gdb")

	local pane1 = gdb_pane:split({
		direction = "Left",
		args = { "tail", "-f", "/dev/null" },
	})
	local pane2 = gdb_pane:split({
		direction = "Top",
		args = { "tail", "-f", "/dev/null" },
	})
	gdb_pane:activate()

	local pane1_tty = pane1:get_tty_name()
	local pane2_tty = pane2:get_tty_name()

	gdb_pane:send_text(
		'gdb -ex "dashboard variables -output '
			.. pane1_tty
			.. '" -ex "dashboard source -output '
			.. pane2_tty
			.. '"\n'
	)
	window:perform_action(w.action.MoveTab(-1), pane)
end

return M
