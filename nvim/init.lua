vim.o.number = true

vim.o.tabstop = 8
vim.o.shiftwidth = 4
vim.o.softtabstop = -1
vim.o.expandtab = true

vim.opt.completeopt = { 'menuone', 'noselect', 'popup' }

require('config/plugins/telescope')
require('config/plugins/treesitter')
require('config/plugins/nvim-lspconfig')
require('config/plugins/mason')
require('config/plugins/roslyn')
require('config/plugins/lspcompletion')
