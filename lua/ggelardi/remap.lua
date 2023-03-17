-- [[ Important! ]]

vim.g.mapleader = ' ' -- set leader key to space
vim.g.maplocalleader = ' '  -- set local leader key to space
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex) -- show directory tree
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true }) -- escape insert mode
vim.keymap.set('i', 'kj', '<Esc>', { noremap = true }) -- escape insert mode
vim.keymap.set('t', 'jk', [[<C-\><C-n>]]) -- escape terminal mode
vim.keymap.set('n', '<leader>w', '<cmd>set wrap!<cr>') -- toggle line wrapping

-- [[ Basic Keymaps ]] -- Keymaps for better default experience -- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true }) -- no idea what this does

vim.keymap.set("n", "<leader>nt", vim.cmd.BufferLinePick) -- new tab
vim.keymap.set('n', "JK",
  function()
    vim.cmd('BufferLinePick')
    vim.cmd('tabnew')
  end,
  { desc = 'Edit file in new tab' }) -- open new buffer in bufferline


  -- [[ VERY USEFUL ]]
  vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- when highlighted, move selected lines down
  vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- when highlighted, move selected lines up 1
  vim.keymap.set("n", "<C-d>", "<C-d>zz") -- keeps cursor center when half page scrolling down
  vim.keymap.set("n", "<C-u>", "<C-u>zz") -- keeps cursor center when half page scrolling up 



-- [[ check these out when i have time
-- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- copy to system clipboard
-- vim.keymap.set("n", "<leader>Y", [["+Y]]) -- copy to system clipboard
-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]]) -- cut to system clipboard
--]]

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle) -- toggle undo tree
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format) -- format document
vim.keymap.set("n", "<leader>gs", vim.cmd.Git); -- git status
vim.keymap.set('n', '<leader>j', ':Neotree toggle<CR>', { noremap = true, silent = true }) -- toggle neo-tree


-- diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })






-- -- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true }) -- no idea what these do either
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true }) -- no idea what these do either
