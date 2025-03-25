return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				integrations = {
					noice = true,
					notify = true,
					which_key = true,
				},
			})
		end,
	},
	{
		"Shatur/neovim-ayu",
		lazy = false,
		priority = 1000,
		config = function()
			local colors = require("ayu.colors")
			colors.generate(true)
			require("ayu").setup({
				mirage = true,
				overrides = function()
					local bgColor = "#272C36" -- OneDark bg colour, #242936 for Ayu mirage
					return {
						Normal = { bg = bgColor },
						CursorLine = { bg = "#1A1F29" },
						LineNr = { fg = "#7A7A7A" }, -- OneDark/Atom (delete this to revert to Ayu mirage)
						SignColumn = { bg = bgColor },
					}
				end,
			})
		end,
	},
}
