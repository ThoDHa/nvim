-- [[ Setting options ]]
-- See `:help vim.o`

vim.g.mapleader = " "
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath('data') .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 5
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }
vim.o.mouse =''
-- hides the top banner by default
vim.g.netrw_banner=0
-- Tree view
vim.g.netrw_liststyle=3
-- Keep the directory you accessed previously.
vim.g.netrw_keepdir=1

-- Enable cursor line highlight
vim.opt.cursorline = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Change update time to 5 seconds.
vim.o.updatetime = 5000 
vim.o.timeout = true
vim.o.timeoutlen = 300
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
vim.o.background = 'dark'
