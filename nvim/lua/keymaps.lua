local map = function(keys, func, desc, mode)
	mode = mode or "n"
	vim.keymap.set(mode, keys, func, { noremap = true, silent = true, desc = desc })
end

-- Navigation
map("<C-d>", "<C-d>zz", "Scroll down")
map("<C-u>", "<C-u>zz", "Scroll up")

-- Buffers
map("<leader>w", "<cmd>bd<CR>", "Close current buffer")
map("<leader>l", "<cmd>bn<CR>", "Go to the next buffer")
map("<leader>h", "<cmd>bp<CR>", "Go to the previous buffer")

-- File explorer
map("<leader>e", "<CMD>Neotree toggle<CR>", "Toggle file explorer")

-- Folding
map("<leader>z", "za", "Toggle fold")

-- Clear highlights on search when pressing <Esc> in normal mode
map("<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostics
map("<leader>q", vim.diagnostic.setloclist, "Open diagnostic [Q]uickfix list")

-- Notifications
map("<leader>nh", ":Noice fzf<CR>", "[N]otification [H]istory")

---------- [[
--
-- ~~~~~ Searching ~~~~~
--
---------- ]]

local fzf_lua = require("fzf-lua")
local gitsigns = require("gitsigns")

-- Files
map("<leader>sf", fzf_lua.files, "[S]earch [F]iles")
map("<leader>sg", fzf_lua.live_grep, "[S]earch [G]rep")
map("<leader>srg", fzf_lua.grep_last, "[S]earch [R]ecent [G]rep")
map("<leader>sb", fzf_lua.buffers, "[S]earch [B]uffers")
map("<leader>sq", fzf_lua.quickfix, "[S]earch [Q]uickfix")

-- Manpages
map("<leader>mp", fzf_lua.manpages, "[M]an [P]ages")

-- Colorschemes
map("<leader>cs", fzf_lua.colorschemes, "[C]olor[S]chemes")

-- TODO's
map("<leader>td", "<CMD>TodoFzfLua<CR>", "[T]odo comments")

vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("git-attach", { clear = true }),
	callback = function()
		-- Git
		map("<leader>gs", fzf_lua.git_status, "[G]it [S]tatus")
		map("<leader>gf", fzf_lua.git_files, "[G]it [F]iles")
		map("<leader>gc", fzf_lua.git_commits, "[G]it [C]ommits")

		map("<leader>gd", gitsigns.diffthis, "[G]it [D]iff")
		map("<leader>gb", gitsigns.blame, "[G]it [B]lame")
	end,
})

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function()
		map("gd", fzf_lua.lsp_definitions, "[G]oto [D]efinition") --  To jump back, press <C-t>.
		map("gr", fzf_lua.lsp_references, "[G]oto [R]eferences")
		map("gI", fzf_lua.lsp_implementations, "[G]oto [I]mplementation")

		map("<leader>dS", fzf_lua.lsp_document_symbols, "[D]ocument [S]ymbols")
		map("<leader>wS", fzf_lua.lsp_workspace_symbols, "[W]orkspace [S]ymbols")

		map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
	end,
})
