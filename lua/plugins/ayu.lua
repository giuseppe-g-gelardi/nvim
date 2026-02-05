return {
  'Shatur/neovim-ayu',
  config = function()
    require('ayu').setup({
      mirage = true,   -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
      terminal = true, -- Set to `false` to let terminal manage its own colors.
      overrides = {
        -- Match VSCode ayu mirage theme colors
        
        -- Background colors
        Normal = { bg = '#242936', fg = '#cccac2' },           -- Main editor background
        NormalFloat = { bg = '#282e3b' },                      -- Floating windows background
        CursorLine = { bg = '#1a1f29' },                       -- Current line background (slightly darker, not black)
        
        -- Line numbers
        LineNr = { fg = '#8a95a8' },                           -- Line numbers (lighter grey)
        CursorLineNr = { fg = '#ffcc66', bold = true },        -- Current line number (yellow, bold)
        NonText = { fg = '#8a95a8' },                          -- Absolute line numbers (lighter grey)
        
        -- Variables and identifiers
        ['@variable'] = { fg = '#cccac2' },                    -- Regular variables (white, matches @variable.member)
        ['@variable.member'] = { fg = '#cccac2' },             -- Member variables/properties (white)
        ['@variable.parameter'] = { fg = '#dfbfff' },          -- Function parameters (purple)
        ['@variable.builtin'] = { fg = '#ffa659', italic = true }, -- Built-in variables like 'this', 'self' (orange, italic)
        
        -- Functions and methods
        ['@function'] = { fg = '#ffcd66' },                    -- Functions (yellow)
        ['@function.method'] = { fg = '#ffcd66' },             -- Methods (yellow)
        ['@function.call'] = { fg = '#ffcd66' },               -- Function calls (yellow)
        ['@function.builtin'] = { fg = '#f28779' },            -- Built-in functions (coral)
        ['@function.macro'] = { fg = '#ffcd66' },              -- Macros like assert_eq! (yellow)
        
        -- Types and classes
        ['@type'] = { fg = '#73d0ff' },                        -- Types (blue)
        ['@type.builtin'] = { fg = '#5ccfe6' },                -- Built-in types (cyan)
        ['@type.definition'] = { fg = '#73d0ff' },             -- Type definitions (blue)
        ['@constructor'] = { fg = '#ffcd66' },                 -- Constructors (yellow)
        
        -- Keywords and operators
        ['@keyword'] = { fg = '#ffa659' },                     -- Keywords (orange)
        ['@keyword.function'] = { fg = '#ffa659' },            -- Function keywords (orange)
        ['@keyword.operator'] = { fg = '#f29e74' },            -- Operator keywords like -> (light orange)
        ['@keyword.return'] = { fg = '#ffa659' },              -- Return keyword (orange)
        ['@operator'] = { fg = '#f29e74' },                    -- Operators (light orange)
        
        -- Constants and literals
        ['@constant'] = { fg = '#cccac2' },                    -- Constants (white, matches @variable)
        ['@constant.builtin'] = { fg = '#dfbfff' },            -- Built-in constants (purple)
        ['@number'] = { fg = '#dfbfff' },                      -- Numbers (purple)
        ['@boolean'] = { fg = '#dfbfff' },                     -- Booleans (purple)
        ['@string'] = { fg = '#d5ff80' },                      -- Strings (green)
        ['@string.regexp'] = { fg = '#95e6cb' },               -- Regex (cyan-green)
        ['@string.escape'] = { fg = '#95e6cb' },               -- Escape sequences (cyan-green)
        
        -- Properties and fields
        ['@property'] = { fg = '#f28779' },                    -- Properties (coral)
        ['@field'] = { fg = '#f28779' },                       -- Fields (coral)
        
        -- Punctuation
        ['@punctuation.delimiter'] = { fg = '#cccac2' },       -- Delimiters (grey)
        ['@punctuation.bracket'] = { fg = '#cccac2' },         -- Brackets (grey)
        ['@punctuation.special'] = { fg = '#f29e74' },         -- Special punctuation (light orange)
        
        -- Comments
        ['@comment'] = { fg = '#6e7c8f', italic = true },      -- Comments (grey, italic)
        
        -- Tags (HTML/JSX)
        ['@tag'] = { fg = '#5ccfe6' },                         -- Tags (cyan)
        ['@tag.attribute'] = { fg = '#ffcd66' },               -- Tag attributes (yellow)
        ['@tag.delimiter'] = { fg = '#5ccfe6' },               -- Tag delimiters (cyan)
        
        -- Namespaces and modules
        ['@namespace'] = { fg = '#d5ff80' },                   -- Namespaces (green)
        ['@module'] = { fg = '#73d0ff' },                      -- Modules (blue, matches @type)
        
        -- Decorators
        ['@attribute'] = { fg = '#d9be98' },                   -- Attributes/decorators (beige)
        
        -- Labels
        ['@label'] = { fg = '#ffa659' },                       -- Labels (orange)
      },
    })

    vim.cmd.colorscheme "ayu"
    
    -- Apply line number highlights after colorscheme loads to avoid black background
    vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#1a1f29' })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#ffcc66', bold = true, bg = 'NONE' })
  end
}
