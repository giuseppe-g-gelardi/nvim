return {
  {
    'github/copilot.vim',        -- Separate configuration for Copilot
    config = function()
      vim.cmd('Copilot disable') -- Disable Copilot on startup without affecting cmp
    end,
  },
  {
    'saghen/blink.cmp',
    -- build = 'cargo +nightly build --release',
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
        kind_icons = { -- VSCode Icons
          Text = ' ',
          Method = ' ',
          Function = ' ',
          Constructor = ' ',
          Field = ' ',
          Variable = ' ',
          Class = ' ',
          Interface = ' ',
          Module = ' ',
          Property = ' ',
          Unit = ' ',
          Value = ' ',
          Enum = ' ',
          Keyword = ' ',
          Snippet = ' ',
          Color = ' ',
          File = ' ',
          Reference = ' ',
          Folder = ' ',
          EnumMember = ' ',
          Constant = ' ',
          Struct = ' ',
          Event = ' ',
          Operator = ' ',
          TypeParameter = ' ',
        },
      },

      completion = {
        trigger = {
          show_on_keyword = true
        },
        menu = {
          -- menu = { auto_show = function(ctx) return ctx.mode ~= 'cmdline' end },
          draw = {
            columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx) return ctx.kind_icon .. ctx.icon_gap end,
              },
              label = {
                width = {
                  fill = true,
                },
                text = function(ctx) return ctx.label .. ctx.label_detail end,
              },
              label_description = {
                text = function(ctx) return ctx.label_description end,
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
