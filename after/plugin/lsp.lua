require("neodev").setup({})


local lsp = require("lsp-zero")
local cmp = require 'cmp'

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
  'gopls',
  'tailwindcss'
})

lsp.configure('lua-language-server', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

local cmp_mappings = lsp.defaults.cmp_mappings({})

cmp_mappings['<Tab>'] = cmp.mapping(function(fallback)
  local copilot_keys = vim.fn['copilot#Accept']()
  if cmp.visible() then
    cmp.select_next_item()
  elseif copilot_keys ~= '' and type(copilot_keys) == 'string' then
    vim.api.nvim_feedkeys(copilot_keys, 'i', true)
  else
    fallback()
  end
end, {
  'i',
  's',
})
cmp_mappings['<S-Tab>'] = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  else
    fallback()
  end
end, { 'i', 's' })
cmp_mappings['<C-Space>'] = cmp.mapping.complete {}
cmp_mappings['<CR>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true }
cmp_mappings['<C-d>'] = cmp.mapping.scroll_docs(-4)
cmp_mappings['<C-u>'] = cmp.mapping.scroll_docs(4)

lsp.setup_nvim_cmp({ mapping = cmp_mappings })
lsp.set_preferences({
  suggest_lsp_servers = true,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})
