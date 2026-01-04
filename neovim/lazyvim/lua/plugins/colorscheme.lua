return {
  {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_background = "hard"
    end,
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = "dark",
      })
    end,
  },
  { "ellisonleao/gruvbox.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "pineapplegiant/spaceduck" },
  { "mocte4/godotcolour-vim" },
  { "shaunsingh/nord.nvim" },
  { "marko-cerovac/material.nvim" },
  { "doom-neovim/doom-nvim" },
  { "Shatur/neovim-ayu" },
  { "olivercederborg/poimandres.nvim" },
  { "wtfox/jellybeans.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "Mofiqul/vscode.nvim" },
}
