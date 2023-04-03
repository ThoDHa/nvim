require('lint').linters_by_ft = {
  markdown = {'markdownlint',},
  python = {'pylint',}
}

 vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "TextChanged", "TextChangedI" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
