require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "javascript",
    "typescript",
    "go",
    "rust",
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
  rainbow = {
    enable = true,
    -- list of languages you want to disable the plugin for
    -- disable = { 'jsx', 'cpp' },
    disable = {},
    -- Which query to use for finding delimiters
    query = 'rainbow-parens',
    -- Highlight the entire buffer all at once
    strategy = require('ts-rainbow').strategy.global,
  }
}





-- -- [[ Configure Treesitter ]]
-- -- See `:help nvim-treesitter`
-- require('nvim-treesitter.configs').setup {
--
--   highlight = { enable = true },                      -- Highlighting for treesitter
--   indent = { enable = true, disable = { 'python' } }, -- Indentation for treesitter
--   -- Add languages to be installed here that you want installed for treesitter
--   ensure_installed = {
--     'go',
--     'rust',
--     'lua',
--     'tsx',
--     'typescript',
--     'vim',
--     "markdown",
--     "markdown_inline",
--     "json",
--     "yaml",
--   },
--
--   -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
--   auto_install = true, -- consider changing this to true, just in case -- default was false
--   autotag = {
--     enable = true,
--     filetypes = {
--       'html', 'javascript', 'typescript',
--       'javascriptreact', 'typescriptreact',
--       'tsx', 'jsx', 'markdown', 'lua',
--       'python', 'go', 'yaml'
--     }
--   },
-- }
