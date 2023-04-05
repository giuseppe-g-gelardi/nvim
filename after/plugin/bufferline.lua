require('bufferline').setup({
  options = {
    mode = "tabs",             -- "tabs" | "buffers"
    separator_style = 'slant', -- "slant" | "thick" | "thin" | { 'any', 'any' },
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    diagnostics = 'nvim_lsp',
    offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        text_align = "center",
        separator = true
      }
    },
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})

-- force bufferline to use the same colors as the current colorscheme
vim.cmd([[
augroup MyColors
  autocmd!
  autocmd ColorScheme * highlight BufferLineFill guibg=#191724
  autocmd ColorScheme * highlight BufferLineSeparator guifg=#191724
  autocmd ColorScheme * highlight BufferLineSeparatorSelected guifg=#191724
augroup END
]])
