-- [[ Setting options ]]
-- See `:help vim.o`
vim.g.python3_host_prog = vim.fn.stdpath("data") .. "/venv/bin/python"
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
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.clipboard:append({ "unnamed", "unnamedplus" })
vim.o.mouse = ""

-- Enable cursor line highlight
vim.opt.cursorline = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Change update time to 25 seconds.
vim.o.updatetime = 25000
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"
vim.o.background = "dark"

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true
