vim.pack.add({
    'https://codeberg.org/mfussenegger/nvim-dap',
    'https://github.com/nvim-neotest/nvim-nio',
    'https://github.com/rcarriga/nvim-dap-ui',
    'https://github.com/jbyuki/one-small-step-for-vimkind',
})

local dap = require("dap")

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = '/home/nfm/.local/share/nvim/mason/bin/codelldb',
        args = { "--port", "${port}" },
    }
}

dap.configurations.rust = {
    {
        name = "Launch File",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    }
}
dap.configurations.lua = {
    {
        type = 'nlua',
        request = 'attach',
        name = 'Attach to running Neovim instance',
    }
}

dap.adapters.nlua = function(callback, config)
    callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
end

require("dapui").setup()
