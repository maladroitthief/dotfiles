local nvim_prefix = "<leader>n"

local setup = function()
	-- Autoformatting Setup
	local conform = require("conform")
	conform.setup({
		formatters = {
			prettier = {
				prepend_args = {
					"--prose-wrap",
					"always",
				},
			},
		},
		formatters_by_ft = {
			python = { "ruff_fix", "ruff_format" },
			markdown = { "prettier" },
			sql = { "sqlfmt" },
			yaml = { "prettier" },
			lua = { "stylua" },
			zig = { "zigfmt" },
			json = { "jq" },
			terraform = { "terraform_fmt" },
			go = { "goimports", "gofmt" },
			jai = { "ast-grep" },
		},
	})

	conform.formatters.injected = {
		options = {
			ignore_errors = false,
			lang_to_formatters = {
				sql = { "sleek" },
			},
		},
	}

	vim.keymap.set("n", "<F5>", function()
		local buf = vim.api.nvim_get_current_buf()
		require("conform").format({
			bufnr = buf,
			lsp_fallback = true,
			quiet = true,
		})
	end, { desc = "LSP: format" })
end

setup()

return { setup = setup }
