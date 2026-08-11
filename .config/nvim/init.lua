require("config.lazy")

-- default settings
vim.o.number = true

vim.o.tabstop = 8
vim.o.shiftwidth = 4
vim.o.softtabstop = -1
vim.o.expandtab = true


-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- nvim-treesitter
require('nvim-treesitter').setup {
    install_dir = vim.fn.stdpath('data') .. '/site'
}

vim.api.nvim_create_autocmd({ "FileType" }, {
    callback = function()
        if vim.bo.filetype == "cs" then
            vim.wo[0][0].foldmethod = "expr"
            vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        else
            vim.opt.foldmethod = "syntax"
        end
    end
})

-- LSP
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('blink.cmp').get_lsp_capabilities()

-- vim.lsp.enable('pylsp')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('roslyn_ls')
