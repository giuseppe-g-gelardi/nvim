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
        -- menu = { auto_show = function(ctx) return ctx.mode ~= 'cmdline' end },
        menu = {
          draw = {
            -- gap = 1,
            columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx) return ctx.kind_icon .. ctx.icon_gap end,
                highlight = function(ctx)
                  return (require('blink.cmp.completion.windows.render.tailwind').get_hl(ctx) or
                    'BlinkCmpKind') .. ctx.kind
                end,
              },
              label = {
                width = {
                  fill = true,
                },
                text = function(ctx) return ctx.label .. ctx.label_detail end,
                highlight = function(ctx)
                  -- label and label details
                  local highlights = {
                    { 0, #ctx.label, group = ctx.deprecated and 'BlinkCmpLabelDeprecated' or 'BlinkCmpLabel' },
                  }
                  if ctx.label_detail then
                    table.insert(highlights,
                      { #ctx.label, #ctx.label + #ctx.label_detail, group = 'BlinkCmpLabelDetail' })
                  end

                  -- characters matched on the label by the fuzzy matcher
                  for _, idx in ipairs(ctx.label_matched_indices) do
                    table.insert(highlights, { idx, idx + 1, group = 'BlinkCmpLabelMatch' })
                  end

                  return highlights
                end,
              },
              label_description = {
                -- width = { max = 30 },
                text = function(ctx) return ctx.label_description end,
                highlight = 'BlinkCmpLabelDescription',
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
      -- signature = { enabled = true },
      sources = {
        default = { 'lsp', 'path', 'buffer' },
        cmdline = {}
      },
    },
  },
}





-- Text = "",
-- Method = "",
-- Function = "󰡱",
-- Constructor = "",
-- Field = "󰜢",
-- Variable = "󰀫",
-- Property = "󰜢",
-- Class = "󰠱",
-- Interface = "",
-- Struct = "󰏿",
-- Module = "",
-- Unit = "󰑭",
-- Value = "󰫧", -- 󰎠
-- Enum = "",
-- EnumMember = "",
-- Keyword = "󰌋",
-- Constant = "",
-- Snippet = "",
-- Color = "",
-- File = "",
-- Reference = "󰈇",
-- Folder = "",
-- Event = "",
-- Operator = "󰆕",
-- TypeParameter = ""
