-- UI & Display
vim.o.number = true -- Show absolute line numbers
vim.o.relativenumber = true -- Show relative line numbers
vim.o.cursorline = false -- Do not highlight the current line
vim.o.signcolumn = 'yes' -- Always show the sign column
vim.o.showmode = false -- Hide mode messages (e.g., -- INSERT --) if statusline already shows them
vim.o.showtabline = 2 -- Always show the tabline (0: never, 1: only with 2+ tabs, 2: always)
vim.o.numberwidth = 4 -- Set line number column width to 4 characters
vim.o.cmdheight = 1 -- Set the height of the command line area
vim.o.pumheight = 10 -- Limit the popup menu height to 10 items
vim.o.termguicolors = true -- Enable 24-bit RGB colors

-- Scrolling & Wrapping
vim.o.wrap = false -- Display lines as one long line (no soft wrap)
vim.o.linebreak = true -- Wrap long lines at word boundaries (only effective if 'wrap' is true)
vim.o.scrolloff = 4 -- Keep at least 4 lines above and below the cursor
vim.o.breakindent = true -- Indents wrapped lines to align visually with the start of the line
--vim.o.showbreak = "↪" -- Visually mark wrapped lines with an arrow and a backslash
vim.o.sidescrolloff = 8 -- Keep at least 8 columns beside the cursor
vim.o.whichwrap = 'bs<>[]hl' -- Allow cursor keys to move across lines

-- Indentation & Tabs
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.tabstop = 4 -- Number of spaces a tab character represents
vim.o.softtabstop = 4 -- Number of spaces a tab counts for during editing
vim.o.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.o.autoindent = true -- Copy indent from the current line when starting a new one
vim.o.smartindent = true -- Enable smart indenting (mainly for C-like syntax)

-- Search
vim.o.hlsearch = true -- Search highlight
vim.o.ignorecase = true -- Enable case-insensitive searching
vim.o.smartcase = true -- Override 'ignorecase' if the search contains uppercase letters

-- Completion
vim.o.completeopt = 'menuone,noselect' -- Improve completion experience
vim.opt.shortmess:append 'c' -- Suppress completion messages (e.g., "match x of y")

-- Undo, Swap, Backup
vim.o.undofile = true -- Save undo history to an undo file
vim.o.backup = false -- Disable backup file creation
vim.o.swapfile = false -- Disable swap file creation

-- Input & Key Behavior
vim.o.backspace = 'indent,eol,start' -- Allow backspace over indent, line breaks, and insertion start
vim.o.mouse = 'a' -- Enable mouse support in all modes
vim.opt.iskeyword:append '-' -- Treat hyphenated words as a single word in motions/searches

-- File Handling & Encoding
vim.o.fileencoding = 'utf-8' -- Use UTF-8 encoding when writing files
vim.opt.runtimepath:remove '/usr/share/vim/vimfiles' -- Remove Vim's global runtime to prevent conflicts

-- Update & Timings
vim.o.updatetime = 250 -- Decrease update time for CursorHold
vim.o.timeoutlen = 300 -- Time to wait for a mapped sequence to complete (in milliseconds)

-- Split Behavior
vim.o.splitbelow = true -- Open horizontal splits below the current window
vim.o.splitright = true -- Open vertical splits to the right of the current window

-- Conceal & Formatting
vim.o.conceallevel = 0 -- Disable conceal; show all text
vim.opt.formatoptions:remove { 'c', 'r', 'o' } -- Disable automatic insertion of comment leaders during auto-wrapping, pressing Enter in insert mode, or opening new lines with 'o'/'O' in normal mode

-- Spell check
vim.opt_local.spell = true -- turn spell check on
vim.opt_local.spelllang = 'en_us' -- set the language
