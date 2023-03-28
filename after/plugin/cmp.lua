-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      local copilot_keys = vim.fn['copilot#Accept']()
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif copilot_keys ~= '' and type(copilot_keys) == 'string' then
        vim.api.nvim_feedkeys(copilot_keys, 'i', true)
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'luasnip' },
    { name = 'path' },
  },
  formatting = {
    -- show import path or library name
    format = function(entry, vim_item)
      vim_item.kind = require('lspkind').presets.default[vim_item.kind]
      vim_item.menu = ({
        nvim_lsp = '',
        luasnip = '﬌',
        buffer = '﬘',
        path = '',
      })[entry.source.name]
      return vim_item
    end,
  }
  -- formatting = {
  --   fields = { 'menu', 'abbr', 'kind' },
  --   format = require('lspkind').cmp_format({
  --     menu = ({
  --       nvim_lsp = '',
  --       luasnip = '﬌',
  --       buffer = '﬘',
  --       path = '[PATH]',
  --       -- path = '',
  --     }),
  --     -- with_text = true,
  --     -- mode = 'symbol',
  --     -- maxwidth = 100,
  --     -- ellipsis_char = '...',
  --   })
  -- }

}





-- just in case copilot gets fussy, here's the original snippet:
-- ['<Tab>'] = cmp.mapping(function(fallback)
--   if cmp.visible() then
--     cmp.select_next_item()
--   elseif luasnip.expand_or_jumpable() then
--     luasnip.expand_or_jump()
--   else
--     fallback()
--   end
-- end, { 'i', 's' }),











--  formatting = {
--   format = function(entry, vim_item)
--     vim_item.kind = require('lspkind').presets.default[vim_item.kind]
--     vim_item.menu = ({
--       nvim_lsp = '[LSP]',
--       buffer = '[BUF]',
--       luasnip = '[SNIP]',
--       path = '[PATH]',
--     })[entry.source.name]
--     return vim_item
--   end,
-- },

-- formatting = { -- this doesnt work for some reason. plz, someone tell me how to get the icons to show up in the completion menu
--   fields = { 'menu', 'abbr', 'kind' },
--   format = function(entry, item)
--     local menu_icon = {
--       nvim_lsp = 'λ',
--       path = '🖫',
--       luasnip = '⋗',
--       buffer = 'Ω',
--     }
--     item.menu = menu_icon[entry.source.name]
--     return item
--   end,
-- }
