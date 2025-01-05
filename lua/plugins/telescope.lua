return {
  'nvim-telescope/telescope.nvim', -- Fuzzy Finder (files, lsp, etc)
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- 'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    local themes = require('telescope.themes')

    telescope.setup {
      defaults = {
        layout_config = {
          vertical = { width = 0.95 }
        },
        file_ignore_patterns = {
          "node_modules"
        },
      },
      extensions = {},
      -- maybe i should uncomment this?
      -- Enable telescope fzf native, if installed
      pcall(telescope.load_extension, 'fzf'),

      -- opens the telescope file browser
      -- vim.keymap.set('n', '<leader>pb', telescope.extensions.file_browser.file_browser,
      --   { desc = '[F]ile [B]rowser' }),

      -- See `:help telescope.builtin`
      vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' }),
      vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' }),
      vim.keymap.set('n', '<leader>ls', function() -- local
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(themes.get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[L]ocal [S]earch' }),

      vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[S]earch [F]iles' }),
      -- vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Git Files' }),
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' }),
      -- vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' }),
      vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = '[S]earch by [G]rep' }),
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' }),
      -- vim.keymap.set('n', '<leader>sg',
      --   function() builtin.grep_string({ search = vim.fn.input('Grep For > ') }) end,
      --   { desc = '[S]earch [F]iles' }) -- global search
    }
  end
}






-- mappings = {
-- ["i"] = {
--   ["<A-c>"] = fb_actions.create,
--   ["<S-CR>"] = fb_actions.create_from_prompt,
--   ["<A-r>"] = fb_actions.rename,
--   ["<A-m>"] = fb_actions.move,
--   ["<A-y>"] = fb_actions.copy,
--   ["<A-d>"] = fb_actions.remove,
--   ["<C-o>"] = fb_actions.open,
--   ["<C-g>"] = fb_actions.goto_parent_dir,
--   ["<C-e>"] = fb_actions.goto_home_dir,
--   ["<C-w>"] = fb_actions.goto_cwd,
--   ["<C-t>"] = fb_actions.change_cwd,
--   ["<C-f>"] = fb_actions.toggle_browser,
--   ["<C-h>"] = fb_actions.toggle_hidden,
--   ["<C-s>"] = fb_actions.toggle_all,
--   ["<bs>"] = fb_actions.backspace,
-- },
-- ["n"] = {
--   ["c"] = fb_actions.create,
--   ["r"] = fb_actions.rename,
--   ["m"] = fb_actions.move,
--   ["y"] = fb_actions.copy,
--   ["d"] = fb_actions.remove,
--   ["o"] = fb_actions.open,
--   ["g"] = fb_actions.goto_parent_dir,
--   ["e"] = fb_actions.goto_home_dir,
--   ["w"] = fb_actions.goto_cwd,
--   ["t"] = fb_actions.change_cwd,
--   ["f"] = fb_actions.toggle_browser,
--   ["h"] = fb_actions.toggle_hidden,
--   ["s"] = fb_actions.toggle_all,
-- },
-- }
