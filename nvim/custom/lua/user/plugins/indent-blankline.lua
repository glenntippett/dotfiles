local status, indent_blankline = pcall(require, "indent_blankline")
if not status then
	return
end

if indent_blankline then
	return "hey"
end

indent_blankline.setup({
	show_current_content = true,
	show_current_content_start = true,
})
