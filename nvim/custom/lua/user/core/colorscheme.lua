require("catppuccin").setup({
	flavour = "mocha",
	dim_inactive = {
		enabled = true,
		percentage = 1,
	},
})

local status, _ = pcall(vim.cmd, "colorscheme catppuccin")

if not status then
	print("Colorscheme not found")
	return
end
