return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local want = {
			"vimdoc",
			"vim",
			"gitcommit",
			"bash",
			"markdown",
			"markdown_inline",
			"html",
			"javascript",
			"typescript",
			"python",
			"go",
			"htmldjango",
			"lua",
		}

		local have = require("nvim-treesitter.config").get_installed()
		local missing = vim.iter(want)
			:filter(function(p)
				return not vim.tbl_contains(have, p)
			end)
			:totable()
		if #missing > 0 then
			require("nvim-treesitter").install(missing)
		end

		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				local ok, parser = pcall(vim.treesitter.get_parser)
				if not ok or not parser then
					return
				end
				pcall(vim.treesitter.start)
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
