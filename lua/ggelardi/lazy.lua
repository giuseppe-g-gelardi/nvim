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
  'simrat39/rust-tools.nvim',                   -- testing
  'nvim-neo-tree/neo-tree.nvim',                -- neo tree
  'MunifTanjim/nui.nvim',                       -- UI component library for nvim
  'tpope/vim-fugitive',                         -- Git related plugin
  'tpope/vim-rhubarb',                          -- Git related plugin
  'dinhhuy258/git.nvim',                        -- Git related plugin
  'sindrets/diffview.nvim',                     -- diffview
  'nvim-tree/nvim-web-devicons',                -- file icons
  'xiyaowong/nvim-transparent',                 -- makes window transparent
  'github/copilot.vim',                         -- github copilot
  'onsails/lspkind-nvim',                       -- vscode style ui icons in hints
  'glepnir/lspsaga.nvim',                       -- ui for nvim built in lsp
  'ThePrimeagen/harpoon',                       -- harpoon so lit
  'nvim-lua/plenary.nvim',                      -- needed for other things, they say its "All the lua functions I don't want to write twice."
  'hrsh7th/cmp-buffer',                         -- nvim-cmp source for buffer words
  'hrsh7th/nvim-cmp',                           -- code completion
  'hrsh7th/cmp-nvim-lsp',                       -- lsp for nvim-cmp
  'hrsh7th/cmp-cmdline',                        -- nvim-cmp source for command line words
  'hrsh7th/cmp-path',                           -- nvim-cmp source for file path words
  'mbbill/undotree',                            -- undo tree
  'nvim-lualine/lualine.nvim',                  -- Set lualine as statusline
  'folke/neodev.nvim',                          -- Additional lua configuration, makes nvim stuff amazing!
  'nvim-telescope/telescope.nvim',              -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope-file-browser.nvim', -- file browser w/ telescope UI and fuzzy finder
  'jose-elias-alvarez/null-ls.nvim',            -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  'j-hui/fidget.nvim',                          -- Useful status updates for LSP
  'folke/which-key.nvim',                       -- Useful plugin to show you pending keybinds.
  'windwp/nvim-ts-autotag',                     -- autotag for html/tsx
  'lewis6991/gitsigns.nvim',                    -- Adds git releated signs to the gutter, as well as utilities for managing changes
  'akinsho/bufferline.nvim',                    -- bufferline/tabs
  'L3MON4D3/LuaSnip',                           -- snippets that crash sometimes
  'saadparwaiz1/cmp_luasnip',                   -- snippets for nvim-cmp
  { 'rose-pine/neovim', name = 'rose-pine' },   -- easy on the eyes
  {
    'neovim/nvim-lspconfig',                    -- LSP Configuration & Plugins
    dependencies = {                            -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim',
    },
  },
  {
    -- https://git.sr.ht/~whynothugo/lsp_lines.nvim
    -- "ErichDonGubler/lsp_lines.nvim"
    -- just incase one doesnt work, the other usually does.. depends on the machine
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim", -- diagnostic lines that dont extend off screen
    config = function()
      require("lsp_lines").setup()
    end,
  },
  {
    "windwp/nvim-autopairs", -- auto pairs brackets, ect
    config = function()
      require("nvim-autopairs").setup {}
    end
  },
  {
    'numToStr/Comment.nvim',                    -- easier way to comment code
    requires = { 'JoosepAlviste/nvim-ts-context-commentstring' }
  },                                            -- "gc" to comment visual regions/lines
  {
    'nvim-telescope/telescope-fzf-native.nvim', -- im sure this does something
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
    opts = {
      -- configurations go here
    },
  },
  {
    's1n7ax/nvim-terminal',
    config = function()
      vim.o.hidden = true
      require('nvim-terminal').setup()
    end,
  },
}, {})
