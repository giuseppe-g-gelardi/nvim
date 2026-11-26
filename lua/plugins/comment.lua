return {
  'numToStr/Comment.nvim',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring', -- JSX/TSX aware commenting
  },
  lazy = false,
  config = function()
    local U = require('Comment.utils')

    -- Setup ts-context-commentstring for JSX/TSX
    require('ts_context_commentstring').setup({
      enable_autocmd = false, -- Let Comment.nvim handle it via pre_hook
    })

    require('Comment').setup({
      padding = true,
      sticky = true,
      ignore = nil,
      -- Keep plugin defaults like gcc/gc available, but the main
      -- interface is the single VSCode-style Ctrl+/ toggle below.
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
    })

    -- [[
    -- VSCode-style Ctrl+/ comment toggle (one key, all modes).
    --
    -- Terminals encode Ctrl+/ in one of two ways; a terminal only ever
    -- sends one of them, so mapping both makes the same physical key
    -- work everywhere (ghostty, Rex, kitty, tmux, ...):
    --   <C-/>  modern kitty keyboard protocol encoding
    --   <C-_>  legacy encoding (tmux without extended-keys, older terminals)
    -- ]]
    local api = require('Comment.api')
    local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)

    for _, key in ipairs({ '<C-/>', '<C-_>' }) do
      -- Normal mode: toggle current line
      vim.keymap.set('n', key, function()
        api.toggle.linewise.current()
      end, { desc = 'Toggle comment line (VSCode style)' })

      -- Visual mode: toggle selected lines. Always linewise so
      -- ts-context-commentstring picks one correct commentstring
      -- (avoids mixed // vs {/* */} within a selection).
      -- NOTE: read the mode via nvim_get_mode() *while still in visual mode*;
      -- vim.fn.visualmode() returns the last *completed* visual mode, which is
      -- empty on a session's first selection and made Comment.nvim fall back
      -- to commenting the whole file.
      vim.keymap.set('x', key, function()
        local mode = vim.api.nvim_get_mode().mode -- 'v', 'V', or '\22'
        vim.api.nvim_feedkeys(esc, 'nx', false)
        api.toggle.linewise(mode)
      end, { desc = 'Toggle comment selection (VSCode style)' })

      -- Insert mode: toggle current line without leaving insert,
      -- like hitting Ctrl+/ while typing in VSCode
      vim.keymap.set('i', key, function()
        api.toggle.linewise.current()
      end, { desc = 'Toggle comment line (VSCode style)' })
    end
  end,
}
