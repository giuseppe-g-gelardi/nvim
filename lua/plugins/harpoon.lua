return {
  'ThePrimeagen/harpoon', -- harpoon so lit
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup()

    vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)                  -- add file to harpoon
    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end) -- toggle harpoon menu

    vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end)                     -- h
    vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)                     -- j
    vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end)                     -- k
    vim.keymap.set("n", "<C-h>", function() harpoon:list():select(4) end)                     -- l
  end,
}



-- v1
--   require("harpoon").setup()
--   local mark = require("harpoon.mark")
--   local ui = require("harpoon.ui")
--
--   vim.keymap.set("n", "<leader>a", mark.add_file)             -- add file to harpoon
--   vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)          -- toggle harpoon menu
--
--   vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end) -- h
--   vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end) -- j
--   vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end) -- k
--   vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end) -- l
-- end,
