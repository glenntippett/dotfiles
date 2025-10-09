vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.termguicolors = true

-- Yank to system clipboard by default
vim.opt.clipboard = "unnamedplus"

-- Try to stop the lsp logs from getting too big
vim.lsp.set_log_level("off")

-- open help menu vertically
vim.cmd("autocmd FileType help wincmd L")

-- Font
vim.g.have_nerd_font = true

-- Show relative line numbers
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits
vim.opt.mouse = "a"

-- Folding
vim.opt.foldlevelstart = 99 -- Unfolded by default
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Don't show the mode (Insert, Normal, Visual), since it's already in the status line
vim.opt.showmode = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- [[
--
-- ~~~~~ Cursor ~~~~~
--
-- ]]

vim.opt.cursorline = true -- Show which line your cursor is on
-- vim.opt.guicursor = {
-- 	"n-v-c:block-Cursor/lCursor-blinkon1",
-- 	"i-ci-ve:ver25-Cursor/lCursor",
-- 	"r-cr:hor20-Cursor/lCursor",
-- }

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 30

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
