return {
	"nvim-pack/nvim-spectre",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>S", function() require("spectre").toggle() end, desc = "Toggle Spectre" },
		{ "<leader>spw", function() require("spectre").open_visual({ select_word = true }) end, mode = "n", desc = "Search current word" },
		{ "<leader>spw", function() require("spectre").open_visual() end, mode = "v", desc = "Search current word" },
		{ "<leader>spp", function() require("spectre").open_file_search({ select_word = true }) end, desc = "Search on current file" },
	},
	opts = {
		highlight = {
			search = "SpectreSearch",
			replace = "SpectreReplace",
		},
		mapping = {
			["send_to_qf"] = {
				map = "<C-q>",
				cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
				desc = "send all items to quickfix",
			},
		},
	},
}
