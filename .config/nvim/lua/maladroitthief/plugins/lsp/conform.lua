return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	lazy = true,
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
			end,
			mode = { "n", "v" },
			desc = "conform: format injected languages",
		},
		{
			"<F5>",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			desc = "LSP: format",
		},
	},
	opts = {
		formatters_by_ft = {
			python = { "ruff_fix", "ruff_format" },
			markdown = { "prettier" },
			sql = { "sqlfmt" },
			yaml = { "prettier" },
			lua = { "stylua" },
			zig = { "zigfmt" },
			json = { "jq" },
			terraform = { "terraform_fmt" },
			go = { "gofmt", "gci", "goimports"},
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		formatters = {
			prettier = {
				prepend_args = { "--prose-wrap", "always" },
			},
		},
		-- format_on_save = {
		--     -- These options will be passed to conform.format()
		--     timeout_ms = 500,
		--     lsp_format = "fallback",
		-- },
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
