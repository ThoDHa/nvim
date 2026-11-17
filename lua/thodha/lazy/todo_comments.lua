-- todo-comments.nvim: highlights and lists TODO, FIXME, and similar
-- keywords across the project.
return {
	"folke/todo-comments.nvim",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		signs = false,
	},
}
