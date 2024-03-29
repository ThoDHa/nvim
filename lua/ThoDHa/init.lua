require("ThoDHa.remap")
require("ThoDHa.set")
vim.api.nvim_create_autocmd("BufReadPost",
    {
        pattern = {"*.json"},
        command = "silent %!python3 -m json.tool"
    })
vim.api.nvim_create_autocmd("BufReadPost",
    {
        pattern = {"*"},
        command = "set colorcolumn="
    })

vim.api.nvim_create_autocmd("BufReadPost",
    {
        pattern = {"*.py"},
        command = "set colorcolumn=101"
    })

vim.api.nvim_create_autocmd("BufReadPost",
    {
        pattern = {"*.md"},
        command = "set colorcolumn=81"
    })
vim.api.nvim_create_autocmd("CursorHoldI",
    {
        pattern = {"*"},
        command = "let &undolevels = &undolevels"
    })

