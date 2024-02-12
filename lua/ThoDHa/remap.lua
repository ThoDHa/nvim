vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>-", vim.cmd.Ex, { desc = 'Open up Explorer'})

-- Remap <C-c> to Escape
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("v", "J", ":m '>+0<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-3<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
-- Paste but don't put the current text into register
vim.keymap.set("n", "<leader>p", "\"_dP", { desc = 'Paste but don\'t copy' })
vim.keymap.set("v", "<leader>p", "\"_dP", { desc = 'Paste but don\'t copy' })
vim.keymap.set("n", "<leader>d", "\"_d", { desc = 'Delete and don\'t yank to register' })
vim.keymap.set("v", "<leader>d", "\"_d", { desc = 'Delete and don\'t yank to register' })


vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Create new tmux silent quietly" })
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, { desc = 'Format file' })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

--t vim.keymap.set("n", "<leader>S", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Open up subsitution for current word" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>M", "<c-w>_<c-w>|", { desc = 'Maximize current window' })
vim.keymap.set("n", "<leader>m", "<c-w>=", { desc = 'Change all windows to same size'})
