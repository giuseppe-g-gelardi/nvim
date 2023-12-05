vim.g.mapleader = ' ';                                                                                     -- set leader key to space
vim.g.maplocalleader = ' ';                                                                                -- set local leader key to space
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = "[P]revious [V]iew" })                              -- show directory tree
vim.keymap.set({ 'i', 'v' }, 'jk', '<Esc>', { noremap = true, desc = "Escape" })                           -- escape insert mode
vim.keymap.set('n', '<leader>w', '<cmd>set wrap!<cr>', { desc = "Toggle Line [W]rap" })                    -- toggle line wrapping
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = "Move selected [J] Down" })                          -- when highlighted, move selected lines down
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = "Move selected [K] Up" })                            -- when highlighted, move selected lines up
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = "Scroll half page [D]own" })                              -- keeps cursor center when half page scrolling down
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = "Scroll half page [U]p" })                                -- keeps cursor center when half page scrolling up
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = "[f]ormat document" })                       -- format document
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" }) -- open message
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })            -- open list
vim.keymap.set('n', '<leader>A', 'ggVG', { desc = "Select [A]ll" })                                        -- select all
vim.keymap.set('n', '<leader>]', function() vim.cmd('bn') end, { desc = "Next buffer" })                   -- next buffer
vim.keymap.set('n', '<leader>[', function() vim.cmd('bp') end, { desc = "Previous buffer" })               -- previous buffer
vim.keymap.set('n', '<leader>gs', '<cmd>lua Lazygit_toggle()<CR>', { silent = true, desc = "[g]it [s]tatus" })
