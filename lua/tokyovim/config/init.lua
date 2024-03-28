local M = {}

M.opts = {
  dirs = {
    -- Path to user config.
    user = vim.fn.stdpath "config" .. "/lua",
    -- Path to Tokyovim data.
    data = vim.fn.stdpath "data" .. "/tokyovim",
  },
  -- default commands or paths for programs
  bin = {
    git = "git",
    curl = "curl",
  },
}

function M.set(opts)
  M.opts = vim.tbl_deep_extend("force", M.opts, opts or {})
end

function M.init()
  local file_path = vim.api.nvim_get_runtime_file("lua/config/tokyovim.lua", false)[1]
  if file_path then
    M.set(dofile(file_path))
  end
end

return M
