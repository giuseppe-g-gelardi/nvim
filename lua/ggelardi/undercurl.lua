-- VSCode-style diagnostic rendering:
--   error/warn/info -> colored squiggles (VSCode dark theme colors)
--   hint            -> subtle dotted underline (VSCode uses dots, not squiggles)
--   unused code     -> faded text like VSCode, instead of a squiggle
--   deprecated      -> strikethrough
local function apply()
  vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { undercurl = true, sp = '#F14C4C' })
  vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { undercurl = true, sp = '#CCA700' })
  vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { undercurl = true, sp = '#3794FF' })
  vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { underdotted = true, sp = '#9aa0a6' })
  vim.api.nvim_set_hl(0, 'DiagnosticUnnecessary', { link = 'Comment' })
  vim.api.nvim_set_hl(0, 'DiagnosticDeprecated', { strikethrough = true })
end

-- Re-apply whenever the colorscheme changes (themes override these groups),
-- and once right now in case the colorscheme loaded before this file.
vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('ggelardi.diagnostics_style', { clear = true }),
  callback = apply,
  desc = 'VSCode-style diagnostic underlines',
})
apply()

-- NOTE: the old `let &t_Cs/&t_Ce` termcode hack was removed: those are
-- Vim-only options that Neovim ignores; Neovim detects undercurl support
-- from terminfo on its own.
