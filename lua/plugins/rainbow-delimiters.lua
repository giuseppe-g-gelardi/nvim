return {
  'HiPhish/rainbow-delimiters.nvim',
  config = function()
    local rainbow_delimiters = require('rainbow-delimiters')

    -- Define custom colors matching VSCode ayu mirage bracket pair colorization
    vim.api.nvim_set_hl(0, 'RainbowDelimiterYellow', { fg = '#FFD700' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterViolet', { fg = '#DA70D6' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterBlue', { fg = '#179fff' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterOrange', { fg = '#ffb454' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterGreen', { fg = '#a0d96c' })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterCyan', { fg = '#5ccfe6' })

    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
      },
      priority = {
        [''] = 110,
        lua = 210,
      },
      highlight = {
        'RainbowDelimiterYellow',
        'RainbowDelimiterViolet',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterCyan',
      },
    }
  end,
}
