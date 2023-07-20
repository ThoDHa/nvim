require('telescope').setup{
  defaults = {
    layout_strategy = 'vertical',
    layout_config = { height = 0.95 },
  },
}

local builtin = require('telescope.builtin')

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
 

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
    --   -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = '[G]et [R]eferences'})
vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, { desc = '[G]et [I]mplementations'})
vim.keymap.set("n", "<leader>ml", builtin.marks, { desc = '[M]ark [L]ist'})




vim.keymap.set('n', '<leader>gfs', builtin.git_files, { desc = '[G]it [F]iles [S]earch '})
vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = '[G]it [B]ranches'})
vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = '[G]it [S]tatus'})
vim.keymap.set("n", "<leader>gbc", builtin.git_bcommits, { desc = '[G]it [B]uffer [C]ommits'})
vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = '[G]it [C]ommits'})

vim.api.nvim_create_augroup('startup', { clear = true })
vim.api.nvim_create_autocmd('VimEnter', {
  group = 'startup',
  pattern = '*',
  callback = function()
    -- Open file browser if argument is a folder
    local arg = vim.api.nvim_eval('argv(0)')
    if arg and (vim.fn.isdirectory(arg) ~= 0 or arg == "") then
      vim.defer_fn(function()
        builtin.find_files()
      end, 10)
    end
  end
})
