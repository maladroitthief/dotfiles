vim.g.gitgutter_grep = 'ag'
vim.g.gitgutter_map_keys = 0
vim.o.updatetime = 100
nmap('<Leader>k', ':GitGutterPrevHunk<CR>')
nmap('<Leader>j', ':GitGutterNextHunk<CR>')
nmap('<Leader>p', ':GitGutterPreviewHunk<CR>')
nmap('<Leader>+', ':GitGutterStageHunk<CR>')
nmap('<Leader>-', ':GitGutterUndoHunk<CR>')
