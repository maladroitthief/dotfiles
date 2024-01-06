require("neodev").setup({})

local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
-------------------------------------------------------------------------------
lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-l>'] = cmp.mapping.confirm({ select = true }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ['<S-Tab>'] = nil,
  }),
  formatting = {
    fields = { "abbr", "menu", "kind" },
    format = function(entry, item)
      -- Define menu shorthand for different completion sources.
      local menu_icon = {
        nvim_lsp = "NLSP",
        nvim_lua = "NLUA",
        luasnip  = "LSNP",
        buffer   = "BUFF",
        path     = "PATH",
      }
      -- Set the menu "icon" to the shorthand for each completion source.
      item.menu = menu_icon[entry.source.name]

      -- Set 'fixed_width' to false if not provided.
      local fixed_width = fixed_width or false

      -- Get the completion entry text shown in the completion window.
      local content = item.abbr

      -- Set the fixed completion window width.
      if fixed_width then
        vim.o.pumwidth = fixed_width
      end

      -- Get the width of the current window.
      local win_width = vim.api.nvim_win_get_width(0)

      -- Set the max content width based on either: 'fixed_width'
      -- or a percentage of the window width, in this case 20%.
      -- We subtract 10 from 'fixed_width' to leave room for 'kind' fields.
      local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.2)

      -- Truncate the completion entry text if it's longer than the
      -- max content width. We subtract 3 from the max content width
      -- to account for the "..." that will be appended to it.
      if #content > max_content_width then
        item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..."
      else
        item.abbr = content .. (" "):rep(max_content_width - #content)
      end
      return item
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})
-------------------------------------------------------------------------------
local signs = {
  Error = '',
  Warn = '',
  Hint = '',
  Info = '',
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-------------------------------------------------------------------------------
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set("n", "<F1>", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<F3>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<F4>", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '<F5>', function()
      vim.lsp.buf.format { async = true }
    end, opts)
    vim.keymap.set("n", "<F6>", function() vim.lsp.buf.code_action() end, opts)
    vim.diagnostic.enable(opts.buffer)
  end
})
-------------------------------------------------------------------------------
require('mason').setup()
require('mason-lspconfig').setup()
-------------------------------------------------------------------------------
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
  opts.border = opts.border or "rounded"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-------------------------------------------------------------------------------
lspconfig.pyright.setup({})
lspconfig.gopls.setup({})
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.code_action({
      context = {
        only = { 'source.organizeImports' }
      },
      apply = true,
    })
  end
})
lspconfig.rust_analyzer.setup({})
lspconfig.solargraph.setup({})
lspconfig.jsonls.setup({})
lspconfig.sqlls.setup({})
lspconfig.docker_compose_language_service.setup({})
lspconfig.dockerls.setup({})
lspconfig.ansiblels.setup({})
lspconfig.marksman.setup({})
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
      },
      diagnostics = {
        globals = { 'vim' }
      },
    },
  },
})
lspconfig.yamlls.setup({})
lspconfig.cssls.setup({})
lspconfig.tsserver.setup({})
lspconfig.html.setup({})
