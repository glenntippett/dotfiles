-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- https://github.com/smjonas/inc-rename.nvim
-- Provides a command for LSP renaming with immediate
-- visual feedback thanks to Neovim's command preview feature
vim.keymap.set("n", "<leader>rn", ":IncRename ")
