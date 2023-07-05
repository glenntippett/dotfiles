local status, _ = pcall(vim.cmd, "colorscheme fleet")

if not status then
	print("Colorscheme not found")
	return
end
