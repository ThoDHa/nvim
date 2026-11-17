-- snacks.nvim: grab-bag of UI modules; this setup enables its input,
-- picker (also wired as vim.ui.select), and floating terminal.
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		input = {},
		picker = {
			ui_select = true,
		},
		terminal = {},
	},
}
