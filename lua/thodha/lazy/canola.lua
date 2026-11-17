-- canola.nvim: file manager based on oil.nvim that lets you edit the
-- filesystem like a normal buffer; open it with <leader>- or :Oil.
return {
	"barrettruth/canola.nvim",
	main = "oil",
	keys = {
		{ "<leader>-", function() require("oil").open_float() end, desc = "Open parent directory" },
	},
	cmd = { "Oil" },
	opts = {
		keymaps = {
			["<C-h>"] = false,
			["<C-v>"] = "actions.select_vsplit",
			["<C-s>"] = "actions.select_split",
			["<C-p>"] = "<UP>",
		},
		view_options = {
			show_hidden = true,
		},
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
