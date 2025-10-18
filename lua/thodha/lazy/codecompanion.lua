return {
	"olimorris/codecompanion.nvim",
	opts = {
		default_adapter = "copilot claude-sonnet-4",
		strategies = {
			chat = {
				keymaps = {
					close = {
						modes = { n = "<C-c>", i = "<C-c>" },
						opts = {
							callback = function() end, -- no-op
						},
					},
					-- Add further custom keymaps here
				},
			},
		},
	},
	config = function(_, opts)
		require("codecompanion").setup(opts)

		-- Keymaps (mirroring CopilotChat)
		local cc = require("codecompanion")
		vim.keymap.set({ "n", "v" }, "<leader>cc", function()
			cc.toggle()
		end, { desc = "Toggle CodeCompanion" })
		vim.keymap.set({ "n", "v" }, "<leader>cx", function()
			cc.reset()
		end, { desc = "Clear CodeCompanion" })
		vim.keymap.set({ "n", "v" }, "<leader>cq", function()
			vim.ui.input({ prompt = " Quick Chat: " }, function(input)
				if input and input ~= "" then
					cc.ask(input)
				end
			end)
		end, { desc = "Quick CodeCompanion Chat" })
		vim.keymap.set({ "n", "v" }, "<leader>cr", "<cmd>CodeCompanionReview<cr>", { desc = "CodeCompanion Review" })
		vim.keymap.set({ "n", "v" }, "<leader>ce", "<cmd>CodeCompanionExplain<cr>", { desc = "CodeCompanion Explain" })
		vim.keymap.set({ "n", "v" }, "<leader>cd", "<cmd>CodeCompanionDocs<cr>", { desc = "CodeCompanion Docs" })
		vim.keymap.set({ "n", "v" }, "<leader>cf", "<cmd>CodeCompanionFix<cr>", { desc = "CodeCompanion Fix" })
		vim.keymap.set(
			{ "n", "v" },
			"<leader>co",
			"<cmd>CodeCompanionOptimize<cr>",
			{ desc = "CodeCompanion Optimize" }
		)
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		{
			"github/copilot.vim",
			config = function()
				vim.g.copilot_enabled = false
			end,
		},
	},
}
