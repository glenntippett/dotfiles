vim.opt.relativenumber = true

-- Highlight the current line that the cursor is on
vim.opt.cursorline = true

-- Folding
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = -1
vim.opt.foldenable = true
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
