local status, theme = pcall(vim.cmd, "colorscheme oxocarbon")

if not status then
	print("Colorscheme not found")
	return
end
