return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			require("dapui").setup()

			local dotnet_debugger = vim.fn.exepath("netcoredbg")
			if dotnet_debugger ~= "" then
				dap.adapters.dotnet_task = {
					type = "executable",
					command = dotnet_debugger,
					args = { "--interpreter=vscode" },
				}

				dap.configurations.cs = {
					{
						type = "dotnet_task",
						name = "debug dotnet",
						program = "./bin/Debug/net8.0/DebuggingTest.App.dll",
						request = "launch",
						projectDir = "${workspaceFolder}",
					},
				}
			end

			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end
		end,
	},
}
