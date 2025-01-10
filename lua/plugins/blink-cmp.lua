return {
  'saghen/blink.cmp',

  opts = function(_, opts)
    opts.keymap = {
      preset = 'enter',
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
      ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
    }
    opts.appearance = {
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
    }
    opts.signature = { enabled = false }
    opts.sources = {
      default = { 'lsp', 'path', 'buffer' },
      cmdline = {}
    }
    opts.completion = {
      --       -- signature = { enabled = true },
      menu = {
        draw = {
          columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
          components = {
            kind_icon = {
              ellipsis = false,
              text = function(ctx) return ctx.kind_icon .. ctx.icon_gap end,
              -- highlight = function(ctx)
              --   return (require('blink.cmp.completion.windows.render.tailwind').get_hl(ctx) or
              --     'BlinkCmpKind') .. ctx.kind
              -- end,
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
            -- source_name = {
            --   text = function(ctx) return ctx.source_name or "" end, -- Display the source name
            --   highlight = 'BlinkCmpSource',
            -- },
          },
        },
      }
    }
  end
}








-- return {
--
--   {
--     'github/copilot.vim',        -- Separate configuration for Copilot
--     config = function()
--       vim.cmd('Copilot disable') -- Disable Copilot on startup without affecting cmp
--     end,
--   },
--   {
--     'saghen/blink.cmp',
--     version = 'v0.*',
--
--     opts = {
--       keymap = {
--         preset = 'enter',
--         ['<Tab>'] = { 'select_next', 'fallback' },
--         ['<S-Tab>'] = { 'select_prev', 'fallback' },
--         ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
--         ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
--       },
--       appearance = {
--         use_nvim_cmp_as_default = true,
--         nerd_font_variant = 'mono',
--         kind_icons = { -- VSCode Icons
--           Text = ' ',
--           Method = ' ',
--           Function = ' ',
--           Constructor = ' ',
--           Field = ' ',
--           Variable = ' ',
--           Class = ' ',
--           Interface = ' ',
--           Module = ' ',
--           Property = ' ',
--           Unit = ' ',
--           Value = ' ',
--           Enum = ' ',
--           Keyword = ' ',
--           Snippet = ' ',
--           Color = ' ',
--           File = ' ',
--           Reference = ' ',
--           Folder = ' ',
--           EnumMember = ' ',
--           Constant = ' ',
--           Struct = ' ',
--           Event = ' ',
--           Operator = ' ',
--           TypeParameter = ' ',
--         },
--       },
--
--       completion = {
--         trigger = {
--           show_on_keyword = true
--         },
--         -- menu = { auto_show = function(ctx) return ctx.mode ~= 'cmdline' end },
--         menu = {
--           draw = {
--             columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
--             components = {
--               kind_icon = {
--                 ellipsis = false,
--                 text = function(ctx) return ctx.kind_icon .. ctx.icon_gap end,
--                 -- highlight = function(ctx)
--                 --   return (require('blink.cmp.completion.windows.render.tailwind').get_hl(ctx) or
--                 --     'BlinkCmpKind') .. ctx.kind
--                 -- end,
--               },
--               label = {
--                 width = {
--                   fill = true,
--                 },
--                 text = function(ctx) return ctx.label .. ctx.label_detail end,
--                 highlight = function(ctx)
--                   -- label and label details
--                   local highlights = {
--                     { 0, #ctx.label, group = ctx.deprecated and 'BlinkCmpLabelDeprecated' or 'BlinkCmpLabel' },
--                   }
--                   if ctx.label_detail then
--                     table.insert(highlights,
--                       { #ctx.label, #ctx.label + #ctx.label_detail, group = 'BlinkCmpLabelDetail' })
--                   end
--
--                   -- characters matched on the label by the fuzzy matcher
--                   for _, idx in ipairs(ctx.label_matched_indices) do
--                     table.insert(highlights, { idx, idx + 1, group = 'BlinkCmpLabelMatch' })
--                   end
--
--                   return highlights
--                 end,
--               },
--               label_description = {
--                 -- width = { max = 30 },
--                 text = function(ctx) return ctx.label_description end,
--                 highlight = 'BlinkCmpLabelDescription',
--               },
--               -- source_name = {
--               --   text = function(ctx) return ctx.source_name or "" end, -- Display the source name
--               --   highlight = 'BlinkCmpSource',
--               -- },
--             },
--           },
--         }
--       },
--       signature = { enabled = false },
--       -- signature = { enabled = true },
--       sources = {
--         default = { 'lsp', 'path', 'buffer' },
--         cmdline = {}
--       },
--     },
--   },
-- }
--
--
--
--
--
--
--
--
-- -- return {
-- --   "saghen/blink.cmp",
-- --   enabled = true,
-- --   version = "v0.9.3",
-- --   dependencies = {
-- --     "moyiz/blink-emoji.nvim",
-- --     "Kaiser-Yang/blink-cmp-dictionary",
-- --   },
-- --   opts = function(_, opts)
-- --     opts.sources = vim.tbl_deep_extend("force", opts.sources or {}, {
-- --       default = { "lsp", "path", "buffer" },
-- --       providers = {
-- --         lsp = {
-- --           name = "lsp",
-- --           enabled = true,
-- --           module = "blink.cmp.sources.lsp",
-- --           -- kind = "LSP",
-- --           fallbacks = { "snippets", "buffer" },
-- --           score_offset = 90, -- the higher the number, the higher the priority
-- --         },
-- --         path = {
-- --           name = "Path",
-- --           module = "blink.cmp.sources.path",
-- --           score_offset = 25,
-- --           fallbacks = { "snippets", "buffer" },
-- --           opts = {
-- --             trailing_slash = false,
-- --             label_trailing_slash = true,
-- --             get_cwd = function(context)
-- --               return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
-- --             end,
-- --             show_hidden_files_by_default = true,
-- --           },
-- --         },
-- --         buffer = {
-- --           name = "Buffer",
-- --           enabled = true,
-- --           max_items = 3,
-- --           module = "blink.cmp.sources.buffer",
-- --           min_keyword_length = 4,
-- --           score_offset = 15, -- the higher the number, the higher the priority
-- --         },
-- --       }
-- --     })
-- --
-- --     opts.keymap = {
-- --       preset = 'enter',
-- --       ['<Tab>'] = { 'select_next', 'fallback' },
-- --       ['<S-Tab>'] = { 'select_prev', 'fallback' },
-- --       ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
-- --       ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
-- --     }
-- --
-- --     return opts
-- --   end,
-- -- }
-- --
