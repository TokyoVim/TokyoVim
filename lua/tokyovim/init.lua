local M = {}

local config = require "tokyovim.config"

function M.load_config()
  for _, name in pairs { "options", "autocmds", "mappings", "commands" } do
    require("tokyovim.config." .. name)
  end
end

function M.load_user_config()
  for _, name in pairs { "options", "autocmds", "mappings", "commands", "highlights" } do
    local file_path = vim.api.nvim_get_runtime_file("lua/config/" .. name .. ".lua", false)[1]
    if file_path then
      dofile(file_path)
    end
  end
end

function M.load()
  config.init()
  M.load_config()
  M.load_user_config()
end

return M
