return { -- Autocompletion
  'hrsh7th/nvim-cmp',
  -- event = 'InsertEnter',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        -- Build Step is needed for regex support in snippets
        -- This step is not supported in many windows environments
        -- Remove the below condition to re-enable on windows
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
    },
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'rafamadriz/friendly-snippets',
    -- Adds other completion capabilities.
    --  nvim-cmp does not ship with all sources by default. They are split
    --  into multiple repos for maintenance purposes.
    -- Adds a number of user-friendly snippets
  },
  config = function()
    local luasnip = require 'luasnip'
    luasnip.config.setup {}
    require('luasnip.loaders.from_vscode').lazy_load()
    luasnip.filetype_extend('markdown', { 'tex' })
    local cmp = require 'cmp'

    local kind_icons = {
      Text = '󰉿',
      Method = 'm',
      Function = '󰊕',
      Constructor = '',
      Field = '',
      Variable = '󰆧',
      Class = '󰌗',
      Interface = '',
      Module = '',
      Property = '',
      Unit = '',
      Value = '󰎠',
      Enum = '',
      Keyword = '󰌋',
      Snippet = '',
      Color = '󰏘',
      File = '󰈙',
      Reference = '',
      Folder = '󰉋',
      EnumMember = '',
      Constant = '󰇽',
      Struct = '',
      Event = '',
      Operator = '󰆕',
      TypeParameter = '󰊄',
    }

    -- Custom nf-md symbols for : trigger
    local symbols = {

      { label = '', insertText = '', trigger = 'bullet' },
      { label = '󱑍', insertText = '󱑍', trigger = 'time' },
      { label = '󰌶', insertText = '󰌶', trigger = 'question' }, -- '󱧣', '󱧤'
      { label = '󰓎', insertText = '󰓎', trigger = 'star' },
      { label = '󰌵', insertText = '󰌵', trigger = 'idea' }, -- '󰌵', '󰛨'
      { label = '󱧢', insertText = '󱧢', trigger = 'hint' },
      { label = '󰋽', insertText = '󰋽', trigger = 'info' }, -- '󰋽', '󰙎'
      { label = '󰐃', insertText = '󰐃', trigger = 'reminder' }, -- '󰐃', '󰤱'
      { label = '', insertText = '', trigger = 'degree' },
      { label = '󰃮', insertText = '󰃮', trigger = 'calendar' },
      { label = '󰃭', insertText = '󰃭', trigger = 'day' },
      { label = '󰨳', insertText = '󰨳', trigger = 'week' },
      { label = '󰓹', insertText = '󰓹', trigger = 'tag' },
    }

    -- Register custom cmp source for symbols
    cmp.register_source('symbols', {
      complete = function(_, params, callback)
        local line = params.context.cursor_before_line

        -- Check if there's a colon in the line
        local colon_pos = line:find ':'
        if not colon_pos then
          callback { items = {}, isIncomplete = false }
          return
        end

        -- Get everytheng after the last colon
        local query = line:match '.*:(.*)'
        if not query then
          callback { items = {}, isIncomplete = false }
          return
        end

        local items = {}
        for _, sym in ipairs(symbols) do
          -- Match if query is empty or if trigger starts with the query
          if query == '' or sym.trigger:find('^' .. vim.pesc(query)) then
            -- Calculate the range to replace (from colon to end of query)
            local start_col = colon_pos - 1 -- 0-based indexing
            local end_col = #line -- End of current line

            table.insert(items, {
              label = sym.label .. ' ' .. sym.trigger, -- Show both icon and trigger word
              insertText = sym.insertText,
              kind = cmp.lsp.CompletionItemKind.Text,
              filterText = ':' .. sym.trigger, -- Include colon trigger in filter text
            })
          end
        end

        callback { items = items, isIncomplete = false }
      end,

      -- Add keyword pattern to specify when this source should be active
      get_keyword_pattern = function()
        return [[:.*]]
      end,
    })

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      completion = { completeopt = 'menu,menuone,noinsert' },
      -- window = {
      --     completion = cmp.config.window.bordered(),
      --     documentation = cmp.config.window.bordered(),
      -- },
      mapping = cmp.mapping.preset.insert {
        ['<C-j>'] = cmp.mapping.select_next_item(), -- Select the [n]ext item
        ['<C-k>'] = cmp.mapping.select_prev_item(), -- Select the [p]revious item
        ['<CR>'] = cmp.mapping.confirm { select = true }, -- Accept the completion with Enter.
        ['<C-c>'] = cmp.mapping.complete {}, -- Manually trigger a completion from nvim-cmp.

        -- Think of <c-l> as moving to the right of your snippet expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
        -- <c-l> will move you to the right of each of the expansion locations.
        -- <c-h> is similar, except moving you backwards.
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),

        -- Select next/previous item with Tab / Shift + Tab
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'symbols', keyword_length = 0 }, -- Allow triggering without typing
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      },
      formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
          -- Kind icons
          vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
          -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind

          vim_item.menu = ({
            nvim_lsp = '[LSP]',
            luasnip = '[Snippet]',
            buffer = '[Buffer]',
            path = '[Path]',
            symbols = '[Symbols]',
          })[entry.source.name]
          return vim_item
        end,
      },
    }
  end,
}
