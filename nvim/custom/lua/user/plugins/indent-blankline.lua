local status, indent_blankline = pcall(require, "indent_blankline")
if not status then
	return
end

indent_blankline.setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
	use_treesitter = true,
	use_treesitter_scope = true,
	context_patterns = {
		"class",
		"function",
		"method",
		"^if",
		"^while",
		"^for",
		"^object",
		"^table",
		"block",
		"arguments",
	},
})
