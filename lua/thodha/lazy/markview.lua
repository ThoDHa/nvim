return {
	"OXY2DEV/markview.nvim",
	lazy = false, -- Recommended
	-- ft = "markdown" -- If you decide to lazy-load anyway

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("markview").setup({
			preview = {
				enable = false, -- Enable the preview functionality
			},
			experimental = {
				check_rtp = false, -- Disable runtime path check
			},
		})
		vim.keymap.set("n", "<leader>ms", "<cmd>Markview splitToggle<CR>")
		vim.keymap.set("n", "<leader>mt", "<cmd>Markview toggle<CR>")
	end,
}
