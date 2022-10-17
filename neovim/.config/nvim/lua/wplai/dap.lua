vim.keymap.set("n", "<leader>dl", function()
	require("dap").run_last()
end)
vim.keymap.set("n", "<leader>B", function()
	require("dap").toggle_breakpoint()
end)

vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end)
vim.keymap.set("n", "<F10>", function()
	require("dap").step_over()
end)
vim.keymap.set("n", "<F11>", function()
	require("dap").step_into()
end)
vim.keymap.set("n", "<F12>", function()
	require("dap").step_out()
end)

local dap = require("dap")
dap.adapters.lldb = {
	type = "server",
	host = "127.0.0.1",
	port = "${port}",
	executable = {
		command = "/Users/wplai/executables/codelldb/extension/adapter/codelldb",
		args = { "--port", "${port}" },
	},
}
dap.configurations.rust = {
	{
		name = "Launch file",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = true,
		targetArchitecture = "arm64",
	},
}
