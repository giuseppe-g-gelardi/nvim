return {
  'numToStr/Comment.nvim',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring', -- JSX/TSX aware commenting
  },
  opts = {},
  config = function()
    local U = require('Comment.utils')

    -- Setup ts-context-commentstring for JSX/TSX
    require('ts_context_commentstring').setup({
      enable_autocmd = false, -- Let Comment.nvim handle it via pre_hook
    })

    -- [[
    --
    -- this sets comments to be toggled with `Control + /` similar to vscode
    -- NOTE: this only works in a tmux session
    --
    -- ]]
    require("Comment").setup(
      {
        padding = true,
        sticky = true,
        ignore = nil,
        -- We disable built-in Ctrl mappings and provide a single smart Ctrl+/
        -- toggle below. Neovim represents Ctrl+/ as <C-_>, so our custom
        -- keymaps handle that. Keeping plugin defaults like gcc/gc.
        toggler = nil,
        opleader = nil,
        extra = {
          above = nil,
          below = nil,
          eol = nil
        },
        mappings = {
          basic = true,
          extra = true,
          extended = false,
        },
        -- Enable JSX/TSX context-aware commenting
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        post_hook = function(ctx)
          -- Check whether we were in VISUAL mode
          if ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            vim.cmd('norm! gv')
          end
        end,
      }
    )

    -- Single toggle key: Always use linewise toggle and let
    -- ts-context-commentstring decide the correct commentstring.
    -- This avoids mixed // vs {/* */} within selections.
    local api = require('Comment.api')
    vim.keymap.set('n', '<C-_>', function()
      api.toggle.linewise.current()
    end, { desc = 'Toggle comment (JSX-aware via ts-context-commentstring)' })

    vim.keymap.set('x', '<C-_>', function()
      local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
      local mode = vim.fn.visualmode()
      vim.api.nvim_feedkeys(esc, 'nx', false)
      api.toggle.linewise(mode)
    end, { desc = 'Toggle comment (visual, JSX-aware via ts-context-commentstring)' })
  end,
  lazy = false,
}

--- must add
--- keybind = ctrl+/=text:\x1f
--- to ghostty config, otherwise this will only work in a tmux session

