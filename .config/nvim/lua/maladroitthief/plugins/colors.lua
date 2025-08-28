local colorizer_prefix = "<leader>c"

return {
	{
		"norcalli/nvim-colorizer.lua",
		opts = {},
		keys = {
			{
				colorizer_prefix .. "c",
				":ColorizerToggle<CR>",
				desc = "colorizer: toggle",
			},
		},
	},
}
