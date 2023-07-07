vim.g.ale_enabled = 1
vim.g.ale_sign_column_always = 1

vim.g.ale_lint_on_enter = 0
vim.g.ale_lint_on_save = 1

vim.g.ale_sign_error = '🔥'
vim.g.ale_sign_warning = '⚡'

--vim.g.ale_floating_preview = 1
--vim.g.ale_floating_window_border = {'│', '─', '╭', '╮', '╯', '╰', '│', '─'}
vim.g.ale_hover_cursor = 1

nmap('<F1>', ':ALEDetail<CR>')
nmap('<F2>', ':ALERename<CR>')
nmap('<F3>', ':ALELint<CR>')
nmap('<F4>', ':ALEToggle<CR>')
nmap('<F5>', ':ALEFix<CR>')
nmap('<F6>', '<CR>')
nmap('<F7>', '<CR>')
nmap('<F8>', ':ALEHover<CR>')
nmap('<F9>', ':ALEPreviousWrap<CR>')
nmap('<F10>', ':ALENextWrap<CR>')
nmap('<F11>', ':ALEGoToImplementation<CR>')
nmap('<F12>', ':ALEGoToDefinition<CR>')

vim.g.ale_fix_on_save = 0

vim.g.ale_linters = {
  ['go'] = {'gopls'}
}

vim.g.ale_fixers = {
  ['ruby'] = 'rubocop',
  ['sql'] = 'pgformatter',
  ['go'] = {'gofmt', 'goimports'},
  ['json'] = 'jq'
}

