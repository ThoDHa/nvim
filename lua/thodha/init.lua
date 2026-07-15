require("thodha.set")
require("thodha.remap")
require("thodha.lazy_init")

-- Markdown wraps, but only in normal mode.
-- wrap is window-local, not buffer-local, so it must be re-evaluated whenever a
-- buffer lands in a window. Setting it once on FileType leaks it into the next
-- file opened in that window.
local md_wrap = vim.api.nvim_create_augroup("markdown-normal-wrap", { clear = true })

-- Floats, help, terminals and plugin scratch buffers manage their own options.
-- Clobbering them breaks things like LSP hover, which sets wrap deliberately.
local function is_plain_file_window()
	return vim.bo.buftype == "" and vim.api.nvim_win_get_config(0).relative == ""
end

vim.api.nvim_create_autocmd({ "BufWinEnter", "BufEnter", "FileType" }, {
	group = md_wrap,
	callback = function()
		if is_plain_file_window() then
			vim.opt_local.wrap = vim.bo.filetype == "markdown"
		end
	end,
})

vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
	group = md_wrap,
	callback = function(args)
		if vim.bo.filetype == "markdown" and is_plain_file_window() then
			vim.opt_local.wrap = args.event == "InsertLeave"
		end
	end,
})

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
