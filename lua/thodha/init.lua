require("thodha.set")
require("thodha.remap")
require("thodha.lazy_init")

-- Workaround for CursorHoldI event to maintain undo levels
vim.api.nvim_create_autocmd("CursorHoldI", {
	pattern = { "*" },
	callback = function()
		vim.bo.undolevels = vim.bo.undolevels
	end,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
