return {
  {
    'github/copilot.vim',        -- Separate configuration for Copilot
    config = function()
      vim.cmd('Copilot disable') -- Disable Copilot on startup without affecting cmp
    end,
  },
  {
    'saghen/blink.cmp',
    version = 'v1.*',

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
        kind_icons = require('ggelardi.icons').kinds
      },
      completion = {
        trigger = {
          show_on_keyword = true
        },
        menu = {
          draw = {
            columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx) return ctx.kind_icon .. ctx.icon_gap end,
                highlight = function(ctx)
                  local hl = ctx.kind_hl
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, dev_hl = require("onsails/lspkind-nvim").get_icon(ctx.label)
                    if dev_icon then
                      hl = dev_hl
                    end
                  end
                  return hl
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
      sources = {
        providers = {
          buffer = { enabled = false }
        },
        default = { 'lsp', 'path' },
      },
    },
  },
}

