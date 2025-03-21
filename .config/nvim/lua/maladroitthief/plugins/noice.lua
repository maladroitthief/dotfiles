return {
	"folke/noice.nvim",
    enabled = false,
	dependencies = {
		"MunifTanjim/nui.nvim",
		-- "rcarriga/nvim-notify",
		"hrsh7th/nvim-cmp",
	},
	event = "VeryLazy",
	opts = {
		lsp = {
			-- override = {
			-- 	["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			-- 	["vim.lsp.util.stylize_markdown"] = true,
			-- 	["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
			-- },
		},
		presets = {
			bottom_search = false, -- use a classic bottom cmdline for search
			command_palette = false, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = false, -- add a border to hover docs and signature help
		},
		commands = {
			history = {
				filter = {},
			},
		},
		views = {
			cmdline_popup = {
				position = {
					row = 5,
					col = "50%",
				},
				size = {
					width = 60,
					height = "auto",
				},
			},
			popupmenu = {
				relative = "editor",
				position = {
					row = 8,
					col = "50%",
				},
				size = {
					width = 60,
					height = 10,
				},
				border = {
					style = "rounded",
					padding = { 0, 1 },
				},
				win_options = {
					winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
				},
			},
			mini = {
				timeout = 5000,
			},
		},
		routes = {
			{
				filter = {
					event = "msg_show",
					kind = "",
					find = "written",
				},
				opts = { skip = true },
			},
		},
	},
}
