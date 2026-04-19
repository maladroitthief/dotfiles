local dap_prefix = "<leader>d"

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"thehamsta/nvim-dap-virtual-text",
		"igorlfs/nvim-dap-view",
		"leoluz/nvim-dap-go",
	},
	config = function()
		require("nvim-dap-virtual-text").setup()

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
