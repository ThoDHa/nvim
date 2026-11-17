-- grug-far.nvim: interactive global search-and-replace UI, opened with
-- :GrugFar or its keymap.
return {
	"MagicDuck/grug-far.nvim",
	cmd = "GrugFar",
	opts = {
		headerMaxWidth = 80,
	},
	keys = {
		{
			"<leader>S",
			function()
				require("grug-far").open()
			end,
			mode = { "n", "v" },
			desc = "Search and Replace",
		},
		{
			"<leader>spw",
			function()
				require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
			end,
			mode = "n",
			desc = "Search current word",
		},
		{
			"<leader>spw",
			function()
				require("grug-far").open({ prefills = { search = require("grug-far").get_current_visual_selection() } })
			end,
			mode = "v",
			desc = "Search selection",
		},
		{
			"<leader>spp",
			function()
				require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
			end,
			desc = "Search current file",
		},
	},
}
