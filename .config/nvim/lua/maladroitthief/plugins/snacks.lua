local snacks_prefix = "<leader>f"
local git_prefix = "<leader>g"
local jj_prefix = "<leader>j"

-- TODO: move this into it's own repo -ian
local M = {}

function M.status()
	local function normalize_list(t)
		local normalized = {}
		for _, v in pairs(t) do
			if v ~= nil then
				table.insert(normalized, v)
			end
		end
		return normalized
	end

	local harpoon = require("harpoon")

	Snacks.picker({
		finder = function()
			local file_paths = {}
			local list = normalize_list(harpoon:list().items)

			for _, item in ipairs(list) do
				-- print(vim.inspect(item))
				local pos = { 1, 0 }
				if item.context ~= nil then
					pos = { item.context.row, item.context.col }
				end

				table.insert(file_paths, {
					text = item.value,
					file = item.value,
					pos = pos,
				})
			end

			return file_paths
		end,
		win = {
			input = {
				keys = { ["dd"] = { "harpoon_delete", mode = { "n", "x" } } },
			},
			list = {
				keys = { ["dd"] = { "harpoon_delete", mode = { "n", "x" } } },
			},
		},
		actions = {
			harpoon_delete = function(picker, item)
				local to_remove = item or picker:selected()
				harpoon:list():remove({ value = to_remove.text })
				harpoon:list().items = normalize_list(harpoon:list().items)
				picker:find({ refresh = true })
			end,
		},
	})
end

