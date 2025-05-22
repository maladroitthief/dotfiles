vim.bo.commentstring = "// %s"

local group = vim.api.nvim_create_augroup('jai_macros', {})
vim.api.nvim_create_autocmd("BufEnter", {
    group = group,
    pattern = "*.jai",
    callback = function()
		vim.fn.setreg("b", [[Abreakpoint();]])
    end,
})
