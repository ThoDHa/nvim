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
			"CopilotChatOptimize",
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
		keys = {
			{
				"<c-s>",
				"<cr>",
				ft = "copilot-chat",
				desc = "Submit Prompt",
				mode = { "n", "v" },
				remap = true,
			},
			{
				"<leader>cc",
				function()
					return require("CopilotChat").toggle()
				end,
				desc = "Toggle Copilot Chat",
				mode = { "n", "v" },
			},
			{
				"<leader>cx",
				function()
					return require("CopilotChat").reset()
				end,
				desc = "Clear Copilot Chat",
				mode = { "n", "v" },
			},
			{
				"<leader>cq",
				function()
					vim.ui.input({ prompt = " Quick Chat: " }, function(input)
						if input ~= "" then
							require("CopilotChat").ask(input)
						end
					end)
				end,
				desc = "Quick Copilot Chat",
				mode = { "n", "v" },
			},
			{
				"<leader>cr",
				"<cmd>CopilotChatReview<cr>",
				desc = "Copilot Review",
				mode = { "n", "v" },
			},
			{
				"<leader>ce",
				"<cmd>CopilotChatExplain<cr>",
				desc = "Copilot Explain",
				mode = { "n", "v" },
			},
			{
				"<leader>cd",
				"<cmd>CopilotChatDocs<cr>",
				desc = "Copilot Docs",
				mode = { "n", "v" },
			},
			{
				"<leader>cf",
				"<cmd>CopilotChatFix<cr>",
				desc = "Copilot Fix",
				mode = { "n", "v" },
			},
			{
				"<leader>co",
				"<cmd>CopilotChatOptimize<cr>",
				desc = "Copilot Optimize",
				mode = { "n", "v" },
			},
			{
				"<leader>cm",
				"<cmd>CopilotChatModels<CR>",
				desc = "Copilot Models",
				mode = { "n", "v" },
			},
		},
		opts = {
			inline_suggestions = { enabled = false },
			context = { folder = true }, -- Set context to the folder
			window = { width = 0.33 }, -- Set window size to 33% of the screen width
			mappings = {
				close = "q",
				exit_insert = "<C-c>",
			},
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "*.copilot-chat", -- Match filetype instead of buffer name
				callback = function()
					vim.opt_local.relativenumber = false
					vim.opt_local.number = false
				end,
			})

			-- Close a window on WinLeave event
			vim.api.nvim_create_autocmd("WinLeave", {
				pattern = "copilot-chat",
				callback = function()
					local win = vim.api.nvim_get_current_win()
					if vim.api.nvim_win_get_config(win).relative ~= "" then
						vim.api.nvim_win_close(win, true)
					end
				end,
			})

			local chat = require("CopilotChat")
			chat.setup(opts)
		end,
		-- See Commands section for default commands if you want to lazy load on them
	},
}
