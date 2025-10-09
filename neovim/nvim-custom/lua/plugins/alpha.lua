-- Greeter dashboard when opening neovim
return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	opts = function()
		local dashboard = require("alpha.themes.dashboard")
		local logo = [[
⠀⠀⠀⠀⠀⠀⣀⠤⣒⣊⣭⠭⠉⠉⠑⠒⠢⠤⣀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢠⢊⡵⣪⡿⠋⠀⠀⠀⠀⠀⠀⠀⠁⠪⣝⢦⠀⠀⠀⠀⠀
⠀⠀⠀⢠⠃⣾⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡄⢣⠀⠀⠀⠀
⠀⠀⠀⣾⠰⣿⣿⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⢸⡄⠀⠀⠀
⠀⠀⢀⣿⢠⣿⣿⣸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡇⣼⣇⠀⠀⠀
⠀⠀⢿⣿⡿⣿⣿⣿⣷⣶⣶⣶⣶⣶⣆⣀⣀⣀⣹⣿⡿⣿⢿⠀⠀⠀
⠀⢀⣯⣿⣧⣿⣿⣿⣿⠿⣋⣥⠖⠢⢌⠙⢿⣶⣼⣿⢁⢸⣾⡧⠀⠀
⠀⠈⢿⢹⣶⣉⡉⠩⠰⣾⠏⠀⠀⠀⠀⠈⠂⠌⢉⣡⣾⢠⢽⣧⣄⠀
⠀⢀⠞⠹⣿⠃⠀⠀⣸⠇⠀⢀⣤⣤⣀⠀⠀⠀⠀⠘⣿⠀⠢⡙⢿⣧
⣰⣃⠤⣿⣌⢀⠀⠀⢸⣤⣾⠿⠿⠿⠿⣿⣦⡀⠀⢀⠏⢁⡴⠊⡂⣿
⣿⡇⠐⢝⠿⣿⡯⠲⢿⣿⣿⡏⠀⠀⠀⠀⠉⠛⠂⠌⠰⡿⠁⣠⣿⠇
⠹⣿⣤⣶⡏⠀⠈⠐⡀⢻⣿⠤⠤⠀⡀⠀⠀⡠⠀⠀⠀⢐⣴⡿⠋⠀
⠀⠹⣿⠻⣇⠠⢂⣐⡳⠤⢣⢰⣾⣦⢸⣖⠄⣐⣀⡒⢄⢠⣸⠁⠀⠀
⠀⠀⠈⢶⣄⠄⢯⣈⣻⡇⠸⣿⣿⣿⡷⠀⣻⣉⠿⠿⢘⣨⠇⠀⠀⠀
⠀⠀⠀⠀⠑⠠⢀⣀⣀⠤⠞⠉⠉⠙⠓⠤⣦⣀⣀⠤⠞⠁⠀⠀⠀⠀
    ]]
		dashboard.section.header.val = vim.split(logo, "\n")
		dashboard.section.footer.val = "Welcome to Neovim!"
		return dashboard
	end,
	config = function(_, dashboard)
		require("alpha").setup(dashboard.opts)
		vim.cmd([[autocmd User AlphaReady set showtabline=0 | autocmd VimLeavePre * set showtabline=2]])
	end,
}
