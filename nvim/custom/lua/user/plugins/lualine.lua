local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local color_theme = require("lualine.themes.onedark")

local colors = {
	blue = "#65D1FF",
	green = "#AAECA2",
	violet = "#FF61EF",
	yellow = "#FFDA7B",
	black = "#000000",
}

color_theme.normal.a.bg = colors.blue
color_theme.insert.a.bg = colors.green
color_theme.visual.a.bg = colors.violet
color_theme.command = {
	a = {
		gui = "bold",
		bg = colors.yellow,
		fg = colors.black,
	},
}

lualine.setup({
	options = {
		theme = color_theme,
	},
	sections = {
		lualine_c = {
			{
				"filename",
				path = 1,
			},
		},
	},
})
