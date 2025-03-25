return {
	{
		"echasnovski/mini.nvim",
		config = function()
			-- Autoclose brackets, quotes, etc.
			require("mini.pairs").setup()
			require("mini.indentscope").setup({
				options = {
					indent_at_cursor = false,
				},
			})
			-- Helper for commenting
			require("mini.comment").setup({
				mappings = {
					-- Toggle comment (like `gcip` - comment inner paragraph) for both
					-- Normal and Visual modes
					comment = "gc",

					-- Toggle comment on current line
					comment_line = "gcc",

					-- Toggle comment on visual selection
					comment_visual = "gc",

					-- Define 'comment' textobject (like `dgc` - delete whole comment block)
					-- Works also in Visual mode if mapping differs from `comment_visual`
					textobject = "gc",
				},
			})
			-- Better Around/Inside textobjects
			--
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
		end,
	},
}
