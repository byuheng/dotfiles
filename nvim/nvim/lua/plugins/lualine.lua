-- Set lualine as statusline
return {
  'nvim-lualine/lualine.nvim',
  config = function()
    --    local cp = require('catppuccin.palettes').get_palette 'mocha'

    --    local custom_catppuccin = {
    --      normal = {
    --       a = { bg = cp.blue, fg = cp.base, gui = 'bold' },
    --       b = { bg = cp.surface0, fg = cp.text },
    --       c = { bg = cp.mantle, fg = cp.text },
    --      },
    --     insert = {
    --        a = { bg = cp.green, fg = cp.base, gui = 'bold' },
    --        b = { bg = cp.surface0, fg = cp.text },
    --      },
    --      command = {
    --       a = { bg = cp.peach, fg = cp.base, gui = 'bold' },
    --        b = { bg = cp.surface0, fg = cp.text },
    --     },
    --      visual = {
    --        a = { bg = cp.mauve, fg = cp.base, gui = 'bold' },
    --        b = { bg = cp.surface0, fg = cp.text },
    --     },
    --      replace = {
    --        a = { bg = cp.red, fg = cp.base, gui = 'bold' },
    --        b = { bg = cp.surface0, fg = cp.text },
    --      },
    --      inactive = {
    --        a = { bg = cp.mantle, fg = cp.text },
    --        b = { bg = cp.mantle, fg = cp.text },
    --        c = { bg = cp.mantle, fg = cp.text },
    --     },
    --    }

    local mode = {
      'mode',
      fmt = function(str)
        return ' ' .. str
        -- return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
      end,
    }

    local filename = {
      'filename',
      file_status = true, -- display file status (read only, modified)
      path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
    }

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      colored = false,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }

    local diff = {
      'diff',
      colored = false,
      symbols = { added = ' ', modified = ' ', removed = ' ' },
      cond = hide_in_width,
    }

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto', --custom_catppuccin -- ← use your custom theme here
        -- Some useful glyphs:
        -- https://www.nerdfonts.com/cheat-sheet
        --        
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha', 'neo-tree', 'Avante' },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { 'branch' },
        lualine_c = { filename },
        lualine_x = { diagnostics, diff, { 'encoding', cond = hide_in_width }, { 'filetype', cond = hide_in_width } },
        lualine_y = { 'location' },
        lualine_z = { 'progress' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { { 'location', padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { 'fugitive' },
    }
  end,
}
