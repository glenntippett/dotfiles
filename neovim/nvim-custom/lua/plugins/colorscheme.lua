return {
	{
		"Shatur/neovim-ayu",
		config = function()
			local colors = require("ayu.colors")
			colors.generate(true)
			require("ayu").setup({
				mirage = true,
				overrides = function()
					-- ayu color scheme: https://github.com/ayu-theme/ayu-colors
					local bgColor = "#242936"
					return {
						Normal = { bg = bgColor },
						CursorLine = { bg = "#1A1F29" },
						SignColumn = { bg = bgColor },
						NeoTreeNormal = { bg = "#1F2430" },
						NeoTreeNormalNC = { bg = "#1F2430" },
					}
				end,
			})
		end,
	},
	{
		"maccoda/irises.nvim",
	},
	{
		"Mofiqul/vscode.nvim",
		config = function()
			require("vscode").setup({
				group_overrides = {
					NeoTreeNormal = { bg = "#252526" },
				},
			})
		end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_better_performance = 1
		end,
	},
	{
		"sainnhe/everforest",
		dependencies = { "sheerun/vim-polyglot" },
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_enable_italic = true
			vim.g.everforest_background = "hard"
			vim.g.everforest_sign_column_background = "grey"
			vim.g.everforest_ui_contrast = "high"
			-- vim.g.everforest_better_performance = 1
			vim.g.everforest_diagnostic_text_highlight = 1
			vim.g.everforest_diagnostic_virtual_text = "colored"
		end,
	},
	{
		"sainnhe/sonokai",
	},
	{
		-- Ruby focused colorscheme.
		"tpope/vim-vividchalk",
		lazy = false,
	},
	{
		"miikanissi/modus-themes.nvim",
		lazy = false,
	},
	{
		"Yazeed1s/minimal.nvim",
		lazy = false,
	},
	{
		"mikesmithgh/gruvsquirrel.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"WTFox/jellybeans.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"olimorris/onedarkpro.nvim",
	},
	{
		"NTBBloodbath/doom-one.nvim",
	},
}
