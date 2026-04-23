_G.go_env_set = _G.go_env_set
	or (function()
		vim.opt.spell = false

		if vim.fn.executable("gopls") == 1 then
			vim.lsp.enable("gopls")
		end

		local success, dap = pcall(require, "dap")
		if not success then
			vim.notify("failed to load a plugin: dap")
			return true
		end

		vim.keymap.set("n", "<leader>dt", function()
			require("dap-go").debug_test()
		end, { desc = "dap: debug test" })

		return true
	end)()
