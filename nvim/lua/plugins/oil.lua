return {
  {
    'stevearc/oil.nvim',
    -- Optional dependencies for icons
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false, -- Recommended by author to ensure it captures directory buffers
    opts = {
      -- Oil will take over directory buffers (e.g. `nvim .` or `:e src/`)
      default_file_explorer = true,
      -- This handles gx specifically *inside* the Oil buffer
      keymaps = {
        ['gx'] = 'actions.open_external',
      },
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },
    },
    config = function(_, opts)
      require('oil').setup(opts)

      -- The Vinegar shortcut: press '-' to open the explorer
      -- vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
      -- Open Oil in a floating window
      vim.keymap.set('n', '-', '<CMD>Oil --float<CR>', { desc = 'Open Oil in float' })
    end,
  },
}
