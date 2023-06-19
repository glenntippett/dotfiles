local status, bufferline = pcall(require, "bufferline")

if not status then
	return
end

bufferline.setup({
	options = {
		indicator = {
			style = "underline",
		},
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
				separator = true,
			},
		},
	},
})
