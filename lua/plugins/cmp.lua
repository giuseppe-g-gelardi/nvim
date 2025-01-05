return {
  {
    'saghen/blink.cmp',
    dependencies = {
      'github/copilot.vim', -- copilot -- sometimes helpful
    },

    version = 'v0.*',

    opts = {
      keymap = {
        preset = 'enter',
        -- ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },

        -- ['<CR>'] = { 'accept', 'fallback' }, -- <CR> is 'enter'
        ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
        ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
        kind_icons = {
          Text = "",
          Method = "",
          Function = "󰡱",
          Constructor = "",

          Field = "󰜢",
          Variable = "󰀫",
          Property = "󰜢",

          Class = "󰠱",
          Interface = "",
          Struct = "󰏿",
          Module = "",


          Unit = "󰑭",
          Value = "󰫧", -- 󰎠
          Enum = "",
          EnumMember = "",

          Keyword = "󰌋",
          Constant = "",

          Snippet = "",
          Color = "",
          File = "",
          Reference = "󰈇",
          Folder = "",
          Event = "",
          Operator = "󰆕",
          TypeParameter = ""
        }
      },
      completion = {
        menu = { auto_show = function(ctx) return ctx.mode ~= 'cmdline' end },
      },

      signature = { enabled = false },
      sources = {
        default = { 'lsp', 'path', 'buffer' },
      },
    },
  }
}
