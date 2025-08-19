-- Keymaps and base settings --

-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Defines a Lua table named opts
local opts = { noremap = true, silent = true }

-- Disable spacebar behavior in normal/visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Clear highlight search
vim.keymap.set('n', '<Esc>', ':noh<CR>', opts)

-- Navigation --

-- Navigate through wrapped lines with j/k
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Next/previous search and center
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- File operations --

-- Save file
--vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', opts) -- Manual practice

-- Save file without triggering autocommands --vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w<CR>', opts)

-- Quit
--vim.keymap.set('n', '<C-q>', '<cmd>q<CR>', opts) -- Manual practice

-- Buffer management --

vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':Bdelete!<CR>', opts)
vim.keymap.set('n', '<leader>b', '<cmd>enew<CR>', opts)

-- Window and split controls --

-- Split windows
vim.keymap.set('n', '<leader>v', '<C-w>v', opts)
vim.keymap.set('n', '<leader>h', '<C-w>s', opts)
vim.keymap.set('n', '<leader>se', '<C-w>=', opts)
vim.keymap.set('n', '<leader>sx', ':close<CR>', opts)

-- Navigate between splits
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize +2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize -2<CR>', opts)

-- Tabs --

vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts)
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts)
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts)
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts)

-- Text editing enhancements

-- Delete single character without copying
vim.keymap.set('n', 'x', '<cmd>normal! "_x<CR>', opts)

-- Delete visually selected text without affecting registers
vim.keymap.set('v', 'x', '"_d', { noremap = true, silent = true })

-- Increment/decrement numbers
--vim.keymap.set('n', '<leader>+', '<C-a>', opts) -- Inconvenient layer access
--vim.keymap.set('n', '<leader>-', '<C-x>', opts) -- Inconvenient layer access

-- Press jk or kj to exit insert mode
--vim.keymap.set('i', 'jk', '<ESC>', opts) -- Inconvenient key presses
--vim.keymap.set('i', 'kj', '<ESC>', opts) -- Inconvenient key presses

-- Stay in indent mode
--vim.keymap.set('v', '<', '<gv', opts) -- Manual practice
--vim.keymap.set('v', '>', '>gv', opts) -- Manual practice

-- Move text up/down in normal mode
--vim.keymap.set('n', '<A-j>', ":m '>+1<CR>gv=gv", opts) -- Testing in visual mode
--vim.keymap.set('n', '<A-k>', ":m '<-2<CR>gv=gv", opts) -- Testing in visual mode

-- Move text up/down in visual mode
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- Move text up/down in normal mode

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Replace word under cursor
--vim.keymap.set('n', '<leader>j', '*``cgn', opts) -- Manual practice

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Clipboard --

-- Yank to system clipboard
--vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y') -- Manual practice
--vim.keymap.set('n', '<leader>Y', '"+Y') -- Manual practice

-- Diagnostics --

-- Toggle diagnostics
local diagnostics_active = true

vim.keymap.set('n', '<leader>do', function()
  diagnostics_active = not diagnostics_active

  if diagnostics_active then
    vim.diagnostic.enable(true, { bufnr = 0 })
  else
    vim.diagnostic.enable(false, { bufnr = 0 })
  end
end, { desc = 'Toggle diagnostics' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to next diagnostic message' })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Sessions --

-- Save and load sessions to .session.vim
vim.keymap.set('n', '<leader>ss', ':mksession! .session.vim<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>sl', ':source .session.vim<CR>', { noremap = true, silent = false })
