vim.g.mapleader = ' ';                                                                                     -- set leader key to space
vim.g.maplocalleader = ' ';                                                                                -- set local leader key to space
vim.keymap.set('n', '<C-_>', function() require('Comment.api').toggle.linewise.current() end,
  { noremap = true, silent = true })                                                                       -- toggle comment
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)                                                              -- show directory tree
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })                                                     -- escape insert mode
vim.keymap.set('i', 'kj', '<Esc>', { noremap = true })                                                     -- escape insert mode
vim.keymap.set('t', 'jk', [[<C-\><C-n>]])                                                                  -- escape terminal mode
vim.keymap.set('n', '<leader>w', '<cmd>set wrap!<cr>')                                                     -- toggle line wrapping
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })                                        -- disable space key??? (not sure if this is needed)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")                                                               -- when highlighted, move selected lines down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")                                                               -- when highlighted, move selected lines up
vim.keymap.set("n", "<C-d>", "<C-d>zz")                                                                    -- keeps cursor center when half page scrolling down
vim.keymap.set("n", "<C-u>", "<C-u>zz")                                                                    -- keeps cursor center when half page scrolling up
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)                                                   -- toggle undo tree
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)                                                       -- format document
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);                                                            -- git status
vim.keymap.set('n', '<leader>t', ':Neotree toggle<CR>', { noremap = true, silent = true })                 -- toggle neo-tree -- this WAS <leader>j (for reference)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" }) -- open message
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })            -- open list
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })        -- go to previous message
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })            -- go to next message
vim.keymap.set('n', 'dw', 'vb"_d')                                                                         -- delete word backwards
vim.keymap.set('n', '<leader>A', 'ggVG')                                                                   -- select all
vim.keymap.set('n', "JK",                                                                                  -- # add <leader> maybe? well see
  function()
    -- vim.cmd('BufferLinePick')
    vim.cmd('tabnew')
  end,
  { desc = 'Edit file in new tab' }) -- open new buffer in bufferline
