nmap('<C-P>', ':Telescope find_files find_command=rg,--ignore,--hidden,--files <CR>')
nmap('<C-F>', ':Telescope live_grep<CR>')
nmap('<C-B>', ':Telescope file_browser<CR>')
nmap('<C-G>', ':Telescope git_status<CR>')

local fb_actions = require "telescope._extensions.file_browser.actions"
require("telescope").setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
    },
  },
  extensions = {
    file_browser = {
      hidden = true,
      dir_icon = ">",
      dir_icon_hl = "Default",
      use_fd = true,
      display_stat = {
        date = true,
        size = true,
        mode = false
      },
      hijack_netrw = false,
      git_status = true,
      mappings = {
        ["i"] = {
          ["<C-n>"] = fb_actions.create,
          ["<F2>"] = fb_actions.rename,
          ["<C-x>"] = fb_actions.remove,
        },
        ["n"] = {
          ["<n>"] = fb_actions.create,
          ["<F2>"] = fb_actions.rename,
          ["<x>"] = fb_actions.remove,
        },
      },
    },
  },
}

require("telescope").load_extension "file_browser"

