return {}
-- return {
-- 	"yetone/avante.nvim",
-- 	event = "VeryLazy",
-- 	version = false, -- Never set this value to "*"! Never!
-- 	opts = {
-- 		-- Add any opts here
-- 		-- For example
-- 		provider = "copilot",
-- 		models = {
-- 			"gpt-3.5",
-- 			"gpt-4",
-- 			"claude-3.7-sonnet",
-- 			"claude-3.5-sonnet",
-- 			"gpt-4o",
-- 			"gpt-4-turbo",
-- 			-- Add any other models you want to include
-- 		},
-- 	},
-- 	-- If you want to build from source then do `make BUILD_FROM_SOURCE=true`
-- 	build = "make",
-- 	-- Build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
-- 	dependencies = {
-- 		"nvim-treesitter/nvim-treesitter",
-- 		"stevearc/dressing.nvim",
-- 		"nvim-lua/plenary.nvim",
-- 		"MunifTanjim/nui.nvim",
-- 		--- The below dependencies are optional,
-- 		"echasnovski/mini.pick", -- for file_selector provider mini.pick
-- 		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
-- 		"hrsh7th/nvim-cmp", -- Autocompletion for Avante commands and mentions
-- 		"ibhagwan/fzf-lua", -- for file_selector provider fzf
-- 		"nvim-tree/nvim-web-devicons", -- or techasnovski/mini.icons
-- 		"zbirenbaum/copilot.lua", -- for providers='copilot'
-- 		{
-- 			-- support for image pasting
-- 			"HakonHarnes/img-clip.nvim",
-- 			event = "VeryLazy",
-- 			opts = {
-- 				-- recommended settings
-- 				default = {
-- 					embed_image_as_base64 = false,
-- 					prompt_for_file_name = false,
-- 					drag_and_drop = {
-- 						insert_mode = true,
-- 					},
-- 					-- required for Windows users
-- 					use_absolute_path = true,
-- 				},
-- 			},
-- 		},
-- 		{
-- 			-- Make sure to set this up properly if you have lazy=true
-- 			"MeanderingProgrammer/render-markdown.nvim",
-- 			opts = {
-- 				file_types = { "markdown", "Avante" },
-- 			},
-- 			ft = { "markdown", "Avante" },
-- 		},
-- 	},
-- }
