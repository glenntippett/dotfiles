local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

function GetWidth()
	local winwidth = vim.fn.winwidth(0)
	if winwidth <= 100 then
		return 30
	else
		return 40
	end
end

nvimtree.setup({
	view = {
		width = GetWidth(),
	},
	update_focused_file = {
		enable = true,
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})
