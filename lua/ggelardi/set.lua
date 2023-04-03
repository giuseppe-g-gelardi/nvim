vim.opt.tabstop = 2                    -- default 2 spaces for tab, 4 for python, 4 for go, set in ftplugin
vim.opt.softtabstop = 2                -- default 2 spaces for tab, 4 for python, 4 for go, set in ftplugin
vim.opt.shiftwidth = 2                 -- default 2 spaces for tab, 4 for python, 4 for go, set in ftplugin
vim.opt.expandtab = true               -- default 2 spaces for tab, 4 for python, 4 for go, set in ftplugin
vim.opt.isfname:append("@-@")          -- allow @ in filenames, i think
vim.opt.guicursor = ""                 -- fat cursor
vim.opt.scrolloff = 8                  -- keep 8 lines above and below cursor
vim.opt.smartindent = true             -- auto indent new lines after { } etc
vim.opt.colorcolumn = "80"             -- set color column
vim.opt.relativenumber = true          -- show relative line numbers
vim.opt.wrap = false                   -- i think this is text wrap
vim.wo.signcolumn = 'yes'              -- Keep signcolumn on by default
vim.wo.number = true                   -- Make line numbers default
vim.o.hlsearch = false                 -- Set highlight on search
vim.o.mouse = 'a'                      -- Enable mouse mode
vim.o.clipboard = 'unnamedplus'        -- Sync clipboard between OS and Neovim.
vim.o.breakindent = true               -- Enable break indent
vim.o.undofile = true                  -- Save undo history
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.o.updatetime = 250                 -- Decrease update time
vim.o.timeout = true                   -- Decrease update time
vim.o.timeoutlen = 300                 -- Decrease update time
vim.o.ignorecase = true                -- Case insensitive searching UNLESS /C or capital in search
vim.o.smartcase = true                 -- Smart case for searching (ignore case if all lowercase, otherwise respect case)

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_tallback = ""

vim.diagnostic.config({ virtual_text = false, underline = true }) -- disable virtual text and enable undercurl for diagnostics

vim.diagnostic.open_float({ scope = 'line' })

vim.api.nvim_create_autocmd('ColorScheme', {
  command = [[highlight DiagnosticUnderlineError gui=undercurl]],
  desc = "undercurl errors"
})

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])




local ns = vim.api.nvim_create_namespace "test_namespace"
vim.diagnostic.set(ns, 0, {
  {
    lnum = 0,
    col = 10,
    end_col = 40,
    severity = vim.diagnostic.severity.ERROR,
    message = "error",
  }, {
  lnum = 0,
  col = 15,
  end_col = 30,
  severity = vim.diagnostic.severity.WARN,
  message = "warning",
},
})

vim.cmd [[
hi DiagnosticUnderlineError guisp='Red' gui=undercurl
hi DiagnosticUnderlineWarn guisp='Cyan' gui=underline
set termguicolors
]]
