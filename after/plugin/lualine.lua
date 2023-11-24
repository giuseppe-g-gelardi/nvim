require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    -- theme = require('material.lualine'),
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    -- branch, buffers, diagnostics, diff, encoding, fileformat, filename,
    -- filesize, filetype, hostname, location, mode, progress, searchcount,
    -- selectioncount, tabs, windows
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    -- lualine_c = { 'filename' },
    lualine_c = { 'buffers' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'filename' },
    -- lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}









-- require('lualine').setup
-- {
--   -- work options
--   -- options = {
--   --   icons_enabled = false,
--   --   theme = 'auto',
--   --   section_separators = { left = '', right = '' },
--   --   component_separators = { left = '|', right = '|' },
--   --   disabled_filetypes = {}
--   -- },
--   -- work options
--   options = {
--     icons_enabled = true,
--     -- theme = 'auto',
--     section_separators = { left = '', right = '' },
--     component_separators = { left = '', right = '' },
--     disabled_filetypes = {}
--   },
--   sections = {
--     lualine_a = { 'mode' },
--     lualine_b = { {
--       'branch',
--       separator = { left = '', right = '' },
--       color = { fg = '#ebbcba', bg = '#21202e', gui = 'italic,bold' },
--     } }, -- change the color of this element
--     lualine_c = { {
--       'filename',
--       file_status = true, -- displays file status (readonly status, modified status)
--       path = 0            -- 0 = just filename, 1 = relative path, 2 = absolute path
--     } },
--     lualine_x = {
--       {
--         'diagnostics',
--         sources = { "nvim_diagnostic" },
--         symbols = {
--           error = ' ',
--           warn = ' ',
--           info = ' ',
--           hint = ' '
--         }
--       },
--       'encoding',
--       'filetype'
--     },
--     -- lualine_y = { 'progress' }, -- change the color of this element
--     lualine_y = { {
--       'progress',
--       separator = { left = '' },
--       color = { fg = '#ebbcba', bg = '#21202e', gui = 'italic,bold' },
--     } },
--     lualine_z = { 'location' }
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = { {
--       'filename',
--       file_status = true, -- displays file status (readonly status, modified status)
--       path = 1            -- 0 = just filename, 1 = relative path, 2 = absolute path
--     } },
--     lualine_x = { 'location' },
--     lualine_y = {},
--     lualine_z = {}
--   },
--   tabline = {},
--   extensions = { 'fugitive' }
-- }
