return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "*" },
			untracked = { text = "╏" },
		},
		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
		numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
		linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
		watch_gitdir = {
			follow_files = true,
		},
		auto_attach = true,
		attach_to_untracked = true,
		current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 1000,
			ignore_whitespace = false,
			virt_text_priority = 100,
		},
		current_line_blame_formatter = " => <author>, <author_time:%Y-%m-%d> - <summary>",
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		max_file_length = 40000, -- Disable if file is longer than this (in lines)
		preview_config = {
			-- Options passed to nvim_open_win
			border = "single",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]c", function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return "<Ignore>"
			end, { expr = true, desc = "git: next hunk" })

			map("n", "[c", function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return "<Ignore>"
			end, { expr = true, desc = "git: previous hunk" })

			-- Actions
			map("n", "<leader>g+", gs.stage_hunk, { desc = "git: stage hunk" })
			map("n", "<leader>g=", gs.stage_hunk, { desc = "git: stage hunk" })
			map("n", "<leader>g-", gs.undo_stage_hunk, { desc = "git: unstage hunk" })
			map("v", "<leader>g+", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "git: stage hunk" })
			map("v", "<leader>g=", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "git: stage hunk" })
			map("v", "<leader>g-", function()
				gs.undo_stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "git: unstage hunk" })

			map("n", "<leader>gS", gs.stage_buffer, { desc = "git: stage buffer" })
			map("n", "<leader>gu", gs.reset_buffer_index, { desc = "git: unstage buffer" })
			map("n", "<leader>gU", gs.reset_buffer_index, { desc = "git: unstage buffer" })
			map("n", "<leader>gr", gs.reset_hunk, { desc = "git: reset hunk" })
			map("n", "<leader>gR", gs.reset_buffer, { desc = "git: reset buffer" })

			map("n", "<leader>gd", gs.toggle_deleted, { desc = "git: toggle deleted" })
			map("n", "<leader>gp", gs.preview_hunk, { desc = "git: preview hunk" })
			map("n", "<leader>gdc", function()
				gs.diffthis("~")
			end, { desc = "git: diff" })

			map("n", "<leader>gb", function()
				gs.blame_line({ full = true })
			end, { desc = "git: blame line" })

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
		end,
	},
}
