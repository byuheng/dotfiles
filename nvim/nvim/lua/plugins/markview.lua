return {
  'OXY2DEV/markview.nvim',
  enabled = true,
  lazy = false,
  priority = 49,
  config = function()
    local markview = require 'markview'
    local presets = require 'markview.presets'

    markview.setup {
      preview = {
        enable = true,
        enable_hybrid_mode = true,
        icon_provider = 'internal', -- 'internal', 'devicons', or 'mini'
        hybrid_modes = { 'n' },
        filetypes = { 'markdown', 'md' },
        modes = { 'n', 'no', 'c' }, -- Normal, operator-pending, command modes

        -- Callbacks for custom behavior
        -- callbacks = {
        --   on_enable = function(_, wins)
        --     for _, win in ipairs(wins) do
        --       vim.wo[win].conceallevel = 3
        --     end
        --   end,
        --   on_disable = function(_, wins)
        --     for _, win in ipairs(wins) do
        --       vim.wo[win].conceallevel = 0
        --     end
        --   end,
        --   on_hybrid_enable = function(_, wins)
        --     for _, win in ipairs(wins) do
        --       vim.wo[win].concealcursor = 'nc'
        --     end
        --   end,
        --   on_hybrid_disable = function(_, wins)
        --     for _, win in ipairs(wins) do
        --       vim.wo[win].concealcursor = 'nc'
        --     end
        --   end,
        -- },
      },

      -- Markdown block elements
      markdown = {
        enable = true,

        -- Use presets for consistent styling
        headings = presets.headings.glow,
        horizontal_rules = presets.horizontal_rules.thin,
        -- tables = presets.tables.none,

        -- Code blocks
        code_blocks = {
          enable = true,
          style = 'block', -- 'simple' or 'block'
          sign = true,
          min_width = 60,
          pad_amount = 2,
          pad_char = ' ',

          -- Language-specific highlighting
          default = {
            block_hl = 'MarkviewCode',
            pad_hl = 'MarkviewCode',
          },
        },

        -- Block quotes with callout support
        block_quotes = {
          enable = true,
          wrap = true,
          default = {
            border = '▋',
            hl = 'MarkviewBlockQuoteDefault',
          },
        },

        -- List items
        list_items = {
          enable = true,
          wrap = true,
          indent_size = 4,
          shift_width = 4,

          marker_minus = {
            add_padding = true,
            conceal_on_checkboxes = true,
            text = '-', -- '●'
            hl = 'MarkviewPalette5Fg',
          },
          marker_plus = {
            add_padding = true,
            conceal_on_checkboxes = true,
            text = '+',
            hl = 'MarkviewPalette5Fg',
          },
          marker_star = {
            add_padding = true,
            conceal_on_checkboxes = true,
            text = '*',
            hl = 'MarkviewPalette5Fg',
          },
        },
      },

      -- Markdown inline elements
      markdown_inline = {
        enable = true,

        -- Checkbox configuration
        checkboxes = {
          enable = true,
          -- Use simple ASCII for compatibility
          unchecked = { text = '', hl = 'MarkviewPalette0Fg', scope_hl = 'Normal' }, -- Uncompleted task - '', '󰄱'
          checked = { text = '', hl = 'MarkviewPalette4Fg', scope_hl = 'Normal' }, -- Completed task - '', '󰄲'

          -- Additional states (these match the spec)
          ['/'] = { text = '󰿟', hl = 'MarkviewPalette2Fg' }, -- Task in progress - '󰿟'
          ['o'] = { text = '󰄰', hl = 'MarkviewPalette3Fg' }, -- Event - '󰄰'
          ['h'] = { text = '󱎖', hl = 'MarkviewPalette2Fg' }, -- Event in progress - '󱎖'
          ['O'] = { text = '󰄯', hl = 'MarkviewPalette4Fg' }, -- Event completed - '󰄯'
          ['>'] = { text = '>', hl = 'MarkviewPalette0Fg' }, -- Migrated - '󱞩', ''
          ['<'] = { text = '<', hl = 'MarkviewPalette0Fg' }, -- Unscheduled - '󱞥'
          ['c'] = { text = '', hl = 'MarkviewPalette0Fg', scope_hl = 'MarkviewCheckboxStriked' }, -- Cancelled, '', ''
        },

        -- Inline code
        inline_codes = {
          enable = true,
          hl = 'MarkviewInlineCode',
          padding_left = ' ',
          padding_right = ' ',
        },

        -- Links
        hyperlinks = {
          enable = false,
          default = {
            icon = ' ', -- ' ', '󰌷 '
            hl = 'MarkviewPalette3Fg',
          },
        },
      },

      -- HTML support
      html = {
        enable = true,

        -- Container elements (tags with content)
        container_elements = {
          enable = true,
        },

        headings = {
          enable = true,
        },

        void_elements = {
          enable = true,
        },
      },

      -- LaTeX support
      latex = {
        enable = true,

        blocks = {
          enable = true,
          hl = 'MarkviewCode',
          pad_char = ' ',
          pad_amount = 3,
        },

        commands = {
          enable = true,
        },

        inlines = {
          enable = true,
          padding_left = ' ',
          padding_right = ' ',
          hl = 'MarkviewInlineCode',
        },

        symbols = {
          enable = true,
          hl = 'MarkviewComment',
        },
      },

      -- YAML frontmatter
      yaml = {
        enable = true,
        properties = {
          enable = true,
          -- Property types and icons are pre-configured
        },
      },

      -- Typst support (disable if not needed)
      typst = {
        enable = false,
      },
    }

    -- Custom keymaps
    -- vim.keymap.set('n', '<leader>mt', '<cmd>Markview toggle<cr>', { desc = 'Toggle Markview' })
    -- vim.keymap.set('n', '<leader>mh', '<cmd>Markview hybridToggle<cr>', { desc = 'Toggle Hybrid Mode' })
    -- vim.keymap.set('n', '<leader>ms', '<cmd>Markview splitToggle<cr>', { desc = 'Toggle Split View' })

    -- Buffer-specific autocmds
    -- vim.api.nvim_create_autocmd('User', {
    --   pattern = 'MarkviewAttach',
    --   callback = function(event)
    --     vim.print(event.data)> symbol icon airplane
    --   end,
    -- })
    --
    -- vim.api.nvim_create_autocmd('User', {
    --   pattern = 'MarkviewDetach',
    --   callback = function(event)
    --     vim.print(event.data)
    --   end,
    -- })
  end,
}
--         -- Email and URI autolink configuration
--         -- emails = {
--         --   enable = true,
--         -- },
--         --
--     -- -- Load extra modules
--     -- require('markview.extras.checkboxes').setup {
--     --   -- Checkbox extra configuration
--     --   default_marker = '~',
--     --   update_on_change = true,
--     -- }
--     --
--     -- require('markview.extras.headings').setup {
--     --   -- Heading level changer configuration
--     -- }
--
--     -- -- Custom keymaps for markview
--     -- vim.keymap.set("n", "<leader>mt", "<cmd>Markview Toggle<cr>", { desc = "Toggle Markview" })
--     -- vim.keymap.set("n", "<leader>mh", "<cmd>Markview HybridToggle<cr>", { desc = "Toggle Hybrid Mode" })
--     -- vim.keymap.set("n", "<leader>ms", "<cmd>Markview splitToggle<cr>", { desc = "Toggle Split View" })
--     -- vim.keymap.set("n", "<leader>ml", "<cmd>Markview linewiseToggle<cr>", { desc = "Toggle Linewise Mode" })
--     --
--     -- -- Checkbox interactive toggle
--     -- vim.keymap.set("n", "<leader>mc", "<cmd>Checkbox interactive<cr>", { desc = "Interactive Checkbox" })
--     -- vim.keymap.set("v", "<leader>mc", "<cmd>Checkbox interactive<cr>", { desc = "Interactive Checkbox (Visual)" })
--     --
--     -- -- Render/Clear commands
--     -- vim.keymap.set("n", "<leader>mr", "<cmd>Markview Render<cr>", { desc = "Render Markview" })
--     -- vim.keymap.set("n", "<leader>mC", "<cmd>Markview Clear<cr>", { desc = "Clear Markview" })
--     --
--     -- -- Custom autocmds for markview events
--     -- vim.api.nvim_create_autocmd("User", {
--     --   pattern = "MarkviewAttach",
--     --   callback = function(event)
--     --     local buffer = event.data.buffer
--     --     -- Set buffer-specific options when markview attaches
--     --     vim.bo[buffer].wrap = true
--     --     vim.bo[buffer].linebreak = true
--     --   end
--     -- })
--     --
--     -- vim.api.nvim_create_autocmd("User", {
--     --   pattern = "MarkviewDetach",
--     --   callback = function(event)
--     --     local buffer = event.data.buffer
--     --     -- Reset buffer options when markview detaches
--     --     vim.bo[buffer].wrap = false
--     --     vim.bo[buffer].linebreak = false
--     --   end
--     -- })
--   end,
-- }
