return {
	"OXY2DEV/markview.nvim",
	lazy = false, -- Recommended
	-- ft = "markdown" -- If you decide to lazy-load anyway

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.keymap.set("n", "<leader>mvs", "<cmd>Markview splitToggle<CR>")
		vim.keymap.set("n", "<leader>mvt", "<cmd>Markview toggle<CR>")
		vim.keymap.set("n", "<leader>mvd", "<cmd>Markview disable<CR>")
		preview = {
			enable = false,
		}
	end,
}
