return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undo Tree" })
		vim.opt.undolevels = 100
		vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
	end,
}
