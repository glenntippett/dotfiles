local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local ayu_mirage = require("lualine.themes.ayu_mirage")

local colors = {
	blue = "#65D1FF",
	green = "#3EFFDC",
	violet = "#FF61EF",
	yellow = "#FFDA7B",
	black = "#000000",
}

ayu_mirage.normal.a.bg = colors.blue
ayu_mirage.insert.a.bg = colors.green
ayu_mirage.visual.a.bg = colors.violet
ayu_mirage.command = {
	a = {
		gui = "bold",
		bg = colors.yellow,
		fg = colors.black,
	},
}

lualine.setup({
	options = {
		theme = ayu_mirage,
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
