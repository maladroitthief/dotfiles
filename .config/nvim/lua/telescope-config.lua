nmap('<C-P>', ':Telescope find_files find_command=rg,--ignore,--hidden,--files <CR>')
nmap('<C-F>', ':Telescope live_grep<CR>')
nmap('<C-O>', ':Telescope file_browser<CR>')
nmap('<leader>gs', ':Telescope git_status<CR>')
nmap('<leader>gb', ':Telescope git_branches<CR>')
nmap('<leader>gc', ':Telescope git_commits<CR>')
nmap('<C-M>', ':Telescope lsp_document_symbols<CR>')
nmap('<C-S>', ':Telescope lsp_dynamic_workspace_symbols<CR>')
nmap('<F8>', ':Telescope diagnostics<CR>')
nmap('<F9>', ':Telescope lsp_incoming_calls<CR>')
nmap('<F10>', ':Telescope lsp_outgoing_calls<CR>')
nmap('<F11>', ':Telescope lsp_references<CR>')
nmap('<F12>', ':Telescope lsp_definitions<CR>')

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

