require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "node_modules", ".git" },
  },
  find_files = {
    hidden = true,
  },
  extensions = {
    file_browser = {
      theme = 'dropdown'
    }
  }
}

require('telescope').load_extension "file_browser"
pcall(require('telescope').load_extension, 'fzf')

vim.keymap.set('n', '<leader>pf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files, { desc = 'Git Files' })
vim.keymap.set('n', '<leader>ps',
  function() require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ') }) end,
  { desc = '[S]earch [F]iles' })



-- opens the telescope file browser
vim.keymap.set('n', '<leader>pb', require('telescope').extensions.file_browser.file_browser,
  { desc = '[F]ile [B]rowser' })

-- opens telescope diagnostics 
vim.keymap.set('n', '<leader>pd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
