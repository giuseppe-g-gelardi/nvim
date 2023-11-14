return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'                                  -- Package manager
  use 'HiPhish/nvim-ts-rainbow2'                                -- rainbow parentheses
  use 'theprimeagen/harpoon'                                    -- quick file navigation
  use "numToStr/Comment.nvim"                                   -- ez comments
  use 'github/copilot.vim'                                      -- copilot integration
  use "lukas-reineke/indent-blankline.nvim"                     -- indent lines
  use 'j-hui/fidget.nvim'                                       -- loading UI
  use('kaicataldo/material.vim', { branch = 'main' })           -- material theme
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }) -- treesitter syntax highlighting

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4', -- Fuzzy finder
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use { -- ELL ESS PEEEEEEEE ... SEE EMMM PEEEEEE
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  use { -- lualine, statusline
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use { "folke/neodev.nvim", opts = {} } -- neovim development environment

  use {                                  -- auto pairs for brackets
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use({ -- winbar
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = function()
      require("barbecue").setup()
    end,
  })

  use {
    "chrisgrieser/nvim-early-retirement", -- automatically close open buffers after X minutes
    config = function()
      require("early-retirement").setup({
        retirementAgeMins = 5,
      })
    end,
  }

  use { "akinsho/toggleterm.nvim", tag = '*', config = function() -- terminal, literally just for lazygit
    require("toggleterm").setup()
  end }
end)
