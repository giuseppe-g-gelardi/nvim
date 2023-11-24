local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({})

lspconfig.setup {
  ensure_installed = {
    "lua",
    "bash",
    "typescript",
    "rust",
    "go",
    "html",
    "javascript",
    "json",
    "yaml",
    "vim",
  },
  automatic_installation = true,
}
