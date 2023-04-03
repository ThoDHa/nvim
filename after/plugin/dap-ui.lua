local dapui = require('dapui')
local dap = require('dap')
-- Dap UI setup
-- For more information, see |:help nvim-dap-ui|
dapui.setup {
    -- Set icons to characters that are more likely to work in every terminal.
    --    Feel free to remove or use ones that you like more! :)
    --    Don't feel like these are good choices.
    icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
    controls = {
        icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
        },
    },
    layouts = { {
        elements = { {
            id = "scopes",
            size = 0.50
          }, {
            id = "breakpoints",
            size = 0.30
          }, {
            id = "stacks",
            size = 0.10
          }, {
            id = "watches",
            size = 0.10
          } },
        position = "right",
        size =30
      }, {
        elements = { {
            id = "console",
            size = 0.5
          } },
        position = "bottom",
        size = 20
      } }

,}

dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.before.event_exited['dapui_config'] = dapui.close
