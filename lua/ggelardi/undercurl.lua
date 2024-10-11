vim.api.nvim_create_autocmd('ColorScheme', {
  command = [[
    highlight DiagnosticUnderlineError gui=undercurl cterm=undercurl guisp=#ff3333
    highlight DiagnosticUnderlineWarn gui=undercurl cterm=undercurl guisp=#ffa750
    highlight DiagnosticUnnecessary gui=undercurl cterm=undercurl guisp=#ffa750 "Unncecessary shows up as Warnings sometimes
    highlight DiagnosticUnderlineHint gui=undercurl cterm=undercurl guisp=#81c8bf
    highlight DiagnosticUnderlineInfo gui=undercurl cterm=undercurl guisp=#5ccfe6
  ]],
  desc = "undercurls"
})

vim.cmd([[let &t_Cs = "\e[4:3m"]]) -- Undercurl
vim.cmd([[let &t_Ce = "\e[4:0m"]]) -- Undercurl
