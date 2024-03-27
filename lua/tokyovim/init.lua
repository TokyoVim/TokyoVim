local M = {}

local config = require "tokyovim.config"

M.load_theme = function()
  local theme = config.opts.ui.theme
  if type(theme) == "function" then
    theme()
  elseif theme then
    vim.cmd.colorscheme(theme)
  end
end

M.load_config = function()
  for _, name in pairs { "options", "autocmds", "mappings", "commands" } do
    require("tokyovim.config." .. name)
  end
end

M.load_user_config = function()
  for _, name in pairs { "options", "autocmds", "mappings", "commands", "highlights" } do
    local file_path = vim.api.nvim_get_runtime_file("lua/config/" .. name .. ".lua", false)[1]
    if file_path then
      dofile(file_path)
    end
  end
end

M.laod = function()
  config.init()
  M.load_config()
  M.load_user_config()
  M.load_theme()
end

return M
