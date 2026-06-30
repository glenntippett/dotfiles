local M = {}

-- ~/.local/share/nvim/colorscheme.txt
local colorscheme_file = vim.fn.stdpath("data") .. "/colorscheme.txt"

local function read_file()
  local file = io.open(colorscheme_file, "r")
  if file then
    local name = file:read("*all"):gsub("%s+", "")
    file:close()
    return name ~= "" and name or nil
  end
  return nil
end

local function write_file(name)
  local file = io.open(colorscheme_file, "w")
  if file then
    file:write(name)
    file:close()
  end
end

function M.setup()
  -- Read the saved preference before any autocmd can overwrite it
  local saved = read_file()

  -- Auto-save on every colorscheme change (covers :colorscheme, fzf picker, anything).
  -- Use ev.match instead of vim.g.colors_name: some plugins (e.g. neovim-ayu) hardcode
  -- colors_name to a base name like "ayu", losing the variant ("ayu-mirage").
  vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("ColorSchemePersistence", { clear = true }),
    callback = function(ev)
      write_file(ev.match)
    end,
  })

  -- Apply saved colorscheme after all plugins are loaded
  if saved then
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      once = true,
      callback = function()
        local ok, err = pcall(vim.cmd.colorscheme, saved)
        if not ok then
          vim.notify("colorscheme-persistence: failed to load '" .. saved .. "': " .. err, vim.log.levels.WARN)
        end
      end,
    })
  end
end

return M
