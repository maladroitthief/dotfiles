vim.g.mapleader = " "

-- file navigation
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore, { desc = "nvim: explore" })
vim.keymap.set("n", "<Leader>er", vim.cmd.Explore, { desc = "nvim: explore" })
vim.keymap.set("n", "<Leader>re", vim.cmd.Rexplore, { desc = "nvim: rexplore" })
vim.keymap.set("n", "<Leader><Leader>", "<C-^>", { desc = "nvim: previous buffer" })

-- sorcery with moving blocks in visual mode
-- TODO replace with lua api
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "nvim: move visual block down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "nvim: move visual block up" })

-- centering the window on jumps
vim.keymap.set("n", "G", "Gzz", { desc = "nvim: center on jump" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "nvim: center on jump down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "nvim: center on jump up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "nvim: center on jump next" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "nvim: center on jump last" })

-- merge lines
vim.keymap.set("n", "J", "mzJ`z", { desc = "nvim: merge lines" })

-- tmux movements
vim.keymap.set("n", "<C-J>", "<C-W><C-J>", { desc = "nvim: tmux down" })
vim.keymap.set("n", "<C-K>", "<C-W><C-K>", { desc = "nvim: tmux up" })
vim.keymap.set("n", "<C-L>", "<C-W><C-L>", { desc = "nvim: tmux right" })
vim.keymap.set("n", "<C-H>", "<C-W><C-H>", { desc = "nvim: tmux left" })

-- remove find highlights
vim.keymap.set("n", "<ESC>", function()
	vim.cmd("noh")
end, { desc = "nvim: remove highlights" })

-- unmaps
vim.keymap.set("n", "Q", "<nop>")

-- source current file
vim.keymap.set("n", "<leader>so", function()
	vim.cmd("so")
end, { desc = "nvim: source current file" })

-- overriding .tf filetype
vim.filetype.add({
	extension = {
		tf = "terraform",
	},
})

-- terminal mode
vim.keymap.set("n", "<F8>", function()
    vim.api.nvim_command("make")
end, { desc = "nvim: make" })

-- splits
vim.keymap.set("n", "<leader>s", function()
	vim.cmd("split")
end, { desc = "nvim: split" })
vim.keymap.set("n", "<leader>v", function()
	vim.cmd("vsplit")
end, { desc = "nvim: vertical split" })
