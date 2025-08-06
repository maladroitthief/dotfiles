local setup = function()
  -- Autoformatting Setup
  local conform = require "conform"
  conform.setup {
    formatters = {
			prettier = {
				prepend_args = { "--prose-wrap", "always" },
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
			go = { "gofmt", "gci", "goimports"},
      jai = { "ast-grep" },
    },
  }

  conform.formatters.injected = {
    options = {
      ignore_errors = false,
      lang_to_formatters = {
        sql = { "sleek" },
      },
    },
  }

  vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("custom-conform", { clear = true }),
    callback = function(args)
      local ft = vim.bo.filetype
      if ft == "blade" then
        require("conform").format {
          bufnr = args.buf,
          lsp_fallback = false,
          quiet = true,
          async = true,
        }

        return
      end

      if ft == "ocaml.mlx" then
        -- Hmmm... this is a little weird,
        -- it seems like it should be automatic, but that's OK
        require("conform").format {
          bufnr = args.buf,
          formatters = { "ocamlformat_mlx" },
          lsp_fallback = false,
        }

        return
      end

      require("conform").format {
        bufnr = args.buf,
        lsp_fallback = true,
        quiet = true,
      }
    end,
  })
end

setup()

return { setup = setup }
