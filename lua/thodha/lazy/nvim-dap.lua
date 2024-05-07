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
		-- Add your own debuggers here
		"mfussenegger/nvim-dap-python",
		{
			"mfussenegger/nvim-dap-vscode-js",
			config = function()
				require("dap-vscode-js").setup({
					debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
					debugger_cmd = { "js-debug-adapter" },
					adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
				})

				local dap = require("dap")

				-- custom adapter for running tasks before starting debug
				local custom_adapter = "pwa-node-custom"
				dap.adapters[custom_adapter] = function(cb, config)
					if config.preLaunchTask then
						local async = require("plenary.async")
						local notify = require("notify").async

						async.run(function()
							---@diagnostic disable-next-line: missing-parameter
							notify("Running [" .. config.preLaunchTask .. "]").events.close()
						end, function()
							vim.fn.system(config.preLaunchTask)
							config.type = "pwa-node"
							dap.run(config)
						end)
					end
				end

				-- language config
				for _, language in ipairs({ "typescript", "javascript" }) do
					dap.configurations[language] = {
						{
							name = "Launch",
							type = "pwa-node",
							request = "launch",
							program = "${file}",
							rootPath = "${workspaceFolder}",
							cwd = "${workspaceFolder}",
							sourceMaps = true,
							skipFiles = { "<node_internals>/**" },
							protocol = "inspector",
							console = "integratedTerminal",
						},
						{
							name = "Attach to node process",
							type = "pwa-node",
							request = "attach",
							rootPath = "${workspaceFolder}",
							processId = require("dap.utils").pick_process,
						},
						{
							name = "Debug Main Process (Electron)",
							type = "pwa-node",
							request = "launch",
							program = "${workspaceFolder}/node_modules/.bin/electron",
							args = {
								"${workspaceFolder}/dist/index.js",
							},
							outFiles = {
								"${workspaceFolder}/dist/*.js",
							},
							resolveSourceMapLocations = {
								"${workspaceFolder}/dist/**/*.js",
								"${workspaceFolder}/dist/*.js",
							},
							rootPath = "${workspaceFolder}",
							cwd = "${workspaceFolder}",
							sourceMaps = true,
							skipFiles = { "<node_internals>/**" },
							protocol = "inspector",
							console = "integratedTerminal",
						},
						{
							name = "Compile & Debug Main Process (Electron)",
							type = custom_adapter,
							request = "launch",
							preLaunchTask = "npm run build-ts",
							program = "${workspaceFolder}/node_modules/.bin/electron",
							args = {
								"${workspaceFolder}/dist/index.js",
							},
							outFiles = {
								"${workspaceFolder}/dist/*.js",
							},
							resolveSourceMapLocations = {
								"${workspaceFolder}/dist/**/*.js",
								"${workspaceFolder}/dist/*.js",
							},
							rootPath = "${workspaceFolder}",
							cwd = "${workspaceFolder}",
							sourceMaps = true,
							skipFiles = { "<node_internals>/**" },
							protocol = "inspector",
							console = "integratedTerminal",
						},
					}
				end
			end,
		},
	},
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
}
