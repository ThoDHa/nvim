-- mini.nvim: collection of small, independent modules; this setup enables
-- surround (add/delete/change surrounding pairs), pairs (auto-close), and
-- ai (extended textobjects).
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
