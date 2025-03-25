return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cff",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		-- Formatters by filetype
		formatters_by_ft = {
			zsh = { "shfmt" },
			lua = { "stylua" },
			javascript = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
			typescript = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		notify_on_error = true,
		notify_no_formatters = true,
		format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
	},
}
