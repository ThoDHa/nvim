return	{
    "stevearc/oil.nvim",
    event = "VeryLazy",
    opts = function()
        vim.keymap.set("n", "<leader>-", function()
            require("oil").open_float()
        end, { desc = "Open parent directory" })
    end,

    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
