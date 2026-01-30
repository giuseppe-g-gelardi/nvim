return {
  'neovim/nvim-lspconfig', -- LSP Configuration & Plugins
  dependencies = {         -- Automatically install LSPs to stdpath for neovim
    'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim',
  },

  config = function()
    --
    -- Mason setup
    --
    local mason_status, mason = pcall(require, "mason")
    if (not mason_status) then return end
    local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
    if (not mason_lspconfig_status) then return end

    mason.setup({})

    mason_lspconfig.setup {
      ensure_installed = {
        "lua_ls",
        "bashls",
        -- "ts_ls", -- Updated from tsserver
        "rust_analyzer",
        "gopls",
        "yamlls",
        "vtsls",
      },
      automatic_installation = true,
    }

    --
    -- LSP setup using modern vim.lsp.config API
    --
    -- local lspconfig_util = require('lspconfig.util')

    local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
    local enable_format_on_save = function(_, bufnr)
      vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      client.server_capabilities.semanticTokensProvider = nil -- disable semantic tokens -- might fix colors changing on windows

      -- Mappings using modern vim.keymap.set API
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      -- vim.keymap.set({ 'n', 'v' }, '<leader>co', vim.lsp.buf.code_action, opts)
    end

    -- Set up completion using blink.cmp
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = false

    -- Configure LSP servers using vim.lsp.config
    vim.lsp.config('tailwindcss', {
      cmd = { 'tailwindcss-language-server', '--stdio' },
      filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
      root_markers = { 'tailwind.config.js', 'tailwind.config.ts' },
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- vim.lsp.config('ts_ls', {
    --   cmd = { 'typescript-language-server', '--stdio' },
    --   filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript', 'javascriptreact' },
    --   root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json' },
    --   on_attach = on_attach,
    --   capabilities = capabilities,
    -- })

    vim.lsp.config('vtsls', {
      cmd = { 'vtsls', '--stdio' },
      filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript', 'javascriptreact' },
      root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json' },
      on_attach = on_attach,
      capabilities = capabilities,
    })

    vim.lsp.config('gopls', {
      cmd = { 'gopls' },
      filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
      root_markers = { 'go.work', 'go.mod', '.git' },
      single_file_support = true,
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        gopls = {
          gofumpt = true,
          staticcheck = true,
          analyses = {
            unusedparams = true,
          }
        },
      },
    })

    vim.lsp.config('rust_analyzer', {
      cmd = { 'rust-analyzer' },
      filetypes = { 'rust' },
      root_markers = { 'Cargo.toml', 'rust-project.json' },
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        ['rust-analyzer'] = {
          assist = {
            importGranularity = 'module',
            importPrefix = 'by_self',
          },
          cargo = {
            loadOutDirsFromCheck = true
          },
          procMacro = {
            enable = true
          },
        }
      },
    })

    vim.lsp.config('lua_ls', {
      cmd = { 'lua-language-server' },
      filetypes = { 'lua' },
      root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git' },
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        enable_format_on_save(client, bufnr)
      end,
      settings = {
        Lua = {
          completion = {
            callSnippet = 'Replace'
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file('', true),
            checkThirdParty = false
          },
        },
      },
    })

    vim.lsp.config('eslint', {
      cmd = { 'vscode-eslint-language-server', '--stdio' },
      filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx' },
      root_markers = { '.eslintrc.js', '.eslintrc.json', '.eslintrc', 'package.json' },
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- Enable all configured LSP servers
    -- vim.lsp.enable({ 'tailwindcss', 'ts_ls', 'gopls', 'rust_analyzer', 'lua_ls' })
    -- vim.lsp.enable({ 'tailwindcss', 'vtsls', 'gopls', 'rust_analyzer', 'lua_ls' })
    vim.lsp.enable({ 'tailwindcss', 'vtsls', 'gopls', 'rust_analyzer', 'lua_ls', 'json_lsp' })
  end,
}
