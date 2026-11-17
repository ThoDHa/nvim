-- markview.nvim: renders markdown buffers with a preview-like appearance
-- (styled headings, lists, code blocks, links).
return {
	"OXY2DEV/markview.nvim",
	lazy = true,
	ft = "markdown",

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>ms", "<cmd>Markview splitToggle<CR>", desc = "Markview split toggle" },
		{ "<leader>mt", "<cmd>Markview toggle<CR>", desc = "Markview toggle" },
	},
	config = function()
		require("markview").setup({
			preview = {
				enable = true,
			},
			markdown = {
				list_items = {
					indent_size = 2,
					shift_width = 2,
				},
			},
			experimental = {
				check_rtp = false,
			},
		})
	end,
}
