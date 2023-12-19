return {
  'nvim-lualine/lualine.nvim', -- Set lualine as statusline
  config = function()
    ---@diagnostic disable-next-line: undefined-field
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'catppuccin', -- require('material.lualine') -- when using material
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
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' }, -- { 'branch', 'diff', 'diagnostics' },
        lualine_c = {},
        lualine_x = {},                                  -- { 'encoding', 'fileformat', 'filetype' },
        lualine_y = {},
        lualine_z = { 'filename' }
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
  end,
}

--[[
--
    branch (git branch)
    buffers (shows currently available buffers)
    diagnostics (diagnostics count from your preferred source)
    diff (git diff status)
    encoding (file encoding)
    fileformat (file format)
    filename
    filesize
    filetype
    hostname
    location (location in file in line:column format)
    mode (vim mode)
    progress (%progress in file)
    searchcount (number of search matches when hlsearch is active)
    selectioncount (number of selected characters or lines)
    tabs (shows currently available tabs)
    windows (shows currently available windows)

--]]



-- sections = {
--   lualine_a = { 'mode' },
--   lualine_b = { 'branch', 'diff', 'diagnostics' },
--   lualine_c = { 'buffers' },
--   lualine_x = { 'encoding', 'fileformat', 'filetype' },
--   lualine_y = { 'progress' },
--   lualine_z = { 'filename' },
-- },
-- inactive_sections = {
--   lualine_a = {},
--   lualine_b = {},
--   lualine_c = { 'filename' },
--   lualine_x = { 'location' },
--   lualine_y = {},
--   lualine_z = {}
-- },
