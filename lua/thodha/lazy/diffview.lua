-- diffview.nvim: tabbed diff views for Git status, file history, and
-- merges.
return {
	"sindrets/diffview.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"<leader>dv",
			function()
				if next(require("diffview.lib").views) == nil then
					vim.cmd("DiffviewOpen")
				else
					vim.cmd("DiffviewClose")
				end
			end,
			desc = "Toggle DiffView",
		},
	},
}
