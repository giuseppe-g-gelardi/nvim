return {
  dependencies = {
    'echasnovski/mini.nvim', version = false
  },
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    defer = function(ctx)
      return ctx.mode == "v" or ctx.mode == "V" or ctx.mode == "<C-V>"
    end,
  }
}
