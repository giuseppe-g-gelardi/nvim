return {
  'folke/todo-comments.nvim', -- highlight TODO/FIXME/HACK/NOTE etc. in comments
  dependencies = { 'nvim-lua/plenary.nvim' },
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    local todo = require('todo-comments')
    todo.setup {}

    vim.keymap.set('n', ']t', todo.jump_next, { desc = 'Next todo comment' })
    vim.keymap.set('n', '[t', todo.jump_prev, { desc = 'Previous todo comment' })
    vim.keymap.set('n', '<leader>st', '<cmd>TodoTelescope<CR>', { desc = '[S]earch [T]odos' })
  end,
}
