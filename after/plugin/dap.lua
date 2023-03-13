local dap = require('dap')
dap.set_log_level('TRACE')

-- Basic debugging keymaps, feel free to change to your liking!
vim.keymap.set('n', '<F5>', dap.continue,{ desc = 'Debug: Enter Debug Mode/Continue' })
vim.keymap.set('n', '<F6>', dap.step_into,{ desc = 'Debug: Step Into' } )
vim.keymap.set('n', '<F7>', dap.step_over,{ desc = 'Debug: Step Over' } )
vim.keymap.set('n', '<F8>', dap.step_out, {desc = 'Debug: Step out' })
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle BreakPoint' })
vim.keymap.set('n', '<leader>B', function()
    dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = 'Debug: Toggle Conditional BreakPoint' })

