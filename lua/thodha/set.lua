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
vim.opt.linebreak = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undolevels = 100
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.clipboard:append({ "unnamed", "unnamedplus" })
vim.o.mouse = ""

vim.opt.cursorline = true
vim.o.updatetime = 25000
vim.o.timeout = true
vim.o.timeoutlen = 300

vim.o.background = "dark"

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Save local options (including filetype) with sessions for proper syntax highlighting restoration
vim.opt.sessionoptions:append("localoptions")
