local status, _ = pcall(vim.cmd, "colorscheme tokyonight-moon") -- Protected call, same as vim.cmd("colorscheme nightfly")
if not status then
	print("Colorscheme not found")
	return
end
