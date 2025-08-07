vim.g.mapleader = " "
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

require("maladroitthief.dotenv").eval(vim.fs.joinpath(vim.fn.stdpath "config", ".env")) ---@diagnostic disable-line: param-type-mismatch

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end

-- Add lazy to the `runtimepath`, this allows us to `require` it.
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Set up lazy, and load my `lua/maladroitthief/plugins/` folder
require("lazy").setup({ import = "maladroitthief/plugins" }, {
  change_detection = {
    notify = false,
  },
})
