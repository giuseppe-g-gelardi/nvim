return {
  'nvimtools/none-ls.nvim',
  dependencies = { -- Automatically install LSPs to stdpath for neovim
    'nvim-lua/plenary.nvim',
    'nvimtools/none-ls-extras.nvim'
  },
  config = function()
    local status, null_ls = pcall(require, "null-ls")
    if (not status) then return end

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local lsp_formatting = function(bufnr)
      vim.lsp.buf.format({
        filter = function(client)
          return client.name == "null-ls"
        end,
        bufnr = bufnr,
      })
    end

    --[[
    -- ! Important!
    -- Make sure eslint_d and prettierd are installed globally
    --]]

    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.stylua,
        require("none-ls.diagnostics.eslint"),
        require("none-ls.diagnostics.ruff"),
        null_ls.builtins.diagnostics.mypy,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              lsp_formatting(bufnr)
            end,
          })
        end
      end
    }

    vim.api.nvim_create_user_command(
      'DisableLspFormatting',
      function()
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
      end,
      { nargs = 0 }
    )
  end,
}
