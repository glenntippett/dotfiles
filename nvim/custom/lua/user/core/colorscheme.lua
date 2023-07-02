local status, _ = pcall(vim.cmd, "colorscheme jellybeans-nvim")

if not status then
	print("Colorscheme not found")
	return
end
