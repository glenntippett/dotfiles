return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.animate").setup({
				cursor = {
					-- Duration of cursor animation in milliseconds
					duration = 50,
				},
				scroll = {
					-- Duration of scroll animation in milliseconds
					duration = 50,
				},
			})

			-- Autoclose brackets, quotes, etc.
			require("mini.pairs").setup()

			-- Helper for commenting
			require("mini.comment").setup({
				mappings = {
					-- Toggle comment on current line
					comment_line = "gcc",
				},
			})

			-- Better Around/Inside textobjects
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - in visual mode, highlight the content to be surrounded and press 'sa' folowed by the surrounding character
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()

			-- Show indent guide/scope
			require("mini.indentscope").setup({
				vim.api.nvim_create_autocmd({ "FileType" }, {
					desc = "Disable indentscope for certain filetypes",
					callback = function()
						local ignore_filetypes = {
							"help",
							"lazy",
							"leetcode.nvim",
							"mason",
							"neo-tree",
							"notify",
							"alpha",
						}
						if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
							vim.b.miniindentscope_disable = true
						end
					end,
				}),
				options = {
					-- Show scope for current line even if cursor is at the beginning of the line
					indent_at_cursor = false,
					-- Whether to first check input line to be a border of adjacent scope.
					-- Use it if you want to place cursor on function header to get scope of
					-- its body.
					try_as_border = true,
				},
			})
		end,
	},
}
