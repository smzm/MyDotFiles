local opt = vim.opt
local g = vim.g

vim.o.signcolumn = "yes"

-- Cursor highlighting
opt.cursorline = true
opt.cursorcolumn = false

-- Pane splitting
opt.splitright = true
opt.splitbelow = true

-- Searching
opt.smartcase = true
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true

-- Auto indent
opt.autoindent = true
opt.shiftround = true
opt.breakindent = true

-- Make terminal support truecolor
opt.termguicolors = true
opt.background = "dark"

-- Make neovim use the system clipboard
opt.clipboard = "unnamedplus"

-- Disable old vim status
opt.showmode = false

-- Set relative line numbers
opt.number = true
opt.relativenumber = false
opt.numberwidth = 4

-- Tab config
opt.expandtab = true
opt.smarttab = true
opt.smartindent = true
opt.shiftwidth = 2
opt.tabstop = 2

-- Code folding
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldcolumn = "1"

-- Decrease update time
opt.timeoutlen = 500
opt.updatetime = 200

-- backspace
-- allow backspace on indent, end of line or insert mode start position
opt.backspace = "indent,eol,start"

-- Disable swapfile
opt.swapfile = false

-- Enable persistent undo
opt.undofile = true

-- cmp config
opt.completeopt = { "menu", "menuone", "noselect" }

-- Always show tabline
opt.showtabline = 2

-- Disable mouse support
-- opt.mouse = {}

-- Scrolloff
opt.scrolloff = 5
opt.sidescrolloff = 5

-- Disable wrapping
opt.wrap = false

-- Fill chars
opt.fillchars = [[vert:|,horiz:-,eob: ]]

-- Enable lazy redraw for performance
opt.lazyredraw = true

-- Have the statusline only display at the bottom
opt.laststatus = 3

-- Disable continuation comments in next line
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")
