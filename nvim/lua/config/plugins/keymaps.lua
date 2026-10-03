-- TELESCOPE

local telescope_builtin = require 'telescope.builtin'

vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, { desc = 'pick files' })
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, { desc = 'Telescope buffers' })

-- AUTO COMPLETION

vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, { desc = "trigger autocompletion" })

-- DEBUGGING

vim.keymap.set('n', '<leader>db', require"dap".toggle_breakpoint, { noremap = true })
vim.keymap.set('n', '<leader>dc', require"dap".continue, { noremap = true })
vim.keymap.set('n', '<leader>do', require"dap".step_over, { noremap = true })
vim.keymap.set('n', '<leader>di', require"dap".step_into, { noremap = true })

vim.keymap.set('n', '<leader>dl', function()
  require"osv".launch({port = 8086})
end, { noremap = true })

vim.keymap.set('n', '<leader>dw', function()
  local widgets = require"dap.ui.widgets"
  widgets.hover()
end)

vim.keymap.set('n', '<leader>df', function()
  local widgets = require"dap.ui.widgets"
  widgets.centered_float(widgets.frames)
end)

vim.keymap.set('n', '<leader>ds', function()
    local dapui = require("dapui")
    dapui.open()
end)

vim.keymap.set('n', '<leader>dh', function()
    local dapui = require("dapui")
    dapui.close()
end)

-- DIAGNOSTICS
vim.keymap.set('n', '<C-D>', function()
    vim.diagnostic.open_float()
end)
