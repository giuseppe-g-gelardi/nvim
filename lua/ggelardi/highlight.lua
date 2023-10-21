vim.opt.termguicolors = true -- enable 24-bit rgb colorscheme
vim.opt.winblend = 10        -- set transparency of floating windows
vim.opt.wildoptions = 'pum'  -- show popup menu for completion
vim.opt.pumblend = 5         -- set transparency of popup menu
vim.opt.background = 'dark'  -- set background to dark

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
  augroup END
]]
