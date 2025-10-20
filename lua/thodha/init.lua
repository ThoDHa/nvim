require("thodha.set")
require("thodha.remap")
require("thodha.lazy_init")
-- Automatically reload Neovim configuration on file changes
local config_path = vim.fn.stdpath("config") -- Path to your Neovim config folder

-- Clear or set colorcolumn based on file type
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = { "*.py", "*.md", "*" },
	callback = function()
		if vim.bo.filetype == "python" then
			vim.cmd("set colorcolumn=101")
		elseif vim.bo.filetype == "markdown" then
			vim.cmd("set colorcolumn=81")
		else
			vim.cmd("set colorcolumn=")
		end
	end,
})

-- Workaround for CursorHoldI event to maintain undo levels
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
