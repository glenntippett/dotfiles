return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = "",
			},
			sections = {
				lualine_a = { { "mode", right_padding = 2 } },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { { "filename", path = 0 } },
				lualine_x = { "buffers" },
				lualine_y = {
					{ "progress", separator = " ", padding = { left = 1, right = 0 } },
					{ "location", padding = { left = 0, right = 1 } },
				},
				lualine_z = { { "location" } },
			},
		})
	end,
}
