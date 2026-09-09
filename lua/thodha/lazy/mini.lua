return {
	"echasnovski/mini.nvim",
	version = "*",
	event = "VeryLazy",
	config = function()
		require("mini.surround").setup()
		require("mini.pairs").setup()
		require("mini.ai").setup({ n_lines = 500 })
	end,
}
