return {
  'numToStr/Comment.nvim',
  opts = {},
  config = function()
    local U = require('Comment.utils')
    -- [[
    -- this sets comments to be toggled with `Control + /` similar to vscode
    -- ]]
    require("Comment").setup(
      {
        padding = true,
        sticky = true,
        ignore = nil,
        toggler = {
          line = '<C-_>',
          block = '<C-\\>'
        },
        opleader = {
          line = '<C-_>',
          block = '<C-\\>'
        },
        extra = {
          above = nil,
          below = nil,
          eol = nil
        },
        mappings = {
          basic = true,
          extra = true,
          extended = false,
        },
        pre_hook = nil,
        post_hook = function(ctx)
          -- Check whether we were in VISUAL mode
          if ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            vim.cmd('norm! gv')
          end
        end,
      }
    )
  end,
  lazy = false,
}
