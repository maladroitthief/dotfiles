-- basics
vim.o.encoding = "utf-8"
vim.o.backspace = "indent,eol,start"
vim.o.completeopt = "menuone,noselect"
vim.o.history = 1000
vim.o.dictionary = "/usr/share/dict/words"
vim.o.startofline = true
vim.o.clipboard = "unnamedplus"
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.o.guicursor = "n-v-c:block,"
	.. "i-ci-ve:block,"
	.. "r-cr:hor20,"
	.. "o:hor50,"
	.. "i-ci-ve:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,"
	.. "sm:block-blinkwait175-blinkoff150-blinkon175"

-- Mapping wait time
vim.o.timeout = false
vim.o.ttimeout = true
vim.o.ttimeoutlen = 100
vim.g.updatetime = 50

-- Display
vim.o.showmatch = true
vim.o.scrolloff = 10
vim.o.synmaxcol = 300
vim.o.laststatus = 2
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 3
vim.o.signcolumn = "yes"
vim.o.modelines = 0
vim.o.showcmd = true
vim.o.colorcolumn = "80"
vim.o.termguicolors = true

-- Search
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.matchtime = 2
vim.o.mps = vim.o.mps .. ",<:>"

-- Whitespace characters
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 0
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.cinoptions = "s,e0,n0,f0,{0,}0,^0,L-1,:s,=s,l0,b0,gs,hs,N0,E0,ps,ts,is,+s,c3,C0,/0,(1s,us,U0,w0,W0,k0,m1,j1,J1,)20,*70,#0,P0"
vim.o.wrap = false
vim.o.formatoptions = "qnj1"
vim.o.list = true
vim.opt.listchars = {
	tab = "▸ ",
	lead = " ",
	space = "·",
	trail = "·",
	extends = "»",
	precedes = "«",
	nbsp = "⣿",
	eol = "↲",
}

-- Backup
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

-- Command mode
vim.o.wildmenu = true
vim.o.wildignore =
	"dep,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc"

-- Spelling
vim.o.spell = true
vim.o.spelllang = "en_us"

vim.diagnostic.enable(false)

-- Filetypes
vim.filetype.add({
	extension = {
		tf = "terraform",
	},
})
