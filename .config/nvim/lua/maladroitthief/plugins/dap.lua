local dap_prefix = "<leader>d"

return {
	"mfussenegger/nvim-dap",
	lazy = true,
	dependencies = {
		"thehamsta/nvim-dap-virtual-text",
		"igorlfs/nvim-dap-view",
		"leoluz/nvim-dap-go",
		"ravsii/nvim-dap-envfile",
	},
	config = function()
		local dap = require("dap")
		dap.defaults.fallback.terminal_win_cmd = "tabnew"
		dap.defaults.fallback.focus_terminal = true

		require("dap-go").setup()
		require("nvim-dap-envfile").setup({})
		require("nvim-dap-virtual-text").setup({
			enabled = true,
			enable_commands = true,
			highlight_changed_variables = true,
			highlight_new_as_changed = false,
			show_stop_reason = true,
			commented = false,
			only_first_definition = true,
			all_references = false,
			filter_references_pattern = "<module",
			virt_text_pos = "eol",
			all_frames = false,
			virt_lines = false,
			virt_text_win_col = nil,
		})

		require("dap-view").setup({
			windows = {
				-- `prev` is the last used position, might be nil
				position = function(prev)
					local wins = vim.api.nvim_tabpage_list_wins(0)

					-- Restores previous position if terminal is visible
					if vim.iter(wins):find(function(win)
						return vim.w[win].dapview_win_term
					end) then
						return prev
					end

					return vim.tbl_count(vim.iter(wins)
						:filter(function(win)
							local buf = vim.api.nvim_win_get_buf(win)
							local valid_buftype =
								vim.tbl_contains({ "", "help", "prompt", "quickfix", "terminal" }, vim.bo[buf].buftype)
							local dapview_win = vim.w[win].dapview_win or vim.w[win].dapview_win_term
							return valid_buftype and not dapview_win
						end)
						:totable()) > 1 and "below" or "right"
				end,
				size = function(pos)
					return pos == "below" and 0.25 or 0.5
				end,
				terminal = {
					-- `pos` is the position for the regular window
					position = function(pos)
						return pos == "below" and "right" or "below"
					end,
					size = 0.5,
				},
			},
		})

		local sign = vim.fn.sign_define

		sign("DapStopped", { text = vim.g.vinux_diagnostics_signs_warning, texthl = "DiagnosticWarn" })
		sign("DapBreakpointRejected", { text = vim.g.vinux_diagnostics_signs_error, texthl = "DiagnosticError" })

		-- todo: I don't know why I am defining these twice
		sign("DapBreakpoint", { text = vim.g.vinux_diagnostics_signs_info, texthl = "DiagnosticInfo" })
		sign("DapBreakpointCondition", { text = "", texthl = "DiagnosticInfo" })
		sign("DapLogPoint", { text = ".>", texthl = "DiagnosticInfo" })

		sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
		sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
	end,
	keys = {
		{
			dap_prefix .. "d",
			function()
				require("dap-view").toggle()
			end,
			mode = { "n" },
			desc = "dap: toggle",
		},
		{
			dap_prefix .. "c",
			function()
				require("dap").continue()
			end,
			mode = { "n" },
			desc = "dap: continue",
		},
		{
			dap_prefix .. "C",
			function()
				require("dap").run_to_cursor()
			end,
			mode = { "n" },
			desc = "dap: run to cursor",
		},
		{
			dap_prefix .. "w",
			function()
				vim.cmd("DapViewWatch")
			end,
			mode = { "n" },
			desc = "dap: watch",
		},
		{
			-- dap_prefix .. "n",
			"<F10>",
			function()
				require("dap").step_over()
			end,
			mode = { "n" },
			desc = "dap: step over",
		},
		{
			"<F11>",
			function()
				require("dap").step_into()
			end,
			mode = { "n" },
			desc = "dap: step into",
		},
		{
			"<S-F11>",
			dap_prefix .. "o",
			function()
				require("dap").step_out()
			end,
			mode = { "n" },
			desc = "dap: step out",
		},
		{
			dap_prefix .. "b",
			function()
				require("dap").toggle_breakpoint()
			end,
			mode = { "n" },
			desc = "dap: toggle breakpoint",
		},
		{
			dap_prefix .. "r",
			function()
				require("dap").run_last()
			end,
			mode = { "n" },
			desc = "dap: run last",
		},
		{
			dap_prefix .. "h",
			function()
				require("dap.ui.widgets").hover()
			end,
			mode = { "n", "v" },
			desc = "dap: hover",
		},
		{
			dap_prefix .. "p",
			function()
				require("dap.ui.widgets").preview()
			end,
			mode = { "n", "v" },
			desc = "dap: preview",
		},
		{
			dap_prefix .. "x",
			function()
				require("dap").terminate()
			end,
			mode = { "n", "v" },
			desc = "dap: terminate",
		},
	},
}
