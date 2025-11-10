return {
  'onsails/lspkind-nvim', -- vscode style ui icons in hints
  config = function()
    local icons = require('ggelardi.icons')
    require('lspkind').init({
      -- enables text annotations
      --
      -- default: true
      mode = 'symbol',
      -- default symbol map
      -- can be either 'default' (requires nerd-fonts font) or
      -- 'codicons' for codicon preset (requires vscode-codicons font)
      --
      -- default: 'default'
      preset = 'codicons',
      -- override preset symbols
      --
      -- default: {}
      symbol_map = icons.kinds
    })
  end,
}

