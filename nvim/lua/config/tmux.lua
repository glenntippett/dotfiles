-- This file contains the configuration for tmux integration with Neovim.
-- It includes an autocommand to show the currently open buffer in the tmux status line

-- The command "tmux has-session" will return nothing if tmux has a server running
-- If tmux is not running, the command will return an error like: "tmux: no server running"

local tmux_running = os.execute("tmux has-session 2>/dev/null") == 0

if tmux_running then
	vim.api.nvim_create_autocmd({ "BufEnter" }, {
		callback = function()
			local filename = vim.fn.expand("%:.")
			if filename == "" then
				filename = "[No Name]"
			end
			os.execute("tmux rename-window " .. vim.fn.shellescape(filename))
		end,
	})
end
