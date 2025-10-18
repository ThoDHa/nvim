return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-dap-python", --optional
		{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
	},
	lazy = false,
	config = function()
		require("venv-selector").setup({
			-- Basic configuration options
			name = "venv",
			auto_refresh = true,
			search_venv_managers = true,
			search_workspace = true,
		})
	end,
	keys = {
		{ "<leader>v", "<cmd>VenvSelect<cr>" },
	},
}
