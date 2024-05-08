require("thodha.set")
require("thodha.remap")
require("thodha.lazy_init")

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = { "*.json" },
	command = "silent %!python3 -m json.tool",
})
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = { "*" },
	command = "set colorcolumn=",
})

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = { "*.py" },
	command = "set colorcolumn=101",
})

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = { "*.md" },
	command = "set colorcolumn=81",
})

vim.api.nvim_create_autocmd("CursorHoldI", {
	pattern = { "*" },
	command = "let &undolevels = &undolevels",
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
