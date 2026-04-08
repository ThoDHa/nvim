return {
	"rmagatti/auto-session",
	-- Load when session keymaps are pressed or session commands are used
	keys = {
		{ "<leader>Ss", "<cmd>SessionSearch<CR>", desc = "[S]ession [s]earch" },
	},
	cmd = { "SessionSave", "SessionRestore", "SessionDelete", "AutoSession" },
	-- Still load on VimEnter for auto-restore functionality
	event = "VimEnter",
	opts = {
		log_level = "error",
		auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		-- Disable eager telescope extension loading at startup
		-- Telescope will still work when you invoke session commands
		session_lens = {
			load_on_setup = false,
		},
	},
}
