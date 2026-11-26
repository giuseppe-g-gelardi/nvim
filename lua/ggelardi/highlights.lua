vim.opt.termguicolors = true -- enable 24-bit rgb colorscheme
vim.opt.winblend = 0         -- no transparency in floating windows
vim.opt.wildoptions = 'pum'  -- show popup menu for completion
vim.opt.pumblend = 0         -- no transparency in popup menu
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
