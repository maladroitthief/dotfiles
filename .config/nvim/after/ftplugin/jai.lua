_G.jai_env_set = _G.jai_env_set
	or (function()
		vim.bo.commentstring = "// %s"
		vim.opt.textwidth = 0

		return true
	end)()
