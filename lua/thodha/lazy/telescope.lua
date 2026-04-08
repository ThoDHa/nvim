return { -- Fuzzy Finder (files, lsp, etc)
	"nvim-telescope/telescope.nvim",
	branch = "master",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			"nvim-telescope/telescope-fzf-native.nvim",

			-- `build` is used to run some command when the plugin is installed/updated.
			-- This is only run then, not every time Neovim starts up.
			build = "make",

			-- `cond` is a condition used to determine whether this plugin should be
			-- installed and loaded.
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },

		-- Useful for getting pretty icons, but requires a Nerd Font.
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	keys = {
		{ "<leader>sh", function() require("telescope.builtin").help_tags() end, desc = "[S]earch [H]elp" },
		{ "<leader>sk", function() require("telescope.builtin").keymaps() end, desc = "[S]earch [K]eymaps" },
		{ "<leader>sf", function() require("telescope.builtin").find_files() end, desc = "[S]earch [F]iles" },
		{ "<leader>ss", function() require("telescope.builtin").builtin() end, desc = "[S]earch [S]elect Telescope" },
		{ "<leader>sw", function() require("telescope.builtin").grep_string() end, desc = "[S]earch current [W]ord" },
		{ "<leader>sg", function() require("telescope.builtin").live_grep() end, desc = "[S]earch by [G]rep" },
		{ "<leader>sd", function() require("telescope.builtin").diagnostics() end, desc = "[S]earch [D]iagnostics" },
		{ "<leader>sr", function() require("telescope.builtin").resume() end, desc = "[S]earch [R]esume" },
		{ "<leader>s.", function() require("telescope.builtin").oldfiles() end, desc = '[S]earch Recent Files ("." for repeat)' },
		{
			"<leader><leader>",
			function()
				require("telescope.builtin").buffers({
					attach_mappings = function(_, map)
						map("i", "<c-d>", function(prompt_bufnr)
							local actions = require("telescope.actions")
							local state = require("telescope.actions.state")
							local selection = state.get_selected_entry()
							if selection and vim.api.nvim_buf_is_valid(selection.bufnr) then
								actions.delete_buffer(prompt_bufnr)
							else
								vim.notify("Buffer is invalid or already deleted", vim.log.levels.WARN)
							end
						end)
						map("n", "<c-d>", function(prompt_bufnr)
							local actions = require("telescope.actions")
							local state = require("telescope.actions.state")
							local selection = state.get_selected_entry()
							if selection and vim.api.nvim_buf_is_valid(selection.bufnr) then
								actions.delete_buffer(prompt_bufnr)
							else
								vim.notify("Buffer is invalid or already deleted", vim.log.levels.WARN)
							end
						end)
						return true
					end,
				})
			end,
			desc = "[ ] Find and delete buffers",
		},
		{
			"<leader>/",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end,
			desc = "[/] Fuzzily search in current buffer",
		},
		{
			"<leader>s/",
			function()
				require("telescope.builtin").live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end,
			desc = "[S]earch [/] in Open Files",
		},
		{
			"<leader>sn",
			function()
				require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "[S]earch [N]eovim files",
		},
	},
	cmd = { "Telescope" },
	config = function()
		-- [[ Configure Telescope ]]
		-- See `:help telescope` and `:help telescope.setup()`
		require("telescope").setup({
			defaults = {
				layout_strategy = "vertical",
				layout_config = { height = 0.99, width = 0.99 },
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
	end,
}
