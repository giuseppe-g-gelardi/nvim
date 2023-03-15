require("lsp_lines").setup()




-- Diagnostic keymaps
vim.keymap.set("","<Leader>l",require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
