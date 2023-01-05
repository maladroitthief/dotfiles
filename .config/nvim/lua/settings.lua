vim.g.mapleader = ' '

-- basics
vim.o.encoding = 'utf-8'
vim.o.backspace = 'indent,eol,start'
vim.o.completeopt = 'menuone,noselect'
vim.o.history = 1000
vim.o.dictionary = '/usr/share/dict/words'
vim.o.startofline = true

-- Mapping wait time
vim.o.timeout = false
vim.o.ttimeout = true
vim.o.ttimeoutlen = 100
vim.g.updatetime = 750

-- Display
vim.o.showmatch = true
vim.o.scrolloff = 5
vim.o.synmaxcol = 300
vim.o.laststatus = 2
vim.o.foldenable = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 3
vim.o.signcolumn = 'yes'
vim.o.modelines = 0
vim.o.showcmd = true
vim.o.colorcolumn = '81'

-- Search
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.matchtime = 2
vim.o.mps = vim.o.mps .. ",<:>"

-- Whitespace characters
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.formatoptions = 'qnj1'
vim.o.expandtab = true
vim.o.list = true
vim.opt.listchars = {
  tab = '\\│\\'
  trail = '·'
  space = '·'
  extends = '»'
  precedes = '«'
  nbsp = '⣿'
  eol = '↲'
}

-- Backup
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- Command mode
vim.o.wildmenu = true
vim.o.wildignore = 'deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc'

vim.cmd('colorscheme tokyonight')
vim.api.nvim_set_hl(0, 'Normal', { fg = 'none', bg = 'none' })
