require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.tmux")

-- Load saved colorscheme or fallback to default
local colorscheme_persistence = require("config.colorscheme-persistence")
local saved_colorscheme = colorscheme_persistence.load_colorscheme()

if saved_colorscheme then
	-- Try to apply the saved colorscheme, fallback to default if it fails
	local ok = pcall(vim.cmd.colorscheme, saved_colorscheme)
	if not ok then
		vim.notify("Failed to load saved colorscheme '" .. saved_colorscheme .. "', using default", vim.log.levels.WARN)
		vim.cmd.colorscheme("gruvbox-material")
	end
else
	-- No saved colorscheme, use default
	vim.cmd.colorscheme("gruvbox-material")
end
