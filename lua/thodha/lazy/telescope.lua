return {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { -- If encountering errors, see telescope-fzf-native README for install instructions
        "nvim-telescope/telescope-fzf-native.nvim",

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = "make",

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
            return vim.fn.executable("make") == 1
        end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },

    -- Useful for getting pretty icons, but requires special font.
    --  If you already have a Nerd Font, or terminal set up with fallback fonts
    --  you can enable this
    { "nvim-tree/nvim-web-devicons" },

},
config = function()
    require("telescope").setup({
        defaults = {
            layout_strategy = "vertical",
            layout_config = { height = 0.95 },
        },
    })

    local builtin = require("telescope.builtin")

    -- Enable telescope fzf native, if installed
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")
    -- See `:help telescope.builtin`
    vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
    vim.keymap.set("n", "<leader><space>", builtin.buffers, { desc = "[ ] Find existing buffers" })
    vim.keymap.set("n", "<leader>/", function()
        --   -- You can pass additional configuration to telescope to change theme, layout, etc.
        require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
            winblend = 10,
            previewer = false,
        }))
    end, { desc = "[/] Fuzzily search in current buffer" })

    vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
    vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
    --vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
    vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "[G]et [R]eferences" })
    vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, { desc = "[G]et [I]mplementations" })
    vim.keymap.set("n", "<leader>ml", builtin.marks, { desc = "[M]ark [L]ist" })
    vim.keymap.set("n", "<leader>ts", builtin.treesitter, { desc = "[T]ree [S]itter" })

    vim.keymap.set("n", "<leader>gfs", builtin.git_files, { desc = "[G]it [F]iles [S]earch " })
    -- vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = '[G]it [S]tatus'})
    vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "[G]it [B]ranches" })
    vim.keymap.set("n", "<leader>gc", builtin.git_bcommits, { desc = "[G]it [C]ommits for Buffer" })

    --vim.api.nvim_create_augroup('startup', { clear = true })
    --vim.api.nvim_create_autocmd('VimEnter', {
    --  group = 'startup',
    --  pattern = '*',
    --  callback = function()
    --    -- Open file browser if argument is a folder
    --    local arg = vim.api.nvim_eval('argv(0)')
    --    if arg and (vim.fn.isdirectory(arg) ~= 0 or arg == "") then
    --      vim.defer_fn(function()
    --        builtin.find_files()
    --      end, 10)
    --    end
    --  end
    --})
end
}
