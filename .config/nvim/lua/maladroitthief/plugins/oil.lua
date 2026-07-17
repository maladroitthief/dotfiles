local oil_prefix = "<leader>e"

function _G.get_oil_winbar()
	local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
	local dir = require("oil").get_current_dir(bufnr)
	if dir then
		return vim.fn.fnamemodify(dir, ":~")
	else
		-- If there is no current directory (e.g. over ssh), just show the buffer name
		return vim.api.nvim_buf_get_name(0)
	end
end

return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				use_default_keymaps = false,
				columns = {
					"icon",
				},
				view_options = {
					show_hidden = true,
				},
				win_options = {
					winbar = "%!v:lua.get_oil_winbar()",
				},
				keymaps = {
					[oil_prefix .. "?"] = { "actions.show_help", mode = "n" },
					["<CR>"] = "actions.select",
					[oil_prefix .. "."] = { "actions.toggle_hidden", mode = "n" },
					[oil_prefix .. "\\"] = { "actions.toggle_trash", mode = "n" },
				},
			})
		end,
		keys = {
			{
				oil_prefix .. "r",
				function()
					require("oil").open()
				end,
				desc = "oil: open",
			},
			{
				oil_prefix .. "l",
				function()
					OilDetailed = not OilDetailed
					if OilDetailed then
						require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
					else
						require("oil").set_columns({ "icon" })
					end
				end,
				desc = "oil: toggle file details",
			},
			{ "<C-H>", false },
			{ "<C-J>", false },
			{ "<C-K>", false },
			{ "<C-L>", false },
		},
	},
}
