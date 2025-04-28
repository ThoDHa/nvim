local M = {}

local oil = require("oil")

-- Function to create a new tmux session based on the current directory in oil.nvim
function M.create_tmux_session_from_oil()
	local current_dir = oil.get_current_dir()
	if not current_dir then
		print("Could not determine the current directory.")
		return
	end

	-- Replace spaces in the directory name to create a valid session name
	-- Command to create a new tmux session without a specific name
	local tmux_command = string.format("tmux new-session -d -c %s", current_dir)

	-- Execute the tmux command
	vim.fn.system(tmux_command)

	print(string.format("Tmux session created with root '%s'", current_dir))
	-- Close oil.nvim after running the command
	oil.close()
end

return M
