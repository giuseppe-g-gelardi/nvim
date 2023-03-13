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
  'tpope/vim-fugitive', -- Git related plugins
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',   -- Detect tabstop and shiftwidth automatically
  'nvim-tree/nvim-web-devicons',
  'xiyaowong/nvim-transparent',                                                                               -- makes bg transparent
  'github/copilot.vim',                                                                                       -- github copilot
  'onsails/lspkind-nvim',                                                                                     -- vscode style ui icons in hints
  'dinhhuy258/git.nvim',
  'glepnir/lspsaga.nvim',
  'ThePrimeagen/harpoon', -- harpoon so lit
  'nvim-lua/plenary.nvim',
  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',  opts = {} },
  'lewis6991/gitsigns.nvim', -- Adds git releated signs to the gutter, as well as utilities for managing changes
  -- autotag for html/jsx
  { 'windwp/nvim-ts-autotag' },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  },                     -- auto pairs
  { 'mbbill/undotree' }, -- undo tree

  --[[
  Material Theme
    { -- Theme inspired by Atom
      marko-cerovac/material.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'material'
    end,
  },
--]]

  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },

  { 'nvim-lualine/lualine.nvim' }, -- Set lualine as statusline

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',         opts = {} },
  -- terminal!
  { 'akinsho/nvim-toggleterm.lua',   opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
  { 'akinsho/bufferline.nvim',    tag = "v3.*",                      requires = 'nvim-tree/nvim-web-devicons' },  -- bufferline/tabs
  { 'sindrets/diffview.nvim',     requires = 'nvim-lua/plenary.nvim' },
  {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly'                  -- optional, updated every week. (see issue #1193)i},
  }
}, {})
