return {
  -- Catppuccin
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    lazy = false,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- latte, frape, macchiato, mocha
        background = {
          light = 'latte',
          dark = 'mocha',
        },
        transparent_background = false,
        integrations = {
          alpha = true,
          bufferline = true,
          cmp = true,
          gitsigns = true,
          indent_blankline = true,
          neotree = true,
          telescope = true,
          treesitter = true,
          which_key = true,
        },
      }
    end,
  },

  -- Rose-pine
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    config = function()
      require('rose-pine').setup {
        variant = 'main', -- auto, dawn, moon, main
        dark_variant = 'main',
        dim_inactive_windows = false,
        enable = {
          terminal = true,
          legacy_highlights = true,
          migrations = true,
        },
        styles = {
          bold = true,
          italic = true,
          transparency = false,
        },
      }
    end,
  },

  -- Nightfox
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    config = function()
      require('nightfox').setup {
        options = {
          transparent = false,
          terminal_colors = true,
        },
      }
    end,
  },

  -- Everforest
  {
    'sainnhe/everforest',
    priority = 1000,
    config = function()
      vim.g.everforest_background = 'hard' -- soft, medium, hard
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_transparent_background = 0
    end,
  },

  -- Gruvbox-material
  {
    'sainnhe/gruvbox-material',
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = 'hard' -- soft, medium, hard
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_transparent_background = 0

      -- Set up CMP highlights after colorscheme loads
      -- vim.api.nvim_create_autocmd('ColorScheme', {
      --   pattern = 'gruvbox-material',
      --   callback = function()
      --     -- Gruvbox-material hard colors
      --     local colors = {
      --       bg_dim = '#141617',
      --       bg0 = '#1D2021',
      --       bg1 = '#282828',
      --       bg2 = '#282828',
      --       bg3 = '#3C3836',
      --       bg4 = '#3C3836',
      --       bg5 = '#504945',
      --       bg_statusline1 = '#282828',
      --       bg_statusline2 = '#32302F',
      --       bg_statusline3 = '#504945',
      --       bg_current_word = '#32302F',
      --       fg0 = '#D4BE98',
      --       fg1 = '#DDC7A1',
      --       red = '#EA6962',
      --       green = '#A9C665',
      --       yellow = '#D8A657',
      --       blue = '#7DAEA3',
      --       purple = '#D3869B',
      --       orange = '#E78A4E',
      --       aqua = '#89B482',
      --       grey0 = '#7C6F64',
      --       grey1 = '#928374',
      --       grey2 = '#A89984'
      --     }
      --
      --     -- Completion menu background and borders
      --     vim.api.nvim_set_hl(0, 'CmpNormal', { bg = colors.bg1, fg = colors.fg1 })
      --     vim.api.nvim_set_hl(0, 'CmpBorder', { bg = colors.bg1, fg = colors.bg2 })
      --     vim.api.nvim_set_hl(0, 'CmpCursorLine', { bg = colors.bg2 })
      --
      --     -- Completion item kinds with colors
      --     vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = colors.fg1 })
      --     vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = colors.blue })
      --     vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = colors.blue })
      --     vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = colors.yellow })
      --     vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = colors.aqua })
      --     vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = colors.purple })
      --     vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = colors.orange })
      --     vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = colors.orange })
      --     vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = colors.red })
      --     vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = colors.aqua })
      --     vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = colors.gray })
      --     vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = colors.green })
      --     vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = colors.orange })
      --     vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = colors.red })
      --     vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = colors.yellow })
      --     vim.api.nvim_set_hl(0, 'CmpItemKindColor', { fg = colors.aqua })
      --     vim.api.nvim_set_hl(0, 'CmpItemKindFile', { fg = colors.green })
      --     vim.api.nvim_set_hl(0, 'CmpItemKindReference', { fg = colors.gray })
      --     vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { fg = colors.blue })
      --     vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = colors.aqua })
      --     vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = colors.purple })
      --     vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = colors.orange })
      --     vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { fg = colors.red })
      --     vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = colors.yellow })
      --     vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = colors.purple })
      --
      --     -- Custom highlight for your symbols
      --     vim.api.nvim_set_hl(0, 'CmpItemKindSymbol', { fg = colors.yellow })
      --
      --     -- Additional CMP highlights for better appearance
      --     vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = colors.yellow, bold = true })
      --     vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = colors.yellow })
      --     vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = colors.gray, italic = true })
      --   end,
      -- })
    end,
  },

  -- Kanagawa
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        undercurl = true,
        commentStyle = { italic = true },
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        transparent = false,
        dimInactive = false,
        terminalColors = true,
        theme = 'wave', -- lotus, wave, dragon
      }

      -- SET YOUR DEFAULT THEME HERE - just change this one line:
      -- Change to:
      -- 'catppuccin'
      -- 'everforest'
      -- 'gruvbox-material'
      -- 'kanagwa-theme' -- lotus, wave, dragon
      -- 'nightfox'
      -- 'dayfox'    -- Light theme
      -- 'dawnfox'   -- Light warm theme
      -- 'duskfox'   -- Dark warm theme
      -- 'nordfox'   -- Nord-inspired theme
      -- 'terafox'   -- Dark green theme
      -- 'carbonfox' -- Dark grey/black theme
      -- 'rose-pine-theme' -- dawn, moon, main
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
}
