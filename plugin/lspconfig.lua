--vim.lsp.set_log_level("debug")

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
  -- buf_set_keymap({ 'n', 'v' }, '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.flow.setup { on_attach = on_attach, capabilities = capabilities }
nvim_lsp.sourcekit.setup { on_attach = on_attach, capabilities = capabilities }
nvim_lsp.tailwindcss.setup { on_attach = on_attach, capabilities = capabilities } -- tailwind for life

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
}

nvim_lsp.zls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "zls" },
  filetypes = { "zig" },
}

-- nvim_lsp.gopls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   cmd = { "gopls" }, -- "serve"
--   filetypes = { "go", "gomod", "gowork", "gotmpl", "golang" },
--   settings = {
--     gopls = {
--       analyses = {
--         unusedparams = true,
--         shadow = true,
--       },
--       staticcheck = true,
--     },
--   },
--   flags = {
--     debounce_text_changes = 150,
--   },
-- }

-- TODO figure out why golang is being fiesty with diagnostics
nvim_lsp.gopls.setup {
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

nvim_lsp.golangci_lint_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = { "golangci-lint-langserver" },
  filetypes = { "go", "gomod", "gowork", "gotmpl", "golang" },
  settings = {
    virtual_text = {
      prefix = "",
      spacing = 0,
    },
    gopls = {
      gofumpt = true,
      staticcheck = true,
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
