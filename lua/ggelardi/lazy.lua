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
  'nvim-neo-tree/neo-tree.nvim', -- neo tree
  'MunifTanjim/nui.nvim', -- neovim ui i think.... w/ neotree
  'tpope/vim-fugitive', -- Git related plugins
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',   -- Detect tabstop and shiftwidth automatically
  'nvim-tree/nvim-web-devicons', -- file icons
  'xiyaowong/nvim-transparent',                                                                               -- makes bg transparent
  'github/copilot.vim',                                                                                       -- github copilot
  'onsails/lspkind-nvim',                                                                                     -- vscode style ui icons in hints
  'dinhhuy258/git.nvim',
  'glepnir/lspsaga.nvim',
  'ThePrimeagen/harpoon', -- harpoon so lit
  'nvim-lua/plenary.nvim',
  'norcalli/nvim-colorizer.lua',
  'hrsh7th/cmp-buffer',
  'mbbill/undotree', -- undo tree
  'nvim-lualine/lualine.nvim', -- Set lualine as statusline
  'folke/neodev.nvim',-- Additional lua configuration, makes nvim stuff amazing!
  'nvim-telescope/telescope-file-browser.nvim',
  'jose-elias-alvarez/null-ls.nvim', -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  'j-hui/fidget.nvim',-- Useful status updates for LSP
  'folke/which-key.nvim',-- Useful plugin to show you pending keybinds.
  'windwp/nvim-ts-autotag',-- autotag for html/tsx
  'lewis6991/gitsigns.nvim', -- Adds git releated signs to the gutter, as well as utilities for managing changes
  'akinsho/nvim-toggleterm.lua', --terminal!
  'nvim-telescope/telescope.nvim', -- Fuzzy Finder (files, lsp, etc)
  'akinsho/bufferline.nvim',  -- bufferline/tabs
  -- { 'sindrets/diffview.nvim',     requires = 'nvim-lua/plenary.nvim' },
  {
    'neovim/nvim-lspconfig', -- LSP Configuration & Plugins
    dependencies = { -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim',
    },
  },


--testing
{
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  config = function()
    require("lsp_lines").setup()
  end,
},
--testing


  {
    'hrsh7th/nvim-cmp', -- Autocompletion
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  },                     -- auto pairs
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
  { 'numToStr/Comment.nvim',
    requires = { 'JoosepAlviste/nvim-ts-context-commentstring' }
  }, -- "gc" to comment visual regions/lines

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
    'nvim-treesitter/nvim-treesitter', -- Highlight, edit, and navigate code
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects', },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
  {
    'navarasu/onedark.nvim', -- Theme inspired by Atom
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },
},{})






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

-- [[

  -- {
    --   'navarasu/onedark.nvim', -- Theme inspired by Atom
    --   priority = 1000,
    --   config = function()
    --     vim.cmd.colorscheme 'onedark'
    --   end,
    -- },
    --]]
    