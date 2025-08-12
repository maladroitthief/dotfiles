return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
				-- used for completion, annotations and signatures of Neovim apis
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						-- Load luvit types when the `vim.uv` word is found
						{ path = "luvit-meta/library", words = { "vim%.uv" } },
						{ path = "/usr/share/awesome/lib/", words = { "awesome" } },
					},
				},
			},
			{ "Bilal2453/luvit-meta", lazy = true },
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			{ "j-hui/fidget.nvim", opts = {} },
			{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },

			-- Autoformatting
			"stevearc/conform.nvim",

			-- Schema information
			"b0o/SchemaStore.nvim",
		},
		config = function()
			-- Don't do LSP stuff if we're in Obsidian Edit mode
			if vim.g.obsidian then
				return
			end

			local extend = function(name, key, values)
				local mod = require(string.format("lspconfig.configs.%s", name))
				local default = mod.default_config
				local keys = vim.split(key, ".", { plain = true })
				while #keys > 0 do
					local item = table.remove(keys, 1)
					default = default[item]
				end

				if vim.islist(default) then
					for _, value in ipairs(default) do
						table.insert(values, value)
					end
				else
					for item, value in pairs(default) do
						if not vim.tbl_contains(values, item) then
							values[item] = value
						end
					end
				end
				return values
			end

			local capabilities = nil
			if pcall(require, "cmp_nvim_lsp") then
				capabilities = require("cmp_nvim_lsp").default_capabilities()
			end

			local lspconfig = require("lspconfig")

			local servers = {
				bashls = true,
				gopls = {
					manual_install = true,
					settings = {
						gopls = {
							gofmt = true,
							codelenses = {
								gc_details = false,
								generate = true,
								regenerate_cgo = true,
								run_govulncheck = true,
								test = true,
								tidy = true,
								upgrade_dependency = true,
								vendor = true,
							},
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
							analyses = {
								nilness = true,
								unusedparams = true,
								unusedwrite = true,
								useany = true,
							},
							usePlaceholders = true,
							completeUnimported = true,
							staticcheck = true,
							directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
							semanticTokens = true,
						},
					},
				},
				lua_ls = {
					-- server_capabilities = {
					--   semanticTokensProvider = vim.NIL,
					-- },
				},
				rust_analyzer = true,
				ruff = { manual_install = true },
				jsonls = {
					server_capabilities = {
						documentFormattingProvider = false,
					},
					settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
							validate = { enable = true },
						},
					},
				},
				yamlls = {
					settings = {
						yaml = {
							schemaStore = {
								enable = false,
								url = "",
							},
							-- schemas = require("schemastore").yaml.schemas(),
						},
					},
				},
				gleam = {
					manual_install = true,
				},
				clangd = {
					-- TODO: Could include cmd, but not sure those were all relevant flags.
					--    looks like something i would have added while i was floundering
					init_options = { clangdFileStatus = true },

					filetypes = { "c" },
				},
				solargraph = true,
				sqlls = true,
				dockerls = true,
				ansiblels = true,
				ts_ls = true,
				terraformls = true,
				zls = true,
			}

			local servers_to_install = vim.tbl_filter(function(key)
				local t = servers[key]
				if type(t) == "table" then
					return not t.manual_install
				else
					return t
				end
			end, vim.tbl_keys(servers))

			require("mason").setup()
			local ensure_installed = {
				"stylua",
				"lua_ls",
				"delve",
			}

			vim.list_extend(ensure_installed, servers_to_install)
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			for name, config in pairs(servers) do
				if config == true then
					config = {}
				end
				config = vim.tbl_deep_extend("force", {}, {
					capabilities = capabilities,
				}, config)

				lspconfig[name].setup(config)
			end

			local disable_semantic_tokens = {
				-- lua = true,
			}

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

					local settings = servers[client.name]
					if type(settings) ~= "table" then
						settings = {}
					end

					vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

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
					end, { buffer = args.buf, desc = "LSP: format" })

					if client:supports_method("codeActionProvider") then
						vim.keymap.set("n", "<F6>", function()
							vim.lsp.buf.code_action()
						end, { buffer = args.buf, desc = "LSP: code action" })
					end

					vim.keymap.set("n", "<F7>", function()
						vim.diagnostic.enable(not vim.diagnostic.is_enabled())
					end, { buffer = args.buf, desc = "LSP: toggle diagnostics" })

					local filetype = vim.bo[bufnr].filetype
					if disable_semantic_tokens[filetype] then
						client.server_capabilities.semanticTokensProvider = nil
					end

					-- Override server capabilities
					if settings.server_capabilities then
						for k, v in pairs(settings.server_capabilities) do
							if v == vim.NIL then
								---@diagnostic disable-next-line: cast-local-type
								v = nil
							end

							client.server_capabilities[k] = v
						end
					end
				end,
			})

			require("maladroitthief.autoformat").setup()

			require("lsp_lines").setup()
			vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
		end,
	},
}
