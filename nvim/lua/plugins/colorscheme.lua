return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  lazy = false,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      background = {
        light = 'macchiato',
        dark = 'mocha',
      },
      transparent_background = false,
      float = {
        transparent = false,
        solid = true,
      },
      show_end_of_buffer = false,
      term_colors = false,
      dim_inactive = {
        enabled = false,
        shade = 'dark',
        percentage = 0.15,
      },
      no_italic = false,
      no_bold = false,
      no_underline = false,
      styles = {
        comments = { 'italic' },
        conditionals = { 'italic' },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = function()
        return {
          TelescopeMatching = {
            fg = '#cdd6f4',
            bg = '#3e5767',
            bold = true,
          },
        }
      end,

      default_integrations = true,
      auto_integrations = false,
      integrations = {
        alpha = true,
        bufferline = true,
        cmp = true,
        gitsigns = true,
        indent_blankline = true,
        neotree = true,
        telescope = true,
        --todo = true,
        treesitter = true,
        which_key = true,
        --lualine = false, -- Conflict with lualine
      },
    }

    vim.cmd.colorscheme 'catppuccin'
  end,
}
