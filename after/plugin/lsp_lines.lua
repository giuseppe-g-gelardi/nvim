require("lsp_lines").setup()


-- toggle diagnostics. off shows icon in number column and hides and lines
vim.keymap.set("", "<Leader>n", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" }) -- was <leader>l (for reference)
