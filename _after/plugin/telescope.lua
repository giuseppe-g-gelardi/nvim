-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`


local telescope = require('telescope')
local builtin = require('telescope.builtin')
local themes = require('telescope.themes')
-- local fb_actions = require "telescope._extensions.file_browser.actions"

telescope.setup {
  defaults = {
    layout_config = {
      vertical = { width = 0.95 }
    },
    file_ignore_patterns = {
      "node_modules"
    }
  },
  extensions = {
    file_browser = {
      --   theme = "dropdown",   -- dropdown, ivy
      path = vim.loop.cwd(),
      cwd = vim.loop.cwd(),
      cwd_to_path = false,
      grouped = false,
      files = true,
      add_dirs = true,
      depth = 1,
      auto_depth = false,
      select_buffer = false,
      hidden = { file_browser = false, folder_browser = false },
      respect_gitignore = vim.fn.executable "fd" == 1,
      no_ignore = false,
      follow_symlinks = false,
      browse_files = require("telescope._extensions.file_browser.finders").browse_files,
      browse_folders = require("telescope._extensions.file_browser.finders").browse_folders,
      hide_parent_dir = false,
      collapse_dirs = false,
      prompt_path = false,
      quiet = false,
      dir_icon = "",
      dir_icon_hl = "Default",
      display_stat = { date = true, size = true, mode = true },
      hijack_netrw = false,
      use_fd = true,
      git_status = true,
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
      -- },
    },
  }
}

-- maybe i should uncomment this?
-- Enable telescope fzf native, if installed
pcall(telescope.load_extension, 'fzf')

-- opens the telescope file browser
vim.keymap.set('n', '<leader>pb', telescope.extensions.file_browser.file_browser,
  { desc = '[F]ile [B]rowser' })

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>ls', function() -- local
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(themes.get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[L]ocal [S]earch' })

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Git Files' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sg',
  function() builtin.grep_string({ search = vim.fn.input('Grep For > ') }) end,
  { desc = '[S]earch [F]iles' }) -- global search
