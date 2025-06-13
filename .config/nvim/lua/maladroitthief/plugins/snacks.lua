return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		bufdelete = { enabled = true },
		dashboard = {
			sections = {
				{ section = "header" },
				-- {
				-- 	pane = 2,
				-- 	section = "terminal",
				-- 	cmd = "colorscript -e square",
				-- 	height = 5,
				-- 	padding = 1,
				-- },
				{ section = "keys", gap = 1, padding = 1 },
				{ pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{
					pane = 2,
					icon = " ",
					title = "Git Status",
					section = "terminal",
					enabled = function()
						return Snacks.git.get_root() ~= nil
					end,
					cmd = "git status --short --branch --renames",
					height = 5,
					padding = 1,
					ttl = 5 * 60,
					indent = 3,
				},
				{ section = "startup" },
			},
		},
		dim = { enabled = true },
		explorer = { enabled = false },
		image = { enabled = true },
		indent = { enabled = true },
		-- NOTE: maybe try this? -ian
		input = { enabled = false },
		-- lazygit = { enabled = true },
		notifier = { enabled = true },
		picker = { enabled = true },
		profiler = { enabled = true },
		quickfile = { enabled = false },
		scope = { enabled = true },
		---@class snacks.scroll.Config
		---@field animate snacks.animate.Config|{}
		---@field animate_repeat snacks.animate.Config|{}|{delay:number}
		scroll = {
			enabled = false,
			animate = {
				duration = { step = 15, total = 150 },
				easing = "linear",
			},
			-- faster animation when repeating scroll after delay
			animate_repeat = {
				delay = 100, -- delay in ms before using the repeat animation
				duration = { step = 5, total = 50 },
				easing = "linear",
			},
			-- what buffers to animate
			filter = function(buf)
				return vim.g.snacks_scroll ~= false
					and vim.b[buf].snacks_scroll ~= false
					and vim.bo[buf].buftype ~= "terminal"
			end,
		},
		statuscolumn = {
			enabled = false,
			git = {
				-- patterns to match Git signs
				patterns = { "GitSign", "MiniDiffSign" },
			},
		},
		words = { enabled = true },
	},
	keys = {
		{
			"<leader>p",
			function()
				require("snacks").profiler.toggle()
			end,
			mode = { "n" },
			desc = "snacks: profile",
		},
		{
			"<leader>fp",
			function()
				require("snacks").picker.projects()
			end,
			mode = { "n" },
			desc = "snacks: projects",
		},
		{
			"<leader>ff",
			function()
				require("snacks").picker.files({
					finder = "files",
					format = "file",
					show_empty = true,
					hidden = true,
					ignored = false,
					follow = false,
					supports_live = true,
				})
			end,
			mode = { "n" },
			desc = "snacks: files",
		},
		{
			"<leader>fg",
			function()
				require("snacks").picker.grep({
					finder = "grep",
					regex = true,
					format = "file",
					show_empty = true,
					live = true, -- live grep by default
					supports_live = true,
				})
			end,
			mode = { "n" },
			desc = "snacks: grep",
		},
		{
			"<leader>fif",
			function()
				require("snacks").picker.files({
					finder = "files",
					format = "file",
					cwd = vim.fn.expand("%:p:h"),
					show_empty = true,
					hidden = true,
					ignored = false,
					follow = false,
					supports_live = true,
				})
			end,
			mode = { "n" },
			desc = "snacks: inner files",
		},
		{
			"<leader>fig",
			function()
				require("snacks").picker.grep({
					finder = "grep",
					cwd = vim.fn.expand("%:p:h"),
					regex = true,
					format = "file",
					show_empty = true,
					live = true, -- live grep by default
					supports_live = true,
				})
			end,
			mode = { "n" },
			desc = "snacks: inner grep",
		},
		{
			"<leader>fb",
			function()
				require("snacks").picker.buffers({})
			end,
			mode = { "n" },
			desc = "snacks: buffers",
		},
		{
			"<leader>fy",
			function()
				require("snacks").picker.cliphist({})
			end,
			mode = { "n" },
			desc = "snacks: clip history",
		},
		-- {
		-- 	"<leader>gg",
		-- 	function()
		-- 		require("snacks").lazygit.open({})
		-- 	end,
		-- 	mode = { "n" },
		-- 	desc = "snacks: lazygit",
		-- },
		{
			"<leader>gs",
			function()
				require("snacks").picker.git_status({})
			end,
			mode = { "n" },
			desc = "snacks: git status",
		},
		-- {
		-- 	"<leader>gd",
		-- 	function()
		-- 		require("snacks").picker.git_diff({})
		-- 	end,
		-- 	mode = { "n" },
		-- 	desc = "snacks: git diff",
		-- },
		-- {
		-- 	"<leader>gb",
		-- 	function()
		-- 		require("snacks").picker.git_branches({})
		-- 	end,
		-- 	mode = { "n" },
		-- 	desc = "snacks: git branches",
		-- },
		-- {
		-- 	"<leader>gl",
		-- 	function()
		-- 		require("snacks").picker.git_log({})
		-- 	end,
		-- 	mode = { "n" },
		-- 	desc = "snacks: git log",
		-- },
		{
			"<leader>fh",
			function()
				require("snacks").picker.help({})
			end,
			mode = { "n" },
			desc = "snacks: help",
		},
		{
			"<leader>fj",
			function()
				require("snacks").picker.jumps({})
			end,
			mode = { "n" },
			desc = "snacks: jumps",
		},
		{
			"<leader>f?",
			function()
				require("snacks").picker.keymaps({})
			end,
			mode = { "n" },
			desc = "snacks: keymaps",
		},
		{
			"<leader>fds",
			function()
				require("snacks").picker.lsp_symbols({})
			end,
			mode = { "n" },
			desc = "snacks: symbols",
		},
		{
			"<leader>fws",
			function()
				require("snacks").picker.lsp_workspace_symbols({})
			end,
			mode = { "n" },
			desc = "snacks: workspace symbols",
		},
		{
			"<F11>",
			function()
				require("snacks").picker.lsp_references({})
			end,
			mode = { "n" },
			desc = "snacks: lsp references",
		},
		{
			"<F12>",
			function()
				require("snacks").picker.lsp_definitions({})
			end,
			mode = { "n" },
			desc = "snacks: lsp definitions",
		},
		{
			"<leader>fs",
			function()
				require("snacks").picker.spelling({})
			end,
			mode = { "n" },
			desc = "snacks: spelling",
		},
		{
			"<leader>ft",
			function()
				require("snacks").picker.treesitter({})
			end,
			mode = { "n" },
			desc = "snacks: treesitter",
		},
		{
			"<leader>fa",
			function()
				require("snacks").picker.pickers({})
			end,
			mode = { "n" },
			desc = "snacks: pickers",
		},
		{
			"<leader>fo",
			function()
				require("snacks").picker.todo_comments({})
			end,
			mode = { "n" },
			desc = "snacks: todo",
		},
		{
			"<leader>js",
			function()
				require("maladroitthief.plugins.pickers.jj").status()
			end,
			mode = { "n" },
			desc = "snacks: jj status",
		},
	},
}
