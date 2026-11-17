-- venv-selector.nvim: pick the Python virtualenv to use for LSP and
-- debugging with <leader>v.
return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-dap-python", --optional
		"nvim-telescope/telescope.nvim",
	},
	lazy = true,
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
