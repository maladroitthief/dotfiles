return {
    "ThePrimeagen/harpoon",
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "harpoon: add" })
        vim.keymap.set("n", "<leader>he", ui.toggle_quick_menu, { desc = "harpoon: add" })

        vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end, { desc = "harpoon: navigate to 1" })
        vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end, { desc = "harpoon: navigate to 2" })
        vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end, { desc = "harpoon: navigate to 3" })
        vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end, { desc = "harpoon: navigate to 4" })
        vim.keymap.set("n", "<leader>h5", function() ui.nav_file(5) end, { desc = "harpoon: navigate to 5" })
        vim.keymap.set("n", "<leader>h6", function() ui.nav_file(6) end, { desc = "harpoon: navigate to 6" })
        vim.keymap.set("n", "<leader>h7", function() ui.nav_file(7) end, { desc = "harpoon: navigate to 7" })
        vim.keymap.set("n", "<leader>h8", function() ui.nav_file(8) end, { desc = "harpoon: navigate to 8" })
        vim.keymap.set("n", "<leader>h9", function() ui.nav_file(9) end, { desc = "harpoon: navigate to 9" })
    end,
    opts = {},
}
