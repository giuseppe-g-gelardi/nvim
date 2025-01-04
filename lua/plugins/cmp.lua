return {
  'hrsh7th/nvim-cmp',

  dependencies = {
    'hrsh7th/cmp-buffer',   -- nvim-cmp source for buffer words
    'hrsh7th/nvim-cmp',     -- code completion
    'hrsh7th/cmp-nvim-lsp', -- lsp for nvim-cmp
    'hrsh7th/cmp-cmdline',  -- nvim-cmp source for command line words
    'hrsh7th/cmp-path',     -- nvim-cmp source for file path words
    -- 'L3MON4D3/LuaSnip',         -- snippets that crash sometimes
    -- 'saadparwaiz1/cmp_luasnip', -- snippets for nvim-cmp
  },

  config = function()
    -- nvim-cmp setup
    local cmp = require 'cmp'
    -- local luasnip = require 'luasnip'
    local lspkind = require 'lspkind'

    -- luasnip.config.setup {}

    local function get_lsp_completion_context(completion, source)
      local ok, source_name = pcall(function() return source.source.client.config.name end)
      if not ok then return nil end

      local source_details = {
        -- tsserver = true, gopls = true, rust_analyzer = true, lua_ls = true,
        ts_ls = true,
        gopls = true,
        rust_analyzer = true,
        lua_ls = true,
      }

      if source_details[source_name] then
        return completion.detail
      end
    end

    cmp.setup {
      -- snippet = {
      --   expand = function(args)
      --     luasnip.lsp_expand(args.body)
      --   end,
      -- },
      mapping = cmp.mapping.preset.insert {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-u>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          local copilot_keys = vim.fn['copilot#Accept']()
          if cmp.visible() then
            cmp.select_next_item()
            -- elseif luasnip.expand_or_jumpable() then
            --   luasnip.expand_or_jump()
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
            -- elseif luasnip.jumpable(-1) then
            --   luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        -- { name = 'luasnip' },
        { name = 'path' },
      },
      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, vim_item)
          vim_item.abbr = string.sub(vim_item.abbr, 1, 16)
          local item_with_kind = lspkind.cmp_format({
            menu = ({
              nvim_lsp = '', -- nvim_lsp = '',
              -- luasnip = '',  -- luasnip = '﬌',
              buffer = '',   -- buffer = '﬘',
              path = '[PATH]',
            }),
            maxwidth = 40,         -- max width of the menu in characters
            ellipsis_char = '...', -- if max width is exceeded, this character will be used to indicate truncation, -- ! not working yet
          })(entry, vim_item)

          item_with_kind.menu = vim.trim(item_with_kind.menu)

          local completion_context = get_lsp_completion_context(entry.completion_item, entry.source)
          if completion_context ~= nil and completion_context ~= "" then
            item_with_kind.menu = item_with_kind.menu .. completion_context
          end
          item_with_kind.menu = string.sub(item_with_kind.menu, 1, 15)
          return item_with_kind
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    }
  end,
}
