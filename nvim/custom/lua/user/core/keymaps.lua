vim.g.mapleader = " "

local keymap = vim.keymap

        --mode  key   replaces
keymap.set("n", "x", "_x") -- When removing a single character don't copy it

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>|", "<C-w>v") -- Split vertically
keymap.set("n", "<leader>-", "<C-w>s") -- Split horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- Make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- Close current split window

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
