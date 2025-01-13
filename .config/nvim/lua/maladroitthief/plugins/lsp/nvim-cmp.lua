return {
  "hrsh7th/nvim-cmp",
  enabled = false,
  event = "InsertEnter",
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*",       -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp"
    },
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local cmp = require('cmp')
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local border = {
      { "🭽", "FloatBorder" },
      { "▔", "FloatBorder" },
      { "🭾", "FloatBorder" },
      { "▕", "FloatBorder" },
      { "🭿", "FloatBorder" },
      { "▁", "FloatBorder" },
      { "🭼", "FloatBorder" },
      { "▏", "FloatBorder" },
    }
    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)           -- For `luasnip` users.
        end,
      },
      window = {
        completion = cmp.config.window.bordered({
          border = border,
          winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
          zindex = 1001,
          scrolloff = 0,
          col_offset = 0,
          side_padding = 1,
        }),
        documentation = cmp.config.window.bordered({
          border = 'rounded',
          winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
          zindex = 1001,
          scrolloff = 0,
          col_offset = 0,
          side_padding = 1,
        }),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ['<S-Tab>'] = nil,
      }),
      formatting = {
        expandable_indicator = true,
        fields = { "abbr", "menu", "kind" },
        format = function(entry, item)
            item.menu = nil
            return item
          -- -- Define menu shorthand for different completion sources.
          -- local menu_icon = {
          --   nvim_lsp = "NLSP",
          --   nvim_lua = "NLUA",
          --   luasnip  = "LSNP",
          --   buffer   = "BUFF",
          --   path     = "PATH",
          -- }
          -- -- Set the menu "icon" to the shorthand for each completion source.
          -- item.menu = menu_icon[entry.source.name]

          -- -- Set 'fixed_width' to false if not provided.
          -- local fixed_width = fixed_width or false

          -- -- Get the completion entry text shown in the completion window.
          -- local content = item.abbr

          -- -- Set the fixed completion window width.
          -- if fixed_width then
          --   vim.o.pumwidth = fixed_width
          -- end

          -- -- Get the width of the current window.
          -- local win_width = vim.api.nvim_win_get_width(0)

          -- -- Set the max content width based on either: 'fixed_width'
          -- -- or a percentage of the window width, in this case 20%.
          -- -- We subtract 10 from 'fixed_width' to leave room for 'kind' fields.
          -- local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.35)

          -- -- Truncate the completion entry text if it's longer than the
          -- -- max content width. We subtract 3 from the max content width
          -- -- to account for the "..." that will be appended to it.
          -- if #content > max_content_width then
          --   item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..."
          -- else
          --   item.abbr = content .. (" "):rep(max_content_width - #content)
          -- end
          -- return item
        end,
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },         -- For luasnip users.
      }, {
        { name = 'buffer' },
      })
    })
  end,
}
