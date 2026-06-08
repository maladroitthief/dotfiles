_G.jai_env_set = _G.jai_env_set
	or (function()
		vim.bo.commentstring = "// %s"
		vim.opt.textwidth = 0

		local success, dap = pcall(require, "dap")
		if not success then
			vim.notify("failed to load a plugin: dap")
			return true
		end

		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			name = "lldb",
			executable = {
				command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
				args = { "--port", "${port}" },
			},
		}

		dap.configurations.jai = {
			{
				name = "[jai] Launch wildflowers",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.getcwd() .. "/bin/wildflowers"
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				initCommands = {
					"command script import " .. vim.fn.stdpath("config") .. "/scripts/jai_lldb.py",
				},
			},
			{
				name = "[jai] Launch codelldb",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		return true
	end)()
