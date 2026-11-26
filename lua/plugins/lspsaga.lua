return {
  'glepnir/lspsaga.nvim',              -- ui for nvim built in lsp
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons'      -- optional
  },
  config = function()
    local lspsaga = require 'lspsaga'

    lspsaga.setup({
      -- code_action_prompt = {
      --   enable = false,
      --   sign = false,
      -- },
      ui = {
        code_action = '..', -- wish i could figure out a way to turn this into undercurl instead of underline
        collapse    = '⊟',
        -- winblend    = 10,
        -- border      = 'rounded',
        -- colors      = {
        --   normal_bg = '#002b36'
        -- },
        -- for catppuccin theme
        -- kind        = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
      }
    })

    -- code action (code_action() now handles visual mode too;
    -- range_code_action was removed from lspsaga)
    local codeaction = require 'lspsaga.codeaction'
    vim.keymap.set({ "n", "v" }, "<leader>ca", function() codeaction:code_action() end, { silent = true })
  end,

}
