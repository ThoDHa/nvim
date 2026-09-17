return {
	"rmagatti/auto-session",
	-- Must load eagerly (not on VimEnter): pager detection relies on a
	-- StdinReadPre handler, which misses stdin when setup runs at VimEnter,
	-- so e.g. MANPAGER='nvim +Man!' would get a session restore instead.
	lazy = false,
	keys = {
		{ "<leader>Ss", "<cmd>SessionSearch<CR>", desc = "[S]ession [s]earch" },
	},
	cmd = { "SessionSave", "SessionRestore", "SessionDelete", "AutoSession" },
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
