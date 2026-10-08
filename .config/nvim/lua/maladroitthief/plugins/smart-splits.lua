return {
	"smart-splits-nvim/smart-splits.nvim",
	lazy = false,
	dependencies = {
		{ "smart-splits-nvim/backend-tmux", main = "smart-splits-backend-tmux" },
	},
	opts = {
		-- buffers to leave alone, see Ignore Lists below
		ignored_buftypes = { "nofile", "quickfix", "prompt" },
		ignored_filetypes = { "NvimTree" },

		resize = {
			-- cells to resize by, multiplied by `v:count1`
			amount = 3,
			-- added to `eventignore` for the duration of a resize
			ignored_events = { "BufEnter", "WinEnter" },
		},

		move = {
			-- 'stop' | 'wrap' | 'split' | fun(ctx), see At Edge Behavior below
			at_edge = "wrap",
			-- keep the cursor on the same screen row when moving horizontally
			same_row = false,
		},

		swap = {
			-- follow the buffer into its new window
			move_cursor = false,
		},

		mux = {
			-- a backend, a list of backends in priority order, or a function returning
			-- either; see Backends below
			backend = "smart-splits-backend-tmux",
			-- warn when backends are configured but none of them detected
			warn_if_unusable = true,
		},

		log = {
			-- 'trace' | 'debug' | 'info' | 'warn' | 'error'
			level = "info",
			-- `true` for the default path, a string for a custom one, `false` to disable
			file = true,
		},
	},
	keys = {
		{
			"<A-h>",
			function()
				require("smart-splits").resize_left()
			end,
		},
		{
			"<A-j>",
			function()
				require("smart-splits").resize_down()
			end,
		},
		{
			"<A-k>",
			function()
				require("smart-splits").resize_up()
			end,
		},
		{
			"<A-l>",
			function()
				require("smart-splits").resize_right()
			end,
		},
		-- moving between splits
		{
			"<C-h>",
			function()
				require("smart-splits").move_cursor_left()
			end,
		},
		{
			"<C-j>",
			function()
				require("smart-splits").move_cursor_down()
			end,
		},

		{
			"<C-k>",
			function()
				require("smart-splits").move_cursor_up()
			end,
		},

		{
			"<C-l>",
			function()
				require("smart-splits").move_cursor_right()
			end,
		},
	},
}
