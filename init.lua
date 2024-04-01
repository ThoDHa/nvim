require("ThoDHa")

-- Installs lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- If encountering errors, see telescope-fzf-native README for install instructions
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

			-- Useful for getting pretty icons, but requires special font.
			--  If you already have a Nerd Font, or terminal set up with fallback fonts
			--  you can enable this
			{ "nvim-tree/nvim-web-devicons" },
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	{
		"ThePrimeagen/harpoon",
		event = "VeryLazy",
	},

	"mbbill/undotree",
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"tpope/vim-sleuth",
		event = "VeryLazy",
	},
	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			signs = false,
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = {},
	},

	-- LSP Support
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", opts = {} },
		},
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					-- Build Step is needed for regex support in snippets
					-- This step is not supported in many windows environments
					-- Remove the below condition to re-enable on windows
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
			},
			"saadparwaiz1/cmp_luasnip",

			-- Adds LSP completion capabilities
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",

			-- Adds a number of user-friendly snippets
			"rafamadriz/friendly-snippets",
		},
	},
	-- Autoformat
	{
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = false,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform can also run multiple formatters sequentially
				python = { "isort", "black" },
				--
				-- You can use a sub-list to tell conform to run *until* a formatter
				-- is found.
				-- javascript = { { "prettierd", "prettier" } },
			},
		},
	},

	-- This is for Debugging support and UI
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		-- NOTE: And you can specify dependencies as well
		dependencies = {
			-- Creates a beautiful debugger UI
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",

			-- Installs the debug adapters for you
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",

			-- Add your own debuggers here
			"mfussenegger/nvim-dap-python",
			"mfussenegger/nvim-dap-vscode-js",
		},
	},
	-- This is for linting...
	--'mfussenegger/nvim-lint',
	{
		"mfussenegger/nvim-jdtls",
		event = "VeryLazy",
	},
	-- Status
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
		},
		opts = {},
	},
	{
		"rmagatti/auto-session",
		opts = {
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		},
	},
	{
		-- Color Schemes
		"navarasu/onedark.nvim",
		opts = {
			-- style = 'dark'
			-- style = 'darker'
			-- style = 'cool'
			style = "deep",
			--  style = 'warm'
			-- style = 'warmer'
			-- style = 'light'
		},
	},
	-- Does a popup of possible key maps
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		main = "ibl",
		opts = {},
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	-- install without yarn or npm
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		cmd = {
			"MarkdownPreviewToggle",
			"MarkdownPreview",
			"MarkdownPreviewStop",
		},
	},
	{
		"stevearc/oil.nvim",
		event = "VeryLazy",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"nvim-pack/nvim-spectre",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
}, {})

require("onedark").load()
--
