return {
	"NickvanDyke/opencode.nvim",
	dependencies = {
		-- Recommended for `ask()` and `select()`.
		-- Required for `snacks` provider.
		---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
		{ "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
	},
	init = function()
		---@type opencode.Opts
		vim.g.opencode_opts = {
			-- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
		}

		-- Required for `opts.events.reload`.
		vim.o.autoread = true
	end,
	keys = {
		{
			"<leader>pa",
			function()
				require("opencode").ask("@this: ", { submit = true })
			end,
			mode = { "n", "x" },
			desc = "Ask opencode",
		},
		{
			"<leader>px",
			function()
				require("opencode").select()
			end,
			mode = { "n", "x" },
			desc = "Execute opencode action…",
		},
		{
			"<leader>pt",
			function()
				require("opencode").toggle()
			end,
			mode = { "n", "t" },
			desc = "Toggle opencode",
		},
		{
			"<leader>pr",
			function()
				return require("opencode").operator("@this ")
			end,
			mode = { "n", "x" },
			expr = true,
			desc = "Add range to opencode",
		},
		{
			"<leader>pl",
			function()
				return require("opencode").operator("@this ") .. "_"
			end,
			expr = true,
			desc = "Add line to opencode",
		},
		{
			"<leader>pu",
			function()
				require("opencode").command("session.half.page.up")
			end,
			desc = "opencode half page up",
		},
		{
			"<leader>pd",
			function()
				require("opencode").command("session.half.page.down")
			end,
			desc = "opencode half page down",
		},
	},
}
