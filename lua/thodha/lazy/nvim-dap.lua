return {
	"mfussenegger/nvim-dap",
	-- Only load when debugging keymaps are pressed
	keys = {
		{
			"<F5>",
			function()
				local dap = require("dap")
				-- Already debugging: just continue.
				if dap.session() then
					dap.continue()
					return
				end
				-- No session: launch the current file directly instead of
				-- showing the configuration picker.
				for _, cfg in ipairs(dap.configurations[vim.bo.filetype] or {}) do
					if cfg.name == "Launch file" then
						dap.run(cfg)
						return
					end
				end
				dap.continue()
			end,
			desc = "Debug: Launch file / Continue",
		},
		{
			"<F6>",
			function()
				require("dap").step_into()
			end,
			desc = "Debug: Step Into",
		},
		{
			"<F7>",
			function()
				require("dap").step_over()
			end,
			desc = "Debug: Step Over",
		},
		{
			"<F8>",
			function()
				require("dap").step_out()
			end,
			desc = "Debug: Step Out",
		},
		{
			"<leader>sb",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Debug: Toggle Breakpoint",
		},
		{
			"<leader>sB",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "Debug: Toggle Conditional Breakpoint",
		},
		{
			"<leader>sD",
			function()
				require("dapui").toggle()
			end,
			desc = "Debug: Toggle UI",
		},
		{
			"<leader>da",
			function()
				require("dap").attach()
			end,
			desc = "Debug: Attach",
		},
	},
	cmd = { "DapContinue", "DapToggleBreakpoint", "DapNew" },
	dependencies = {
		-- Creates a beautiful debugger UI
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
		-- Installs the debug adapters for you
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		-- Python debugger
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- Set log level for debugging
		dap.set_log_level("WARN")

		-- Resolve the python that has the project's deps installed: an active
		-- venv first, then a project-local .venv found by walking up from the
		-- current file. Mason's own debugpy python does NOT have your project
		-- modules, so launching with it fails to import them.
		local function get_python_path()
			local venv = os.getenv("VIRTUAL_ENV")
			if venv and venv ~= "" then
				return venv .. "/bin/python"
			end
			local root = vim.fs.root(0, { ".venv", "pyproject.toml", ".git" })
			if root then
				local candidate = root .. "/.venv/bin/python"
				if vim.fn.executable(candidate) == 1 then
					return candidate
				end
			end
			return "python3"
		end

		-- Setup mason-nvim-dap
		require("mason-nvim-dap").setup({
			automatic_setup = true,
			ensure_installed = {
				"debugpy",
				"chrome-debug-adapter",
			},
			handlers = {},
		})

		-- Setup nvim-dap-virtual-text
		require("nvim-dap-virtual-text").setup({})

		-- Dap UI setup
		dapui.setup({
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
						{ id = "scopes", size = 0.50 },
						{ id = "breakpoints", size = 0.30 },
						{ id = "stacks", size = 0.10 },
						{ id = "watches", size = 0.10 },
					},
					position = "right",
					size = 30,
				},
				{
					elements = { { id = "console", size = 0.5 } },
					position = "bottom",
					size = 20,
				},
			},
		})

		-- Launch the debugger with the project venv (the one that has your
		-- deps installed), not mason's debugpy python. Runs after mason so it
		-- wins. Select a different venv anytime with <leader>v (venv-selector).
		require("dap-python").setup(get_python_path())

		-- Auto open/close dapui with debug sessions
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
			vim.api.nvim_echo({ { "DAP session started", "MoreMsg" } }, false, {})
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
			vim.api.nvim_echo({ { "DAP session terminated", "WarningMsg" } }, false, {})
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
			vim.api.nvim_echo({ { "DAP session exited", "WarningMsg" } }, false, {})
		end
	end,
}
