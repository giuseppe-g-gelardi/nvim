-- debugging
vim.keymap.set('n', '<leader>bp', '<cmd> DapToggleBreakpoint <CR>', { desc = "Add breakpoint at line" }) -- add breakpoint at line
vim.keymap.set('n', '<leader>dus',
  function()                                                                                             -- open debugging sidebar
    local w = require 'dap.ui.widgets'
    local s = w.sidebar(w.scopes); s.open();
  end, { desc = "Open debugging sidebar" })


vim.keymap.set('n', '<leader>gjt', '<cmd> GoTagAdd json <CR>', { desc = "Add json struct tags" })                    -- add json struct tags
vim.keymap.set('n', '<leader>gyt', '<cmd> GoTagAdd yaml <CR>', { desc = "Add yaml struct tags" })                    -- add yaml struct tags

vim.keymap.set('n', '<leader>do', function() require('dap').step_over() end, { desc = "Step over" })                 -- dap step over
vim.keymap.set('n', '<leader>di', function() require('dap').step_into() end, { desc = "Step into" })                 -- dap step into
vim.keymap.set('n', '<leader>du', function() require('dap').step_out() end, { desc = "Step out" })                   -- dap step out
vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end, { desc = "Continue" })                   -- dap continue
vim.keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end, { desc = "Toggle breakpoint" }) -- dap toggle breakpoint

-- go specific
vim.keymap.set('n', '<leader>dgt',
  function()   -- debug go test
    require('dap-go').debug_test()
  end, { desc = "Debug go test" })

vim.keymap.set('n', '<leader>dgl',
  function()   -- debug last go test
    require('dap-go').debug_last()
  end, { desc = "Debug last go test" })
-- vim.keymap.set('n', '<leader>dr', function() require('dap').repl.open() end, { desc = "Open REPL" })                                              -- dap open repl
-- vim.keymap.set('n', '<leader>dl', function() require('dap').run_last() end, { desc = "Run last" })                                                -- dap run last
-- vim.keymap.set('n', '<leader>ds', function() require('dap').stop() end, { desc = "Stop" })                                                        -- dap stop
-- vim.keymap.set('n', '<leader>dt', function() require('dap').disconnect() end, { desc = "Disconnect" })                                            -- dap disconnect
-- vim.keymap.set('n', '<leader>dd', function() require('dap').down() end, { desc = "Down" })                                                        -- dap down
-- vim.keymap.set('n', '<leader>du', function() require('dap').up() end, { desc = "Up" })                                                            -- dap up
-- vim.keymap.set('n', '<leader>de', function() require('dap').step_back() end, { desc = "Step back" })                                              -- dap step back
-- vim.keymap.set('n', '<leader>dw', function() require('dap').ui.widgets.hover() end, { desc = "Hover" })                                           -- dap hover
-- vim.keymap.set('n', '<leader>df',
--     function() require('dap').ui.widgets.centered_float(require('dap.ui.widgets').scopes) end, { desc = "Scopes" })                               -- dap scopes
-- vim.keymap.set('n', '<leader>dv', function() require('dap.ui.variables').scopes() end, { desc = "Variables" })                                    -- dap variables
-- vim.keymap.set('n', '<leader>di', function() require('dap.ui.variables').visual_hover() end, { desc = "Visual hover" })                           -- dap visual hover
-- vim.keymap.set('n', '<leader>dk', function() require('dap.ui.variables').hover() end, { desc = "Hover" })                                         -- dap hover
-- vim.keymap.set('n', '<leader>dg',
--     function() require('dap.ui.widgets').centered_float(require('dap.ui.widgets').scopes) end, { desc = "Scopes" })                               -- dap scopes

