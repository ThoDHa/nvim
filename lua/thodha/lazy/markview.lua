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
				enable = false,
			},
			experimental = {
				check_rtp = false,
			},
		})
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "markdown",
			callback = function()
				pcall(vim.cmd, "Markview Enable")
			end,
		})
	end,
}
