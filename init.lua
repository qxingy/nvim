if vim.g.vscode then
	print("VSCode 启动!!!")
	print(cond)
else
	require("config/basic")
	require("config/mappings")
	require("config/lazy")
end
