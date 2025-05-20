vim.opt.guicursor = ""

-- Better indent behavior
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Fix backspace (this gets touched by defaults.vim but that isn't always
-- present)
vim.opt.backspace = indent, start, eol

-- Always start with line numbers turned on and make sure that there is
-- sufficient space so that columns don't hop around as the number gets larger
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4

-- " Reread the contents of a file if it has changed on disk
vim.opt.autoread = true

-- " Control line wrapping behavior (text width is set on a file type basis
-- " elsewhere)
vim.opt.wrap = true
-- " In particular, attempt to show as much as possible of the last line in the
-- " window
-- set display+=lastline
-- Letting the cursor get to the top or bottom of the window before loading more
-- text is really annoying.  Resist the temptation to make this too large if you
-- use a lot of horizontal splits.
vim.opt.scrolloff = 10
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 3
--
-- " Better command line completion
-- set wildmode=full
-- set wildmenu
-- Hide buffers instead
vim.opt.hidden = true
--
-- " Default number format is octal, which isn't helpful, but if 0x or 0X are
-- " leading the digits, then by all means, hex away with CTRL-A or CTRL-X
-- set nrformats=hex
--
-- " Message configuration ---------------------------------------------------- {{{
-- " There are oodles of message configurations, so start by resetting to the Vim
-- " default (Vi and Vim are different)
-- set shortmess&
-- " Don't give file info when editing a file (or switching from one buffer to
-- " another)
-- set shortmess+=F
-- " Ignore Vim intro
-- set shortmess+=I
-- " }}}
--
-- " Turn off list mode by default. Note that listchar values may be locale specific
-- " and defined elsewhere.
-- set nolist
--
-- " Increase the default Ex command history
-- if has('cmdline_hist')
--     set history=10000
-- endif
--
-- Search configuration settings ------------------------------------------ {{{
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.signcolumn = "auto"
vim.opt.colorcolumn = ""

-- Disable incremental searches from wrapping around - dead stop at the end of
-- the buffer
vim.opt.wrapscan = false

-- Case insensitive searching, unless the search pattern contains upper case
-- characters. See `:help smartcase` for more details
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- }}}

-- Window management -------------------------------------------------------- {{{

-- Open new windows below and to the right of the existing ones
vim.opt.splitright = true
vim.opt.splitbelow = true
-- }}}

-- Disable system bell (particularly annoying when using the Cygwin console)
vim.opt.belloff = esc

-- " Use the `par` program to format text if it's available
-- if executable('par')
--     set formatprg=par
-- endif
--
