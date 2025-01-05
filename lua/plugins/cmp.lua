return {

  {
    'github/copilot.vim',        -- Separate configuration for Copilot
    config = function()
      vim.cmd('Copilot disable') -- Disable Copilot on startup without affecting cmp
    end,
  },
  {
    'saghen/blink.cmp',
    version = 'v0.*',

    opts = {
      keymap = {
        preset = 'enter',
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
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
        -- menu = { auto_show = function(ctx) return ctx.mode ~= 'cmdline' end },
        menu = {
          draw = {
            columns = {
              { 'kind_icon',  'kind', gap = 1 }, -- Icon and kind (e.g., function)
              { 'label',      gap = 1 },         -- Label and description
              { 'source_name' }                  -- Add the source of the completion
            },
            components = {
              kind_icon = {
                text = function(ctx) return ctx.kind_icon .. " " end,
                highlight = function(ctx) return 'BlinkCmpKind' .. ctx.kind end,
              },
              kind = {
                text = function(ctx) return ctx.kind end,
                highlight = function(ctx) return 'BlinkCmpKind' .. ctx.kind end,
              },
              label = {
                width = { fill = true, max = 20 },
                text = function(ctx) return ctx.label end,
                highlight = function(ctx)
                  local highlights = {
                    { 0, #ctx.label, group = 'BlinkCmpLabel' },
                  }
                  return highlights
                end,
              },
              source_name = {
                text = function(ctx) return ctx.source_name or "" end, -- Display the source name
                highlight = 'BlinkCmpSource',
              },
            },
          },
        }
      },
      signature = { enabled = false },
      sources = {
        default = { 'lsp', 'path', 'buffer' },
        cmdline = {}
      },
    },
  },
}
