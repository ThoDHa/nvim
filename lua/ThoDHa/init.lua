require("ThoDHa.remap")
require("ThoDHa.set")
vim.api.nvim_create_autocmd("BufReadPost",
    {
        pattern = {"*.json"},
        command = "silent %!jq ."
    })
