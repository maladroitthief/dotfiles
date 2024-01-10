require('gitsigns').setup {
  signs                        = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl                        = true, -- Toggle with `:Gitsigns toggle_numhl`
  linehl                       = true, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir                 = {
    follow_files = true
  },
  auto_attach                  = true,
  attach_to_untracked          = true,
  current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts      = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
  },
  current_line_blame_formatter = ' => <author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority                = 6,
  update_debounce              = 100,
  status_formatter             = nil,   -- Use default
  max_file_length              = 40000, -- Disable if file is longer than this (in lines)
  preview_config               = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm                         = {
    enable = false
  },
  on_attach                    = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    -- Actions
    map('n', '<leader>vg+', gs.stage_hunk)
    map('n', '<leader>vg=', gs.stage_hunk)
    map('n', '<leader>vg-', gs.reset_hunk)
    map('v', '<leader>vg+', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
    map('v', '<leader>vg=', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
    map('v', '<leader>vg-', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
    map('n', '<leader>vgS', gs.stage_buffer)
    map('n', '<leader>vgu', gs.undo_stage_hunk)
    map('n', '<leader>vgR', gs.reset_buffer)
    map('n', '<leader>vgp', gs.preview_hunk)
    map('n', '<leader>vgb', function() gs.blame_line { full = true } end)
    -- map('n', '<leader>vgtb', gs.toggle_current_line_blame)
    -- map('n', '<leader>vgd', gs.diffthis)
    -- map('n', '<leader>vgD', function() gs.diffthis('~') end)
    map('n', '<leader>vgtd', gs.toggle_deleted)

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end

}