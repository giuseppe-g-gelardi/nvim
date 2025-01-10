vim.opt.termguicolors = true -- enable 24-bit rgb colorscheme
vim.opt.winblend = 10        -- set transparency of floating windows
vim.opt.wildoptions = 'pum'  -- show popup menu for completion
vim.opt.pumblend = 5         -- set transparency of popup menu
vim.opt.background = 'dark'  -- set background to dark

-- Highlight on yank
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('yank_highlight', {})

autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})
