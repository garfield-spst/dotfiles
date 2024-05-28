local dap = require("dap")
local dapui = require("dapui")
local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"

require("dap-python").setup(path, { include_configs = true })
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

config = function(_, opts)
	require("dap-go").setup(opts)
end
