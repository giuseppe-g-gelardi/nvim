require('telescope').setup {
  find_files = {
    hidden = true,
  },
}

pcall(require('telescope').load_extension, 'fzf')

vim.keymap.set('n', '<leader>pf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files, { desc = 'Git Files' })
vim.keymap.set('n', '<leader>ps',
	function() require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ') }) end,
	{ desc = '[S]earch [F]iles' })
