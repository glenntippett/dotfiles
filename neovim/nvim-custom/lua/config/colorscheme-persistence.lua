-- When pressing <leader>scs and select a colorscheme from the fzf menu, it will:

-- Apply the colorscheme immediately
-- Save the choice to ~/.local/share/nvim/colorscheme.txt (or system equivalent)
-- Show a notification confirming the save
-- When restarting Neovim, it will automatically load the last selected colorscheme
local M = {}

-- Path to store the colorscheme preference
local colorscheme_file = vim.fn.stdpath("data") .. "/colorscheme.txt"

-- Save the current colorscheme to file
function M.save_colorscheme(colorscheme_name)
	local file = io.open(colorscheme_file, "w")
	if file then
		file:write(colorscheme_name)
		file:close()
		vim.notify("Colorscheme '" .. colorscheme_name .. "' saved!", vim.log.levels.INFO)
	else
		vim.notify("Failed to save colorscheme preference", vim.log.levels.ERROR)
	end
end

-- Load the saved colorscheme from file
function M.load_colorscheme()
	local file = io.open(colorscheme_file, "r")
	if file then
		local colorscheme_name = file:read("*all"):gsub("%s+", "") -- trim whitespace
		file:close()
		if colorscheme_name and colorscheme_name ~= "" then
			return colorscheme_name
		end
	end
	return nil -- No saved colorscheme found
end

-- Custom colorscheme selector with persistence
function M.select_colorscheme()
	local fzf_lua = require("fzf-lua")

	fzf_lua.colorschemes({
		actions = {
			["default"] = function(selected)
				if selected and #selected > 0 then
					local colorscheme_name = selected[1]
					-- Apply the colorscheme
					vim.cmd.colorscheme(colorscheme_name)
					-- Save it for persistence
					M.save_colorscheme(colorscheme_name)
				end
			end,
		},
	})
end

return M
