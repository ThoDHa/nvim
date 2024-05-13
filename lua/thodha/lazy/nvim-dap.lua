return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	-- NOTE: And you can specify dependencies as well
	dependencies = {
		-- Creates a beautiful debugger UI
		{
			"rcarriga/nvim-dap-ui",
			config = function()
				local dapui = require("dapui")
				local dap = require("dap")
				-- Dap UI setup
				-- For more information, see |:help nvim-dap-ui|
				dapui.setup({
					-- Set icons to characters that are more likely to work in every terminal.
					--    Feel free to remove or use ones that you like more! :)
					--    Don't feel like these are good choices.
					icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
					controls = {
						icons = {
							pause = "⏸",
							play = "▶",
							step_into = "⏎",
							step_over = "⏭",
							step_out = "⏮",
							step_back = "b",
							run_last = "▶▶",
							terminate = "⏹",
						},
					},
					layouts = {
						{
							elements = {
								{
									id = "scopes",
									size = 0.50,
								},
								{
									id = "breakpoints",
									size = 0.30,
								},
								{
									id = "stacks",
									size = 0.10,
								},
								{
									id = "watches",
									size = 0.10,
								},
							},
							position = "right",
							size = 30,
						},
						{
							elements = { {
								id = "console",
								size = 0.5,
							} },
							position = "bottom",
							size = 20,
						},
					},
				})

				dap.listeners.after.event_initialized["dapui_config"] = dapui.open
				dap.listeners.before.event_terminated["dapui_config"] = dapui.close
				dap.listeners.before.event_exited["dapui_config"] = dapui.close
			end,
		},
		"nvim-neotest/nvim-nio",
		{ "theHamsta/nvim-dap-virtual-text", opts = {} },

		-- Installs the debug adapters for you
		"williamboman/mason.nvim",
		{
			"jay-babu/mason-nvim-dap.nvim",
			config = function()
				local mason = require("mason-nvim-dap").setup({
					-- Makes a best effort to setup the various debuggers with
					-- reasonable debug configurations
					automatic_setup = true,

					-- You'll need to check that you have the required things installed
					-- online, please don't ask me how to install them :)
					ensure_installed = {
						-- Update this to ensure that you have the debuggers for the langs you want
						"debugpy",
					},
					handlers = {},
				})
			end,
		},
		{
			-- Add your own debuggers here
			"mfussenegger/nvim-dap-python",
			config = function()
				local dap = require("dap")
				dap.set_log_level("TRACE")
				-- Basic debugging keymaps, feel free to change to your liking!
				vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Enter Debug Mode/Continue" })
				vim.keymap.set("n", "<F6>", dap.step_into, { desc = "Debug: Step Into" })
				vim.keymap.set("n", "<F7>", dap.step_over, { desc = "Debug: Step Over" })
				vim.keymap.set("n", "<F8>", dap.step_out, { desc = "Debug: Step out" })
				vim.keymap.set("n", "<leader>sb", dap.toggle_breakpoint, { desc = "Debug: Toggle BreakPoint" })
				vim.keymap.set("n", "<leader>sB", function()
					dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
				end, { desc = "Debug: Toggle Conditional BreakPoint" })
			end,
		},
	},
}
