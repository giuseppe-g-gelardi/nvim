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
    local mason_lspconfig, lspconfig = pcall(require, "mason-lspconfig")
    if (not mason_lspconfig) then return end

    local util = require 'lspconfig/util'

    mason.setup({})

    lspconfig.setup {
      single_file_support = true,
      ensure_installed = {
        "lua_ls",
        "bashls",
        "ts_ls",
        "rust_analyzer",
        "gopls",
        "yamlls",
      },
      automatic_installation = true,
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }

    --
    -- LSP setup
    --
    local status, nvim_lsp = pcall(require, "lspconfig")
    if (not status) then return end

    local protocol = require('vim.lsp.protocol')

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
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

      client.server_capabilities.semanticTokensProvider = nil -- disable semantic tokens -- might fix colors changing on windows
      --Enable completion triggered by <c-x><c-o>
      --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
      --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      local opts = { noremap = true, silent = true }

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
      -- buf_set_keymap({ 'n', 'v' }, '<leader>co', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    end

    -- Set up completion using nvim_cmp with LSP source
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    capabilities.textDocument.completion.completionItem.snippetSupport = false

    nvim_lsp.flow.setup { on_attach = on_attach, capabilities = capabilities }
    nvim_lsp.sourcekit.setup { on_attach = on_attach, capabilities = capabilities }
    nvim_lsp.tailwindcss.setup { on_attach = on_attach, capabilities = capabilities } -- tailwind for life

    nvim_lsp.ts_ls.setup {
      on_attach = on_attach,
      filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
      cmd = { "typescript-language-server", "--stdio" },
      root_dir = nvim_lsp.util.root_pattern("package.json"),
      capabilities = capabilities
    }

    nvim_lsp.gopls.setup {
      single_file_support = true,
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = { "gopls" },
      settings = {
        gopls = {
          gofumpt = true,
          staticcheck = true,
          analyses = {
            unusedparams = true,
          }
        },
      },
      flags = {
        debounce_text_changes = 150,
      },
    }

    nvim_lsp.rust_analyzer.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          assist = {
            importGranularity = "module",
            importPrefix = "by_self",
          },
          cargo = {
            loadOutDirsFromCheck = true
          },
          procMacro = {
            enable = true
          },
        }
      },
      filetypes = { "rust" },
    }

    nvim_lsp.lua_ls.setup {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        enable_format_on_save(client, bufnr)
      end,
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace"
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false
          },
        },
      },
    }

    nvim_lsp.eslint.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
      root_dir = util.root_pattern(".eslintrc.js", ".eslintrc.json", ".eslintrc", "package.json"),
    }

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = function(_, bufnr) -- Enable virtual text only for golang
          return vim.api.nvim_buf_get_option(bufnr, 'ft') == 'go'
        end,
        signs = true,
        underline = true,
        update_in_insert = true, -- Update diagnostics insert mode
        severity_sort = true,
      }
    )

    -- Design
    vim.cmd 'sign define LspDiagnosticsSignError text=E'
    vim.cmd 'sign define LspDiagnosticsSignWarning text=W'
    vim.cmd 'sign define LspDiagnosticsSignInformation text=I'
    vim.cmd 'sign define LspDiagnosticsSignHint text=H'


    -- Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    protocol.CompletionItemKind = {
      '', -- Text
      '', -- Method
      '󰡱', -- Function
      '', -- Constructor
      '', -- Field
      '', -- Variable
      '', -- Class
      '', -- Interface
      '󰕳', -- Module
      '', -- Property
      '', -- Unit
      '󰫧', -- Value
      '', -- Enum
      '', -- Keyword
      '', -- Snippet
      '', -- Color
      '', -- File
      '', -- Reference
      '', -- Folder
      '', -- EnumMember
      '', -- Constant
      '', -- Struct
      '', -- Event
      '', -- Operator
      '', -- TypeParameter
    }
  end,
}
