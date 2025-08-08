local opt = vim.opt

----- Interesting Options -----

opt.inccommand = "split"

opt.smartcase = true
opt.ignorecase = true

----- Personal Preferences -----
opt.number = true
opt.relativenumber = true

opt.splitbelow = true
opt.splitright = true

opt.signcolumn = "yes"
opt.shada = { "'10", "<0", "s10", "h" }

opt.swapfile = false

-- Don't have `o` add a comment
opt.formatoptions:remove("o")

opt.wrap = true
opt.linebreak = true

opt.tabstop = 2
opt.shiftwidth = 2

opt.more = false

opt.foldmethod = "manual"

opt.title = true
opt.titlestring = '%t%( %M%)%( (%{expand("%:~:h")})%)%a (nvim)'

opt.undofile = true

opt.termguicolors = true
opt.listchars = {
	tab = "▸ ",
	lead = " ",
	space = "·",
	trail = "·",
	extends = "»",
	precedes = "«",
	nbsp = "⣿",
	eol = "↲",
}

opt.spell = true
opt.spelllang = "en_us"
