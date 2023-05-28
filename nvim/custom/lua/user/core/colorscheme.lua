local status, _ = pcall(vim.cmd, "colorscheme ayu-mirage") -- Protected call, same as vim.cmd("colorscheme nightfly")
if not status then
	print("Colorscheme not found")
	return
end
