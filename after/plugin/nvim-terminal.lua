-- following option will hide the buffer when it is closed instead of deleting
-- the buffer. This is important to reuse the last terminal buffer
-- IF the option is not set, plugin will open a new terminal every single time
vim.o.hidden = true

require('nvim-terminal').setup({
  window = {
    -- Do `:h :botright` for more information
    position = 'botright',                     -- NOTE: width or height may not be applied in some "pos"
    split = 'sp',                              -- Do `:h split` for more information
    width = 50,                                -- Width of the terminal
    height = 10,                               -- Height of the terminal
  },
  disable_default_keymaps = false,             -- keymap to disable all the default keymaps
  toggle_keymap = '<leader>;',                 -- keymap to toggle open and close terminal window
  window_height_change_amount = 2,             -- increase the window height by when you hit the keymap
  window_width_change_amount = 2,              -- increase the window width by when you hit the keymap
  increase_width_keymap = '<leader><leader>+', -- keymap to increase the window width
  decrease_width_keymap = '<leader><leader>-', -- keymap to decrease the window width
  increase_height_keymap = '<leader>+',        -- keymap to increase the window height
  decrease_height_keymap = '<leader>-',        -- keymap to decrease the window height
  terminals = {                                -- keymaps to open nth terminal
    { keymap = '<leader>1' },
    { keymap = '<leader>2' },
    { keymap = '<leader>3' },
    { keymap = '<leader>4' },
    { keymap = '<leader>5' },
  },
})


-- *** stuff to explore
-- ! # PROMODE
-- default terminal

-- terminal = require('nvim-terminal').DefaultTerminal;
-- local silent = { silent = true }

-- vim.api.nvim_set_keymap('n', '<leader>t', ':lua terminal:toggle()<cr>', silent)
-- vim.api.nvim_set_keymap('n', '<leader>1', ':lua terminal:open(1)<cr>', silent)
-- vim.api.nvim_set_keymap('n', '<leader>2', ':lua terminal:open(2)<cr>', silent)
-- vim.api.nvim_set_keymap('n', '<leader>3', ':lua terminal:open(3)<cr>', silent)

-- ! customized window
-- local Terminal = require('nvim-terminal.terminal')
-- local Window = require('nvim-terminal.window')

-- local window = Window:new({
-- 	position = 'botright',
-- 	split = 'sp',
-- 	width = 50,
-- 	height = 15
-- })

-- terminal = Terminal:new(window)
