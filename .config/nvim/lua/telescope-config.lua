nmap('<C-P>', ':Telescope find_files<CR>')
nmap('<C-F>', ':Telescope live_grep<CR>')
nmap('<C-B>', ':Telescope file_browser<CR>')
nmap('<C-G>', ':Telescope git_status<CR>')

local fb_actions = require "telescope._extensions.file_browser.actions"
require("telescope").setup {
  extensions = {
    file_browser = {
      -- path
      -- cwd
      cwd_to_path = false,
      grouped = false,
      files = true,
      add_dirs = true,
      depth = 1,
      auto_depth = false,
      select_buffer = false,
      hidden = true,
      -- respect_gitignore
      -- browse_files
      -- browse_folders
      hide_parent_dir = false,
      collapse_dirs = false,
      prompt_path = false,
      quiet = false,
      dir_icon = "📁",
      dir_icon_hl = "Default",
      display_stat = {
        date = true,
        size = true,
        mode = false
      },
      hijack_netrw = false,
      use_fd = true,
      git_status = true,
      mappings = {
        ["i"] = {
          ["<C-n>"] = fb_actions.create,
          ["<C-N>"] = fb_actions.create_from_prompt,
          ["<F2>"] = fb_actions.rename,
          ["<C-m>"] = fb_actions.move,
          ["<C-c>"] = fb_actions.copy,
          ["<C-x>"] = fb_actions.remove,
          ["<C-o>"] = fb_actions.open,
          ["<C-g>"] = fb_actions.goto_parent_dir,
          ["<C-~>"] = fb_actions.goto_home_dir,
          ["<C-w>"] = fb_actions.goto_cwd,
          ["<C-t>"] = fb_actions.change_cwd,
          ["<C-f>"] = fb_actions.toggle_browser,
          ["<C-h>"] = fb_actions.toggle_hidden,
          ["<C-a>"] = fb_actions.toggle_all,
          ["<bs>"] = fb_actions.backspace,
        },
        ["n"] = {
          ["<C-n>"] = fb_actions.create,
          ["<C-N>"] = fb_actions.create_from_prompt,
          ["<F2>"] = fb_actions.rename,
          ["<C-m>"] = fb_actions.move,
          ["<C-c>"] = fb_actions.copy,
          ["<C-x>"] = fb_actions.remove,
          ["<C-o>"] = fb_actions.open,
          ["<C-g>"] = fb_actions.goto_parent_dir,
          ["<C-~>"] = fb_actions.goto_home_dir,
          ["<C-w>"] = fb_actions.goto_cwd,
          ["<C-t>"] = fb_actions.change_cwd,
          ["<C-f>"] = fb_actions.toggle_browser,
          ["<C-h>"] = fb_actions.toggle_hidden,
          ["<C-a>"] = fb_actions.toggle_all,
        },
      },
    },
  },
}

