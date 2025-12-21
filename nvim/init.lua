require 'core.options' -- Load general options
require 'core.keymaps' -- Load general keymaps
require 'core.snippets' -- Load custom code snippets

-- Install Lazy package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update

-- NOTE: Here is where you install your plugins.
require('lazy').setup {
  require 'plugins.alpha',
  require 'plugins.autocompletion',
  require 'plugins.bufferline',
  require 'plugins.colorscheme',
  require 'plugins.comment',
  require 'plugins.dadbod',
  require 'plugins.dap',
  require 'plugins.gitsigns',
  require 'plugins.indent_blankline',
  require 'plugins.lualine',
  require 'plugins.lsp',
  require 'plugins.markview',
  require 'plugins.mini_icons',
  require 'plugins.misc',
  require 'plugins.neotree',
  require 'plugins.none_ls', -- Autoformatter
  require 'plugins.obsidian',
  require 'plugins.surround',
  require 'plugins.telescope',
  require 'plugins.treesitter',
  require 'plugins.render_markdown',
  require 'plugins.vim_tmux_navigator',
}

-- Function to check if a file exists
local function file_exists(file)
  local f = io.open(file, 'r')
  if f then
    f:close()
    return true
  else
    return false
  end
end

-- Path to the session file
local session_file = '.session.vim'

-- Check if the session file exists in the current directory
if file_exists(session_file) then
  -- Source the session file
  vim.cmd('source ' .. session_file)
end

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
