-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {

  highlight = { enable = true },                      -- Highlighting for treesitter
  indent = { enable = true, disable = { 'python' } }, -- Indentation for treesitter
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = {
    -- 'c',
    -- 'cpp',
    'go',
    'lua',
    'python',
    -- 'rust',
    'tsx',
    'typescript',
    'help',
    'vim',
    "markdown",
    "markdown_inline",
    "json",
    "css",
    "html",
  },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = false,
  autotag = {
    enable = true,
    filetypes = {
      'html', 'javascript', 'typescript',
      'javascriptreact', 'typescriptreact',
      'tsx', 'jsx', 'markdown', 'lua',
      'python', 'rust', 'go'
    }
  },
}
