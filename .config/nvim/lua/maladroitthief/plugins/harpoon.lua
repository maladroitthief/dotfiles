return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, {
			desc = "harpoon: add",
		})
		vim.keymap.set("n", "<leader>he", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, {
			desc = "harpoon: menu",
		})

		vim.keymap.set("n", "<C-N>", function()
			harpoon:list():next()
		end, {
			noremap = true,
			desc = "harpoon: next",
		})
		vim.keymap.set("n", "<C-P>", function()
			harpoon:list():prev()
		end, {
			noremap = true,
			desc = "harpoon: previous",
		})

		for ii = 1, 9 do
			vim.keymap.set("n", "<leader>h" .. ii, function()
				harpoon:list():select(ii)
			end, {
				noremap = true,
				desc = "harpoon: select " .. ii,
			})
		end
	end,
}
