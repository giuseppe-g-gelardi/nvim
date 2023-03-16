-- [[ Important! ]]

vim.g.mapleader = ' ' -- set leader key to space
vim.g.maplocalleader = ' '  -- set local leader key to space
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex) -- show directory tree
vim.keymap.set('n', '<leader>w', '<cmd>set wrap!<cr>') -- toggle line wrapping
vim.keymap.set('t', 'jk', [[<C-\><C-n>]]) -- escape terminal mode

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


  -- [[ VERY USEFUL ]]
  vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
  -- [[ when highlighted, move selected lines up or down ]]
  vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
  
  vim.keymap.set("n", "<C-d>", "<C-d>zz") 
  -- [[ keeps cursor center when half page scrolling ]]
  vim.keymap.set("n", "<C-u>", "<C-u>zz")
  -- [[ VERY USEFUL ]]


-- [[ check these out when i have time
-- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- copy to system clipboard
-- vim.keymap.set("n", "<leader>Y", [["+Y]]) -- copy to system clipboard
-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]]) -- cut to system clipboard
--]]

-- undo tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle) -- toggle undo tree

-- format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format) -- format document

-- git status
vim.keymap.set("n", "<leader>gs", vim.cmd.Git); -- git status


-- local keymap = vim.api.nvim_set_keymap
vim.keymap.set('n', '<leader>j', ':Neotree toggle<CR>', { noremap = true, silent = true }) -- toggle neo-tree



-- ! other diagnostic keymaps to try
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })



