return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main', -- Use the new API
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').setup {
        install_dir = vim.fn.stdpath 'data' .. '/site',
      }

      require('nvim-treesitter').install {
        'lua',
        'python',
        'javascript',
        'typescript',
        'vimdoc',
        'vim',
        'regex',
        'terraform',
        'sql',
        'dockerfile',
        'toml',
        'json',
        'java',
        'groovy',
        'go',
        'gitignore',
        'graphql',
        'yaml',
        'c',
        'cpp',
        'make',
        'cmake',
        'markdown',
        'markdown_inline',
        'latex',
        'typst',
        'bash',
        'fish',
        'tsx',
        'css',
        'html',
      }

      vim.api.nvim_create_autocmd('FileType', {
        pattern = '*',
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-treesitter-textobjects').setup {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      }

      -- Set up navigation keymaps
      local move = require 'nvim-treesitter-textobjects.move'
      vim.keymap.set({ 'n', 'x', 'o' }, ']m', function()
        move.goto_next('@function.outer', 'textobjects')
      end, { desc = 'Next function start' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[m', function()
        move.goto_previous('@function.outer', 'textobjects')
      end, { desc = 'Previous function start' })
      vim.keymap.set({ 'n', 'x', 'o' }, ']]', function()
        move.goto_next('@class.outer', 'textobjects')
      end, { desc = 'Next class start' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[[', function()
        move.goto_previous('@class.outer', 'textobjects')
      end, { desc = 'Previous class start' })
      vim.keymap.set({ 'n', 'x', 'o' }, ']M', function()
        move.goto_next('@function.outer', 'textobjects', nil, true)
      end, { desc = 'Next function end' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[M', function()
        move.goto_previous('@function.outer', 'textobjects', nil, true)
      end, { desc = 'Previous function end' })
      vim.keymap.set({ 'n', 'x', 'o' }, '][', function()
        move.goto_next('@class.outer', 'textobjects', nil, true)
      end, { desc = 'Next class end' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[]', function()
        move.goto_previous('@class.outer', 'textobjects', nil, true)
      end, { desc = 'Previous class end' })
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-ts-autotag').setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      }
    end,
  },
}

-- Working treesitter master branch api
-- return {
--   {
--     'nvim-treesitter/nvim-treesitter',
--     branch = 'master', -- Use old stable branch
--     lazy = false,
--     build = ':TSUpdate',
--     dependencies = {
--       'nvim-treesitter/nvim-treesitter-textobjects',
--     },
--     config = function()
--       require('nvim-treesitter.configs').setup {
--         ensure_installed = {
--           'lua',
--           'python',
--           'javascript',
--           'typescript',
--           'vimdoc',
--           'vim',
--           'regex',
--           'terraform',
--           'sql',
--           'dockerfile',
--           'toml',
--           'json',
--           'java',
--           'groovy',
--           'go',
--           'gitignore',
--           'graphql',
--           'yaml',
--           'c',
--           'make',
--           'cmake',
--           'markdown',
--           'markdown_inline',
--           'latex',
--           'typst',
--           'bash',
--           'tsx',
--           'css',
--           'html',
--         },
--         auto_install = true,
--         highlight = { enable = true },
--         indent = { enable = true },
--         incremental_selection = {
--           enable = true,
--           keymaps = {
--             init_selection = '<c-space>',
--             node_incremental = '<c-space>',
--             scope_incremental = '<c-s>',
--             node_decremental = '<M-space>',
--           },
--         },
--         textobjects = {
--           select = {
--             enable = true,
--             lookahead = true,
--             keymaps = {
--               ['aa'] = '@parameter.outer',
--               ['ia'] = '@parameter.inner',
--               ['af'] = '@function.outer',
--               ['if'] = '@function.inner',
--               ['ac'] = '@class.outer',
--               ['ic'] = '@class.inner',
--             },
--           },
--           move = {
--             enable = true,
--             set_jumps = true,
--             goto_next_start = {
--               [']m'] = '@function.outer',
--               [']]'] = '@class.outer',
--             },
--             goto_next_end = {
--               [']M'] = '@function.outer',
--               [']['] = '@class.outer',
--             },
--             goto_previous_start = {
--               ['[m'] = '@function.outer',
--               ['[['] = '@class.outer',
--             },
--             goto_previous_end = {
--               ['[M'] = '@function.outer',
--               ['[]'] = '@class.outer',
--             },
--           },
--           swap = {
--             enable = true,
--             swap_next = {
--               ['<leader>a'] = '@parameter.inner',
--             },
--             swap_previous = {
--               ['<leader>A'] = '@parameter.inner',
--             },
--           },
--         },
--       }
--     end,
--   },
-- }
