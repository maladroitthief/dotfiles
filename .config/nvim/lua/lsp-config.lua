local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'pyright',
  'gopls',
  'solargraph',
  'jsonls',
  'sqlls',
  'docker_compose_language_service',
  'dockerls',
  'ansiblels',
  'marksman',
  'yamlls'
})

lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-l>'] = cmp.mapping.confirm({ select = true }),
  ['<CR>'] = cmp.mapping.confirm({ select = true }), 
  ['<Tab>'] = cmp.mapping.confirm({ select = true }), 
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = false
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "<F1>", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<F3>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<F4>", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set('n', '<F5>', function()
    vim.lsp.buf.format { async = true }
  end, opts)
  vim.keymap.set("n", "<F6>", function() vim.lsp.buf.code_action() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})

