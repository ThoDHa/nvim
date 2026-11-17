-- blink.cmp: autocompletion engine providing LSP-sourced completion items,
-- snippet expansion (via friendly-snippets), and insert-mode keymaps.
return {
	"saghen/blink.cmp",
	version = "1.*",
	event = "InsertEnter",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	opts = {
		keymap = {
			preset = "default",
			["<C-u>"] = { "scroll_documentation_up", "fallback" },
			["<C-d>"] = { "scroll_documentation_down", "fallback" },
			["<C-f>"] = { "select_and_accept", "fallback" },
		},
		completion = { documentation = { auto_show = false } },
		sources = { default = { "lsp", "path", "snippets", "buffer" } },
		signature = { enabled = true },
		fuzzy = { implementation = "lua" },
	},
}
