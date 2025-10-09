return {
  'MeanderingProgrammer/render-markdown.nvim',
  enabled = false,
  dependencies = { -- if you use standalone mini plugins

    'nvim-treesitter/nvim-treesitter',
    'echasnovski/mini.icons',
  },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    render_modes = { 'n', 'c', 't' },
    latex = { enabled = false }, -- Disabled for markview.nvim to avoid errors
  },
}
