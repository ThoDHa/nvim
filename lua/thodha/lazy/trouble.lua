return {
	"folke/trouble.nvim",
	config = function()
		require("trouble").setup({
			icons = false,
		})

		vim.keymap.set("n", "<leader>tt", function()
			require("trouble").toggle()
		end, { desc = "Trouble" })

		vim.keymap.set("n", "[t", function()
			require("trouble").next({ skip_groups = true, jump = true })
		end, { desc = "Trouble next" })

		vim.keymap.set("n", "]t", function()
			require("trouble").previous({ skip_groups = true, jump = true })
		end, { desc = "Trouble Previous" })
	end,
}
