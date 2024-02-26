vim.defer_fn(function()
	require'nvim-treesitter.configs'.setup {
		-- A list of parser names, or "all" (the five listed parsers should always be installed)
		ensure_installed = {
			'vimdoc',
			'vim',
			'markdown',
			'javascript',
			'typescript',
			"c",
			"java",
			"lua",
			"vim",
			"rust",
		},

		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = false,

		-- Automatically install missing parsers when entering buffer
		-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		auto_install = true,
		indent = { enable = true },
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	}
end, 0)
