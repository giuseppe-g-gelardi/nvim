vim.opt.termguicolors = true -- *** testing *** -- enable 24-bit rgb colorscheme
vim.opt.winblend = 10 -- *** testing *** -- set transparency of floating windows
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
  augroup END
]]
