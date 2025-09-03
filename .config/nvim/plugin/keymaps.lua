local nvim_prefix = "<leader>n"

-- file navigation
vim.keymap.set("n", "<leader><leader>", "<c-^>", { desc = "nvim: previous buffer" })
vim.keymap.set("n", "<leader>er", vim.cmd.Explore, { desc = "nvim: explore" })

-- sorcery with moving blocks in visual mode
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

-- goto file
vim.keymap.set("n", nvim_prefix .. "f", "<C-W>gF", { desc = "nvim: goto file" })

-- format
vim.keymap.set("n", nvim_prefix .. "c", function()
	-- viB
	-- !column -t -o ' '
	-- gv=
end, { desc = "nvim: format columns" })
