return {
	"stevearc/oil.nvim",
	event = "VeryLazy",
	config = function()
		require("oil").setup({
			keymaps = {
				["<C-h>"] = false,
				["<C-v>"] = "actions.select_vsplit",
				["<C-s>"] = "actions.select_split",
			},
			view_options = {
				show_hidden = true,
			},
		})
		vim.keymap.set("n", "<leader>-", function()
			require("oil").open_float()
		end, { desc = "Open parent directory" })
	end,

	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
