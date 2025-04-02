return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		lazy = true, -- Enable lazy loading
		cmd = {
			"CopilotChat",
			"Copilot",
			"CopilotChatExplain",
			"CopilotChatGenerate",
			"CopilotChatFix",
			"CopilotChatRefactor",
			"CopilotChatModels",
		}, -- Load on CopilotChat or Copilot command
		dependencies = {
			{
				"github/copilot.vim",
				config = function()
					vim.g.copilot_enabled = false
				end,
			},
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = vim.fn.has("mac") == 1 or vim.fn.has("unix") == 1 and "make tiktoken" or nil, -- Conditional build command
		opts = {
			inline_suggestions = { enabled = false },
			context = { folder = true }, -- Set context to the folder
			window = { width = 0.33 }, -- Set window size to 33% of the screen width
			mappings = {
				close = "q",
				exit_insert = "<C-c>",
			},
			vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChat<CR>", { desc = "Open Copilot Chat" }),
			vim.keymap.set(
				"n",
				"<leader>ce",
				"<cmd>CopilotChatExplain<CR>",
				{ desc = "Explain code with Copilot Chat" }
			),
			vim.keymap.set(
				"n",
				"<leader>cg",
				"<cmd>CopilotChatGenerate<CR>",
				{ desc = "Generate code with Copilot Chat" }
			),
			vim.keymap.set("n", "<leader>cf", "<cmd>CopilotChatFix<CR>", { desc = "Fix code with Copilot Chat" }),
			vim.keymap.set(
				"n",
				"<leader>cr",
				"<cmd>CopilotChatRefactor<CR>",
				{ desc = "Refactor code with Copilot Chat" }
			),
			vim.keymap.set("n", "<leader>ct", "<cmd>CopilotChatTest<CR>", { desc = "Test code with Copilot Chat" }),
			vim.keymap.set("n", "<leader>cm", "<cmd>CopilotChatModels<CR>", { desc = "Change Copilot Chat Model" }),
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
}
