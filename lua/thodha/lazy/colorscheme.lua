return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("rose-pine")
		end,
		config = function()
			require("rose-pine").setup({
				variant = "auto",
				dark_variant = "main",
				dim_inactive_windows = false,
				extend_background_behind_borders = true,
				styles = {
					bold = true,
					italic = true,
					transparency = false,
				},
				groups = {
					border = "muted",
					link = "iris",
					panel = "surface",
				},
				highlight_groups = {
					Comment = { fg = "foam" },
					["@comment"] = { fg = "foam" },
				},
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "moon",
				transparent = false,
				terminal_colors = true,
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
					functions = {},
					variables = {},
				},
				sidebars = { "qf", "vista_kind", "terminal", "packer" },
				on_colors = function(colors)
					colors.fg_gutter = colors.none
				end,
			})
		end,
		keys = {
			{
				"<leader>cs",
				function()
					vim.cmd("Telescope colorscheme")
				end,
				desc = "[ ] Change Color Scheme",
			},
		},
	},
}
