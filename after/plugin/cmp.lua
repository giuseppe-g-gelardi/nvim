-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

luasnip.config.setup {}


local function get_lsp_completion_context(completion, source)
  local ok, source_name = pcall(function() return source.source.client.config.name end)
  if not ok then return nil end
  if source_name == "tsserver" then
    return completion.detail
  elseif source_name == "gopls" then -- testing for gopls
    return completion.detail
  elseif source_name == "pyright" then
    if completion.labelDetails ~= nil then return completion.labelDetails.description end
  end
end

local SYMBOL_MAP = {
  Text = " ",
  Method = " ",
  Function = "",
  Constructor = " ",
  Field = " ",
  Variable = " ",
  Class = " ",
  Interface = " ",
  Module = " ",
  Property = " ",
  Unit = "塞",
  Value = " ",
  Enum = " ",
  Keyword = " ",
  Snippet = " ",
  Color = " ",
  File = " ",
  Reference = " ",
  Folder = " ",
  EnumMember = " ",
  Constant = " ",
  Struct = " ",
  Event = "",
  Operator = " ",
  TypeParameter = " ",
}

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
    fields = { "kind", "abbr", "menu" },
    --- @param entry cmp.Entry
    --- @param vim_item vim.CompletedItem
    format = function(entry, vim_item)
      local item_with_kind = require("lspkind").cmp_format({
        mode = "symbol_text",
        maxwidth = 50,
        symbol_map = SYMBOL_MAP,
      })(entry, vim_item)

      local kind_s_menu = vim.split(item_with_kind.kind, "%s", { trimempty = true })
      item_with_kind.kind = " " .. (kind_s_menu[1] or "") .. " "
      item_with_kind.menu = "    (" .. (kind_s_menu[2] or "") .. ")"
      item_with_kind.menu = vim.trim(item_with_kind.menu)

      local completion_context = get_lsp_completion_context(entry.completion_item, entry.source)
      if completion_context ~= nil and completion_context ~= "" then
        item_with_kind.menu = item_with_kind.menu .. [[ -> ]] .. completion_context
      end

      return item_with_kind
    end,
  },
  -- formatting = {
  --   -- show import path or library name
  --   format = function(entry, vim_item)
  --     vim_item.kind = require('lspkind').presets.default[vim_item.kind]
  --     vim_item.menu = ({
  --       nvim_lsp = '',
  --       luasnip = '﬌',
  --       buffer = '﬘',
  --       path = '',
  --     })[entry.source.name]
  --     return vim_item
  --   end,
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
--
--
--
--
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
