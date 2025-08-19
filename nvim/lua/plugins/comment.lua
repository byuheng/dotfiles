return {
  'numToStr/Comment.nvim',
  opts = {},
  config = function()
    local opts = { noremap = true, silent = true }

    -- Normal mode linewise comment
    vim.keymap.set('n', '<leader>c', function()
      require('Comment.api').toggle.linewise.current()
    end, opts)

    -- Visual mode linewise comment
    vim.keymap.set('v', '<leader>c', function()
      require('Comment.api').toggle.linewise(vim.fn.visualmode())
    end, opts)
  end,
}
