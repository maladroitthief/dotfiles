local dap_prefix = "<leader>d"

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"thehamsta/nvim-dap-virtual-text",
		"leoluz/nvim-dap-go",
		"igorlfs/nvim-dap-view",
	},
	config = function()
		require("nvim-dap-virtual-text").setup()
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
			dap_prefix .. "n",
			function()
				require("dap").step_over()
			end,
			mode = { "n" },
			desc = "dap: step over",
		},
		{
			dap_prefix .. "s",
			function()
				require("dap").step_into()
			end,
			mode = { "n" },
			desc = "dap: step into",
		},
		{
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
	},
}
