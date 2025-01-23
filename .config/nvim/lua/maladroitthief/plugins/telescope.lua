return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
		"ThePrimeagen/harpoon",
		"ThePrimeagen/git-worktree.nvim",
		"folke/todo-comments.nvim",
		"MunifTanjim/nui.nvim",
		-- "folke/noice.nvim",
	},
	config = function()
		local builtin = require("telescope.builtin")
		local extensions = require("telescope").extensions
		local trouble = require("trouble.sources.telescope")
		local utils = require("telescope.utils")
		local actions = require("telescope.actions")

		local open_with_trouble = trouble.open
		local add_to_trouble = trouble.add

		local Layout = require("nui.layout")
		local Popup = require("nui.popup")

		local telescope = require("telescope")
		local TSLayout = require("telescope.pickers").layout

		local function make_popup(options)
			local popup = Popup(options)
			function popup.border:change_title(title)
				popup.border.set_text(popup.border, "top", title)
			end
			return TSLayout.Window(popup)
		end

		local get_visual_selection = function()
			return table.concat(vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos(".")), "\n")
		end

		vim.keymap.set("n", "<leader>tf", function()
			builtin.find_files({
				no_ignore = false,
				no_ignore_parent = false,
				hidden = true,
			})
		end, { desc = "telescope: find files" })
		vim.keymap.set("v", "<leader>tf", function()
			builtin.find_files({
				default_text = get_visual_selection(),
				no_ignore = false,
				no_ignore_parent = false,
				hidden = true,
			})
		end, { desc = "telescope: find files" })
		vim.keymap.set("n", "<leader>tif", function()
			builtin.find_files({
				prompt_title = "Find Files: Current Directory",
				cwd = utils.buffer_dir(),
				no_ignore = false,
				no_ignore_parent = false,
				hidden = true,
			})
		end, { desc = "telescope: find files in current directory" })
		vim.keymap.set("v", "<leader>tif", function()
			builtin.find_files({
				prompt_title = "Find Files: Current Directory",
				default_text = get_visual_selection(),
				cwd = utils.buffer_dir(),
				no_ignore = false,
				no_ignore_parent = false,
				hidden = true,
			})
		end, { desc = "telescope: find files in current directory" })
		vim.keymap.set("n", "<leader>taf", function()
			builtin.find_files({
				prompt_title = "Find Files: No Ignore",
				no_ignore = true,
				no_ignore_parent = true,
				hidden = true,
			})
		end, { desc = "telescope: find files, no ignore" })
		vim.keymap.set("v", "<leader>taf", function()
			builtin.find_files({
				prompt_title = "Find Files: No Ignore",
				default_text = get_visual_selection(),
				no_ignore = true,
				no_ignore_parent = true,
				hidden = true,
			})
		end, { desc = "telescope: find files, no ignore" })

		vim.keymap.set("n", "<leader>tg", function()
			builtin.live_grep({
				prompt_title = "Grep",
			})
		end, { desc = "telescope: grep files" })
		vim.keymap.set("v", "<leader>tg", function()
			builtin.live_grep({
				prompt_title = "Grep",
				default_text = get_visual_selection(),
			})
		end, { desc = "telescope: grep selection" })

		vim.keymap.set("n", "<leader>tig", function()
			builtin.live_grep({
				prompt_title = "Grep: Current Directory",
				cwd = utils.buffer_dir(),
			})
		end, { desc = "telescope: grep files in current directory" })
		vim.keymap.set("v", "<leader>tig", function()
			builtin.live_grep({
				prompt_title = "Grep: Current Directory",
				default_text = get_visual_selection(),
				cwd = utils.buffer_dir(),
			})
		end, { desc = "telescope: grep selection in current directory" })
		vim.keymap.set("n", "<leader>tag", function()
			builtin.live_grep({
				prompt_title = "Grep: No Ignore",
				additional_args = { "-u" },
			})
		end, { desc = "telescope: grep files, no ignore" })
		vim.keymap.set("v", "<leader>tag", function()
			builtin.live_grep({
				default_text = get_visual_selection(),
				prompt_title = "Grep: No Ignore",
				additional_args = { "-u" },
			})
		end, { desc = "telescope: grep files, no ignore" })
		vim.keymap.set("n", "<leader>tb", builtin.buffers, { desc = "telescope: buffers" })
		vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "telescope: git status" })
		vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "telescope: git branches" })
		vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "telescope: git commits" })
		vim.keymap.set("n", "<leader>tds", builtin.lsp_document_symbols, { desc = "telescope: document symbols" })
		vim.keymap.set(
			"n",
			"<leader>tws",
			builtin.lsp_dynamic_workspace_symbols,
			{ desc = "telescope: workspace symbols" }
		)
		vim.keymap.set("n", "<leader>t?", builtin.keymaps, { desc = "telescope: keymaps" })
		vim.keymap.set("n", "<F9>", builtin.lsp_incoming_calls, { desc = "telescope: incoming calls" })
		vim.keymap.set("n", "<F10>", builtin.lsp_outgoing_calls, { desc = "telescope: outgoing calls" })
		vim.keymap.set("n", "<F11>", builtin.lsp_references, { desc = "telescope: references" })
		vim.keymap.set("n", "<F12>", builtin.lsp_definitions, { desc = "telescope: definitions" })

		vim.keymap.set("n", "<Leader>tj", builtin.jumplist, { desc = "telescope: jumplist" })
		vim.keymap.set("n", "<Leader>ts", builtin.spell_suggest, { desc = "telescope: spelling suggest" })

		vim.keymap.set("n", "<leader>tr", builtin.registers, { desc = "telescope: registers" })
		vim.keymap.set("n", "<leader>th", builtin.help_tags, { desc = "telescope: help" })
		vim.keymap.set("n", "<leader>tt", builtin.man_pages, { desc = "telescope: man pages" })
		vim.keymap.set("n", "<leader>he", extensions.harpoon.marks, { desc = "telescope: harpoon" })
		vim.keymap.set("n", "<leader>gw", extensions.git_worktree.git_worktrees, { desc = "telescope: git worktrees" })
		vim.keymap.set(
			"n",
			"<leader>gaw",
			extensions.git_worktree.create_git_worktree,
			{ desc = "telescope: git add worktree" }
		)
		vim.keymap.set("n", "<leader>to", "<cmd>TodoTelescope<cr>", { desc = "telescope: todo" })
		-- vim.keymap.set("n", "<leader>tm", extensions.noice.noice, { desc = "telescope: noice" })

		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-t>"] = open_with_trouble,
						["<C-a>"] = add_to_trouble,
					},
					n = {
						["<C-t>"] = open_with_trouble,
						["<C-a>"] = add_to_trouble,
					},
				},
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
				},
				prompt_prefix = "󰱽  ",
				selection_caret = " ",
				entry_prefix = "  ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "descending",
				layout_strategy = "flex",
				layout_config = {
					horizontal = {
						width = 0.9,
						height = 0.6,
					},
					vertical = {
						width = 0.9,
						height = 0.9,
					},
				},
				create_layout = function(picker)
					local border = {
						results = {
							top_left = "┌",
							top = "─",
							top_right = "┬",
							right = "│",
							bottom_right = "",
							bottom = "",
							bottom_left = "",
							left = "│",
						},
						results_patch = {
							minimal = {
								top_left = "┌",
								top_right = "┐",
							},
							horizontal = {
								top_left = "┌",
								top_right = "┬",
							},
							vertical = {
								top_left = "├",
								top_right = "┤",
							},
						},
						prompt = {
							top_left = "├",
							top = "─",
							top_right = "┤",
							right = "│",
							bottom_right = "┘",
							bottom = "─",
							bottom_left = "└",
							left = "│",
						},
						prompt_patch = {
							minimal = {
								bottom_right = "┘",
							},
							horizontal = {
								bottom_right = "┴",
							},
							vertical = {
								bottom_right = "┘",
							},
						},
						preview = {
							top_left = "┌",
							top = "─",
							top_right = "┐",
							right = "│",
							bottom_right = "┘",
							bottom = "─",
							bottom_left = "└",
							left = "│",
						},
						preview_patch = {
							minimal = {},
							horizontal = {
								bottom = "─",
								bottom_left = "",
								bottom_right = "┘",
								left = "",
								top_left = "",
							},
							vertical = {
								bottom = "",
								bottom_left = "",
								bottom_right = "",
								left = "│",
								top_left = "┌",
							},
						},
					}

					local results = make_popup({
						focusable = false,
						border = {
							style = border.results,
							text = {
								top = picker.results_title,
								top_align = "center",
							},
						},
						win_options = {
							winhighlight = "Normal:Normal",
						},
					})

					local prompt = make_popup({
						enter = true,
						border = {
							style = border.prompt,
							text = {
								top = picker.prompt_title,
								top_align = "center",
							},
						},
						win_options = {
							winhighlight = "Normal:Normal",
						},
					})

					local preview = make_popup({
						focusable = false,
						border = {
							style = border.preview,
							text = {
								top = picker.preview_title,
								top_align = "center",
							},
						},
					})

					local box_by_kind = {
						vertical = Layout.Box({
							Layout.Box(preview, { grow = 1 }),
							Layout.Box(results, { grow = 1 }),
							Layout.Box(prompt, { size = 3 }),
						}, { dir = "col" }),
						horizontal = Layout.Box({
							Layout.Box({
								Layout.Box(results, { grow = 1 }),
								Layout.Box(prompt, { size = 3 }),
							}, { dir = "col", size = "50%" }),
							Layout.Box(preview, { size = "50%" }),
						}, { dir = "row" }),
						minimal = Layout.Box({
							Layout.Box(results, { grow = 1 }),
							Layout.Box(prompt, { size = 3 }),
						}, { dir = "col" }),
					}

					local function get_box()
						local strategy = picker.layout_strategy
						if strategy == "vertical" or strategy == "horizontal" then
							return box_by_kind[strategy], strategy
						end

						local height, width = vim.o.lines, vim.o.columns
						local box_kind = "horizontal"
						if width < 100 then
							box_kind = "vertical"
							if height < 40 then
								box_kind = "minimal"
							end
						end
						return box_by_kind[box_kind], box_kind
					end

					local function prepare_layout_parts(layout, box_type)
						layout.results = results
						results.border:set_style(border.results_patch[box_type])

						layout.prompt = prompt
						prompt.border:set_style(border.prompt_patch[box_type])

						if box_type == "minimal" then
							layout.preview = nil
						else
							layout.preview = preview
							preview.border:set_style(border.preview_patch[box_type])
						end
					end

					local function get_layout_size(box_kind)
						return picker.layout_config[box_kind == "minimal" and "vertical" or box_kind].size
					end

					local box, box_kind = get_box()
					local layout = Layout({
						relative = "editor",
						position = "50%",
						size = get_layout_size(box_kind),
					}, box)

					layout.picker = picker
					prepare_layout_parts(layout, box_kind)

					local layout_update = layout.update
					function layout:update()
						local box, box_kind = get_box()
						prepare_layout_parts(layout, box_kind)
						layout_update(self, { size = get_layout_size(box_kind) }, box)
					end

					return TSLayout(layout)
				end,
				file_sorter = require("telescope.sorters").get_fuzzy_file,
				file_ignore_patterns = {
					".git/*",
				},
				generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				-- winblend             = 0,
				-- border               = {},
				-- borderchars          = { "▔", "▕", "▁", "▏", "🭽", "🭾", "🭿", "🭼" },
				color_devicons = false,
				use_less = true,
				path_display = {},
				set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
			},
			pickers = {
				find_files = {
					prompt_prefix = "󰱽  ",
					hidden = true,
					no_ignore = true,
				},
				live_grep = {
					prompt_prefix = "󱎸  ",
				},
				buffers = {
					mappings = {
						i = {
							["<C-t>"] = open_with_trouble,
							["<C-a>"] = add_to_trouble,
						},
						n = {
							["<C-t>"] = open_with_trouble,
							["<C-a>"] = add_to_trouble,
							["dd"] = "delete_buffer",
						},
					},
				},
				help_tags = {
					mappings = {
						i = {
							["<CR>"] = actions.select_tab,
						},
						n = {
							["<CR>"] = actions.select_tab,
						},
					},
				},
				man_pages = {
					mappings = {
						i = {
							["<CR>"] = actions.select_tab,
						},
						n = {
							["<CR>"] = actions.select_tab,
						},
					},
				},
			},
			extensions = {
				file_browser = {
					prompt_prefix = "󰥩  ",
					hidden = true,
					-- dir_icon = "",
					dir_icon_hl = "Default",
					use_fd = true,
					display_stat = {
						date = true,
						size = true,
						mode = false,
					},
					hijack_netrw = false,
					git_status = true,
				},
			},
		})
	end,
}
