local opts = { noremap=true, silent=true }

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  -- vim.keymap.set('n', '<F1>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<F5>', vim.lsp.buf.format, bufopts)
  -- vim.keymap.set('n', '<F7>', vim.lsp.buf.references, bufopts)
  -- vim.keymap.set('n', '<F8>', vim.lsp.buf.hover, bufopts)
  vim.api.nvim_create_autocmd("BufWritePost", {
    callback = function()
      vim.lsp.buf.format()
    end
  })
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- Python
require('lspconfig')['pyright'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
}

-- Ruby
-- require('lspconfig')['solargrapgh'].setup{
--   on_attach = on_attach,
--   flags = lsp_flags,
-- }

-- Go
require('lspconfig')['gopls'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
}
