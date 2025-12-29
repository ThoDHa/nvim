return {
	"OXY2DEV/markview.nvim",
	lazy = true,
	ft = "markdown",

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
		-- Show MarkdownPreview by default when opening up MD files.
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "markdown",
			callback = function()
				pcall(vim.cmd, "Markview Enable")
			end,
		})
	end,
}
