return {
	"sindrets/diffview.nvim",
	event = "VeryLazy",
	opts = {},
	config = function()
		vim.keymap.set("n", "<leader>dv", function()
			if next(require("diffview.lib").views) == nil then
				vim.cmd("DiffviewOpen")
			else
				vim.cmd("DiffviewClose")
			end
		end, { desc = "Toggle DiffView" })
	end,
}
