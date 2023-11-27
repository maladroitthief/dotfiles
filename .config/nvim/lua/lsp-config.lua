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
    },
  },
})
lspconfig.yamlls.setup({})
lspconfig.cssls.setup({})
lspconfig.tsserver.setup({})
lspconfig.html.setup({})
