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
vim.keymap.set("n", "{", "{zz", { desc = "nvim: center on jump" })
vim.keymap.set("n", "}", "}zz", { desc = "nvim: center on jump" })
vim.keymap.set("n", "[[", "[[zz", { desc = "nvim: center on jump" })
vim.keymap.set("n", "]]", "]]zz", { desc = "nvim: center on jump" })

-- merge lines
vim.keymap.set("n", "J", "mzJ`z", { desc = "nvim: merge lines" })

-- tmux movements
-- vim.keymap.set("n", "<C-J>", "<C-W><C-J>", { desc = "nvim: tmux down" })
-- vim.keymap.set("n", "<C-K>", "<C-W><C-K>", { desc = "nvim: tmux up" })
-- vim.keymap.set("n", "<C-L>", "<C-W><C-L>", { desc = "nvim: tmux right" })
-- vim.keymap.set("n", "<C-H>", "<C-W><C-H>", { desc = "nvim: tmux left" })

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
vim.keymap.set("n", "gf", "gF", { desc = "nvim: goto file" })
vim.keymap.set("n", nvim_prefix .. "f", "<C-W>gF", { desc = "nvim: goto file" })

-- format
vim.keymap.set("n", nvim_prefix .. "c", "viB:!column -t -o ' '<CR>>iB", { desc = "nvim: format columns" })
vim.keymap.set("v", nvim_prefix .. "c", ":!column -t -o ' '<CR>gv>", { desc = "nvim: format columns" })

vim.keymap.set("n", nvim_prefix .. "w", ":set wrap!<CR>", { desc = "nvim: toggle wrap" })

-- camel case to snake case
vim.keymap.set("n", nvim_prefix .. "s", function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	local word = vim.fn.expand("<cword>")
	local word_start = vim.fn.matchstrpos(vim.fn.getline("."), "\\k*\\%" .. (col + 1) .. "c\\k*")[2]

	if word:find("[a-z][A-Z]") then
		local snake_case_word = word:gsub("([a-z])([A-Z])", "%1_%2"):lower()
		vim.api.nvim_buf_set_text(0, line - 1, word_start, line - 1, word_start + #word, { snake_case_word })
	elseif word:find("_[a-z]") then
		local camel_case_word = word:gsub("(_)([a-z])", function(_, l)
			return l:upper()
		end)
		vim.api.nvim_buf_set_text(0, line - 1, word_start, line - 1, word_start + #word, { camel_case_word })
	end
end, { desc = "nvim: camel to snake" })
