 return {
 	"stevearc/conform.nvim",
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = {
			timeout_ms = 5000,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black", "isort" },
			html = { "djlint" },
			json = { "jq" },
			jsonc = { "jq" },
			markdown = { "markdownlint" },

			-- Conform can also run multiple formatters sequentially
			--
			-- You can use a sub-list to tell conform to run *until* a formatter
			-- is found.
			-- javascript = { { "prettierd", "prettier" } },
		},
	},
}
