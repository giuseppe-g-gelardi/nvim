--
-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { "catppuccin/nvim",         name = "catppuccin", priority = 1000 }, -- catppuccin theme
  -- 'kaicataldo/material.vim',                                           -- material theme
  'HiPhish/nvim-ts-rainbow2',                                          -- rainbow parentheses
  'lukas-reineke/indent-blankline.nvim',                               -- indent lines
  'numToStr/Comment.nvim',                                             -- easier way to comment code
  'nvim-tree/nvim-web-devicons',                                       -- file icons
  'github/copilot.vim',                                                -- github copilot
  'onsails/lspkind-nvim',                                              -- vscode style ui icons in hints
  'glepnir/lspsaga.nvim',                                              -- ui for nvim built in lsp
  'ThePrimeagen/harpoon',                                              -- harpoon so lit
  'nvim-lua/plenary.nvim',                                             -- needed for other things, they say its "All the lua functions I don't want to write twice."
  'hrsh7th/cmp-buffer',                                                -- nvim-cmp source for buffer words
  'hrsh7th/nvim-cmp',                                                  -- code completion
  'hrsh7th/cmp-nvim-lsp',                                              -- lsp for nvim-cmp
  'hrsh7th/cmp-cmdline',                                               -- nvim-cmp source for command line words
  'hrsh7th/cmp-path',                                                  -- nvim-cmp source for file path words
  'nvim-lualine/lualine.nvim',                                         -- Set lualine as statusline
  'folke/neodev.nvim',                                                 -- Additional lua configuration, makes nvim stuff amazing!
  'nvim-telescope/telescope.nvim',                                     -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope-file-browser.nvim',                        -- file browser w/ telescope UI and fuzzy finder
  'nvimtools/none-ls.nvim',                                            -- community maintained null-ls replacement
  'j-hui/fidget.nvim',                                                 -- Useful status updates for LSP
  'folke/which-key.nvim',                                              -- Useful plugin to show you pending keybinds.
  'windwp/nvim-ts-autotag',                                            -- autotag for html/tsx
  'lewis6991/gitsigns.nvim',                                           -- Adds git releated signs to the gutter, as well as utilities for managing changes
  'L3MON4D3/LuaSnip',                                                  -- snippets that crash sometimes
  'saadparwaiz1/cmp_luasnip',                                          -- snippets for nvim-cmp
  { 'akinsho/toggleterm.nvim', version = "*",       config = true },   --- terminal
  {
    -- early retirement -- closes open buffers after a period of inactivity
    "chrisgrieser/nvim-early-retirement",
    config = true,
    event = "VeryLazy",
  },
  {
    'neovim/nvim-lspconfig', -- LSP Configuration & Plugins
    dependencies = {         -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim',
    },
  },
  {
    "windwp/nvim-autopairs", -- auto pairs brackets, ect
    config = function()
      require("nvim-autopairs").setup {}
    end
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim', -- FUZZZZZY FINDERRRRRR
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter', -- Highlight, edit, and navigate code
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects', },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {},
  },
}, {})
