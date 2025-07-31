return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lspconfig = require("lspconfig")
		local border = {
			{ "🭽", "FloatBorder" },
			{ "▔", "FloatBorder" },
			{ "🭾", "FloatBorder" },
			{ "▕", "FloatBorder" },
			{ "🭿", "FloatBorder" },
			{ "▁", "FloatBorder" },
			{ "🭼", "FloatBorder" },
			{ "▏", "FloatBorder" },
		}
		local signs = {
			Error = "",
			Warn = "",
			Hint = "",
			Info = "",
		}

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("my.lsp", {}),
			callback = function(args)
				local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

				if client:supports_method("hoverProvider") then
					vim.keymap.set("n", "<F1>", function()
						vim.lsp.buf.hover()
					end, { buffer = args.buf, desc = "LSP: hover" })
				end

				if client:supports_method("renameProvider") then
					vim.keymap.set("n", "<F2>", function()
						vim.lsp.buf.rename()
					end, { buffer = args.buf, desc = "LSP: rename" })
				end

				vim.keymap.set("i", "<F1>", function()
					vim.lsp.buf.signature_help()
				end, { buffer = args.buf, desc = "LSP: signature help" })

				vim.keymap.set("n", "<F4>", function()
					vim.diagnostic.open_float()
				end, { buffer = args.buf, desc = "LSP: open float" })

				vim.keymap.set("n", "<F5>", function()
					require("conform").format({ async = true, lsp_format = "fallback" })
					-- vim.lsp.buf.format { async = true }
				end, { buffer = args.buf, desc = "LSP: format" })

				if client:supports_method("codeActionProvider") then
					vim.keymap.set("n", "<F6>", function()
						vim.lsp.buf.code_action()
					end, { buffer = args.buf, desc = "LSP: code action" })
				end

				vim.keymap.set("n", "<F7>", function()
					vim.diagnostic.enable(not vim.diagnostic.is_enabled())
				end, { buffer = args.buf, desc = "LSP: toggle diagnostics" })
			end,
		})

		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})

		local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = opts.border or border
			opts.max_width = opts.max_width or 100
			return orig_util_open_floating_preview(contents, syntax, opts, ...)
		end

		vim.filetype.add({ extension = { jai = "jai" } })

		local servers = {
			"ruff",
			"gopls",
			"rust_analyzer",
			"solargraph",
			"jsonls",
			"sqlls",
			"docker_compose_language_server",
			"dockerls",
			"ansiblels",
			"marksman",
			"lua_ls",
			"yamlls",
			"ts_ls",
			"terraformls",
			"clangd",
			"zls",
			"jails",
		}

		vim.lsp.enable(servers)
	end,
}
