local status, modicator = pcall(require, "modicator")
if not status then
	return
end

modicator.setup({
	-- Show warning if any required option is missing
	show_warnings = true,
	highlights = {
		-- Default options for bold/italic
		defaults = {
			bold = false,
			italic = false,
		},
	},
})
