return {
  'glepnir/lspsaga.nvim',              -- ui for nvim built in lsp
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons'      -- optional
  },
  config = function()
    local lspsaga = require 'lspsaga'


    lspsaga.setup({
      code_action_prompt = {
        enable = false,
        sign = false,
      },
      ui = {
        code_action = '..', -- wish i could figure out a way to turn this into undercurl instead of underline
        collapse    = '⊟',
        winblend    = 10,
        border      = 'rounded',
        colors      = {
          normal_bg = '#002b36'
        },
        kind        = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
      }
    })

    local codeaction = require 'lspsaga.codeaction'
    -- code action
    vim.keymap.set("n", "<leader>ca", function() codeaction:code_action() end, { silent = true })
    vim.keymap.set("v", "<leader>ca", function()
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
      codeaction:range_code_action()
    end, { silent = true })
  end,

}
