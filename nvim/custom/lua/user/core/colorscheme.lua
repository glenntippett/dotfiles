local status, theme = pcall(vim.cmd, "colorscheme doom-one")

if not status then
	print("Colorscheme not found")
	return
end
