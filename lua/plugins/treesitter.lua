return {
  'nvim-treesitter/nvim-treesitter', -- Highlight, edit, and navigate code
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-context',
  },
  config = function()
    local ts = require('nvim-treesitter')
    local context = require('treesitter-context')

    -- Parsers to install (Neovim bundles c, lua, vim, vimdoc, query, markdown)
    ts.install {
      'lua',
      'typescript',
      'tsx',
      'javascript',
      'go',
      'rust',
      'zig',
      'json',
      'yaml',
      'markdown',
      'markdown_inline',
    }

    -- Enable treesitter highlighting for every buffer that has a parser
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('ggelardi.treesitter', { clear = true }),
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })

    context.setup {
      enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 1,            -- How many lines the window should span. Values <= 0 mean no limit.
      min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      line_numbers = true,
      multiline_threshold = 20, -- Maximum number of lines to show for a single context
      trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
      -- Separator between context and content. Should be a single character string, like '-'.
      -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      separator = nil,
      zindex = 20,     -- The Z-index of the context window
      on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    }
  end,
}
