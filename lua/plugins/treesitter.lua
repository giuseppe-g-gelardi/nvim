return {
  'nvim-treesitter/nvim-treesitter', -- Highlight, edit, and navigate code
  build = ":TSUpdate",
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    local configs = require('nvim-treesitter.configs')
    configs.setup {
      -- A list of parser names, or "all" (the five listed parsers should always be installed)
      ensure_installed = { -- c, vim, vimdoc, query, javascript
        "lua",
        "typescript",
        "go",
        "rust",
        "zig",
        "markdown_inline"
      },
      sync_install = false,
      auto_install = true,
      modules = {},
      ignore_install = {},
      highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
    }
  end,
}
