local null_ls = require("null-ls")

-- ! IMPORTANT ! --
-- npm i -g eslint_d

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.pylint,
        require("null-ls").builtins.formatting.prettier.with({
          filetypes = {
            "css",
            "html",
            "javascript",
            "json",
            "yaml",
            "typescript",
            "typescriptreact",
            "javascriptreact",
            "markdown",
            "lua",
            "go",
            "rust",
            -- "c",
            -- "cpp",
            "python"
          },
        }),
    },
})
