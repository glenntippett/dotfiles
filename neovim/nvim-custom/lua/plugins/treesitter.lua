return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = {
			ensure_installed = {
				"regex",
				"bash",
				"diff",
				"lua",
				"luadoc",
				"markdown",
				"query",
				"vim",
				"vimdoc",
				"typescript",
				"javascript",
				"terraform",
				"hcl",
			},
			auto_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				disable = { "tsx", "ruby" },
			},
			-- indent = { enable = true, disable = { "ruby" } },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
	},
}
