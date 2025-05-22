local group = vim.api.nvim_create_augroup("go_macros", {})
vim.api.nvim_create_autocmd("BufEnter", {
	group = group,
	pattern = "*.go",
	callback = function()
		vim.fn.setreg("e", [[iif err != nil {return err}]])
		vim.fn.setreg("b", [[Aruntime.Breakpoint()]])
	end,
})
