-- [[ Important! ]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.opt.relativenumber = true
vim.keymap.set('n', '<leader>w', '<cmd>set wrap!<cr>')
vim.keymap.set('t', 'jk', [[<C-\><C-n>]])

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true }) -- no idea what this does

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true }) -- no idea what these do either
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true }) -- no idea what these do either

-- new tab
-- open new buffer in bufferline
vim.keymap.set("n", "<leader>nt", vim.cmd.BufferLinePick)
vim.keymap.set('n', "JK",
  function()
    vim.cmd('BufferLinePick')
    vim.cmd('tabnew')
  end,
  { desc = 'Edit file in new tab' })



-- undo tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- git status
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);

-- toggle neo-tree
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap('n', '<leader>j', ':Neotree toggle<CR>', opts)

-- just in case i switch back to nvim-tree
-- vim.keymap.set('n', '<leader>j', ':NvimTreeToggle<CR>', { noremap = true })


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
