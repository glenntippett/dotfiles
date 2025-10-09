-- Plugins associated with Ruby or Ruby on Rails development.

return {
	{
		-- Helps to end certain structures automatically.
		-- In Ruby, this means adding end after if, do, def and several other keywords
		"tpope/vim-endwise",
		event = "VeryLazy",
	},
	{
		-- For editing Ruby on Rails applications.
		-- see ":help rails" for more information.
		"tpope/vim-rails",
		event = "VeryLazy",
	},
}
