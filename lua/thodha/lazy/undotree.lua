return {
	"mbbill/undotree",
	cmd = "UndotreeToggle",
	keys = {
		{ "<leader>u", vim.cmd.UndotreeToggle, desc = "Undo Tree" },
	},
	init = function()
		vim.opt.undolevels = 100
		vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
	end,
}
