local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'jdtls',
    'eslint',
    'rust_analyzer',
    'marksman',
    'clangd',
    'lua_ls',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<CR>'] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

lsp.set_preferences({
	sign_icons = { }
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

vim.diagnostic.config({
    underline=true,
    virtual_text = true 
})

--lsp.on_attach(function(client, bufnr)
--	local opts = {buffer = bufnr, remap = false}
--
--	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts, { desc = "GOTO definition"})
--	vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts, { desc = "GOTO References"})
--	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts, { desc = "Hover Documentation"})
--	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts, { desc = "Workspace Symbols"})
--	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts, { desc = "Open FLoating Diagnostics")
--	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts, { desc = "GOTO Next"})
--	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts, { desc = "GOTO Prev"))
--	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts, { desc = ""))
--	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
--	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
--end)




-- LSP settings.
-- --  This function gets run when an LSP connects to a particular buffer.
 local on_attach = function(_, bufnr)
    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself
    -- many times.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

lsp.setup()

--vim.diagnostic.config({
--  virtual_text = {
--    -- source = "always",  -- Or "if_many"
--    prefix = '●', -- Could be '■', '▎', 'x'
--  },
--  severity_sort = true,
--  float = {
--    source = "always",  -- Or "if_many"
--  },
--})

-- This will auto float errors
--OpenDiagFloat = function ()
--  for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
--    if vim.api.nvim_win_get_config(winid).zindex then
--      return
--    end
--  end
--  vim.diagnostic.open_float({focusable = false})
--end
--
--vim.cmd([[autocmd CursorHold <buffer> lua OpenDiagFloat()]])
