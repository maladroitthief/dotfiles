local lsp_zero = require("lsp-zero")

lsp_zero.preset("recommended")

lsp_zero.ensure_installed({
  'pyright',
  'gopls',
  'rust_analyzer',
  'solargraph',
  'jsonls',
  'sqlls',
  'docker_compose_language_service',
  'dockerls',
  'ansiblels',
  'marksman',
  'lua_ls',
  'yamlls',
  'cssls',
  'tsserver',
  'html'
})

lsp_zero.nvim_workspace()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp_zero.defaults.cmp_mappings({
  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-l>'] = cmp.mapping.confirm({ select = true }),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ['<Tab>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<S-Tab>'] = nil

lsp_zero.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp_zero.set_preferences({
  suggest_lsp_servers = false
})

lsp_zero.set_sign_icons({
  error = '🦀',
  warn = '🫠',
  hint = '🐢',
  info = '👀'
})

lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "<F1>", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<F3>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<F4>", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set('n', '<F5>', function()
    vim.lsp.buf.format { async = true }
  end, opts)
  vim.keymap.set("n", "<F6>", function() vim.lsp.buf.code_action() end, opts)
end)

lsp_zero.setup()

vim.diagnostic.config({
  virtual_text = true
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
  end
})




