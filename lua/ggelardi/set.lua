vim.opt.tabstop = 4                     -- default 4 spaces for tab, 2 for react/html, set in ftplugin
vim.opt.softtabstop = 4                 -- default 4 spaces for tab, 2 for react/html, set in ftplugin
vim.opt.shiftwidth = 4                  -- default 4 spaces for tab, 2 for react/html, set in ftplugin
vim.opt.expandtab = true                -- use spaces instead of tabs -- i think
vim.opt.isfname:append("@-@")           -- allow @ in filenames, i think
vim.opt.guicursor = ""                  -- fat cursor
vim.opt.scrolloff = 8                   -- keep 8 lines above and below cursor
vim.opt.smartindent = true              -- auto indent new lines after { } etc
vim.opt.colorcolumn = "80,120"          -- set color columns at 80 and 120 -- was 80 only
vim.opt.relativenumber = true           -- show relative line numbers
vim.opt.wrap = false                    -- i think this is text wrap
vim.wo.signcolumn = 'yes'               -- Keep signcolumn on by default
vim.wo.number = true                    -- Make line numbers default
vim.o.hlsearch = false                  -- Set highlight on search
vim.o.mouse = 'a'                       -- Enable mouse mode
vim.o.clipboard = 'unnamedplus'         -- Sync clipboard between OS and Neovim.
vim.o.breakindent = true                -- Enable break indent
vim.o.undofile = true                   -- Save undo history
vim.o.completeopt = 'menuone,noselect'; -- Set completeopt to have a better completion experience
vim.o.updatetime = 250                  -- Decrease update time
vim.o.timeout = true                    -- Decrease update time
vim.o.timeoutlen = 300                  -- Decrease update time
vim.o.ignorecase = true                 -- Case insensitive searching UNLESS /C or capital in search
vim.o.smartcase = true                  -- Smart case for searching (ignore case if all lowercase, otherwise respect case)

vim.g.copilot_no_tab_map = true         -- this removes tab as the default key to map as its set in CMP
vim.g.copilot_assume_mapped = true      -- forces the plugin to think it is mapped so it doesnt try to map it
vim.g.copilot_tab_tallback = ""         -- removes fall back as its set in cmp
vim.api.nvim_set_keymap('i', '<C-y>', 'copilot#Accept("<CR>")', { noremap = true, silent = true, expr = true })
