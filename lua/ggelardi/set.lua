vim.opt.tabstop = 4                                               -- default 2 spaces for tab, 4 for python, 4 for go, set in ftplugin
vim.opt.softtabstop = 4                                           -- default 2 spaces for tab, 4 for python, 4 for go, set in ftplugin
vim.opt.shiftwidth = 4                                            -- default 2 spaces for tab, 4 for python, 4 for go, set in ftplugin
vim.opt.expandtab = true                                          -- default 2 spaces for tab, 4 for python, 4 for go, set in ftplugin
vim.opt.isfname:append("@-@")                                     -- allow @ in filenames, i think
vim.opt.guicursor = ""                                            -- fat cursor
vim.opt.scrolloff = 8                                             -- keep 8 lines above and below cursor
vim.opt.smartindent = true                                        -- auto indent new lines after { } etc
vim.opt.colorcolumn = "80"                                        -- set color column
vim.opt.relativenumber = true                                     -- show relative line numbers
vim.opt.wrap = false                                              -- i think this is text wrap
vim.wo.signcolumn = 'yes'                                         -- Keep signcolumn on by default
vim.wo.number = true                                              -- Make line numbers default
vim.o.hlsearch = false                                            -- Set highlight on search
vim.o.mouse = 'a'                                                 -- Enable mouse mode
vim.o.clipboard = 'unnamedplus'                                   -- Sync clipboard between OS and Neovim.
vim.o.breakindent = true                                          -- Enable break indent
vim.o.undofile = true                                             -- Save undo history
vim.o.completeopt = 'menuone,noselect';                           -- Set completeopt to have a better completion experience
vim.o.updatetime = 250                                            -- Decrease update time
vim.o.timeout = true                                              -- Decrease update time
vim.o.timeoutlen = 300                                            -- Decrease update time
vim.o.ignorecase = true                                           -- Case insensitive searching UNLESS /C or capital in search
vim.o.smartcase = true                                            -- Smart case for searching (ignore case if all lowercase, otherwise respect case)
vim.g.copilot_no_tab_map = true                                   -- this removes tab as the default key to map as its set in CMP
vim.g.copilot_assume_mapped = true                                -- forces the plugin to think it is mapped so it doesnt try to map it
vim.g.copilot_tab_tallback = ""                                   -- removes fall back as its set in cmp
vim.diagnostic.config({ virtual_text = false, underline = true }) -- disable virtual text and enable undercurl for diagnostics
vim.diagnostic.open_float({ scope = 'line' })                     -- open floating menu on line

-- these set the ported VSC community material color theme
-- and adjust the colors for specific elements to match the vscode version
vim.cmd 'colorscheme material'
vim.cmd 'highlight Identifier guifg=#eeffff'
vim.cmd 'highlight keyword guifg=#c792ea'
-- ...because i like it....

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])           -- Undercurl
vim.cmd([[let &t_Ce = "\e[4:0m"]])           -- Undercurl

vim.api.nvim_create_autocmd('ColorScheme', { -- Undercurl for Errors
  command = [[highlight DiagnosticUnderlineError gui=undercurl]],
  desc = "undercurl errors"
})
vim.api.nvim_create_autocmd('ColorScheme', { -- Undercurl for Warnings
  command = [[highlight DiagnosticUnderlineWarn gui=undercurl]],
  desc = "undercurl warnings"
})
-- vim.api.nvim_create_autocmd('ColorScheme', { -- Undercurl for Info
--   command = [[highlight DiagnosticUnderlineInfo gui=undercurl]],
--   desc = "undercurl info"
-- })
-- vim.api.nvim_create_autocmd('ColorScheme', { -- Undercurl for Hints
--   command = [[highlight DiagnosticUnderlineHint gui=undercurl]],
--   desc = "undercurl hints"
-- })
--
local ns = vim.api.nvim_create_namespace "test_namespace"
vim.diagnostic.set(ns, 0, {
  {
    lnum = 0,
    col = 10,
    end_col = 40,
    severity = vim.diagnostic.severity.ERROR,
    message = "error",
  },
  {
    lnum = 0,
    col = 15,
    end_col = 30,
    severity = vim.diagnostic.severity.WARN,
    message = "warning",
  },
  -- {
  --   lnum = 0,
  --   col = 20,
  --   end_col = 25,
  --   severity = vim.diagnostic.severity.INFO,
  --   message = "info",
  -- },
  -- {
  --   lnum = 0,
  --   col = 25,
  --   end_col = 30,
  --   severity = vim.diagnostic.severity.HINT,
  --   message = "hint",
  -- }
}) -- Undercurl

vim.cmd [[
hi DiagnosticUnderlineError guisp='Red' gui=undercurl cterm=undercurl term=undercurl
hi DiagnosticUnderlineWarn guisp='Yellow' gui=underline cterm=undercurl term=undercurl
" hi DiagnosticUnderlineInfo guisp='Green' gui=undercurl cterm=undercurl term=undercurl
" hi DiagnosticUnderlineHint guisp='Cyan' gui=undercurl cterm=undercurl term=undercurl
set termguicolors
]] -- Undercurl settings to make it work with tmux
