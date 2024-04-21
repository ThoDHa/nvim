require("oil").setup()
vim.keymap.set("n", "<leader>-", function()
	require("oil").open_float()
end, { desc = "Open parent directory" })