return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			---@type table<string, snacks.win.Config>
			styles = {
				notification = {
					border = "rounded",
					zindex = 100,
					ft = "markdown",
					wo = {
						winblend = 5,
						wrap = true,
						conceallevel = 2,
						colorcolumn = "",
					},
					bo = { filetype = "snacks_notif" },
				},
			},
			bigfile = { enabled = true },
			bufdelete = { enabled = true },
			dashboard = {
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
				},
			},
			dim = { enabled = true },
			explorer = { enabled = false },
			image = { enabled = true },
			indent = { enabled = true },
			-- NOTE: maybe try this? -ian
			input = { enabled = false },
			notifier = {
				enabled = true,
				timeout = 5000, -- default timeout in ms
				width = { min = 40, max = 0.4 },
				height = { min = 1, max = 0.6 },
				-- editor margin to keep free. tabline and statusline are taken into account automatically
				margin = { top = 0, right = 1, bottom = 0 },
				padding = true, -- add 1 cell of left/right padding to the notification window
				sort = { "level", "added" }, -- sort by level and time
				-- minimum log level to display. TRACE is the lowest
				-- all notifications are stored in history
				level = vim.log.levels.TRACE,
				icons = {
					error = " ",
					warn = " ",
					info = " ",
					debug = " ",
					trace = " ",
				},
				keep = function(notif)
					return vim.fn.getcmdpos() > 0
				end,
				---@type snacks.notifier.style
				style = "compact",
				top_down = true, -- place notifications from top to bottom
				date_format = "%R", -- time format for notifications
				-- format for footer when more lines are available
				-- `%d` is replaced with the number of lines.
				-- only works for styles with a border
				---@type string|boolean
				more_format = " ↓ %d lines ",
				refresh = 50, -- refresh at most every 50ms
			},
			picker = {
				win = {
					input = {
						keys = {
							["<c-h>"] = { "harpoon", mode = { "i", "n" } },
						},
					},
					list = {
						keys = {
							["<c-h>"] = { "harpoon", mode = { "i", "n" } },
						},
					},
				},
				actions = {
					harpoon = function(picker)
						picker:close()
						local sel = picker:selected()
						local items = #sel > 0 and sel or picker:items()
						local harpoon = require("harpoon")
						for _, item in ipairs(items) do
							local pos = { 1, 0 }
							if item.pos ~= nil then
								pos = item.pos
							end

							local harpoon_list_item = {
								value = item.file,
								context = {
									row = pos[1],
									col = pos[2],
								},
							}

							harpoon:list():add(harpoon_list_item)
						end
					end,
				},
			},
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
				enabled = true,
				git = {
					-- patterns to match Git signs
					patterns = { "GitSign", "MiniDiffSign" },
				},
			},
			words = { enabled = true },
		},
		keys = {
			{
				snacks_prefix .. "`",
				function()
					require("snacks").profiler.toggle()
				end,
				mode = { "n" },
				desc = "snacks: profile",
			},
			{
				snacks_prefix .. "p",
				function()
					require("snacks").picker.projects()
				end,
				mode = { "n" },
				desc = "snacks: projects",
			},
			{
				snacks_prefix .. "f",
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
				snacks_prefix .. "g",
				function()
					require("snacks").picker.grep({
						finder = "grep",
						regex = true,
						format = "file",
						show_empty = true,
						hidden = true,
						ignored = true,
						live = true, -- live grep by default
						supports_live = true,
					})
				end,
				mode = { "n" },
				desc = "snacks: grep",
			},
			{
				snacks_prefix .. "if",
				function()
					require("snacks").picker.files({
						finder = "files",
						format = "file",
						cwd = vim.fn.expand("%:p:h"),
						show_empty = true,
						hidden = false,
						ignored = false,
						follow = false,
						supports_live = true,
					})
				end,
				mode = { "n" },
				desc = "snacks: inner files",
			},
			{
				snacks_prefix .. "ig",
				function()
					require("snacks").picker.grep({
						finder = "grep",
						cwd = vim.fn.expand("%:p:h"),
						regex = true,
						format = "file",
						show_empty = true,
						hidden = true,
						ignored = true,
						live = true, -- live grep by default
						supports_live = true,
					})
				end,
				mode = { "n" },
				desc = "snacks: inner grep",
			},
			{
				snacks_prefix .. "b",
				function()
					require("snacks").picker.buffers({})
				end,
				mode = { "n" },
				desc = "snacks: buffers",
			},
			{
				snacks_prefix .. "y",
				function()
					require("snacks").picker.cliphist({})
				end,
				mode = { "n" },
				desc = "snacks: clip history",
			},
			{
				git_prefix .. "s",
				function()
					require("snacks").picker.git_status({})
				end,
				mode = { "n" },
				desc = "snacks: git status",
			},
			{
				snacks_prefix .. "h",
				function()
					require("snacks").picker.help({})
				end,
				mode = { "n" },
				desc = "snacks: help",
			},
			{
				snacks_prefix .. "j",
				function()
					require("snacks").picker.jumps({})
				end,
				mode = { "n" },
				desc = "snacks: jumps",
			},
			{
				snacks_prefix .. "?",
				function()
					require("snacks").picker.keymaps({})
				end,
				mode = { "n" },
				desc = "snacks: keymaps",
			},
			{
				snacks_prefix .. "ds",
				function()
					require("snacks").picker.lsp_symbols({})
				end,
				mode = { "n" },
				desc = "snacks: symbols",
			},
			{
				snacks_prefix .. "ws",
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
				snacks_prefix .. "s",
				function()
					require("snacks").picker.spelling({})
				end,
				mode = { "n" },
				desc = "snacks: spelling",
			},
			{
				snacks_prefix .. "t",
				function()
					require("snacks").picker.treesitter({})
				end,
				mode = { "n" },
				desc = "snacks: treesitter",
			},
			{
				snacks_prefix .. "a",
				function()
					require("snacks").picker.pickers({})
				end,
				mode = { "n" },
				desc = "snacks: pickers",
			},
			{
				snacks_prefix .. "o",
				function()
					require("snacks").picker.todo_comments({})
				end,
				mode = { "n" },
				desc = "snacks: todo",
			},
			{
				jj_prefix .. "s",
				function()
					require("jj-picker").status()
				end,
				mode = { "n" },
				desc = "snacks: jj status",
			},
			{
				snacks_prefix .. "r",
				function()
					require("snacks").picker.registers({})
				end,
				mode = { "n" },
				desc = "snacks: registers",
			},
			{
				snacks_prefix .. "e",
				function()
					require("snacks").picker.icons({})
				end,
				mode = { "n" },
				desc = "snacks: emojis",
			},
			{
				snacks_prefix .. "e",
				function()
					require("snacks").picker.icons({})
				end,
				mode = { "n" },
				desc = "snacks: emojis",
			},
			{
				snacks_prefix .. "m",
				function()
					require("snacks").picker.marks({})
				end,
				mode = { "n" },
				desc = "snacks: marks",
			},
			{
				snacks_prefix .. "n",
				function()
					require("snacks").picker.notifications({})
				end,
				mode = { "n" },
				desc = "snacks: notifications",
			},
			{
				snacks_prefix .. "q",
				function()
					M.status()
				end,
				mode = { "n" },
				desc = "snacks: harpoon",
			},
		},
	},
}
