return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {
          -- Engines (engines/*/Gemfile) each have their own Gemfile with no
          -- lockfile. Default root_markers = { "Gemfile", "Gemfile" } stops
          -- at the engine's Gemfile before reaching the repo's .git, so
          -- opening a file inside an engine spawns a second ruby-lsp rooted
          -- there, which fails to bundle-init and looks like a disconnect.
          -- Always root at the monorepo's .git instead.
          root_dir = function(bufnr, on_dir)
            on_dir(vim.fs.root(bufnr, ".git"))
          end,
        },
      },
    },
  },
}
