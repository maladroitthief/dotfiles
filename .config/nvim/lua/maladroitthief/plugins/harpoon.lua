local harpoon_prefix = "<leader>h"

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", harpoon_prefix .. "a", function()
			harpoon:list():add()
		end, {
			desc = "harpoon: add",
		})
		vim.keymap.set("n", harpoon_prefix .. "e", function()
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
			vim.keymap.set("n", harpoon_prefix .. ii, function()
				harpoon:list():select(ii)
			end, {
				noremap = true,
				desc = "harpoon: select " .. ii,
			})
		end
	end,
}
