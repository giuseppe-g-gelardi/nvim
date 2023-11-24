vim.g.mapleader = ' ';                                                                                     -- set leader key to space
vim.g.maplocalleader = ' ';                                                                                -- set local leader key to space
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)                                                              -- show directory tree
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })                                                     -- escape insert mode
-- vim.keymap.set('t', 'jk', [[<C-\><C-n>]])                                                                  -- escape terminal mode
vim.keymap.set('n', '<leader>w', '<cmd>set wrap!<cr>')                                                     -- toggle line wrapping
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")                                                               -- when highlighted, move selected lines down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")                                                               -- when highlighted, move selected lines up
vim.keymap.set("n", "<C-d>", "<C-d>zz")                                                                    -- keeps cursor center when half page scrolling down
vim.keymap.set("n", "<C-u>", "<C-u>zz")                                                                    -- keeps cursor center when half page scrolling up
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)                                                       -- format document
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" }) -- open message
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })            -- open list
vim.keymap.set('n', '<leader>A', 'ggVG')                                                                   -- select all
vim.keymap.set('n', '<leader>]', function() vim.cmd('bn') end, { desc = "Next buffer" })                   -- next buffer
vim.keymap.set('n', '<leader>[', function() vim.cmd('bp') end, { desc = "Previous buffer" })               -- previous buffer
vim.keymap.set("n", "<leader>gs", "<cmd>lua Lazygit_toggle()<CR>", { silent = true })
