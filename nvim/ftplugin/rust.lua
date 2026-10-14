vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'

vim.treesitter.start()

vim.keymap.set('n', '<leader>bt', ':hor te cargo test --no-run<CR>', { noremap = true })
