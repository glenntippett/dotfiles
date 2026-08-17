return {
  {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_background = "hard"
    end,
  },
  {
    "Shatur/neovim-ayu",
    config = function()
      -- Align mirage syntax colors with the official VS Code "Ayu Mirage" theme
      -- (github.com/ayu-theme/vscode-ayu), whose token colors differ slightly
      -- from the canonical ayu palette this plugin ships with. Verified against
      -- the theme's raw tokenColors/semanticTokenColors JSON and this plugin's
      -- own treesitter capture output, one group at a time.
      --
      -- Groups suffixed `.ruby` only apply in Ruby buffers (Neovim's treesitter
      -- highlighter looks up `@capture.<lang>` before falling back to the bare
      -- `@capture`) -- vscode's ayu theme genuinely colors these differently in
      -- Ruby specifically (via `source.ruby` scoped rules), so a global override
      -- would wrongly bleed into JS/TS/Lua files.
      require("ayu").setup({
        overrides = function()
          if not require("ayu.config").mirage then
            return {}
          end
          return {
            -- === Keywords / operators ===
            -- do/end/def/class/module/if/... -> vscode "keyword"/"storage"
            Statement = { fg = "#FFA659" },
            ["@keyword.storage"] = { fg = "#FFA659" },
            -- and/or/not/in -> vscode "keyword.operator" (peach, not keyword-orange)
            ["@keyword.operator"] = { fg = "#F29E74" },
            -- #{ ... } string interpolation delimiters -> vscode "punctuation.section.embedded"
            ["@punctuation.special"] = { fg = "#FFA659" },

            -- === Functions / methods ===
            -- function/method names -> vscode "entity.name.function"/semantic function+method
            Function = { fg = "#FFCD66" },
            -- attr_accessor/attr_reader/attr_writer/include/extend/prepend -> vscode
            -- "keyword.other.special-method" (falls back to generic keyword-orange)
            ["@function.builtin.ruby"] = { fg = "#FFA659" },

            -- === Variables ===
            -- self/super -> vscode "variable.language" (italic cyan)
            ["@variable.builtin"] = { fg = "#5CCFE6", italic = true },
            -- method parameters -> vscode "variable.parameter"/"meta.parameter" (lavender, same as constants)
            ["@variable.parameter"] = { fg = "#DFBFFF" },
            ["@lsp.type.parameter"] = { fg = "#DFBFFF" },
            -- @ivar / @@cvar -> vscode "variable.member"
            ["@variable.member"] = { fg = "#F28779" },
            -- plain local-variable reads/writes -> vscode's Ruby-specific
            -- "source.ruby variable.other.readwrite" rule renders these gold,
            -- not default foreground like most other languages
            ["@variable.ruby"] = { fg = "#FFCD66" },

            -- === Constants / literals ===
            -- nil, true/false already correct; __FILE__ etc -> vscode "constant.language"
            ["@constant.builtin"] = { fg = "#DFBFFF" },
            -- :foo, hash-key `foo:` -> vscode "constant.other.symbol" (green, same as strings)
            ["@string.special.symbol"] = { fg = "#D5FF80" },
            -- \n \t etc -> vscode "constant.character" (teal, not accent-gold)
            ["@string.escape"] = { fg = "#95E6CB" },
            -- /regex/ literals -> vscode "string.regexp" (teal)
            ["@string.regexp"] = { fg = "#95E6CB" },
            -- ?a char literals -> vscode "constant.character" (teal)
            Character = { fg = "#95E6CB" },
            -- NOTE: base plugin defines this as `link = '@constant'`; tbl_deep_extend
            -- merges into that table rather than replacing it, so a plain `fg` here
            -- gets silently ignored (link always wins over a co-present fg). Redirect
            -- the link itself to a dedicated group instead.
            AyuVscodeEnumMember = { fg = "#95E6CB" },
            ["@lsp.type.enumMember"] = { link = "AyuVscodeEnumMember" },

            -- === Punctuation ===
            -- generic brackets/commas/colons -> vscode "punctuation.section" (near-default fg,
            -- not the warm tan this plugin ships with)
            ["@punctuation.delimiter"] = { fg = "#CCCAC2" },
            ["@punctuation.bracket"] = { fg = "#CCCAC2" },
            Delimiter = { fg = "#CCCAC2" },

            -- === Tags (ERB/HTML) ===
            ["@tag"] = { fg = "#5CCFE6" }, -- vscode "entity.name.tag"
            ["@tag.attribute"] = { fg = "#FFCD66" }, -- vscode "entity.other.attribute-name"
            -- NOTE: same link/fg collision as enumMember above -- base plugin defines
            -- this as `link = 'Delimiter'`, which we're repointing away from.
            AyuVscodeTagPunct = { fg = "#5CCFE6" },
            ["@tag.delimiter"] = { link = "AyuVscodeTagPunct" }, -- vscode "punctuation.definition.tag"

            -- === Comments ===
            Comment = { fg = "#6E7C8F", italic = true },

            -- === Editor surface ===
            -- vscode's ayu-mirage actually uses 3 distinct background shades:
            -- editor pane (lighter) vs sidebar/statusline vs floating widgets.
            -- This plugin currently uses one flat shade for all three.
            Normal = { fg = "#CCCAC2", bg = "#242936" },
            NormalFloat = { bg = "#282E3B" },
            Pmenu = { fg = "#CCCAC2", bg = "#282E3B" },
            CursorLine = { bg = "#1A1F29" },
            ColorColumn = { bg = "#1A1F29" },
            SignColumn = { bg = "#242936" },
            FoldColumn = { bg = "#242936" },
          }
        end,
      })
    end,
  },
  { "sainnhe/gruvbox-material" },
  { "loctvl842/monokai-pro.nvim" },
  { "smit4k/shale.nvim" },
  { "AlexvZyl/nordic.nvim" },
  { "edeneast/nightfox.nvim" },
  { "folke/tokyonight.nvim" },
  { "sainnhe/sonokai" },
  { "marko-cerovac/material.nvim" },
  { "ribru17/bamboo.nvim" },
  { "kvrohit/rasmus.nvim" },
  { "davidosomething/vim-colors-meh" },
  { "dchinmay2/alabaster.nvim" },
}
